# 역할 및 권한 설정

Liferay에서 사용자는 할당된 역할에 따라 권한을 받습니다. 자세한 내용은 [역할 및 권한 이해](https://learn.liferay.com/ko/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions) 를 참조하세요.

## 역할에 사용자 할당

IT 관리자에게 관리자 역할을 부여하십시오.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **역할** 로 이동합니다. **일반 역할** 탭에서 **관리자** 를 클릭하세요.

1. 새 페이지에서 **담당자** 탭을 클릭하세요.

   * **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.
   * 새 창에서 **Marcus Morgan** 을 선택하세요.
   * **추가** 를 클릭하세요.

   이제 Marcus는 관리자 역할을 갖게 되었습니다.

참고로, 사용자 편집 페이지에서 사용자 역할을 할당할 수도 있습니다(예: Kyle Klein의 [사용자 생성](./managing-users.md#creating-users) 참조).

## 역할 만들기

Clarity Vision Solutions의 직원은 업무에 따라 다른 권한이 필요합니다. 예를 들어 영업 및 마케팅 부서의 직원은 조직 사이트 블로그에 액세스해야 합니다. 또한 마케팅 캠페인을 위해 문서와 미디어에 액세스해야 합니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **역할** 로 이동합니다. **일반 역할** 탭에서 **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 새 창에서 다음 정보를 입력합니다.

   * 제목 : '영업 및 마케팅 직원'
   * 설명: `영업 및 마케팅 직원`

**저장** 을 클릭하세요.

1. **권한 정의** 탭을 클릭하세요.

   * 왼쪽 탐색 메뉴를 아래로 스크롤하여 **사이트 및 자산 라이브러리 관리** &rarr; **콘텐츠 및 데이터** &rarr; **블로그** 로 이동합니다.

   * 다음 권한을 추가합니다.

     **리소스 권한 - 블로그 항목**

     * `Add Entry`
     * `Subscribe`

     **리소스 권한 - 블로그 항목**

     * `Add Discussion`
     * `Update`
     * `Update Discussion`
     * `View`

   * **저장** 을 클릭하세요.

1. **콘텐츠 및 데이터** 아래에서 **문서 및 미디어** 를 클릭하세요. 다음 권한을 추가합니다.

   **일반 권한**

   * `Access in Site and Asset Library Administration`
   * `View`

   **리소스 권한**

   - 문서, 문서 폴더, 문서, 바로가기, 문서 유형 및 메타데이터에 대한 모든 작업을 선택합니다.

**저장** 을 클릭하세요. 이제 새 역할에 대해 다른 권한이 설정되었습니다.

1. 이제 이 역할에 사용자를 할당할 수 있습니다.

   * **담당자** 탭을 클릭하세요.
   * **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.
   * 새 창에서 **Lily Lewis** 를 선택하고 **Add** 를 클릭하세요.

   이제 Lily Lewis 또는 이 역할을 맡은 다른 사람들은 사이트 관리 메뉴를 통해 문서와 미디어에 액세스할 수 있습니다. 또한 영업 및 마케팅 조직 사이트에서 블로그 게시물을 보고 추가할 수도 있습니다.

   ![Lily Lewis has access to documents and media.](./setting-roles-and-permissions/images/01.png)

다음 단계는 [accounts](./working-with-accounts.md)을 생성하고 관리하는 것입니다.

## 관련 개념

* [역할 및 권한 이해](https://learn.liferay.com/ko/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions)
* [사용자를 역할에 할당](https://learn.liferay.com/ko/w/dxp/users-and-permissions/roles-and-permissions/designing-users-to-roles)
* [역할 생성 및 관리](https://learn.liferay.com/ko/w/dxp/users-and-permissions/roles-and-permissions/creating-and-managing-roles)
