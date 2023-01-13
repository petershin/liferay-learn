# 작업 노드 할당

{bdg-primary}`구독`

작업 노드에는 사람들의 상호 작용이 필요합니다. 올바른 사람과 작업을 경고하고 연결하려면 각각 [알림](./configuring-workflow-actions-and-notifications.md#adding-notifications) 및 할당을 사용합니다. 다음에 작업 노드를 할당할 수 있습니다.

- 특정 역할
- [역할 유형](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 의 여러 역할(조직, 사이트, 자산 라이브러리, 계정 또는 일반 역할 유형)
- 자산 생성자
- 리소스 작업
- 특정 사용자

또한 [스크립트](../../developer-guide/using-the-script-engine-in-workflow.md) 를 작성하여 할당을 정의할 수 있습니다( [스크립팅된 할당](#scripted-assignments)참조).

![작업 노드에 할당을 추가할 수 있습니다.](./assigning-task-nodes/images/01.png)

## 자원 작업 할당

_자원 작업_에 워크플로 작업을 할당할 수 있습니다. 리소스 작업은 응용 프로그램 또는 엔터티에서 사용자가 수행하는 작업입니다. 예를 들어 사용자는 게시판 메시지를 업데이트할 권한이 있을 수 있습니다. 사용자가 리소스를 업데이트할 수 있으므로 이를 리소스 업데이트 작업이라고 합니다. 워크플로 정의가 할당에서 업데이트 작업을 지정하는 경우 워크플로에서 처리 중인 자산 유형을 업데이트할 수 있는 권한이 있는 모든 사람이 작업에 할당됩니다. 작업에 대해 여러 할당을 구성할 수 있습니다.<!--To learn more about Resource Actions, refer to the developer tutorial on the \[permission system\](../../../../building-applications/permissions.md) for a more detailed explanation.-->소스(워크플로 XML) 보기에서 할당이 다음과 같이 표시됩니다.

```xml
<assignments>
    <resource-actions>
        <resource-action>UPDATE</resource-action>
    </resource-actions>
</assignments>
```

적절한 워크플로 활성화 자산에 워크플로를 할당할 수 있습니다.

이제 워크플로가 리소스 작업 할당이 있는 작업을 진행할 때 리소스에 대한 업데이트</code> 권한이 `인 사용자(예: 메시지 보드 메시지)는 작업에 대한 알림을 받고 자신에게 할당할 수 있습니다(알림이 작업으로 설정된 경우). 양수인). 특히 사용자는 탭 <em x-id="3">내 역할에 할당됨</em>아래의 <em x-id="3">내 워크플로 작업</em> 애플리케이션에서 작업을 봅니다.</p>

<pre><code class="{note}">My Workflow Tasks 애플리케이션은 사용자의 개인 메뉴에서 액세스할 수 있습니다.

![My Workflow Tasks는 사용자가 워크플로우의 콘텐츠를 관리하기 위해 이동하는 곳입니다.](./assigning-task-nodes/images/02.png)
`</pre>

리소스 작업 이름에는 모두 대문자를 사용하십시오. 둘 이상을 입력하려면 쉼표로 구분된 목록을 사용하십시오. 다음은 몇 가지 일반적인 리소스 작업입니다.

* 업데이트
* 추가하다
* 삭제
* 보다
* 권한
* 구독하다
* 추가_토론

해당 리소스에 대한 권한 화면에서 가능한 리소스 작업 이름을 결정할 수 있습니다. 예를 들어 게시판에서 해당 화면에 표시되는 권한 중 하나는 *토론 추가*입니다. 모두 대문자로 변환하고 공백을 밑줄로 바꾸면 작업 이름이 생깁니다.

## 스크립팅된 과제

스크립트를 사용하여 과제를 관리할 수도 있습니다. 다음은 스크립팅된 단일 승인자 워크플로 정의(`single-approver-definition-scripted-assignment.xml`)의 검토 작업 할당에 대한 스크립트입니다.

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

user = null;
```

이 스크립트는 작업을 *관리자* 역할에 할당한 다음 자산의 *그룹* 이 조직인지 확인합니다. 그렇다면 *조직 콘텐츠 검토자* 역할에 할당합니다. 그렇지 않은 경우 작업을 *사이트 콘텐츠 검토자* 역할에 할당합니다.

`개의 역할 = new ArrayList<Role>(); 위` 줄. 스크립팅된 할당에서 `역할` 변수는 작업이 할당된 역할을 지정하는 위치입니다. 예를 들어, `인 경우 roles.add(adminRole);` 이 호출되면 관리자 역할이 할당에 추가됩니다.

## 추가 정보

* [워크플로 작업 만들기](./creating-workflow-tasks.md)
* [작업 노드 사용](./workflow-nodes.md)
