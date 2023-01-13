# 콤비네이션 차트

콤비네이션 차트는 다른 차트와 약간의 차이가 있습니다. `` `<code> <code>`</code></code></code> `<code>`</code> `<code>` ``, `SCATTER`, `SPLINE`또는 `STEP`. 콤비네이션 차트의 각 데이터 세트는 `TypedMultiValueColumn` 개체의 인스턴스입니다. 각 개체는 ID, 표현 유형 및 데이터 값을 받습니다. 조합 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `CombinationChartConfig`, `MultiValueColumn`및 `MultiValueColumn.Type` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.combination.CombinationChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.TypedMultiValueColumn.Type" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오.

    ```java
    <%
    CombinationChartConfig _combinationChartConfig = 
    new CombinationChartConfig();

    _combinationChartConfig.addColumns(
      new TypedMultiValueColumn(
        "data1", Type.BAR, 30, 20, 50, 40, 60, 50),
      new TypedMultiValueColumn(
        "data2", Type.BAR, 200, 130, 90, 240, 130, 220),
      new TypedMultiValueColumn(
        "data3", Type.SPLINE, 300, 200, 160, 400, 250, 250),
      new TypedMultiValueColumn(
        "data4", Type.LINE, 200, 130, 90, 240, 130, 220),
      new TypedMultiValueColumn(
        "data5", Type.BAR, 130, 120, 150, 140, 160, 150),
      new TypedMultiValueColumn(
        "data6", Type.AREA, 90, 70, 20, 50, 60, 120));

    _combinationChartConfig.addGroup("data1", "data2");

    %>
    ```

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_combinationChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:combination
      config="<%= _combinationChartConfig %>"
    />
    ```

![조합 차트는 다양한 데이터 세트 유형을 표시합니다.](./combination-chart/images/01.png)

엄청난! 이제 앱에 대한 조합 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [막대 차트](./bar-chart.md)
* [도넛형 차트](./donut-chart.md)
* [파이 차트](./pie-chart.md)