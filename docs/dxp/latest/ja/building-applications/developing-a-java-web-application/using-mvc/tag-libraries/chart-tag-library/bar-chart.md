# Bar Charts

棒グラフには、複数のデータセットが含まれています。 棒グラフは、データを棒状にモデル化したものです。 各データシリーズ（`addColumns()`メソッドで作成される）は、 [`MultiValueColumn` オブジェクトの新しいインスタンスで定義される](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 、IDと値のセットを取る。 次の手順に従って、棒グラフを使用するようにポートレットを構成します。

1. チャートタグライブを `BarChartConfig` と `MultiValueColumn` クラスと共にバンドルの `init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.point.bar.BarChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   BarChartConfig _barChartConfig = new BarChartConfig();

   _barChartConfig.addColumns(
   	new MultiValueColumn("data1", 100, 20, 30),
   	new MultiValueColumn("data2", 20, 70, 100)
   );
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_barChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:bar
     config="<%= _barChartConfig %>"
   />
   ```

![A bar chart models the data in bars.](./bar-chart/images/01.png)

これで、アプリの棒グラフを作成する方法がわかりました。

## 関連トピック

* [ラインチャート](./line-chart.md)
* [ドーナツ・チャート](./donut-chart.md)
* [コンビネーション・チャート](./combination-chart.md)
