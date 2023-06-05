# ミニカートフラグメントの使用

{bdg-secondary}`利用可能 Liferay DXP 7.4 U69+/GA69+`

Mini Cartフラグメントは、カートの詳細な概要を提供します。 商品の数量を増やしたり減らしたり、商品を削除したり、チェックアウトのためにカートを送信したり、商品を検索して素早くカートに追加したりするために使用できます。

このフラグメントが正しく動作するためには、サイトに [カタログ](../commerce-storefront-pages/catalog.md)、 [オープンカート](../commerce-storefront-pages/pending-orders.md)、 [チェックアウト](../commerce-storefront-pages/checkout.md) のページがある必要があります。

## ミニカートフラグメントをページに追加する

1. 目的のコンテンツページまたはテンプレートに移動し、 **Edit**(![Edit icon](../../images/icon-edit-pencil.png)) をクリックします。

1. サイドバーの「フラグメントとウィジェット」（![Add Widget icon](../../images/icon-plus.png)）で、「**ミニカート**」（）を検索してください。

   ![フラグメントとウィジェット」メニューから、「ミニカート」フラグメントを検索します。](./using-the-mini-cart-fragment/images/01.png)

1. フラグメントをページ上にドラッグ＆ドロップします。 このフラグメントを [ミニカート](../liferay-commerce-widgets/using-the-mini-cart-widget.md) ウィジェットと間違えないでください。

1. ［**Publish**］ をクリックします。

   ![カートのアイコンをクリックすると、ミニカートが開きます。](./using-the-mini-cart-fragment/images/02.png)

## ミニカート詳細

ミニカートのフラグメントをページに追加した後、

1. **カートに入れる** をクリックすると、商品が表示されます。

   ![商品の上で「カートに入れる」をクリックすると、ミニカートに追加されます。](./using-the-mini-cart-fragment/images/03.png)

1. ミニカートのアイコン(![Mini Cart](../../images/icon-mini-cart.png))をクリックすると、これらの詳細が表示されます：

   * 製品名
   * SKU
   * 数量
   * 価格
   * 小計
   * 小計割引
   * 注文割引
   * 合計

   ![Mini Cartフラグメントは、現在のカートの状態を詳細に説明します。](./using-the-mini-cart-fragment/images/04.png)

ヘッダーエリアには、2つのボタンがあります：

**詳細を表示する** オープンカートのページに移動して、オープンオーダーの詳細を表示します。

**すべての商品を削除する** カートの中の商品を削除します。

商品リストエリアには、カート内の全商品が数量と価格とともに表示されます。 ここでは、個々の商品の削除（![Delete](../../images/icon-delete.png)）または数量の調整を行うことができます。 変更すると、カートの概要欄が自動的に更新されます。 **Submit** をクリックしてチェックアウトを続けます。

## 商品を素早くカートに入れる

フラグメントの検索バーを使って、素早くカートに商品を追加することができます。 製品名や既知のSKUで検索することができます。 カタログを検索する負担をなくすことで、オーダー作成時間を短縮することができます。

ミニカートのフラグメントをページに追加した後、

1. [アカウントセレクター](./using-the-account-selector-fragment.md)から新規注文を作成します。

1. ミニカートを開き、既知のSKUまたは製品を検索します。

1. SKUを選択し、ミニカート(![Mini Cart](../../images/icon-mini-cart.png))アイコンをクリックします。

これにより、SKUがカートに追加されます。 必要であれば、複数のSKUを一度に追加することもできます。

![複数のSKUを一度に追加するには、各SKUを選択し、ミニカートのアイコンをクリックします。](./using-the-mini-cart-fragment/images/05.gif)

<!-- Add this when ready

### Adding Discontinued Products to Cart

SKUs may reach end-of-life (EOL) and be marked as discontinued. Discontinued SKUs may or may not get a replacement. Replacement SKUs get added automatically to the cart when you try adding the discontinued SKU through quick add-to-cart.  -->

## 関連トピック

[カタログ](../commerce-storefront-pages/catalog.md)
[保留中の注文](../commerce-storefront-pages/pending-orders.md)
[チェックアウト](../commerce-storefront-pages/checkout.md)
