# 製品表示ページの作成

Liferay Commerceを使用すると、ストア製品を個別のサイトページに紐付けて、製品ごとに専用の表示ページを作成できます。 既成のウィジェットやカスタムウィジェット、フラグメントを使用して、レイアウトを短時間でデザインし、製品詳細を表示できます。

以下の手順で、製品の表示ページを設定します。

1. ストアで新しいサイトページを作成し、 ［**商品詳細**］ ウィジェットを他の必要なページ要素と一緒に追加します。 詳細は、 [コンテンツページの構築](https://learn.liferay.com/dxp/latest/ja/site-building/creating-pages/building_and_managing_content_pages.html) を参照してください。 このページで、リンクされた製品を表示する際のレイアウトを決定します。

1. ［**グローバルメニュー**］(![Global Menu](../images/icon-applications-menu.png))を開き、 ［**Commerce**］ タブをクリックし、 ［**店舗管理**］ &rarr; ［**Channels**］ へ移動します。

1. 必要な ［**チャネル**］ を選択し、 ［**Product Display Pages**］ タブをクリックし、 ［**追加**］ ボタン（![Add Button](../images/icon-add.png)）をクリックします。

   ![［商品表示ページ］タブで［追加］をクリックします。](./creating-product-display-pages/images/02.png)

1. ［**Select Product**］ をクリックし、新規サイトページにリンクさせたい商品を **選択** します。

1. ［**Product Display Pag**］ の ［**Choose**］ をクリックし、新規タイトルのページを選択し、 ［**Done**］ をクリックします。

   ![新しいページを選択します。](./creating-product-display-pages/images/03.png)

1. 完了したら、 ［**Save**］ をクリックします。

これにより、製品と選択したページが即座に関連付けられます。 これで、ユーザーがストアで製品をクリックすると、製品の表示ページにリダイレクトされるようになります。

保存済みのすべての設定は、［Product Display Pages］タブで確認・管理できます。

![保存済みのすべての設定は、［商品表示ページ］タブで確認・管理できます。](./creating-product-display-pages/images/04.png)

```{note}
製品詳細やカテゴリーコンテンツウィジェットが配置されたレイアウトが2つある場合、Liferayはレイアウトリストに記載された最初のレイアウトをデフォルトとします。
```

## 関連トピック

* [ストアフロントの作成](./creating-your-storefront.md)
* [カタログページの作成](./creating-a-catalog-page.md)
