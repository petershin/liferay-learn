# ユーザーを管理する

LDAPからユーザーを取り込むにせよ、Liferay内でユーザーを作成するにせよ、利用可能なツールを使ってユーザーを管理してください。 詳細については、 [ユーザーの追加と管理](https://learn.liferay.com/ja/w/dxp/users-and-permissions/users/adding-and-managing-users) を参照してください。

## 管理者の作成

デフォルトのLiferay管理者アカウントを使い続ける代わりに、新しいClarity Vision Solutions管理者アカウントを作成し、他のユーザー、組織、アカウントを作成します。

```{warning}
本番環境では、デフォルトの管理者アカウントを使うべきではありません。 代わりに、あなたのビジネスに特化した管理者アカウントを作成する。
```

1. ユーザー認証の設定を変更する。 なお、これは私たちの学習とテストのためのものである。

   * **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動する。
   * プラットフォーム] の下で、[**ユーザー認証**] をクリックします。
   * 知らない人にメールアドレスの確認を求めるのチェックを外す。
   * ［**保存**］ をクリックします。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。 **Add User**(![Add icon](../../images/icon-add.png)) をクリックします。

1. 以下のアカウント情報を入力してください：

   * スクリーン名： `kyle`
   * メールアドレス： `kyle@clarityvisionsolutions.com`
   * ファーストネーム `Kyle`
   * ラストネーム `クライン`
   * 職種名 `ITスタッフ`

［**保存**］ をクリックします。

1. カイルに管理者の役割を与えてください。

   * 左のナビゲーションで、 **Roles** をクリックする。
   * レギュラー・ロール」の隣にある「**セレクト**」をクリックする。
   * 新しいウィンドウで、管理者の隣にある「**Choose**」をクリックします。
   * 一番下までスクロールして、 **Save** をクリックします。

1. カイルのパスワードを設定する。

   * 左のナビゲーションで、 **パスワード** をクリックします。
   * `テスト` を2つのフィールドに入力する。
   * ［**保存**］ をクリックします。

1. デフォルトの管理者アカウントからログアウトし、カイル・クラインとしてログインします。

   * 右上のユーザープロフィール画像をクリックし、 **サインアウト** をクリックします。
   * 右上の **サインイン** をクリックします。
   * `kyle@clarityvisionsolutions.com` をメールアドレス、 `test` をパスワードとしてサインインしてください。
   * パスワードをリセットする次のページで、新しいパスワードを `learn`と設定する。

## ITマネージャーのアカウントを作成する。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。 **Add User**(![Add icon](../../images/icon-add.png)) をクリックします。

1. カイルのマネージャー用のユーザーアカウントを作成する：

   * スクリーン名： `マーカス`
   * メールアドレス： `marcus@clarityvisionsolutions.com`
   * ファーストネーム `マーカス`
   * ラストネーム `モーガン`
   * 役職名 `ITマネージャー`

   ユーザーのリストはこのようになるはずだ：

   ![ユーザーのリストには、Kyle、Marcus、デフォルトのTestアカウントが含まれています。](./managing-users/images/01.png)

次のステップは、 [組織](./creating-organizations.md)の作成である。

## 関連コンセプト

- [ユーザーについて](https://learn.liferay.com/ja/w/dxp/users-and-permissions/users/understanding-users)
- [ユーザーの追加と管理](https://learn.liferay.com/ja/w/dxp/users-and-permissions/users/adding-and-managing-users)
- [組織へのユーザーの追加](https://learn.liferay.com/ja/w/dxp/users-and-permissions/organizations/adding-users-to-organizations)
