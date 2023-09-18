# SAMLによる認証

SAMLで認証する場合、Liferayはサービスプロバイダ（SP）またはIDプロバイダ（IdP）の役割を果たすことができる。 詳細は、 [SAML による認証](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml) を参照のこと。

デレクタブル・ボンサイは、オールマイティ・シロップを買収して成長した。 他の企業を買収する可能性を検討する中で、ITチームは、SAMLを利用してユーザー資格情報の保存と管理を一元化することを決定した。 以下の手順で、実際に見てみよう。

## アイデンティティ・プロバイダーの設定

1. ID プロバイダとなる Liferay コンテナを起動します。

   ```bash
   docker run -it -m 8g -p 7080:8080 \
      --env LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ENABLED=true \
      --name liferayidp liferay/dxp:latest
   ```

1. 管理者アカウントを設定する。

   * `localhost:7080`に移動する。
   * ファーストネームに「 `Support` 」と入力。
   * 苗字に `Support` と入力。
   * メールには `support@delectablebonsai.com` と入力してください。
   * `［Finish Configuration］`をクリックします。
   * 次のページで、パスワードを `learn`に設定する。
   * `Save`をクリックする。

1. 新しい ID プロバイダを設定する。

   * **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **SAML Admin** に移動する。
   * general タブで、SAML ロールとして **Identity Provider** を選択する。
   * エンティティIDを `liferayidp`と入力する。
   * ［**保存**］ をクリックします。
   * 証明書と秘密鍵のセクションの下にある **Create Certificate** をクリックする。
   * コモンネームは `foo`と入力する。
   * 下までスクロールしてください。 キーとなるパスワードを `learn`と入力する。
   * ［**保存**］ をクリックします。
   * 最後に、一般タブの **有効** チェックボックスにチェックを入れ、 **保存** をクリックします。

## サービス・プロバイダーの設定

1. サービスプロバイダとなる Liferay コンテナを開始します。

   ```bash
   docker run -it -m 8g -p 8080:8080 --name liferaysp liferay/dxp:latest
   ```

1. `localhost:8080` にアクセスし、管理者としてログインする（例： `test@liferay.com:test`）。 なお、各コンテナには別のブラウザでアクセスする必要があるかもしれない。

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **SAML Admin** に移動する。

1. 新しいサービスプロバイダを設定する。

   * general タブで、SAML の役割として **Service Provider** を選択する。
   * エンティティIDを `liferaysp`と入力する。
   * ［**保存**］ をクリックします。
   * 証明書と秘密鍵のセクションで、 **Create Certificate** をクリックする。
   * コモンネームは `foo`と入力する。
   * 下までスクロールしてください。 キーとなるパスワードを `learn`と入力する。
   * ［**保存**］ をクリックします。
   * 最後に、generalタブの下にある **Enabled** チェックボックスにチェックを入れ、Saveをクリックします。

## SPとIdPのリンク

`liferaysp` コンテナ (`localhost:8080`) で、 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **SAML Admin** に移動する。 **Identity Provider Connections** タブをクリックする。

1. IdP接続を作成する。

   * **Add Identity Provider** をクリックする。
   * 名前を `liferayidp`と入力する。
   * エンティティIDを `liferayidp`と入力する。
   * **有効** チェックボックスにチェックを入れる。
   * `http://[IP Address]:7080/c/portal/saml/metadata`. `[IPアドレス]` 、マシンのローカルIPアドレスに置き換えてください。
   * 属性のマッピングで、ドロップダウンリストを使用し、 `emailAddress`を選択します。 SAML 属性を `emailAddress`として設定する。
   * (![Add icon](../../../images/icon-add.png)) をクリックすると別のエントリーが表示されます。 ドロップダウンリストを使用し、 `firstName`を選択します。 SAML 属性を `firstName`として設定する。
   * (![Add icon](../../../images/icon-add.png)) をクリックすると別のエントリーが表示されます。 ドロップダウンリストを使用して、 `lastName`を選択します。 SAML 属性を `lastName`として設定する。
   * (![Add icon](../../../images/icon-add.png)) をクリックすると別のエントリーが表示されます。 ドロップダウンリストを使用し、 `screenName`を選択する。 SAML 属性を `screenName`として設定する。
   * (![Add icon](../../../images/icon-add.png)) をクリックすると別のエントリーが表示されます。 ドロップダウンリストを使用し、 `UUID`を選択します。 SAML 属性を `UUID`として設定する。
   * ページの下部にある ［**保存**］ をクリックします。

1. 次に、 `liferayidp` コンテナ (`localhost:7080`) で、 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **SAML Admin** に移動する。 **Service Provider Connections** タブをクリックします。

   * **Add Service Provider** をクリックする。
   * 名前を `liferaysp`と入力する。
   * エンティティIDを `liferaysp`と入力する。
   * **有効** チェックボックスにチェックを入れる。
   * `http://[IP Address]:8080/c/portal/saml/metadata`. `[IPアドレス]` 、マシンのローカルIPアドレスに置き換えてください。
   * 名前識別子の属性名を `emailAddress`と入力する。
   * **Attributes Enabled** チェックボックスにチェックを入れる。
   * 属性テキストボックスに、以下の属性を入力する：

      ```
      firstName
      lastName
      emailAddress
      screenName
      uuid
      ```

   * ページの下部にある ［**保存**］ をクリックします。

## SAML 接続のテスト

1. `liferaysp` コンテナ（すなわち `localhost:8080`）で、 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。 テスト管理者が唯一のユーザーであることに注意してください。

1. 右上のユーザープロフィール画像をクリックし、 **サインアウト** をクリックします。 認証情報 `support@delectablebonsai.com:learn`でサインインする。 `liferayidp` コンテナがユーザーを検証し、ログインに成功したことに注意。

```{warning}
コースの残りの作業を容易にするために、この演習を完了したら SAML を無効にしてください。 
```

次へ [OAuth2 による認証](./authorizing-with-oauth2.md)

## 関連コンセプト

- [SAMLによる認証](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml)
- [SAML Authentication Process Overview](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml/saml-authentication-process-overview)
- [SAML管理](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml/saml-admin)
