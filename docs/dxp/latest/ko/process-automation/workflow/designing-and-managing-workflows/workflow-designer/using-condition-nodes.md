# 조건 노드 사용

{bdg-primary}`구독`

_조건_ 노드는 워크플로에서 조건부로 작동(전환, 할당 등)하는 데 유용합니다. 검토자가 여러 명일 수 있으며 어떤 검토자에게 작업을 할당해야 하는지 결정해야 합니다. 예를 들어 서로 다른 문서는 법무 부서 또는 마케팅 팀의 검토가 필요할 수 있습니다.

조건은 지정된 조건이 충족되는지 확인한 다음 해당 조건에 따라 올바른 검토자를 할당하거나 특정 작업으로 전환하는 등 자산에 대해 조치를 취함으로써 게이트키퍼 역할을 합니다.

[범주별 정의](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-workflow-definition.xml) 에는 조건 노드가 포함되어 있습니다. 조건 논리는 자산 범주를 확인하여 _Legal Review_ 작업 또는 _Content Review_ 작업으로 전환할지 여부를 선택합니다. 워크플로에 조건 노드를 추가하려면

1. _글로벌 메뉴로 이동_ &rarr;  _애플리케이션_ &rarr; _워크플로우_ &rarr; _프로세스 빌더_.
1. (![Add icon](../../../../images/icon-add.png))을 클릭하여 새 워크플로를 추가합니다.
1. 워크플로 디자이너 캔버스에서 워크플로의 이름을 입력합니다.
1. _소스_ 보기를 엽니다.
1. [카테고리별 정의](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-workflow-definition.xml) 을 찾습니다. 원시 내용을 원본 보기에 복사하여 기존 내용을 모두 덮어쓰거나 _파일 가져오기_ 을 클릭하고 정의의 XML 파일을 업로드합니다.
1. _다이어그램_ 보기를 엽니다.
1. 조건 노드 _결정 분기_을 클릭하여 노드의 속성을 구성합니다.
1. _스크립트(Groovy)_ 필드를 찾습니다. 내용을 더 명확하게 보려면 필드 크기를 조정하십시오(더 크게).


    ![검토 경로를 결정하는 Groovy Script를 추가합니다.](./using-condition-nodes/images/01.png)

   스크립트는 `legal`문자열을 찾는 자산의 범주를 반복합니다. 찾은 경우 법적 검토 경로를 따라 워크플로가 계속됩니다. 그렇지 않으면 콘텐츠 검토 경로를 따라 계속됩니다.

   전체 내용은 [범주별 정의의 조건 스크립트](#the-category-specific-definition-s-condition-script) 에서 볼 수 있습니다.

1. 조건의 스크립트 작업을 마치면 뒤로 화살표(![Back](../../../../images/icon-angle-left.png)) 또는 _저장_ (이전 버전의 워크플로 디자이너를 사용하는 경우)를 클릭합니다.

![범주별 승인 정의는 조건 노드로 시작합니다.](./using-condition-nodes/images/02.png)

_조건_ 노드가 세 개의 서로 다른 작업 노드에 어떻게 연결되어 있는지 확인하십시오.

* 문서가 `법적` 범주에 있으면 자산이 법무 부서로 전송됩니다.
* 그렇지 않으면 자산이 마케팅 팀으로 전송됩니다.
* _업데이트_ 노드는 원래 작성자가 업데이트하면 처리를 조건으로 다시 보냅니다(자산이 검토 노드 중 하나에서 거부된 경우).

작업 노드를 구성하는 방법은 [워크플로우 작업 생성](./creating-workflow-tasks.md) 및 [작업 노드 할당](./assigning-task-nodes.md) 을 참조하십시오.

## 범주별 정의의 조건 스크립트

```groovy
import com.liferay.asset.kernel.model.AssetCategory;
import com.liferay.asset.kernel.model.AssetEntry;
import com.liferay.asset.kernel.model.AssetRenderer;
import com.liferay.asset.kernel.model.AssetRendererFactory;
import com.liferay.asset.kernel.service.AssetEntryLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.kernel.workflow.WorkflowHandler;
import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;

import java.util.List;

String className = (String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME);

WorkflowHandler workflowHandler = WorkflowHandlerRegistryUtil.getWorkflowHandler(className);

AssetRendererFactory assetRendererFactory = workflowHandler.getAssetRendererFactory();

long classPK = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

AssetRenderer assetRenderer = workflowHandler.getAssetRenderer(classPK);

AssetEntry assetEntry = assetRendererFactory.getAssetEntry(assetRendererFactory.getClassName(), assetRenderer.getClassPK());

List<AssetCategory> assetCategories = assetEntry.getCategories();

     returnValue = "Content Review";

for (AssetCategory assetCategory : assetCategories) {
String categoryName = assetCategory.getName();

if (categoryName.equals("legal")) {
    returnValue = "Legal Review";

    return;
    }
}
```

## 추가 정보

* [워크플로 관리](../managing-workflows.md)
* [워크플로우 노드](./workflow-nodes.md)
* [분기 및 조인 사용](./using-forks-and-joins.md)
* [워크플로 작업 및 알림 구성](./configuring-workflow-actions-and-notifications.md)
