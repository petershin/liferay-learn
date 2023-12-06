# ユーザーのインポートとエクスポート

LDAPが接続されると、ユーザーはログイン時にインポートされる。 しかし、クラリティ・ビジョン・ソリューションズは、Fabulous Framesの全ユーザーを一度にインポートしたいと考えている。

## LDAPユーザーのインポート

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動する。

1. セキュリティの下で、 **LDAP** をクリックします。

1. 左のナビゲーションで、 **インポート** をクリックする。

1. **Enable Import** にチェックを入れる。 ［**保存**］ をクリックします。 なお、デフォルトのインポート間隔は10分に設定されている。 Liferayはこの間隔でバルクインポートを実行します。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。 LDAPサーバーからのユーザーがインポートされました。

   ![LDAPユーザーがインポートされました。](./importing-and-exporting-users/images/01.png)

```{note}
Enable _Import_]ボックスのチェックを外したままにしておくと、ユーザはログイン時に個別にインポートされます。 LDAPから一括インポートを行う場合は、インポートを使用する。 
```

## LDAPユーザーのエクスポート

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動する。

1. セキュリティの下で、 **LDAP** をクリックします。

1. 左のナビゲーションで、 **Export** をクリックする。

1. **Enable Export** および **Enable Group Export** のボックスにチェックを入れる。 ［**保存**］ をクリックします。

1. 既存のユーザーを変更する。 **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

1. カイル・クラインを選択する。 このユーザーを作成する必要がある場合は、 [ユーザーの作成](https://learn.liferay.com/w/courses/liferay-administrator/users-accounts-organizations/managing-users#creating-users) を参照のこと。

1. 彼の個人情報を変更する。 例えば、彼の生年を1970年から1971年に変更する。 ［**保存**］ をクリックします。

1. LDAPサーバーの設定に戻る。 **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動する。

1. 左のナビゲーションで、 **Servers** をクリックする。

1. `fabulousframes` LDAP サーバーの **Edit**(![Edit icon](../../images/icon-edit.png)) をクリックします。

1. 下にスクロールして、 **Test LDAP Users** をクリックする。 カイル・クラインがLDAPに追加されたことを確認する。

   ![カイル・クラインがLDAPに追加された。](./importing-and-exporting-users/images/02.png)

次のステップは、各ユーザーに異なる [ロールとパーミッション](./setting-roles-and-permissions.md) を割り当てることである。

## 関連コンセプト

- [ユーザーのインポートとエクスポートの設定](https://learn.liferay.com/en/w/dxp/users-and-permissions/connecting-to-a-user-directory/configuring-user-import-and-export)

- [LDAPリファレンス設定](https://learn.liferay.com/en/w/dxp/users-and-permissions/connecting-to-a-user-directory/ldap-configuration-reference)
