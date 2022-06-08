# 組み合わせグラフ

組み合わせグラフは、他のグラフとわずかな違いがあります。 組み合わせグラフでは、各データセットの表現タイプ（`AREA`、`AREA_SPLINE`、`AREA_STEP`、`BAR`、`BUBBLE`、`DONUT`、`GAUGE`、`LINE`、`PIE`、`SCATTER`、`SPLINE`、`STEP`）を定義する必要があります。 組み合わせグラフの各データセットは、`TypedMultiValueColumn`オブジェクトのインスタンスです。 各オブジェクトは、データのID、表現タイプ、および値を受け取ります。 次の手順に従って、組み合わせグラフを使用するようにポートレットを構成します。

1. Chart taglibを`CombinationChartConfig`クラス、`MultiValueColumn`クラス、`MultiValueColumn.Type`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.combination.CombinationChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.TypedMultiValueColumn.Type" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    CombinationChartConfig _combinationChartConfig = 
    new CombinationChartConfig();

    _combinationChartConfig.addColumns(
      new TypedMultiValueColumn(
        "data1", Type.BAR, 30, 20, 50, 40, 60, 50),
      new TypedMultiValueColumn(
        "data2", Type.BAR, 200, 130, 90, 240, 130, 220),
      new TypedMultiValueColumn(
        "data3", Type.SPLINE, 300, 200, 160, 400, 250, 250),
      new TypedMultiValueColumn(
        "data4", Type.LINE, 200, 130, 90, 240, 130, 220),
      new TypedMultiValueColumn(
        "data5", Type.BAR, 130, 120, 150, 140, 160, 150),
      new TypedMultiValueColumn(
        "data6", Type.AREA, 90, 70, 20, 50, 60, 120));

    _combinationChartConfig.addGroup("data1", "data2");

    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_combinationChartConfig` を渡します。

    ```jsp
    <chart:combination
      config="<%= _combinationChartConfig %>"
    />
    ```

![組み合わせグラフには、さまざまなデータセットのタイプが表示されます。](./combination-chart/images/01.png)

これで、アプリの組み合わせグラフを作成する方法がわかりました。

## 関連トピック

* [Bar Charts](./bar-chart.md)
* [Donut Charts](./donut-chart.md)
* [Pie Charts](./pie-chart.md)