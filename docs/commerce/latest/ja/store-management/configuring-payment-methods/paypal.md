# PayPal

この記事では、PayPalを支払方法として有効にする方法について詳しく説明します。

PayPalを使用するようにストアを設定する前に、PayPalクライアントIDとクライアントシークレット番号を生成する必要があります。 詳細は、[PayPal開発者ダッシュボード](https://developer.paypal.com/developer/applications/create)にアクセスしてください。

1. _［サイト管理］ → ［コマース］ → ［設定］ → ［支払い方法］_に移動します。
1. _［PayPal］_ をクリックします。
1. _［設定］_をクリックします。
1. 次のように入力します：
    * **クライアントID**
    * **クライアント・シークレット**
1. ライブサイトの場合は_［Live］_を、テスト環境の場合は_［Sandbox］_を選択します。
1. _［最大決済試行回数］_フィールドに、サブスクリプションをキャンセルする前にサブスクリプションの支払いを試行する回数を入力します。
    * 詳細は、PayPalの記事[「Reattempt failed recurring payments with Subscribe buttons」](https://developer.paypal.com/docs/paypal-payments-standard/integration-guide/reattempt-failed-payment/)を参照してください。 ![PayPalの設定](./paypal/images/01.png)
1. _［保存］_ をクリックします。
1. _［PayPal］_の隣にある_3ドットアイコン_をクリックし、次に_［有効にする］_をクリックします。

PayPalがストアで有効になりました。

## 追加情報

他の支払方法の追加に関する詳細は次のとおりです。

* [新しい通貨の追加](../currencies/adding-a-new-currency.md)
* [Authorize.net](./authorize.net.md)
* [Mercanet](./mercanet.md)
* [失敗した支払を再試行する](https://developer.paypal.com/docs/paypal-payments-standard/integration-guide/reattempt-failed-payment/)
