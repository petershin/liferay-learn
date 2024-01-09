# 개인 데이터 관리 및 삭제

Liferay는 개인 사용자 데이터를 관리하고 삭제하기 위한 사용자 데이터 도구를 제공합니다. 이러한 도구는 GDPR 요구 사항을 충족하는 데 도움이 될 수 있지만 규정 준수를 보장하지는 않습니다. 자세한 내용은 [사용자 데이터 관리(GDPR)](https://learn.liferay.com/w/dxp/users-and-permissions/managing-user-data) 참조하세요.

## 개인 데이터 내보내기

도덕적으로, 때로는 법적으로 개인은 자신의 개인 데이터를 요청할 권리가 있으며 Tommy Tanner는 메시지 보드 데이터를 요청했습니다. 그를 위해 내보내려면 단계를 따르십시오.

1. 관리자로 Liferay에 다시 로그인하십시오.

1. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** .

1. Tommy Tanner에 대해 **옵션**(![Options icon](../../images/icon-actions.png))을 클릭합니다. **개인 데이터 내보내기** 클릭합니다.

1. 다음 페이지에서 **Add**(![Add icon](../../images/icon-add.png))을 클릭하여 새 내보내기 프로세스를 시작합니다.

1. 다음 페이지에서 내보내려는 모든 항목을 선택하십시오. 예를 들어 게시판에서 모든 개인 데이터를 선택합니다. 선택한 후 **내보내기** 클릭합니다.

   ![내보내려는 항목을 선택하십시오.](./managing-and-deleting-personal-data/images/01.png)

1. 다음 페이지에는 개인 데이터의 각 범주에 대한 내보내기 프로세스가 나와 있습니다. 다운로드하려면 **옵션**(![Options icon](../../images/icon-actions.png))을 클릭하고 **다운로드** 선택하세요. 개인 사용자 데이터가 컴퓨터에 다운로드됩니다. 이제 Tommy에게 보낼 수 있습니다.

1. 로컬 컴퓨터에서 다운로드한 파일의 압축을 풉니다. 폴더에는 기계와 사람이 모두 읽을 수 있는 XML 파일이 포함되어 있습니다.

## 개인 데이터 익명화

개인 식별 정보 없이 기존 콘텐츠를 유지하려면 개인 데이터를 익명화하도록 선택하세요.

1. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** .

1. Tommy Tanner에 대해 **옵션**(![Options icon](../../images/icon-actions.png))을 클릭합니다. **개인 데이터 삭제** 클릭합니다. 먼저 사용자를 비활성화해야 한다고 설명하는 팝업 창에서 **OK** 클릭합니다.

1. 다음 페이지에는 사용자와 관련된 모든 개인 데이터가 표시됩니다. 익명화하려는 각 카테고리를 선택하세요. 게시판 카테고리를 선택하세요.

   ![익명화할 각 데이터 카테고리를 선택하세요.](./managing-and-deleting-personal-data/images/02.png)

1. 게시판 옆에 있는 **옵션**(![Options icon](../../images/icon-actions.png)) 을 클릭하고 **익명화** 클릭하세요. 팝업 창에서 **확인** 클릭하세요. 이제 사용자의 개인 데이터는 이름을 익명 사용자로 변경하여 익명화되었습니다.

   ![메시지 보드 스레드에 더 이상 Tommy Tanner가 표시되지 않습니다.](./managing-and-deleting-personal-data/images/03.png)

## 개인 데이터 삭제

마지막으로 개인 데이터를 완전히 삭제하도록 선택할 수 있습니다. 이 옵션은 사용자가 생성한 데이터나 콘텐츠를 삭제합니다.

1. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** .

1. **필터 및 주문** 클릭하고 **Inactive** 선택합니다.

1. Tommy Tanner에 대해 **옵션**(![Options icon](../../images/icon-actions.png))을 클릭합니다. **개인 데이터 삭제** 클릭합니다.

1. 다음 페이지에는 사용자와 관련된 모든 개인 데이터가 표시됩니다. **형** 범주를 선택합니다.

1. 양식 카테고리 옆에 있는 **옵션**(![Options icon](../../images/icon-actions.png))을 클릭하고 **삭제** 클릭하세요. 팝업 창에서 **확인** 클릭하세요.

   양식 데이터와 같은 일부 사용자 데이터는 검토 및 익명화가 필요합니다. 다음 페이지에서 **익명화** 클릭하세요. 팝업 창에서 **확인** 클릭하세요.

1. 다음 팝업 창에는 사용자 삭제 옵션이 제공됩니다. 사용자를 유지하려면 **취소** 클릭하세요.

축하해요! 사용자 데이터에 관한 이 모듈을 완료했습니다.

## 관련 개념

* [사용자 데이터 내보내기](https://learn.liferay.com/ko/w/dxp/users-and-permissions/managing-user-data/exporting-user-data)

* [사용자 데이터 삭제](https://learn.liferay.com/ko/w/dxp/users-and-permissions/managing-user-data/sanitizing-user-data)

* [익명 사용자 구성](https://learn.liferay.com/ko/w/dxp/users-and-permissions/managing-user-data/configuring-the-anonymous-user)
