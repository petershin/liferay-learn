# 折れ線グラフ

折れ線グラフには、複数のデータセットが含まれています。 折れ線グラフは、データを線形に表示します。 各データシリーズ（`addColumns()`メソッドで作成される）は、  [`MultiValueColumn` オブジェクトの新しいインスタンスで定義される](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 、IDと値のセットを取る。 次の手順に従って、折れ線グラフを使用するようにポートレットを構成します。

1. チャートタグライブを `LineChartConfig` と `MultiValueColumn` クラスと共にバンドルの `init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.point.line.LineChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   LineChartConfig _lineChartConfig = new LineChartConfig();

   _lineChartConfig.addColumns(
     new MultiValueColumn("data1", 100, 20, 30),
     new MultiValueColumn("data2", 20, 70, 100)
   );
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_lineChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:line
     config="<%= _lineChartConfig %>"
   />
   ```

![A Line chart displays the data linearly.](./line-chart/images/01.png)

これで、アプリの折れ線グラフを作成する方法がわかりました。

## 関連トピック

* [スプラインチャート](./spline-chart.md)
* [ステップチャート](./step-chart.md)
* [予測チャート](./predictive-chart.md)
