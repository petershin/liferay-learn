# スプライングラフ

スプライングラフには、複数のデータセットが含まれています。 スプライングラフは、データのポイントを滑らかな曲線で接続します。 各データシリーズ（`addColumns()`メソッドで作成される）は、 [`MultiValueColumn` オブジェクトの新しいインスタンスで定義される](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 、IDと値のセットを取る。 次の手順に従って、スプライングラフを使用するようにポートレットを構成します。

1. チャートタグライブを `SplineChartConfig` と `MultiValueColumn` クラスと一緒にバンドルの `init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.point.spline.SplineChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   SplineChartConfig _splineChartConfig = new SplineChartConfig();

   _splineChartConfig.addColumns(
     new MultiValueColumn("data1", 100, 20, 30),
     new MultiValueColumn("data2", 20, 70, 100));
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_splineChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:spline
     config="<%= _splineChartConfig %>"
   />
   ```

![A spline chart connects points of data with a smooth curve.](./spline-chart/images/01.png)

必要に応じて、エリアスプライングラフを使用することもできます。 エリアスプライングラフは、スプライン曲線の下のエリアを強調表示します。

```jsp
<chart:area-spline
  config="<%= _splineChartConfig %>"
/>
```

![An area spline chart highlights the area under the spline curve.](./spline-chart/images/02.png)

これで、アプリのスプライングラフを作成する方法がわかりました。

## 関連トピック

* [ラインチャート](./line-chart.md)
* [ステップチャート](./step-chart.md)
* [散布図](./scatter-chart.md)
