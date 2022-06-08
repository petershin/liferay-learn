# ドーナツグラフ

ドーナツグラフはパーセンテージベースです。 ドーナツグラフは円グラフに似ていますが、中央に穴があります。 各データセットは、 [`SingleValueColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) の新しいインスタンスとして定義する必要があります。 次の手順に従って、ドーナツグラフを使用するようにポートレットを構成します。

1. Chart taglibを`DonutChartConfig`クラスと`SingleValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.donut.DonutChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    DonutChartConfig _donutChartConfig = new DonutChartConfig();

    _donutChartConfig.addColumns(
      new SingleValueColumn("data1", 30),
      new SingleValueColumn("data2", 70)
    );

    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_donutChartConfig`を渡します。

    ```jsp
    <chart:donut
      config="<%= _donutChartConfig %>"
    />
    ```

![ドーナツグラフは円グラフに似ていますが、中央に穴があります。](./donut-chart/images/01.png)

これで、アプリのドーナツグラフを作成する方法がわかりました。

## 関連トピック

* [ドーナツグラフ](./donut-chart.md)
* [Gauge Charts](./line-chart.md)
* [Pie Charts](./scatter-chart.md)