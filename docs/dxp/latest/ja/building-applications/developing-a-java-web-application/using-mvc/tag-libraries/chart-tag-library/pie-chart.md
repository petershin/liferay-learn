# 円グラフ

円グラフはパーセンテージベースです。 円グラフは、パーセンテージベースのデータを個々の円のスライスとしてモデル化します。 各データセットは、 [`SingleValueColumn`オブジェクト](https://docs.liferay.com/ce/apps/frontend-taglib/latest/javadocs/com/liferay/frontend/taglib/chart/model/SingleValueColumn.html) の新しいインスタンスとして定義する必要があります。 次の手順に従って、円グラフを使用するようにポートレットを構成します。

1. Chart taglibを`PieChartConfig`クラスと`SingleValueColumn`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.percentage.pie.PieChartConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.SingleValueColumn" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。

    ```java
    <%
    PieChartConfig _pieChartConfig = new PieChartConfig();

    _pieChartConfig.addColumn(
      new SingleValueColumn("data1", 85.4)
    );

    %>
    ```

1. `<chart>` taglibを`view.jsp`に追加し、`config`属性の値として`_pieChartConfig`を渡します。

    ```jsp
    <chart:pie
      config="<%= _pieChartConfig %>"
    />
    ```

![円グラフは、パーセンテージベースのデータを個々の円のスライスとしてモデル化します。](./pie-chart/images/01.png)

これで、アプリの円グラフを作成する方法がわかりました。

## 関連トピック

* [ドーナツグラフ](./donut-chart.md)
* [円グラフ](./pie-chart.md)
* [Using Clay Taglibs in Your Portlet](../clay-tag-library.md)