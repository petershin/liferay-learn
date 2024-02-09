# ページ単位での設定

個々のページをニーズに合わせて設定することができます。 この方法で行われたすべての変更は、選択されたページにスコープされます。

特定のページを設定するには、 **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ページ** に進みます。 次に、カスタマイズしたいページの **Actions**(![Actionsボタン](../../../images/icon-staging-bar-options.png))をクリックし、 **Configure** を選択します。

![Click the Actions button for the page you want to customize, and select Configure](./configuring-individual-pages/images/01.png)

または、アプリケーションバーの右上にある **Actions**(![Actionsボタン](./../../../images/icon-staging-bar-options.png))をクリックして、一般的なページ設定にアクセスすることもできます。 &rarr; アプリケーション・バーの右上にある **Configuration**(![Configurationボタン](./../../../images/icon-cog.png))をクリックします。

これらの設定は、以下のタブに整理されています。

* [一般](#general) 
* [デザイン](#design) 
* [SEO](#seo) 
* [オープングラフ](#open-graph) 
* [カスタム・メタタグ](#custom-meta-tags) 

```{note}
これらの設定の多くは、ユーザーのロケールに応じた翻訳を提供するためにローカライズすることができます。 詳しくは、 [初期インスタンスのローカライゼーション](../../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) および [ローカライゼーション可能なサイト・フィールドの変更](../../site-settings/site-localization.md#modifying-localizable-site-fields) を参照してください。
```

## 共通

ここでは、ページの名前、フレンドリーURL、レイアウトなどの基本情報を設定できます。

### 基本情報

nameフィールドを使用して、サイトナビゲーションに使用され、ブラウザのタイトルバーに表示されるページのタイトルを設定します。 ページ階層を表示するように設定されている場合、ページをメニュー表示から隠すことができる。 有効化しても、他のナビゲーション・メニューに追加された場合、隠しページは表示されます。 詳しくは [ページ階層の管理](../../site-navigation/managing-page-hierarchies.md) を参照してください。

![Use the name field to set the page's title and check the checkbox to hide it from menu display.](./configuring-individual-pages/images/02.png)

```{note}
子ページは親ページの可視性を継承します。 また、隠しページはデフォルトのナビゲーション・メニューには表示されないが、他の作成されたナビゲーション・メニューには表示することができる。
```

### URL

また、 **復元** アイコン(![フレンドリーURL復元アイコン](./../../../images/icon-restore.png))をクリックすると、以前に使用したURLが表示され、復元されます。 詳細については、 [ページのフレンドリURLの設定](./configuring-your-pages-friendly-url.md) を参照してください。

他のパラメータが指定されていない場合、ページのデフォルト・パラメータを設定するには **Query String** を使用します。 クエリー文字列は、ウェブ・コンテンツ・テンプレートに大きな利点をもたらします。 さらに、新しいタブで開く、特定のフレーム内で開くなどの属性を持つTarget Typeフィールドを使って、ページリンクの動作をコントロールすることができます。

![Use the Friendly URL field to set a page's custom URL.](./configuring-individual-pages/images/03.png)

```{tip}
ページの名前とフレンドリーURLはページ作成時に一緒に定義されますが、その後は個別に設定されます。 両者が一致するように、一緒に更新するのがベストプラクティスです。
```

### ページレイアウト

レイアウトテンプレートは、ウィジェットページのどこにウィジェットを配置できるかを指示します。 グローバルテンプレートまたはカスタムページテンプレートのいずれかを使用して作成された基本的なウィジェットページに対して、ユーザーは、選択されたテンプレートに行われた変更をページが **継承** するかどうかを決定することができます。 ページが変更を継承しない場合は、カスタムレイアウトを選択して、ウィジェットの行と列のコンテナを定義します。

![Select a layout template to define row and column containers for widgets.](./configuring-individual-pages/images/04.png)

### カテゴリー設定

**トピック** と **タグ** を使ってページのコンテンツを分類し、ユーザーがより簡単に見つけられるようにしましょう。 タグとカテゴリの使用の詳細は、 [カテゴリとタグを使用したコンテンツの整理](../../../content-authoring-and-management/tags-and-categories.md) を参照してください。

![Use Topics and Tags to categorize a page's content](./configuring-individual-pages/images/05.png)

### カスタマイズの設定

ウィジェット・ページのカラムがユーザーのために **カスタマイズ可能** であるかどうかを決定する。 カスタマイズが有効な場合、ユーザーがカスタマイズできる列を指定します。 詳細については、 [ウィジェット・ページのユーザー・パーソナライズを有効にする](../using-widget-pages/enabling-user-personalization-of-widget-pages.md) を参照のこと。

![Determine whether users can customize a widget page.](./configuring-individual-pages/images/06.png)

## デザイン

ここでは、ページのテーマを設定し、そのデザイン、CSS、JavaScriptをカスタマイズすることができます。 このエディターには、 [ページセットの設定ページ](../../creating-pages/page-settings/configuring-page-sets.md) からもアクセスできる。

### テーマ

ここでは、ページセットのテーマ設定を使用するか、ページのカスタムテーマを定義することができます。 ページのテーマをカスタマイズすることを選択すると、様々なテーマ設定を切り替えることができる。

![Determine whether to use the page set's theme settings or define a custom theme for your page.](./configuring-individual-pages/images/07.png)

### 基本設定

ここでは、ページのデザインシステムやスタイリングの一部を素早く簡単に変更することができます。

**ファビコン** :テーマから適用されるデフォルトのファビコンを変更します。

**マスター** ：マスターページのテンプレートを変更します。 詳しくは [マスターページテンプレート](../../creating-pages/defining-headers-and-footers/master-page-templates.md) をご覧ください。

**スタイルブック** ：テーマから適用されるデフォルトのスタイルブックを変更します。 詳しくは [スタイルブックを使用してサイトの外観を標準化する](../../../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) を参照してください。

**アイコンです** ：サイトのナビゲーションメニューでページ名と一緒に表示するアイコンを選択します。

![Determine the favicon, master page template, style book and icon for your page.](./configuring-individual-pages/images/08.png)

```{note}
コンテンツページには、サイドバーの編集メニューのページデザインオプション（ [ページデザインオプションアイコン](./../../../images/icon-format.png) ）にあるマスターとスタイルブックの設定も含まれます。
```

### カスタマイズ

また、ページにカスタムコードを追加できるCSSエディターやJavaScriptエディターにもアクセスできる。

**テーマCSSクライアント拡張:** [テーマCSSクライアント拡張](../../../building-applications/client-extensions/front-end-client-extensions.md#theme-css-client-extensions) を追加して、テーマに含まれるデフォルトCSSを完全に置き換えます。

**CSSクライアント拡張:** [CSSクライアント拡張](../../../building-applications/client-extensions/front-end-client-extensions.md#css-client-extensions) を追加して、ページのCSSをクライアント拡張で拡張する。 これらはテーマCSSの後、マスターエクステンションの後にロードされます。

**カスタムCSS:** カスタムCSSを適用することができ、テーマの後に読み込まれます。

**JavaScriptクライアント拡張とカスタムJavaScript:** [JavaScriptクライアント拡張](../../../building-applications/client-extensions/front-end-client-extensions.md#javascript-client-extensions) を追加することで、このマスターページテンプレートを使用したページが訪問されたときにJavaScriptを実行させることができます。 カスタムJavaScriptコードも追加でき、ページ下部で実行される。

![Use CSS and JavaScript editors to add custom code to the page](./configuring-individual-pages/images/09.png)

```{tip}
あなたのサイトのテーマがJavaScriptを使用している場合、個々のページやページセットではなく、テーマにカスタムJavaScriptコードを追加するのが最善です。 これにより、あなたのサイトのJavaScriptコードが一箇所に留まるようになります。 あなたのテーマがJavaScriptを使用していない場合、あなたのサイトのすべてのJavaScriptコードをここに置きます。
```

### 詳細設定

ページのコンテンツや機能をカスタマイズするための追加設定にアクセスします。

**カスタムフィールド** :サイトページ用に定義したカスタムフィールドを表示および設定します。 詳細については、 [Custom Fields](../../../system-administration/configuring-liferay/adding-custom-fields.md) を参照してください。

**埋め込みウィジェット** ： [Web Content Templates](./../../../content-authoring-and-management/web-content/web-content-templates/embedding-widgets-in-templates.md) , [Page Fragments](../../developer-guide/developing-page-fragments/developing-fragments-intro.md) , または [Themes](../../site-appearance/themes/introduction-to-themes.md) を使ってページに埋め込んだウィジェットにアクセスします。

**モバイル・デバイス・ルール** ：ページがそのページセットのモバイルデバイス用 [ルール](../../../site-building/optimizing-sites/building-a-responsive-site/creating-mobile-device-rules.md) を使用しているか、独自に設定されているかを判断します。 これらのルールは、ページのコンテンツがさまざまなタイプのモバイルデバイスでどのように表示されるかを決定します。

```{note}
カスタムフィールド*と埋め込みウィジェット*セクションは、ページにカスタムフィールドと埋め込みウィジェットを作成した場合にのみ表示されます。
```

## SEO

検索エンジン最適化（SEO）とは、検索エンジンの結果ページ（SERP）におけるページの順位を向上させるために使用される方法を指します。 SEOタブでは、ページのコンテンツを最適化するための設定に簡単にアクセスできます。 以下の設定については、 [SEOとOpen Graphを設定する](../../displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md) を参照してください。

### HTMLタイトル

HTMLのタイトルフィールドを使って、ページの`<title>`タグを定義する。 このタイトルは、検索エンジンがあなたのページをランク付けするために使用され、検索エンジンの結果でページの見出しとして機能しますが、ページの [名前](#name-and-friendly-url) を置き換えることはありません。 HTMLタイトルの推奨される長さは 60 文字未満です。

### 説明

descriptionフィールドを使って、ページの`<description>`タグを定義する。 この説明文は、検索エンジンがあなたのページをランク付けするために使用され、あなたのページの検索結果のプレビューにも表示されます。 説明文の推奨される長さは155文字未満です。

### カスタム正規化URL

ページのカスタムカノニカルURLを設定する。 この方法で設定されたカスタムURLは、システム設定の設定よりも優先されます。

### キーワード

あなたのページのコンテンツを検索する際に、人々が使いそうな単語をリストアップする。 これらのキーワードは、あなたのページのランキングに貢献します。

```{tip}
タイトル、見出し、説明文、段落、画像のaltテキストなど、ページのコンテンツ全体にキーワードを頻繁に使用しましょう。
```

![Set the page's HTML title, description, custom canonical URL and keywords to improve your page's ranking in Search Engine Results Pages (SERP)](./configuring-individual-pages/images/10.png)

### プレビュー

HTMLタイトル、説明文、カスタムURLの設定に基づいて、検索エンジンの結果ページ（SERP）にページがどのように表示されるかをプレビューします。

![Preview how a page is displayed in search engine results.](./configuring-individual-pages/images/11.png)

### ロボット

ページの `robots.txt` ルールを設定する。 これらのルールは、検索エンジンやその他のツールがあなたのサイトをクロールしたりインデックスを作成したりする際に、クローラーが指定したパスにアクセスすることをブロックしたり許可したりする指示を与えるものです。

![Configure robots.txt rules for your page to provide instructions to search engines](./configuring-individual-pages/images/12.png)

### サイトマップ

サイトクローラーが使用するサイトマップにページが含まれているかどうかを判断する。 ページを除外することで、サイトのクローラーがクロールやインデックスを作成する際に、そのページをスキップするように指示します。

### ページの優先度

ページの優先順位を0.0から1.0に設定する。 これは、クロールやインデックスを作成するツールに、あるページがサイト内の他のページと比較してどのように優先されるべきかを知らせるものです。

### 定期更新

ドロップダウンメニューを使用して、あなたのサイトをクロールおよびインデックスしているツールに、ページの更新頻度を知らせます。

![Determine if the page is included in the sitemap, and set its page priority and change frequency](./configuring-individual-pages/images/13.png)

## Open Graph

{bdg-secondary}`利用可能です：Liferay DXP/Portal 7.3+`.

[Open Graph](https://ogp.me/) は、Twitter、Facebook、LinkedInなどのアプリケーション・コンテキストで共有されるサイト・コンテンツのプレビューを標準化するインターネット・プロトコルである。 これは、 [RDFa](https://en.wikipedia.org/wiki/RDFa) と同様に、構造化データをページヘッダーに `<meta>` タグとして埋め込むことで実現する。

**Open Graph** タブでは、Open Graph `<meta>`タグを使用してページのメタデータを定義し、コンテンツの魅力的な表現を作成することができます。 ここで定義された値は、 [サイト](../../site-settings/configuring-open-graph.md) レベルで定義されたデフォルト値をオーバーライドする。

```{note}
オープングラフ<meta>タグは、認証されていないユーザーにはページヘッダーにのみ含まれます。 ユーザーがログインしているときは含まれない。
```

### 画像

画像フィールドを使用して、ページに対して以下のオープングラフ `<meta>` プロパティを定義します：

```html
<meta property="og:image" content="http://example.com/ogp.jpg" />
<meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="400" />
<meta property="og:image:height" content="300" />
```

### 画像の別の説明

`og:image:alt`プロパティを定義するには、画像のalt説明フィールドを使います。 また、 **言語フラグ** ボタンを使って画像のalt説明をローカライズすることもできます。

### カスタムタイトルと説明文

`og:title`と`og:description`プロパティを定義するには、カスタムタイトルとカスタム説明フィールドを使用します。 これらのプロパティは、ページのHTMLタイトルと説明文の代わりにリッチプレビューに使用されるカスタムテキストを作成します。 これらの値は、 **言語フラグ** ボタンを使ってローカライズすることもできます。

### Open Graphのページ表示のプレビュー

ページのオープングラフ設定をプレビューする。 このセクションでは、プロトコルをサポートするコンテキストでURLが共有されたときに、ページのコンテンツがどのように表示されるかを表示します。 ただし、画像の比率はURLが掲載されている場所によって変わることがあります。

![Preview your Open Graph configuration.](./configuring-individual-pages/images/14.png)

## カスタムメタタグ

ここでは、カスタム`<meta>`タグをページの`<head>`に追加することができます。 これらのタグは、ページのHTMLソースコードにのみ表示され、ページのデータを記述し、そのデータが検索エンジンの結果やソーシャルメディアへの投稿など、さまざまなコンテキストでどのように表示されるかを決定するために使用されます。 各タグはプロパティ属性とコンテンツ属性で定義されます。

![Add custom meta tags to a page's head using the Property and Content fields.](./configuring-individual-pages/images/15.png)

## 関連トピック

* [サイトへのページの追加](./../adding-pages/adding-a-page-to-a-site.md)
* [コンテンツページの使用](../using-content-pages.md)
* [ページ・セットの設定](./configuring-page-sets.md)
