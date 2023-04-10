# 그리드 조각으로 반응형 레이아웃 구축
<!--TASK: Reconsider article.-->
> 가용성: 라이프레이 DXP 7.3+.

Liferay DXP [은 기본적으로 반응형 디자인](./building-a-responsive-site.md) 을 사용하지만 콘텐츠 레이아웃을 추가로 보다 세밀하게 제어하려는 경우가 있습니다. 콘텐츠 페이지에서 [그리드 조각](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) 사용하면 데스크톱 및 모바일 장치의 다양한 화면 크기에 대한 콘텐츠 레이아웃을 정밀하게 제어할 수 있습니다. 콘텐츠 페이지를 편집할 때 [그리드 조각(](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md))을 사용하여 콘텐츠를 요약하고 장치 디스플레이 섹션(3)에서 다양한 대상 장치에 대한 사용자 정의 레이아웃 스타일(2)을 정의할 수 있습니다. 예를 들어 행당 모듈 수 또는 스마트폰 크기 화면 전용 그리드 패딩 옵션을 사용자 지정할 수 있습니다.

![Grid Fragment를 사용하여 다양한 화면 크기에 대한 레이아웃 옵션을 사용자 정의할 수 있습니다.](./building-responsive-layouts-with-the-grid-fragment/images/04.png)

다음 예를 고려하십시오. 보험 회사 웹사이트의 서비스 섹션에서는 잠재 고객에게 귀하가 제공하는 서비스에 대한 개요를 제공합니다. 이 섹션에서는 3개의 다른 서비스에 대한 정보와 함께 3개의 모듈 그리드 조각 내에서 일련의 카드 조각을 사용합니다.

![그리드 조각을 다른 조각과 결합하여 콘텐츠 레이아웃을 사용자 지정할 수 있습니다.](./building-responsive-layouts-with-the-grid-fragment/images/01.png)

컴퓨터에서 이 '서비스' 콘텐츠 페이지에 액세스하면 그리드 레이아웃에 예상 결과가 표시됩니다. 그러나 스마트폰에서 페이지에 접속하면 텍스트의 양과 각 Card Fragment의 너비 때문에 결과가 최적이 아닙니다. Grid Fragment Styles를 사용하여 각 모듈에 표시할 카드 수를 사용자 정의하고 다양한 화면 크기에서 최상의 시청 경험을 위해 스타일을 수정할 수 있습니다.

![기본 그리드 레이아웃 스타일은 스마트폰 크기 화면에 최적화되어 있지 않습니다.](./building-responsive-layouts-with-the-grid-fragment/images/02.png)

## 그리드 조각의 레이아웃 수정

1. [콘텐츠 페이지에서 그리드 조각](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) 을 구성합니다.
1. 편집 사이드바에서 **브라우저**(![Simulation](../../../images/icon-hierarchy.png)) 버튼을 클릭하고 사용자 지정하려는 그리드 조각을 클릭합니다.
1. 편집 도구 모음의 장치 디스플레이 섹션에서 최적화하려는 화면 크기를 선택합니다.

    ![장치 디스플레이 섹션에서 사용자 지정하려는 화면 크기를 선택합니다.](./building-responsive-layouts-with-the-grid-fragment/images/06.png)

1. 구성 사이드바의 **일반** 탭에서 화면 크기에 대한 기본 레이아웃 옵션을 선택합니다. 예를 들어 행당 하나의 모듈은 **세로 전화** 레이아웃 옵션에서 훨씬 더 잘 작동합니다.
1. 대상 화면 크기(Liferay DXP 7.4+에서 사용 가능)에 대해 **해상도** 구성할 이미지를 선택하거나 기본 **Auto** 옵션을 그대로 두고 [Adaptive Media](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/serving-device-and-screen-optimized-media/how-adaptive-media-works.md) 사용합니다.

    ![대상 화면 크기에 대한 이미지 해상도를 선택하거나 적응형 미디어를 사용하려면 자동 옵션을 그대로 둡니다.](./building-responsive-layouts-with-the-grid-fragment/images/05.png)

1. **게시** 클릭합니다.
1. 선택적으로 기본 도구 모음에서 **시뮬레이션**(![Simulation](../../../images/icon-simulation.png)) 버튼을 클릭하여 대상 장치에서 변경 사항을 확인합니다.

```{tip}
다른 콘텐츠 페이지에서 선택한 그리드 조각 구성을 저장하고 재사용할 수 있습니다. 자세한 내용은 [Fragment Compositions 저장](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md)을 참조하세요.
```

## 추가 정보

- [반응형 사이트 구축 개요](./building-a-responsive-site.md)
- [단편 구성 저장](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md)
- [레이아웃 요소 사용](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md)
