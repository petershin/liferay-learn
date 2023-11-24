# 사이트 구축 시작하기

사이트는 Liferay DXP의 기본 구성 요소입니다. 기본적으로 사이트는 추가 기능을 제공하는 콘텐츠 애플리케이션이 포함된 페이지 모음입니다.

Liferay DXP 인스턴스를 처음 시작하고 구성할 때 기본 사이트가 포함되어 있습니다. 기본적으로 인스턴스 이름은 **Liferay** 이지만, 이 값은 설정 마법사의 구성 또는 제어판의 [인스턴스 설정](../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) 을 통해 변경할 수 있습니다.

![Liferay DXP로 강력한 사이트를 구축할 수 있습니다.](./getting-started-with-site-building/images/01.png)

## 사이트 만들기

Liferay DXP에는 [사이트 구축](./sites/adding-a-site.md) 및 [페이지 생성](./creating-pages/adding-pages/adding-a-page-to-a-site.md)에 필요한 모든 도구가 포함되어 있습니다. 애플리케이션과 함께 미리 정의된 페이지 집합이 포함된 기존 [사이트 템플릿](./sites/site-templates.md)에서 사이트를 만들거나, 빈 사이트를 만들어 처음부터 새로 구축할 수 있습니다.

페이지도 마찬가지로 유연합니다. 여러 페이지 유형이 있습니다. 기존 [페이지 유형](./creating-pages/understanding-pages/understanding-pages.md) 에서 페이지를 만들거나 기본 [페이지 템플릿 중 하나](./creating-pages/adding-pages/creating-a-page-template.md)또는 직접 만든 페이지 템플릿에서 페이지를 만듭니다.

사이트와 페이지를 계층적으로 구성할 수 있습니다. 상위 사이트 또는 페이지에 대해 중첩 페이지(하위 페이지) 및 [중첩 사이트](./sites/site-hierarchies.md) (하위 사이트)를 원하는 만큼 추가할 수 있습니다. 다양한 조직, 직원 등을 위해 Liferay DXP 인스턴스 전체에 여러 사이트를 보유할 수 있습니다. [가져오기 및 내보내기 옵션](./sites/exporting-importing-site-pages-and-content.md)을 사용하여 사이트 간에 콘텐츠와 페이지를 공유할 수도 있습니다.

페이지 및 사이트 [탐색](./site-navigation/using-the-navigation-menus-application.md) 동작을 구성하는 것은 직관적이고 유연합니다. 페이지가 생성되면 탐색 메뉴에 자동으로 추가할 수 있습니다. 원하는 경우 페이지를 숨기거나 페이지 권한을 구성하여 페이지에 대한 사용자 액세스를 활성화/제한할 수 있습니다.

Liferay DXP는 사용자 경험을 방해하지 않고 사이트를 변경할 수 있는 도구도 제공합니다. 라이프레이 사이트를 단계적으로 관리할 수 있으므로 사용자에게 게시하기 전에 사이트에서 변경 사항을 적용하고 테스트할 수 있습니다. Liferay DXP의 [간행물](./publishing-tools/publications.md) 기능에서 이를 처리할 수 있습니다. 발행물을 사용하여 사용자에게 표시되는 라이브 사이트에 영향을 주지 않고 안전한 환경에서 사이트를 개발, 추적 및 업데이트할 수 있습니다.

## 콘텐츠 표시

Liferay DXP의 콘텐츠 관리 시스템(CMS)은 다양한 유형의 콘텐츠(예: 블로그, 이미지, 웹 콘텐츠 기사)를 생성, 관리 및 표시할 수 있는 다양한 도구를 제공합니다. [웹 콘텐츠 표시 위젯(](./displaying-content/additional-content-display-options/using-the-web-content-display-widget.md) )을 사용하여 원하는 웹 콘텐츠 기사를 표시할 수 있습니다.

여러 콘텐츠 유형을 혼합하여 게시하려는 경우 [에셋 게시자](./displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) 또는 [컬렉션](../site-building/displaying-content/additional-content-display-options/displaying-collections.md)을 사용할 수 있습니다. 에셋 퍼블리셔가 표시하는 콘텐츠를 수동으로 선택하거나 특정 기준에 따라 에셋을 동적으로 표시하도록 설정할 수 있어 사용자 경험을 폭넓게 제어할 수 있습니다. [Iframe 위젯](./displaying-content/additional-content-display-options/using-the-iframe-widget.md) 을 사용하거나 [임베디드 페이지](./creating-pages/understanding-pages/other-page-types.md#embedded) 를 생성하여 다른 웹사이트의 콘텐츠를 임베드할 수도 있습니다.

[조각](./creating-pages/page-fragments-and-widgets/using-fragments.md)에 따라 콘텐츠를 만들고 편집할 수 있습니다. 조각은 페이지를 작성하기 위해 정렬하고 결합할 수 있는 개별 코드 조각(CSS, HTML 및 JavaScript)입니다. Liferay는 즉시 사용 가능한 많은 조각을 제공합니다. 사용자 지정 솔루션이 필요한 경우, 수정하거나 [자신만의 조각을 생성할 수 있습니다](./developer-guide/developing-page-fragments/developing-fragments-intro.md).

각 콘텐츠에는 기본 랜딩 페이지가 있지만 [디스플레이 페이지 템플릿](./displaying-content/using-display-page-templates.md) 을 생성하여 사용자 지정할 수 있습니다. 디스플레이 페이지 템플릿은 웹 콘텐츠의 일부(제목, 본문, 이미지 등)를 조각에 매핑하므로 원하는 모양을 만들 수 있습니다.

![페이지 템플릿 표시를 사용하면 웹 콘텐츠를 페이지 조각에 매핑하여 원하는 디자인과 레이아웃으로 콘텐츠를 표시할 수 있습니다.](./getting-started-with-site-building/images/02.png)

## 사용자 경험 개인화

Liferay DXP의 [개인화 및 세분화](./personalizing-site-experience.md) 프레임워크를 사용하면 사용자의 관심사와 요구 사항에 대응하고 이를 충족하는 사이트 경험을 구축할 수 있습니다. [소속 조직 또는 사이트에서의 역할 등 특정 기준에 따라 사용자 세그먼트](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 를 생성한 다음, 이를 사용하여 사용자 인구 통계에 대해 [개인화된 페이지 레이아웃 및 콘텐츠](./personalizing-site-experience/experience-personalization/content-page-personalization.md) 를 표시하거나, [Analytics Cloud](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html) 와 통합하여 세그먼트 내 사용자의 행동을 분석하여 사이트와 상호 작용하는 방식을 확인할 수 있습니다. [사용자의 행동에 따라 콘텐츠를 추천할 수도 있습니다](./personalizing-site-experience/experience-personalization/understanding-content-recommendations.md).

<!-- Screenshot -->

## 사이트 사용자 지정 및 구성

사이트의 모양, 동작 및 기능을 수정하는 데 사용할 수 있는 [설정(](./site-settings/site-settings-ui-reference.md) )이 많이 있습니다. [사이트와 해당 콘텐츠를 필요에 따라](./site-settings/site-localization.md) 여러 언어로 쉽게 로컬라이즈할 수 있습니다.

사이트의 모양과 느낌은 [다른 테마를 사용하여 변경할 수 있습니다](../getting-started/changing-your-sites-appearance.md). 테마는 [Liferay 마켓플레이스](../system-administration/installing-and-managing-apps/using-marketplace.md)에서 다운로드하여 배포하거나 [에서 직접 테마를 생성할 수 있습니다](./site-appearance/themes/theme-development/getting-started/setting-up-an-environment-and-creating-a-theme.md). 테마는 사이트의 전체적인 모양과 느낌을 결정하고 페이지의 CSS, JavaScript 및 HTML을 정의합니다(FreeMarker 템플릿을 통해).  FreeMarker는 표준 HTML 요소를 결합하고 변수, 조건문, 루핑 등의 추가 이점을 제공합니다. 자세한 내용은 [테마 개발](./developer-guide.md) 을 참조하세요.

## 사이트 최적화

Liferay DXP는 사이트의 [검색 엔진 최적화(SEO) 순위](../site-building/displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md)높이기, [각 디바이스에 최적화된 반응형 페이지](./optimizing-sites/building-a-responsive-site.md) 만들기, [A/B 테스트를 통한 메시징 캠페인 개선](../site-building/optimizing-sites/ab-testing/ab-testing.md)등 사이트 최적화를 위한 다양한 도구와 기능을 제공합니다. A/B 테스트는 페이지의 현재 기본 변형과 페이지 변형을 비교하여 어떤 페이지가 주어진 목표(이탈률, 클릭 수 등)에 대해 더 나은 성과를 내는지 확인합니다. 이를 통해 사이트에 대해 데이터에 기반한 더 나은 의사 결정을 내릴 수 있으므로 그 어느 때보다 빠르게 사용자와 고객에게 서비스를 제공할 수 있습니다.
