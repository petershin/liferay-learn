# 자산 검토

자산의 워크플로우가 [활성화](./activating-workflow.md)인 경우 게시 전에 한 명 이상의 사용자가 자산을 검토해야 합니다. 워크플로 검토 프로세스를 특정 사용자 또는 특정 역할(예: 포털 또는 사이트 콘텐츠 검토자)에 할당할 수 있습니다. 후자의 경우 해당 역할에 할당된 사람은 누구나 제출을 승인하거나 거부할 수 있습니다. 예를 들어 기본 _단일 승인자_ 프로세스를 사용하면 워크플로 작업이 포털 또는 사이트 콘텐츠 검토자 또는 관리자 권한이 있는 모든 사람에게 할당됩니다.

```{tip}
DXP 가입자: [Workflow Metrics application](./using-workflow-metrics.md#managing-workflow-tasks-in-bulk) 을 사용하여 워크플로 항목의 대량 관리가 가능합니다.
```

자산이 제출되면 _워크플로_ 애플리케이션은 모든 잠재적 검토자에게 알림을 보냅니다. 알림에 액세스하려면 아바타를 클릭하고 _알림_을 선택하십시오.

![워크플로에서 자산을 검토할 준비가 되었다는 알림을 보냅니다.](./reviewing-assets/images/01.png)

## 자산 검토

자산 검토를 시작하려면 자신에게 작업을 할당해야 합니다. 단일 승인자 워크플로를 사용하는 경우 작업은 기본적으로 역할에 할당됩니다. (역할이 아닌 특정 사용자에게 검토 작업을 할당하는 사용자 정의 워크 [를 구축할 수도 있습니다.](../designing-and-managing-workflows/building-workflows.md)

### 검토 작업 할당

1. 아바타를 클릭하고 _내 워크플로 작업_을 선택합니다.
1. 사용자에게 직접 할당된 모든 워크플로 작업은 내 워크플로 작업 위젯의 _나에게 할당됨_ 탭에 나열됩니다.

    ![사용자에게 할당된 자산은 나에게 할당됨에 나열됩니다.](./reviewing-assets/images/02.png)

1. 작업을 요청하려면 _내 역할에 할당됨_ 탭을 클릭합니다.

    ![역할에 할당된 자산은 연결된 각 사용자의 내 역할에 할당됨 탭에 나열됩니다.](./reviewing-assets/images/03.png)

1. 자산의 _작업_ 버튼(![Actions](../../../images/icon-actions.png))을 클릭하고 _나에게 할당_을 선택합니다.

    ![자신에게 작업을 할당합니다.](./reviewing-assets/images/04.png)

1. _Comment_ 텍스트 필드에 선택적 설명을 입력합니다.
1. _완료_을 클릭합니다.

### 작업 승인 또는 거부

자신에게 작업을 할당하면 제출을 승인하거나 거부할 수 있습니다.

1. 자산을 검토할 자산의 이름을 클릭합니다. 여기에 자산의 미리보기(a _Wiki Page_)와 검토 상태가 있습니다.

    ![자산을 검토하십시오.](./reviewing-assets/images/05.png)

1. _작업_ 버튼(![Actions](../../../images/icon-actions.png))을 클릭하고 _승인_ 또는 _거부_을 선택합니다.

     ![자산을 승인하거나 거부합니다.](./reviewing-assets/images/06.png)

1. 선택적 설명을 입력하고 _완료_을 클릭합니다.

작업이 완료되면 다음 중 하나가 발생합니다.

* 제출이 거부되면 자산이 게시되지 않습니다. 자산이 워크플로우 프로세스를 종료합니다. 사용자의 _알림_에서 원래 작성자는 제출이 거부되었으며 다시 제출하기 전에 수정해야 한다는 알림을 받습니다. _My Workflow Tasks_에서 _Update_ 로 표시됩니다.
* 검토자가 둘 이상인 경우 작업은 체인의 다음 검토자에게 전달됩니다.
* 제출이 승인되고 검토자가 한 명뿐이면 작업이 _나에게 할당됨_ 탭의 _완료됨_ 섹션으로 이동됩니다. 자산이 게시됩니다.

![완료된 작업은 나에게 할당됨 탭에 있습니다.](./reviewing-assets/images/07.png)

승인된 자산(Wiki 페이지)이 이제 위젯에 게시됩니다.

## 추가 정보

* [알림 및 요청 관리](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)
* [워크플로 태스크 노드](../developer-guide/workflow-task-node-reference.md)
* [워크플로 알림](https://help.liferay.com/hc/articles/360028834772-Workflow-Notifications)
