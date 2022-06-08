# コンテンツパフォーマンスツールの説明

> 対応可能：Liferay DXP/Portal 7.3以降 一部のコンテンツパフォーマンスオプションは、Liferay DXP／Portal 7.4以降でのみ使用できます。

コンテンツパフォーマンスツールは、トラフィック取得チャネルや時間の経過に伴う閲覧数など、コンテンツのパフォーマンスメトリクスを分析するためのグローバルアプリケーションです。 コンテンツチームは、コンテンツパフォーマンスツールを使用して、コンテンツ戦略を定期的に評価して適用させることができます。 コンテンツパフォーマンスツールは、[表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)に基づいたアセットやLiferay DXP 7.4以降では、[コンテント](../../site-building/creating-pages/using-content-pages.md)ページと[ウィジェット](../../site-building/creating-pages/using-widget-pages/configuring-widgets/adding-widgets-to-a-page.md)ページに使用できます。

コンテンツパフォーマンスツールを使用してコンテンツパフォーマンスを定量的に分析する方法については、[Analyze Content Metrics Using the Content Performance Tool](./analyze-content-metrics-using-content-performance-tool.md)を参照してください。

```{note}
サイトおよびアセットライブラリ全体でコンテンツを管理および監査するには、[コンテンツダッシュボード](../content-dashboard/about-the-content-dashboard.md)を使用します。
```

次の条件が満たされると、コンテンツパフォーマンスツールにアクセスできます。

- Liferay DXPインスタンスに有効な[Liferay Analytics Cloudへの接続](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html)があり、サイトが同期されている。
- ページまたはコンテンツの編集権限がある。
- コンテンツがコンテントページ、ウィジェットページにあるか、または[表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)に基づいている。

## コンテンツパフォーマンスツールへのアクセス

*コンテンツパフォーマンス*（![Content Performance](../../images/icon-analytics.png)）ボタンを使用して、コンテンツパフォーマンスツールを開くことができます。

- Webコンテンツ、ドキュメントとメディア、ブログエントリーなど、[表示ページテンプレートに基づくコンテンツ](#accessing-the-content-performance-tool-from-content-based-on-a-display-page-template)。
- [コンテンツまたはウィジェットページ](#accessing-the-content-performance-tool-from-content-or-widget-pages) （Liferay DXP 7.4以降）。
- [コンテンツダッシュボード](#accessing-the-content-performance-tool-from-the-content-dashboard)。

### 表示ページテンプレートに基づくコンテンツからコンテンツパフォーマンスツールにアクセスする

表示ページテンプレートを使用すると、一意のURLを使用して、表示ページにWebコンテンツ、ドキュメント、またはブログエントリーを表示できます。 詳細については、[Displaying Content with Display Page Templates](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)をご覧ください。

1. *［サイト管理］* &rarr; *［Content & Data］* &rarr; *［Web Content］*に移動します。
1. *［Web Content］*タブをクリックします。
1. レビューするWebコンテンツについて、*アクション*（![操作](../../images/icon-actions.png)）メニューをクリックし、*［View Content］*を選択します。

   ```{note}
   *View Content*オプションが使用できない場合、Webコンテンツは表示ページテンプレートを使用していません。
   ```

   ![Webコンテンツのコンテンツパフォーマンスメトリクスにアクセスします。](./about-the-content-performance-tool/images/04.png)

1. 閲覧モードで、[アプリケーションツールバー](../../getting-started/navigating-dxp.md#applications-bar)の*コンテンツパフォーマンス* （![Content Performance](../../images/icon-analytics.png)）アイコンをクリックします。

### コンテンツまたはウィジェットページからコンテンツパフォーマンスツールにアクセスする

1. *［サイト管理］* &rarr; *［サイトビルダー］* &rarr; *［Pages］*に移動します。
1. レビューするページで、*アクション*（![Actions](../../images/icon-actions.png)）メニューをクリックし、*［表示］*を選択します。
1. アプリケーションツールバーの*コンテンツパフォーマンス* （![Content Performance](../../images/icon-analytics.png)）アイコンをクリックします。

   ![コンテントまたはウィジェットページのコンテンツパフォーマンスメトリクスにアクセスします。](./about-the-content-performance-tool/images/03.png)

### コンテンツダッシュボードからコンテンツパフォーマンスツールにアクセスする

1. [コンテンツダッシュボード](../content-dashboard/content-dashboard-interface.md#accessing-the-content-dashboard)を開きます。
1. [コンテンツリスト](../content-dashboard/content-dashboard-interface.md#contents-list)で、レビューするコンテンツの横にある*アクション*メニュー（![Actions Menu](../../images/icon-actions.png)）をクリックし、*［View Metrics］*を選択します。
1. または、コンテンツの上にカーソルを置き、*コンテンツパフォーマンス*（![View Metrics](../../images/icon-analytics.png)）アイコンをクリックします。

![コンテンツダッシュボードからコンテンツパフォーマンスメトリクスにアクセスします。](./about-the-content-performance-tool/images/05.png)

```{note}
コンテンツパフォーマンスオプションが使用できない場合、コンテンツは1つ以上の条件を満たしていません。 詳細については、[About the Content Performance Tool](#about-the-content-performance-tool)を参照してください。
```

## 関連情報

- [コンテンツパフォーマンスツールを使用したコンテンツメトリクスの分析](./analyze-content-metrics-using-content-performance-tool.md)
- [コンテンツダッシュボードについて](../content-dashboard/about-the-content-dashboard.md)
- [コンテンツのカテゴリとボキャブラリの定義](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)
