# Combination Charts

組合せチャートには、他のチャートと少し違う点がある。組合せチャートでは、各データセットの表現タイプを定義しなければならない： `AREA`、`AREA_SPLINE`、`AREA_STEP`、`BAR`、`BUBBLE`、`DONUT`、`GAUGE`、`LINE`、`PIE`、`SCATTER`、`SPLINE`、`STEP`である。 コンビネーションチャートの各データセットは、 [`TypedMultiValueColumn` オブジェクトのインスタンスです](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/TypedMultiValueColumn.html) 。 各オブジェクトは、データのID、表現タイプ、および値を受け取ります。 次の手順に従って、組み合わせグラフを使用するようにポートレットを構成します。

1. チャートのタグライブラリを `CombinationChartConfig`、`MultiValueColumn`、`MultiValueColumn.Type` クラスと一緒にバンドルの `init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.combination.CombinationChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.TypedMultiValueColumn.Type" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

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

1. `<chart>`taglib を`view.jsp` に追加し、`_config`属性の値として`_combinationChartConfig` を渡す：

   ```jsp
   <chart:combination
     config="<%= _combinationChartConfig %>"
   />
   ```

![A combination chart displays a variety of data set types.](./combination-chart/images/01.png)

これで、アプリの組み合わせグラフを作成する方法がわかりました。

## 関連トピック

* [棒グラフ](./bar-chart.md)
* [ラインチャート](./line-chart.md)
* [ジオマップチャート](./geomap-chart.md)
