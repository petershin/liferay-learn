# 예측 차트

예측 차트를 사용하면 주어진 값 범위 내에서 예측/예측 데이터와 함께 현재 데이터를 시각화할 수 있습니다.

![예측/예측 데이터는 가능한 값의 강조 표시된 영역으로 둘러싸여 있습니다.](./predictive-chart/images/01.png)

예측 차트를 사용하려면 다음 단계를 따르세요.

1. `PredictiveChartConfig` 및 `MixedDataColumn` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.predictive.PredictiveChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MixedDataColumn" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오. [`MixedDataColumn` 개체](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MixedDataColumn.html) ---각 데이터 계열에 대해 단일 숫자 값과 세 숫자 배열을 모두 지원하는 열을 추가합니다. 단일 숫자 값은 기존 데이터를 정의합니다. 숫자의 배열은 예측/예측 데이터로 사용되며 최소값, 추정값 및 최대값의 세 가지 숫자를 포함합니다. 예상 값은 실선으로 표시되고 최소값과 최대값으로 지정된 테두리가 있는 강조 표시된 영역으로 둘러싸여 있습니다. 이렇게 하면 예상 값을 시각화하는 동시에 가능한 값 범위에 대한 아이디어도 얻을 수 있습니다. `addDataColumn()` 메서드를 사용하여 각 데이터 계열을 추가합니다.

    ```java
    <%
    private PredictiveChartConfig _predictiveChartConfig = new
    PredictiveChartConfig();

    MixedDataColumn mixedDataColumn1 = new MixedDataColumn(
      "data1", 130, 340, 200, 500, 80, 240, 40,
      new Number[] {370, 400, 450}, new Number[] {210, 240, 270},
      new Number[] {150, 180, 210}, new Number[] {60, 90, 120},
      new Number[] {310, 340, 370});

    _predictiveChartConfig.addDataColumn(mixedDataColumn1);

    MixedDataColumn mixedDataColumn2 = new MixedDataColumn(
      "data2", 210, 160, 50, 125, 230, 110, 90,
      Arrays.asList(170, 200, 230), Arrays.asList(10, 40, 70),
      Arrays.asList(350, 380, 410), Arrays.asList(260, 290, 320),
      Arrays.asList(30, 70, 150));

    _predictiveChartConfig.addDataColumn(mixedDataColumn2);

    _predictiveChartConfig.setAxisXTickFormat("%b");

    _predictiveChartConfig.setPredictionDate("2018-07-01");

    List<String> timeseries = new ArrayList<>();

    timeseries.add("2018-01-01");
    timeseries.add("2018-02-01");
    timeseries.add("2018-03-01");
    timeseries.add("2018-04-01");
    timeseries.add("2018-05-01");
    timeseries.add("2018-06-01");
    timeseries.add("2018-07-01");
    timeseries.add("2018-08-01");
    timeseries.add("2018-09-01");
    timeseries.add("2018-10-01");
    timeseries.add("2018-11-01");
    timeseries.add("2018-12-01");

    _predictiveChartConfig.setTimeseries(timeseries);

    %>
    ```

    예측 차트에는 다음과 같은 속성이 있습니다.

    **axisXTickFormat:** X 축의 시간 형식을 지정하는 선택적 문자열입니다. 지정할 수 있는 형식에 대한 자세한 내용은 [d3의 시간 형식 README](https://github.com/d3/d3-time-format/blob/master/README.md#locale_format) 을 참조하십시오. 이 값은 `setAxisXTickFormat()` 메서드를 사용하여 설정됩니다.

    **예측 날짜:** 예측/예측이 표시되는 타임라인의 시점을 나타내는 문자열로 된 날짜입니다. 이 값은 JavaScript에서 Date 객체로 구문 분석되고 `setPredictionDate()` 메서드를 사용하여 설정됩니다.

    **시계열:** 차트의 X축에 표시되는 데이터의 타임라인입니다. 이 값은 날짜 배열로 설정됩니다(예:`2018-01-01`).

1. `<chart>` taglib를 `view.jsp`에 추가하고 `_predictiveChartConfig` 을 `config` 속성 값으로 전달합니다.

    ```jsp
    <chart:predictive
      config="<%= _predictiveChartConfig %>"
    />
    ```

하늘색 사각형 안에 포함된 영역은 예측/예측 값이 표시되는 지점입니다.

![예측 차트를 사용하면 예상 미래 데이터를 기존 데이터와 함께 시각화할 수 있습니다.](./predictive-chart/images/02.png)

엄청난! 이제 앱에 대한 예측 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [콤비네이션 차트](./combination-chart.md)
* [지역 지도 차트](./geomap-chart.md)
* [분산형 차트](./scatter-chart.md)