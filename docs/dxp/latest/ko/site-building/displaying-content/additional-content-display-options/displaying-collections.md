# 컬렉션 표시

{bdg-secondary}`사용 가능한 Liferay Portal 7.4 GA6+, DXP 7.3 GA1+`

컬렉션 페이지 또는 컬렉션 표시 조각을 추가하여 컬렉션을 표시할 수 있습니다. 이러한 표시 옵션에 대한 자세한 내용은 [컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md#displaying-collections)를 참조하세요.

```{note}
페이지에 표시하기 전에 [컬렉션을 생성](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md)해야 합니다.
```

## 페이지에 컬렉션 표시

컬렉션을 표시하는 가장 쉬운 두 가지 방법은 컬렉션 페이지를 추가하거나 기존 페이지에 컬렉션 표시 조각을 추가하는 것입니다.

### 컬렉션 페이지에 컬렉션 표시

컬렉션 페이지는 페이지를 컬렉션에 연결합니다. 컬렉션 페이지에는 페이지의 일부로 [컬렉션 표시 조각](#adding-a-collection-display-fragment-to-a-page) 이 포함되어 있습니다.

컬렉션 페이지를 추가하려면 다음 단계를 따르세요.

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )를 열고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. **새 페이지**( ![새 페이지](../../../images/icon-add.png) )를 클릭하고 **컬렉션 페이지** 를 선택합니다.

   ![Create a new collection page from the pages administration.](./displaying-collections/images/01.png)

1. 컬렉션 탭에서 컬렉션 중 하나를 선택하거나 **추가**( ![아이콘 추가](../../../images/icon-add.png) )를 클릭하여 [새 컬렉션 만들기](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md).

1. 사용하려는 **마스터 페이지** 를 선택합니다.

1. 컬렉션 페이지 이름을 입력하고 **추가** 를 클릭하세요.

1. 컬렉션을 표시하려면 [해당 콘텐츠를 페이지 요소에 매핑](#mapping-comComponents-to-display-a-collections-assets) 하세요.

```{important}
컬렉션 페이지 아래에는 하위 페이지를 만들 수 없습니다.
```

이제 컬렉션 표시 조각 내에서 선택한 컬렉션을 표시하는 컬렉션 페이지가 생겼습니다.

### 페이지에 컬렉션 표시 조각 추가

컬렉션 표시 조각은 콘텐츠 페이지의 컬렉션을 표시합니다. 어떤 스타일이나 레이아웃으로도 컬렉션을 표시하도록 구성할 수 있습니다.

![Use a collection display fragment to display a collection in the desired format.](./displaying-collections/images/02.png)

컬렉션 표시 조각에 기존 컬렉션을 추가하려면,

1. [새 페이지 만들기](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) 또는 [콘텐츠 페이지 편집 시작](../../ 생성 페이지/사용-콘텐츠-페이지/추가-요소-to-콘텐츠-페이지.md).

1. **추가**( ![위젯 아이콘 추가](../../../images/icon-add-widget.png) )를 클릭하여 조각 및 위젯 패널을 엽니다.

1. 조각 탭의 콘텐츠 표시 범주 아래에서 **컬렉션 표시** 조각을 페이지의 한 사이트로 드래그합니다.

1. 선택 패널에 구성을 표시하려면 **컬렉션 표시** 부분을 클릭하세요.

1. 일반 탭에서 **컬렉션** 필드를 클릭하여 선택한 컬렉션을 조각에 매핑합니다.

   ![Select a collection and map it to the collection display fragment.](./displaying-collections/images/03.png)

이제 컬렉션 표시 조각이 페이지에 있으며 선택한 컬렉션을 표시합니다.

## 컬렉션 표시 조각 구성

컬렉션 표시 조각을 수동으로 추가했거나 컬렉션 페이지를 통해 추가했는지 여부에 관계없이 [페이지 편집](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) 및 조각 선택을 통해 구성할 수 있습니다.

컬렉션 표시 조각을 선택하면 컬렉션의 각 자산에 대한 섹션으로 나뉩니다. 컬렉션을 선택한 후 조각의 일반 구성 아래에 새로운 옵션이 나타납니다.

**스타일 표시** : 목록에서 자산의 형식을 지정하는 데 사용되는 스타일을 선택합니다(예: 그리드 또는 글머리 기호 목록 스타일). 7.4 GA23 또는 U23 이전 버전에서는 이 구성을 목록 스타일이라고 합니다.

**레이아웃** : 자산을 표시할 열 수를 선택합니다.

**여백 표시** : 열 사이의 여백(간격)을 표시하려면 확인란을 선택합니다. 이 옵션은 열 레이아웃이 있는 그리드 스타일(버전 7.4 GA23+ 또는 U23+)을 선택한 경우에만 나타납니다.

**빈 컬렉션 경고 표시** : 적용된 필터와 일치하는 결과가 없거나 컬렉션이 비어 있을 때 경고 메시지를 표시하려면 확인란을 선택합니다.

**빈 컬렉션 알림** : **빈 컬렉션 알림 표시** 가 활성화된 경우 표시되는 경고 메시지를 선택합니다. 이 메시지는 현지화 가능합니다.

**수직 정렬** : 항목 정렬 방법(각 행의 상단, 중간, 하단)을 선택합니다. 이 옵션은 **그리드** 스타일(버전 7.4 GA23+ 또는 U23+)을 선택한 경우에만 나타납니다.

**목록 항목 스타일** : 각 자산의 형식을 지정할 스타일을 선택합니다. 이 옵션은 일부 목록 스타일에만 적용됩니다.

**최대 항목 수** : 조각이 한 번에 표시할 수 있는 최대 자산 수를 선택합니다.

![Click a collection display fragment with a configured collection to reveal more configuration options.](./displaying-collections/images/04.png)

컬렉션의 자산이 구성된 대로 표시될 준비가 되면 페이지를 게시하세요.

```{tip}
Liferay 7.4 GA23+ 또는 U23+에서 컬렉션 표시 부분에 대해 그리드 스타일을 선택한 경우 각 장치 유형에 대해 개별적으로 레이아웃 설정을 구성할 수 있습니다. 각 장치에 대해 이 설정을 지정하려면 화면 상단에 있는 장치 뷰포트 버튼을 클릭하세요. 태블릿 설정은 데스크탑 설정과 동일하게 기본 설정되어 있으며, 세로 및 가로 휴대폰 설정은 기본 1열로 되어 있습니다.
```

<!-- Add reference to developer tutorials to add more options for the List styles/List item styles when available -->

### 컬렉션의 자산을 표시하기 위한 구성 요소 매핑

표시 구성 요소를 조각에 매핑하여 조각에서 항목 스타일(각 자산이 개별적으로 표시되는 방식)을 구성할 수도 있습니다.

이러한 요소를 조각의 셀로 드래그하여 컬렉션 표시 조각의 자산에 매핑합니다.

```{note}
컬렉션 표시 조각의 목록 스타일에 대해 선택한 옵션에 따라 구성 요소를 조각으로 드래그하지 못할 수도 있습니다. 구성 요소를 조각으로 끌 수 없는 경우 다른 목록 스타일을 선택하거나 목록 항목 스타일에서 다른 옵션을 선택할 수 있습니다.
```

1. 페이지 편집기에서 컬렉션을 나타내는 **컬렉션 표시** 를 클릭하세요.

1. 도구 사이드바에서 **조각 및 위젯**(![조각 및 위젯](../../../images/icon-add-widget.png))을 클릭합니다.

1. 조각 및 위젯 사이드바 패널에서 컬렉션 항목을 표시하는 데 사용할 구성 요소를 끌어서 놓습니다.

   ![Add fragments or widgets to the collection display and configure the display properties.](./displaying-collections/images/05.gif)

   ```{note}
   컬렉션 표시에 둘 이상의 항목이 포함된 경우 조각이나 위젯을 해당 항목으로 드래그할 수 있습니다. 컬렉션의 나머지 항목은 자동으로 동일한 레이아웃 설정을 사용합니다.
   ```

1. 매핑 옵션에 액세스하려면 컬렉션 표시에서 **조각** 또는 **위젯** 을 두 번 클릭하세요.

1. 매핑 열에서 컬렉션에 매핑하려는 **필드** 를 선택합니다.

   ![Map the fragments and widgets to the collection items](./displaying-collections/images/06.gif)

1. 필요에 따라 더 많은 조각이나 위젯을 추가하고 콘텐츠를 콘텐츠 필드에 매핑합니다.

   ![Add fragments and widgets to the collection display and map the content fields.](./displaying-collections/images/07.gif)

1. **게시** 를 클릭하세요.

## 표시 항목 페이지 매기기

{bdg-secondary}`7.4+ 사용 가능`

페이지 매김 구성을 사용하여 컬렉션 항목에 페이지를 매길 수 있습니다. 이 옵션은 두 가지 중요한 이점을 제공합니다.

- 항목 수가 많은 컬렉션을 표시하는 것이 더 쉽습니다. 컬렉션의 모든 항목을 표시하는 대신, 사용자가 컬렉션의 항목 목록을 앞뒤로 이동할 수 있도록 하면서 한 번에 표시할 항목 수를 결정할 수 있습니다.

- 표시되는 항목 목록을 더 작은 그룹으로 나누면 서버 오버헤드가 줄어들어 서버 응답 시간과 사용자 경험이 향상됩니다.

```{note}
U18 및 GA18 이전 Liferay 7.4 버전에서는 사용할 수 있는 페이지 매김 옵션이 더 적습니다. 이러한 버전에서도 페이지 매김을 활성화하고 한 번에 표시할 최대 항목 수를 선택할 수 있지만 페이지 매김 메뉴에 표시되는 페이지 수를 변경할 수는 없습니다.
```

컬렉션 표시의 표시 항목에 페이지를 매기려면,

1. 컬렉션이 표시되는 콘텐츠 페이지에서 **편집**( ![아이콘 편집](../../../images/icon-edit.png) )을 클릭합니다.

1. **브라우저**( ![브라우저 아이콘](../../../images/icon-hierarchy.png) )를 클릭하여 브라우저 패널을 엽니다.

1. Elements Browser에서 페이지를 매길 컬렉션 표시 조각을 선택합니다. 선택한 조각은 기존 컬렉션을 표시하도록 구성되어야 합니다.

1. 일반 설정에서 페이지 매김 옵션을 선택합니다.

   **페이지 매김** : 없음(페이지 매김 없음), 숫자 또는 단순(이전/다음 컨트롤).

   **모든 페이지 표시** : 페이지 매기기 메뉴의 모든 페이지에 대한 숫자나 컨트롤을 표시하려면 확인란을 선택하세요. 페이지 매김 유형을 선택하지 않은 경우 이 옵션은 대신 모든 컬렉션 항목 표시가 됩니다.

   **표시할 최대 페이지 수** : 페이지 매기기 메뉴에 표시되는 최대 페이지 수입니다. 이 옵션은 모든 페이지 표시 확인란이 선택되지 않은 경우에만 나타납니다.

   **페이지당 최대 항목 수** : 페이지 매김이 활성화된 경우 페이지당 표시할 컬렉션의 최대 항목 수입니다. 페이지 매김 유형을 선택하지 않은 경우 이 옵션은 대신 표시할 최대 항목 수가 됩니다.

   ![Choose the pagination options for the collection display items.](./displaying-collections/images/08.png)

페이지 매김을 활성화하면 사용 가능한 총 페이지 수는 컬렉션의 총 항목 수와 페이지당 최대 항목 수 설정에 따라 달라집니다.

```{note}
기본적으로 컬렉션 표시 조각은 편집 모드에서 한 번에 최대 20개의 항목을 표시합니다. *제어판* &amp;rarr;로 이동하여 이 제한을 변경할 수 있습니다. *인스턴스 설정* &amp;rarr; *페이지* &rarr; *페이지 편집기* 및 *편집 모드의 최대 항목 수* 필드의 숫자 변경. 편집 모드에서 한 번에 20개 이상의 항목을 표시하면 성능에 부정적인 영향을 미칠 수 있습니다. 이 설정은 보기 모드의 페이지에서 사용자에게 표시되는 내용에 영향을 주지 않습니다.
```

## 사이트 전체에서 컬렉션 사용 보기

귀하의 사이트에 있는 컬렉션에 대한 사용 통계를 확인할 수 있습니다.

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )를 열고 **사이트 빌더** &rarr; **컬렉션** 으로 이동합니다.

1. 컬렉션 탭에서 검토하려는 컬렉션 옆에 있는 **작업**(![작업 메뉴](../../../images/icon-actions.png)) &rarr; **사용 보기** 를 클릭하세요.

![Select View Usages to understand how your collections are being used through the site](./displaying-collections/images/09.png)

## 라이프레이 DXP 7.2

### 콘텐츠 세트 표시

콘텐츠 세트는 주로 자산 게시자를 통해 표시됩니다. 현재는 이를 즉시 표시할 수 있는 유일한 방법이지만 콘텐츠 세트를 활용하기 위해 자신만의 외부 애플리케이션이나 위젯을 개발할 수 있습니다. [콘텐츠 세트 생성](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md#creating-content-sets) 에서 두 개의 콘텐츠 세트를 생성했습니다. 이제 페이지에 표시해 보세요.

#### 콘텐츠 세트에 대한 자산 게시자 구성

콘텐츠 세트를 표시하려면 빈 페이지에서 시작한 다음 필요한 자산 게시자를 추가하고 콘텐츠 세트를 표시하도록 구성합니다.

1. 1열 레이아웃의 위젯 페이지로 사이트의 새 홈 페이지를 만듭니다. 새로운 Liferay DXP 번들을 사용하는 경우 샘플 홈 페이지에서 Hello World 위젯을 제거하면 됩니다.

1. **추가** 메뉴를 열고 세로로 쌓인 페이지에 두 개의 **콘텐츠 관리** &rarr; **자산 게시자** 를 추가합니다.

1. 상위 자산 게시자의 경우 옵션( ![Options](../../../images/icon-app-options.png) ) &rarr; **구성** 을 클릭합니다.

1. 자산 선택에서 **콘텐츠 세트** 를 선택합니다.

   ![The asset publisher has a number of options available for selecting its source for content.](./displaying-collections/images/10.png)

1. **컨텐츠 세트 선택** 을 열고 **선택** 을 클릭하세요.

1. **우주 프로그램 이미지** 콘텐츠 세트를 선택합니다.

1. **저장** 을 클릭하세요.

이제 이미지가 페이지 상단에 나타납니다. 표시되는 메타데이터와 같이 콘텐츠가 표시되는 방식을 관리하거나 위젯 템플릿을 만들어 콘텐츠 스타일을 지정할 수도 있지만 표시되는 항목과 항목이 나타나는 순서는 콘텐츠 세트에 따라 결정됩니다.

이제 다른 콘텐츠 세트로 하단 자산 게시자를 구성합니다.

1. 하단 자산 게시자에 대해 옵션(![Options](../../../images/icon-app-options.png)) &rarr; **구성** 을 클릭합니다.

1. 자산 선택에서 **콘텐츠 세트** 를 선택합니다.

1. **컨텐츠 세트 선택** 을 열고 **선택** 을 클릭하세요.

1. **인기** 콘텐츠 세트를 클릭하세요.

   ![Select the content set you want to use.](./displaying-collections/images/11.png)

1. **저장** 을 클릭하세요.

여기서도 다양한 표시 설정을 관리할 수 있지만 표시되는 항목과 순서는 콘텐츠 설정 기준에 따라 결정됩니다.

![결과는 표준 자산 게시자 출력으로 볼 수 있습니다. 여기에 위젯 템플릿을 만들어 더 많은 스타일과 화려함을 추가할 수 있습니다.](./displaying-collections/images/12.png)

#### 기존 콘텐츠 세트에 항목 추가

정적 및 동적 콘텐츠 세트 관리를 시연하려면 새 이미지를 업로드하고 태그를 지정한 다음 수동으로 정적 세트에 추가하세요.

1. 새 이미지를 업로드하고 분류 아래에서 **인기** 태그를 지정하세요.

1. 이미지가 인기 콘텐츠 목록 상단에 추가됩니다.

   ![The result is added dynamically to the content list wherever it is displayed.](./displaying-collections/images/13.png)

1. 수동 세트에 추가하려면 **사이트 메뉴** 로 돌아가서 **콘텐츠 및 데이터** &rarr; **사이트 빌더** 로 이동하세요.

1. **우주 프로그램 이미지** 를 클릭하거나 !를 선택하세요. [Options](../../../images/icon-options.png) &rarr; 우주 프로그램 이미지 옆 **편집** .

1. 자산 항목 옆에 있는 **선택** &rarr; **기본 문서** 를 클릭합니다.

1. 새 이미지를 선택하고 **추가** 를 클릭하세요.

1. 홈 페이지로 다시 이동하여 목록에 추가된 이미지를 확인하세요.

콘텐츠 세트는 사이트 전체에 표시할 콘텐츠와 기타 자산을 정의하는 한 곳을 제공합니다. 재사용성은 또한 사용자에게 훌륭한 콘텐츠를 제공하는 데 필요한 반복 작업이 줄어든다는 것을 의미합니다.

## 관련 주제

[컬렉션 만들기](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md)
[컬렉션 및 컬렉션 페이지 정보](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
[컬렉션 개인화](../../personalizing-site-experience/experience-personalization/personalizing-collections.md)
