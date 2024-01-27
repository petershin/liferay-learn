# ステップグラフ

ステップグラフには、複数のデータセットが含まれています。 ステップグラフでは、データのポイント間に段差があり、階段に似ています。 各データシリーズ（`addColumns()`メソッドで作成される）は、 [`MultiValueColumn` オブジェクトの新しいインスタンスで定義される](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/frontend-taglib/com.liferay.frontend.taglib.chart/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) 、IDと値のセットを取る。 次の手順に従って、ステップグラフを使用するようにポートレットを構成します。

1. StepChartConfig`と`MultiValueColumn`クラスと一緒に chart taglib をバンドルの`init.jsp` ファイルにインポートする：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.point.step.StepChartConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する：

   ```java
   <%
   StepChartConfig _stepChartConfig = new StepChartConfig();

   _stepChartConfig.addColumns(
     new MultiValueColumn("data1", 100, 20, 30),
     new MultiValueColumn("data2", 20, 70, 100));
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、`_stepChartConfig`を`config` 属性の値として渡す：

   ```jsp
   <chart:step
     config="<%= _stepChartConfig %>"
   />
   ```

![A step chart steps between the points of data, resembling steps.](./step-chart/images/01.png)

必要に応じて、エリアステップグラフを使用することもできます。 エリアステップグラフは、ステップグラフでカバーされるエリアを強調表示します。

```jsp
<chart:area-step
  config="<%= _stepChartConfig %>"
/>
```

![An area step chart highlights the area covered by a step graph.](./step-chart/images/02.png)

これで、アプリのステップグラフを作成する方法がわかりました。

## 関連トピック

* [ラインチャート](./line-chart.md)
* [スプラインチャート](./spline-chart.md)
* [散布図](./scatter-chart.md)
