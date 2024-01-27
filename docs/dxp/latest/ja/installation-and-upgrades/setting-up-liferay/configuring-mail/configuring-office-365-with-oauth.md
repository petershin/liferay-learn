# OAuthでMicrosoft Office 365を設定する

{bdg-secondary}`liferay DXP 7.4 U79+/Liferay Portal 7.4 GA79+`.

OAuth 2.0認証を使ってMicrosoftメールサービスとLiferayを接続します。 なお、マイクロソフトはOAuth2を要求しており、ベーシック認証（メールアドレスとパスワードでの接続）はサポートしていない。

## マイクロソフトのアプリ登録

```{note}
このステップに関する追加サポートやトラブルシューティングについては、マイクロソフトにお問い合わせください。
```

1. [Microsoft Azure](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app) で新しいアプリケーションを作成する。

1. [アプリケーションのクライアント・シークレットを追加する](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app#add-a-client-secret).

   アプリケーションの`クライアントID`（別名`アプリケーションID`）、`クライア ントシークレット`、`テナントID`（別名`テナントID`）を控えておくこと。 `ディレクトリID`)。 これらの値は以下のステップで使用される。

1. [アプリケーションの POP および IMAP API 権限を追加する](https://learn.microsoft.com/en-us/exchange/client-developer/legacy-protocols/how-to-authenticate-an-imap-pop-smtp-application-by-using-oauth#add-the-pop-and-imap-permissions-to-your-aad-application) 。

## Liferayのメール設定

1. グローバルメニュー([グローバルメニュー](../../../images/icon-applications-menu.png))に移動します。 &rarr; _コントロールパネル_ &rarr; _インスタンス設定_.

1. Eメール_をクリックする。

1. 左のナビゲーションで、_メール設定_をクリックします。 以下のコンフィギュレーションを設定する。

   * POPサーバー通知を有効にする：チェック
   * 着信POPサーバー「outlook.office365.com」。
   * 受信ポート: `995`
   * 安全なネットワーク接続を使用する：チェック
   * ユーザー名：Microsoftアプリケーションに関連付けられたユーザー名
   * 送信SMTPサーバー：`smtp.office365.com`。
   * 送信ポート: `587`
   * StartTLSを有効にする：チェック
   * ユーザー名：Microsoftアプリケーションに関連付けられたユーザー名

   保存」をクリックする。

1. 左のナビゲーションで、_Outlook Auth Connector_をクリックします。 クライアントID、クライアントシークレット、テナントIDを各入力ボックスに貼り付けます。

   ![Paste in the tenant ID, client ID, and client secret values into each input box.](./configuring-office-365-with-oauth/images/01.png)

1. POP3接続を有効にする」と「SMTP接続を有効にする」にチェックを入れます。

これでLiferayはMicrosoftのメールサービスに設定されました。
