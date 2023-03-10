---
uuid: 8be1370c-e992-44c5-bbf5-63c3016c54c7
---

# 워크플로에서 스크립트 엔진 사용

Groovy 스크립트를 [XML 워크플로우 정의](./crafting-xml-workflow-definitions.md) 에 추가하여 로직을 삽입하고 워크플로우에서 Liferay의 Java 서비스에 액세스하십시오. 스크립트는 워크플로 실행 중에 실행됩니다.

* [워크플로 노드에 스크립트 추가](#adding-scripts-to-workflow-nodes)
* [미리 정의된 변수 사용](#predefined-variables)
* [스크립트 예](#script-example)
* [OSGi 서비스 호출](#calling-osgi-services)

## 워크플로 노드에 스크립트 추가

다음 워크플로 노드 유형에서 `<actions>` 에서 워크플로 스크립트를 호출할 수 있습니다.

* `<fork>`
* `<join>`
* `<state>`
* `<task>`

또한 [아래 예시](#script-example) 에서 보여주듯이 스크립트를 `<condition>` 노드에 직접 추가할 수 있습니다. Java로 조건 논리를 작성하는 방법은 [조건 평가기 만들기](./creating-a-condition-evaluator.md)를 참조하세요.

작업은 다음과 같은 스크립트를 호출합니다.

```xml
<actions>
    <action>
        <script>
            <![CDATA[script code goes here]]>
        </script>
        <script-language>groovy</script-language>
    </action>
    ...
</actions>
```

`<script>` 요소에 직접 논리를 작성하는 대신 [`ActionExecutor`](./creating-an-action-executor.md) Java 클래스를 작성하고 워크플로 정의에서 호출할 수 있습니다. 워크플로 정의에서 언어를 `java` 로 설정하고 `ActionExecutor`호출합니다.

```xml
<actions>
   <action>
      <name>reject</name>
      <script>
         <![CDATA[com.acme.e5c9.internal.kaleo.runtime.action.executor.E5C9ActionExecutor]]>
      </script>
      <script-language>java</script-language>
      <execution-type>onAssignment</execution-type>
   </action>
   ...
</actions>
```

일반적인 스크립트 작업 중 하나는 워크플로우 상태를 설정하는 것입니다. 예를 들어 이 스크립트는 워크플로우 상태를 **승인** 로 설정합니다.

```groovy
<script>
<![CDATA[
    import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
    import com.liferay.portal.kernel.workflow.WorkflowConstants;

    WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("approved"), workflowContext);
]]>
</script>
<script-language>groovy</script-language>
```

## 미리 정의된 변수

일부 변수는 모든 노드 유형에 공통적이며 다른 변수는 `작업` 노드에서만 사용할 수 있습니다.

### 모든 노드 유형에 공통되는 변수

이러한 변수는 워크플로 스크립트를 실행할 수 있는 모든 위치에서 사용할 수 있습니다.

| 변하기 쉬운                                                                                                                                                                                                                                                              | 묘사                                                                              | 용법                                                                                                                                                                                                                                                                                  |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `kaleoInstanceToken` ( [`KaleoInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoInstanceToken.java) ) | 워크플로 인스턴스 및 해당 인스턴스 토큰( `KaleoInstanceToken`)은 사용자가 **게시를 위해 제출** 을 클릭할 때마다 생성됩니다. | 주입된 토큰을 사용하여 `kaleoInstanceToken.getKaleoInstanceTokenId()`호출하여 해당 ID를 검색합니다. 이것은 종종 스크립트에서 메소드 매개변수로 전달됩니다.                                                                                                                                                                        |
| `userId`                                                                                                                                                                                                                                                            | 반환된 `userId` 은 상황에 따라 다릅니다.                                                     | 논리는 다음과 같이 작동합니다. `KaleoTaskInstanceToken.getcompletionUserId()` 이 null이면 `KaleoTaskInstanceToken.getUserId()`확인합니다. 그것도 null이면 `KaleoInstanceToken.getUserId()`호출하십시오. 스크립트가 실행될 때 워크플로에 개입하는 마지막 사용자의 ID입니다. `생성` 노드에서 이는 **출판용 제출** 클릭한 사용자인 반면 단일 승인자 정의의 `검토` 노드 종료 시 검토자의 ID입니다. |
| `워크플로우 컨텍스트` (`맵<String, Serializable>`)                                                                                                                                                                                                                      | 워크플로 컨텍스트에는 스크립트에서 사용할 수 있는 정보가 포함되어 있습니다.                                      | 컨텍스트는 일반적으로 매개변수로 전달되지만 `WorkflowContext`의 모든 속성은 스크립트에서도 사용할 수 있습니다. 스크립트의 워크플로우 컨텍스트는 컨텍스트에 따라 다릅니다. `ExecutionContext.getWorkflowContext()` 에 대한 호출이 null로 반환되면 `KaleoInstanceModel.getWorkflowContext()`에서 워크플로 컨텍스트를 가져옵니다.                                                    |

### 태스크 노드에 주입된 변수

이러한 변수는 태스크 노드에 주입됩니다.

| 변수 | 설명 | 사용법 |
| :--- | :--- | :--- |
| `kaleoTaskInstanceToken`( [`KaleoTaskInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/ main/java/com/liferay/portal/workflow/kaleo/model/KaleoTaskInstanceToken.java) ) | 작업의 토큰 자체는 워크플로 스크립트에서 사용할 수 있습니다. | 프로그래밍 방식 할당과 같은 다른 유용한 프로그래밍 방식 워크플로 활동에 사용하기 위해 ID를 가져오는 데 사용합니다. |
| `taskName` (`String`) 작업 자체 이름에 액세스할 수 있습니다(`KaleoTak.getName()`과 동일하게 반환됨). | |
| `workflowTaskAssignees`(`목록<` [`WorkflowTaskAssignee`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/ 작업 흐름/WorkflowTaskAssignee.java) `>`) | 작업 담당자를 나열합니다. | |
| `kaleoTimerInstanceToken`( [`KaleoTimerInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/ main/java/com/liferay/portal/workflow/kaleo/model/KaleoTimerInstanceToken.java) ) | [작업 타이머](./workflow-task-node-reference.md)가 있는 경우 `kaleoTimerInstanceToken.getKaleoTimerInstanceTokenId()`를 호출하여 해당 ID를 가져옵니다. | | |

## 스크립트 예

워크플로의 거의 모든 지점에서 Liferay의 스크립트 엔진을 사용하여 워크플로 API 또는 기타 Liferay API에 액세스할 수 있습니다. 워크플로 스크립트를 사용할 수 있는 몇 가지 실용적인 방법은 다음과 같습니다.

* 특정 역할을 가진 사용자 목록 가져오기
* 콘텐츠를 검토할 수 없는 경우 연락할 사람 목록과 함께 지정된 콘텐츠 승인자에게 이메일 보내기
* 컨텐츠 승인에 할당된 모든 사용자에 대해 경고 포틀릿에 표시할 경고 생성

다음 워크플로 스크립트는 Groovy를 사용하여 작성되었으며 조건 노드와 함께 사용됩니다. 이 스크립트는 Liferay의 [자산 프레임워크](../../../building-applications/data-frameworks/assets.md) 사용하여 자산의 범주를 결정하고 범주를 사용하여 올바른 승인 프로세스를 자동으로 결정합니다. 자산이 `법적` 범주에 있는 경우 제출 시 `법적 검토` 작업으로 전송됩니다. 그렇지 않으면 자산이 `기본 검토` 작업으로 전송됩니다.

```groovy
<script>
    <![CDATA[
        import com.liferay.portal.kernel.util.GetterUtil;
        import com.liferay.portal.kernel.workflow.WorkflowConstants;
        import com.liferay.portal.kernel.workflow.WorkflowHandler;
        import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;
        import com.liferay.asset.kernel.model.AssetCategory;
        import com.liferay.asset.kernel.model.AssetEntry;
        import com.liferay.asset.kernel.model.AssetRenderer;
        import com.liferay.asset.kernel.model.AssetRendererFactory;
        import com.liferay.asset.kernel.service.AssetEntryLocalServiceUtil;

        import java.util.List;

        String className = (String)workflowContext.get(
            WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME);

        WorkflowHandler workflowHandler =
            WorkflowHandlerRegistryUtil.getWorkflowHandler(className);

        AssetRendererFactory assetRendererFactory =
            workflowHandler.getAssetRendererFactory();

        long classPK =
            GetterUtil.getLong((String)workflowContext.get
            (WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

        AssetRenderer assetRenderer =
            workflowHandler.getAssetRenderer(classPK);

        AssetEntry assetEntry = assetRendererFactory.getAssetEntry(
            assetRendererFactory.getClassName(), assetRenderer.getClassPK());

        List<AssetCategory> assetCategories = assetEntry.getCategories();

        returnValue = "Default Review";

        for (AssetCategory assetCategory : assetCategories) {
            String categoryName = assetCategory.getName();

            if (categoryName.equals("legal")) {
                returnValue = "Legal Review";

                return;
            }
        }
       ]]>
</script>
<script-language>groovy</script-language>
```

```{note}
조건 노드 스크립트의 `returnValue` 변수는 다음 작업 또는 상태를 결정하는 유효한 전환 이름이어야 합니다.

Liferay Portal의 경우 유효한 전환 이름은 XML 파일 또는 Process Builder의 소스 보기에 입력된 전환의 `<name>` 요소 값입니다. Liferay DXP의 경우 Process Builder에서 정의 소스를 볼 때 전환의 `<id>` 요소에 지정된 전환 ID 값을 대신 사용해야 합니다.
```

다운로드 가능한 워크플로 스크립트 예제에 대한 링크는 [Crafting Workflow Definitions](./crafting-xml-workflow-definitions.md) 을 참조하십시오.

## OSGi 서비스 호출

[서비스 추적기](../../../building-applications/core-frameworks/dependency-injection.md) 사용 가능한 OSGi 서비스를 검색합니다. Service Tracker가 해당 서비스에 대해 null을 반환하면 해당 서비스를 사용할 수 없으며 응답으로 적절한 조치를 취할 수 있습니다.

다음은 `JournalArticleLocalService` 사용하여 기사 수를 가져오는 Groovy로 작성된 워크플로 스크립트입니다.

```groovy
import com.liferay.journal.model.JournalArticle;
import com.liferay.journal.service.JournalArticleLocalService;
import com.liferay.portal.scripting.groovy.internal.GroovyExecutor;

import org.osgi.framework.Bundle;
import org.osgi.framework.FrameworkUtil;
import org.osgi.util.tracker.ServiceTracker;

ServiceTracker<JournalArticleLocalService, JournalArticleLocalService> st;

try {
    Bundle bundle = FrameworkUtil.getBundle(GroovyExecutor.class);

    st = new ServiceTracker(bundle.getBundleContext(), JournalArticleLocalService.class, null);
    st.open();

    JournalArticleLocalService jaService = st.waitForService(500);

    if (jaService == null) {
        _log.warn("The required service 'JournalArticleLocalService' is not available.");
    }
    else {
        java.util.List<JournalArticle>articles = jaService.getArticles();
        if (articles != null) {
            _log.info("Article count: " + articles.size());
        } else {
            _log.info("no articles");
        }
    }
}
catch(Exception e) {
    //Handle error appropriately
}
finally {
    if (st != null) {
        st.close();
    }
}
```

스크립트는 스크립트를 실행하는 클래스의 OSGi 번들을 사용하여 서비스를 추적합니다. `com.liferay.portal.scripting.groovy.internal.GroovyExecutor` 인스턴스가 스크립트를 실행하므로 인스턴스의 번들이 서비스를 추적하는 데 사용됩니다.

```groovy
Bundle bundle = FrameworkUtil.getBundle(GroovyExecutor.class);
```

Liferay의 Kaleo 워크플로 엔진과 Liferay의 스크립트 엔진은 강력한 조합을 만듭니다. 권한을 구성할 때 워크플로 정의 내에서 잘못 작성되거나 악의적으로 작성된 스크립트의 잠재적인 결과에 유의하십시오.

## 추가 정보

* [워크플로 소개](../introduction-to-workflow.md)
* [액션 실행자 만들기](./creating-an-action-executor.md)
* [조건 평가자 만들기](./creating-a-condition-evaluator.md)
* [스크립트 콘솔에서 스크립트 실행](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)
* [스크립트 예](../../../system-administration/using-the-script-engine/script-examples.md)
