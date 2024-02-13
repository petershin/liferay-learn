---
toc:
- ./chart-tag-library/bar-chart.md
- ./chart-tag-library/combination-chart.md
- ./chart-tag-library/donut-chart.md
- ./chart-tag-library/geomap-chart.md
- ./chart-tag-library/gauge-chart.md
- ./chart-tag-library/line-chart.md
- ./chart-tag-library/pie-chart.md
- ./chart-tag-library/predictive-chart.md
- ./chart-tag-library/scatter-chart.md
- ./chart-tag-library/spline-chart.md
- ./chart-tag-library/step-chart.md
- ./chart-tag-library/refreshing-charts-to-reflect-real-time-data.md
---
# 차트 태그 라이브러리

선, 스플라인, 막대, 파이 등 차트 태그 라이브러리는 데이터를 모델링하는 데 필요한 모든 것을 제공합니다. 각 taglib는 해당 [Clay 구성 요소](https://github.com/liferay/clay/tree/2.x-stable/packages/clay-charts/src) 에 대한 액세스를 제공합니다. 이러한 구성 요소에는 UI의 기본 구성이 포함되어 있습니다.

앱에서 Chart taglib를 사용하려면 JSP에 다음 선언을 추가하십시오.

```jsp
<%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
```

이 섹션에서는 Chart taglibs로 생성할 수 있는 차트 유형에 대해 설명합니다. 각 문서에는 샘플 Java 데이터 및 렌더링된 결과를 표시하는 그림과 함께 일련의 차트 예제가 포함되어 있습니다.

![차트 taglibs를 사용하여 다양한 유형의 차트를 만들 수 있습니다.](./chart-tag-library/images/01.png)