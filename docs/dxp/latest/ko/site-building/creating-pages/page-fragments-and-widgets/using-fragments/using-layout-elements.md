# 레이아웃 요소 사용

{bdg-secondary}`Liferay 7.4 U22+/GA22+`용

레이아웃 요소는 페이지 또는 템플릿 레이아웃을 디자인하기 위한 드롭 영역을 정의합니다. 기본적으로 Liferay에는 [컨테이너](#containers) 과 [그리드](#grids) 두 개의 레이아웃 요소가 포함되어 있습니다. 추가한 후에는 추가 컨테이너나 그리드를 포함하여 위젯이나 기타 조각을 이러한 놓기 영역으로 끌어다 놓아 훨씬 더 복잡한 레이아웃을 만들 수 있습니다. 레이아웃을 디자인한 후 레이아웃 구성을 저장하여 다른 페이지와 템플릿에서 재사용할 수 있습니다. 자세한 내용은 [조각 구성 저장](./saving-fragment-compositions.md) 참조하세요.

![컨테이너와 그리드 조각은 페이지 레이아웃을 디자인하기 위한 것입니다.](./using-layout-elements/images/01.png)

조각을 지원하는 새 페이지나 템플릿을 생성하면 기본 드롭 영역이 나타납니다. 이 영역에는 어떤 조각이라도 추가할 수 있지만 컨테이너 조각을 컴포지션의 첫 번째 요소로 사용하면 다음과 같은 중요한 이점이 있습니다.

* [고급 구성에 대한 플렉스 디스플레이 속성을 포함하여 페이지 디자인에 대한 향상된 레이아웃 제어](./saving-fragment-compositions.md#creating-advanced-compositions-with-the-container-fragment) (Liferay DXP 7.4+)
* [다른 페이지 및 템플릿에서](./saving-fragment-compositions.md) 작곡을 빠르게 저장하고 재사용
* 조각 구성에 URL 또는 페이지 리디렉션 추가
* [스타일 북](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 활용하여 사이트 외관 표준화

컨테이너를 추가한 후에는 그리드 조각을 사용하여 다양한 뷰포트에 대한 콘텐츠 레이아웃을 맞춤설정할 수 있습니다. 자세한 내용은 그리드 조각으로 반응형 레이아웃 만들기 [그리드 조각으로 반응형 레이아웃 구축](./../../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) 참조하세요.

```{tip}
요소를 컨테이너나 그리드로 끌어다 놓으면 Liferay는 놓기 영역을 강조 표시하여 요소를 배치할 사이트를 나타냅니다. 추가한 후에는 브라우저 측면 패널( ![Browser](../../../../images/icon-hierarchy.png) )에서 요소를 끌어서 놓아 재정렬할 수 있습니다.
```

마지막으로, 페이지에 다양한 중첩 요소가 있는 경우 탐색경로가 나타나 중첩 계층의 요소를 탐색하는 데 도움을 줍니다.

![탐색경로 시스템을 사용하여 구조를 탐색하고 상위 요소를 선택하세요.](./using-layout-elements/images/04.png)

```{tip}
또한 요소를 선택하고 'Shift + Enter' 단축키를 사용하여 상위 요소를 선택할 수도 있습니다.
```

## 컨테이너

> 이전에는 **패널** 이라고 했습니다.

컨테이너 조각은 구성 가능한 드롭 영역을 콘텐츠 페이지에 추가합니다. 표준 구성 옵션 외에도 컨테이너의 HTML 태그, 표시 구조 등을 구성할 수 있습니다. 자세한 내용은 [조각 구성](./configuring-fragments.md) 참조하세요.

![컨테이너에는 표준 구성 옵션과 고유한 구성 옵션이 모두 포함되어 있습니다.](./using-layout-elements/images/02.png)

## 그리드

> 이전에는 **행** 이라고 불렀습니다.

그리드 조각은 페이지 또는 템플릿에 여러 드롭 영역 모듈을 추가합니다. 이러한 모듈은 수평 및 수직으로 배열될 수 있습니다. 표준 구성 옵션 외에도 각 그리드의 모듈 수, 행당 모듈 수 및 각 모듈 콘텐츠의 수직 정렬을 결정할 수 있습니다. 각 모듈의 너비를 수동으로 조정하고 모듈 사이에 패딩을 추가하거나 제거할 수 있습니다. 자세한 내용은 [조각 구성](./configuring-fragments.md) 참조하세요.

![그리드에는 표준 및 고유 구성 옵션이 포함됩니다.](./using-layout-elements/images/03.png)

## 관련 주제

* [기본 조각 참조](./default-fragments-reference.md)
* [조각 구성 저장](./saving-fragment-compositions.md)
* [조각 구성](./configuring-fragments.md)
