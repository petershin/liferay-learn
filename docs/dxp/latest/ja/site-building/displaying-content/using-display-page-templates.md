---
toc:
  - ./using-display-page-templates.md
  - ./using-display-page-templates/creating-and-managing-display-page-templates.md
  - ./using-display-page-templates/publishing-content-with-display-pages.md
  - ./using-display-page-templates/displaying-categories-using-display-pages.md
  - ./using-display-page-templates/using-multiple-display-page-templates-to-create-multi-step-applications.md
  - ./using-display-page-templates/configuring-seo-and-open-graph.md
---
# 表示ページテンプレートの使用

{bdg-secondary}`liferay DXP/Portal 7.3+`.

表示ページテンプレートは、専用URLにコンテンツを表示するための構造を定義します。 コンテンツアイテムを作成またはアップロードすると、LiferayはそれにアクセスするためのユニークなフレンドリーURLを生成します。 ただし、コンテンツを表示するためのテンプレートを最初に定義した場合のみ、このURLを使ってコンテンツを表示できます。

![Create display page templates for displaying content at a dedicated URL.](./using-display-page-templates/images/01.png)

表示ページテンプレートを作成する場合、まずコンテンツの種類（Webコンテンツの記事、ドキュメント、ブログエントリーなど）を選択します。 これにより、表示ページのレンダリングにテンプレートを使用できるコンテンツアイテムが決まります。 そして、コンテンツページと同じUIとデザイン要素を使用してテンプレートをデザインすることができます。 つまり、ページ [フラグメント](../creating-pages/page-fragments-and-widgets/using-fragments.md) と [ウィジェット](../creating-pages/using-content-pages/using-widgets-on-a-content-page.md) を使って、コンテンツフィールドにマッピングされた動的な表示を構築し、追加機能を統合することができます。 さらに、 [SEO設定](./using-display-page-templates/configuring-seo-and-open-graph.md) 、ページの検索順位を向上させることができます。

テンプレートを設計した後、そのコンテンツ種類を表示するためのデフォルトのテンプレートにしたり、一部のコンテンツアイテムだけがこのテンプレートを使用するように手動で設定することができます。 一度設定すると、ユーザーはそのコンテンツアイテムのフレンドリURLにアクセスすることで、その表示ページを見ることができます。 コンテンツは、テンプレートのデザインに応じて動的にレンダリングされます。

表示ページテンプレートは、現在、以下のコンテンツの種類に対応しています。

* [ブログエントリー](../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [カテゴリー](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`7.4+`
* [カスタムオブジェクト](../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`7.4+`
* [ドキュメント](../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [ウェブコンテンツ記事](../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

```{tip}
複数のコンテンツアイテムで再利用したいレイアウトをデザインするには、表示ページテンプレートを使用します。
```

ビジネスケーススタディ、製品やサービスのオプション、求人情報、Web記事など、要素のリストを一貫した方法で表示するのに最適なテンプレートです。 例えば、保険ビジネスのWebサイトでは、利用可能なオプションを一覧にすることができます。 各オプションについては、個別のWebコンテンツ記事で説明しています。 サイト訪問者がオプションを表示し、記事から対応する保険の詳細を確認できるオプションをクリックできるランディングページが必要です。

![You can apply the same layout to different content of the same type using a single display page template.](./using-display-page-templates/images/02.png)

この目標を達成するために、Webコンテンツ記事のフィールドをテンプレート内のフラグメントにマッピングする単一の表示ページテンプレートを作成できます。 各記事で同じテンプレートを使用できます。 そして、ランディングページの各保険オプションを、対応する記事のフレンドリURLにリンクさせます。 サイト訪問者がオプションをクリックすると、表示ページにWebコンテンツ記事の情報が動的に入力され、テンプレート設計に従ってレンダリングされます。

コンテンツタイプに複数の表示ページテンプレートが作成されている場合、 [そのアセットタイプの利用可能なテンプレート](./using-display-page-templates/using-multiple-display-page-templates-to-create-multi-step-applications.md) のいずれかにリンクをマップすることができます。 リンクを表示ページにマッピングする際、デフォルトのオプションまたはその他の表示ページテンプレートを選択することができます。

