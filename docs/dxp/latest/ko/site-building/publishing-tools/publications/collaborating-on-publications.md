# 출판물 공동 작업

{bdg-secondary}`liferay 7.4+`

기본적으로 발행물은 작성자만 액세스할 수 있습니다. 그러나 출판물 작성자는 자신의 출판물을 보고, 편집하고, 출판하도록 다른 사용자를 초대할 수 있습니다. 진행 중인, 예약된, 게시된 모든 발행물에 사용자를 추가할 수 있습니다.

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/n790hDkDenI

사용자가 출판물에 초대되면 통합 댓글 기능을 사용하여 기여자 간의 협업을 촉진할 수 있습니다.

## 출판물에 사용자 초대

출판물에 대한 공동 작업을 위해 사용자를 초대하려면 다음 단계를 따르십시오.

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **응용 프로그램** 탭을 클릭한 다음 **출판** 으로 이동합니다.

1. 원하는 게시에 대해 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **사용자 초대** 를 선택합니다.

   ![Click the publication's Actions button and select Invite Users.](./collaborating-on-publications/images/01.png)

   또는 출판물의 변경 사항 검토를 시작하고 **사용자 초대**(![사용자 초대](../../../images/icon-plus.png))를 클릭합니다.

   ![In publication Changes page, click the Invite Users button.](./collaborating-on-publications/images/02.png)

   ```{note}
   이는 게시된 출판물에 사용자를 초대하는 유일한 방법입니다.
   ```

1. 드롭다운 메뉴를 사용하여 **보기** , **편집** , **게시** 및 **초대** 권한을 부여하세요.

   ![Use the drop-down menu to determine the users permissions for the publication.](./collaborating-on-publications/images/03.png)

1. 원하는 **사용자** 를 검색하고 선택합니다.

   각 사용자에게는 선택한 권한이 할당되지만 초대장을 보내기 전후에 권한을 편집할 수 있습니다.

   ![Search for and select the desired users.](./collaborating-on-publications/images/04.png)

1. 발행물에 사용자를 추가하려면 **보내기** 를 클릭하세요.

초대된 사용자는 알림을 받고 게시에 대한 공동 작업을 시작할 수 있습니다.

## 출판물에 대한 논평

공동 작업 사용자는 변경 사항 페이지를 통해 발행물에 의견을 추가할 수 있습니다. 각 댓글의 범위는 해당 댓글이 작성된 게시물로 제한됩니다.

1. **전역 메뉴**( ![전역 메뉴](../../../images/icon-applications-menu.png) )를 열고 **응용 프로그램** 탭을 클릭한 다음 **출판** 으로 이동합니다.

1. 원하는 **출판물** 을 클릭하세요.

1. **댓글** 버튼( ![댓글 버튼](../../../images/icon-comments-w.png) )을 클릭합니다.

1. 채팅 창에 댓글을 입력하고 **답글** 을 클릭하세요.

   ![Click the Comments button, enter your comment, and click Reply.](./collaborating-on-publications/images/05.png)

모든 공동 작업 사용자는 귀하의 댓글에 대한 알림을 받고 답변도 할 수 있습니다.

## 출판물에서 사용자 제거

간행물에서 공동작업자를 제거하려면 다음 단계를 따르세요.

1. 원하는 게시에 대한 **사용자 초대** 모달 창을 엽니다.

1. 원하는 사용자의 드롭다운 메뉴를 클릭하고 **제거** 를 선택합니다.

   ![Open the permissions drop-down menu and select Remove.](./collaborating-on-publications/images/06.png)

1. **저장** 을 클릭하세요.

## 링크를 통해 출판물 공유

{bdg-link-primary}` [베타 기능](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) `

{bdg-secondary}`liferay 7.4 2023.Q3+/GA98+`

사이트 사용자가 아닌 사람들과 출판물 변경 사항을 공유해야 하는 경우 출판물에 대한 링크 공유를 활성화할 수 있습니다.

1. 원하는 게시에 대해 **작업**(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **사용자 초대** 를 선택한 다음 **링크 공유** 탭으로 이동합니다.

   ![Select Invite Users and go to the Share Link tab.](./collaborating-on-publications/images/07.png)

   또는 출판물의 변경 사항 검토를 시작하고 **공유**(![공유 버튼](../../../images/icon-link.png))를 클릭하세요.

   ![Click the Share button.](./collaborating-on-publications/images/08.png)

1. 공유를 활성화하려면 스사이트
를 전환하세요.

1. 링크를 복사하세요.

   ![Enable sharing and copy the link.](./collaborating-on-publications/images/09.png)

링크가 있는 사람은 누구나 간행물의 변경 사항을 볼 수 있습니다.

## 관련 주제

* [출판물 생성 및 관리](./creating-and-managing-publications.md)
* [변경 사항 작성 및 게시](./making-and-publishing-changes.md)
* [충돌 해결](./resolving-conflicts.md)
