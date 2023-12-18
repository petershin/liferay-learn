# 商品の基本価格を設定する

SKUを作成するとき、そのSKUには基本価格がありません。 SKUの価格項目はカタログの基本価格リストに自動的に作成されますが、SKUの実際の価格に変更する必要があります。 一度追加されると、オーバーライド（他の価格リストやプロモーションなど）が適用されない場合、この価格はSKUのデフォルト価格として機能します。

## 基準価格の設定

{bdg-secondary}`liferay DXP 2023.Q4+/Portal GA98+` SKU または単位量当たりの基本価格またはプロモーション価格を割り当てる、

1. **グローバルメニュー**(![アプリケーションメニューアイコン](../images/icon-applications-menu.png))を開き、 **Commerce** &rarr; **Products** に移動します。

1. 目的の商品をクリックします。

1. **SKUs** タブに移動し、目的の*SKU*をクリックします。

1. **価格** タブを開きます。

1. 基本価格リストまたは基本プロモーションリストを選択する。

1. **Price List Price** フィールドに希望の値を入力する。

1. ［**保存**］をクリックします。

SKUに [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) が設定されている場合、基本価格リストと基本プロモーションリストは、各単位ごとに別々の項目として表示されます。 利用可能な単位ごとに異なる価格を設定することができます。

{bdg-secondary}`liferay DXP 2023.Q3/Portal GA97 and Below` SKU の基本価格を割り当てる：

1. **グローバルメニュー**(![アプリケーションメニューアイコン](../images/icon-applications-menu.png))を開き、 **Commerce** &rarr; **Products** に移動します。

1. 目的の商品をクリックします。

1. **SKUs** タブに移動し、目的の*SKU*をクリックします。

1. **Details** タブで、 **Pricing** の下の*Base Price*フィールドに希望の値を入力する。

   オプションで、SKUの **プロモーション価格** と **原価** を設定することもできます。

   ![Set the product's base price.](./setting-a-products-base-price/images/01.png)

   ```{note}
   Liferay DXP 7.4 U42/GA42以前では、プロモーション価格はセール価格と呼ばれていました。
   ```

1. **Publish** をクリックする。

これで、SKUの基本価格とその他の入力値が設定されました。 この金額はいつでも直接編集することができ、価格表、プロモーション価格、割引を使用して変更することもできます。

## Commerce 2.1以前

製品は、レガシーバージョンでは **コントロールパネル** にあります。

1. **コントロールパネル** &rarr; **Commerce** &rarr; **Products** に移動します。

1. 製品（この例ではトルクコンバーター）をクリックしてください。

1. **SKUs** タブをクリックします。

1. SKU（この例では **MIN55859**）をクリックします。

1. **Details** タブのPricingセクションに以下を入力する：

   * **価格** : 34
   * **プロモ価格(空欄のまま**) : (このフィールドを入力すると、上記の価格とプロモ価格の両方が商品ページに表示され、購入者はマークダウンを確認できます)
   * **コスト** : 20

   ![Setting a product's base price in 2.1](./setting-a-products-base-price/images/01.png)

1. **Publish** をクリックする。

この商品SKUの基本価格、プロモーション価格（オプション）、およびコスト（オプション）が設定されました。 Cost_フィールドは、このSKUの原価に対応し、マージンを追跡するのに役立ちます。

## 関連トピック

* [価格表の作成](./creating-a-price-list.md)
* [割引の作成](./promoting-products/creating-a-discount.md)
