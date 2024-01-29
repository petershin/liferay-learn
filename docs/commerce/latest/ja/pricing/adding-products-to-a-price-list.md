# 商品を価格表に追加する

[価格リスト](./creating-a-price-list.md) を作成したら、価格エントリーを作成し、商品SKUを追加します。 これらの項目は、商品の単価を決定する際に使用され、対象となる顧客に対してSKUの基本価格を上書きします。

商品SKUの価格リストに価格項目を追加するには、以下の手順に従ってください：

1. **グローバルメニュー**（ [アプリケーションメニューアイコン](../images/icon-applications-menu.png) ）を開き、 **価格設定** &rarr; **価格リスト** に移動します。

1. **設定したい** 価格リスト **を選択し、** エントリー_タブに進みます。

1. ご希望の商品を検索し、 **選択** をクリックすると、選択した価格リストに追加されます。

   商品を検索する際には、SKU、またはキーワードやフレーズを使うことができます。 キーワードやフレーズを入力すると、該当する商品がSKUごとに表示されます。

   ![Search for your products by SKU, keyword, or phrase.](./adding-products-to-a-price-list/images/04.png)

   {bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU に [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) が設定されている場合、設定されている各 UOM を個別の項目として価格リストに追加できます。

   ![Search for all units of measure configured for an SKU.](./adding-products-to-a-price-list/images/05.png)

1. **Publish** をクリックすると価格リストが入力されます。

## Commerce 2.1以前

[価格表](./creating-a-price-list.md) を作成したら、商品を追加できます。 この記事では、価格表に商品を追加する2つの方法について説明します。 価格表を介して設定された価格は、関連ユーザーの特定のSKUに対して直接設定されている価格よりも優先されます。

### 価格表メニューから価格表に商品を追加する

多数の既存の商品を新しい価格表に追加するときは、次の方法を使用して価格表にすばやく値を読み込みます。

1. コントロールパネル **&rarr;** Commerce **&rarr;** Price Lists_に移動します。

1. 価格リスト（この例では **VIP Customer**）をクリックします。

1. Entries_サブタブをクリックする。

1. （+）ボタンをクリックします。

1. 価格リストに追加する1つ以上の製品（この例では **Premium Brake Fluid** と **Premium Brake Pads**）を選択します。

1. 「追加」をクリックする。

1. 製品（この例では **Premium Brake Fluid**）をクリックします。

1. 次のフィールドに入力します。
   * **価格** : 100
   * **プロモ価格** : 95

     ![Adding a product to a price list](./adding-products-to-a-price-list/images/01.png)

1. 「保存」をクリックする。

商品が価格表に追加されます。 以上の操作を必要に応じて繰り返します。

### 商品メニューから価格表に商品を追加する

新しい商品を作成するときは、この方法を使用して既存の価格表に簡単に追加できます。

1. コントロールパネル **&rarr;** Commerce **&rarr;** Products_に移動します。

1. 製品（この例では **Premium Brake Fluid**）をクリックします。

1. **SKUs** タブをクリックします。

1. SKUをクリック (_MIN93017_)

1. 価格リスト」をクリックする。

   ![Adding Products to a Price List in 2.1](./adding-products-to-a-price-list/images/02.png)

1. Add (![Add icon](../images/icon-add.png)) ボタンをクリックします。

1. このSKUを追加する1つ以上の価格リスト（この例では **VIP Customer**）を選択します。

1. 「追加」をクリックする。

これで、価格リストが商品に関連付けられました。

![Adding Products to a Price List in 2.1](./adding-products-to-a-price-list/images/03.png)

製品（**Premium Brake Fluid**）が価格リスト（**VIP Customers**）に追加されました。 この価格表または別の価格表に他の商品を追加するには、上記の手順を繰り返します。

## 関連トピック

* [価格表の作成](./creating-a-price-list.md)
* [価格帯の使用](./using-price-tiers.md)
