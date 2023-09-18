# 組織を作る

Liferayを使って、Delectable Bonsaiの組織階層をモデル化する。 詳しくは [組織を理解する](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/understanding-organizations) を参照。

## 親子団体

1. トップレベルの組織を作る。

   * **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。
   * ［**Organizations**］ タブをクリックします。
   * **追加**（![Add icon](../../images/icon-add.png)） をクリックします。
   * **名前** の欄に `Delectable Bonsai` と入力してください。
   * ［**保存**］ をクリックします。

1. 子組織を作る。

   * **戻る**(![Back icon](../../images/icon-angle-left.png)) をクリックして、組織のリストに戻ります。
   * 作成したDelectable Bonsai組織をクリックしてください。
   * **Add**(![Add icon](../../images/icon-add.png)) をクリックし、 **New Organization** を選択する。
   * **名前** フィールドに `IT` と入力する。 親組織の項目で「Delectable Bonsai」が選択されていることに注意。
   * ［**保存**］ をクリックします。

1. 上記の手順で、Delectable Bonsaiの親組織の下に、 `Sales & Marketing` という別の子組織を作成します。

1. 組織階層は下の画像のようになるはずだ。

   ![親組織には2つの子組織がある。](./creating-organizations/images/01.png)

## 既存のユーザーを組織に割り当てる

ITマネージャーとITスタッフはどの組織にも属していない。 ユーザーアカウントを編集し、IT組織に割り当てる。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

1. ユーザーアカウントのリストから、 **Kyle Klein** をクリックする。 左ナビゲーションの **Organizations** をクリックする。

1. **Select** をクリックすると、新しいウィンドウがポップアップします。 **IT組織の** 。 ［**保存**］ をクリックします。

1. 同じ手順で、マーカス・モーガンをIT組織に加える。

## 組織に新しいユーザーを追加する

組織内に新しいユーザーを追加することもできる。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

   * ［**Organizations**］ タブをクリックします。
   * クリック **おいしい盆栽** .
   * **オプション**(![Options icon](../../images/icon-actions.png)) 営業 & マーケティングの子組織をクリックします。
   * **Add User** をクリックする。

1. 以下のユーザーを追加する：

   * スクリーン名： `lily`
   * メールアドレス： `lily@delectablebonsai.com`
   * ファーストネーム `リリー`
   * ラストネーム `ルイス`
   * 役職名 `アカウントマネージャー`

   ページの下部にある ［**保存**］ をクリックします。

## 組織サイト

次に、社内ブログをホストするために、セールス & マーケティング部門用の組織サイトを作成する。 詳しくは [組織サイト](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites) を参照。

1. 組織に戻り、 **Delectable Bonsai** 組織をクリックします。

1. **オプション**(![Options icon](../../images/icon-actions.png)) 営業 & マーケティングの子組織をクリックし、 **編集** をクリックします。

1. 左のナビゲーションで、 **組織サイト** をクリックする。
   * トグルをクリックしてサイトを作成する。
   ［* **保存**］ をクリックします。

   新しい組織サイトが作成された。

1. 右上のプロフィール画像をクリックしてください。 クリック **マイサイト** .

   ![プロフィール画像から「マイサイト」をクリックします。](./creating-organizations/images/02.png)

1. **All Sites** タブをクリックする。 先ほど作成した **Sales & Marketing** サイトをクリックします。 なお、コンテンツが追加されるまでは、サイトは空っぽである。

1. 左上の **Product Menu** アイコン (![Product Menu icon](../../images/icon-product-menu.png)) をクリックします。 サイト・ビルダー」の下にある「**ページ**」 をクリックする。

1. **Add**(![Add icon](../../images/icon-add.png)) をクリックし、 **Page** を選択する。

   * **Blank** をクリックして白紙ページを作成する。
   * ページ名を **Sales & Marketing Blog** とする。
   * ［**Add**］ をクリックします。

1. 左のナビゲーションで、 **Plus**(![Plus icon](../../images/icon-plus.png)) をクリックすると、フラグメントとウィジェットツールが表示されます。

   * **ウィジェット** タブをクリックします。
   * ブログ・ウィジェットをページにドラッグして追加する。 ウィジェットはコラボレーションの中にある。
   * ［**Publish**］ をクリックします。

1. 営業 & マーケティングの組織サイトには、営業 & マーケティングのブログ記事が掲載されたページがあり、子組織に所属する誰もが閲覧できるようになった。 ブログとブログ・エントリーについて詳しくは、 [Getting Started with Blogs](https://learn.liferay.com/en/w/dxp/content-authoring-and-management/blogs/getting-started-with-blogs) をご覧ください。

次に、 [LDAP](./connecting-to-ldap.md)に接続してユーザーをインポートする。

## 関連コンセプト

- [組織について](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/understanding-organizations)
- [組織サイト](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites)
