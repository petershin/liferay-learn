# 작업 노드 할당

{bdg-primary}`구독`

작업 노드에는 사람들의 상호 작용이 필요합니다. 올바른 사람과 작업을 경고하고 연결하려면 각각 [알림](./configuring-workflow-actions-and-notifications.md#adding-notifications) 및 할당을 사용합니다. 다음에 작업 노드를 할당할 수 있습니다.

- 특정 역할
* [역할 유형](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 의 여러 역할(조직, 사이트, 자산 라이브러리, 계정 또는 일반 역할 유형)
- 콘텐츠 제작자
- 리소스 작업
- 특정 사용자

또한 [스크립트](../../developer-guide/using-the-script-engine-in-workflow.md) 작성하여 과제를 정의할 수 있습니다( [스크립팅된 과제](#scripted-assignments) 참조).

![작업 노드에 할당을 추가할 수 있습니다.](./assigning-task-nodes/images/01.png)

## 자원 작업 지정

**자원 작업** 에 워크플로 작업을 할당할 수 있습니다. 리소스 작업은 애플리케이션 또는 엔터티에서 사용자가 수행하는 작업입니다. 예를 들어 사용자는 게시판 메시지를 업데이트할 권한이 있을 수 있습니다. 사용자가 리소스를 업데이트할 수 있으므로 이를 리소스 업데이트 작업이라고 합니다. 워크플로 정의가 할당에서 업데이트 작업을 지정하는 경우 워크플로에서 처리 중인 자산 유형을 업데이트할 수 있는 권한이 있는 모든 사람이 작업에 할당됩니다. 작업에 대해 여러 할당을 구성할 수 있습니다.

다음은 소스(XML) 보기에서 할당이 표시되는 모습입니다.

```xml
<assignments>
    <resource-actions>
        <resource-action>UPDATE</resource-action>
    </resource-actions>
</assignments>
```

적절한 워크플로 활성화 자산에 워크플로를 할당할 수 있습니다.

이제 워크플로가 리소스 작업 할당이 있는 작업으로 진행하면 리소스(예: 메시지 게시판 메시지)에 대한 '업데이트' 권한이 있는 사용자에게 작업에 대한 알림이 전송되고 이를 자신에게 할당할 수 있습니다(알림이 작업으로 설정된 경우). 양수인). 특히 사용자는 **내 역할에 할당됨** 탭 아래의 **내 워크플로 작업** 애플리케이션에서 작업을 볼 수 있습니다.

```{note}
My Workflow Tasks 애플리케이션은 사용자의 개인 메뉴에서 액세스할 수 있습니다.

![내 워크플로 작업은 사용자가 워크플로에서 콘텐츠를 관리하는 곳입니다.](./assigning-task-nodes/images/02.png)
```

리소스 작업 이름에는 모두 대문자를 사용하십시오. 둘 이상을 입력하려면 쉼표로 구분된 목록을 사용하십시오. 다음은 몇 가지 일반적인 리소스 작업입니다.

* 업데이트
* 추가하다
* 삭제
* 보다
* 권한
* 구독하다
* 추가_토론

해당 리소스에 대한 권한 화면에서 가능한 리소스 작업 이름을 결정할 수 있습니다. 예를 들어 게시판에서 해당 화면에 표시되는 권한 중 하나는 **토론 추가** 입니다. 모두 대문자로 변환하고 공백을 밑줄로 바꾸면 작업 이름이 생깁니다.

## 스크립팅된 과제

스크립트를 사용하여 할당을 관리할 수 있습니다. `사용자` 변수에 단일 사용자를 설정하거나 `사용자` 변수의 목록에 사용자를 추가합니다. 역할 할당을 지정하려면 역할 목록(하나뿐인 경우에도)을 `roles` 변수에 추가합니다.

XML 소스에서 스크립팅된 할당은 `<scripted-assignment>` XML 요소에 기록됩니다.

```xml
<assignments>
   <scripted-assignment>
      <script>
         <![CDATA[
            ...
         ]]>
      </script>
      <script-language>groovy</script-language>
   </scripted-assignment>
</assignments>
```

### 역할에 할당

스크립팅된 단일 승인자 워크플로 정의(`single-approver-scripted-assignment-workflow-definition.xml`)의 검토 작업 할당을 위한 스크립트는 `역할`을 설정합니다.

```groovy
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
```

이 스크립트는 작업을 관리자 역할에 할당한 다음 자산의 그룹이 조직인지 확인합니다. 그렇다면 조직 콘텐츠 검토자 역할이 추가됩니다. 그렇지 않은 경우 사이트 콘텐츠 검토자 역할이 추가됩니다.

`roles = new ArrayList<Role>();` 행에 유의하십시오. 스크립팅된 할당에서 '역할' 변수는 작업에 역할을 할당하는 사이트입니다. 예를 들어 `roles.add(adminRole);`이 호출되면 관리자 역할이 할당에 추가됩니다.

'roles' 변수 할당은 작업에 할당 가능한 후보를 정의합니다. 항목이 워크플로에 제출되면 후보 사용자 중 한 명이 자신에게 작업을 할당해야 합니다. 자세한 내용은 [자산 검토](../../using-workflows/reviewing-assets.md)를 참조하세요.

### 사용자에게 할당

작업에 사용자 또는 사용자 목록을 할당합니다. 이러한 할당은 나에게 할당됨 아래의 내 워크플로 작업 애플리케이션에 나타납니다. 사용자 목록을 가능한 후보로 지정하려면 다음과 같은 코드를 사용하십시오.

```groovy
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

users = new ArrayList();

long companyId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_COMPANY_ID));

users.add(UserLocalServiceUtil.getUserByEmailAddress(companyId, "user1@liferay.com"));
users.add(UserLocalServiceUtil.getUserByEmailAddress(companyId, "user2@liferay.com"));
```

`사용자` 변수 할당은 `역할`과 같이 작업에 할당 가능한 후보를 정의합니다. 항목이 워크플로에 제출되면 후보 사용자 중 한 명이 자신에게 작업을 할당해야 합니다. 자세한 내용은 [자산 검토](../../using-workflows/reviewing-assets.md) 참조하십시오.

작업에 단일 사용자를 할당하려면

```groovy
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

long companyId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_COMPANY_ID));

user = UserLocalServiceUtil.getUserByEmailAddress(companyId, "user1@liferay.com");
```

이 경우 후보가 하나뿐이므로 `사용자` 변수 할당이 즉시 이루어집니다.

## 관련 주제

* [워크플로 작업 만들기](./creating-workflow-tasks.md)
* [작업 노드 사용](./workflow-nodes.md)
