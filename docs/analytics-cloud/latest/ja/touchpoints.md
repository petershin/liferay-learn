---
toc:
  - ./touchpoints/sites-dashboard.md
  - ./touchpoints/pages.md
  - ./touchpoints/assets.md
  - ./touchpoints/events.md
---
# タッチポイント

```{toctree}
:maxdepth: 3

touchpoints/sites-dashboard.md
touchpoints/pages.md
touchpoints/assets.md
touchpoints/events.md
```

タッチポイントは、ユーザーや顧客がブランドと相互作用するさまざまな方法を反映しています。 Analytics Cloudは、ページビューなどの従来のページアナリティクスと、包括的なサイト、パス、アセットに特化したアナリティクスデータを組み合わせた幅広いアナリティクスデータを提示します。

Analytics Cloudは、サイト全体の包括的なレポートを提供する[サイトワイド レポート ダッシュボード](./touchpoints/sites-dashboard.md)を提示します。 これにより、サイトのユニーク訪問者数、訪問者がどのページにアクセスし、どのような関心を持っているかなどを把握することができます。 [個別ページ](./touchpoints/pages/pages.md)のアナリティクスも簡単に見ることができます。 これには、閲覧数、訪問者数、直帰率などが含まれます。 [パスアナリティクス](./touchpoints/pages/paths.md)は、訪問者がどのようにしてページにたどり着くかを示します。 これには、訪問者がお客様のページの前にどのページを訪れたか、訪問者の位置やデバイスの種類などの情報が含まれます。 多くのLiferay DXP[アセット](./touchpoints/assets/assets.md)のパフォーマンスを追跡して、ページレベルよりも深く掘り下げて、サイトのパフォーマンスを改善する方法を判断することもできます。 [イベントの分析](./touchpoints/events/events-analysis.md) では、個人がどのようにサイトを訪れ、どのように利用しているかを分析することができます。

![［タッチポイント］メニューでは、［サイト］［ページ］［アセット］に関する情報にアクセスすることができます。](./touchpoints/images/01.png)

タッチポイントは、 [サイトダッシュボード](./touchpoints/sites-dashboard.md)からアクセスします。 タッチポイントでは、ページやアセットの追加分析も確認できます。

## ページデータの閲覧

サマリーデータのあるページの一覧を表示するには

![［ページ］タブでは、ページや複数の列のデータが一定期間にわたって表示されます。](./touchpoints/images/02.png)

1. タッチポイントセクションの［Sites］をクリックします。

1. ［Pages］ タブをクリックします。

これらのメトリクスのいずれかに基づいて、ページを昇順または降順に並べ替えます。

* 総訪問者数
* 合計ビュー数
* 平均ページ滞在時間
* 平均直帰率
* 入口
* 離脱率

ページリストの順序付けのためのメトリクスは、期間メニュー（表の右上）で選択された期間に基づいて計算されます。 以下の期間が使用できます：

* 過去24時間
* 過去7日間
* 過去30日間（デフォルト）
* 過去90日間
* その他のプリセット期間（昨日、過去28日間、過去180日間、昨年）
* 期間を指定

```{note}
ページデータは正規化URLに基づいています。 [canonicalization](https://moz.com/learn/seo/canonicalization) または [ページ単位での設定](https://learn.liferay.com/dxp/latest/ja/site-building/creating-pages/page-settings/configuring-individual-pages.html#seo) について詳しく説明します。
```

単一ページの詳細なメトリックを表示するには、テーブル内のそのページをクリックします。 詳しくは、 [ページアナリティクス](./touchpoints/pages/pages.md) をご覧ください。

![［訪問者の行動］パネルでは、一定期間の詳細な統計が表示されます。](./touchpoints/images/03.png)

## アセットデータの検索

アセットの分析データを見るには

![アセットデータは、アセットタイプのタブで整理されています。](./touchpoints/images/04.png)

1. ［タッチポイント］セクションで［Assets］をクリックします。

1. アセットタイプを選択します。ブログ、ドキュメントとメディア、フォーム、Webコンテンツ、またはカスタム

アセットのメトリクスのいずれかに基づいて、アセットを昇順または降順で並べるには、表中のメトリクスの見出しをクリックします。 アセットとアセットではメトリクスが異なります。 詳細は各アセットのドキュメントをご覧ください。 さらに、期間メニュー（表の右上）から次の値のいずれかを選択することで、選択した期間にわたるメトリクスを計算することができます。

* 過去24時間
* 昨日
* 過去7日間
* 過去28日間
* 過去30日間（デフォルト）
* 過去90日間

リスト内のアセットをクリックすると、より詳細な情報が表示されます。

![アセット固有のメトリクスデータは、経時的に見る傾向を識別します。](./touchpoints/images/05.png)

アセットの種類ごとに別々のリストがあることを覚えておいてください。 各アセットタイプのメトリクスの詳細は、その後の記事で解説しています。

## 次のステップ

- [サイトダッシュボード](./touchpoints/sites-dashboard.md)

### ページ

- [ページ](./touchpoints/pages/pages.md)
- [パス](./touchpoints/pages/paths.md)

### アセット

- [アセット](./touchpoints/assets/assets.md)
- [Webコンテンツ](./touchpoints/assets/web-content.md)
- [ブログ](./touchpoints/assets/blogs.md)
- [フォーム](./touchpoints/assets/forms.md)
- [ドキュメントとメディア](./touchpoints/assets/documents-and-media.md)
- [カスタムアセットのトラッキング](./touchpoints/assets/tracking-custom-assets.md)

### イベント

- [イベントの分析](./touchpoints/events/events-analysis.md)
