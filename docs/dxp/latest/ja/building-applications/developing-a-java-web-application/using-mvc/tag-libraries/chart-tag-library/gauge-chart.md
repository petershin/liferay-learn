# Gauge Charts

ゲージグラフはパーセンテージベースです。 ゲージグラフは、パーセンテージベースのデータが特定の範囲内でどの位置にあるかを示します。 各データセットは、 [`SingleValueColumn` オブジェクト](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) の新しいインスタンスとして定義されなければならない。 次の手順に従って、ゲージグラフを使用するようにポートレットを構成します。

1. チャートタグライブを `GaugeChartConfig` と `SingleValueColumn` クラスと一緒にバンドルの `init.jsp` ファイルにインポートします：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.gauge.GaugeChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   GaugeChartConfig _gaugeChartConfig = new GaugeChartConfig();

   _gaugeChartConfig.addColumn(
     new SingleValueColumn("data1", 85.4)
   );
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_gaugeChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:gauge
     config="<%= _gaugeChartConfig %>"
   />
   ```

![A gauge chart shows where percentage-based data falls over a given range.](./gauge-chart/images/01.png)

これで、アプリのゲージグラフを作成する方法がわかりました。

## 関連トピック

* [円グラフ](./pie-chart.md)
* [ドーナツ・チャート](./donut-chart.md)
* [棒グラフ](./bar-chart.md)
