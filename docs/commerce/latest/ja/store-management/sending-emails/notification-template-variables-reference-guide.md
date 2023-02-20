# 通知テンプレート変数リファレンスガイド

通知テンプレートを作成する際、変数を使用して、トリガーとなるチャネルイベントのデータを動的にメールフィールドに入力することができます。 通知テンプレート *タイプ* を選択し、その変数を表示します。 これは、どのチャンネルイベントが通知をトリガーするかを決定します。

![通知テンプレートの種類を選択します。](./notification-template-variables-reference-guide/images/01.png)

タイプを選択した後、 *メール設定* と *メールコンテンツ* のセクションで *用語の定義* を展開すると、その変数とその説明を表示することができます。 例えば、お客様の名前、注文ID、配送先住所、請求先住所、注文商品リストなどです。

![これらの変数をメール本文で使用します。](./notification-template-variables-reference-guide/images/02.png)

## メール設定

![電子メール設定フィールドでこれらの変数を使用します。](./notification-template-variables-reference-guide/images/03.png)

| 値                                | 説明                                                                                                                    |
|:-------------------------------- |:--------------------------------------------------------------------------------------------------------------------- |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | 注文を出した口座の注文者（複数可                                                                                                      |
| [%ORDER_CREATOR%]                | 注文を作成したユーザー                                                                                                           |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | 注文を行ったアカウントのアカウント管理者                                                                                                  |
| [%USER_GROUP_NAME%]            | ユーザーグループの名前。 `NAME` をユーザーグループ名に置き換えてください（例：ユーザーグループ「Sales Consultants」の場合、 `[%USER_GROUP_Sales Consultants%]`と入力します）。 |

## オーダーベース通知のテンプレートタイプ

![これらの変数を使用して、電子メール通知に注文関連情報を含めることができます。](./notification-template-variables-reference-guide/images/04.png)

チャネルには、注文イベントに対する6種類の通知テンプレートがあります。

1. 注文済み

1. 注文処理

1. 注文は出荷待ちです

1. 注文を一部出荷しました

1. 注文を出荷しました

1. 注文が完了しました

| 値                                     | 説明                   |
|:------------------------------------- |:-------------------- |
| [%ORDER_ITEMS%]                       | 注文の全項目をリストアップした表     |
| [%ORDER_SHIPPING_ADDRESS%]          | ご注文者様のお届け先           |
| [%ORDER_BILLING_ADDRESS%]           | ご注文者様のご請求先           |
| [%ORDER_ID%]                          | オーダーID               |
| [%ORDER_TOTAL%]                       | ご注文の合計金額（税抜          |
| [%ORDER_DATE%]                        | 注文を行った日付             |
| [%ORDER_CURRENCY_SYMBOL%]           | 注文の通貨記号（例：$、£）。      |
| [%ORDER_SHIPPING_WITH_TAX_TOTAL%] | ご注文時の送料（税込み          |
| [%ORDER_EXTERNAL_REFERENCE_CODE%]   | 注文の外部参照コード           |
| [%ORDER_URL%]                         | ご注文のURL              |
| [%PAYMENT_TERMS_DESCRIPTION%]       | 注文書に添付された支払条件        |
| [%ORDER_PAYMENT_METHOD%]            | 注文の支払い方法             |
| [%ORDER_TAX_TOTAL%]                 | 注文の合計税額              |
| [%ORDER_WITH_TAX_TOTAL%]            | ご注文の合計金額（税込み         |
| [%ORDER_CREATOR_USER_FIRST_NAME%] | 注文を作成したユーザーのファーストネーム |
| [%ORDER_SHIPPING_OPTION%]           | ご注文の配送方法             |
| [%ORDER_CREATOR_USER_LAST_NAME%]  | 注文を作成したユーザーのラストネーム   |
| [%DELIVERY_TERMS_DESCRIPTION%]      | 注文書に添付された納品条件        |
| [%ORDER_CREATOR%]                     | 注文を作成したユーザー          |
| [%ORDER_CURRENCY_CODE%]             | 注文の通貨コード（例：USD、GBP）  |
| [%ORDER_CREATOR_USER_TITLE%]        | 注文を作成したユーザーの肩書き      |
| [%ORDER_SHIPPING_TOTAL%]            | ご注文時の送料（税抜）合計        |

## 購読型通知テンプレートの種類

![これらの変数を使用して、電子メール通知に購読関連の情報を含めることができます。](./notification-template-variables-reference-guide/images/05.png)

チャンネルには、サブスクリプションイベントのための4種類の通知テンプレートがあります。

1. サブスクリプションを更新しました

1. サブスクリプションが有効になりました

1. サブスクリプションが中断されました

1. サブスクリプションがキャンセルされました

| 値                 | 説明          |
|:----------------- |:----------- |
| [%PRODUCT_NAME%]  | 製品名         |
| [%ORDER_CREATOR%] | 注文を作成したユーザー |
| [%ORDER_ID%]      | オーダーID      |

## 追加情報

* [通知テンプレートの使用](./using-notification-templates.md)
