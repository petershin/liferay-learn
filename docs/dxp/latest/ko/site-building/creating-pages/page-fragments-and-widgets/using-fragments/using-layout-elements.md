# 레이아웃 요소 사용

{bdg-secondary}`라이프레이 7.4 U22+/GA22+`용

레이아웃 요소는 페이지 또는 템플릿 레이아웃을 디자인하기 위한 놓기 영역을 정의합니다. 기본적으로 Liferay에는 [컨테이너](#containers) 및 [그리드](#grids)의 두 가지 레이아웃 요소가 포함되어 있습니다. 일단 추가되면 추가 컨테이너 또는 그리드를 포함하여 위젯 또는 기타 조각을 이러한 드롭 영역으로 드래그 앤 드롭하여 훨씬 더 복잡한 레이아웃을 생성할 수 있습니다. 레이아웃을 디자인한 후 레이아웃 구성을 저장하여 다른 페이지 및 템플릿에서 재사용할 수 있습니다. 자세한 내용은 [단편 구성 저장](./saving-fragment-compositions.md) 을 참조하십시오.

![컨테이너 및 그리드 조각은 페이지 레이아웃을 디자인하기 위한 것입니다.](./using-layout-elements/images/01.png)

프래그먼트를 지원하는 새 페이지 또는 템플릿을 생성하면 기본 드롭 영역이 나타납니다. 이 영역에 조각을 추가할 수 있지만 컨테이너 조각을 컴포지션의 첫 번째 요소로 사용하면 다음과 같은 중요한 이점이 있습니다.

* [고급 컴포지션](./saving-fragment-compositions.md#creating-advanced-compositions-with-the-container-fragment) (Liferay DXP 7.4+)에 대한 플렉스 디스플레이 속성을 포함하여 페이지 디자인에 대한 더 나은 레이아웃 제어
* [다른 페이지 및 템플릿에서](./saving-fragment-compositions.md) 구성을 신속하게 저장 및 재사용
* 프래그먼트 컴포지션에 URL 또는 페이지 리디렉션 추가
* [스타일 북](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 을 활용하여 사이트 모양 표준화

컨테이너를 추가한 후에는 그리드 조각을 사용하여 다양한 뷰포트에 대한 콘텐츠 레이아웃을 사용자 지정할 수 있습니다. 자세한 내용은 [그리드 조각](./../../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) 로 반응형 레이아웃 구축을 참조하십시오.

```{tip}
요소를 컨테이너나 그리드로 드래그 앤 드롭할 때 Liferay는 배치할 위치를 나타내기 위해 드롭 영역을 강조 표시합니다. 추가한 후에는 브라우저 측면 패널( ![Browser](../../../../images/icon-hierarchy.png) )에서 요소를 드래그 앤 드롭하여 재정렬할 수 있습니다.
```

## 컨테이너

> 이전 명칭 *패널*

컨테이너 조각은 구성 가능한 놓기 영역을 콘텐츠 페이지에 추가합니다. 표준 구성 옵션 외에도 컨테이너의 HTML 태그, 표시 구조 등을 구성할 수 있습니다. 자세한 내용은 [프래그먼트 구성](./configuring-fragments.md) 을 참조하십시오.

![컨테이너에는 표준 및 고유 구성 옵션이 모두 포함됩니다.](./using-layout-elements/images/02.png)

## 그리드

> 이전에 호출된 *행*

그리드 조각은 여러 드롭 영역 모듈을 페이지 또는 템플릿에 추가합니다. 이러한 모듈은 수평 및 수직으로 배열할 수 있습니다. 표준 구성 옵션 외에도 각 그리드의 모듈 수, 행당 모듈 수 및 각 모듈 콘텐츠의 수직 정렬을 결정할 수 있습니다. 각 모듈의 너비를 수동으로 조정하고 모듈 사이에 패딩을 추가하거나 제거할 수 있습니다. 자세한 내용은 [프래그먼트 구성](./configuring-fragments.md) 을 참조하십시오.

![그리드에는 표준 및 고유 구성 옵션이 포함됩니다.](./using-layout-elements/images/03.png)

## 추가 정보

* [기본 조각 참조](./default-fragments-reference.md)
* [단편 구성 저장](./saving-fragment-compositions.md)
* [조각 구성](./configuring-fragments.md)
