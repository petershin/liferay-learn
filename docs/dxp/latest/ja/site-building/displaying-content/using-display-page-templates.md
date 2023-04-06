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

using-display-page-templates/creating and-managing-display-page-templates.md
using-display-page-templates/publishing-content-with-display-pages.md
using-display-page-templates/displaying-categories-using-display-pages.md
using-display-page-templates/configuring-seo-and-open-graph.md
```

{bdg-secondary}Liferay DXP/Portal 7.3+を使用することができます。

表示ページテンプレートは、専用のURLにコンテンツを表示するための構造を定義します。 コンテンツアイテムを作成またはアップロードすると、LiferayはそれにアクセスするためのユニークなフレンドリーURLを自動的に生成します。 ただし、このURLを使ってコンテンツを表示できるのは、コンテンツを表示するためのテンプレートを最初に定義した場合のみです。

![専用URLにコンテンツを表示するための表示ページテンプレートの作成](./using-display-page-templates/images/01.png)

表示ページのテンプレートを作成する場合、まずコンテンツタイプ（Webコンテンツの記事、文書、ブログエントリーなど）を選択します。 これは、どのコンテンツアイテムが、その表示ページのレンダリングにテンプレートを使用できるかを決定します。 そして、コンテンツページと同じUIやデザイン要素を用いて、テンプレートをデザインすることができます。 つまり、 [fragments](.../creating-pages/page-fragments-and-widgets/using-fragments.md) と [widgets](.../creating-pages/using-content-pages/using-widgets-on-a-content-page.md) を使ってコンテンツフィールドにマッピングする動的表示を行い、追加の機能を統合できるのです。 また、ページの検索順位を上げるための[SEO設定](./using-display-page-templates/configuring-seo-and-open-graph.md) を定義することができます。

テンプレートを設計した後、そのコンテンツタイプを表示するためのデフォルトのテンプレートにしたり、一部のコンテンツアイテムだけがこのテンプレートを使用するように手動で設定することができます。 一度設定すると、ユーザーはそのコンテンツアイテムのフレンドリーURLにアクセスすることで、その表示ページを見ることができます。 コンテンツは、テンプレートのデザインに応じて動的にレンダリングされます。

表示ページテンプレートは、現在、以下のコンテンツタイプに対応しています。

* [Blog Entries](../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [Categories](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`Available 7.4+`
* [Custom Objects](../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`Available 7.4+`
* [Documents](../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [Web Content Articles](../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

```{tip}
ディスプレイページテンプレートは、複数のコンテンツで再利用したいレイアウトをデザインするときに使用します。
```

ビジネスケーススタディ、製品やサービスのオプション、求人情報、ウェブ記事など、一貫した方法で要素のリストを表示するのに最適なテンプレートです。 例えば、保険ビジネスのウェブサイトでは、利用可能なオプションをリストアップすることができます。 各オプションについては、個別のウェブコンテンツで説明しています。 サイト訪問者が選択肢を確認し、好きなものをクリックして、記事から対応する保険の詳細を確認できるようなランディングページを作りたい。

![1つの表示ページテンプレートで、同じ種類の異なるコンテンツに同じレイアウトを適用することができます](./using-display-page-templates/images/02.png)

この目標を達成するために、単一の表示ページテンプレートを作成し、ウェブコンテンツの記事フィールドをテンプレート内のフラグメントにマッピングすることができます。 各記事は同じテンプレートを使用することができます。 そして、ランディングページの各保険オプションを、対応する記事のフレンドリーURLにリンクさせます。 サイト訪問者がオプションをクリックすると、表示ページにWebコンテンツ記事の情報が動的に入力され、テンプレート設計に従ってレンダリングされます。

::::{grid} 2

:::{grid-item-card} 表示ページテンプレートの作成と管理
:link: ./using-display-page-templates/creating-and-managing-display-page-templates.md
:::

:::{grid-item-card} 表示ページによるコンテンツの公開
:link: ./using-display-page-templates/publishing-content-with-display-pages.md
:::

:::{grid-item-card} 表示ページを使用したカテゴリー表示
:link: ./using-display-page-templates/displaying-categories-using-display-pages.md
:::

:::{grid-item-card} SEOとOpen Graphの設定
:link: ./using-display-page-templates/configuring-seo-and-open-graph.md
:::
::::
