# 通知テンプレート変数リファレンスガイド

電子メール通知テンプレートを作成するときに、電子メールコンテンツの _電子メール設定_ および _ボディ_ フィールドにキー値の代わりとして変数を挿入できます。 キーの値には、顧客の名前、注文ID、出荷先と請求先住所、注文のアイテムのリストが含まれます。

![これらの変数を［メールの本文］フィールドで使用します。](./notification-template-variables-reference-guide/images/02.png)

使用可能な変数を表示するには、最初に通知テンプレート種別を選択して有効にします。

![最初に［通知テンプレート種別］を選択します。](./notification-template-variables-reference-guide/images/01.png)

テンプレートタイプを選択したら、［ _用語の定義_ ］ドロップダウンメニューを展開します。

## メール設定

![これらの変数を［Eメール設定］フィールドで使用します。](./notification-template-variables-reference-guide/images/03.png)

次の変数を使用して、送信者と受信者のメール設定フィールドに入力できます。

| 値                                | Description   |
|:-------------------------------- |:------------- |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | アカウント注文マネージャー |
| [%ORDER_CREATOR%]                | 発注したユーザー      |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | アカウント管理者      |
| [%USER_GROUP_NAME%]            | ユーザーグループサイト   |

## ［注文］

![これらの変数を使用する注文メール。](./notification-template-variables-reference-guide/images/05.png)

次の変数は、注文タイプのメール通知テンプレートで使用できます。

| 値                            | 説明                   |
|:---------------------------- |:-------------------- |
| [%ORDER_ITEMS%]              | 注文に含まれるすべての商品を含むテーブル |
| [%ORDER_SHIPPING_ADDRESS%] | 注文の配送先住所             |
| [%ORDER_BILLING_ADDRESS%]  | 注文の請求先住所             |
| [%ORDER_ID%]                 | 注文ID                 |

## 変更通知を受け取る（購読する）

![この変数をサブスクリプションに使用します。](./notification-template-variables-reference-guide/images/04.png)

次の変数は、サブスクリプションタイプのメール通知テンプレートで使用できます。

| 値                | 説明  |
|:---------------- |:--- |
| [%PRODUCT_NAME%] | 商品名 |

## 追加情報

* [通知テンプレートの使用](./using-notification-templates.md)
