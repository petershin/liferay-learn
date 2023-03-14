# XML 워크플로 정의 만들기

Liferay DXP의 모든 작업 흐름 정의는 XML 형식으로 작성됩니다. 고유한 워크플로우 정의를 만들려면 정의가 실제 승인 프로세스를 반영해야 한다는 점을 기억하십시오.

```{tip}
DXP를 사용하는 구독자는 [그래픽 디자이너](../user-guide/workflow-designer/workflow-designer-overview.md)를 사용하여 워크플로를 만들 수 있습니다. 이미 XML로 작업 흐름을 만들기 시작한 경우 이를 업로드하고 GUI에서 계속할 수 있습니다. 
```

1. 전역 메뉴(![Global Menu](../../../images/icon-applications-menu.png))를 엽니다. 워크플로에서 **Process Builder** 을 선택합니다.

1. 새 워크플로 정의를 추가하려면 ![add](../../../images/icon-add.png) 아이콘을 클릭합니다.

1. 워크플로 정의를 편집기에 입력하거나 로컬에서 만든 워크플로 정의를 가져올 수 있습니다.

워크플로를 게시하면 워크플로를 활성화할 수 있는 모든 곳에 적용할 수 있습니다.

## 기존 워크플로 정의

기본적으로 하나의 워크플로우 정의(단일 승인자)만 설치됩니다. Liferay 소스 코드에는 몇 가지가 더 포함되어 있습니다. 이러한 정의는 여기에 설명된 모든 기능의 좋은 예를 제공합니다.

* [카테고리별](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-workflow-definition.xml)
* [법률 마케팅](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/legal-marketing-workflow-definition.xml)
* [단일 승인자](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml)
* [단일 승인자 스크립트 할당](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-scripted-assignment-workflow-definition.xml) 
아래에서 가장 간단한 워크플로인 단일 승인자를 사용하여 기본 사항을 배웁니다. 단일 승인자 워크플로우에는 **생성됨** 및 **승인됨** 이라는 두 가지 필수 상태인아래에서 가장 간단한 워크플로인 단일 승인자를 사용하여 기본 사항을 배웁니다. 단일 승인자 워크플로우에는 **생성됨** 및 **승인됨** 이라는 두 가지 필수 상태인 시작 및 종료가 포함됩니다. 또한 **리뷰** 및 **업데이트** 의 두 가지 작업이 포함되어 있습니다. 이러한 작업은 **승인** , **거부** 및 **다시 제출** 과 같은 **작업** 을 정의합니다.

워크플로를 구성 요소로 나눌 때 상태, 태스크 및 작업에 대해 생각하십시오. 정의를 마치면 작업할 준비가 된 것입니다. 이제 단일 승인자 워크플로가 작동하는 방식을 확인하여 모든 것을 통합할 준비가 되었습니다.

## 개요

워크플로우 정의의 구조는 XSD 파일( [`liferay-workflow-definition-7_4_0.xsd`](https://www.liferay.com/dtd/liferay-workflow-definition_7_4_0.xsd) )에 정의됩니다.

워크플로 정의 파일의 맨 위에서 스키마를 선언합니다.

```xml
<?xml version="1.0"?>
<workflow-definition
    xmlns="urn:liferay.com:liferay-workflow_7.4.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="urn:liferay.com:liferay-workflow_7.4.0
        http://www.liferay.com/dtd/liferay-workflow-definition_7_4_0.xsd">
```

## 메타데이터

정의에 이름, 설명 및 버전을 지정합니다.

```xml
<name>Single Approver</name>
<description>A single approver can approve a workflow content.</description>
<version>1</version>
```

## 시작 및 종료 노드

각 워크플로 정의는 _상태 노드_로 시작하고 끝납니다. [단일 승인자](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml)에서 이와 같은 _시작_ 노드를 만듭니다.

```xml
<state>
    <name>created</name>
    <initial>true</initial>
    <transitions>
        <transition>
            <name>review</name>
            <target>review</target>
        </transition>
    </transitions>
</state>
```

이 예에서 **시작** 노드에는 다음 속성이 있습니다.

* 초기 상태입니다.
* 노드는 **검토** 라는 [**태스크** 노드](./workflow-task-node-reference.md) 으로 전환됩니다.

**End** 노드는 다음과 같습니다.

```xml
    <state>
        <name>approved</name>
        <actions>
            <action>
                <name>approve</name>
                <script>
                    <![CDATA[
                        import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
                        import com.liferay.portal.kernel.workflow.WorkflowConstants;

                        WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("approved"), workflowContext);
                    ]]>
                </script>
                <script-language>groovy</script-language>
                <execution-type>onEntry</execution-type>
            </action>
        </actions>
    </state>
```

워크플로가 최종 상태로 전환되면 제출이 승인됩니다. 예제를 간단하게 유지하기 위해 알림은 없지만 추가되었을 수 있습니다. 끝 노드에는 워크플로 상태를 `승인됨`으로 설정하는 [스크립트](./using-the-script-engine-in-workflow.md) 이 있습니다.

자세한 내용은 [워크플로우 정의 노드 참조](./workflow-definition-node-reference.md) 을 참조하십시오.

## 태스크 노드

태스크 노드는 워크플로우 프로세스에서 사용자가 수행해야 하는 작업을 정의합니다. 다른 워크플로 노드와 달리 작업 노드에는 할당이 있습니다. 사용자 또는 [역할](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)에 작업을 할당할 수 있습니다.

작업 노드에는 작업 타이머, 작업(알림 및 스크립트 포함 가능) 및 전환이 포함될 수 있습니다. 자세한 내용은 [워크플로 작업 노드 참조](./workflow-task-node-reference.md) 을 참조하십시오. 단일 승인자 작업 흐름에는 **검토** 및 **업데이트** 의 두 가지 작업이 포함됩니다.

### 검토 작업 노드 생성

검토 작업에는 거부 또는 승인의 두 가지 결과가 있습니다. 여기에는 제출물이 검토 준비가 되었을 때 검토자에게 알려주는 `<notification>` 요소가 포함됩니다. 사용자에게 할당된 경우 해당 사용자는 자산을 검토해야 합니다. 역할에 할당된 경우 해당 역할을 가진 모든 사람이 자산을 검토할 수 있습니다.

두 가지 가능한 전환이 있습니다: **승인** 및 **거부** . 승인되면 워크플로는 이전에 `승인`이라고 했던 최종 상태로 전환됩니다. 거부되면 업데이트 작업에 대한 워크플로 번역입니다.

```xml
    <task>
        <name>review</name>
        <actions>
            <notification>
                <name>Review Notification</name>
                <template>${userName} sent you a ${entryType} for review in the workflow.</template>
                <template-language>freemarker</template-language>
                <notification-type>email</notification-type>
                <notification-type>user-notification</notification-type>
                <recipients receptionType="to">
                    <assignees />
                </recipients>
                <execution-type>onAssignment</execution-type>
            </notification>
            <notification>
                <name>Review Completion Notification</name>
                <template><![CDATA[Your submission was reviewed<#if taskComments?has_content> and the reviewer applied the following ${taskComments}</#if>.]]></template>
                <template-language>freemarker</template-language>
                <notification-type>email</notification-type>
                <recipients receptionType="to">
                    <user />
                </recipients>
                <execution-type>onExit</execution-type>
            </notification>
        </actions>
        <assignments>
            <roles>
                <role>
                    <role-type>depot</role-type>
                    <name>Asset Library Administrator</name>
                </role>
                <role>
                    <role-type>depot</role-type>
                    <name>Asset Library Content Reviewer</name>
                </role>
                <role>
                    <role-type>depot</role-type>
                    <name>Asset Library Owner</name>
                </role>
                <role>
                    <role-type>organization</role-type>
                    <name>Organization Administrator</name>
                </role>
                <role>
                    <role-type>organization</role-type>
                    <name>Organization Content Reviewer</name>
                </role>
                <role>
                    <role-type>organization</role-type>
                    <name>Organization Owner</name>
                </role>
                <role>
                    <role-type>regular</role-type>
                    <name>Administrator</name>
                </role>
                <role>
                    <role-type>regular</role-type>
                    <name>Portal Content Reviewer</name>
                </role>
                <role>
                    <role-type>site</role-type>
                    <name>Site Administrator</name>
                </role>
                <role>
                    <role-type>site</role-type>
                    <name>Site Content Reviewer</name>
                </role>
                <role>
                    <role-type>site</role-type>
                    <name>Site Owner</name>
                </role>
            </roles>
        </assignments>
        <transitions>
            <transition>
                <name>approve</name>
                <target>approved</target>
            </transition>
            <transition>
                <name>reject</name>
                <target>update</target>
                <default>false</default>
            </transition>
        </transitions>
    </task>
```

**검토** 작업 노드가 추가 및 구성되었습니다. 훌륭한! 이제 업데이트 작업만 남았습니다.

### 업데이트 태스크 노드 생성

제출이 검토 작업에서 **거부** 전환을 입력하면 검토를 위해 다시 제출할 수 있도록 업데이트 작업으로 이동합니다. 자산이 여기에 도착하면 비슷한 이름의 **거부** 작업이 실행되고 워크플로 상태를 `거부됨` 및 `보류 중`에 할당합니다. 원래 작성자에게 알림이 전송됩니다. 자산도 원래 작성자에게 다시 할당됩니다. 여기에서 원래 작성자는 아마도 자산을 편집하여 거부된 문제를 해결한 후 자산을 다시 제출할 수 있습니다.

```xml
    <task>
        <name>update</name>
        <actions>
            <action>
                <name>reject</name>
                <script>
                    <![CDATA[
                        import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
                        import com.liferay.portal.kernel.workflow.WorkflowConstants;

                        WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("denied"), workflowContext);
                        WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("pending"), workflowContext);
                    ]]>
                </script>
                <script-language>groovy</script-language>
                <execution-type>onAssignment</execution-type>
            </action>
            <notification>
                <name>Creator Modification Notification</name>
                <template>Your submission was rejected by ${userName}, please modify and resubmit.</template>
                <template-language>freemarker</template-language>
                <notification-type>email</notification-type>
                <notification-type>user-notification</notification-type>
                <recipients receptionType="to">
                    <user />
                </recipients>
                <execution-type>onAssignment</execution-type>
            </notification>
        </actions>
        <assignments>
            <user />
        </assignments>
        <transitions>
            <transition>
                <name>resubmit</name>
                <target>review</target>
            </transition>
        </transitions>
     </task>
```

## 결론

엄청난! 이제 닫는 태그를 추가합니다.

```xml
</workflow-definition>
```

이제 단일 승인자 워크플로가 완료되었습니다. 이제 워크플로가 생성되는 방식을 확인했으므로 분기, 조인 및 조건과 같은 다른 모든 가능한 옵션에 대해 알아볼 수 있습니다. Liferay의 작업 흐름 시스템은 필요한 모든 프로세스를 구현할 수 있습니다.

## 추가 정보

* [워크플로 정의 노드 참조](./workflow-definition-node-reference.md)
* [워크플로 작업 노드 참조](./workflow-task-node-reference.md)
* [워크플로에서 스크립트 엔진 사용](./using-the-script-engine-in-workflow.md)
* [워크플로 관리](../designing-and-managing-workflows/managing-workflows.md)
* [워크플로 디자이너 개요](../designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md)
* [역할 및 권한 이해](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)
