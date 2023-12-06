# 출판 템플릿 사용

{bdg-secondary}`라이프레이 7.4 U73+/GA73+`

공유된 세부 정보와 기여자가 포함된 출판물 생성을 단순화하려면 출판 템플릿을 사용하세요. 사용자 목록을 생성하여 역할을 초대 및 할당하고 토큰을 사용하여 이름과 설명을 자동으로 채울 수 있습니다.

출판 템플릿을 생성하려면,

1. **전역 메뉴**( ![전역 메뉴](../../../images/icon-applications-menu.png) )를 열고 **응용 프로그램** 탭으로 이동한 다음 **출판물** 을 클릭합니다.

1. 응용 프로그램 표시줄에서 **작업**( ![작업 버튼](../../../images/icon-actions.png) )을 클릭하고 **템플릿** 을 선택합니다.

   ![Open the Publications application, click the Actions button in the Application Bar, and select Templates.](./using-publication-templates/images/01.png)

1. **추가**( ![추가 버튼](../../../images/icon-add.png) )를 클릭합니다.

1. 템플릿의 이름과 설명을 입력합니다.

   ![Enter a name and description for the template.](./using-publication-templates/images/02.png)

1. (선택 사항) 이 템플릿을 새 출판물의 기본값으로 설정합니다.

   **기본 템플릿** : 수동으로 생성된 출판물은 기본적으로 이 템플릿을 사용하지만 출판물 생성 중에 대체 템플릿을 선택할 수 있습니다. [샌드박스 전용 모드](./enabling-publications.md#how-to-enable-publications) 가 활성화되면 기본 샌드박스 템플릿이 설정되지 않은 경우 자동으로 생성된 게시에서 템플릿을 사용합니다.

   **기본 샌드박스 템플릿** : 자동으로 생성된 게시는 [샌드박스 전용 모드](./enabling-publications.md#how-to-enable-publications) 가 활성화된 경우 이 템플릿을 사용합니다. 대체 템플릿을 사용하여 수동으로 출판물을 만들 수도 있습니다.

   ```{note}
   한 번에 하나의 기본 템플릿과 하나의 기본 샌드박스 템플릿만 가질 수 있습니다.
   ```

1. 템플릿으로 생성된 출판물에 사용할 이름과 설명을 입력합니다.

   문자열 템플릿 토큰을 사용하여 값을 동적으로 생성할 수 있습니다.

   * `${RANDOM_HASH}`

   * `${TODAY_DATE}`

   * `${CURRENT_USERNAME}`

   ![Enter a name and description to use for publications created with the template.](./using-publication-templates/images/03.png)

1. 템플릿으로 생성된 출판물에 대한 기본 사용자 및 역할 할당을 지정하려면 **사용자 초대** 를 클릭합니다.

   ![Click Invite Users to specify the default users and role assignments for publications created with the template.](./using-publication-templates/images/04.png)

   기여자를 추가하려면 사용자를 검색하고 역할을 선택하세요. 자세한 내용은 [출판물 공동작업](./collaborating-on-publications.md)을 참조하세요.

   ![Search for users and select a role.](./using-publication-templates/images/05.png)

   ```{note}
   출판물 애플리케이션에 액세스할 수 있는 권한이 없는 사용자를 초대하는 경우 Liferay는 자동으로 해당 사용자에게 [출판물 사용자](./publications-permissions.md#publications-user-role) 역할을 할당합니다.
   ```

1. **저장** 을 클릭하세요.

출판 템플릿 페이지에 새 템플릿이 나타납니다.

![Templates appear in the Publication Templates page](./using-publication-templates/images/06.png)

사용자는 [간행물 생성](./creating-and-managing-publications.md#creating-a-publication) 시 템플릿을 선택할 수 있습니다. 템플릿을 선택하면 이름 및 설명 필드가 자동으로 채워지고 기본 기여자가 초대됩니다.

![Users can select the template when creating a publication.](./using-publication-templates/images/07.png)

## 관련 주제

* [출판물 생성 및 관리](./creating-and-managing-publications.md)
* [출판물 공동작업](./collaborating-on-publications.md)
* [출판 허가](./publications-permissions.md)
