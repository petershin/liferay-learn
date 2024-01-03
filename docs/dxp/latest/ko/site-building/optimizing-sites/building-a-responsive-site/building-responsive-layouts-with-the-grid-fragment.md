# 그리드 조각으로 반응형 레이아웃 구축

<!--TASK: Reconsider article.-->

> 가용성: Liferay DXP 7.3+.

Liferay DXP [은 기본적으로 반응형 디자인](../building-a-responsive-site.md) 을 사용하지만 콘텐츠 레이아웃에 대한 추가적이고 세부적인 제어가 필요한 상황이 있습니다. 콘텐츠 페이지에서 [Grid Fragment](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) 사용하면 데스크톱 및 모바일 장치의 다양한 화면 크기에 대한 콘텐츠 레이아웃을 정밀하게 제어할 수 있습니다. 콘텐츠 페이지를 편집할 때 [그리드 조각(](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) )을 사용하여 콘텐츠의 윤곽을 잡고 장치 디스플레이 섹션(3)의 다양한 대상 장치에 대한 사용자 정의 레이아웃 스타일(2)을 정의할 수 있습니다. 예를 들어, 행당 모듈 수를 사용자 정의하거나 스마트폰 크기 화면에 대해서만 그리드 패딩 옵션을 사용자 정의할 수 있습니다.

![Using the Grid Fragment you can customize the layout options for different screen sizes.](./building-responsive-layouts-with-the-grid-fragment/images/04.png)

다음 예를 고려하십시오. 보험 회사 웹사이트의 서비스 섹션에서는 잠재 고객에게 귀하가 제공하는 서비스에 대한 개요를 제공합니다. 이 섹션에서는 세 가지 다른 서비스에 대한 정보와 함께 3개 모듈로 구성된 그리드 조각 내의 일련의 카드 조각을 사용합니다.

![You can customize your content layout combining the Grid Fragments with other Fragments.](./building-responsive-layouts-with-the-grid-fragment/images/01.png)

컴퓨터에서 이 '서비스' 콘텐츠 페이지에 액세스하면 그리드 레이아웃에 예상된 결과가 표시됩니다. 그러나 스마트폰에서 해당 페이지에 접속할 경우 텍스트의 양과 각 카드 조각의 너비로 인해 최적의 결과가 나오지 않습니다. 그리드 조각 스타일을 사용하면 각 모듈에 표시할 카드 수를 사용자 정의하고 다양한 화면 크기에서 최상의 보기 환경을 위해 스타일을 수정할 수 있습니다.

![The default grid layout style is not optimized for a smartphone-sized screen.](./building-responsive-layouts-with-the-grid-fragment/images/02.png)

## 그리드 조각의 레이아웃 수정

1. [콘텐츠 페이지에서 그리드 조각](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) 을 구성합니다.

1. 편집 사이드바에서 _브라우저_(![시뮬레이션](../../../images/icon-hierarchy.png)) 버튼을 클릭하고 사용자 정의하려는 그리드 조각을 클릭합니다.

1. 편집 도구 모음의 장치 디스플레이 섹션에서 최적화하려는 화면 크기를 선택하세요.

   ![Select the screen size you want to customize in the Device Display section.](./building-responsive-layouts-with-the-grid-fragment/images/06.png)

1. 구성 사이드바의 _일반_ 탭 아래에서 화면 크기에 대해 선호하는 레이아웃 옵션을 선택하세요. 예를 들어, _세로형 전화_ 레이아웃 옵션에서는 행당 하나의 모듈이 훨씬 더 잘 작동합니다.

1. 이미지를 선택하여 대상 화면 크기에 맞게 _해상도_를 구성하거나(Liferay DXP 7.4+에서 사용 가능) 기본 _자동_ 옵션을 그대로 두고 [Adaptive Media](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/using-adaptive-media.md) 사용합니다.

   ![Select the image resolution for the target screen size or leave the Auto option to use Adaptive Media.](./building-responsive-layouts-with-the-grid-fragment/images/05.png)

1. _게시_를 클릭하세요.

1. 선택적으로 기본 도구 모음에서 _시뮬레이션_(![시뮬레이션](../../../images/icon-simulation.png)) 버튼을 클릭하여 대상 장치의 변경 사항을 확인하세요.

```{tip}
다른 콘텐츠 페이지에서 선택한 그리드 조각 구성을 저장하고 재사용할 수 있습니다. 자세한 내용은 [조각 구성 저장](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md) 참조하세요.
```

## 관련 주제

* [반응형 사이트 구축](../building-a-responsive-site.md)
* [조각 구성 저장](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md)
* [레이아웃 요소 사용하기](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md)
