# 자산 게시자 위젯에서 자산 선택

특정 기준에 따라 자산을 동적으로 선택하거나 수동으로 표시할 자산을 정확하게 지정하도록 자산 게시자 위젯을 구성할 수 있습니다. [컬렉션](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 의 자산을 표시할 수도 있습니다.

```{note}
Liferay 7.2 이하에서는 컬렉션을 [콘텐츠 세트](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md#liferay-dxp-7-2) 라고 합니다.
```

1. [새 페이지 만들기](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) 또는 [기존 페이지 수정](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) 

1. _추가_( ![위젯 아이콘 추가](../../../images/icon-add-widget.png) )를 클릭하여 조각 및 위젯 패널을 엽니다.

1. 위젯 탭의 콘텐츠 표시 카테고리 아래에서 _자산 게시자_ 위젯을 페이지의 한 사이트
로 드래그합니다.

1. Asset Publisher 위젯의 오른쪽 상단에 있는 _작업_(![작업 아이콘.](../../../images/icon-actions.png))을 클릭합니다.

   ![Click Actions to access the Asset Publisher configuration options.](./selecting-assets-in-the-asset-publisher-widget/images/01.png)

1. _구성_을 선택하여 구성 대화 상자를 표시합니다.

   자산 선택에서 자산 필터링 방법을 선택합니다. 이러한 옵션에 대한 설명은 [자산 선택 옵션](#asset-selection-options) 을 참조하세요.

   ![The configuration window has different Asset Selection options under the Setup tab.](selecting-assets-in-the-asset-publisher-widget/images/02.png)

1. 선택적으로 [동적](#dynamic) 및 [수동](#manual) 자산 선택 옵션을 선택한 경우 *이 구성에서 컬렉션 만들기*를 클릭하여 새 컬렉션을 생성할 수 있습니다. 그러면 구성이 새로운 [컬렉션](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)으로 저장됩니다.

1. 자산을 선택하고 위젯을 구성한 후 _저장_을 클릭하세요.

## 자산 선택 옵션

다양한 옵션을 사용하여 자산 게시자 대화상자의 자산 선택 섹션에서 자산을 선택할 수 있습니다.

- [컬렉션](#collection) 
- [동적](#dynamic) 
- [수동](#manual) 

### 콜렉션

이전에 저장한 컬렉션이나 컬렉션 공급자 중에서 선택하려면 이 옵션을 선택하세요. 컬렉션에 대해 자세히 알아보려면 [컬렉션 및 컬렉션 페이지 정보](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 읽어보세요.

1. 컬렉션 선택에서 _선택_을 클릭합니다.

1. _컬렉션_ 또는 _컬렉션 제공자_ 탭을 선택하세요.

1. 기존 컬렉션 또는 컬렉션 제공업체 중 하나를 선택하세요.

1. _저장_을 클릭하세요.

![Click Select and choose from your saved collections.](selecting-assets-in-the-asset-publisher-widget/images/03.png)

```{note}
개발자는 컬렉션 공급자를 사용하여 고급 기준으로 특정 컬렉션을 만들 수 있습니다. 자세히 알아보려면 [Info Framework](https://help.liferay.com/hc/en-us/articles/360029067251-Introduction-to-The-Info-Framework) 개발자 문서에서 [정보 목록 공급자 만들기](https://help.liferay.com/hc/en-us/articles/360029067271-Creating-an-Information-List-Provider) 에 대한 정보를 읽어보세요.
```

### 동

동적 자산 선택을 사용하면 다양한 기준에 따라 자산 게시자 위젯에 자산을 자동으로 포함할 수 있습니다.

1. 소스 섹션에서 자산 유형 드롭다운 메뉴를 사용하여 자산을 선택합니다. 특정 자산 유형을 선택하거나 _하나 이상 선택_하여 다양한 유형 중에서 선택하세요.

1. 범위 섹션에서 개별 사이트 또는 다른 사이트의 자산을 표시하도록 선택합니다.

1. 필터 섹션에서 자산 게시자 위젯의 자산에 대한 규칙을 정의합니다. [카테고리](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md), [태그](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md) 또는 키워드를 기반으로 규칙을 정의할 수 있습니다.

1. 사용자 정의 사용자 속성을 정의한 경우 이를 포함합니다.

1. 순서 섹션에서 자산 게시자 위젯의 자산 표시 순서를 선택합니다.

![Define the options for the dynamic asset collection, including Source, Scope, Filter, Custom User Attribute, and Ordering.](selecting-assets-in-the-asset-publisher-widget/images/04.png)

### 손으로 하는

여기에서 매개변수를 설정하고 특정 자산을 수동으로 필터링할 수 있습니다.

1. 범위 섹션에서 개별 사이트 또는 다른 사이트의 자산을 표시하도록 선택합니다.

1. 자산 항목 섹션에서 선택 버튼을 사용하여 특정 유형의 자산을 필터링합니다.

1. 선택한 자산 유형에 대해 포함할 자산을 확인하세요.

1. _추가_를 클릭하세요.

![Here is an example of filtering for basic web content and manually selecting items](selecting-assets-in-the-asset-publisher-widget/images/05.png)

 ```{note}
 선택 사항에 따라 새 컬렉션이 생성됩니다.
 ```

## 관련 주제

- [Asset Publisher 위젯을 사용하여 자산 표시](./displaying-assets-using-the-asset-publisher-widget.md)
- [Asset Publisher 표시 설정 구성](./configuring-asset-publisher-display-settings.md)
- [컬렉션 및 컬렉션 페이지 정보](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
