# ゲージグラフ

ゲージグラフはパーセンテージベースです。 ゲージグラフは、パーセンテージベースのデータが特定の範囲内でどの位置にあるかを示します。 各データセットは、 [`SingleValueColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) の新しいインスタンスとして定義する必要があります。 次の手順に従って、ゲージグラフを使用するようにポートレットを構成します。

1. Chart taglibを`GaugeChartConfig`クラスと`SingleValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.gauge.GaugeChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    GaugeChartConfig _gaugeChartConfig = new GaugeChartConfig();

    _gaugeChartConfig.addColumn(
      new SingleValueColumn("data1", 85.4)
    );

    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_gaugeChartConfig`を渡します。

    ```jsp
    <chart:gauge
      config="<%= _gaugeChartConfig %>"
    />
    ```

![ゲージグラフは、パーセンテージベースのデータが特定の範囲内でどの位置にあるかを示します。](./gauge-chart/images/01.png)

これで、アプリのゲージグラフを作成する方法がわかりました。

## 関連トピック

* [ゲージグラフ](./gauge-chart.md)
* [ジオマップグラフ](./geomap-chart.md)
* [円グラフ](./pie-chart.md)