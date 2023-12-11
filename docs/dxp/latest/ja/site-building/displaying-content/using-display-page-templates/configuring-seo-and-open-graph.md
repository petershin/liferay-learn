# SEOとOpen Graphの設定

{bdg-secondary}`利用可能です：Liferay DXP/Portal 7.3+`.

表示ページテンプレートは、専用のURLで個々のコンテンツアイテムを表示するカスタムレイアウトです。 これらのレイアウトは、フラグメントとウィジェットの両方を使用し、ウェブコンテンツの記事、文書、ブログエントリーなどのために作成することができます。 各テンプレートには、手動または動的に入力できる独自のSEOとオープングラフの設定があります。

以下の手順に従って、表示ページテンプレートのSEOとOpen Graphの設定を行います：

1. [サイトメニュー](../../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _ページテンプレート_に移動し、_表示ページテンプレート_タブをクリックします。

   ![Go to the display page templates tab.](./configuring-seo-and-open-graph/images/01.png)

1. 目的のテンプレートの_Actions_ (![アクションアイコン](./../../../images/icon-actions.png))をクリックし、_Edit_を選択します。 テンプレートを編集する際には、アプリケーションバーの_Options_（！[Optionsアイコン](././../../../images/icon-options.png)）をクリックし、_Configure_（！[Configureアイコン](././../../../images/icon-cog.png)）をクリックします。

1. [［SEO］](#seo-settings-reference) または [［Open Graph］](#open-graph-settings-reference) タブに移動し、目的の設定を入力してください。

   ![Enter the desired configuration in the SEO and Open Graph tabs.](./configuring-seo-and-open-graph/images/02.png)

1. ［_Save_］をクリックします。

   ```{important}
   SEOタブとオープングラフタブの間を移動すると、保存していない変更が失われます。
   ```
SEOとOpen Graphの設定を行う際、値を直接入力したり、フィールドマッピングを使用して動的に値を追加したりすることが可能です。 使用可能なマッピングオプションは、テンプレートのコンテンツタイプとサブタイプによって異なります。 フィールドをマッピングするには、_フィールド・セレクタ_ボタン(![マッピング・ボタン](../../../images/icon-map.png))をクリックし、利用可能なフィールドから選択する。 Liferay DXP 7.4 U1とPortal 7.4 GA5では、この方法で追加されたフィールドはフィールド参照IDとフィールドラベル(`${fieldReferenceID:Field Label}`)の2つの部分を持つ`${}`プレースホルダとして表現されます。

以前のバージョンでは、マッピングプレースホルダーはフィールド参照IDのみを含んでいました（例：`${title}`、`${authorName}`、`${Text84981642}`）。

カスタムウェブコンテンツやドキュメント構造のフィールド参照IDは人間が読めるものではないので（例えば`${Text84981642:Contributors}`）、Liferayは管理者側でわかりやすくするためにフィールドラベルの値を提供します。 このラベルはエンドユーザーには表示されず、マッピングにも影響しないため、ユーザーが自由に編集することができます。 マッピングは、プレースホルダーのフィールド参照IDにのみ依存します。

```{note}
Liferay は可能な限り、マッピングされたフィールドの翻訳を提供します。 ただし、マッピングされたフィールド以外で提供されたテキストは翻訳されません。
```
## SEO設定の参考

検索エンジン最適化（SEO）とは、検索エンジンの検索結果ページ（SERP）でページの順位を上げるために使用される方法を指します。 表示ページテンプレートを使えば、SEOのためにコンテンツの表示ページを設定することができます。

### HTMLタイトル

HTML Titleフィールドは、表示ページの`<title>`タグを定義します。 このタイトルは、検索エンジンがあなたのページをランク付けするために使用され、検索エンジンの検索結果でページの見出しとして機能します。 デフォルトでは、表示ページのテンプレートはこのフィールドを `${title}` にマップする。 この値を直接編集したり、フィールド・セレクタを使用して追加のマッピングを含めることができます（例：`${title} - ${authorName:Author Name}`）。

推奨される_HTMLタイトル_の長さは60文字以下です。

```{tip}
SEOとオープングラフのタイトルは一緒に更新するのがベストプラクティスです。
```
![Combine multiple mapped fields to build your own HTML title.](./configuring-seo-and-open-graph/images/03.png)

### 説明

Descriptionフィールドは表示ページの説明文`<meta>`タグを定義します。 この説明文は、検索エンジンがあなたのページをランク付けするために使用され、検索エンジンの結果にあなたのページのプレビューとして表示されます。 デフォルトでは、表示ページのテンプレートはこのフィールドを `${description}` にマップする。 この値を直接編集したり、フィールド・セレクタを使用して追加のマッピングを含めることができます（例：`${description} - ${authorName:Author Name}`）。

ページの説明文の推奨長さは155文字以下です。

```{tip}
SEOとオープングラフの記述を一緒に更新するのがベストプラクティスです。
```

![Combine multiple mapped fields to create a custom HTML description.](./configuring-seo-and-open-graph/images/04.png)

### ロボット

Robotsフィールドは、表示ページの`robots.txt`ルールを設定する。 これらのルールは、検索エンジンやその他のツールがあなたのサイトをクロールしてインデックスを作成する際の指示となり、どのパスをクロールすべきか、またはクロールすべきでないかを定義します。 ウェブクローラーは、`robots.txt`の指示に従う場合もあれば、従わない場合もあることに注意してください。

このフィールドは言語フラグを使ってローカライズすることもできます。

![The Robots field configures robots.txt rules for a display page.](./configuring-seo-and-open-graph/images/05.png)

### サイトマップ

`sitemap.xml`ファイルに表示ページを含めるかどうかを決定し、Priority（優先度）とChange Frequency（変更頻度）フィールドを設定します。 検索エンジンに、表示ページをクロールしてインデックスさせるかどうか、他のサイトページと比較してどのように優先させるか、どの程度の頻度で更新されるかを知らせる。

![Determine whether to include a display page in your sitemap.xml file, as well as set its priority and change frequency.](./configuring-seo-and-open-graph/images/06.png)

## Open Graph 設定の参考

{bdg-secondary}`利用可能です：Liferay DXP/Portal 7.3+`.

[Open Graph](https://ogp.me/) は、Facebook、Slack、Twitterなどのアプリケーション・コンテキストで共有されるサイト・コンテンツのプレビューを標準化するインターネット・プロトコルである。 これは、 [RDFa](https://en.wikipedia.org/wiki/RDFa) と同様に、構造化データをページヘッダーに `<meta>` タグとして埋め込むことで実現する。

Liferay DXP では、ページの Open Graph `<meta>` タグを動的に設定する表示ページテンプレートを作成できます。 ここで定義された値は、 [サイト](../../site-settings/configuring-open-graph.md) レベルで定義されたデフォルト値を上書きする。

```{note}
オープングラフ<meta>タグは、認証されていないユーザーにはページヘッダーにのみ含まれます。 ユーザーがログインしているときは含まれない。
```
### タイトル

Titleフィールドは表示ページの`og:title`プロパティを定義し、リッチプレビューで表示されるコンテンツのタイトルを定義します。 デフォルトでは、このフィールドは`${title}`にマップされる。 この値を直接編集したり、フィールド・セレクタを使用して追加のマッピングを含めることができます（例：`${title} - ${authorName:Author Name}`）。

```{tip}
SEOとオープングラフのタイトルは一緒に更新するのがベストプラクティスです。
```
![Combine multiple mapped fields to create a custom og:title value.](./configuring-seo-and-open-graph/images/07.png)

### 説明

Description フィールドは表示ページの `og:description` プロパティを定義し、リッチプレビューで表示されるコンテンツの説明を決定します。 デフォルトでは、このフィールドは`${description}`にマップされる。 この値を編集し、フィールド・セレクタを使って追加のマッピングを含めることができる（例：`${description} - ${authorName:Author Name}`）。

```{tip}
SEOとオープングラフの記述を一緒に更新するのがベストプラクティスです。
```
![Combine multiple mapped fields to create a custom og:description value.](./configuring-seo-and-open-graph/images/08.png)

### 画像

Imageフィールドは表示ページの`og:image`プロパティを定義し、リッチプレビューでコンテンツに表示される画像を設定します。 基本的な画像タグに加えて、DXP は、選択した画像の表示方法を決定する多くの構造化プロパティを自動的に追加します。 Imageフィールドは以下の`<meta>`タグを定義する。

```html
<meta property="og:image" content="http://example.com/ogp.jpg" />
<meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="400" />
<meta property="og:image:height" content="300" />
```

デフォルトでは、このフィールドは表示ページテンプレートではマッピングされていません。 つまり、別の画像フィールドを選択しない限り、テンプレートのデフォルトはサイトレベルで設定された画像になります。

![The image field defines a display page's og:image property.](./configuring-seo-and-open-graph/images/09.png)

### 画像の別の説明

Image Alt Descriptionフィールドは、表示ページの`og:image:alt`プロパティを定義し、表示コンテンツの`og:image`プロパティに対してスクリーンリーダーが読み取るaltテキストを決定します。

```html
<meta property="og:image:alt" content="This is an example." />
```

デフォルトでは、このフィールドは表示ページテンプレートではマッピングされていません。 つまり、別のテキスト・フィールドを選択しない限り、テンプレートのデフォルトはサイト・レベルで設定されたaltテキストになります。

![The image alt description field defines a display page's og:image:alt property](./configuring-seo-and-open-graph/images/10.png)

## 関連トピック

[ページのフレンドリーURLの設定](../../creating-pages/page-settings/configuring-your-pages-friendly-url.md) 

[オープングラフの設定](./../../site-settings/configuring-open-graph.md) 
