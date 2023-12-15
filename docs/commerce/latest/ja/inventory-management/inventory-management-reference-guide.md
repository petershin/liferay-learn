# 在庫管理リファレンスガイド

インベントリ設定にアクセスするには、 **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動します。

![Navigate to the inventory settings from the Global Menu.](./inventory-management-reference-guide/images/01.png)

このページには、商品のSKU、単位、在庫状況が表示されます。

![This page tracks all catalog SKUs and displays their availability.](./inventory-management-reference-guide/images/02.png)

| 項目        | 説明                                                                                                                                                                     |
| :-------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SKU       | 在庫システムの主要な識別子。                                                                                                                                                         |
| UOM       | [SKUに設定された測定単位](../product-management/creating-and-managing-products/products/units-of-measure.md) 。 {bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+`. |
| 現在高       | 全倉庫からのSKUまたは単位の入手可能な総数。                                                                                                                                                |
| 設定可能一覧    | SKUまたは単位の購入可能単位数。 Liferayの数式：[利用可能な数量] = [手持数量] - [発注数量] - [安全在庫量]                                                                                                 |
| 受注オーダー可能数 | SKUまたは原単位の未決済オーダーに割り当てられたユニット数。 この数量は、注文が出荷されたときに消費されます。                                                                                                               |
| 受信        | あるSKUに対して補充を予定しているが、未受け取りの数量。 数値はあくまで参考値であり、計算によるものではありません。 管理者は、将来の数量を把握するために利用することができます。                                                                             |

## SKUの詳細

個々のSKUを表示する場合、以下4つのタブがあります：［Overview］、［On Order］［Incoming］、［Changelog］。

### 概要

［Overview］タブには、すべての倉庫にあるSKUの在庫の概要が表示されます。

![The Overview tab displays a summary of the inventory across all warehouses.](./inventory-management-reference-guide/images/03.png)

| 項目     | 説明                 |
| :----- | :----------------- |
| 倉庫     | SKUを持つ倉庫のリスト。      |
| 現在高    | 安全在庫を含む保有ユニット数。    |
| 予備在庫   | 安全在庫として確保されたユニット数。 |
| 設定可能一覧 | 購入可能なユニット数。        |
| 受信     | 倉庫への入庫予定数。         |

**追加**( [追加ボタン](../images/icon-add.png) )をクリックして在庫を更新したり、倉庫間で在庫を移動します。

![Add inventory or transfer inventory between warehouses.](./inventory-management-reference-guide/images/04.png)

### 受注オーダー可能数

［On Order］タブには、このSKUを注文したアカウントのリストが表示されます。 このタブには、注文ID、注文数量、有効期限も表示されます。

![The On Order tab lists the accounts that have placed an order for the selected SKU.](./inventory-management-reference-guide/images/05.png)

### 受信

［Incoming］タブには、SKUの在庫補充が予定されている倉庫が一覧表示されます。

![The Incoming tab lists warehouses with scheduled inventory replenishment for the SKU.](./inventory-management-reference-guide/images/06.png)

**追加**(![追加ボタン](../images/icon-add.png))をクリックすると、選択したSKUの入力項目が作成されます。

![Add a quantity for a particular warehouse.](./inventory-management-reference-guide/images/07.png)

| 項目    | 説明             |
| :---- | :------------- |
| 数量    | 入荷数量。          |
| 宛先    | 入荷した商品を保管する倉庫。 |
| 配達予定日 | 配達が予定された日。     |

### チェンジログ

詳しくは、 [在庫変更の確認](./using-the-inventory-management-system.md#viewing-inventory-changes) を参照してください。

## Commerce 2.1以前

在庫の設定は、コントロールパネルにあります。 アクセスするには、 **コントロールパネル** &rarr; **コマース** &rarr; **インベントリ** に移動します。

## 関連トピック

* [商品バリアント用SKUの作成](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md)
* [ローストックアクション](./low-stock-action.md)
* [コマース倉庫の設定](./setting-up-warehouses.md)
* [倉庫リファレンスガイド](./warehouse-reference-guide.md)