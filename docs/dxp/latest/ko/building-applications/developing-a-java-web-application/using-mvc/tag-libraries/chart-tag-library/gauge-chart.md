# 게이지 차트

게이지 차트는 백분율 기반입니다. 게이지 차트는 백분율 기반 데이터가 주어진 범위를 벗어나는 사이트를 보여줍니다. 각 데이터 세트는 [`SingleValueColumn` 개체](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html)의 새 인스턴스로 정의되어야 합니다. 게이지 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `GaugeChartConfig` 및 `SingleValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.gauge.GaugeChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오.

    ```java
    <%
    GaugeChartConfig _gaugeChartConfig = new GaugeChartConfig();

    _gaugeChartConfig.addColumn(
      new SingleValueColumn("data1", 85.4)
    );

    %>
    ```

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_gaugeChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:gauge
      config="<%= _gaugeChartConfig %>"
    />
    ```

![게이지 차트는 백분율 기반 데이터가 주어진 범위를 벗어나는 사이트를 보여줍니다.](./gauge-chart/images/01.png)

엄청난! 이제 앱에 대한 게이지 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [게이지 차트](./gauge-chart.md)
* [지역 지도 차트](./geomap-chart.md)
* [파이 차트](./pie-chart.md)