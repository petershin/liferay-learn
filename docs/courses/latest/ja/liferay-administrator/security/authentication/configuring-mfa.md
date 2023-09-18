# 多要素認証の設定

多要素認証は、ユーザーが何かを知っていることと、何かを持っていることの両方を要求する。 通常、これはパスワードと、携帯電話や電子メールアドレスのようなデバイスやサービスである。 ログインするには、ユーザーはパスワードとこのデバイスに送られるコードを入力しなければならない。

Liferayは、電子メールによるワンタイムコードと、SMSや認証アプリをサポートするサードパーティサービスの両方をサポートしています。 詳しくは、 [using multi-factor authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication) をご覧ください。

ファーマーズ・マーケットに出店していた頃とは比べものにならない。 今や多くの従業員と顧客を抱えるIT部門は、セキュリティ強化の一環としてMFAを要求している。

## MFAの設定

1. [Configuring Mail in Liferay](../../configuration/server-administration-and-email.md#configuring-mail-in-lxc-sm-or-self-hosted) の手順に従って SMTP メールサーバーをシミュレートしてください。

1. 管理者として Liferay にログインします（例： [Kyle Klein](../../users-accounts-organizations/managing-users.md#creating-users) ）。

1. 次に、 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動します。 セキュリティセクションの下にある **Multi-Factor Authentication** をクリックします。

1. **Enabled** にチェックを入れ、 **Save** をクリックします。 設定オプションの詳細については、 [Enabling Multi-Factor Authentication（多要素認証を有効にする）](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication#enabling-multi-factor-authentication) を参照してください。

システムからロックアウトされるのを防ぐため、先に進む前にFakeSMTPでメールを正常に受信できることを確認してください。

## MFAのテスト

1. 右上のユーザープロフィール画像をクリックし、 **サインアウト** をクリックします。

1. 管理者としてLiferayにサインバックする（つまり カイル・クライン）。

1. 次のページで、 **Send** for Liferay をクリックし、kyle@delectablebonsai.com にワンタイムパスワードを送信します。

1. 送信されたメールからワンタイムパスワードを取得する。

   ![メールからワンタイムパスワードを取得する。](./configuring-mfa/images/01.png)

1. ワンタイムパスワードをコピーし、ログインページに貼り付ける。 ［**Submit**］ をクリックします。 Liferayへのログインに成功しました。

```{note}
多要素認証が有効になっている場合、残りのコースのログインは困難になります。 この演習が終了したら、戻って_Enabled_ボックスのチェックを外し、_Save_をクリックしてMulti-Factor Authenticationを無効にします。 
```

これで Authentication モジュールは完了です。

次へ [ウェブサービスのセキュリティ](../securing-web-services.md)

## 関連コンセプト

- [多要素認証の使用](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication)
- [Multi-Factor Authentication Checkers](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/multi-factor-authentication-checkers)
