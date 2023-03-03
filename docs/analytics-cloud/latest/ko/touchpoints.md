---
toc:
- ./touchpoints/sites-dashboard.md
- ./touchpoints/pages.md
- ./touchpoints/assets.md
- ./touchpoints/events.md
---
# 터치포인트

```{toctree}
:maxdepth: 3

touchpoints/sites-dashboard.md
touchpoints/pages.md
touchpoints/assets.md
touchpoints/events.md
```

접점은 사용자와 고객이 브랜드와 상호 작용하는 다양한 방식을 반영합니다. Analytics Cloud는 페이지 보기와 같은 기존 페이지 분석을 포괄적인 사이트, 경로 및 자산별 분석 데이터와 결합하는 광범위한 분석 데이터를 제공합니다.

Analytics Cloud는 전체 사이트에 대한 포괄적인 보고서를 제공하는 [사이트 전체 보고 대시보드](./touchpoints/sites-dashboard.md) 를 제공합니다. 이렇게 하면 시간이 지남에 따라 사이트의 고유 방문자 수, 방문자가 액세스하는 페이지, 관심사 등을 이해할 수 있습니다. [개별 페이지](./touchpoints/pages/pages.md) 에 대한 분석도 쉽게 볼 수 있습니다. 여기에는 조회수, 방문자 및 이탈률이 포함됩니다. [경로 분석](./touchpoints/pages/paths.md) 은 방문자가 귀하의 페이지에 도달하는 방법을 보여줍니다. 여기에는 귀하보다 먼저 방문하는 페이지, 사이트 및 장치 유형에 대한 정보가 포함됩니다. 또한 많은 Liferay DXP [자산](./touchpoints/assets/assets.md) 의 성능을 추적하여 페이지 수준보다 더 깊이 드릴하여 사이트 성능을 개선할 수 있는 방법을 결정할 수 있습니다. [이벤트 분석](./touchpoints/events/events-analysis.md)을 사용하면 개인이 사이트를 방문하고 상호 작용하는 방식을 분석할 수 있습니다.

![터치포인트 메뉴는 사이트, 페이지 및 자산에 대한 정보에 대한 액세스를 제공합니다.](./touchpoints/images/01.png)

Touchpoints 탐색은 [사이트 대시보드](./touchpoints/sites-dashboard.md)에서 시작됩니다. Touchpoints에서 추가 페이지 및 자산 분석도 찾을 수 있습니다.

## 페이지 데이터 보기

요약 데이터가 있는 페이지 목록을 보려면,

![페이지 탭은 일정 기간 동안 페이지와 여러 데이터 열을 표시합니다.](./touchpoints/images/02.png)

1. 터치포인트 섹션에서 사이트를 클릭하십시오.

1. 페이지 탭을 클릭합니다.

다음 메트릭 중 하나를 기준으로 오름차순 또는 내림차순으로 페이지를 정렬합니다.

* 총 방문자
* 총 조회
* 페이지에 머문 평균 시간
* 평균 이탈률
* 입구
* 종료율

페이지 목록을 정렬하기 위한 지표는 기간 메뉴(표의 오른쪽 상단)에서 선택한 기간을 기준으로 계산됩니다. 다음 기간을 사용할 수 있습니다.

* 지난 24시간
* 지난 7일
* 지난 30일(기본값)
* 지난 90일
* 더 많은 사전 설정 기간(어제, 지난 28일, 지난 180일, 작년)
* 커스텀 범위

```{note}
페이지 데이터는 표준 URL을 기반으로 합니다. [canonicalization](https://moz.com/learn/seo/canonicalization) 또는 [DXP에서 맞춤 표준 URL을 설정하는 방법](https://learn.liferay.com/dxp/latest/en/site-building/creating-pages/page-settings/configuring-individual-pages.html#seo) .
```

단일 페이지에 대한 자세한 측정항목을 보려면 표에서 해당 페이지를 클릭하세요. 자세한 내용은 [페이지 분석](./touchpoints/pages/pages.md) 을 참조하십시오.

![방문자 행동 패널에는 일정 기간 동안의 자세한 통계가 표시됩니다.](./touchpoints/images/03.png)

## 자산 데이터 찾기

자산에 대한 분석 데이터를 보려면,

![자산 데이터는 자산 유형 탭으로 구성됩니다.](./touchpoints/images/04.png)

1. 터치포인트 섹션에서 자산을 클릭하십시오.

1. 자산 유형(블로그, 문서 및 미디어, 양식, 웹 콘텐츠 또는 사용자 지정)을 선택합니다.

자산의 지표 중 하나를 기준으로 자산을 오름차순 또는 내림차순으로 정렬하려면 표에서 지표의 제목을 클릭하십시오. 지표는 자산마다 다릅니다. 자세한 내용은 각 에셋 문서를 참조하세요. 또한 기간 메뉴(표 오른쪽 상단)에서 다음 값 중 하나를 선택하여 선택한 기간 동안의 지표를 계산할 수 있습니다.

* 지난 24시간
* 어제
* 지난 7일
* 지난 28일
* 지난 30일(기본값)
* 지난 90일

목록에서 자산을 클릭하면 보다 세분화된 세부 정보를 볼 수 있습니다.

![자산별 지표 데이터는 시간 경과에 따른 시청 추세를 식별합니다.](./touchpoints/images/05.png)

서로 다른 자산 유형에 대한 별도의 목록이 있음을 기억하십시오. 각 자산 유형의 메트릭에 대한 자세한 내용은 후속 문서에서 다룹니다.

## 다음 단계

- [사이트 대시보드](./touchpoints/sites-dashboard.md)

### 페이지

- [페이지](./touchpoints/pages/pages.md)
- [경로](./touchpoints/pages/paths.md)

### 자산

- [자산](./touchpoints/assets/assets.md)
- [웹 콘텐츠](./touchpoints/assets/web-content.md)
- [블로그](./touchpoints/assets/blogs.md)
- [양식](./touchpoints/assets/forms.md)
- [문서 및 미디어](./touchpoints/assets/documents-and-media.md)
- [사용자 정의 자산 추적](./touchpoints/assets/tracking-custom-assets.md)

### 이벤트

- [이벤트 분석](./touchpoints/events/events-analysis.md)