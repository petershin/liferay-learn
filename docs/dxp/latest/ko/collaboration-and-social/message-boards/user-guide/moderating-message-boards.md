# 게시판 조정

_Message Boards_ 에는 효과적인 포럼 중재를 가능하게 하는 기능이 포함되어 있습니다. 여기에는 스레드 잠금, 스레드 이동 및 병합, 사용자 금지 및 스레드 플래그 지정이 포함됩니다. 적절하게 지정된 권한이 있는 사용자는 이러한 도구를 사용할 수 있습니다. _Message Boards_ 권한을 역할에 할당하는 방법에 대한 자세한 내용은 [Message Boards Permissions Reference](./message-boards-permissions-reference.md) 을 참조하십시오. 일반적인 역할 및 권한에 대해 자세히 알아보려면 [역할 및 권한](https://help.liferay.com/hc/articles/360017895212-Roles-and-Permissions)을 참조하십시오.

## 잠금 스레드

사이트 관리자는 스레드의 작업 메뉴에서 _잠금_ 을 선택하여 스레드에서 활동을 중지할 수 있습니다. 스레드가 잠기면 추가 응답이 허용되지 않습니다.

스레드를 잠그려면:

1. 잠글 스레드 옆의 (![Actions](../../../images/icon-actions.png))을 클릭합니다.
1. _잠금_을 클릭합니다.

    ![스레드 잠금](./moderating-message-boards/images/02.png)

스레드를 잠금 해제하려면:

1. 잠금을 해제할 대화목록 옆의 (![Actions](../../../images/icon-actions.png))을 클릭합니다.
1. _잠금 해제_을 클릭합니다.

이제 스레드가 잠금 해제되었습니다.

## 스레드 이동

중재자는 스레드를 한 범주에서 다른 범주로 이동할 수 있습니다. 스레드를 이동하려면 다음 단계를 따르십시오.

1. 스레드의 작업 메뉴(![Actions](../../../images/icon-actions.png))에서 _이동_ 을 선택합니다.
1. __ 선택 버튼을 클릭하고 새 카테고리를 선택합니다.
1. 이동을 설명하는 게시물을 추가하려면 _설명 게시물 추가_을 선택합니다.

    ![스레드 이동](./moderating-message-boards/images/03.png)

1. 스레드를 이동하려면 _이동_ 을 클릭합니다.

스레드가 이제 새 범주에 있습니다.

## 사용자 금지

1. 차단할 사용자가 포함된 스레드를 클릭합니다.
1. 게시물의 작업 메뉴(![Actions](../../../images/icon-actions.png))를 클릭하고 _이 사용자 차단_을 선택합니다.

![사용자 금지](./moderating-message-boards/images/04.png)

사용자는 이제 차단되었습니다.

차단된 사용자를 복원하려면:

1. _사이트 관리_로 이동합니다.
1. 클릭 _콘텐츠 & 데이터_ &rarr; _게시판_. (페이지 범위가 있는 경우 _범위 선택기_에서 범위를 선택합니다.)
1. _차단된 사용자_ 탭을 클릭합니다.
1. 사용자 옆에 있는 작업 메뉴(작업)를 클릭하고 _Unban This User_을 클릭합니다.

    ![사용자 차단 해제](./moderating-message-boards/images/05.png)

이 사용자는 복원되었습니다.

## 플래그가 지정된 스레드 검토

스레드가 악용 가능성이 있다고 보고되면 _Message Boards_ 앱은 _알림_ 위젯을 사용하여 중재자에게 스레드를 검토하도록 알립니다. 아이콘 주위에 빨간색 숫자가 프로필 아이콘 주위에 나타납니다.

![알림 아이콘](./moderating-message-boards/images/01.png)

플래그가 지정된 스레드를 검토하려면:

1. _사용자 아바타_을 클릭합니다.

1. _알림_을 클릭합니다.

    ![알림 위젯은 게시판을 표시합니다.](./moderating-message-boards/images/06.png)

1. 신고된 답글을 클릭합니다.

중재자는 플래그가 지정된 답글을 삭제할 수 있습니다. 플래그가 지정된 답글을 삭제하려면:

1. 클릭 _행동_ (![Actions](../../../images/icon-actions.png))

    ![플래그가 지정된 답글 삭제](./moderating-message-boards/images/07.png)

1. 클릭 _삭제_
1. _확인_ 을 클릭하여 삭제를 확인합니다.

지금은 답글이 삭제되었습니다.

## 추가 정보

* [알림 및 요청 관리](../../notifications-and-requests/user-guide/managing-notifications-and-requests.md)
