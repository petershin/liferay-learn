# ジオマップグラフ

ジオマップグラフを使用すると、指定された色範囲を指定して、地理に基づいてデータを視覚化できます。通常、明るい色は低いランクを表し、暗い色は高いランクを表します。 デフォルトの構成は、Clayグラフのジオマップコンポーネントから取得されます<!--\[geomap component\](https://github.com/liferay/clay/blob/develop/packages/clay-charts/src/Geomap.js#L233-L276)-->: 水色（#b1d4ff）から濃い青（#0065e4）の範囲で、場所の`pop_est`値（ジオマップのJSONファイルで指定）に基づいて地理をランク付けします。

![ジオマップグラフには、データを表すヒートマップが表示されます。](./geomap-chart/images/01.png)

次の手順に従って、ジオマップグラフを使用するようにポートレットを構成します。

1. Chart taglibを`GeomapConfig`クラス、`GeomapColor`クラス、`GeomapColorRange`クラスとともにバンドルの`init.jsp`ファイルにインポートします。

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapColor" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapColorRange" %>
    ```

1. 次のJavaスクリプトレットを`view.jsp`の先頭に追加します。 以下の2番目の構成例`_geomapConfig2`に示すように、色（最小の色と最大の色）は完全に構成可能です。 新しい`GeomapColorRange`を作成し、`setMax()`メソッドと`setMin()`メソッドを使用して最小および最大の色の値を設定します。 `setSelected()`メソッドを使用して、ハイライトの色（エリア上にマウスを置いたときに表示される色）を指定します。  `geomapColor.setValue()`メソッドを使用してJSONプロパティを指定し、ジオマップのランキングを決定します。 `setDataHREF()`メソッドを使用してJSONファイルパスを指定します。 次の例は、各場所の名前の長さに基づいてジオマップを表示します。

    ```java
    <%
    GeomapConfig _geomapConfig1 = new GeomapConfig();
    GeomapConfig _geomapConfig2 = new GeomapConfig();

    GeomapColor geomapColor = new GeomapColor();
    GeomapColorRange geomapColorRange = new GeomapColorRange();

    geomapColorRange.setMax("#b2150a");
    geomapColorRange.setMin("#ee3e32");

    geomapColor.setGeomapColorRange(geomapColorRange);

    geomapColor.setSelected("#a9615c");

    geomapColor.setValue("name_len");

    _geomapConfig2.setColor(geomapColor);

    StringBuilder sb = new StringBuilder();

    sb.append(_portletRequest.getScheme());
    sb.append(StringPool.COLON);
    sb.append(StringPool.SLASH);
    sb.append(StringPool.SLASH);
    sb.append(_portletRequest.getServerName());
    sb.append(StringPool.COLON);
    sb.append(_portletRequest.getServerPort());
    sb.append(_portletRequest.getContextPath());
    sb.append(StringPool.SLASH);
    sb.append("geomap.geo.json");

    _geomapConfig1.setDataHREF(sb.toString());
    _geomapConfig2.setDataHREF(sb.toString());
    );

    %>
    ```

1. 以下に示すように、サイズやマージンなど、ジオマップのスタイル情報とともに`<chart>` taglibを`view.jsp`に追加します。

    ```html
    <style type="text/css">
        .geomap {
            margin: 10px 0 10px 0;
        }
        .geomap svg {
            width: 100%;
            height: 500px !important;
        }
    </style>

    <chart:geomap
        config="<%= _geomapConfig1 %>"
        id="geomap-default-colors"
    />

    <chart:geomap
        config="<%= _geomapConfig2 %>"
        id="geomap-custom-colors"
    />
    ```

![ジオマップグラフは、希望するルックアンドフィールに合うようにカスタマイズできます。](./geomap-chart/images/02.png)

これで、アプリのジオマップグラフを作成する方法がわかりました。

## 関連トピック

* [Bar Charts](./bar-chart.md)
* [Gauge Charts](./gauge-chart.md)
* [Geomap Charts](./geomap-chart.md)