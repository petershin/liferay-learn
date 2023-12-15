# 倉庫別の在庫の設定

複数の倉庫を持つ店舗は、倉庫ごとに商品在庫管理できます。 在庫メニューでは、各倉庫で購入可能な商品数を管理することができます。

倉庫別の在庫を設定するには：

1. **グローバルメニュー**(![グローバルメニュー](../images/icon-applications-menu.png))を開き、 **Commerce** &rarr; **Products** に移動します。

1. 商品をクリックします。

1. **SKUs** タブをクリックし、SKUを選択します。

1. インベントリ*タブをクリックします。

1. 利用可能な倉庫の数量を入力します。

   {bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU に [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) を設定している場合、倉庫ごとに数量を入力することができます。

   ![Enter the quantity of available units for an SKU in each warehouse.](./setting-inventory-by-warehouse/images/01.png)

1. 各倉庫の **保存** をクリックします。

1. 商品に関連する他のSKUについても、この手順を繰り返してください。

各倉庫に、現在販売可能な正しい数量が設定されました。

## 倉庫間での在庫の移動

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU に [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) が設定されている場合、在庫は SKU に設定された単位で追跡されます。 それ以外の場合、在庫はSKUレベルで追跡される。 この情報はインベントリーのページで確認できる。

ストアに複数の倉庫がある場合、1つの倉庫から別の倉庫に在庫を転送できます。

倉庫間で在庫を転送するには：

1. [グローバルメニュー](../images/icon-applications-menu.png) を開き、 **Commerce** &rarr; **Inventory** に移動します。

1. SKUを選択してください。

1. **Add**（ [Addボタン](../images/icon-add.png) ）をクリックし、 **Create a Transfer** を選択します。

   ![You can transfer stock from one warehouse to another.](./setting-inventory-by-warehouse/images/02.png)

1. 数量、ソース、および宛先を入力します。

   この例では、選択したSKUの40ユニットを米国南西部の倉庫から米国北西部の倉庫に転送します。

   * **数量** :40
   * **ソース** ：米国 - 南西部
   * **目的地** : アメリカ - 北西部

   ![Enter the quantity, source, and destination to transfer stock.](./setting-inventory-by-warehouse/images/03.png)

1. **Submit** をクリックしてください。

これで、各倉庫の在庫が更新されました。

## Commerce 2.1以前

倉庫別の在庫を設定するには：

1. **コントロールパネル** &rarr; **Commerce** &rarr; **Products** に移動します。

1. 商品をクリックします。

1. **SKUs** タブをクリックし、SKUを選択します。

1. **インベントリ** タブをクリックします。

1. 利用可能な倉庫の数量を入力します。

   ![Enter the number of available units for an SKU in each warehouse.](./setting-inventory-by-warehouse/images/04.png)

1. 各倉庫の **保存** をクリックします。

1. 商品に関連付けられている他のすべての商品バリアント（SKU）について、これらの手順を繰り返します。

各倉庫に、現在販売可能な正しい数量が設定されました。

### 倉庫間での在庫の移動

ストアに複数の [倉庫](./setting-up-warehouses.md) 場合、ユーザーは1つの倉庫から別の倉庫に在庫を転送できます。 在庫はSKUレベルで追跡され、 **在庫** ページに反映されます。

倉庫間で在庫を転送するには：

1. **コントロールパネル** &rarr; **Commerce** &rarr; **Inventory** に移動します。

1. SKUを選択してください。

1. **Add**(![Add icon](../images/icon-add.png)) ボタンをクリックし、次に **Create a Transfer** をクリックします。

   ![Users can transfer stock between warehouses](./setting-inventory-by-warehouse/images/05.png)

1. 選択したSKUの40ユニットを米国南西部の倉庫から米国北西部の倉庫に移動するには、次の情報を入力してください。

   * **数量40
   * **ソース** ：米国南西部
   * **目的地アメリカ北西部

   ![Enter the quantity, source, and destination to transfer stock.](./setting-inventory-by-warehouse/images/03.png)

1. **Submit** をクリックしてください。

これで、各倉庫の更新された在庫を確認できるようになりました。

## 関連トピック

* [コマース倉庫の設定](./setting-up-warehouses.md)
* [在庫管理リファレンスガイド](./inventory-management-reference-guide.md)
