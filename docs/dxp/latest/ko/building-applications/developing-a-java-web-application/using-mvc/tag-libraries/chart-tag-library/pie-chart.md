# 원형 차트

파이 차트는 백분율 기반입니다. 파이 차트는 백분율 기반 데이터를 개별 파이 조각으로 모델링합니다. 각 데이터 집합은 [`SingleValueColumn` 객체](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) 의 새 인스턴스로 정의해야 합니다. 파이 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르세요.

1. `PieChartConfig` 및 `SingleValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.pie.PieChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
   ```

1. `view.jsp` 상단에 다음 Java 스크립틀릿을 추가합니다.

   ```java
   <%
   PieChartConfig _pieChartConfig = new PieChartConfig();

   _pieChartConfig.addColumn(
     new SingleValueColumn("data1", 85.4)
   );
   %>
   ```

1. `view.jsp`에 `<chart>`taglib를 추가하고 `_pieChartConfig`를 `config\` 속성 값으로 전달합니다.

   ```jsp
   <chart:pie
     config="<%= _pieChartConfig %>"
   />
   ```

![A pie chart models percentage-based data as individual slices of pie.](./pie-chart/images/01.png)

엄청난! 이제 앱에 대한 원형 차트를 만드는 방법을 알았습니다.

## 관련 주제

* [도넛 차트](./donut-chart.md)
* [게이지 차트](./gauge-chart.md)
* [스플라인 차트](./spline-chart.md)
