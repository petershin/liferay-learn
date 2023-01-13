# 디스플레이 페이지를 사용하여 카테고리 표시

> 사용 가능: Liferay DXP/Portal 7.4+.

디스플레이 페이지 템플릿을 사용하면 디스플레이 페이지 [에서 웹 콘텐츠, 문서 및 블로그 항목을 렌더링할 수](../../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md). Liferay DXP 7.4부터 디스플레이 페이지에서 범주를 렌더링할 수도 있습니다. 이는 카테고리 [을 사용하여 구성한 여러 제품 또는 서비스를 보여](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md)경우에 유용할 수 있습니다. 디스플레이 페이지는 일관된 방식으로 요소 카탈로그를 표시하는 데 이상적이므로 범주 기반 디스플레이 페이지를 사용하여 제품 또는 서비스 카탈로그를 탐색할 때 사용자에게 일관된 경험을 제공할 수 있습니다.

## 표시 페이지에 카테고리 표시

다른 유형의 디스플레이 페이지 콘텐츠를 렌더링하는 것과 같은 방식으로 디스플레이 페이지에서 범주를 렌더링합니다. 두 가지 옵션이 있습니다.

- [범주에 대한 표시 페이지 템플릿](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) 을 만들고 이 템플릿을 기본 템플릿으로 설정합니다.
- 범주 [을 생성하거나 편집할 때 선택한 표시 페이지 템플릿을 선택](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md).

디스플레이 페이지 템플릿을 한 번에 여러 범주에 할당할 수도 있습니다. 사이트 관리 &rarr; *분류* &rarr; *범주*아래에서 업데이트할 범주를 선택한 다음 페이지(![Page](../../../images/icon-page.png)) 아이콘을 클릭하거나 상단 작업(![Actions](../../../images/icon-actions.png)) 메뉴에서 *디스플레이 페이지 템플릿 할당*을 선택합니다.

![작업 메뉴를 사용하여 디스플레이 페이지 템플릿을 기본값으로 설정합니다.](./displaying-categories-using-display-pages/images/07.png)

## 예: 디스플레이 페이지에서 범주 기반 탐색 사용

이 단계별 예에서는 디스플레이 페이지 템플릿과 함께 범주를 사용하여 가상 보험 회사의 서비스를 표시하는 방법을 보여줍니다.

디스플레이 페이지에 카테고리를 표시하는 단계는 다음과 같습니다.

1. [표시할 범주를 만들고 편집합니다](#step-1-creating-and-editing-the-categories).
1. [디스플레이 페이지 템플릿 만들기](#step-2-creating-the-display-page-template).
1. [디스플레이 페이지 템플릿 편집 및 게시](#step-3-edit-and-publish-the-display-page-template).

```{warning}
다음 예에서는 기본 디스플레이 페이지 템플릿을 수정하는 방법을 보여줍니다. 프로덕션 사이트의 중단을 방지하려면 테스트 사이트에서 이 절차를 완료하십시오.
```

### 1단계: 범주 생성 및 편집

아직 존재하지 않는 경우 범주를 생성하고 디스플레이 페이지에 매핑하려는 정보를 포함합니다. 이 예에서는 설명과 사진이 있는 두 개의 새 범주를 생성합니다. 각 범주는 서로 다른 서비스에 해당합니다.

1. [ *자동차 보험*이라는 새 범주](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defininig-categories) 을 만듭니다.
1. 카테고리 애플리케이션에서 새 카테고리에 대한 *작업* (![Actions](../../../images/icon-actions.png)) 메뉴를 클릭하고 *편집*을 선택합니다.
1. *세부 정보* 탭을 클릭하고 이 범주의 *설명* 을 추가합니다.

   ![범주를 편집하고 설명을 추가합니다.](./displaying-categories-using-display-pages/images/01.png)

1. *이미지* 탭을 클릭하고 *이미지 추가* (![Add Image](../../../images/icon-add.png)) 버튼을 사용하여 범주에 대한 이미지를 추가합니다.
1. *세부 정보* 탭을 다시 클릭한 다음 *저장*을 클릭합니다.

### 2단계: 표시 페이지 템플릿 만들기

Liferay DXP 7.4부터 표시 페이지 템플릿에는 범주를 콘텐츠 유형으로 사용하는 옵션이 포함되어 있습니다.

1. *사이트 관리* &rarr; *디자인* &rarr; *페이지 템플릿*으로 이동합니다.
1. *페이지 템플릿 표시* 을 클릭하고 *추가* (![Add Image](../../../images/icon-add.png)) 버튼을 클릭합니다.
1. 이 표시 페이지 템플릿에 사용할 마스터 페이지 템플릿을 선택합니다.

    ```{tip}
    모든 페이지 또는 페이지 템플릿에는 마스터 페이지 템플릿이 필요합니다. 자세한 내용은 [마스터 페이지 템플릿](../../creating-pages/defining-headers-and-footers/master-page-templates.md)을 참조하세요.
    ```

1. 표시 페이지 템플릿의 *이름* 을 입력하고 *콘텐츠 유형* 드롭다운 메뉴에서 *카테고리*를 선택합니다.

    ![새 표시 페이지 템플릿의 콘텐츠 유형으로 탐색을 선택합니다.](./displaying-categories-using-display-pages/images/02.png)

1. *저장*을 클릭합니다.

### 3단계: 디스플레이 페이지 템플릿 편집 및 게시

디스플레이 페이지 템플릿을 생성한 후 구성 요소 매핑 및 레이아웃을 편집할 수 있습니다.

```{tip}
디스플레이 페이지 템플릿 편집기는 콘텐츠 페이지 편집기처럼 작동합니다. 자세한 내용은 [콘텐츠 페이지에 요소 추가](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)를 참조하십시오.
```

이 예는 [Card Fragment](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md)을 사용하여 범주 필드를 매핑하는 방법을 보여줍니다.

1. 컨테이너 조각을 기본 놓기 영역으로 끌어다 놓습니다.
1. Container Fragment 위에 새 Card Fragment를 드래그 앤 드롭합니다.
1. *선택* 메뉴(A)를 클릭한 다음 카드 제목(B)을 클릭하여 매핑 옵션을 엽니다.
1. 매핑 영역과 *소스* 드롭다운 메뉴에서 아직 선택하지 않은 경우 *범주* 을 선택합니다.
1. *필드* 드롭다운 메뉴를 클릭하고 *이름* (C)를 선택하여 카테고리 이름을 카드 제목에 매핑합니다.

   ![카드 조각을 사용하여 디스플레이 페이지 템플릿의 범주 필드를 매핑합니다.](./displaying-categories-using-display-pages/images/03.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

1. 카드 설명과 카드 이미지에 대해 동일한 매핑 프로세스를 반복합니다. 이 목록은 예제에서 카드 조각과 범주 필드 매핑을 요약합니다.

    - 제목 &rarr; 이름
    - 내용 &rarr; 설명
    - 이미지 &rarr; 메인 이미지

1. *게시*을 클릭합니다.
1. *Display Page Templates* 목록에서 새 Display Page Template에 대한 *Actions* (![Actions](../../../images/icon-actions.png)) 메뉴를 클릭하고 *Mark as Default*을 선택합니다.

   ![작업 메뉴를 사용하여 디스플레이 페이지 템플릿을 기본값으로 설정합니다.](./displaying-categories-using-display-pages/images/04.png)

1. *Site Administration* &rarr; *Categorization* &rarr; *Categories* 로 이동하여 [Step 1](#step-1-creating-and-editing-the-categories)에서 범주가 있는 어휘를 선택합니다.
1. 카테고리에서 *작업* (![Actions](../../../images/icon-actions.png)) 메뉴를 클릭하고 *디스플레이 페이지 보기*를 선택합니다.

   ![작업 메뉴 옵션을 사용하여 범주 중 하나에 대한 디스플레이 페이지를 엽니다.](./displaying-categories-using-display-pages/images/05.png)

디스플레이 페이지는 디스플레이 페이지 템플릿 매핑을 사용하여 범주 필드를 표시합니다. 표시 페이지 URL은 선택한 카테고리에 대해 고유합니다.

![디스플레이 페이지 템플릿은 범주 필드를 표시하고 고유한 URL을 제공합니다.](./displaying-categories-using-display-pages/images/06.png)

## 관련 정보

- [표시 페이지 템플릿 생성 및 관리](./creating-and-managing-display-page-templates.md)
- [디스플레이 페이지로 콘텐츠 게시](./publishing-content-with-display-pages.md)
- [콘텐츠](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)에 대한 범주 및 어휘 정의 .
