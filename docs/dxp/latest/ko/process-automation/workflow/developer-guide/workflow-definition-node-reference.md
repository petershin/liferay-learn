# 워크플로 정의 노드 참조

_노드_ 요소와 해당 하위 요소는 워크플로 정의를 구성하는 기본 빌딩 블록입니다. 노드는 종종 검토 프로세스의 실제 단계를 반영합니다. 다양한 유형의 노드와 사용 방법을 설명하는 가이드입니다.

* [상태 노드](#state-nodes)
* [조건 노드](#conditions)
* [분기 및 조인](#forks-and-joins)

## 상태 노드

상태 노드에는 사용자 입력이 필요하지 않습니다. 일반적으로 상태 노드는 워크플로 정의를 시작하거나 끝냅니다. 워크플로는 상태 노드의 `작업` 태그(알림 및/또는 사용자 지정 스크립트)에 지정된 모든 작업을 수행한 다음 제공된 전환으로 이동합니다.

초기 상태 노드에는 종종 전환만 포함됩니다.

```xml
<state>
    <name>created</name>
    <initial>true</initial>
    <transitions>
        <transition>
            <name>Determine Branch</name>
            <target>determine-branch</target>
            <default>true</default>
        </transition>
    </transitions>
</state>
```

상태 노드에 알림 또는 스크립트가 필요한 경우 `작업` 태그를 사용할 수 있습니다. 다음은 Groovy 스크립트를 포함하는 `action` 요소입니다. 이는 많은 터미널 상태 노드에서 발견되며 자산을 워크플로에서 승인된 것으로 표시합니다.

```xml
<actions>
    <action>
        <name>Approve</name>
        <description>Approve</description>
        <script>
            <![CDATA[
            com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(com.liferay.portal.kernel.workflow.WorkflowConstants.getLabelStatus("approved"), workflowContext);]]>
        </script>
        <script-language>groovy</script-language>
        <execution-type>onEntry</execution-type>
    </action>
</actions>
```

## 조건

_조건 노드_ 은 조건이 충족되는지 여부를 결정하고 충족되면 워크플로를 적절한 노드로 전환합니다. 예를 들어, 제출된 문서가 계약서인 경우 법무팀으로 보내야 합니다. 그렇지 않으면 마케팅 팀으로 이동합니다.

다음은 [범주별 승인](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-definition.xml) 워크플로우 정의의 `결정 분기` 조건입니다.

```xml
<condition>
    <name>determine-branch</name>
    <script>
        <![CDATA[
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
        ]]>
    </script>
    <script-language>groovy</script-language>
    <transitions>
        <transition>
            <name>Legal Review</name>
            <target>legal-review</target>
            <default>false</default>
        </transition>
        <transition>
            <name>Content Review</name>
            <target>content-review</target>
            <default>false</default>
        </transition>
    </transitions>
</condition>
```

이 예에서는 자산 범주를 확인하여 _Legal Review_ 작업 또는 _Content Review_ 작업으로 전환할지 여부를 선택합니다.

`returnValue` 변수는 조건에서 전환을 가리키며 해당 값은 유효한 전환 이름[^1]와 일치해야 합니다. 이 스크립트는 문제의 자산을 조회하고 자산 범주를 검색하며 초기 `returnValue`을 설정합니다. 그런 다음 자산이 _법적_ 범주로 표시되었는지 확인합니다. 그렇지 않은 경우 _콘텐츠 검토_ (워크플로의 콘텐츠 검토 작업)을 거치고, 있는 경우 _법적 검토_ (워크플로의 법적 검토 작업)을 거칩니다.


## 분기 및 조인

분기는 워크플로우 프로세스를 분할하고 결합은 프로세스를 다시 통합된 분기로 가져옵니다. 처리는 항상 조인(또는 조인 XOR)을 사용하여 다시 가져와야 하며 워크플로 정의의 분기 및 조인 수가 동일해야 합니다.

```xml
<fork>
    <name>fork-1</name>
    <transitions>
        <transition>
            <name>transition-1</name>
            <target>task-1</target>
            <default>true</default>
        </transition>
        <transition>
            <name>transition-2</name>
            <target>task-2</target>
            <default>false</default>
        </transition>
    </transitions>
</fork>
<join>
    <name>join-1</name>
    <transitions>
        <transition>
            <name>transition-4</name>
            <target>EndNode</target>
            <default>true</default>
        </transition>
    </transitions>
</join>
```

워크플로는 자산이 두 포크에서 전환될 때까지 조인을 지나서 진행되지 않습니다. 워크플로 프로세스를 분기하지만 하나의 분기만 완료될 때 처리가 계속되도록 하려면 조인 XOR을 사용합니다.

조인 XOR은 한 가지 중요한 점에서 조인과 다릅니다. 처리를 계속하기 전에 두 포크가 모두 완료되어야 한다는 제약 조건이 제거됩니다. 자산은 처리를 계속하기 전에 분기 중 하나만 완료해야 합니다.

```xml
<join-xor>
    <name>join-xor</name>
    <transitions>
        <transition>
            <name>transition3</name>
            <target>EndNode</target>
            <default>true</default>
        </transition>
    </transitions>
</join-xor>
```

## 태스크 노드

[작업 노드](./workflow-task-node-reference.md) 은 워크플로 정의의 핵심입니다. 누군가가 어떤 식으로든 자산과 상호 작용하는 부분입니다. 작업에는 알림, 할당 및 작업 타이머를 비롯한 하위 요소도 있을 수 있습니다.

다음은 범주별 승인 워크플로의 `콘텐츠 검토` 작업이며 간결성을 위해 `역할` 할당 태그 중 일부가 잘려 있습니다.

```xml
<task>
    <name>content-review</name>
    <actions>
        <notification>
            <name>Review Notification</name>
            <template>You have a new submission waiting for your review in the workflow.</template>
            <template-language>text</template-language>
            <notification-type>email</notification-type>
            <notification-type>user-notification</notification-type>
            <execution-type>onAssignment</execution-type>
        </notification>
    </actions>
    <assignments>
        <roles>
            <role>
                <role-type>organization</role-type>
                <name>Organization Administrator</name>
            </role>
            ...
        </roles>
    </assignments>
    <task-timers>
        <task-timer>
            <name></name>
            <delay>
                <duration>1</duration>
                <scale>hour</scale>
            </delay>
            <blocking>false</blocking>
            <timer-actions>
                <timer-notification>
                    <name></name>
                    <template></template>
                    <template-language>text</template-language>
                    <notification-type>user-notification</notification-type>
                </timer-notification>
            </timer-actions>
        </task-timer>
    </task-timers>
    <transitions>
        <transition>
            <name>approve</name>
            <target>approved</target>
            <default>true</default>
        </transition>
        <transition>
            <name>reject</name>
            <target>update</target>
            <default>false</default>
        </transition>
    </transitions>
</task>
```

## 추가 정보

* [XML 워크플로 정의 만들기](./crafting-xml-workflow-definitions.md)
* [워크플로 작업 노드 참조](./workflow-task-node-reference.md)

[^1]: Liferay Portal의 경우 유효한 전환 이름은 XML 파일 또는 Process Builder의 소스 보기에 입력된 전환의 `<name>` 요소 값입니다. Liferay DXP의 경우 Process Builder에서 정의 소스를 볼 때 전환의 `<id>` 요소에 지정된 전환 ID 값을 대신 사용해야 합니다.
