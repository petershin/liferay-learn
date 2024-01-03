# 실시간 데이터를 반영하기 위해 차트 새로 고침

폴링 간격 속성은 모든 차트에 대한 선택적 속성입니다. 차트 데이터를 새로 고치는 데 걸리는 시간을 밀리초 단위로 지정합니다. 주기적으로 변경되는 JSON 파일과 같은 모든 종류의 실시간 데이터를 수신하는 차트에 이 기능을 사용할 수 있습니다. 이렇게 하면 차트가 최신 데이터를 반영하여 최신 상태로 유지됩니다. 실시간 데이터를 사용하도록 차트를 구성하려면 다음 단계를 따르세요.

1. 새 Java 스크립틀릿을 추가하고 차트 개체의 새 인스턴스를 만든 다음 데이터를 `data` 속성에 넣습니다. 마지막으로 `setPollingInterval()` 메소드를 사용하여 차트의 폴링 간격을 설정합니다. 예시 `view.jsp` 구성은 아래와 같습니다:

    ```java
    <%
    LineChartConfig _pollingIntervalLineChartConfig = new LineChartConfig();

    _pollingIntervalLineChartConfig.put("data", "/foo.json");

    _pollingIntervalLineChartConfig.setPollingInterval(2000);
    %>
    ```

1. 아래 예와 같이 차트 taglib의 `config` 속성을 마지막 단계에서 생성한 업데이트된 구성 개체로 설정합니다.

    ```jsp
    <chart:line
    	componentId="polling-interval-line-chart"
    	config="<%= _pollingIntervalLineChartConfig %>"
    />
    ```

![The polling interval property lets you refresh charts at a given interval to reflect real time data.](./refreshing-charts-to-reflect-real-time-data/images/01.gif)

이제 차트에 실시간 데이터를 반영하는 방법을 알게 되었습니다!

## 관련 주제

* [막대 차트](./bar-chart.md) 
* [분산형 차트](./scatter-chart.md) 
* [도넛 차트](./donut-chart.md) 
