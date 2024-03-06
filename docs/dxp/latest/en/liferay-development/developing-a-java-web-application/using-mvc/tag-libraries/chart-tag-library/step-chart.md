---
uuid: 38ed33c5-d05d-4681-87aa-d4db9b0a5de7
taxonomy-category-names:
- Development and Tooling
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
---
# Step Charts

Step charts contain multiple sets of data. A step chart steps between the points of data, resembling steps. Each data series (created with the `addColumns()` method) is defined with a new instance of the [`MultiValueColumn` object](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html), which takes an ID and a set of values. Follow these steps to configure your portlet to use step charts.

1. Import the chart taglib along with the `StepChartConfig` and `MultiValueColumn` classes into your bundle's `init.jsp` file:

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.step.StepChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. Add the following Java scriptlet to the top of your `view.jsp`:

    ```java
    <%
    StepChartConfig _stepChartConfig = new StepChartConfig();

    _stepChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    %>
    ```

1. Add the `<chart>` taglib to the `view.jsp`, passing the `_stepChartConfig` as the `config` attribute's value:

    ```jsp
    <chart:step
      config="<%= _stepChartConfig %>"
    />
    ```

![A step chart steps between the points of data, resembling steps.](./step-chart/images/01.png)

You can also use an area step chart if you prefer. An area step chart highlights the area covered by a step graph.

```jsp
<chart:area-step
  config="<%= _stepChartConfig %>"
/>
```

![An area step chart highlights the area covered by a step graph.](./step-chart/images/02.png)

Awesome! Now you know how to create step charts for your apps.

## Related Topics

* [Line Charts](./line-chart.md)
* [Spline Charts](./spline-chart.md)
* [Scatter Charts](./scatter-chart.md)