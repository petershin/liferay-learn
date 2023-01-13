# 워크플로 컨텍스트 작업

[Liferay의 워크플로우](../introduction-to-workflow.md) 은 승인 프로세스로 사용됩니다. 프로세스의 각 단계에서 워크플로에는 스크립트 및 사용자 지정 코드에서 `workflowContext`로 참조되는 `Map<String, Serializable>` 개체에서 사용할 수 있는 특정 데이터가 있습니다. 워크플로 컨텍스트 정보는 Liferay 워크플로 엔진의 적절한 기능에 중요합니다. 이를 이해하면 사용자 지정 코드 및 워크플로 스크립트에서 이를 가장 잘 사용하는 방법을 결정하는 데 도움이 될 수 있습니다.

예를 들어 워크플로 컨텍스트를 사용하여 다음을 수행할 수 있습니다.

- [워크플로 스크립트, 사용자 정의 코드 또는 FreeMarker 템플릿에서 사용하기 위해 기존 속성에 액세스합니다.](#accessing-workflow-context-attributes-in-workflow-definitions)
- [워크플로 스크립트, 사용자 지정 코드 또는 FreeMarker 템플릿에서 액세스하기 위해 워크플로 프로세스의 한 단계에서 새 속성을 설정합니다.](#setting-workflow-context-attributes-in-a-workflow-process-definition)
- [`ServiceContext` 속성을 설정하고 워크플로 스크립트 및 알림 템플릿에서 액세스합니다.](#setting-service-context-attributes-for-access-in-workflow-definitions)

```{note}
`ServiceContext`를 사용하여 `workflowContext`를 사용할 수 없는 컨텍스트에서 속성을 설정합니다. 예를 들어 사용자 지정 코드가 `BlogsEntryLocalService#addEntry`를 호출하는 경우 `ServiceContext` 개체를 제공해야 합니다. 'ServiceContext#setAttribute'를 사용하여 워크플로에서 액세스하려는 데이터를 전달할 수 있습니다. 
```
`workflowContext`로 작업할 때 알아야 할 몇 가지 중요한 사항이 있습니다.

- 수정 가능해야 하므로 스레드로부터 안전하지 않습니다. 병렬 실행 컨텍스트에서는 주의가 필요합니다.

  예를 들어 포크 노드가 있는 워크플로우에서 워크플로우의 두 포크에서 `workflowContext` 을 업데이트하는 것은 권장되지 않습니다.

- 첫 번째 유형 매개변수(속성의 `키` )는 문자열입니다. 두 번째 속성에 저장된 값을 조회하는 데 사용됩니다.
- 두 번째 유형 매개변수(각 속성에 대한 `값` )는 데이터베이스에 저장되기 때문에 `직렬화 가능` 입니다. 이렇게 하면 워크플로의 모든 단계에서 액세스할 수 있습니다.

모든 워크플로 노드에서 워크플로 컨텍스트 키와 값을 인쇄하려면 다음과 같은 스크립트 작업을 추가할 수 있습니다.
```xml
<actions>
    <action>
        <name>print-workflow-context</name>
        <script>
            <![CDATA[
            for (Map.Entry<String, Serializable> mapEntry :
                workflowContext.entrySet()) {
                    out.println(mapEntry.getKey(), mapEntry.getValue());
            }
            ]]>
        </script>
        <script-language>groovy</script-language>
        <execution-type>onEntry</execution-type>
    </action>
</actions>
```

노드가 입력되면 출력이 로그에 인쇄됩니다.

```
entryType, Blogs Entry
companyId, 37401
entryClassPK, 40226
entryClassName, com.liferay.blogs.model.BlogsEntry
groupId, 37441
taskComments, 
userPortraitURL, /image/user_portrait?img_id=0&img_id_token=IpLU58ogLTDf%2FDIfo8Ukg0YxiUE%3D&t=1626283728181
serviceContext, com.liferay.portal.kernel.service.ServiceContext@565b5550
userId, 37448
url, http://localhost:8080/group/guest/~/control_panel/manage?p_p_id=com_liferay_blogs_web_portlet_BlogsAdminPortlet&p_p_lifecycle=0&p_p_state=maximized&_com_liferay_blogs_web_portlet_BlogsAdminPortlet_mvcRenderCommandName=%2Fblogs%2Fview_entry&_com_liferay_blogs_web_portlet_BlogsAdminPortlet_entryId=40226&p_p_auth=rRDR0ncV
userURL, http://localhost:8080/web/test
```

## 워크플로 정의에서 워크플로 컨텍스트 속성에 액세스

[`<script>`](using-the-script-engine-in-workflow.md)형식의 `workflowContext` 속성에 액세스하려면 `Map#get` 메서드를 사용하여 검색합니다.

```groovy
import com.liferay.portal.kernel.workflow.WorkflowConstants;

String className = (String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME);
```

위의 예에서는 `String`을 검색하지만 `workflowContext` 속성 중 일부는 `long`로 사용해야 합니다(예: 메서드 매개 변수로 전달된 경우). `GetterUtil` 유틸리티 클래스는 다음과 같이 도움이 됩니다.

```groovy
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

long classPK = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));
```

[`WorkflowConstants`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/workflow/WorkflowConstants.java) 개체 필드를 사용하면 오류가 발생하기 쉬운 문자열 리터럴을 방지할 수 있습니다. `개의 workflowContext` 필드에는 모두 `CONTEXT` 접두사가 붙습니다(예: `CONTEXT_COMPANY_ID`).


## 워크플로 정의에서 워크플로 컨텍스트 속성 설정

속성을 `workflowContext`로 설정하려면 `Map#put` 메서드를 사용합니다. 이 예제는 `assetTitle`을 설정합니다.

```groovy
import com.liferay.asset.kernel.model.AssetRenderer;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.kernel.workflow.WorkflowHandler;
import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;

String className = (String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME);

WorkflowHandler workflowHandler = WorkflowHandlerRegistryUtil.getWorkflowHandler(className);

long classPK = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

AssetRenderer assetRenderer = workflowHandler.getAssetRenderer(classPK);

String assetTitle = assetRenderer.getAssetObject().getTitle();

workflowContext.put("assetTitle", assetTitle);
```

```{tip}
위의 코드는 자산에 `getTitle` 메서드(예: `JournalArticle`)가 있는 경우에만 작동합니다.
```

## 워크플로우 정의에서 액세스를 위한 서비스 컨텍스트 속성 설정

때때로 사용자 지정 Java 코드에서 워크플로 정의에 정보를 전달해야 하지만 통과할 `workflowContext` 이 없습니다. 예를 들어 블로그 항목을 추가하는 코드를 작성하는 경우 [`BlogsEntryLocalService#addEntry`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/blogs/blogs-api/src/main/java/com/liferay/blogs/service/BlogsEntryLocalService.java) 메서드 중 하나를 호출할 수 있습니다. `workflowContext` 은 이러한 메서드의 매개 변수가 아니지만 `ServiceContext` 은 매개 변수입니다. 서비스 컨텍스트에 새 속성을 추가합니다.

```java
serviceContext.setAttribute("customAttributeKey", "customAttributeValue");
```

워크플로우 정의에서 속성을 가져오려면 `workflowContext`에서 `ServiceContext` 을 검색하고 해당 키를 사용하여 속성을 가져옵니다.

```groovy
import com.liferay.portal.kernel.service.ServiceContext;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

ServiceContext serviceContext = (ServiceContext)workflowContext.get(WorkflowConstants.CONTEXT_SERVICE_CONTEXT);

serviceContext.getAttribute("customAttributeKey");
```

## 관련 정보

- [워크플로 알림 템플릿 변수](./workflow-notification-template-variables.md)
- [워크플로에서 스크립트 엔진 사용](./using-the-script-engine-in-workflow.md)

