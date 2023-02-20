---
toc:
- ./using-display-page-templates.md
- ./using-display-page-templates/creating-and-managing-display-page-templates.md
- ./using-display-page-templates/publishing-content-with-display-pages.md
- ./using-display-page-templates/displaying-categories-using-display-pages.md
- ./using-display-page-templates/configuring-seo-and-open-graph.md
---
# 表示ページテンプレートの使用

```{toctree}
:maxdepth: 3

using-display-page-templates/creating-and-managing-display-page-templates.md
using-display-page-templates/publishing-content-with-display-pages.md
using-display-page-templates/displaying-categories-using-display-pages.md
using-display-page-templates/configuring-seo-and-open-graph.md
```

{bdg-secondary}`Liferay DXP/Portal 7.3以降で利用可能`

表示ページテンプレートは、専用のURLでコンテンツを表示するための構造を定義します。 コンテンツアイテムを作成またはアップロードすると、LiferayはそれにアクセスするためのユニークなフレンドリーURLを自動的に生成します。 ただし、このURLを使ってコンテンツを表示できるのは、最初にコンテンツを表示するためのテンプレートを定義した場合のみです。

![専用URLでコンテンツを表示するための表示ページテンプレートを作成します。](./using-display-page-templates/images/01.png)

表示ページのテンプレートを作成する場合、まずコンテンツの種類（Webコンテンツの記事、文書、ブログのエントリなど）を選択します。 これは、どのコンテンツが表示ページのレンダリングにテンプレートを使用できるかを決定するものです。 そして、コンテンツページと同じUIやデザイン要素を用いて、テンプレートをデザインすることができます。 つまり、ページ [フラグメント](../creating-pages/page-fragments-and-widgets/using-fragments.md) と [ウィジェット](../creating-pages/using-content-pages/using-widgets-on-a-content-page.md) を使って、コンテンツフィールドにマッピングする動的な表示を構築し、追加機能を統合することができるのです。 さらに、 [SEO設定](./using-display-page-templates/configuring-seo-and-open-graph.md) を定義することで、ページの検索順位を向上させることも可能です。

テンプレートを設計した後、そのコンテンツタイプを表示するためのデフォルトテンプレートとしたり、一部のコンテンツアイテムのみ使用するよう手動で設定することができます。 設定すると、ユーザーはそのコンテンツアイテムのフレンドリーURLにアクセスすることで、その表示ページを見ることができます。 コンテンツは、テンプレートのデザインに応じて動的にレンダリングされます。

表示ページテンプレートは、現在以下のコンテンツタイプに対応しています。

* [ブログエントリー](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [Categories](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`Available 7.4+`
* [Custom Objects](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`Available 7.4+`
* [ドキュメントとメディア](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [Webコンテンツの記事](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

```{tip}
複数のコンテンツで再利用したいレイアウトを設計する場合は、表示ページテンプレートを使用します。
```

これらのテンプレートは、ビジネスケーススタディ、製品やサービスのオプション、求人情報、Web記事など、要素のリストを一貫した方法で表示するのに適しています。 例えば、保険事業のWebサイトでは、利用可能なオプションを一覧表示することができます。 各オプションについては、個別のウェブコンテンツ記事で説明しています。 サイト訪問者が選択肢を確認し、好きなものをクリックして、記事から対応する保険の詳細を確認できるようなランディングページが必要です。

![単一の表示ページテンプレートを使用して、同じタイプの異なるコンテンツに同じレイアウトを適用できます。](./using-display-page-templates/images/02.png)

この目標を達成するために、ウェブコンテンツの記事フィールドをテンプレート内のフラグメントにマッピングする、単一の表示ページテンプレートを作成することができます。 各記事は同じテンプレートを使用することができます。 そして、ランディングページの各保険の選択肢を、対応する記事のフレンドリーURLにリンクさせます。 サイト訪問者がオプションをクリックすると、表示ページにWebコンテンツの記事から情報が動的に入力され、テンプレートのデザインに従ってレンダリングされます。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 表示ページテンプレートの作成と管理
:link: ./using-display-page-templates/creating and-managing-display-page-templates.md
:::

:::{grid-item-card} 表示ページでコンテンツを公開する
:link: ./using-display-page-templates/publishing-content-with-display-pages.md
:::

:::{grid-item-card} 表示ページを使ってカテゴリを表示する
:link: ./using-display-page-templates/displaying-categories-using-display-pages.md
:::

:::{grid-item-card} SEOとオープングラフの設定
:link: ./using-display-page-templates/configuring-seo-and-open-graph.md
:::
::::
