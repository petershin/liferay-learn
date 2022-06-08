# 予測グラフ

予測グラフを使用すると、現在のデータと、特定の値の範囲内の予測/予想データを視覚化できます。

![予測/予想データは、可能な値の強調表示された領域で囲まれています。](./predictive-chart/images/01.png)

予測グラフを使用するには、次の手順に従います。

1. Chart taglibを`PredictiveChartConfig`クラスと`MixedDataColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.predictive.PredictiveChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MixedDataColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。 データ系列ごとに、[`MixedDataColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MixedDataColumn.html)（単一の数値と3つの数値の配列の両方に対応する列）を追加します。 単一の数値は既存のデータを定義します。 数値の配列は予測/予想データとして使用され、最小値、推定値、最大値の3つの数値が含まれます。 推定値は塗りつぶされ、最小値と最大値で指定された境界線で強調表示された領域で囲まれます。 これにより、推定値を視覚化すると同時に、可能な値の範囲を把握できます。 `addDataColumn()`メソッドを使用して、各データ系列を追加します。

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

    予測グラフには、次のプロパティがあります。

    **axisXTickFormat：**X軸の時間フォーマットを指定するオプションの文字列。 指定できる形式の詳細については、[d3's time format README](https://github.com/d3/d3-time-format/blob/master/README.md#locale_format)を参照してください。 この値は、`setAxisXTickFormat()`メソッドを使用して設定されます。

    **予測日：** 予想/予測が表示されるタイムライン内の時点を表す文字列としての日付。 この値はJavaScriptでDateオブジェクトとして解析され、`setPredictionDate()`メソッドを使用して設定されます。

    **時系列：**グラフのX軸に表示されるデータのタイムライン。 この値は、日付の配列として設定されます（例：`2018-01-01` ）。

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_predictiveChartConfig`を渡します。

    ```jsp
    <chart:predictive
      config="<%= _predictiveChartConfig %>"
    />
    ```

水色の四角で囲まれた部分が、予測/予想値を示すポイントです。

![予測グラフを使用すると、既存のデータと一緒に将来の推定データを視覚化できます。](./predictive-chart/images/02.png)

これで、アプリの予測グラフを作成する方法がわかりました。

## 関連トピック

* [Combination Charts](./combination-chart.md)
* [Geomap Charts](./geomap-chart.md)
* [Scatter Charts](./scatter-chart.md)