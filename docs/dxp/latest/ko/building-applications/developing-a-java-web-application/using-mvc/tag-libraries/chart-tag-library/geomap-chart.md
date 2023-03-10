# 지역 지도 차트

Geomap 차트를 사용하면 지정된 색상 범위(일반적으로 더 낮은 순위를 나타내는 밝은 색상과 더 높은 순위를 나타내는 어두운 색상)가 지정된 지리 기반 데이터를 시각화할 수 있습니다. 기본 구성은 Clay 차트 지형도 구성 요소에서 가져옵니다. <!--\[geomap component\](https://github.com/liferay/clay/blob/develop/packages/clay-charts/src/Geomap.js#L233-L276)--> : 하늘색(#b1d4ff)에서 진한 파란색(#0065e4)까지의 범위이며 사이트의 `pop_est` 값(geomap의 JSON 파일에 지정됨)을 기준으로 지리 순위를 매깁니다.

![Geomap 차트는 데이터를 나타내는 히트맵을 표시합니다.](./geomap-chart/images/01.png)

지오맵 차트를 사용하도록 포틀릿을 구성하려면 다음 단계를 따르십시오.

1. `GeomapConfig`, `GeomapColor`및 `GeomapColorRange` 클래스와 함께 차트 taglib를 번들의 `init.jsp` 파일로 가져옵니다.

    ```jsp
    <%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapConfig" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapColor" %>
    <%@ page import="com.liferay.frontend.taglib.chart.model.geomap.GeomapColorRange" %>
    ```

1. 다음 Java 스크립틀릿을 `view.jsp`맨 위에 추가하십시오. 색상(최소 색상 및 최대 색상)은 아래의 두 번째 예제 구성과 같이 완전히 구성할 수 있습니다. `_geomapConfig2`. 새로운 `GeomapColorRange` 을 만들고 `setMax()` 및 `setMin()` 메서드를 사용하여 최소 및 최대 색상 값을 설정합니다. `setSelected()` 메서드를 사용하여 하이라이트 색상(영역 위로 마우스를 가져갈 때 표시되는 색상)을 지정합니다. `geomapColor.setValue()` 메서드를 사용하여 JSON 속성을 지정하여 geomap의 순위를 결정합니다. `setDataHREF()` 메서드로 JSON 파일 경로를 지정합니다. 아래 예는 각 사이트 이름의 길이를 기반으로 지리 지도를 표시합니다.

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

1. 아래와 같이 크기 및 여백과 같은 지리 지도에 대한 스타일 정보와 함께 `<chart>` taglib를 `view.jsp` 에 추가합니다.

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

![Geomap 차트는 원하는 모양과 느낌에 맞게 사용자 정의할 수 있습니다.](./geomap-chart/images/02.png)

엄청난! 이제 앱에 대한 지리 지도 차트를 만드는 방법을 알았습니다.

## 관련 항목

* [막대 차트](./bar-chart.md)
* [게이지 차트](./gauge-chart.md)
* [지역 지도 차트](./geomap-chart.md)