# 실시간 데이터를 반영하기 위해 차트 새로 고침

폴링 간격 속성은 모든 차트에 대한 선택적 속성입니다. 차트의 데이터를 새로 고치는 시간을 밀리초 단위로 지정합니다. 주기적으로 변경되는 JSON 파일과 같은 모든 종류의 실시간 데이터를 수신하는 차트에 사용할 수 있습니다. 이렇게 하면 가장 최근 데이터를 반영하여 차트가 최신 상태가 됩니다. 실시간 데이터를 사용하도록 차트를 구성하려면 다음 단계를 따르세요.

1. 새 자바 스크립틀릿을 추가하고 차트 개체의 새 인스턴스를 만들고 데이터를 `데이터` 속성에 넣습니다. 마지막으로 `setPollingInterval()` 메서드로 차트의 폴링 간격을 설정합니다. `view.jsp` 구성의 예는 다음과 같습니다.

        ```java
        <%
        LineChartConfig _pollingIntervalLineChartConfig = new LineChartConfig();

        _pollingIntervalLineChartConfig.put("data", "/foo.json");

        _pollingIntervalLineChartConfig.setPollingInterval(2000);

        %>
        ```

1. 아래 예와 같이 chart taglib의 `config` 속성을 마지막 단계에서 생성한 업데이트된 구성 개체로 설정합니다.

        ```jsp
        <chart:line
            componentId="polling-interval-line-chart"
            config="<%= _pollingIntervalLineChartConfig %>"
        />
        ```

![폴링 간격 속성을 사용하면 지정된 간격으로 차트를 새로 고쳐 실시간 데이터를 반영할 수 있습니다.](./refreshing-charts-to-reflect-real-time-data/images/01.gif)

이제 차트에 실시간 데이터를 반영하는 방법을 알았습니다!

## 관련 항목

* [콤비네이션 차트](./combination-chart.md)
* [지역 지도 차트](./geomap-chart.md)
* [분산형 차트](./scatter-chart.md)