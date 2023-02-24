# 表示ページテンプレートの作成と管理

{bdg-secondary}`Liferay DXP/Portal 7.3以降で利用可能`

表示ページテンプレートは、専用のフレンドリーなURLにコンテンツを表示するための構造を定義します。 これらのテンプレートは、現在、以下のコンテンツタイプに対応しています。

* [ブログエントリー](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [カテゴリー](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`利用可能 7.4+`
* [Custom Objects](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`Available 7.4+`
* [ドキュメントとメディア](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [Webコンテンツの記事](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

詳しくは、「 [表示ページテンプレートの使用」](../using-display-page-templates.md) を参照してください。

## 表示ページテンプレートの作成

以下の手順で、表示ページのテンプレートを作成します。

1. **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 **デザイン** &rarr; **ページテンプレート** をクリックします。

1. ［**Display Page Templates**］ タブをクリックします。

   ![[ページテンプレート]に移動し、 [表示ページテンプレート]タブをクリックします。](./creating-and-managing-display-page-templates/images/02.png)

1. **追加** ボタン (![Add Button](./../../../images/icon-add.png)) をクリックします。

1. テンプレートの ［**Name**］ を入力し、 該当する場合は ［**Content Type**］ と ［**Subtype**］ を選択します。 次に、 ［**Save**］ をクリックします。

   ![新しいテンプレートのコンテンツ タイプとサブタイプを選択します。](./creating-and-managing-display-page-templates/images/03.png)

1. [コンテンツページ](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md)と同じインターフェースとページ要素を使用してテンプレートを設計します。

   ![フラグメントとウィジェットを使ってテンプレートを構築します。](./creating-and-managing-display-page-templates/images/04.png)

1. ページ要素を追加したら、編集可能なフィールドをダブルクリックして、 [map](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) コンテンツ構造のフィールド（例：タイトル、説明）に追加することができます。 マップされたフィールドは紫の輪郭で示されます。

   ```{tip}
   表示ページテンプレートのSEOおよびOpen Graphの設定を行う際に、マッピングされたフィールドを使用することができます。 詳しくは、[SEOとOpen Graphの設定](./configuring-seo-and-open-graph.md)をご覧ください。
   ```

   ![ページ要素を構造体フィールドにマッピングする。](./creating-and-managing-display-page-templates/images/05.png)

1. 公開前に、 [プレビュー機能](#preview-the-display-page-template-content-mappings) (available 7.4+) を使って、既存のコンテンツとの編集可能フィールドのマッピングをプレビューすることができます。

1. 完了したら、 ［**公開**］ をクリックして作業内容を保存します。

これで、テンプレートを使って、 [コンテンツの表示ができるようになりました。](./publishing-content-with-display-pages.md).

### 表示ページテンプレートコンテンツマッピングのプレビュー

{bdg-secondary}`7.4以降で利用可能`

編集中、Liferayはコンテンツアイテムを持つ表示ページテンプレートをプレビューする2つの方法を提供します。

アプリケーションメニューから、 **Preview With** ドロップダウンメニューをクリックし、コンテンツアイテムを選択することができます。 項目が表示されない場合は、「**他の項目を選択する**」 をクリックし、目的のコンテンツを参照します。 これにより、フィールドマッピングに従って、テンプレートにコンテンツデータが動的に入力されます。

![表示ページテンプレートのプレビューに使用するコンテンツを選択します。](./creating-and-managing-display-page-templates/images/07.png)

または、表示ページテンプレートエディターから、 **Actions** メニュー(![Actions menu](../../../images/icon-actions.png))ボタンをクリックし、 **Preview in a New Tab** を選択します。

![プレビューボタンをクリックすると、表示ページテンプレートのマッピングをプレビューすることができます。](./creating-and-managing-display-page-templates/images/08.png)

## 表示ページテンプレートの使用量の表示

{bdg-secondary}`7.4以降で利用可能`

異なる表示ページのテンプレートは、 **Actions** メニュー (![Actions](../../../images/icon-actions.png)) を使って管理できます。 ここから、 **View Usages** オプションで、デフォルトテンプレート以外の特定の表示ページテンプレートを使用しているコンテンツの一覧が表示されます。 このオプションは、デフォルトのテンプレートでは使用できません。

![アクションメニューによる表示ページテンプレートの管理](./creating-and-managing-display-page-templates/images/06.png)

使用中の表示ページテンプレートを削除する前に、コンテンツから表示ページテンプレートの割り当てを解除するには、2つの方法があります。

* デフォルトに割り当てる：コンテンツは現在の表示ページテンプレートから割り当てを解除し、コンテンツタイプとサブタイプのデフォルトの表示ページテンプレートに割り当てます（該当する場合）。
* 割り当てを解除します。あなたのコンテンツは、どの表示ページテンプレートにも割り当てられていません。

以下の手順で、表示ページのテンプレートの使用状況を確認し、コンテンツの割り当てを解除してください。

1. **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**Design**］ &rarr; ［**Page Templates**］ に移動します。

1. ［**Display Page Templates**］ タブをクリックします。

1. 表示ページテンプレートの **アクション** メニュー (![Actions](../../../images/icon-actions.png)) をクリックし、 **使用状況の表示** を選択します。

1. 表示ページのテンプレートを使って、コンテンツのリストから1つまたは複数の要素を選択します。

1. 右上の「**アクション**」 メニュー (![Actions](../../../images/icon-actions.png)) をクリックし、「**デフォルトに割り当てる**」 または「**割り当てを解除する**」 を選択します。

1. ［**OK**］ をクリックします。

コンテンツを新しい表示ページテンプレートに割り当てた場合、コンテンツが期待通りに表示されることを確認します。 コンテンツをプレビューして表示するには、 [Display Pagesを使ったコンテンツの公開](./publishing-content-with-display-pages.md)を参照してください。

## 追加情報

* [表示ページによるコンテンツの公開](./publishing-content-with-display-pages.md)
* [SEOとOpen Graphの設定](./configuring-seo-and-open-graph.md)
* [コンテントページの使用](./../../creating-pages/using-content-pages.md)
* [コンテントページへの要素の追加](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
