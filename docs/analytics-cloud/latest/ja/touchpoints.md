---
toc:
  - ./touchpoints/sites-dashboard.md
  - ./touchpoints/pages.md
  - ./touchpoints/assets.md
  - ./touchpoints/events.md
---
# タッチ ポイント

タッチポイントは、ユーザーや顧客がブランドと相互作用するさまざまな方法を反映しています。 Analytics Cloudは、ページビューなどの従来のページアナリティクスと、包括的なサイト、パス、アセットに特化したアナリティクスデータを組み合わせた幅広いアナリティクスデータを提示します。

Analytics Cloudは、サイト全体の包括的なレポートを提供する [サイトワイド レポート ダッシュボード](./touchpoints/sites-dashboard.md) を提示します。 これにより、サイトのユニーク訪問者数、訪問者がどのページにアクセスし、どのような関心を持っているかなどを把握することができます。 [個別ページ](./touchpoints/pages/pages.md) のアナリティクスも簡単に見ることができる。 これには、閲覧数、訪問者数、直帰率などが含まれます。 [パス分析](./touchpoints/pages/paths.md) 訪問者がどのようにあなたのページにたどり着いたかを示します。 これには、訪問者がお客様のページの前にどのページを訪れたか、訪問者の位置やデバイスの種類などの情報が含まれます。 多くのLiferay DXP [アセット](./touchpoints/assets/assets.md) のパフォーマンスを追跡して、ページレベルよりも深く掘り下げて、サイトのパフォーマンスを改善する方法を判断することもできます。 [イベント分析](./touchpoints/events/events-analysis.md) を使えば、個人がどのようにサイトを訪れ、どのように交流しているかを分析することができます。

![The Touchpoints menu provides access to information about Sites, Pages, and Assets.](./touchpoints/images/01.png)

タッチポイントへの移動は、 [サイトダッシュボード](./touchpoints/sites-dashboard.md) から始まります。 タッチポイントでは、ページやアセットの追加分析も確認できます。

## ページデータの閲覧

サマリーデータのあるページの一覧を表示するには

![The Pages tab presents pages and several columns of data over a period of time.](./touchpoints/images/02.png)

1. タッチポイントセクションの［Sites］をクリックします。

1. ［Pages］ タブをクリックします。

これらのメトリクスのいずれかに基づいて、ページを昇順または降順に並べ替えます。

* 総訪問者数
* 総閲覧数
* 平均ページ滞在時間
* 平均直帰率
* 入口
* 離脱率

ページリストの順序付けのためのメトリクスは、期間メニュー（表の右上）で選択された期間に基づいて計算されます。 以下の期間が使用できます：

* 過去 24 時間
* 過去 7 日
* 過去30日間（デフォルト）
* 過去 90 日
* その他のプリセット期間（昨日、過去28日間、過去180日間、昨年）
* 期間を指定

このサイトページデータのリストをCSVファイルとしてダウンロードするには、 **Download Report** をクリックしてください。 詳しくは [ダウンロードレポート](./reference/downloading-reports.md) をご覧ください。

```{note}
ページデータは正規化URLに基づいています。 [canonicalization](https://moz.com/learn/seo/canonicalization) または [ページ単位での設定](https://learn.liferay.com/dxp/latest/ja/site-building/creating-pages/page-settings/configuring-individual-pages.html#seo) についてはこちらをご覧ください。
```

単一ページの詳細なメトリックを表示するには、テーブル内のそのページをクリックします。 詳しくは [Page Analytics](./touchpoints/pages/pages.md) を参照。

![The Visitor Behavior panel shows detailed statistics over a period of time.](./touchpoints/images/03.png)

## アセットデータの検索

アセットの分析データを見るには

![Asset Data is organized by asset type tabs.](./touchpoints/images/04.png)

1. ［タッチポイント］セクションで［Assets］をクリックします。

1. アセットタイプを選択します。ブログ、ドキュメントとメディア、フォーム、Webコンテンツ、またはカスタム

アセットのメトリクスのいずれかに基づいて、アセットを昇順または降順で並べるには、表中のメトリクスの見出しをクリックします。 アセットとアセットではメトリクスが異なります。 詳細は各アセットのドキュメントをご覧ください。 さらに、期間メニュー（表の右上）から次の値のいずれかを選択することで、選択した期間にわたるメトリクスを計算することができます。

* 過去 24 時間
* 昨日
* 過去 7 日
* 過去 28 日
* 過去30日間（デフォルト）
* 過去 90 日

リスト内のアセットをクリックすると、より詳細な情報が表示されます。

![Asset specific metrics data identifies viewing trends over time.](./touchpoints/images/05.png)

アセットの種類ごとに別々のリストがあることを覚えておいてください。 各アセットタイプのメトリクスの詳細は、その後の記事で解説しています。

## 次のステップ

* [サイトダッシュボード](./touchpoints/sites-dashboard.md)

### ページ

* [ページ](./touchpoints/pages/pages.md)
* [パス](./touchpoints/pages/paths.md)

### アセット

* [資産](./touchpoints/assets/assets.md)
* [ウェブコンテンツ](./touchpoints/assets/web-content.md)
* [ブログ](./touchpoints/assets/blogs.md)
* [フォーム](./touchpoints/assets/forms.md)
* [ドキュメントとメディア](./touchpoints/assets/documents-and-media.md)
* [カスタム資産の追跡](./touchpoints/assets/tracking-custom-assets.md)

### イベント

* [イベント分析](./touchpoints/events/events-analysis.md)
