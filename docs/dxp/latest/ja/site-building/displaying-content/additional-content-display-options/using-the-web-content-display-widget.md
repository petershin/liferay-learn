# Webコンテンツの表示ウィジェットの使用

[ウェブコンテンツ記事](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)を作成した後、それを表示する最も簡単な方法は、ウェブコンテンツ表示ウィジェットです。 ウェブコンテンツ記事が表示されると、 [ワークフロー](../../../process-automation/workflow/introduction-to-workflow.md) を設定して更新を確認・承認しない限り、コンテンツの更新はすぐに表示されます。

## Webコンテンツの表示をページに追加する

1. **Site Menu**( ![Site Menu](../../../images/icon-product-menu.png) ) にアクセスし、 **Site Builder** &rarr; **Pages** に移動する。

1. 編集したいページの隣にある **アクション**( ![Actions](../../../images/icon-actions.png) ) をクリックし、 **編集** を選択する（または、 [新しいコンテンツページを作成](../../creating-pages/adding-pages/adding-a-page-to-a-site.md)。）

1. **Add**( ![Add widget icon](../../../images/icon-add-widget.png) ) をクリックして、Fragments and Widgets パネルを開きます。

1. ウィジェット」タブの「**コンテンツ管理**」 カテゴリで、「**ウェブコンテンツ表示**」 ウィジェットをページ上の任意の場所にドラッグします。

    ![ウェブコンテンツ表示ウィジェットをページにドラッグ＆ドロップする](./using-the-web-content-display-widget/images/01.png)

1. ウィジェット &rarr; **設定** の右上にある **オプション**( ![Options icon](../../../images/icon-app-options.png) ) をクリックする。

    ![Webコンテンツの表示ウィジェットの設定オプションを開く](./using-the-web-content-display-widget/images/02.gif)

1. ウェブコンテンツ表示設定]で、[設定]タブの下にある[**選択**] をクリックします。

1. ［Webコンテンツの選択］ ダイアログで、追加したいWebコンテンツをクリックします。

   フォルダを使用してコンテンツを整理している場合、フォルダをナビゲートすることで、利用可能なすべてのコンテンツを視覚化できます。 フォルダやコンテンツセクションの上にあるパンくずを、ナビゲーションの手助けに使ってください。

   ![フォルダを使用してウェブコンテンツを整理する場合、フォルダをナビゲートして利用可能なすべてのコンテンツを表示します。](./using-the-web-content-display-widget/images/03.png)

   ```{tip}
   検索バーを使ってすべてのコンテンツ（*）を検索することができます。 これは、サイト上で利用可能なすべてのフォルダとウェブコンテンツのリストを返します。
   ```

1. [ウェブコンテンツ表示オプションの設定](#web-content-display-setup-options) .

1. **Save** をクリックし、Web Content Display Configuration ダイアログを閉じます。

1. コンテンツページを公開する場合は、 ［**公開**］ をクリックします。

## Webコンテンツの表示設定オプション

ウェブコンテンツを選択すると、ウェブコンテンツ表示ウィジェットで他のオプションを設定できます。

ウィジェットの設定にアクセスするには、ウェブコンテンツ表示ウィジェットにカーソルを合わせ、ウィジェットの **オプション**( ![Options icon](../../../images/icon-widget-options.png) ) から、 **設定** を選択します。 設定オプションはSetupタブの下に表示されます。

![ウェブコンテンツ表示の設定オプション](./using-the-web-content-display-widget/images/04.png)

### テンプレート

| オプション             | 説明                                                                 |
|:----------------- |:------------------------------------------------------------------ |
| デフォルトのテンプレートを使用する | ウィジェットの表示にデフォルトのテンプレートを使用します。 ここで使用されているデフォルトのテンプレートの名前を見ることができます。 |
| 特定のテンプレートを使用する    | 別のテンプレートでウィジェットを表示する場合は、このオプションを選択します。 新しいテンプレートを選択する必要があります。      |

### ユーザーツール

| オプション                    | 説明                                                                                                                                                                       |
|:------------------------ |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 翻訳                       | コンテンツの追加翻訳を表示します。 異なる言語に翻訳されたコンテンツをお持ちの場合、このオプションを使用して希望の翻訳を表示します。                                                                                                       |
| 印刷する                     | 印刷に適したバージョンのコンテンツを含む印刷ダイアログを提供します。                                                                                                                                       |
| PDF、DOC、ODT、TXTとしてダウンロード | 選択されたウィジェットのコンテンツを任意のフォーマットでダウンロードします。 このオプションは、 [OpenOffice または LibreOffice の統合](#integrating-open-office-or-libre-office-with-the-web-content-display) を設定した後でのみ利用可能です。 |

### メタデータコンテンツ

| オプション        | 説明                                                                                                                                                                                                                                             |
|:------------ |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 関連するアセット     | 関連する他のコンテンツへのリンクを表示する場合に設定します。 関連コンテンツは、コンテンツの Related Assets プロパティで設定します（基本的なウェブコンテンツアセットの例については、以下の画像を参照してください）。                                                                                                                             |
| 評価           | ユーザーがさまざまな方法（いいね、スター、親指をたててグーなど）でコンテンツを評価できるクリック可能なオプションを表示します。 この評価オプションを異なるコンテンツの種類に設定するには、 [コンテンツの評価タイプの設定](../../../site-building/site-settings/site-content-configurations/configuring-content-rating-type.md) を参照してください。 |
| 掲示板のディスカッション | ウェブコンテンツ表示ウィジェットのコンテンツにユーザーがコメントを入力できるようにします。 デフォルトでは、ゲストはコメントを残すことはできません。 デフォルトのオプションを変更するには、 [Enabling Comments for Guest](#enabling-comments-for-guests) を参照してください。                                                                         |
| コメントの評価      | コメントの評価オプションを表示します。                                                                                                                                                                                                                            |

![基本的なウェブコンテンツエントリーの関連アセットの設定](./using-the-web-content-display-widget/images/05.png)

### カウンター増加を確認する

このウェブコンテンツ表示ウィジェットにビューカウンタを追加するには、 **ビューカウント増加** オプションを有効にします。

## Webコンテンツの表示ウィジェットの追加オプション

[セットアップオプション](#web-content-display-setup-options) に加えて、ウェブコンテンツ表示ウィジェットで追加設定を行うことができます。

### ゲストのコメントを有効にする

デフォルトでは、ゲストはWebコンテンツにコメントを残すことはできません。 Webコンテンツの記事にゲストがコメントできるようにするには、次の手順を実行します。

1. [Global Menu](../../../getting-started/navigating-dxp.md) ( ![Global Menu icon](../../../images/icon-applications-menu.png) ) を開き、 **Control Panel** &rarr; **Users** &rarr; **Roles** に移動する。

1. **ゲスト** ロールをクリックします。

1. ［**権限の定義**］ の列をクリックします。

1. 左のメニューから、 ［**サイトとアセットライブラリの管理**］ &rarr; ［**コンテンツ & データ**］ &rarr; ［**Webコンテンツ**］ を選択します。

1. ［**Webコンテンツの記事**］ のセクションで、 ［**Add Discussion**］ にチェックを入れます。

1. ［**保存**］ をクリックします。

### Webコンテンツの表示ウィジェットからコンテンツを編集する

編集モードのコンテンツページで作業する場合、ウェブコンテンツ表示ウィジェットから公開コンテンツを直接編集できます。

1. ウェブコンテンツ表示ウィジェットをクリックします。

1. 左側のサイドバーパネルで、 **Page Content**( ![Page Content icon](../../../images/icon-paperclip.png) ) をクリックします。

1. 編集したいコンテンツの **Actions**( ![Actions](../../../images/icon-actions.png) ) をクリックし、 **Edit** を選択する。

    ![ウェブコンテンツ表示ウィジェットの編集オプションを開く](./using-the-web-content-display-widget/images/06.png)

### OpenOfficeまたはLibreOfficeとWebコンテンツの表示の統合

[OpenOffice / LibreOffice integration](../../../content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration.md) を Liferay ポータルインスタンスで有効にすると、コンテンツのドキュメント変換を有効にすることができます。 この統合により、ユーザーはさまざまなフォーマットでコンテンツをダウンロードできるようになります。 ウェブコンテンツ表示ウィジットのために、 [ユーザーツール](#user-tools) 構成の下で利用可能なフォーマットを選択する必要があります。

## 関連トピック

- [基本Webコンテンツ記事の追加](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)
- [コンテントページの使用](../../../site-building/creating-pages/using-content-pages.md)
- [Displaying Content on Display Pages Templates](../using-display-page-templates.md)
- [アセットの表示](../using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)
