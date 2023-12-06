# 표시 페이지를 사용하여 카테고리 표시

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.4+.`

표시 페이지 템플릿을 사용하면 [표시 페이지](../../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)에서 웹 콘텐츠, 문서 및 블로그 항목을 렌더링할 수 있습니다. Liferay DXP 7.4부터 디스플레이 페이지에 카테고리를 렌더링할 수도 있습니다. [카테고리를 사용하여 구성한](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) 여러 제품이나 서비스를 선보이고 싶을 때 유용할 수 있습니다. 표시 페이지는 요소 카탈로그를 일관된 방식으로 표시하는 데 이상적이므로 카테고리 기반 표시 페이지를 사용하여 제품 또는 서비스 카탈로그를 탐색할 때 사용자에게 일관된 환경을 제공할 수 있습니다.

## 표시 페이지에 카테고리 표시

다른 유형의 표시 페이지 콘텐츠를 렌더링하는 것과 동일한 방식으로 표시 페이지의 카테고리를 렌더링합니다.

* 카테고리에 대한 [표시 페이지 템플릿을 생성](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)하고 이 템플릿을 기본 템플릿으로 설정합니다.
* [카테고리 생성 또는 편집](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for) 시 원하는 표시 페이지 템플릿을 선택하세요. -content.md).

디스플레이 페이지 템플릿을 여러 범주에 동시에 할당할 수도 있습니다.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **범주화** &rarr; **범주** 로 이동합니다.

1. 업데이트하려는 카테고리를 확인하고 **페이지**(![Page](../../../images/icon-page.png))를 클릭하거나, 상단 작업 메뉴(![Actions](../..))를 클릭합니다. /../images/icon-actions.png)) 메뉴에서 **디스플레이 페이지 템플릿 할당** 을 선택합니다.

![Set the display page template as default using the Actions menu.](./displaying-categories-using-display-pages/images/01.png)

## 예: 디스플레이 페이지에서 카테고리 기반 탐색 사용

이 단계별 예에서는 가상 보험 회사의 서비스를 표시하기 위해 표시 페이지 템플릿과 함께 카테고리를 사용하는 방법을 보여줍니다.

1. [표시하려는 카테고리를 생성하고 편집하세요](#step-1-creating-and-editing-the-categories) .

1. [디스플레이 페이지 템플릿을 생성합니다](#step-2-creating-the-display-page-template) .

1. [디스플레이 페이지 템플릿을 편집하고 게시합니다](#step-3-edit-and-publish-the-display-page-template) .

```{warning}
다음 예에서는 기본 표시 페이지 템플릿을 수정하는 방법을 보여줍니다. 프로덕션 사이트의 중단을 방지하려면 테스트 사이트에서 이 절차를 완료하십시오.
```

### 1단계: 카테고리 생성 및 편집

[카테고리 만들기](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#creating-categories) 아직 존재하지 않으며, 디스플레이 페이지에 매핑하려는 정보를 포함하세요. 이 예에서는 설명과 사진이 포함된 두 개의 새로운 카테고리를 생성합니다. 각 카테고리는 서로 다른 서비스에 해당합니다.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **범주화** &rarr; **범주** 로 이동합니다.

1. Vehicle이라는 이름의 [새 어휘 만들기](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-vocabularies) 소유권.

1. Car라는 이름의 [새 카테고리 만들기](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-categories) 보험. **저장** 을 클릭하세요.

1. 카테고리 애플리케이션에서 새 카테고리에 대해 **작업**(![Actions](../../../images/icon-actions.png))을 클릭하고 **편집** 을 선택합니다.

1. **이미지** 탭을 클릭하고 **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭하여 카테고리에 이미지를 추가합니다.

1. **세부정보** 탭을 클릭하고 이 카테고리에 대한 설명을 추가하세요.

   ![Edit the category and add a description.](./displaying-categories-using-display-pages/images/02.png)

1. **저장** 을 클릭하세요.

### 2단계: 표시 페이지 템플릿 만들기

Liferay DXP 7.4부터 표시 페이지 템플릿에는 카테고리를 콘텐츠 유형으로 사용하는 옵션이 포함되어 있습니다.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. **페이지 템플릿 표시** 를 클릭하고 **추가**(![이미지 추가](../../../images/icon-add.png))를 클릭합니다.

1. 이 디스플레이 페이지 템플릿에 사용할 마스터 페이지 템플릿을 선택합니다.

   ```{tip}
   모든 페이지 또는 페이지 템플릿에는 마스터 페이지 템플릿이 필요합니다. 자세히 알아보려면 [마스터 페이지 템플릿](../../creating-pages/defining-headers-and-footers/master-page-templates.md)을 읽어보세요.
   ```

1. 디스플레이 페이지 템플릿의 **이름** 을 입력하고 콘텐츠 유형 드롭다운 메뉴에서 **범주** 를 선택합니다.

   ![Select category as the content type of your new display page template.](./displaying-categories-using-display-pages/images/03.png)

1. **저장** 을 클릭하세요.

### 3단계: 표시 페이지 템플릿 편집 및 게시

표시 페이지 템플릿을 생성한 후 구성 요소 매핑 및 레이아웃을 편집할 수 있습니다.

```{tip}
표시 페이지 템플릿 편집기는 콘텐츠 페이지 편집기처럼 작동합니다. 자세한 내용은 [콘텐츠 페이지에 요소 추가](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)를 참조하세요.
```

이 예에서는 [카드 조각](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md)을 사용하여 카테고리 필드를 매핑하는 방법을 보여줍니다.

1. 컨테이너 조각을 기본 놓기 영역으로 끌어서 놓습니다.

1. 컨테이너 조각 위에 새 카드 조각을 끌어서 놓습니다.

1. **브라우저**(![Browser](../../../images/icon-hierarchy.png)) 버튼을 클릭한 다음 카드 제목을 클릭하여 매핑 옵션을 엽니다.

1. 매핑 탭에서 **소스** 드롭다운 메뉴를 클릭하고 **특정 콘텐츠** 를 선택합니다.

1. **항목** 을 클릭하고 매핑하려는 카테고리를 선택하세요.

1. **필드** 드롭다운 메뉴를 클릭하고 **이름** 을 선택하여 카테고리 이름을 카드 제목에 매핑합니다.

   ![Map the category fields in the display page template using a card fragment.](./displaying-categories-using-display-pages/images/04.png)

1. 카드 설명에 대해 동일한 매핑 프로세스를 반복합니다. 이 목록은 예제의 카테고리 필드 매핑에 대한 카드 조각을 요약합니다.

   * 제목 &rarr; 이름
   * 내용 &rarr; 설명
   * 이미지 &rarr; 기본 이미지

1. **게시** 를 클릭하세요.

1. 표시 페이지 템플릿 목록에서 새 표시 페이지 템플릿에 대해 **작업**(![Actions](../../../images/icon-actions.png))을 클릭하고 **기본값으로 표시** 를 선택합니다.

   ![Set the display page template as default using the Actions menu.](./displaying-categories-using-display-pages/images/05.png)

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **범주화** &rarr; **범주** 로 이동한 다음 [1단계](#step-1-creating-and-editing-the-categories) 의 카테고리입니다.

1. 아무 카테고리에서나 **작업**(![Actions](../../../images/icon-actions.png))을 클릭하고 **표시 페이지 보기** 를 선택합니다.

    ![Open the display page for one of the categories using Actions option.](./displaying-categories-using-display-pages/images/06.png)

표시 페이지는 표시 페이지 템플릿 매핑을 사용하여 범주 필드를 표시합니다. 표시 페이지 URL은 선택한 카테고리에 대해 고유합니다.

![The display page template shows the category fields and provides a unique URL.](./displaying-categories-using-display-pages/images/07.png)

## 관련 주제

[표시 페이지 템플릿 생성 및 관리](./creating-and-managing-display-page-templates.md)

[디스플레이 페이지를 사용하여 콘텐츠 게시](./publishing-content-with-display-pages.md)

[콘텐츠의 카테고리 및 어휘 정의](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md).
