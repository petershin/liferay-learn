# 棒グラフ

棒グラフには、複数のデータセットが含まれています。 棒グラフは、データを棒状にモデル化したものです。 各データ系列（`addColumns()`メソッドで作成）は、IDと値のセットを受け取る[`MultiValueColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html)の新しいインスタンスで定義されます。 次の手順に従って、棒グラフを使用するようにポートレットを構成します。

1. Chart taglibを`BarChartConfig`クラスと`MultiValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.bar.BarChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    BarChartConfig _barChartConfig = new BarChartConfig();

    _barChartConfig.addColumns(
        new MultiValueColumn("data1", 100, 20, 30),
        new MultiValueColumn("data2", 20, 70, 100)
    );

    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_barChartConfig`を渡します。

    ```jsp
    <chart:bar
      config="<%= _barChartConfig %>"
    />
    ```

![棒グラフは、データを棒状にモデル化したものです。](./bar-chart/images/01.png)

これで、アプリの棒グラフを作成する方法がわかりました。

## 関連トピック

* [Line Charts](./line-chart.md)
* [Scatter Charts](./scatter-chart.md)
* [Spline Charts](./spline-chart.md)