---
toc:
- ./chart-tag-library/bar-chart.md
- ./chart-tag-library/combination-chart.md
- ./chart-tag-library/donut-chart.md
- ./chart-tag-library/geomap-chart.md
- ./chart-tag-library/gauge-chart.md
- ./chart-tag-library/line-chart.md
- ./chart-tag-library/pie-chart.md
- ./chart-tag-library/predictive-chart.md
- ./chart-tag-library/scatter-chart.md
- ./chart-tag-library/spline-chart.md
- ./chart-tag-library/step-chart.md
- ./chart-tag-library/refreshing-charts-to-reflect-real-time-data.md
---
# チャートタグライブラリ

線、スプライン、棒、パイなど、チャートタグライブラリは、データのモデル化に必要なものを提供します。 各taglibは、対応する [Clayコンポーネント](https://github.com/liferay/clay/tree/2.x-stable/packages/clay-charts/src) へのアクセスを提供します。 これらのコンポーネントには、UIのデフォルト構成が含まれています。

アプリでChart taglibを使用するには、JSPに次の宣言を追加します。

```jsp
<%@ taglib prefix="chart" uri="http://liferay.com/tld/chart" %>
```

このセクションでは、Chart taglibを使用して作成できるグラフの種類について説明します。 各記事には、サンプルのJavaデータとレンダリングされた結果を表示する図とともに、一連のグラフの例が含まれています。

![Chart taglibを使用して、さまざまなタイプのグラフを作成できます。](./chart-tag-library/images/01.png)