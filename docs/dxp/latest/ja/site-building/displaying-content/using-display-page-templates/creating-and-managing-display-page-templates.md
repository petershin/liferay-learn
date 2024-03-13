# 表示ページテンプレートの作成と管理

{bdg-secondary}`liferay DXP/Portal 7.3+`.

表示ページテンプレートは、専用のフレンドリURLにコンテンツを表示するためのストラクチャーを定義します。 これらのテンプレートは、現在、以下のコンテンツの種類に対応しています。

* [ブログエントリー](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [カテゴリー](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`7.4+`
* [カスタムオブジェクト](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`7.4+`
* [ドキュメント](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [ウェブコンテンツ記事](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

詳しくは [表示ページテンプレートの使用](../using-display-page-templates.md) をご覧ください。

## 表示ページテンプレートの作成

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **デザイン** &rarr; **ページテンプレート** をクリックします。

1. **表示ページテンプレート** タブをクリックし、 **追加**(![ボタン追加](./../../../images/icon-add.png))をクリックします。

1. テンプレートの **名前** を入力し、必要に応じて **コンテンツタイプ** と **サブタイプ** を選択します。 そして **保存** をクリックする。

   ![Select the content type and subtype for your new template.](./creating-and-managing-display-page-templates/images/01.png)

1. [コンテンツページ](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md) と同じインターフェースとページ要素を使用してテンプレートをデザインします。

1. ページ要素を追加したら、編集可能なフィールドをダブルクリックして、 [マップ](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) をコンテンツ構造のフィールド（タイトル、説明など）に追加できます。 マップされたフィールドは紫の外枠で示されます。

   ```{tip}
   表示ページテンプレートのSEOおよびOpen Graphを設定する際に、マッピングされたフィールドを使用できます。 詳しくは [SEOとOpen Graphの設定](./configuring-seo-and-open-graph.md) をご覧ください。
   ```

   ![Map page elements to structure fields.](./creating-and-managing-display-page-templates/images/02.png)

1. パブリッシュする前に、 [プレビュー機能](#previewing-the-display-page-template-content-mappings) （7.4+で利用可能）を使用して、既存のコンテンツとの編集可能フィールドのマッピングをプレビューできます。

1. 完了したら、 **Publish** をクリックして作業を保存します。

これで、テンプレートを使って [コンテンツを表示できるようになりました](./publishing-content-with-display-pages.md) 。

### 表示ページテンプレートにフレンドリーURLを設定する

{bdg-secondary}`Liferay 2023.Q4+/GA102+`

表示ページのテンプレートにフレンドリーなURLを設定できます。 フレンドリーURLは、表示ページテンプレートがデフォルトとしてマークされていない場合や、手動で選択して使用する場合に使用されます。

たとえば、コンテンツページのボタンをマッピングされたURLにリンクする場合、表示ページテンプレートに接続されたオブジェクトを項目として選択し、表示ページテンプレートをフィールドとして選択することができます。 この場合、フレンドリーURLは選択された表示ページテンプレートに使用されます。

![Set a friendly URL for your display page template](./creating-and-managing-display-page-templates/images/03.png)
![The friendly URL is used when you select a display page template specifically from a list of links](./creating-and-managing-display-page-templates/images/04.png)

表示ページのテンプレートにフレンドリーなURLを設定するには、

1. 表示ページのテンプレートを編集中に、ページの右上にある **オプション**（![オプションアイコン](../../../images/icon-options.png)）をクリックします。

1. **Configure** を選択する。

1. General（全般）セクションで、フレンドリーURLを定義する。

1. **保存** をクリック

### 異なる表示ページテンプレートへのリンクのマッピング

```{important}
この機能は現在、リリース機能フラグの後ろにある。 詳しくは [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) をお読みください。
```

コンテンツタイプ（カスタムオブジェクト、ウェブコンテンツ記事、ブログエントリーなど）が複数の表示ページテンプレートを持つ場合、そのコンテンツタイプで利用可能なテンプレートにリンクをマッピングできます。

例えば、1つのオブジェクトに対して異なる表示ページテンプレートを作成し、それぞれがマッピングされたフォームの各ステップ（投稿、編集、承認など）に対応するようにすることができます。 そして、各ステージで使用する表示ページテンプレートを選択し、マルチステップフォームを作成することができます。

![Map links to different display page templates](./creating-and-managing-display-page-templates/images/05.png)

これにより、オブジェクトを扱う際の自由度が増し、オブジェクトからマッピングされた [フォーム](../../../building-applications/objects/using-fragments-to-build-forms.md) が複数のステップを持つようになります。

### 表示ページテンプレートのコンテンツマッピングをプレビューする

{bdg-secondary}`7.4+`

編集中、Liferayはコンテンツアイテムを持つ表示ページテンプレートをプレビューする2つの方法を提供します。

アプリケーションメニューから、 **Preview With** ドロップダウンメニューをクリックし、コンテンツアイテムを選択することができます。 項目が表示されない場合は、 **Select Other Item** をクリックし、必要なコンテンツを参照します。 これにより、フィールドマッピングに従って、テンプレートにコンテンツデータが動的に入力されます。

![Choose the content you want to use to preview your display page template.](./creating-and-managing-display-page-templates/images/06.png)

または、表示ページのテンプレート・エディターから、右上の **オプション** メニュー(![オプション・メニュー](../../../images/icon-options.png))ボタンをクリックし、 **新しいタブでプレビュー** を選択します。

## 表示ページテンプレートの使用量の表示

{bdg-secondary}`7.4+`

異なる表示ページのテンプレートは、 **Actions** メニューを使って管理することができます(![Actions](../../../images/icon-actions.png))。 ここから、 **View Usages** オプションは、デフォルト・テンプレート以外の特定の表示ページ・テンプレートを使用しているコンテンツのリストを提供します。 このオプションは、デフォルトのテンプレートでは使用できません。

![Managing your display page template using the Actions menu](./creating-and-managing-display-page-templates/images/07.png)

使用中の表示ページテンプレートを削除する前に、コンテンツから表示ページテンプレートの割り当てを解除するには、2つの方法があります。

* デフォルトに割り当てる：コンテンツは現在の表示ページテンプレートから割り当てを解除し、コンテンツの種類とサブタイプのデフォルト表示ページテンプレートに割り当てます（該当する場合）。
* 割り当て解除：コンテンツはどの表示ページテンプレートにも割り当てられていません。

以下の手順で、表示ページテンプレートの使用量を表示し、コンテンツの割り当てを解除してください。

1. ![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **デザイン** &rarr; **ページテンプレート** に移動します。

1. **表示ページテンプレート** タブをクリックします。

1. 表示ページテンプレートの **Actions** メニュー(![Actions](../../../images/icon-actions.png))をクリックし、 **View Usages** を選択します。

1. 表示ページテンプレートを使って、コンテンツのリストから1つまたは複数の要素を選択します。

1. 右上の **Actions** メニュー(![Actions](../../../images/icon-actions.png))をクリックし、 **Assign to Default** または **Unassign** を選択します。

1. **OK** をクリックしてください。

コンテンツを新しい表示ページテンプレートに割り当てた場合は、コンテンツが期待どおりに表示されることを確認してください。 コンテンツをプレビューして表示するには、 [表示ページによるコンテンツの公開](./publishing-content-with-display-pages.md) を参照してください。

## 関連トピック

[表示ページによるコンテンツの公開](./publishing-content-with-display-pages.md)

[SEOとオープングラフの設定](./configuring-seo-and-open-graph.md)

[コンテンツページの使用](./../../creating-pages/using-content-pages.md)

[コンテンツページに要素を追加する](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
