# 분산형 차트

분산형 차트에는 여러 데이터 집합이 포함됩니다. 분산형 차트는 데이터를 개별 포인트로 모델링합니다. 각 데이터 계열( `addColumns()` 메서드로 생성됨)은 ID와 일련의 값을 취하는  [`MultiValueColumn` 객체](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 의 새 인스턴스로 정의됩니다. 분산형 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `ScatterChartConfig` 및 `MultiValueColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.scatter.ScatterChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오.

    ```java
    <%
    ScatterChartConfig _scatterChartConfig = new ScatterChartConfig();

    _scatterChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    }
    %>
    ```

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_scatterChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:scatter
      config="<%= _scatterChartConfig %>"
    />
    ```

![분산형 차트는 데이터를 개별 포인트로 모델링합니다.](./scatter-chart/images/01.png)

엄청난! 이제 앱에 대한 분산형 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [단계 차트](./step-chart.md)
* [라인 차트](./line-chart.md)
* [스플라인 차트](./spline-chart.md)