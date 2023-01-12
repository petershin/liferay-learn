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

タッチポイントは、ユーザーや顧客とブランドとのさまざまな関わり方を反映しています。 Analytics Cloudは、ページビューなどの従来のページ解析に加え、サイト、パス、アセット固有の包括的な解析データを組み合わせた、幅広い解析データを提供します。

Analytics Cloudは、サイト全体の包括的なレポートを提供する[サイトワイドレポートダッシュボード](./touchpoints/sites-dashboard.md)を提示します。これにより、サイトのユニークビジター数、ビジターがどのページにアクセスし、どのような関心を持っているかなどを把握することができます。 [個別ページ](./touchpoints/pages/pages.md)のアナリティクスも簡単に見ることができます。これには、閲覧数、訪問者数、直帰率などが含まれます。[パス解析](./touchpoints/pages/paths.md)では、訪問者がどのようにあなたのページにたどり着いたかを示します。これには、訪問者がお客様のページの前にどのページを訪れたか、訪問者の位置やデバイスの種類などの情報が含まれます。また、多くの Liferay DXP[アセット](./touchpoints/assets/assets.md)のパフォーマンスを追跡し、ページレベルより深く掘り下げて、サイトのパフォーマンスをどのように改善できるかを判断することができます。[イベント解析](./touchpoints/events/events-analysis.md)では、個人がどのようにサイトを訪問し、どのように交流しているかを分析することができます。

![タッチポイント」メニューでは、「サイト」「ページ」「アセット」に関する情報にアクセスできます。](./touchpoints/images/01.png)

Touchpoints へのナビゲーションは、まず [Sites Dashboard](./touchpoints/sites-dashboard.md)から始まります。 Touchpointsでは、その他のページや資産の分析も可能です。



## ページデータの表示

サマリーデータのあるPageの一覧を表示する。

![ページ」タブでは、一定期間のデータのページといくつかの列が表示されます。](./touchpoints/images/02.png)

1. タッチポイント」セクションから、「サイト」をクリックします。

1. ページ]タブをクリックします。

以下のいずれかの指標に基づいて、ページを昇順または降順に並べる。

* 総来場者数
* 総再生回数
* 平均ページ滞在時間
* 平均直帰率
* エントランス
* 退出率

ページ一覧の並び順の指標は、期間メニュー（表の右上）で選択した期間に基づいて計算されます。 以下の時間帯でご利用いただけます。

* 過去24時間
* 直近7日間
* 過去30日間（デフォルト）
* 過去90日間
* より多くのプリセット期間（昨日、過去28日間、過去180日間、過去1年間）
* カスタムレンジ



```{note}
ページデータは、canonical URLに基づいています。 [canonicalization](https://moz.com/learn/seo/canonicalization) または [DXP でカスタムカノニカル URL を設定する方法](https://learn.liferay.com/dxp/latest/en/site-building/creating-pages/page-settings/configuring-individual-pages.html#seo) について詳しく説明します。
```


1つのページの詳細な指標を表示するには、表中のそのページをクリックします。 詳しくは、 [Page Analytics](./touchpoints/pages/pages.md) をご覧ください。

![Visitor Behaviorパネルでは、一定期間の詳細な統計情報を表示します。](./touchpoints/images/03.png)



## アセットデータを探す

アセットに関する分析データを見ることができます。

![アセットデータは、アセットタイプのタブで構成されています。](./touchpoints/images/04.png)

1. Touchpoints」セクションから「Assets」をクリックします。

1. アセットタイプを選択します。ブログ、ドキュメントとメディア、フォーム、ウェブコンテンツ、カスタムのいずれかを選択します。

資産のメトリクスのいずれかに基づいて、資産を昇順または降順で並べるには、表中のメトリクスの見出しをクリックします。 資産によって指標は異なります。 詳しくは、各アセットのドキュメントをご覧ください。 また、期間メニュー（表の右上）から以下の値を選択することで、選択した期間での指標を算出することができます。

* 過去24時間
* 昨日
* 直近7日間
* 直近28日間
* 過去30日間（デフォルト）
* 過去90日間

リスト内のアセットをクリックすると、より詳細な情報が表示されます。

![資産別の指標データから、時系列での視聴傾向を把握することができます。](./touchpoints/images/05.png)

資産の種類によって、リストが分かれていることを忘れないでください。 各アセットタイプのメトリクスの詳細については、この後の記事で説明します。



## 次のステップ

- [サイトダッシュボード](./touchpoints/sites-dashboard.md)



### ページ

- [ページ](./touchpoints/pages/pages.md)
- [パス](./touchpoints/pages/paths.md)



### 資産

- [資産](./touchpoints/assets/assets.md)
- [ウェブコンテンツ](./touchpoints/assets/web-content.md)
- [ブログ](./touchpoints/assets/blogs.md)
- [フォーム](./touchpoints/assets/forms.md)
- [ドキュメントとメディア](./touchpoints/assets/documents-and-media.md)
- [カスタムアセットのトラッキング](./touchpoints/assets/tracking-custom-assets.md)



### イベント情報

- [イベント分析](./touchpoints/events/events-analysis.md)