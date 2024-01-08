# 게이지 차트

게이지 차트는 백분율 기반입니다. 게이지 차트는 백분율 기반 데이터가 특정 범위에 속하는 사이트
를 보여줍니다. 각 데이터 세트는 [`SingleValueColumn` 개체](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) 의 새 인스턴스로 정의되어야 합니다. 게이지 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `GaugeChartConfig` 및 `SingleValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.gauge.GaugeChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
   ```

1. `view.jsp` 상단에 다음 Java 스크립틀릿을 추가합니다.

   ```java
   <%
   GaugeChartConfig _gaugeChartConfig = new GaugeChartConfig();

   _gaugeChartConfig.addColumn(
     new SingleValueColumn("data1", 85.4)
   );
   %>
   ```

1. `view.jsp`에 `<chart>`taglib를 추가하고 `_gaugeChartConfig`를 `config` 속성 값으로 전달합니다.

   ```jsp
   <chart:gauge
     config="<%= _gaugeChartConfig %>"
   />
   ```

![A gauge chart shows where percentage-based data falls over a given range.](./gauge-chart/images/01.png)

엄청난! 이제 앱용 게이지 차트를 만드는 방법을 알았습니다.

## 관련 주제

* [원형 차트](./pie-chart.md)
* [도넛 차트](./donut-chart.md)
* [막대 차트](./bar-chart.md)
