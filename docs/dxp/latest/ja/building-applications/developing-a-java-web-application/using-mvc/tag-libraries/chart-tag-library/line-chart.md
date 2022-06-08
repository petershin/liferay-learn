# 折れ線グラフ

折れ線グラフには、複数のデータセットが含まれています。 折れ線グラフは、データを線形に表示します。 各データ系列（`addColumns()`メソッドで作成）は、IDと値のセットを受け取る [`MultiValueColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/MultiValueColumn.html) の新しいインスタンスで定義されます。 次の手順に従って、折れ線グラフを使用するようにポートレットを構成します。

1. Chart taglibを`LineChartConfig`クラスと`MultiValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.point.line.LineChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.MultiValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    LineChartConfig _lineChartConfig = new LineChartConfig();

    _lineChartConfig.addColumns(
      new MultiValueColumn("data1", 100, 20, 30),
      new MultiValueColumn("data2", 20, 70, 100));
    }
    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_lineChartConfig`を渡します。

    ```jsp
    <chart:line
      config="<%= _lineChartConfig %>"
    />
    ```

![折れ線グラフは、データを線形に表示します。](./line-chart/images/01.png)

これで、アプリの折れ線グラフを作成する方法がわかりました。

## 関連トピック

* [棒グラフ](./bar-chart.md)
* [散布図](./scatter-chart.md)
* [ステップグラフ](./step-chart.md)