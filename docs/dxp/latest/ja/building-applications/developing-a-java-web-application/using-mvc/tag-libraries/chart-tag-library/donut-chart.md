# ドーナツグラフ

ドーナツグラフはパーセンテージベースです。 ドーナツグラフは円グラフに似ていますが、中央に穴があります。 各データセットは、 [`SingleValueColumn` オブジェクト](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) の新しいインスタンスとして定義されなければならない。 次の手順に従って、ドーナツグラフを使用するようにポートレットを構成します。

1. チャートタグリブを `DonutChartConfig` と `SingleValueColumn` クラスと共にバンドルの `init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.donut.DonutChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   DonutChartConfig _donutChartConfig = new DonutChartConfig();

   _donutChartConfig.addColumns(
     new SingleValueColumn("data1", 30),
     new SingleValueColumn("data2", 70)
   );
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_donutChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:donut
     config="<%= _donutChartConfig %>"
   />
   ```

![A donut chart is similar to a pie chart, but it has a hole in the center.](./donut-chart/images/01.png)

これで、アプリのドーナツグラフを作成する方法がわかりました。

## 関連トピック

* [円グラフ](./pie-chart.md)
* [ゲージチャート](./gauge-chart.md)
* [棒グラフ](./bar-chart.md)
