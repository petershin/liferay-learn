# グラフを更新してリアルタイムデータを反映する

ポーリング間隔プロパティは、すべてのグラフのオプションのプロパティです。 グラフのデータが更新される時間をミリ秒単位で指定するものです。 このプロパティは、定期的に変更されるJSONファイルなど、あらゆる種類のリアルタイムデータを受信するグラフに使用できます。 これにより、チャートが最新になり、最新のデータが反映されるようになります。 次の手順に従って、リアルタイムデータを使用するようにグラフを構成します。

1. 新しいjavaスクリプトレットを追加し、チャートのオブジェクトの新しいインスタンスを作成し、`data`属性にデータを入れます。 最後に、`setPollingInterval()`メソッドでチャートのポーリング間隔を設定する。 以下に`view.jsp`の設定例を示す：

    ```java
    <%
    LineChartConfig _pollingIntervalLineChartConfig = new LineChartConfig();

    _pollingIntervalLineChartConfig.put("data", "/foo.json");

    _pollingIntervalLineChartConfig.setPollingInterval(2000);
    %>
    ```

1. 下の例のように、チャート・タグリブの`config`属性に、最後のステップで作成した更新されたコンフィギュレーション・オブジェクトを設定します：

    ```jsp
    <chart:line
    	componentId="polling-interval-line-chart"
    	config="<%= _pollingIntervalLineChartConfig %>"
    />
    ```

![The polling interval property lets you refresh charts at a given interval to reflect real time data.](./refreshing-charts-to-reflect-real-time-data/images/01.gif)

これで、リアルタイムデータをグラフに反映する方法がわかりました。

## 関連トピック

* [棒グラフ](./bar-chart.md)
* [散布図](./scatter-chart.md)
* [ドーナツ・チャート](./donut-chart.md)
