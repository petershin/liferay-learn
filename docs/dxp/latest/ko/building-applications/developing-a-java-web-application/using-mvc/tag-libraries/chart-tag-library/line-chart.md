# 라인 차트

선형 차트에는 여러 데이터 세트가 포함되어 있습니다. 선형 차트는 데이터를 선형으로 표시합니다. 각 데이터 계열( `addColumns()` 메서드로 생성됨)은 ID와 일련의 값을 취하는  [`MultiValueColumn` 객체](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 의 새 인스턴스로 정의됩니다. 라인 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `LineChartConfig` 및 `MultiValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.line.LineChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오.

    ```java
    <%
    LineChartConfig _lineChartConfig = new LineChartConfig();

    _lineChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    }
    %>
    ```

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_lineChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:line
      config="<%= _lineChartConfig %>"
    />
    ```

![선형 차트는 데이터를 선형으로 표시합니다.](./line-chart/images/01.png)

엄청난! 이제 앱에 대한 선형 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [막대 차트](./bar-chart.md)
* [분산형 차트](./scatter-chart.md)
* [단계 차트](./step-chart.md)