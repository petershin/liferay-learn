# 분기 및 조인 사용

{bdg-primary}`구독`

여기서는 **Fork** , **Join** 및 **Join XOR** 노드를 사용하는 방법을 배웁니다. 이러한 노드는 [Legal-Marketing Definition](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/legal-marketing-workflow-definition.xml) 샘플과 같이 여러 검토자가 있는 워크플로우 프로세스에 유용합니다.

두 개의 검토가 동시에 발생할 수 있도록 검토 작업을 분할할 수 있습니다. Legal-Marketing 예제 워크플로에서 프로세스는 선형입니다. 워크플로는 게시 전에 Marketing에서 Legal로 이동하지만 **Fork** 및 **Join**(또는 Join XOR)을 사용하여 동시 워크플로 프로세스를 구축할 수 있습니다.

## Fork 및 Join 노드 사용

1. **전역 메뉴로 이동** &rarr; **응용 프로그램** &rarr; **프로세스 빌더** .
1. **워크플로** 탭을 클릭합니다.
1. (![Add icon](../../../../images/icon-add.png))을 클릭하여 새 워크플로를 추가합니다.
1. 워크플로 디자이너 캔버스에서 시작 노드와 끝 노드를 연결하는 전환이 있는 경우 삭제합니다. 마우스로 선택하고 키보드에서 Delete 키를 누릅니다.
1. **Fork** 노드를 캔버스로 끌어다 놓은 다음 **Start** 노드를 **Fork** 노드에 연결합니다. 나중에 노드와 커넥터의 이름을 바꿀 수 있습니다.
1. 두 개의 **작업** 노드를 끌어다 놓습니다. **Fork** 노드를 2개의 **Task** 노드에 연결합니다.

    ![Fork를 추가한 다음 Task 노드를 추가합니다.](./using-forks-and-joins/images/02.png)

1. **Join** 노드를 끌어다 놓습니다. 두 개의 **작업 노드** 을 **조인** 노드에 연결합니다.
1. **Join** 노드를 **End** 노드에 연결합니다.
1. 노드 및 커넥터의 이름을 바꾸고 [Actions 또는 Notifications](./configuring-workflow-actions-and-notifications.md)을 추가합니다.

    ![완료되면 워크플로를 게시합니다.](./using-forks-and-joins/images/01.png)

1. 완료되면 **게시** 을 클릭합니다.

### 조인 XOR 노드 사용

일반 조인 노드를 사용하여 워크플로가 조인 이상으로 진행하려면 두 병렬 실행에서 전환을 호출해야 합니다. 그러나 조인 XOR 노드를 대신 사용하는 경우 병렬 실행 중 하나에서 전환이 호출되는 한 워크플로가 진행됩니다.

## 관련 주제

* [워크플로 활성화](../../using-workflows/activating-workflow.md)
* [워크플로우 노드](./workflow-nodes.md)
* [워크플로 작업 만들기](./creating-workflow-tasks.md)
* [조건 노드 사용](./using-condition-nodes.md)
* [워크플로 작업 및 알림 구성](./configuring-workflow-actions-and-notifications.md)
