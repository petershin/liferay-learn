# 在庫管理システムの活用

Liferayの在庫管理システムを使用して、インスタンス内の商品SKUの在庫を管理できます。 本システムは、SKUを管理する以下の機能を備えています。

* 在庫を追加
* 元の注文を表示
* 安全在庫を追加
* 変更履歴を表示

製品 SKU または [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) の在庫を追加する前に、在庫を保管する倉庫を少なくとも 1 つ作成する必要があります。 詳しくは、 [倉庫の設定](./setting-up-warehouses.md) をご覧ください。

インベントリーページにアクセスするには、_グローバルメニュー_ ([グローバルメニュー](../images/icon-applications-menu.png))を開き、_Commerce_ &rarr; _Inventory_に移動します。

```{note}
Commerce 2.0または2.1をお使いの場合、在庫管理オプションはコントロールパネルにあります。
```

## SKUの在庫を追加する

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` SKU に [単位](../product-management/creating-and-managing-products/products/units-of-measure.md) が設定されている場合、在庫は SKU のその単位で追跡されます。 それ以外の場合、在庫はSKUレベルで追跡される。

在庫エントリーを作成する際には、SKU、倉庫、数量を指定する必要があります。 SKUがなければ、商品に在庫を追加することはできません。

次の手順を実行します：

1. [グローバルメニュー](../images/icon-applications-menu.png) を開き、_Commerce_ &rarr; _Inventory_ に移動します。

2. *追加* (![追加ボタン](../images/icon-add.png))をクリックし、SKU、倉庫、数量を入力します。 例えば、

   * **SKU**：チャイナウェア・グレー
   * **倉庫**: 米国 - 南西部
   * **数量**: 120

   ![Enter the SKU, warehouse and quantity for the new inventory item.](./using-the-inventory-management-system/images/01.png)

3. *Submit*をクリックしてください。

選択した倉庫のSKUの在庫を追加します。

```{tip}
商品アプリケーションでSKUを編集しているときに、SKUの在庫を追加することができます。 詳しくは [SKU在庫の追加](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md#adding-sku-inventory) をご覧ください。
```

## 安全在庫の設定

安全在庫とは、倉庫にある商品在庫のうち、販売できないように取り置かれたものです。 これは、出荷の遅れ、サプライチェーンの中断、異なるチャンネルでの販売など、さまざまな理由が考えられます。 安全在庫量は、選択された倉庫の利用可能な在庫を減らすことができます。

安全在庫量を設定するには：

1. [グローバルメニュー](../images/icon-applications-menu.png) を開き、_Commerce_ &rarr; _Inventory_ に移動します。

1. *SKU*をクリックしてください。

1. 倉庫の横にある_Actions_（！[Actions Button](../images/icon-actions.png)）をクリックし、_Edit_を選択します。

1. 安全在庫数量*フィールドに値を入力する。

   ![Set a safety stock quantity for the selected SKU.](./using-the-inventory-management-system/images/02.png)

1. 終了したら、_保存_をクリックします。

使用可能なユニットは安全在庫量によって減少します。 ［Available］列で確認できます。

![Setting a safety stock quantity reduces available stock in a warehouse.](./using-the-inventory-management-system/images/03.png)

## 注文中のSKUを表示する

1. グローバルメニュー](../images/icon-applications-menu.png) を開き、_Commerce_ &rarr; _Inventory_ に移動します。

1. *SKU*をクリックしてください。

1. *On Order*タブをクリックします。

   ![View all orders that include the selected SKU.](./using-the-inventory-management-system/images/04.png)

このページでは、選択したSKUを含むすべての注文を一覧表示します。 注文したアカウント、注文ID、数量、有効期限を確認することができます。

## 入荷在庫の追加

入荷在庫とは、将来的に倉庫に入荷する予定のSKU在庫のことです。 入荷在庫数や配達予定日を追加できます。

1. [グローバルメニュー](../images/icon-applications-menu.png) を開き、_Commerce_ &rarr; _Inventory_ に移動します。

1. *SKU*をクリックしてください。

1. 着信」タブをクリックする。

1. 追加*([追加ボタン](../images/icon-add.png))をクリックし、数量、お届け先倉庫、お届け予定日を入力します。 例えば、

   * **数量20
   * **目的地アメリカ * 北東部
   * **納品予定日2022年11月20日（これは将来の日付です）

   ![Add incoming stock for the selected SKU.](./using-the-inventory-management-system/images/05.png)

1. *Submit*をクリックしてください。

入荷在庫を追加すると、［Overview］ページの［Incoming］列に表示されます。

![The incoming stock quantity appears on the SKU's Overview page.](./using-the-inventory-management-system/images/06.png)

## 在庫変更の確認

チェンジログページでSKUの在庫の変更を確認できます。

1. [グローバルメニュー](../images/icon-applications-menu.png) を開き、_Commerce_ &rarr; _Inventory_ に移動します。

1. *SKU*をクリックしてください。

1. *Changelog*タブをクリックします。

以下の情報をチェンジログで把握できます。

* 発注後、注文を履行するために予約されたSKUのユニット。
* 出荷を作成し、前回予約した総量をコミットした後、在庫から削除されたSKUのユニット。
* 倉庫の在庫に追加されたSKUのユニット。
* 倉庫間で移動したSKUのユニット。
* 出荷をキャンセルして返品されたSKUのユニット。
* 在庫内のSKUの更新。

![View different events associated to the inventory of the selected SKU.](./using-the-inventory-management-system/images/07.png)

## 関連トピック

* [在庫管理リファレンスガイド](./inventory-management-reference-guide.md)
* [倉庫リファレンスガイド](./warehouse-reference-guide.md)
* [倉庫別在庫設定](./setting-inventory-by-warehouse.md)
