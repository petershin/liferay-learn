# 막대 차트

막대형 차트에는 여러 데이터 세트가 포함되어 있습니다. 막대 차트는 데이터를 막대로 모델링합니다. 각 데이터 계열( `addColumns()` 메서드로 생성됨)은 ID와 일련의 값을 취하는 [`MultiValueColumn` 객체](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html)의 새 인스턴스로 정의됩니다. 막대 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `BarChartConfig` 및 `MultiValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.bar.BarChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오.

    ```java
    <%
    BarChartConfig _barChartConfig = new BarChartConfig();

    _barChartConfig.addColumns(
        new MultiValueColumn("data1", 100, 20, 30),
        new MultiValueColumn("data2", 20, 70, 100)
    );

    %>
    ```

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_barChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:bar
      config="<%= _barChartConfig %>"
    />
    ```

![막대 차트는 데이터를 막대로 모델링합니다.](./bar-chart/images/01.png)

엄청난! 이제 앱에 대한 막대 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [라인 차트](./line-chart.md)
* [분산형 차트](./scatter-chart.md)
* [스플라인 차트](./spline-chart.md)