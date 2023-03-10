# 액션 실행자 만들기

워크플로 노드는 [Groovy 스크립트](./using-the-script-engine-in-workflow.md)를 통해 사용자 지정 논리를 실행하는 `<action>` 요소를 포함할 수 있습니다.

```xml
<action>
    <name>approve</name>
    <script>
        <![CDATA[
            import com.liferay.portal.kernel.workflow.WorkflowConstants;
            import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;

            WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("approved"), workflowContext);
        ]]>
    </script>
    <script-language>groovy</script-language>
    <execution-type>onEntry</execution-type>
</action>
```

Groovy 작업 논리를 워크플로 정의 `<script>` 요소에 직접 작성하는 대신 `ActionExecutor` 인터페이스를 구현하여 Java 논리를 실행할 수 있습니다.

1. Java 구현을 작성하십시오.
2. 워크플로 정의 XML 파일에서 Java 클래스를 호출합니다.

먼저 작동 중인 `ActionExecutor`을 배포하고 관찰합니다.

## 작업 실행자 배포

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. Acme E5C9 구현 프로젝트를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/process-automation/workflow/developer-guide/liferay-e5c9.zip -O
   ```

   ```bash
   unzip liferay-e5c9.zip
   ```

1. 모듈 루트에서 빌드 및 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{tip}
   이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
   ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.e5c9.impl_1.0.0
   ```

```{note}
편의를 위해 'ActionExecutor'의 'activate' 메서드는 E5C9 단일 승인자 워크플로 정의를 자동 로드했습니다. 이 코드는 Workflow Process Builder로 이동하여 워크플로 정의를 업로드하는 것과 동일한 작업을 수행했습니다. [새 워크플로 정의 업로드](../designing-and-managing-workflows/managing-workflows.md#uploading-a-new-workflow-definition) 를 참조하십시오.
```

## 액션 실행자 테스트

Acme E5C9 Action Executor를 사용하려면 블로그 항목과 함께 사용할 작업 흐름 정의를 설정하고 관리 사용자로 새 블로그 항목을 추가하십시오.

1. 글로벌 메뉴의 애플리케이션 탭에서 워크플로 &rarr; 프로세스 빌더로 이동합니다.

1. 구성 탭에서 블로그 항목 자산 유형에 E5C9 단일 승인자 정의를 지정하십시오.

1. **저장** 을 클릭합니다.

1. 기본 관리 사용자 테스트 테스트를 사용하여 사이트 메뉴 &rarr; 콘텐츠 & 데이터 &rarr; 블로그를 엽니다.

1. **추가** 버튼(![Add](../../../images/icon-add.png))을 클릭합니다.

1. Title 및 Content 필드에 내용을 입력한 다음 **Submit for Publication** 을 클릭합니다.

1. 기본 블로그 보기로 돌아가 항목이 표시되고 상태가 **Pending** 로 표시되는지 확인합니다.

   워크플로우 프레임워크는 상태를 보류 중으로 설정합니다. 이 시점부터 작업 실행기의 논리를 사용하여 상태 업데이트가 이루어집니다.

1. [워크플로우에서 블로그 항목 승인](../using-workflows/reviewing-assets.md#approving-or-rejecting-a-task) .

   ![이 승인 또는 거부는 E5C9 Action Executor에 의해 수행됩니다.](./creating-an-action-executor/images/01.png)

단일 승인자 워크플로를 블로그 항목에 할당하면 E5C9 단일 승인자와 동일하게 작동하는 것을 볼 수 있습니다.

## E5C9 액션 실행자 이해하기

Acme E5C9 구현 프로젝트는 단일 승인자 정의 워크플로우 스크립트의 상태 설정 논리를 단일 Java 클래스인 `E5C9ActionExecutor`로 추출합니다.

작업 실행자 외에도 프로젝트는 E5C9 단일 승인자라는 워크플로 정의를 포함하고 자동 로드합니다. 이 정의는 기본 단일 승인자와 동일한 논리를 갖지만 워크플로 정의에서 직접 Groovy 스크립팅 대신 작업 실행자 클래스의 논리를 사용합니다.

```{literalinclude} ./creating-an-action-executor/resources/liferay-e5c9.zip/e5c9-impl/src/main/java/com/acme/e5c9/internal/workflow/kaleo/runtime/scripting/internal/action/E5C9ActionExecutor.java
   :dedent: 4
   :language: java
   :lines: 49-50
```

### ActionExecutor 구현

작업 실행자 클래스는 `com.acme.e5c9.internal.workflow.kaleo.runtime.scripting.internal.action.ActionExecutor` 인터페이스를 구현하여 단일 `실행` 메서드를 재정의합니다. 구성 요소 속성에서 작업의 스크립팅 언어를 `java` 로 설정합니다.

```{literalinclude} ./creating-an-action-executor/resources/liferay-e5c9.zip/e5c9-impl/src/main/java/com/acme/e5c9/internal/workflow/kaleo/runtime/scripting/internal/action/E5C9ActionExecutor.java
   :dedent: 0
   :language: java
   :lines: 31-35
```

`실행` 메서드는 아무 것도 반환하지 않습니다. 대신 메서드 내에서 논리가 임의로 실행되고 XML 정의에 따라 워크플로 처리가 계속됩니다. 작업 실행 내에서 워크플로 상태가 업데이트되는 경우가 많습니다.

`execute` 메소드는 두 개의 매개변수, `KaleoAction` 및 `ExecutionContext`를 사용합니다. 워크플로 엔진은 워크플로 프로세스에서 작업 실행기 호출을 담당하므로 코드는 이러한 개체의 인스턴스화 및 구성을 담당하지 않습니다. 그러나 그들로부터 유용한 정보를 얻을 수 있습니다. 예를 들어, E5C9 Action Executor는 `ExecutionContext`에서 `개의 workflowContext` (유형 `Map`의)을 검색합니다.

```{literalinclude} ./creating-an-action-executor/resources/liferay-e5c9.zip/e5c9-impl/src/main/java/com/acme/e5c9/internal/workflow/kaleo/runtime/scripting/internal/action/E5C9ActionExecutor.java
   :dedent: 3
   :language: java
   :lines: 43-44
```

`workflowContext` 은 가장 최근에 실행된 전환을 가져오는 데 사용되므로 조건 논리가 워크플로의 자산에 대해 설정할 상태를 결정할 수 있습니다.

```{literalinclude} ./creating-an-action-executor/resources/liferay-e5c9.zip/e5c9-impl/src/main/java/com/acme/e5c9/internal/workflow/kaleo/runtime/scripting/internal/action/E5C9ActionExecutor.java
   :dedent: 3
   :language: java
   :lines: 46-59
```

### 워크플로 정의에서 ActionExecutor 호출

Acme E5C9 구현 프로젝트에서 자동 로드되는 E5C9 단일 승인자 워크플로우 정의는 Liferay와 함께 제공되는 단일 승인자 정의와 거의 동일합니다. 차이점은 전적으로 상태 및 작업 노드의 스크립트 요소에 있습니다. 모든 논리가 작업 실행자 클래스에 아웃소싱되기 때문에 E5C9 단일 승인자 정의에서 크게 단순화되었습니다. 두 정의 작업(거부 및 승인)에는 동일한 스크립트 태그가 있습니다.

```{literalinclude} ./creating-an-action-executor/resources/liferay-e5c9.zip/e5c9-impl/src/main/resources/com/acme/e5c9/internal/workflow/kaleo/runtime/scripting/internal/action/dependencies/e5c9-workflow-definition.xml
   :dedent: 4
   :language: xml
   :lines: 62-65
```

스크립트 태그는 여전히 필요하지만 이제 워크플로 프레임워크가 논리를 보유하는 작업 실행자를 가리킵니다.

워크플로 정의에서 단일 작업 실행자를 호출하는 것으로 제한되지 않습니다. 예를 들어 `E5C9ActionExecutor` 에는 워크플로 상태를 설정하기 전에 전환을 결정하는 논리가 있습니다. 그러나 논리가 더 복잡한 경우 워크플로의 각 작업은 별도의 `ActionExecutor` 구현으로 뒷받침될 수 있으며 이러한 구현은 다른 워크플로 정의에서 재사용할 수 있습니다.
