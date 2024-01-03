# 도넛 차트

도넛 차트는 백분율 기반입니다. 도넛형 차트는 원형 차트와 유사하지만 중앙에 구멍이 있습니다. 각 데이터 세트는 [`SingleValueColumn` 개체](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html)의 새 인스턴스로 정의되어야 합니다. 도넛 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `DonutChartConfig` 및 `SingleValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.donut.DonutChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
   ```

1. `view.jsp` 상단에 다음 Java 스크립틀릿을 추가합니다.

   ```java
   <%
   DonutChartConfig _donutChartConfig = new DonutChartConfig();

   _donutChartConfig.addColumns(
     new SingleValueColumn("data1", 30),
     new SingleValueColumn("data2", 70)
   );
   %>
   ```

1. `<chart>`taglib를 `view.jsp`에 추가하고 `_donutChartConfig`를 `config` 속성 값으로 전달합니다.

   ```jsp
   <chart:donut
     config="<%= _donutChartConfig %>"
   />
   ```

![A donut chart is similar to a pie chart, but it has a hole in the center.](./donut-chart/images/01.png)

엄청난! 이제 앱용 도넛 차트를 만드는 방법을 알았습니다.

## 관련 주제

* [원형 차트](./pie-chart.md) 
* [게이지 차트](./gauge-chart.md) 
* [막대 차트](./bar-chart.md) 
