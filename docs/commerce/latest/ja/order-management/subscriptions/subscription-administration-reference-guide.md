# サブスクリプション管理リファレンスガイド

サブスクリプションは_グローバルアプリケーション_の_サブスクリプション_メニューで[管理](./managing-subscriptions.md)されています。 この記事では、 _サブスクリプション_ メニューで使用できるさまざまな機能とフィールドについて説明します。

5つのフィールドがあります。

| Field   | Description                           |
|:------- |:------------------------------------- |
| ID      | これはサブスクリプションのIDです。                    |
| ステータス   | ステータスは注文のステータスを表示します                  |
| オーダーID  | これは、サブスクリプションに基づく注文IDです。              |
| アカウントID | アカウントIDは、サブスクリプションを作成したアカウントに対応しています。 |
| アカウント名  | アカウント名はアカウント名に対応します。                  |

## Commerce 2.1以前

サブスクリプションは_コントロールパネル_の_サブスクリプションメニュー_で[管理](./managing-subscriptions.md)されています。

_［コントロールパネル］_ → _［コマース］_ → _［サブスクリプション］_に移動します。

![サブスクリプション管理](./subscription-administration-reference-guide/images/01.png)

5つのフィールドがあります。

| 項目      | 説明                                    |
|:------- |:------------------------------------- |
| ID      | これはサブスクリプションのIDです。                    |
| 状態      | ステータスは注文のステータスを表示します                  |
| オーダーID  | これは、サブスクリプションに基づく注文IDです。              |
| アカウントID | アカウントIDは、サブスクリプションを作成したアカウントに対応しています。 |
| アカウント名  | アカウント名はアカウント名に対応します。                  |

サブスクリプションの _ID_ をクリックして、サブスクリプション注文の詳細を表示します。

<!--Need to finish this for Commerce 3.0; blocked by https://issues.liferay.com/browse/COMMERCE-4813 -->

_全般_、_発送_、_支払い_の3つのタブがあります 。

## ［一般］タブ

_全般_ タブには、サブスクリプション [注文](../orders/processing-an-order.md)基本的な詳細が含まれています。

### 注文の参照

_Reference Order_ セクションには、</a>注文に関する
情報が表示されます。</p> 

![支払いセクション](./subscription-administration-reference-guide/images/02.png)



### 支払のサブスクリプション

Payment Subscriptionセクションでは、次の情報を追跡します。

![参照](./subscription-administration-reference-guide/images/03.png)

| 項目           | 説明                                                                   |
|:------------ |:-------------------------------------------------------------------- |
| ステータス        | これはサブスクリプションのワークフローステータスです。                                          |
| 次の繰り返し日      | これは翌日の支払い期限です。                                                       |
| サブスクリプションタイプ | これは、サブスクリプションのタイプです。                                                 |
| サブスクリプション期間  | これは、出荷の間隔を指します。                                                      |
| モード          | これは、間隔がマークされた日付を指します。 ユーザーは、オプションとして月の正確な日または _月の最後の日_ を選択することもできます。 |




### 配送のサブスクリプション

_配送サブスクリプション_ セクションは、次の情報を追跡します。

![配送](./subscription-administration-reference-guide/images/04.png)

| 項目           | 説明                                                                   |
|:------------ |:-------------------------------------------------------------------- |
| 状態           | これはサブスクリプションのワークフローステータスです。                                          |
| 次の繰り返し日      | これは、 [出荷](../shipments/introduction-to-shipments.md) が発送された翌日です。     |
| サブスクリプションタイプ | これは、サブスクリプションのタイプです。                                                 |
| サブスクリプション期間  | これは、出荷の間隔を指します。                                                      |
| モード          | これは、間隔がマークされた日付を指します。 ユーザーは、オプションとして月の正確な日または _月の最後の日_ を選択することもできます。 |




### 項目

_アイテム_セクションには、サブスクリプション内の[商品](../../product-management/creating-and-managing-products/products/products-overview.md)がすべてリストされます。

![アイテム](./subscription-administration-reference-guide/images/05.png)



## 発送タブ

［ _発送_ ］タブには、次の情報が表示されます。

![出荷](./subscription-administration-reference-guide/images/06.png)

この番号は 出荷/0>IDとして生成されます</td> </tr> 

</tbody> </table> 



## 支払いタブ

_支払い_ タブは、注文の支払い履歴を追跡します。

![アイテム](./subscription-administration-reference-guide/images/07.png)

| 項目     | 説明                                                    |
|:------ |:----------------------------------------------------- |
| タイプ    | これは、支払いが正常に行われたかどうかを示します。                             |
| Date   | これは、注文が[作成された日です ](../orders/processing-an-order.md)。 |
| TXN ID | これはトランザクションIDです。                                      |
| 量      | これは注文の合計金額を指します。                                      |




## 追加情報

* [サブスクリプションを有効にする](../../product-management/creating-and-managing-products/products/enabling-subscriptions-for-a-product.md)
* [サブスクリプションの管理](./managing-subscriptions.md)
* [注文の処理](../orders/processing-an-order.md)
* [出荷の概要](../shipments/introduction-to-shipments.md)
* [注文情報](../orders/order-information.md)
