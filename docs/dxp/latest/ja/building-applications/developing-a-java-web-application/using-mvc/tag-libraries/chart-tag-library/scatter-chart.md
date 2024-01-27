# 散布図

散布図には、複数のデータセットが含まれています。 散布図は、データを個々のポイントとしてモデル化します。 各データシリーズ（`addColumns()`メソッドで作成される）は、  [`MultiValueColumn` オブジェクトの新しいインスタンスで定義される](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 、IDと値のセットを取る。 次の手順に従って、散布図を使用するようにポートレットを構成します。

1. チャートタグリブを `ScatterChartConfig` と `MultiValueColumn` クラスと一緒にバンドルの `init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.point.scatter.ScatterChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   ScatterChartConfig _scatterChartConfig = new ScatterChartConfig();

   _scatterChartConfig.addColumns(
     new MultiValueColumn("data1", 100, 20, 30),
     new MultiValueColumn("data2", 20, 70, 100));
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_scatterChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:scatter
     config="<%= _scatterChartConfig %>"
   />
   ```

![A scatter chart models the data as individual points.](./scatter-chart/images/01.png)

これで、アプリの散布図を作成する方法がわかりました。

## 関連トピック

* [ラインチャート](./line-chart.md)
* [ステップチャート](./step-chart.md)
* [予測チャート](./predictive-chart.md)
