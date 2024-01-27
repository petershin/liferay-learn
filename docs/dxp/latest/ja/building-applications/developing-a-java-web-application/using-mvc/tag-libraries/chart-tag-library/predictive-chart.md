# 予測グラフ

予測グラフを使用すると、現在のデータと、特定の値の範囲内の予測/予想データを視覚化できます。

![Predicted/forecasted data is surrounded by a highlighted area of possible values.](./predictive-chart/images/01.png)

予測グラフを使用するには、次の手順に従います。

1. チャートタグリブを `PredictiveChartConfig` と `MixedDataColumn` クラスと一緒にバンドルの `init.jsp` ファイルにインポートします：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.predictive.PredictiveChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MixedDataColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する。 [`MixedDataColumn` オブジェクト](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MixedDataColumn.html) --- 各データ系列に対して、単一の数値と3つの数値の配列の両方をサポートする列 --- を追加する。 単一の数値は既存のデータを定義します。 数値の配列は予測/予想データとして使用され、最小値、推定値、最大値の3つの数値が含まれます。 推定値は塗りつぶされ、最小値と最大値で指定された境界線で強調表示された領域で囲まれます。 これにより、推定値を視覚化すると同時に、可能な値の範囲を把握できます。 各データ系列を追加するには `addDataColumn()` メソッドを使用する：

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

   \*\*axisXTickFormat:\*\*X軸の時間フォーマットを指定するオプションの文字列。 指定可能なフォーマットの詳細については、 [d3の時間フォーマットREADME](https://github.com/d3/d3-time-format/blob/master/README.md#locale_format) を参照してください。 この値は `setAxisXTickFormat()` メソッドで設定します。

   \*\*予測日：\*\*予測／予測が表示される時点を表す文字列としての日付。 この値はJavaScriptでDateオブジェクトとして解析され、`setPredictionDate()`メソッドを使って設定される。

   \*\*チャートのX軸に表示されるデータのタイムライン。 この値は日付の配列として設定される（例：`2018-01-01`）。

1. <chart>`taglib を`view\.jsp` に追加し、`_predictiveChartConfig`を`config\` 属性の値として渡す：

   ```jsp
   <chart:predictive
     config="<%= _predictiveChartConfig %>"
   />
   ```

水色の四角で囲まれた部分が、予測/予想値を示すポイントです。

![A predictive chart lets you visualize estimated future data alongside existing data.](./predictive-chart/images/02.png)

これで、アプリの予測グラフを作成する方法がわかりました。

## 関連トピック

- [ラインチャート](./line-chart.md) 
- [コンビネーション・チャート](./combination-chart.md) 
- [ジオマップチャート](./geomap-chart.md) 
