# サブスクリプション管理リファレンスガイド

サブスクリプションは **グローバルアプリケーション** の **サブスクリプション** メニューで[管理](./managing-subscriptions.md)されています。 この記事では、 **サブスクリプション** メニューで使用できるさまざまな機能とフィールドについて説明します。

5つのフィールドがあります。

| 項目      | 説明                                    |
|:------- |:------------------------------------- |
| ID      | これはサブスクリプションのIDです。                    |
| ステータス   | ステータスは注文のステータスを表示します                  |
| オーダーID  | これは、サブスクリプションに基づく注文IDです。              |
| アカウントID | アカウントIDは、サブスクリプションを作成したアカウントに対応しています。 |
| アカウント名  | アカウント名はアカウント名に対応します。                  |

## Commerce 2.1以前

サブスクリプションは **コントロールパネル** の **サブスクリプションメニュー** で[管理](./managing-subscriptions.md)されています。

［**コントロールパネル**］ → ［**コマース**］ → ［**サブスクリプション**］ に移動します。

![サブスクリプション管理](./subscription-administration-reference-guide/images/01.png)

5つのフィールドがあります。

| 項目      | 説明                                    |
|:------- |:------------------------------------- |
| ID      | これはサブスクリプションのIDです。                    |
| ステータス   | ステータスは注文のステータスを表示します                  |
| オーダーID  | これは、サブスクリプションに基づく注文IDです。              |
| アカウントID | アカウントIDは、サブスクリプションを作成したアカウントに対応しています。 |
| アカウント名  | アカウント名はアカウント名に対応します。                  |

サブスクリプションの **ID** をクリックして、サブスクリプション注文の詳細を表示します。

<!--Need to finish this for Commerce 3.0; blocked by https://issues.liferay.com/browse/COMMERCE-4813 -->

**全般** 、 **発送** 、 **支払い** の3つのタブがあります 。

## ［一般］タブ

**全般** タブには、サブスクリプション [注文](../orders/processing-an-order.md)基本的な詳細が含まれています。

### 注文の参照

参照オーダー_セクションには、[オーダーに関する情報](../orders/order-information.md)が表示されます：

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
| モード          | これは、間隔がマークされた日付を指します。 ユーザーは、オプションとして月の正確な日または **月の最後の日** を選択することもできます。 |

```{warning}
この機能を無効にしたい場合は、 [blacklist](https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) 。 インターバルにゼロや負の数を入力しないでください。
```

### 配送のサブスクリプション

**配送サブスクリプション** セクションは、次の情報を追跡します。

![配送](./subscription-administration-reference-guide/images/04.png)

| 項目           | 説明                                                                   |
|:------------ |:-------------------------------------------------------------------- |
| ステータス        | これはサブスクリプションのワークフローステータスです。                                          |
| 次の繰り返し日      | これは、 [出荷](../shipments/introduction-to-shipments.md) が発送された翌日です。     |
| サブスクリプションタイプ | これは、サブスクリプションのタイプです。                                                 |
| サブスクリプション期間  | これは、出荷の間隔を指します。                                                      |
| モード          | これは、間隔がマークされた日付を指します。 ユーザーは、オプションとして月の正確な日または **月の最後の日** を選択することもできます。 |

```{warning}
この機能を無効にしたい場合は、 [blacklist](https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) 。 インターバルにゼロや負の数を入力しないでください。
```

### 項目数

**アイテム** セクションには、サブスクリプション内の[商品](../../product-management/creating-and-managing-products/products/products-overview.md)がすべてリストされます。

![アイテム](./subscription-administration-reference-guide/images/05.png)

## 発送タブ

［**発送**］タブには、次の情報が表示されます。

![出荷](./subscription-administration-reference-guide/images/06.png)

| フィールド | 説明 |
| :--- | :--- |
| 作成日 | これは注文が[作成された]日付(../orders/processing-an-order.md)です。 |
| 出荷ID | この番号は、[発送](../shipments/introduction-to-shipments.md) ID | として生成されます。
| ステータス | [注文](../orders/orders-menu-reference-guide.md)のステータスです。 |
| 注文ID | これは、サブスクリプションの基本的な注文を指します。 |
| 送信先 | これはアカウントの配送先住所です。 |
| 追跡 | これは配送業者の追跡番号です。 |

## 支払いタブ

**支払い** タブは、注文の支払い履歴を追跡します。

![アイテム](./subscription-administration-reference-guide/images/07.png)

| 項目     | 説明                                                    |
|:------ |:----------------------------------------------------- |
| 種類     | これは、支払いが正常に行われたかどうかを示します。                             |
| 日付     | これは、注文が[作成された日です ](../orders/processing-an-order.md)。 |
| TXN ID | これはトランザクションIDです。                                      |
| 総量     | これは注文の合計金額を指します。                                      |

## 関連トピック

* [サブスクリプションを有効にする](../../product-management/creating-and-managing-products/products/enabling-subscriptions-for-a-product.md)
* [サブスクリプションの管理](./managing-subscriptions.md)
* [注文の処理](../orders/processing-an-order.md)
* [出荷の概要](../shipments/introduction-to-shipments.md)
* [注文情報](../orders/order-information.md)
