# 管理者アカウントの概要

管理者ユーザーアカウントは、Liferay DXPの新規インストールでデフォルトで作成され、Liferay DXPインスタンスのすべてのファセットを変更するための完全なアクセス権を持っています。 管理者ユーザーは、サイト、ユーザー、ページを作成、変更、削除し、すべてのサイト管理タスクを実行できます。

## 管理者ユーザーとしてLiferay DXPにアクセスする

1. ブラウザで`http://localhost:8080`を開く。

1. サインイン」リンクをクリックします。

   ![Sign In Link](./introduction-to-the-admin-account/images/01.png "Sign In Link")

    ```{note}
    Liferay DXP バンドルを使用している場合、 [Setup Wizard](../installation-and-upgrades/installing-liferay/running-liferay-for-the-first-time.md) が表示されます。 画面上の指示に従って、管理者ユーザーを設定します。
    ```
1. ログインするデフォルトの管理者資格情報を入力します。

   * メールアドレス`test@liferay.com`
   * パスワード: `test`

   なお、セットアップ・ウィザードを使用して別の管理者ユーザーのメールアドレスを設定した場合は、代わりにそのメールアドレスを入力してください。 デフォルトのパスワードは `test` のままである。

1. 初回サインイン時に、パスワードの変更が必要となります。 新しいパスワード（例： **learn**）を入力し、 **Save** をクリックします。

```{warning}
本番環境では、デフォルトの管理者アカウントを使うべきではありません。 代わりに、あなたのビジネスに特化した管理者アカウントを作成する。 以下の手順を参照してください。
```
## 管理者ユーザーの設定

### ログインパスワードの変更

1. ユーザーアバター」をクリックし、「アカウント設定」 &rarr; **Password** に移動します。

1. 現在のパスワード_を入力し、新しいパスワードを入力してください。

   ![Setting a Password](./introduction-to-the-admin-account/images/02.png "Setting a Password")

### アカウント情報の変更

1. ユーザーアバター **&rarr;** アカウント設定_ をクリックします。

   ![Account Settings](./introduction-to-the-admin-account/images/03.png "Account Settings")

1. Information_タブで、必要に応じてユーザー情報を変更または追加します。

   ![Account Information](./introduction-to-the-admin-account/images/04.png "Account Information")

## ログアウト

アカウントからログアウトするには：

1. ユーザーアバター **&rarr;** サインアウト_ をクリックします。

   ![Signing Out](./introduction-to-the-admin-account/images/05.png "Signing Out")

## 新しい管理者ユーザーの作成

ログイン方法はお分かりいただけたと思いますので、日常的に使用する新しい管理者アカウントを作成されることを強くお勧めします。

新しい管理者アカウントを作成するには、次の手順に従います。

1. [メールの設定](../installation-and-upgrades/setting-up-liferay/configuring-mail.md) を参照して、Liferay をメールサービスとセットアップしてください。 Liferay はアカウント作成時に新しいユーザーのメールアドレスにメールを送信します。

   このステップを省略するには（例えばLiferayをテストしているだけの場合）、知らない人にメールアドレスの確認を求める機能を無効にしてください。 コントロールパネル **&rarr;** インスタンス設定 **&rarr;** ユーザー認証_ に移動します。 知らない人にメールアドレスの確認を要求しますか？ なお、本番環境では無効にすることは推奨されない。

   ![Uncheck require strangers to verify their email address.](./introduction-to-the-admin-account/images/07.png)

1. 新しいユーザーを作成します。 方法については、 [Adding Users](../users-and-permissions/users/adding-and-managing-users.md) を参照してください。

1. 左側のナビゲーションペイン（「General」の下の「Edit User」ページ）にある「**Roles**」リンクをクリックします。

   ![Click the Roles link to edit the User's Roles.](./introduction-to-the-admin-account/images/06.png)

1. 通常の役割 **の横にある_*選択*をクリックします。

1. リストから **管理者** ロールを選択します（**選択** をクリックします）。 ダイアログボックスが閉じ、ロールがアカウントに関連付けられているロールのリストに追加されます。 一番下までスクロールし、「保存」をクリックします。

1. (オプション) 上記のステップでメール [を](../installation-and-upgrades/setting-up-liferay/configuring-mail.md) 設定しなかった場合、この新規ユーザの初期パスワードを設定します。 左のナビゲーションペインにある **Password** リンクをクリックします。 ユーザーのパスワードを入力し、パスワードを再入力して **Save** をクリックします。

ユーザーはポータル管理者になりました。 ログアウトし、新しいユーザーアカウントでログインし直してください。

## 次のステップ

引き続きスタートガイドを進め、 [DXPのグローバルメニュー](./navigating-dxp.md) について慣れてください。

[ユーザーがDXPにログインする方法](../installation-and-upgrades/securing-liferay/authentication-basics.md) について学習します。
