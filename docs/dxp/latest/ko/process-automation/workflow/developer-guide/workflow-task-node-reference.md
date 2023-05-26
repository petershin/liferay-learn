# 워크플로 작업 노드 참조

작업은 작업이 수행되는 워크플로의 일부입니다. 작업은 제출된 자산을 검토하고 워크플로의 콘텐츠를 게시할 수 있는지 또는 추가 작업이 필요한지 결정하는 사용자에게 할당되어야 합니다.

다른 워크플로우 노드와 달리 태스크 노드에는 할당이 있습니다. 워크플로우 프로세스가 태스크 노드에 들어갈 때 사용자가 무언가를 해야 하기 때문입니다(보통 제출을 승인하거나 거부함).

일반적으로 작업 노드에는 작업 타이머, 할당, 작업(알림 및 스크립트를 포함할 수 있음) 및 전환이 포함됩니다. 알림 및 작업은 작업 노드로 제한되지 않지만 작업 노드 및 해당 할당은 자체 문서(이 문서)를 받을 자격이 있습니다.

[단일 승인자](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml) 워크플로우 정의에서 검토 작업을 확인하십시오.

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
            <execution-type>onAssignment</execution-type>
        </notification>
        <notification>
            <name>Review Completion Notification</name>
            <template><![CDATA[Your submission was reviewed<#if taskComments?has_content> and the reviewer applied the following ${taskComments}</#if>.]]></template>
            <template-language>freemarker</template-language>
        <notification-type>email</notification-type>
            <recipients>
            <user />
            </recipients>
            <execution-type>onExit</execution-type>
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

검토 작업에는 두 개의 `작업` 있으며 둘 다 `<notification>`s입니다. 각 알림에는 이름, 템플릿, 알림 유형, 실행 유형 및 수신자가 포함될 수 있습니다. 알림 외에도 `<action>` 태그를 사용할 수도 있습니다. 이들은 이름과 [스크립트](./using-the-script-engine-in-workflow.md) 가지며 작업보다 상태 노드에서 더 자주 사용됩니다.

## 지정

워크플로 작업은 사용자가 완료합니다. 할당은 올바른 사용자가 작업에 액세스할 수 있도록 합니다. 할당을 구성하는 방법을 선택할 수 있습니다. 에 과제를 추가할 수 있습니다.

* 모든 유형의 특정 역할(조직, 사이트, 자산 라이브러리, 계정 또는 일반)

   ```xml
   <assignments>
       <roles>
           <role>
               <role-type>organization</role-type>
               <name>Organization Administrator</name>
           </role>
       </roles>
   </assignments>
   ```

   위의 할당은 조직 관리자가 작업을 완료해야 함을 지정합니다.

* 자산 작성자

   ```xml
   <assignments>
      <user />
   </assignments>
   ```

* 리소스 작업

   ```xml
   <assignments>
       <resource-actions>
           <resource-action>UPDATE</resource-action>
       </resource-actions>
   </assignments>
   ```

* 특정 사용자

   ```xml
   <assignments>
       <user>
           <user-id>20156</user-id>
       </user>
   </assignments>
   ```

   위의 할당은 ID `20156` 인 사용자만 작업을 완료할 수 있도록 지정합니다. 또는 사용자의 `<screen-name>` 또는 `<email-address>`지정하십시오.

할당을 정의하는 스크립트를 작성할 수 있습니다. 예를 보려면 [single-approver-scripted-assignment-workflow-definition.xml](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-scripted-assignment-workflow-definition.xml) 참조하십시오.

`사용자` 변수에 단일 사용자를 설정하거나 `사용자` 변수의 목록에 사용자를 추가합니다. 역할 할당을 지정하려면 역할 목록(하나뿐인 경우에도)을 `roles` 변수에 추가합니다.

```xml
<assignments>
    <scripted-assignment>
        <script>
            <![CDATA[
                    import com.liferay.portal.kernel.model.Group;
                    import com.liferay.portal.kernel.model.Role;
                    import com.liferay.portal.kernel.service.GroupLocalServiceUtil;
                    import com.liferay.portal.kernel.service.RoleLocalServiceUtil;
                    import com.liferay.portal.kernel.util.GetterUtil;
                    import com.liferay.portal.kernel.workflow.WorkflowConstants;

                    long companyId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_COMPANY_ID));

                    long groupId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_GROUP_ID));

                    Group group = GroupLocalServiceUtil.getGroup(groupId);

                    roles = new ArrayList<Role>();

                    Role adminRole = RoleLocalServiceUtil.getRole(companyId, "Administrator");

                    roles.add(adminRole);

                    if (group.isOrganization()) {
                        Role role = RoleLocalServiceUtil.getRole(companyId, "Organization Content Reviewer");

                        roles.add(role);
                    }
                    else {
                        Role role = RoleLocalServiceUtil.getRole(companyId, "Site Content Reviewer");

                        roles.add(role);
                    }

                ]]>
            </script>
        <script-language>groovy</script-language>
    </scripted-assignment>
</assignments>
```

위 할당은 관리자 역할에 작업을 할당한 다음 자산의 그룹이 조직인지 확인합니다. 그렇다면 조직 콘텐츠 검토자 역할이 할당됩니다. 그렇지 않은 경우 사이트 콘텐츠 검토자 역할에 작업이 할당됩니다.

`개의 역할 = new ArrayList<Role>(); 위` 줄. 스크립팅된 할당에서 `역할` 변수는 작업이 할당된 역할을 지정하는 사이트입니다. 예를 들어, `인 경우 roles.add(adminRole);` 이 호출되면 관리자 역할이 할당에 추가됩니다.

## 자원 작업 지정

사용자는 업데이트 작업과 같은 리소스 작업에 작업을 할당할 수 있습니다. 워크플로 정의가 할당에서 업데이트 작업을 지정하는 경우 워크플로에서 처리 중인 콘텐츠를 업데이트할 수 있는 권한이 있는 사람은 누구나 작업에 할당됩니다. 작업에 대해 여러 할당을 구성할 수 있습니다.

**리소스 작업** 애플리케이션 또는 엔터티에서 사용자가 수행하는 작업입니다. 예를 들어 사용자는 게시판 메시지를 업데이트할 권한이 있을 수 있습니다. 사용자가 리소스를 업데이트할 수 있으므로 이를 리소스 업데이트 작업이라고 합니다.

사용 가능한 모든 리소스 작업을 찾으려면 제어판에서 역할 관리 애플리케이션에 대한 액세스 권한이 필요합니다(즉, 역할 리소스에 대한 `보기` 작업에 대한 권한이 필요함).

1. **제어판** &rarr; **사용자** &rarr; **역할** 로 이동합니다.
1. 새 정규 역할을 추가합니다. 자세한 내용은 [역할 관리](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md) 참조하십시오.
1. 역할이 추가되면 역할에 대한 권한 정의 인터페이스로 이동합니다.
1. 작업이 워크플로 할당을 정의해야 하는 리소스를 찾습니다.

과제의 XML은 다음과 같습니다.

```xml
<assignments>
    <resource-actions>
        <resource-action>UPDATE</resource-action>
    </resource-actions>
</assignments>
```

이제 워크플로가 리소스 작업 할당이 있는 작업을 진행할 때 리소스에 대한 업데이트 권한(예: 게시판 메시지)이 있는 사용자는 작업에 대한 알림을 받고 자신에게 작업을 할당할 수 있습니다(알림이 작업 담당자로 설정된 경우). 특히 사용자는 내 역할에 할당된 탭 아래의 내 워크플로 작업 애플리케이션에서 작업을 볼 수 있습니다.

리소스 작업 이름에는 모두 대문자를 사용하십시오. 다음은 몇 가지 일반적인 리소스 작업입니다.

* 업데이트
* 추가하다
* 삭제
* 보다
* 권한
* 구독하다
* 추가_토론

리소스에 대한 권한 화면에서 가능한 리소스 작업 이름을 결정합니다. 예를 들어 게시판에서 해당 화면에 표시되는 권한 중 하나는 토론 추가입니다. 모두 대문자로 변환하고 공백을 밑줄로 바꾸면 작업 이름이 생깁니다.

## 작업 타이머

작업 타이머는 지정된 시간이 지나면 작업을 트리거합니다. 타이머는 작업이 오랫동안 방치되지 않도록 하는 데 유용합니다. 사용 가능한 타이머 작업에는 추가 알림 전송, 자산 재할당 또는 타이머 작업 생성이 포함됩니다.

```xml
<task-timers>
    <task-timer>
        <name></name>
        <delay>
            <duration>1</duration>
            <scale>hour</scale>
        </delay>
        <blocking>false</blocking>
        <recurrence>
            <duration>10</duration>
            <scale>minute</scale>
        </recurrence>
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
```

위의 작업 타이머는 알림을 생성합니다. `<delay>` 태그에 기간을 지정하고 `<timer-actions>` 블록에 시간이 만료될 때 취할 조치를 지정합니다. `<blocking>` 요소는 타이머 작업이 반복될 수 있는지 여부를 지정합니다. 차단이 `false`로 설정되면 타이머 작업이 반복될 수 있습니다. `recurrence` 요소에서 위에서 설명한 것처럼 `duration` 및 `scale`를 사용하여 반복 간격을 지정합니다. 위의 반복 요소는 타이머 작업이 처음 발생한 후 10분마다 다시 실행되도록 지정합니다. 차단을 true로 설정하면 타이머 작업이 반복되지 않습니다.

```xml
<timer-actions>
    <reassignments>
       <assignments>
         <roles>
          <role>
              <role-type></role-type>
              <name></name>
          </role>
          ...
         </roles>
       </assignments>
    </reassignments>
</timer-actions>
```

위의 스니펫은 재할당 작업을 설정하는 방법을 보여줍니다.

`<action>` 요소와 마찬가지로 `<timer-action>` 요소에도 스크립트가 포함될 수 있습니다. 자세한 내용은 [워크플로우](./using-the-script-engine-in-workflow.md) 의 스크립트 엔진 사용을 참조하십시오.

```{note}
`timer-action`은 `execution-type`을 제외하고 `action`과 동일한 태그를 모두 포함할 수 있습니다. 타이머 작업은 시간이 다 되면 항상 트리거되므로 예를 들어 `onEntry`의 지정 및 실행 유형은 타이머 내에서 의미가 없습니다.
```

## 관련 주제

* [XML 워크플로 정의 만들기](./crafting-xml-workflow-definitions.md)
* [워크플로 정의 노드 참조](./workflow-definition-node-reference.md)
