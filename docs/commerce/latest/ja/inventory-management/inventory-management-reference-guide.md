# 在庫管理リファレンスガイド

インベントリ設定にアクセスするには、 **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動してください。

![グローバルメニューからインベントリ設定に移動します。](./inventory-management-reference-guide/images/01.png)

商品のSKUとその在庫状況を表示するページです。

![このページでは、すべてのカタログSKUを追跡し、その在庫状況を表示します。](./inventory-management-reference-guide/images/02.png)

| 項目        | 説明                                                                                             |
|:--------- |:---------------------------------------------------------------------------------------------- |
| SKU       | インベントリシステムの主要な識別子。                                                                             |
| 現在高       | あるSKUについて、すべての倉庫から入手可能な総個数。                                                                    |
| 設定可能一覧    | SKUの購入可能なユニット数。 Liferayの計算です。[使用可能数量] = [在庫数量] - [発注数量] - [安全在庫数量] となります。                      |
| 受注オーダー可能数 | SKUのオープンオーダーに割り当てられている個数。 この数量は、注文が出荷されたときに消費されます。                                             |
| 受信        | あるSKUに対して補充を予定しているが、まだ受け取っていない個数。 数値はあくまで参考値であり、計算によるものではありません。 管理者は、将来の数量を把握するために利用することができます。 |

## SKU詳細

個々のSKUを表示する場合、4つのタブがあります。概要」、「注文中」、「入荷」、「変更履歴」の4つのタブがあります。

### 概要

概要]タブには、すべての倉庫にあるSKUの在庫の概要が表示されます。

![ [概要]タブには、すべての倉庫の在庫の概要が表示されます。](./inventory-management-reference-guide/images/03.png)

| 項目     | 説明              |
|:------ |:--------------- |
| 倉庫     | SKUを持つ倉庫のリスト。   |
| 現在高    | 安全在庫を含む保有台数。    |
| 予備在庫   | 安全在庫として確保された台数。 |
| 設定可能一覧 | 購入可能なユニット数。     |
| 受信     | 倉庫への入庫予定数。      |

**追加**(![Add Button](../images/icon-add.png)) をクリックして、在庫を更新したり、倉庫間で在庫を移動したりします。

![在庫の追加や倉庫間の在庫移動が可能。](./inventory-management-reference-guide/images/04.png)

### 受注オーダー

On Orderタブには、このSKUに注文を出したアカウントのリストが表示されます。 このタブには、注文ID、注文数量、有効期限も表示されます。

![On Orderタブには、選択したSKUに注文を出したアカウントが表示されます。](./inventory-management-reference-guide/images/05.png)

### 入荷

[入荷情報]タブには、SKUの在庫補充が予定されている倉庫がリストアップされます。

![ [入荷情報]タブには、SKUの在庫補充が予定されている倉庫がリストアップされます。](./inventory-management-reference-guide/images/06.png)

**追加**(![Add Button](../images/icon-add.png)) をクリックし、選択したSKUの入荷情報を作成します。

![特定の倉庫の数量を追加します。](./inventory-management-reference-guide/images/07.png)

| 項目    | 説明             |
|:----- |:-------------- |
| 数量    | 入荷数量。          |
| 宛先    | 入荷した商品を保管する倉庫。 |
| 配達予定日 | 納品予定日。         |

### チェンジログ

詳しくは、 [インベントリの変更を表示する](./using-the-inventory-management-system.md#viewing-inventory-changes) を参照してください。

## Commerce 2.1以前

インベントリーの設定は、コントロールパネルにあります。 アクセスするには、 **コントロールパネル** &rarr; **コマース** &rarr; **インベントリ** に移動します。

## 関連トピック

* [商品バリアントのSKU作成](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md)
* [在庫数低下時のアクション](./low-stock-action.md)
* [コマース倉庫のセットアップ](./setting-up-warehouses.md)
* [倉庫リファレンスガイド](./warehouse-reference-guide.md)
