# 散布図

散布図には、複数のデータセットが含まれています。 散布図は、データを個々のポイントとしてモデル化します。 各データ系列（`addColumns()`メソッドで作成）は、IDと値のセットを受け取る [`MultiValueColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) の新しいインスタンスで定義されます。 次の手順に従って、散布図を使用するようにポートレットを構成します。

1. Chart taglibを`ScatterChartConfig`クラスと`MultiValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.scatter.ScatterChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    ScatterChartConfig _scatterChartConfig = new ScatterChartConfig();

    _scatterChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    }
    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_scatterChartConfig`を渡します。

    ```jsp
    <chart:scatter
      config="<%= _scatterChartConfig %>"
    />
    ```

![散布図は、データを個々のポイントとしてモデル化します。](./scatter-chart/images/01.png)

これで、アプリの散布図を作成する方法がわかりました。

## 関連トピック

* [ステップグラフ](./step-chart.md)
* [折れ線グラフ](./line-chart.md)
* [スプライングラフ](./spline-chart.md)