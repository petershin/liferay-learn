# ワークフローと通知の設定

オーダー・マネージャーのプレストン・パーマーは、予算上の理由から、オールマイティ・シロップのバイヤーであるロバート・リードが発注した商品を確認し、承認したいと考えている。 Delectable BonsaiのB2Bサイトでは、すぐに使えるシングル承認者ワークフローを使用して、バイヤーの注文承認ワークフローを採用している。 これにより、バイヤーが発注するすべてのオーダーが、オーダー・マネージャーによって承認されることが保証される。 このワークフローは、購入に予算が割り当てられ、承認が必要な場合に役立つ。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Commerce** → **Channels** に移動します。

1. 先に作成したB2Bチャネルを選択する。

1. 注文セクションで、バイヤー注文承認ワークフローのドロップダウンから **シングル承認者（バージョン 1**） を選択します。

   ![単一の承認者バイヤー注文承認ワークフローを選択します。](./configuring-workflows-and-notifications/images/01.png)

1. ［**Save**］ をクリックします。

## 通知テンプレートの作成

管理者のカイルは、注文が受理されたときにユーザーに通知するために、あなたの助けが必要です。 これを行うには、商取引注文システムオブジェクトの通知テンプレートとオブジェクトアクションを設定する必要があります。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** → **Templates** に移動する。

1. **追加**(![Add](../../images/icon-add.png)) をクリックし、 ［**Email**］ を選択します。

1. 下記の内容を入力してください。

   **名前** おいしい盆栽 - 注文受付通知テンプレート

   **説明** Delectable Bonsaiで注文を受け付けたときに送信される通知メールのテンプレートです。

   **へ：** `[%COMMERCEORDER_AUTHOR_EMAIL_ADDRESS%]`

   **From アドレス：** `orders@delectablebonsai.com`

   **名前から** `注文 @ おいしい盆栽`

   **件名** `お客様のご注文: [%COMMERCEORDER_ID%]`を承りました。

   **テンプレート:**

   ```
   Hi [%COMMERCEORDER_AUTHOR_FIRST_NAME%] [%COMMERCEORDER_AUTHOR_LAST_NAME%],

   Your recent order from Delectable Bonsai with Order ID: [%COMMERCEORDER_ID%] has been accepted. Visit the orders page from your account to know the latest status of your order. 

   Thanks,

   Orders @ Delectable Bonsai
   ```

   以下は、通知テンプレートで使用できるすべての変数です：

   | 変数                                               | 説明            |
   |:------------------------------------------------ |:------------- |
   | [%COMMERCEORDER_AUTHOR_SUFFIX%]                | 作成者の接尾辞       |
   | [%COMMERCEORDER_AUTHOR_PREFIX%]                | 作成者の接頭辞       |
   | [%COMMERCEORDER_AUTHOR_FIRST_NAME%]            | 作成者の名         |
   | [%COMMERCEORDER_AUTHOR_LAST_NAME%]             | 作成者の姓         |
   | [%COMMERCEORDER_AUTHOR_MIDDLE_NAME%]           | 作成者のミドルネーム    |
   | [%COMMERCEORDER_AUTHOR_ID%]                    | 作成者 ID        |
   | [%COMMERCEORDER_CURRENCYCODE%]                   | 通貨コード         |
   | [%COMMERCEORDER_EXTERNALREFERENCECODE%]          | 外部参照コード       |
   | [%COMMERCEORDER_ID%]                             | ID            |
   | [%COMMERCEORDER_MODIFIEDDATE%]                   | 編集日時          |
   | [%COMMERCEORDER_ORDERSTATUS%]                    | 注文ステータス       |
   | [%COMMERCEORDER_ORDERTYPEEXTERNALREFERENCECODE%] | 注文タイプ 外部参照コード |
   | [%COMMERCEORDER_ORDERTYPEID%]                    | 注文タイプ ID      |
   | [%COMMERCEORDER_SHIPPINGAMOUNT%]                 | 配送金額          |
   | [%COMMERCEORDER_STATUS%]                         | ステータス         |

1. ［**保存**］ をクリックします。

これは、注文が受理されるたびに通知を送信するための通知テンプレートを作成します。 これをトリガーするために、コマース受注システムオブジェクトにオブジェクトアクションを作成する必要があります。

## コマース注文オブジェクトアクションの作成

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** → **Objects** に移動する。

1. **Commerce Order** システムオブジェクトを選択します。

1. **Actions** タブに移動し、 **Add**(![Add](../../images/icon-add.png)) をクリックします。

1. アクション・ラベルとして **Order Accepted** と入力する。 アクション名は自動的に入力される。

1. **アクションビルダー** にアクセスする。

1. Trigger]で、ドロップダウンから[**On Order Status Update**]を選択します。

1. **Enable Condition** トグルを有効にし、次の式を入力する：

   `orderStatus=10`

   [オーダーステータス](https://learn.liferay.com/web/guest/w/commerce/order-management/orders/order-life-cycle) はそれぞれ整数に対応する。 詳しくは下記を参照。

   | 注文ステータス | 整数値 |
   |:------- |:--- |
   | 公開      | 2   |
   | 処理中     | 6   |
   | 申請中     | 1   |
   | 処理中     | 10  |
   | 出荷済み    | 15  |
   | 完了      | 0   |
   | キャンセル済み | 8   |
   | 一部発送済み  | 14  |
   | 申請済み    | 20  |

1. アクション]で、[**通知**] を選択し、 [**おいしい盆栽の注文を受け付けました**] 通知テンプレートを選択します。

   ![オブジェクトアクションのトリガー、条件、アクションを入力します。](./configuring-workflows-and-notifications/images/02.png)

1. ［**Save**］ をクリックします。

これは、コマース受注システムオブジェクトのオブジェクトアクションを作成します。 注文が受け付けられるたびにトリガーされ、テンプレートに基づいてメールを送信します。

次へ [ウェアハウスの作成と設定](./creating-and-configuring-warehouses.md)
