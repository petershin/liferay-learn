# コンテントページエディタUIリファレンス

{bdg-secondary}`Liferay 7.4 U37+/GA37+の場合`

コンテントページエディタを使用して、コンテントページ内の要素を[追加し](./adding-elements-to-content-pages.md)設定することができます。 コンテントページエディタを開くには、コンテントページに移動して、*編集* (![Edit icon](../../../images/icon-edit.png) ) をクリックします。 編集ツールバーとサイドバーが表示され、コンテントページを作成するためのツールやコンポーネントが表示されます。

- [編集ツールバー](#editing-toolbar)
- [編集サイドバー](#editing-sidebar)

![［編集］ボタンをクリックすると、編集ツールバーとサイドバーにアクセスできます。](./content-page-editor-ui-reference/images/01.png)

## 編集ツールバー

コンテントページのツールバーには、独自のユーザーエクスペリエンスの構築、ローカライズされた翻訳の設定、編集モードの切り替えなどのためのツールが用意されています。

![［編集］ボタンをクリックすると、編集ツールバーにアクセスできます。](./content-page-editor-ui-reference/images/02.png)

### エクスペリエンス

［Experience］ドロップダウンメニューを使用して、現在のページのコピーを作成し、特定のオーディエンス向けにカスタマイズできます。 詳細は、[コンテントページのパーソナライゼーション](../../personalizing-site-experience/experience-personalization/content-page-personalization.md)を参照してください。

### 翻訳

言語フラグをクリックして、翻訳ドロップダウンメニューにアクセスします。 ここでは、ページの有効言語のステータスを表示したり、言語を切り替えて翻訳を直接表示および編集したりできます。 詳細は、[サイト言語の設定](../../site-settings/site-localization.md)を参照してください。

コンテントページのパーソナライゼーションに [エクスペリエンス](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) を使用する場合、サイトで利用可能な言語を使用してエクスペリエンスを設定できます。 詳しくは、 [Managing Experience Localization](../../personalizing-site-experience/experience-personalization/content-page-personalization.md#managing-experience-localization) を参照してください。

### デバイスディスプレイ

デバイスアイコンをクリックして、Liferayのレスポンシブレイアウトエディタにアクセスします。 ここでは、さまざまな画面サイズに対応したページを設定することができます。 利用可能な表示オプションは、デスクトップ ( ![Desktop](../../../images/icon-display.png) )、タブレット ( ![Tablet](../../../images/icon-tablet-portrait.png) )、スマホ(横） ( ![Landscape Phone](../../../images/icon-mobile-landscape.png) )、スマホ(縦） ( ![Portrait Phone](../../../images/icon-mobile-portrait.png) )です。 タブレットやスマホのレイアウト編集中は、リサイズハンドルバーを使って画面サイズを手動で調整することができます。 詳しくは、 [レスポンシブレイアウトの構築](../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) をご覧ください。

```{note}
[フラグメントとウィジェット](#fragments-and-widgets)および[ページデザインオプション](#page-design-options)パネルは、デスクトップレイアウトでのみ利用可能です。
```

### 編集履歴

*履歴* ボタン (![History Button](./../../../images/icon-time.png) ) をクリックすると、現在の編集セッションで行われた変更内容が表示されます。 この履歴は、変更の予約や復元に使用することができます。 また、「元に戻す」・「やり直し」コマンドボタンをクリックすることもできます。

![［元に戻す］、［やり直し］、［履歴］ボタンを使って、変更した内容を元に戻すことができます。](./content-page-editor-ui-reference/images/03.png)

### 編集モードセレクター

コンテントページのサイドバーで利用できる編集オプションは、選択した編集モードによって異なります。

| 編集モード   | Description                                   | 利用可能なオプション                |
|:------- |:--------------------------------------------- |:------------------------- |
| ページデザイン | ページとページの内容を更新する権限がある場合に、ページをデザインすることができます。    | <ul><li>[Browser](#browser)</li><li>[ページコンテンツ](#page-content)</li><li>[Comments](#comments)</li></ul> |
| コンテンツ編集 | ページの更新権限がある場合は、コンテンツの編集が可能ですが、ページの内容は編集できません。 | <ul><li>[フラグメントとウィジェット](#fragments-and-widgets)</li><li>[Browser](#browser)</li><li>[ページデザインオプション](#page-design-options)</li><li>[ページコンテンツ](#page-content)</li><li>[Comments](#comments)</li></ul> |

![編集モードは、［ページデザイン］と［コンテンツ編集］のどちらかを選択します。](content-page-editor-ui-reference/images/04.png)

### サイドバーを切り替える

サイドバー切り替えボタン( ![Toggle Sidebars](../../../images/icon-view.png) )をクリックして、編集中のサイドバーを非表示にし、ページをプレビューします。 アプリケーションバーのアクションボタン( ![Actions Button](../../../images/icon-actions.png) )をクリックし、 *［プレビューを新しいタブで開く］*を選択すると、現在のページエクスペリエンスと言語を新しいタブで見ることができます。

### ページテンプレートを作成する

ページテンプレートボタン( ![Page Template](../../../images/icon-page-template.png) )をクリックして、現在のページデザインに基づいて [ページテンプレート](../adding-pages/creating-a-page-template.md)を作成します。

### 公開

デフォルトでは、公開すると変更がすぐに公開されます。 ただし、 [ワークフロープロセス](../../../process-automation/workflow/introduction-to-workflow.md) がレビューと公開設定プロセスを指示するように構成されている場合、［公開］をクリックすると、定義された手順が開始されます。

## 編集サイドバー

選択した編集モードに応じて、編集サイドバーでこれらのパネルにアクセスすることができます。

- ![フラグメントとウィジェット](../../../images/icon-plus.png) - [フラグメントとウィジェット](#fragments-and-widgets)
- ![ブラウザ](../../../images/icon-hierarchy.png) - [ブラウザ](#browser) (旧 *セレクション*)
- ![ページデザインオプション](../../../images/icon-format.png) - [ページデザインオプション](#page-design-options)
- ![ページコンテンツ](../../../images/icon-paperclip.png) - [ページコンテンツ](#page-content) (旧 *コンテンツ*)
- ![コメント](../../../images/icon-message.png) - [コメント](#comments)

![編集サイドバーには、以下のパネルがあります。](content-page-editor-ui-reference/images/05.png)

### フラグメントとウィジェット

フラグメントとウィジェットパネル( ![Fragments and Widgets icon](../../../images/icon-plus.png) )では、すぐに使用できるページ要素とカスタムのページ要素の両方にアクセスすることができます。

**フラグメント**: フラグメントは、拡張性、再利用性、ドラッグ＆ドロップ可能な要素で、コンテントページの主要な構成要素として機能します。 例としては、レイアウト要素、ビデオ、テキストオーバーレイ付きのバナー画像などがあります。 すぐに使えるフラグメントについては、[フラグメントの使用](../page-fragments-and-widgets/using-fragments.md)を、独自のフラグメントを作成する方法については [フラグメントの開発](../../developer-guide/developing-page-fragments/developing-fragments-intro.md)を参照してください。

**ウィジェット**：ウィジェットとは、ページに動的な機能を追加する[アプリケーション](../../../building-applications.md)のことです。 例としては、ブログ、掲示板、カレンダーなどがあります。 詳細は、[コンテントページでのウィジェットの使用](./using-widgets-on-a-content-page.md)を参照してください。

```{tip}
Liferay 7.4 U37/GA37から、順序ボタン(![順序ボタン](../../../images/icon-order.png))をクリックして、フラグメントとウィジェットのセットを並べ替えます。 スターボタン(！[スターボタン](../../images/icon-star.png)）をクリックすると、フラグメントやウィジェットをお気に入り要素に追加することができます。
```

### ブラウザ

ブラウザパネル( ![Browser](../../../images/icon-hierarchy.png) )を使って、ページ内のすべての要素を表示、整理、管理することができます。 要素は階層で表示されます。 Liferay 7.4 U37/GA37+では、ブラウザパネルで要素をドラッグ＆ドロップして再編成したり、要素をダブルクリックして名前を変更したりすることができます。 要素を選択すると、その設定が設定サイドパネルに表示されます。 フラグメントのサブエレメントを選択すると、その他の設定にアクセスできます。 詳しくは、[フラグメントの設定](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)を参照してください。

```{note}
コンテントページを編集する場合、ヘッダーとフッターの要素はブラウザパネルに含まれません。 これらの要素は、[マスターページテンプレート](../defining-headers and footers/master-page-templates.md) でのみ編集が可能です。
```

### ページコンテンツ

［ページコンテンツ］パネル( ![Page Content](../../../images/icon-paperclip.png) )では、ページに直接追加されたコンテンツを表示・編集することができます。 これには、インラインテキスト、画像、ウェブコンテンツの記事などを含めることができます。 コンテンツを表示しながら、コンテンツアイテムの検索やタイプ別にフィルタリングが可能です。 ページに[コレクションが含まれている場合](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)、そのアイテムを表示したり、新しいアイテムを追加したりすることができます。 詳細については、[コンテントページのコンテンツの管理](./managing-content-in-content-pages.md)を参照してください。

```{note}
コレクション以外に、マップされたコンテンツは［ページコンテンツ］パネルに表示されません。 パネルには、ページに直接追加されたコンテンツのみが含まれます。
```

### ページデザインオプション

ページデザインオプションパネル( ![Page Design Options](../../../images/icon-format.png) )を開き、ページの [マスターページテンプレート](../defining-headers-and-footers/managing-master-page-templates.md) または [スタイルブック](../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)を変更します。 コグボタン ( ![Cog Button](../../../images/icon-cog3.png) ) をクリックすると、 [フロントエンドクライアント拡張機能](../../../building-applications/client-extensions/front-end-client-extensions.md)を含む、その他のルック＆フィールのオプションにアクセスできます。

### コメント

コメントパネル( ![Comments](../../../images/icon-message.png) )では、フラグメントやウィジェットにコメントをつけて、ページの投稿者とコラボレーションすることができます。 また、公開されているコメントの閲覧、編集、削除、返信も可能です。 [メンション](../../../collaboration-and-social/notifications-and-requests/user-guide/mentioning-users.md)が有効になっている場合は、コメントの一部としてページ更新権限を持つユーザーにタグを付けることができます。 コメントを追加するには、［コメント］パネルを開き、目的のページ要素を選択します。

```{note}
7.3より前のバージョンでは、コメントはデフォルトで無効になっています。 ページコメントを有効にするには、*コントロールパネル* &rarr; *［システム設定］* &rarr; *［ページ］* &rarr; *［コンテントページエディタ］* にアクセスします。 次に、*［コメントを有効にする］*ボックスにチェックを入れて、*［アップデート］*をクリックします。
```

### 選択

{bdg-secondary}`Liferay 7.3 の場合`

選択パネル(![Selection](../../../images/icon-pages-tree.png))では、すべてのページ要素の階層的なアウトラインを表示し、それらの要素の選択、設定、削除を行うことができます。 同様に、デザインモードでページ上の任意の要素をクリックすると、選択パネルが開き、階層内の選択されたページ要素が強調表示されます。 要素を選択すると、その要素に一般、スタイル、およびリンクオプションがある場合はそれらにアクセスできます。 詳しくは、[フラグメントの設定](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)を参照してください。

![選択すると、ページとコンテンツの階層が表示されます。](./content-page-editor-ui-reference/images/06.png)

```{note}
ページのヘッダーとフッターは、[マスターページテンプレート](../defining-headers-and-footers/master-page-templates.md) でしか変更できないため、選択パネルの階層に表示されません。
```

### コンテンツ

{bdg-secondary}`Liferay 7.3 の場合`

［コンテンツ］パネル(![Contents](../../../images/icon-list-ul.png)）では、ページ上のすべてのWebコンテンツを表示、編集、管理することができます。 ウィジェットに表示されるコンテンツやコンテンツフィールドにマッピングされたコンテンツがあります。 詳細については、[コンテントページのコンテンツの管理](./managing-content-in-content-pages.md)を参照してください。

## 追加情報

- [コンテントページの使用](../using-content-pages.md)
- [コンテンツページへの要素の追加](./adding-elements-to-content-pages.md)
- [フラグメントの使用](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)
