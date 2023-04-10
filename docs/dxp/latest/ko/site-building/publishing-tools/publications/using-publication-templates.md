# 출판 템플릿 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U63+/GA63+`

공유 세부 정보 및 기고자가 포함된 간행물 생성을 단순화하려면 간행물 템플릿을 사용하십시오. 사용자 목록을 만들어 역할을 초대 및 할당하고 토큰을 사용하여 이름과 설명을 자동으로 채울 수 있습니다.

게시 템플릿을 만들려면

1. **글로벌 메뉴**( ![Global Menu](../../../images/icon-applications-menu.png) )을 열고 **애플리케이션** 탭으로 이동한 다음 **출판물** 클릭합니다.

1. Application Bar에서 **Actions**( ![Actions Button](../../../images/icon-actions.png) )를 클릭하고 **Templates** 선택합니다.

   ![Publications 애플리케이션을 열고 애플리케이션 표시줄에서 작업 버튼을 클릭한 다음 템플릿을 선택합니다.](./using-publication-templates/images/01.png)

1. **추가**(![Add button](../../../images/icon-add.png))을 클릭합니다.

1. 템플릿의 이름과 설명을 입력합니다.

   ![템플릿의 이름과 설명을 입력합니다.](./using-publication-templates/images/02.png)

1. 템플릿으로 만든 발행물에 사용할 이름과 설명을 입력합니다.

   문자열 템플릿 토큰을 사용하여 값을 동적으로 생성할 수 있습니다.

   * `${RANDOM_HASH}`

   * `${TODAY_DATE}`

   * `${CURRENT_USERNAME}`

   ![템플릿으로 만든 발행물에 사용할 이름과 설명을 입력합니다.](./using-publication-templates/images/03.png)

1. **사용자 초대** 클릭하여 템플릿으로 만든 게시에 대한 기본 사용자 및 역할 할당을 지정합니다.

   ![템플릿으로 만든 게시에 대한 기본 사용자 및 역할 할당을 지정하려면 사용자 초대를 클릭합니다.](./using-publication-templates/images/04.png)

   기여자를 추가하려면 사용자를 검색하고 역할을 선택합니다. 자세한 내용은 [출판물 공동 작업](./collaborating-on-publications.md) 참조하십시오.

   ![사용자를 검색하고 역할을 선택합니다.](./using-publication-templates/images/05.png)

   ```{note}
   간행물 애플리케이션에 대한 액세스 권한이 없는 사용자를 초대하면 Liferay는 자동으로 [간행물 사용자](./publications-permissions.md#publications-user-role) 역할을 할당합니다.
   ```

1. **저장** 클릭합니다.

게시 템플릿 페이지에 새 템플릿이 나타납니다.

![게시 템플릿 페이지에 템플릿이 나타납니다.](./using-publication-templates/images/06.png)

사용자는 출판물을 만들 때 [템플릿을 선택할 수 있습니다](./creating-and-managing-publications.md#creating-a-new-publication) . 템플릿을 선택하면 이름 및 설명 필드가 자동으로 채워지고 기본 기여자를 초대합니다.

![사용자는 발행물을 만들 때 템플릿을 선택할 수 있습니다.](./using-publication-templates/images/07.png)

## 추가 정보

* [출판물 생성 및 관리](./creating-and-managing-publications.md)
* [간행물 공동 작업](./collaborating-on-publications.md)
* [간행물 권한](./publications-permissions.md)
