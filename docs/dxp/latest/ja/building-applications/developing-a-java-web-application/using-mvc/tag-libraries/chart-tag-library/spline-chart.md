# スプライングラフ

スプライングラフには、複数のデータセットが含まれています。 スプライングラフは、データのポイントを滑らかな曲線で接続します。 各データ系列（`addColumns()`メソッドで作成）は、IDと値のセットを受け取る`MultiValueColumn`オブジェクト</a> <!--\[`MultiValueColumn` object\](https://docs.liferay.com/dxp/apps/foundation/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html)--> の新しいインスタンスで定義されます。 次の手順に従って、スプライングラフを使用するようにポートレットを構成します。

1. Chart taglibを`SplineChartConfig`クラスと`MultiValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.spline.SplineChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    SplineChartConfig _splineChartConfig = new SplineChartConfig();

    _splineChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    }
    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_splineChartConfig`を渡します。

    ```jsp
    <chart:spline
      config="<%= _splineChartConfig %>"
    />
    ```

![スプライングラフは、データのポイントを滑らかな曲線で接続します。](./spline-chart/images/01.png)

必要に応じて、エリアスプライングラフを使用することもできます。 エリアスプライングラフは、スプライン曲線の下のエリアを強調表示します。

```jsp
<chart:area-spline 
  config="<%= _splineChartConfig %>" 
/>
```

![エリアスプライングラフは、スプライン曲線の下のエリアを強調表示します。](./spline-chart/images/02.png)

これで、アプリのスプライングラフを作成する方法がわかりました。

## 関連トピック

* [棒グラフ](./bar-chart.md)
* [散布図](./scatter-chart.md)
* [ステップグラフ](./step-chart.md)