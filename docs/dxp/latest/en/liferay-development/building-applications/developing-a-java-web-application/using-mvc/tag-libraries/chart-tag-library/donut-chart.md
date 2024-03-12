---
uuid: 6ef274fb-4b15-4c54-b7d3-2651376a7066
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# Donut Charts

Donut charts are percentage-based. A donut chart is similar to a pie chart, but it has a hole in the center. Each data set must be defined as a new instance of the [`SingleValueColumn` object](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html). Follow these steps to configure your portlet to use donut charts.

1. Import the chart taglib along with the `DonutChartConfig` and `SingleValueColumn` classes into your bundle's `init.jsp` file:

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.donut.DonutChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
    ```

1. Add the following Java scriptlet to the top of your `view.jsp`:

    ```java
    <%
    DonutChartConfig _donutChartConfig = new DonutChartConfig();

    _donutChartConfig.addColumns(
      new SingleValueColumn("data1", 30),
      new SingleValueColumn("data2", 70)
    );
    %>
    ```

1. Add the `<chart>` taglib to the `view.jsp`, passing the `_donutChartConfig` as the `config` attribute's value:

    ```jsp
    <chart:donut
      config="<%= _donutChartConfig %>"
    />
    ```

![A donut chart is similar to a pie chart, but it has a hole in the center.](./donut-chart/images/01.png)

Awesome! Now you know how to create donut charts for your apps.

## Related Topics

* [Pie Charts](./pie-chart.md)
* [Gauge Charts](./gauge-chart.md)
* [Bar Charts](./bar-chart.md)