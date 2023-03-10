# 콘텐츠 성능 도구 정보

> 사용 가능: Liferay DXP/Portal 7.3+. 일부 콘텐츠 성능 옵션은 Liferay DXP/Portal 7.4부터만 사용할 수 있습니다.

콘텐츠 성능 도구는 트래픽 확보 채널 또는 시간 경과에 따른 조회수와 같은 콘텐츠의 성능 지표를 분석하기 위한 글로벌 애플리케이션입니다. 콘텐츠 팀은 콘텐츠 성능 도구를 사용하여 콘텐츠 전략을 주기적으로 평가하고 조정할 수 있습니다. 컨텐츠 성능 도구는 [디스플레이 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) 을 기반으로 하고 Liferay DXP 7.4부터 [컨텐츠](../../site-building/creating-pages/using-content-pages.md) 및 [위젯](../../site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.md) 페이지에 대해 자산에 사용할 수 있습니다.

콘텐츠 성능 도구를 사용하여 콘텐츠 성능을 정량적으로 분석하는 방법을 알아보려면 [콘텐츠 성능 도구를 사용하여 콘텐츠 메트릭 분석](./analyze-content-metrics-using-content-performance-tool.md)을 참조하십시오.

```{note}
사이트 및 자산 라이브러리에서 콘텐츠를 관리하고 감사하려면 [콘텐츠 대시보드](../content-dashboard/about-the-content-dashboard.md)를 사용하십시오.
```

다음 조건이 충족되면 콘텐츠 성능 도구에 액세스할 수 있습니다.

- Liferay DXP 인스턴스에 활성 [Liferay Analytics Cloud에 대한 연결](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics- cloud.html) 사이트가 동기화됩니다.
- 페이지 또는 콘텐츠에 대한 편집 권한이 있습니다.
- 콘텐츠가 콘텐츠 페이지, 위젯 페이지에 있거나 [디스플레이 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates/publishing-content-with -디스플레이 페이지.md).

## 콘텐츠 성능 도구에 액세스

**Content Performance**(![Content Performance](../../images/icon-analytics.png)) 버튼을 사용하여 Content Performance 도구를 열 수 있습니다.

- [웹 콘텐츠, 문서 및 미디어 또는 블로그 항목과 같은 표시 페이지 템플릿](#accessing-the-content-performance-tool-from-content-based-on-a-display-page-template) 기반 콘텐츠.
- [콘텐츠 또는 위젯 페이지](#accessing-the-content-performance-tool-from-content-or-widget-pages) (Liferay DXP 7.4+).
- [콘텐츠 대시보드](#accessing-the-content-performance-tool-from-the-content-dashboard) .

### 디스플레이 페이지 템플릿을 기반으로 하는 콘텐츠에서 콘텐츠 성능 도구에 액세스

표시 페이지 템플릿을 사용하면 고유한 URL을 사용하여 표시 페이지에 웹 콘텐츠, 문서 또는 블로그 항목을 표시할 수 있습니다. 자세한 내용은 [표시 페이지 템플릿으로 콘텐츠 표시](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)을 참조하십시오.

1. **사이트 관리** &rarr; **콘텐츠 & 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.
1. **웹 콘텐츠** 탭을 클릭합니다.
1. 검토할 웹 콘텐츠에 대해 **작업**(![액션](../../images/icon-actions.png)) 메뉴를 선택하고 **콘텐츠 보기** 을 선택합니다. 

   ```{note}
   *콘텐츠 보기* 옵션을 사용할 수 없는 경우 웹 콘텐츠가 디스플레이 페이지 템플릿을 사용하지 않는 것입니다.
   ```

![웹 콘텐츠에서 콘텐츠 성능 메트릭에 액세스합니다.](./about-the-content-performance-tool/images/04.png)

1. 보기 모드에서 [응용 프로그램 도구 모음](../../getting-started/navigating-dxp.md#applications-bar) 에 있는 **콘텐츠 성능**(![Content Performance](../../images/icon-analytics.png)) 아이콘을 클릭합니다.

### 콘텐츠 또는 위젯 페이지에서 콘텐츠 성능 도구에 액세스

1. **사이트 관리** &rarr; **사이트 빌더** &rarr; **페이지** 로 이동합니다.
1. 검토할 페이지에 대해 **작업**(![Actions](../../images/icon-actions.png)) 메뉴를 클릭하고 **보기** 를 선택합니다.
1. 응용 프로그램 도구 모음에서 **콘텐츠 성능**(![Content Performance](../../images/icon-analytics.png)) 아이콘을 클릭합니다.
   
   ![콘텐츠 또는 위젯 페이지에서 콘텐츠 성능 메트릭에 액세스합니다.](./about-the-content-performance-tool/images/03.png)

### 콘텐츠 대시보드에서 콘텐츠 성능 도구에 액세스

1. [콘텐츠 대시보드](../content-dashboard/content-dashboard-interface.md#accessing-the-content-dashboard) 을 엽니다.
1. [Contents list](../content-dashboard/content-dashboard-interface.md#contents-list) 에서 검토하려는 콘텐츠 옆에 있는 **Actions** 메뉴(![Actions Menu](../../images/icon-actions.png))를 클릭하고 **View Metrics** 을 선택합니다.
1. 또는 콘텐츠 위로 마우스를 이동하고 **콘텐츠 성능**(![View Metrics](../../images/icon-analytics.png)) 아이콘을 클릭합니다.

![콘텐츠 대시보드에서 콘텐츠 성능 메트릭에 액세스합니다.](./about-the-content-performance-tool/images/05.png)

```{note}
콘텐츠 성능 옵션을 사용할 수 없는 경우 콘텐츠가 하나 이상의 조건을 충족하지 않는 것입니다. 자세한 내용은 [콘텐츠 성능 도구 정보](#about-the-content-performance-tool) 를 참조하세요.
```

## 관련 정보

- [콘텐츠 성능 도구를 사용하여 콘텐츠 지표 분석](./analyze-content-metrics-using-content-performance-tool.md)
- [콘텐츠 대시보드 정보](../content-dashboard/about-the-content-dashboard.md)
- [콘텐츠의 범주 및 어휘 정의](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)
