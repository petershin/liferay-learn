# ミニカートフラグメントの使用

{bdg-secondary}`liferay DXP 7.4 U69+/GA69+` 

ミニカートのフラグメントは、カートの詳細な概要を提供します。 商品数量の増減、商品の削除、チェックアウトのためのカート投入、商品の検索とカートへの迅速な追加が可能です。

このフラグメントを正しく動作させるには、 [カタログ](../commerce-storefront-pages/catalog.md) 、 [オープンカート](../commerce-storefront-pages/pending-orders.md) 、 [チェックアウト](../commerce-storefront-pages/checkout.md) ページが必要です。

## ミニカートフラグメントをページに追加する

1. 目的のコンテンツページまたはテンプレートに移動し、 **Edit**（![編集アイコン](../../images/icon-edit-pencil.png)）をクリックします。

1. フラグメントとウィジェットのサイドバー（ [ウィジェットアイコンを追加](../../images/icon-plus.png) ）で、 **ミニカート** を検索します。

   ![Search for the Mini Cart fragment from the Fragments and Widgets menu.](./using-the-mini-cart-fragment/images/01.png)

1. フラグメントをページにドラッグ＆ドロップする。 このフラグメントを [ミニカート](../liferay-commerce-widgets/using-the-mini-cart-widget.md) ウィジェットと間違えないでください。

1. Publish_をクリックする。

   ![Click the cart icon to open the Mini Cart.](./using-the-mini-cart-fragment/images/02.png)

## ミニカート詳細

ミニカートのフラグメントをページに追加した後、

1. 商品の **カートに入れる** をクリックします。

   ![Click Add to Cart on a product to add it to your Mini Cart.](./using-the-mini-cart-fragment/images/03.png)

1. ミニカートのアイコン(![ミニカート](../../images/icon-mini-cart.png))をクリックすると、これらの詳細が表示されます：

   * 製品名
   * SKU
   * 数量
   * 価格
   * 小計
   * 小計割引
   * 注文割引
   * 合計

   ![The Mini Cart fragment gives a detailed overview of the current cart status.](./using-the-mini-cart-fragment/images/04.png)

ヘッダーエリアには2つのボタンがある：

**詳細を見る：** オープンカートのページに移動し、オープンオーダーに関する詳細を表示します。

**すべての商品を削除する：** カートの商品を削除します。

商品リストエリアには、カート内の全商品が数量と価格とともに表示されます。 ここでは、個々の製品の削除（ [削除](../../images/icon-delete.png) ）または数量を調整することができます。 変更を加えると、カートの概要セクションが自動的に更新されます。 チェックアウトを続行するには、 **Submit** をクリックしてください。

## 商品を素早くカートに入れる

フラグメント内の検索バーを使って、商品を素早くカートに入れることができる。 製品名または既知のSKUで検索します。 これにより、カタログを検索する負担がなくなり、注文を作成する時間を短縮することができる。

ミニカートのフラグメントをページに追加した後、

1. [アカウントセレクタ](./using-the-account-selector-fragment.md) から新規注文を作成する。

1. ミニカートを開き、既知のSKUまたは製品を検索します。

1. SKUを選択し、ミニカート(![ミニカート](../../images/icon-mini-cart.png))アイコンをクリックします。

これでSKUがカートに追加されます。 必要に応じて、一度に複数のSKUを追加することができます。

![Add multiple SKUs at once by selecting each SKU and clicking on the Mini Cart icon.](./using-the-mini-cart-fragment/images/05.gif)

<!-- Add this when ready

### Adding Discontinued Products to Cart

SKUs may reach end-of-life (EOL) and be marked as discontinued. Discontinued SKUs may or may not get a replacement. Replacement SKUs get added automatically to the cart when you try adding the discontinued SKU through quick add-to-cart.  -->

## 関連トピック

[カタログ](../commerce-storefront-pages/catalog.md)

[保留中の注文](../commerce-storefront-pages/pending-orders.md)

[チェックアウト](../commerce-storefront-pages/checkout.md)
