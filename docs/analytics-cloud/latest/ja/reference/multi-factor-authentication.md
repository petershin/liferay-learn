# 多要素認証

すべてのAnalytics Cloudユーザーには多要素認証（MFA）が必要です。 この追加のセキュリティ層は、フィッシングやMITM（man-in-the-middle）攻撃などのサイバー攻撃からユーザーを保護するのに役立ちます。

## 多要素認証の設定

1. [analytics.liferay.com](https://analytics.liferay.com) に、 [liferay.com](https://www.liferay.com) アカウントのメールアドレスでログインします。

   ![Log into Liferay with your user account.](./multi-factor-authentication/images/01.png)

1. 5つのMFAオプションの中から1つを選択します。 例えば、_SMS認証_を選択して、テキストメッセージでコードを受け取ります。

   ![Choose your MFA option.](./multi-factor-authentication/images/02.png)

   なお、セットアップ後に別の認証タイプに変更したい場合は、 [サポートに](#help-with-mfa) ご連絡ください。

1. コードを送信_ボタンをクリックし、コードが届くのをお待ちください。 メール認証_オプションを使用する場合は、迷惑メールフォルダを確認する必要があります。

   ![Select a authentication option and click send code.](./multi-factor-authentication/images/03.png)

1. 認証コードを入力し、_Verify_ボタンをクリックします。 認証コードを受信できなかった場合は、_コードの再送信_ボタンをクリックしてください。

   ![Input and verify received code.](./multi-factor-authentication/images/04.png)

1. 次の30日間はMFAの有効期限が切れないようにする場合は、チェックを入れます。

   ![Check the box if you want the MFA to not expire for 30 days.](./multi-factor-authentication/images/06.png)

1. *Finish*をクリックして認証プロセスを完了します。

   ![Click the Finish button to finish the process.](./multi-factor-authentication/images/05.png)

1. 認証が完了すると、Analytics Cloudのスタートページが表示されます。 ここから、 [Connect Liferay DXP to Analytics Cloud](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) .

## MFAのヘルプ

安全なログインは、ユーザーと顧客データを保護するための重要な機能です。 MFAで問題が発生した場合は、私たちがサポートします。

サポートへのお問い合わせは [help.liferay.com](https://help.liferay.com/) まで。
