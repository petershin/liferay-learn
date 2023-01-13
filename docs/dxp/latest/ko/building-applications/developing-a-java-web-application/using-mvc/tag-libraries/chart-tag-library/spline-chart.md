# 스플라인 차트

스플라인 차트에는 여러 데이터 세트가 포함되어 있습니다. 스플라인 차트는 부드러운 곡선으로 데이터 포인트를 연결합니다. 각 데이터 계열( `addColumns()` 메서드로 생성됨)은 `MultiValueColumn` 개체의 새 인스턴스로 정의됩니다.<!--\[`MultiValueColumn` object\](https://docs.liferay.com/dxp/apps/foundation/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html)-->, ID와 일련의 값을 사용합니다. 스플라인 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `SplineChartConfig` 및 `MultiValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.spline.SplineChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오.

    ```java
    <%
    SplineChartConfig _splineChartConfig = new SplineChartConfig();

    _splineChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    }
    %>
    ```

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_splineChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:spline
      config="<%= _splineChartConfig %>"
    />
    ```

![스플라인 차트는 부드러운 곡선으로 데이터 포인트를 연결합니다.](./spline-chart/images/01.png)

원하는 경우 영역 스플라인 차트를 사용할 수도 있습니다. 영역 스플라인 차트는 스플라인 곡선 아래 영역을 강조 표시합니다.

```jsp
<chart:area-spline 
  config="<%= _splineChartConfig %>" 
/>
```

![영역 스플라인 차트는 스플라인 곡선 아래 영역을 강조 표시합니다.](./spline-chart/images/02.png)

엄청난! 이제 앱에 대한 스플라인 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [막대 차트](./bar-chart.md)
* [분산형 차트](./scatter-chart.md)
* [단계 차트](./step-chart.md)