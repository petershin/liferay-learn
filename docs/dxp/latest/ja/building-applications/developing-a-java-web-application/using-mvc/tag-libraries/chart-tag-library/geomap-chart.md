# ジオマップグラフ

ジオマップグラフを使用すると、指定された色範囲を指定して、地理に基づいてデータを視覚化できます。通常、明るい色は低いランクを表し、暗い色は高いランクを表します。 デフォルトの設定は、クレイチャートのジオマップコンポーネント <!-- [geomap component](https://github.com/liferay/clay/blob/develop/packages/clay-charts/src/Geomap.js#L233-L276) --> : 水色 (#b1d4ff) から濃い青 (#0065e4) までの範囲で、場所の `pop_est` 値 (ジオマップの JSON ファイルで指定) に基づいて地理をランク付けします。

![A Geomap chart displays a heatmap representing the data.](./geomap-chart/images/01.png)

次の手順に従って、ジオマップグラフを使用するようにポートレットを構成します。

1. chart taglib と `GeomapConfig`、`GeomapColor`、`GeomapColorRange` クラスをバンドルの `init.jsp` ファイルにインポートします：

   ```jsp
   <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapConfig" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapColor" %>
   <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapColorRange" %>
   ```

1. 以下のJavaスクリプトレットを`view.jsp`の先頭に追加する。 色---最小値を表す色と最大値を表す色---は、以下の2番目の設定例に示すように、完全に設定可能である：`_geomapConfig2`。 新しい `GeomapColorRange` を作成し、`setMax()`メソッドと`setMin()` メソッドで色の最小値と最大値を設定する。 `setSelected()`メソッドでハイライトカラー（マウスオーバーしたときに表示される色）を指定します。 `geomapColor.setValue()`メソッドを使用して、ジオマップの順位を決定するJSONプロパティを指定します。 `setDataHREF()`メソッドでJSONファイルパスを指定する。 次の例は、各場所の名前の長さに基づいてジオマップを表示します。

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
   %>
   ```

1. `<chart>`taglib を`view.jsp` に追加し、ジオマップのサイズや余白などのスタイリング情報を追加する：

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

![Geomap charts can be customized to fit the look and feel you desire.](./geomap-chart/images/02.png)

これで、アプリのジオマップグラフを作成する方法がわかりました。

## 関連トピック

* [棒グラフ](./bar-chart.md)
* [円グラフ](./pie-chart.md)
* [コンビネーション・チャート](./combination-chart.md)
