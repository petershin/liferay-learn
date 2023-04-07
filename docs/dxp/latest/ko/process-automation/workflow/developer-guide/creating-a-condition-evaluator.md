# 조건 평가자 만들기

워크플로 [조건 노드](../designing-and-managing-workflows/workflow-designer/using-condition-nodes.md) 은 Groovy 스크립트를 사용하여 워크플로 항목이 통과하는 적절한 전환을 결정합니다. 워크플로 정의 `<script>` 요소에 직접 Groovy의 논리를 작성하는 대신 `ConditionEvaluator` 인터페이스를 구현하여 Java 논리를 배포할 수 있습니다.

1. Java 구현을 작성하십시오.
2. 워크플로 정의 XML 파일에서 Java 클래스를 호출합니다.

먼저 작동 중인 `ConditionEvaluator`을 배포하고 관찰합니다.

## 조건 평가자 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. Acme R6J9 구현 프로젝트를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/process-automation/workflow/developer-guide/liferay-r6j9.zip -O
   ```

   ```bash
   unzip liferay-r6j9.zip
   ```

1. 모듈 루트에서 빌드 및 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{tip}
   이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
   ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.r6j9.impl_1.0.0
   ```

```{note}
편의를 위해 'ConditionEvaluator'의 'activate' 메서드는 R6J9 조건부 승인자 워크플로 정의를 자동 로드했습니다. 이 코드는 Workflow Process Builder로 이동하여 워크플로 정의를 업로드하는 것과 동일한 작업을 수행했습니다. [새 워크플로 정의 업로드](../designing-and-managing-workflows/managing-workflows.md#uploading-a-new-workflow-definition) 를 참조하십시오.
```

## 조건 평가자 테스트

Acme R6J9 조건 평가기를 사용하려면 블로그 항목과 함께 사용하도록 설정하고 관리 사용자로 새 블로그 항목을 추가하십시오.

1. 전역 메뉴의 응용 프로그램 탭에서 Workflow &rarr; Process Builder로 이동합니다.

2. 구성 탭에서 R6J9 조건부 승인자 정의를 블로그 항목 자산 유형에 지정하십시오.

3. **저장** 을 클릭합니다.

4. 기본 관리 사용자 테스트 테스트를 사용하여 사이트 메뉴 &rarr; 콘텐츠 & 데이터 &rarr; 블로그를 엽니다.

5. 추가 버튼(![Add](../../../images/icon-add.png))을 클릭합니다.

6. Title 및 Content 필드에 내용을 입력한 다음 **Submit for Workflow** 을 클릭합니다.

7. 기본 블로그 보기로 돌아가 항목이 표시되고 상태가 **Approved** 로 표시되는지 확인합니다.

   ```{tip}
   처음에 상태가 '보류 중'으로 표시되면 페이지를 새로고침하세요.
   ```

   ![관리 사용자가 블로그 항목을 제출했기 때문에 워크플로에서 자동 승인되었습니다.](./creating-a-condition-evaluator/images/01.png)

단일 승인자 정의 또는 다른 비관리 사용자로 테스트하는 경우 블로그 항목이 **보류 중** 상태로 추가되는 것을 볼 수 있습니다.

## R6J9 상태 평가기 이해

Acme R6J9 구현 프로젝트에는 워크플로 사용자에게 관리자 역할이 있는 경우 `승인` 전환을 트리거하기 위한 조건 평가자가 포함되어 있습니다. 여기에는 단일 클래스( `R6J9ConditionEvaluator`)가 포함됩니다.

조건 평가자 외에도 프로젝트에는 조건 평가자를 사용하는 R6J9 조건부 승인자라는 워크플로우 정의가 포함되고 자동 로드됩니다.

조건 평가자는 워크플로로 전송되는 자산의 상태를 변경하지 않습니다. 전환을 실행하는 편리한 방법을 제공할 뿐입니다. 워크플로 상태를 변경해야 하는 경우 `WorkflowStatusManagerUtil` 클래스의 `updateStatus` 메서드를 호출합니다. 정의의 `승인됨` 상태 노드는 상태를 승인됨으로 설정합니다.

```{literalinclude} ./creating-a-condition-evaluator/resources/liferay-r6j9.zip/r6j9-impl/src/main/resources/com/acme/r6j9/internal/kaleo/runtime/condition/dependencies/r6j9-workflow-definition.xml
   :dedent: 1
   :language: xml
   :lines: 174-175, 186-201
```

### `ConditionEvaluator 구현`

조건 평가자 클래스는 단일 `평가` 메서드를 재정의하여 `com.liferay.portal.workflow.kaleo.runtime.condition.ConditionEvaluator` 인터페이스를 구현합니다. `scripting.language=java` 구성 요소 속성을 설정합니다.

```{literalinclude} ./creating-a-condition-evaluator/resources/liferay-r6j9.zip/r6j9-impl/src/main/java/com/acme/r6j9/internal/kaleo/runtime/condition/R6J9ConditionEvaluator.java
   :dedent: 0
   :language: java
   :lines: 29-32
```

`평가` 메서드는 워크플로 정의에서 호출될 때 워크플로가 전환을 통해 적절한 노드로 진행할 수 있도록 유효한 전환 이름을 반환해야 합니다.

`평가` 메서드는 `KaleoCondition` 및 `ExecutionContext`의 두 매개 변수를 사용합니다. 워크플로 엔진은 워크플로 프로세스에서 조건 평가자 호출을 담당하므로 코드는 이러한 개체의 인스턴스화 및 구성을 담당하지 않습니다. 그러나 그들로부터 유용한 정보를 얻을 수 있습니다. 예를 들어, R6J9 조건 평가자는 `ExecutionContext`에서 `개의 workflowContext` (유형 `Map`)과 `serviceContext` (유형 `ServiceContext`)를 검색합니다.

```{literalinclude} ./creating-a-condition-evaluator/resources/liferay-r6j9.zip/r6j9-impl/src/main/java/com/acme/r6j9/internal/kaleo/runtime/condition/R6J9ConditionEvaluator.java
   :dedent: 2
   :language: java
   :lines: 39-41
```

`workflowContext` 은 워크플로우 사용자의 ID를 검색하는 데 사용되고 `serviceContext` 은 가상 인스턴스의 ID( `companyId`)를 검색하는 데 사용됩니다. 둘 다 사용자가 역할 **관리자** 을 가지고 있는지 확인하는 데 필요합니다. 자산은 사용자에게 관리자 역할이 있는 경우 워크플로우에 의해 자동 승인됩니다(**승인** 이라는 전환과 함께 전송됨). 그렇지 않으면 **검토** 전환을 실행합니다.

```{literalinclude} ./creating-a-condition-evaluator/resources/liferay-r6j9.zip/r6j9-impl/src/main/java/com/acme/r6j9/internal/kaleo/runtime/condition/R6J9ConditionEvaluator.java
   :dedent: 2
   :language: java
   :lines: 46-53
```

### 워크플로 정의에서 `ConditionEvaluator` 호출

Acme R6J9 구현 프로젝트에 의해 자동 로드된 R6J9 조건부 승인자 워크플로 정의는 Liferay DXP/Portal과 함께 제공되는 단일 승인자 정의와 거의 동일합니다. 첫 번째 차이점은 `생성` 상태 노드에 있습니다. 단일 승인자 정의는 항상 검토 전환을 실행하지만 R6J9 조건부 승인자는 `확인-역할` 전환을 실행합니다. 주요 차이점은 **조건 노드** 이라는 동일한 이름의 추가입니다. 그런 다음 조건 노드는 `R6J9ConditionEvaluator` 에 의존하여 조건 로직을 실행합니다.

```{literalinclude} ./creating-a-condition-evaluator/resources/liferay-r6j9.zip/r6j9-impl/src/main/resources/com/acme/r6j9/internal/kaleo/runtime/condition/dependencies/r6j9-workflow-definition.xml
   :dedent: 1
   :language: xml
   :lines: 11-27
```

승인 및 검토 전환은 조건 노드의 유효한 대상으로 추가됩니다. `ConditionEvaluator` 에서 사용된 전환이 호출된 조건 노드에서 유효한 전환으로 포함되었는지 확인하십시오.
