# Content Page Editor UI Reference

{bdg-secondary}`liferay 7.4 U37+/GA37+用。`

コンテントページエディタを使用して、コンテントページ内の要素を [追加し](./adding-elements-to-content-pages.md) 設定することができます。 コンテンツ・ページ・エディターを開くには、コンテンツ・ページに移動し、 **編集**（！ [編集アイコン](../../../images/icon-edit.png) ）をクリックします。 編集ツールバーとサイドバーが表示され、コンテントページを作成するためのツールやコンポーネントが表示されます。

* [ツールバーの編集](#editing-toolbar)

* [サイドバーの編集](#editing-sidebar)

![Click the Edit button to access the editing toolbar and sidebar.](./content-page-editor-ui-reference/images/01.png)

## 編集ツールバー

コンテントページのツールバーには、独自のユーザーエクスペリエンスの構築、ローカライズされた翻訳の設定、編集モードの切り替えなどのためのツールが用意されています。

![Click the Edit button to access the editing toolbar.](./content-page-editor-ui-reference/images/02.png)

### エクスペリエンス

［Experience］ドロップダウンメニューを使用して、現在のページのコピーを作成し、特定のオーディエンス向けにカスタマイズできます。 詳細は、 [コンテントページのパーソナライゼーション](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) を参照してください。

### 翻訳

言語フラグをクリックして、翻訳ドロップダウンメニューにアクセスします。 ここでは、ページの有効言語のステータスを表示したり、言語を切り替えて翻訳を直接表示および編集したりできます。 詳細は、 [サイト言語の設定](../../site-settings/site-localization.md) を参照してください。

コンテンツページのパーソナライゼーションに [experiences](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) を使用している場合、サイトで使用可能な言語を使用してエクスペリエンスを設定できます。 詳しくは、 [Managing Experience Localization](../../personalizing-site-experience/experience-personalization/content-page-personalization.md#managing-experience-localization) を参照してください。

### デバイスディスプレイ

デバイスアイコンをクリックして、Liferayのレスポンシブレイアウトエディタにアクセスします。 ここでは、さまざまな画面サイズに対応したページを設定することができます。 利用可能な表示オプションには、デスクトップ ( ![Desktop](../../../images/icon-display.png) )、タブレット ( ![Tablet](../../../../images/icon-tablet-portrait.png) )、横向き電話 ( ！ [横向き電話](../../../images/icon-mobile-landscape.png) )、縦向き電話( ![縦向き電話](../../../images/icon-mobile-portrait.png))。 タブレットやスマホのレイアウト編集中は、リサイズハンドルバーを使って画面サイズを手動で調整することができます。 詳しくは、 [レスポンシブレイアウトの構築](../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) をご覧ください。

```{note}
 [フラグメントとウィジェット](#fragments-and-widgets) と [ページデザインオプション](#page-design-options) パネルは、デスクトップレイアウトでのみ利用可能です。
```

### 編集履歴

**履歴**( ![履歴ボタン](./../../../images/icon-time.png))をクリックすると、現在の編集セッション中に行われた変更が表示されます。 この履歴は、変更の予約や復元に使用することができます。 また、「元に戻す」・「やり直し」コマンドボタンをクリックすることもできます。

![Revert your changes using the Undo, Redo, and History buttons.](./content-page-editor-ui-reference/images/03.png)

### 編集モードセレクター

コンテントページのサイドバーで利用できる編集オプションは、選択した編集モードによって異なります。

| 編集モード   | 説明                                            | 利用可能なオプション                                                                                                                                                                                                                                            |
| :------ | :-------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ページデザイン | ページとページの内容を更新する権限がある場合に、ページをデザインすることができます。    | <ul><li> [ブラウザ](#browser) </li><li> [ページコンテンツ](#page-content) </li><li> [コメント](#comments) </li></ul>                                                                                                                       |
| コンテンツ編集 | ページの更新権限がある場合は、コンテンツの編集が可能ですが、ページの内容は編集できません。 | <ul><li> [フラグメントとウィジェット](#fragments-and-widgets) </li><li> [ブラウザ](#browser) </li><li> [ページ・デザイン・オプション](#page-design-options) </li><li> [ページ・コンテンツ](#page-content) </li><li> [コメント](#comments) </li></ul> |

![Choose between Page Design or Content Editing editing modes.](content-page-editor-ui-reference/images/04.png)

### サイドバーを切り替える

**サイドバーの切り替え**( ![サイドバーの切り替え](../../../images/icon-view.png))をクリックすると、編集中のサイドバーが非表示になり、ページがプレビューされます。 アプリケーションバーの **アクション**( ![アクションボタン](../../../images/icon-actions.png))をクリックし、 **新しいタブでプレビュー** を選択すると、新しいタブで現在のページの経験と言語を表示します。

### ページテンプレートに変換

アプリケーションバーの **Actions**(![アクションボタン](../../../images/icon-actions.png))をクリックし、 **Convert to Page Template**(![ページテンプレート](../../../images/icon-page-template.png))を選択すると、現在のページデザインに基づいて [、ページテンプレート](../adding-pages/creating-a-page-template.md) 。

### 公開

デフォルトでは、公開すると変更がすぐに公開されます。 ただし、 [ワークフロープロセス](../../../process-automation/workflow/introduction-to-workflow.md) がレビューおよび発行プロセスを指示するように構成されている場合は、［発行］をクリックすると、定義した手順が開始されます。

## 編集サイドバー

選択した編集モードに応じて、編集サイドバーでこれらのパネルにアクセスすることができます。

- [フラグメントとウィジェット](../../../images/icon-plus.png) - [フラグメントとウィジェット](#fragments-and-widgets)

- ![Browser](../../../images/icon-hierarchy.png)
- [ブラウザ](#browser) (以前は **Selection**)

- ![ページデザインオプション](../../../images/icon-format.png) - [ページデザインオプション](#page-design-options)

- ![ページコンテンツ](../../../images/icon-paperclip.png) - [ページコンテンツ](#page-content) (以前は **Contents**)

- ![Comments](../../../images/icon-message.png)
- [コメント](#comments)

![The editing sidebar includes these panels.](content-page-editor-ui-reference/images/05.png)

### フラグメントとウィジェット

フラグメントとウィジェット・パネル（ [フラグメントとウィジェット・アイコン](../../../images/icon-plus.png) ）では、既成のページ要素とカスタム・ページ要素の両方にアクセスできます。

**フラグメント** :フラグメントは、拡張可能で再利用可能なドラッグ＆ドロップ可能な要素で、コンテンツページの主要な構成要素として機能します。 例としては、レイアウト要素、ビデオ、テキストオーバーレイ付きのバナー画像などがあります。 すぐに使えるフラグメントについては、 [フラグメントの使用](../page-fragments-and-widgets/using-fragments.md) を、独自のフラグメントを作成する方法については [フラグメントの開発](../../developer-guide/developing-page-fragments/developing-fragments-intro.md) を参照してください。

**ウィジェット** :ウィジェットとは、 [アプリケーション](../../../building-applications.md) のことで、ページに動的な機能を追加するものです。 例としては、ブログ、掲示板、カレンダーなどがあります。 詳細は、 [コンテントページでのウィジェットの使用](./using-widgets-on-a-content-page.md) を参照してください。

```{tip}
Liferay 7.4 U37/GA37から、順序ボタン(![順序ボタン](../../../images/icon-order.png))をクリックして、フラグメントとウィジェットのセットを並べ替えます。 スターボタン（！ [スターボタン](../../images/icon-star.png) ）をクリックすると、フラグメントやウィジェットをお気に入り要素に追加することができます。
```

### ブラウザ

ブラウザーパネル ( ![Browser](../../../images/icon-hierarchy.png) ) を使用して、ページ内のすべての要素を表示、整理、管理します。 要素は階層で表示されます。 Liferay 7.4 U37/GA37+では、ブラウザパネルで要素をドラッグ＆ドロップして再編成したり、要素をダブルクリックして名前を変更したりすることができます。 要素を選択すると、その設定が設定サイドパネルに表示されます。 フラグメントのサブエレメントを選択すると、その他の設定にアクセスできます。 詳しくは、 [フラグメントの設定](../page-fragments-and-widgets/using-fragments/configuring-fragments.md) を参照してください。

```{note}
コンテントページを編集する場合、ヘッダーとフッターの要素はブラウザパネルに含まれません。 これらの要素を編集できるのは、 [マスターページテンプレート](../defining-headers-and-footers/master-page-templates.md) だけです。
```

### ページデザインオプション

**ページデザインオプションパネル**(![ページデザインオプション](../../../images/icon-format.png))を開いて、ページの [マスターページテンプレート](../defining-headers-and-footers/managing-master-page-templates.md) または [スタイルブック](../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) を変更します。 **オプション**(![オプションボタン](../../../images/icon-cog3.png))をクリックして、 [フロントエンドクライアント拡張機能](../../../building-applications/client-extensions/frontend-client-extensions.md) を含む、追加のページデザインオプションにアクセスします。

### ページコンテンツ

ページ・コンテンツ・パネル( ![ページ・コンテンツ](../../../images/icon-paperclip.png))では、ページに直接追加されたコンテンツを閲覧・編集することができます。 これには、インラインテキスト、画像、ウェブコンテンツの記事などを含めることができます。 コンテンツを表示しながら、コンテンツアイテムの検索やタイプ別にフィルタリングが可能です。 ページに [コレクションが含まれている場合](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 、そのアイテムを表示したり、新しいアイテムを追加したりすることができます。 詳細については、 [コンテントページのコンテンツの管理](./managing-content-in-content-pages.md) を参照してください。

```{note}
コレクション以外に、マップされたコンテンツは［ページコンテンツ］パネルに表示されません。 パネルには、ページに直接追加されたコンテンツのみが含まれます。
```

### 掲示板のディスカッション

コメントパネル( ![Comments](../../../images/icon-message.png) )では、フラグメントやウィジェットにコメントし、ページの投稿者と協力することができます。 また、公開されているコメントの閲覧、編集、削除、返信も可能です。 [メンション](../../../collaboration-and-social/notifications-and-requests/user-guide/mentioning-users.md) が有効になっている場合は、コメントの一部としてページ更新権限を持つユーザーにタグを付けることができます。 コメントを追加するには、［コメント］パネルを開き、目的のページ要素を選択します。

### ブラウザ

{bdg-secondary}`liferay 7.3用。`

選択パネル (![Selection](../../../images/icon-pages-tree.png)) では、すべてのページ要素の階層的なアウトラインを表示したり、それらの要素を選択、設定、削除したりすることができます。 同様に、デザインモード中にページ上の任意の要素をクリックすると、選択パネルが開き、選択されたページ要素が階層内でハイライトされます。 要素が選択されると、その要素に一般、スタイル、リンクオプションがあれば、それにアクセスできます。 詳しくは、 [フラグメントの設定](../page-fragments-and-widgets/using-fragments/configuring-fragments.md) を参照してください。

![Selection shows you a hierarchy of your page and contents.](./content-page-editor-ui-reference/images/06.png)

```{note}
ページのヘッダーとフッターは、 [マスターページテンプレート](../defining-headers-and-footers/master-page-templates.md) でのみ変更できるため、選択パネルの階層には表示されません。
```

### コンテンツ

{bdg-secondary}`liferay 7.3用。`

コンテンツ・パネル (![Contents](../../../images/icon-list-ul.png)) では、ページ上のすべてのウェブコンテンツを表示、編集、管理できます。 ウィジェットに表示されるコンテンツやコンテンツフィールドにマッピングされたコンテンツがあります。 詳細については、 [コンテントページのコンテンツの管理](./managing-content-in-content-pages.md) を参照してください。

## 関連トピック

[コンテンツページの使用](../using-content-pages.md)

[コンテンツ・ページへの要素の追加](./adding-elements-to-content-pages.md)

[フラグメントの使用](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)
