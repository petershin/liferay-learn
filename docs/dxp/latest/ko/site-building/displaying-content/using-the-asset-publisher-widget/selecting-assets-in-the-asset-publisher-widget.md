# 자산 게시자 위젯에서 자산 선택

특정 기준에 따라 자산을 동적으로 선택하거나 수동으로 표시할 자산을 정확하게 지정하도록 자산 게시자 위젯을 구성할 수 있습니다. [컬렉션](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)의 자산을 표시할 수도 있습니다.

```{note}
Liferay 7.2 이하에서는 컬렉션을 [콘텐츠 세트](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md#liferay-dxp-7-2).
```

1. [새 페이지 만들기](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) 또는 [기존 페이지 수정](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)

1. *Add* ( ![Add widget icon](../../../images/icon-add-widget.png) )을 클릭하여 조각 및 위젯 패널을 엽니다.

1. 위젯 탭의 콘텐츠 표시 카테고리 아래에서 *Asset Publisher* 위젯을 페이지의 한 사이트로 드래그하세요.

1. Asset Publisher 위젯의 오른쪽 상단에 있는 *Actions* (![Actions icon.](../../../images/icon-actions.png))을 클릭하세요.

   ![자산 게시자 구성 옵션에 액세스하려면 작업을 클릭합니다.](./selecting-assets-in-the-asset-publisher-widget/images/01.png)

1. *구성* 선택하여 구성 대화 상자를 표시합니다.

   자산 선택에서 자산 필터링 방법을 선택합니다. 이러한 옵션에 대한 설명은 [자산 선택 옵션](#asset-selection-options)을 참조하세요.

   ![구성 창에는 설정 탭 아래에 다양한 자산 선택 옵션이 있습니다.](selecting-assets-in-the-asset-publisher-widget/images/02.png)

1. 선택적으로 [동적](#dynamic) 및 [수동](#manual) 자산 선택 옵션을 선택한 경우 *이 구성에서 컬렉션 생성*클릭하여 새 컬렉션을 생성할 수 있습니다. 그러면 구성이 새 [컬렉션](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)로 저장됩니다.

1. 자산을 선택하고 위젯을 구성한 후 *저장*클릭합니다.

## 자산 선택 옵션

다양한 옵션을 사용하여 자산 게시자 대화상자의 자산 선택 섹션에서 자산을 선택할 수 있습니다.

- [콜렉션](#collection)
- [동](#dynamic)
- [손으로 하는](#manual)

### 콜렉션

이전에 저장한 컬렉션이나 컬렉션 공급자 중에서 선택하려면 이 옵션을 선택하세요. 컬렉션에 대해 자세히 알아보려면 [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)읽어보세요.

 1. 컬렉션 선택에서 *선택*클릭합니다.

 1. *컬렉션* 또는 *컬렉션 공급자* 탭을 선택합니다.

 1. 기존 컬렉션 또는 컬렉션 제공업체 중 하나를 선택하세요.

 1. *저장*클릭하세요.

 ![선택을 클릭하고 저장된 컬렉션 중에서 선택하세요.](selecting-assets-in-the-asset-publisher-widget/images/03.png)

```{note}
개발자는 컬렉션 공급자를 사용하여 고급 기준으로 특정 컬렉션을 만들 수 있습니다. 자세한 내용은 [정보 목록 공급자 만들기](https://help.liferay.com/hc/en-us/articles/360029067271-Creating-an-Information-List-Provider)에 대한 정보를 읽어보세요. 프레임워크](https://help.liferay.com/hc/en-us/articles/360029067251-Introduction-to-The-Info-Framework) 개발자 문서.
```

### 동

동적 자산 선택을 사용하면 다양한 기준에 따라 자산 게시자 위젯에 자산을 자동으로 포함할 수 있습니다.

  1. 소스 섹션에서 자산 유형 드롭다운 메뉴를 사용하여 자산을 선택합니다. 특정 자산 유형을 선택하거나 *둘 이상의 자산을 선택* 하여 다양한 유형 중에서 선택하십시오.

  1. 범위 섹션에서 개별 사이트 또는 다른 사이트의 자산을 표시하도록 선택합니다.

  1. 필터 섹션에서 자산 게시자 위젯의 자산에 대한 규칙을 정의합니다. [카테고리](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md), [태그](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md)또는 키워드를 기반으로 규칙을 정의할 수 있습니다.

  1. 사용자 정의 사용자 속성을 정의한 경우 이를 포함합니다.

  1. 순서 섹션에서 자산 게시자 위젯의 자산 표시 순서를 선택합니다.

![소스, 범위, 필터, 사용자 정의 사용자 속성 및 순서 지정을 포함하여 동적 자산 컬렉션에 대한 옵션을 정의합니다.](selecting-assets-in-the-asset-publisher-widget/images/04.png)

### 손으로 하는

여기에서 매개변수를 설정하고 특정 자산을 수동으로 필터링할 수 있습니다.

 1. 범위 섹션에서 개별 사이트 또는 다른 사이트의 자산을 표시하도록 선택합니다.

 1. 자산 항목 섹션에서 선택 버튼을 사용하여 특정 유형의 자산을 필터링합니다.

 1. 선택한 자산 유형에 대해 포함할 자산을 확인하세요.

 1. *추가*클릭합니다.

 ![다음은 기본 웹 콘텐츠를 필터링하고 항목을 수동으로 선택하는 예입니다.](selecting-assets-in-the-asset-publisher-widget/images/05.png)

 ```{note}
 선택 사항에 따라 새 컬렉션이 생성됩니다.
 ```

## 관련 주제

- [자산 게시자 위젯을 사용하여 자산 표시](./displaying-assets-using-the-asset-publisher-widget.md)
- [자산 게시자 표시 설정 구성](./configuring-asset-publisher-display-settings.md)
- [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
