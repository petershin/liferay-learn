# 円グラフ

円グラフはパーセンテージベースです。 円グラフは、パーセンテージベースのデータを個々の円のスライスとしてモデル化します。 各データセットは、 [`SingleValueColumn` オブジェクト](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) の新しいインスタンスとして定義されなければならない。 次の手順に従って、円グラフを使用するようにポートレットを構成します。

1. チャートタグライブを `PieChartConfig` と `SingleValueColumn` クラスと共にバンドルの `init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.pie.PieChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   PieChartConfig _pieChartConfig = new PieChartConfig();

   _pieChartConfig.addColumn(
     new SingleValueColumn("data1", 85.4)
   );
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_pieChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:pie
     config="<%= _pieChartConfig %>"
   />
   ```

![A pie chart models percentage-based data as individual slices of pie.](./pie-chart/images/01.png)

これで、アプリの円グラフを作成する方法がわかりました。

## 関連トピック

* [ドーナツ・チャート](./donut-chart.md)
* [ゲージチャート](./gauge-chart.md)
* [スプラインチャート](./spline-chart.md)
