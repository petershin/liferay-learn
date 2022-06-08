# ステップグラフ

ステップグラフには、複数のデータセットが含まれています。 ステップグラフでは、データのポイント間に段差があり、階段に似ています。 各データ系列（`addColumns()`メソッドで作成）は、IDと値のセットを受け取る[`MultiValueColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html)の新しいインスタンスで定義されます。 次の手順に従って、ステップグラフを使用するようにポートレットを構成します。

1. Chart taglibを`StepChartConfig`クラスと`MultiValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.step.StepChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    StepChartConfig _stepChartConfig = new StepChartConfig();

    _stepChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    }
    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_stepChartConfig`を渡します。

    ```jsp
    <chart:step
      config="<%= _stepChartConfig %>"
    />
    ```

![ステップグラフでは、データのポイント間に段差があり、階段に似ています。](./step-chart/images/01.png)

必要に応じて、エリアステップグラフを使用することもできます。 エリアステップグラフは、ステップグラフでカバーされるエリアを強調表示します。

```jsp
<chart:area-step 
  config="<%= _stepChartConfig %>" 
/>
```

![エリアステップグラフは、ステップグラフでカバーされるエリアを強調表示します。](./step-chart/images/02.png)

これで、アプリのステップグラフを作成する方法がわかりました。

## 関連トピック

* [Line Charts](./line-chart.md)
* [Scatter Charts](./scatter-chart.md)
* [Spline Charts](./spline-chart.md)