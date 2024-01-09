# 분산형 차트

분산형 차트에는 여러 데이터 집합이 포함되어 있습니다. 분산형 차트는 데이터를 개별 포인트로 모델링합니다. 각 데이터 시리즈(`addColumns()` 메소드로 생성됨)는 ID와 값 세트를 사용하는  [`MultiValueColumn` 객체](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 의 새 인스턴스로 정의됩니다. 분산형 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `ScatterChartConfig` 및 `MultiValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.point.scatter.ScatterChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
   ```

1. `view.jsp` 상단에 다음 Java 스크립틀릿을 추가합니다.

   ```java
   <%
   ScatterChartConfig _scatterChartConfig = new ScatterChartConfig();

   _scatterChartConfig.addColumns(
     new MultiValueColumn("data1", 100, 20, 30),
     new MultiValueColumn("data2", 20, 70, 100));
   %>
   ```

1. `<chart>`taglib를 `view.jsp`에 추가하고 `_scatterChartConfig`를 `config` 속성 값으로 전달합니다.

   ```jsp
   <chart:scatter
     config="<%= _scatterChartConfig %>"
   />
   ```

![A scatter chart models the data as individual points.](./scatter-chart/images/01.png)

엄청난! 이제 앱에 대한 분산형 차트를 만드는 방법을 알았습니다.

## 관련 주제

* [꺾은선형 차트](./line-chart.md)
* [단계 차트](./step-chart.md)
* [예측 차트](./predictive-chart.md)
