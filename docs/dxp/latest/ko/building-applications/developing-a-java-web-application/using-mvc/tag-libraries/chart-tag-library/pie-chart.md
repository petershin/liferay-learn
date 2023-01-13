# 파이 차트

원형 차트는 백분율 기반입니다. 원형 차트는 백분율 기반 데이터를 개별 원형 조각으로 모델링합니다. 각 데이터 세트는 [`SingleValueColumn` 개체](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html)의 새 인스턴스로 정의되어야 합니다. 원형 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `PieChartConfig` 및 `SingleValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.pie.PieChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오.

    ```java
    <%
    PieChartConfig _pieChartConfig = new PieChartConfig();

    _pieChartConfig.addColumn(
      new SingleValueColumn("data1", 85.4)
    );

    %>
    ```

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_pieChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:pie
      config="<%= _pieChartConfig %>"
    />
    ```

![원형 차트는 백분율 기반 데이터를 개별 원형 조각으로 모델링합니다.](./pie-chart/images/01.png)

엄청난! 이제 앱에 대한 원형 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [도넛형 차트](./donut-chart.md)
* [파이 차트](./pie-chart.md)
* [포틀릿에서 Clay Taglib 사용](../clay-tag-library.md)