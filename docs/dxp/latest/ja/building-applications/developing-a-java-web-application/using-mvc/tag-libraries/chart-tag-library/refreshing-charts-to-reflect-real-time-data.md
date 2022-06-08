# グラフを更新してリアルタイムデータを反映する

ポーリング間隔プロパティは、すべてのグラフのオプションのプロパティです。 グラフのデータが更新される時間をミリ秒単位で指定するものです。 このプロパティは、定期的に変更されるJSONファイルなど、あらゆる種類のリアルタイムデータを受信するグラフに使用できます。 これにより、チャートが最新になり、最新のデータが反映されるようになります。 次の手順に従って、リアルタイムデータを使用するようにグラフを構成します。

1. 新しいJavaスクリプトレットを追加し、グラフのオブジェクトの新しいインスタンスを作成して、データを`data`属性に配置します。 最後に、`setPollingInterval()`メソッドを使用してグラフのポーリング間隔を設定します。 `view.jsp`構成の例を以下に示します。

        ```java
        <%
        LineChartConfig _pollingIntervalLineChartConfig = new LineChartConfig();

        _pollingIntervalLineChartConfig.put("data", "/foo.json");

        _pollingIntervalLineChartConfig.setPollingInterval(2000);

        %>
        ```

1. 次の例に示すように、Chart taglibの`config`属性を、最後の手順で作成した更新された構成オブジェクトに設定します。

        ```jsp
        <chart:line
            componentId="polling-interval-line-chart"
            config="<%= _pollingIntervalLineChartConfig %>"
        />
        ```

![ポーリング間隔プロパティを使用すると、特定の間隔でグラフを更新して、リアルタイムデータを反映できます。](./refreshing-charts-to-reflect-real-time-data/images/01.gif)

これで、リアルタイムデータをグラフに反映する方法がわかりました。

## 関連トピック

* [組み合わせグラフ](./combination-chart.md)
* [ジオマップグラフ](./geomap-chart.md)
* [散布図](./scatter-chart.md)