# LDAPへの接続

LDAPサーバーは、システム・レベルまたはインスタンス・レベルで設定できます。 LXC-SMまたはセルフホスティングの場合は、ニーズに応じて [構成スコープ](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/understanding-configuration-scope) 。 システム・スコープで設定する場合は、各インスタンスIDを指定する必要があることに注意。 LXCを使用している場合は、インスタンス・スコープでLDAPを設定する必要がある。 [LDAPディレクトリへの接続](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory) を参照。

クラリティ・ビジョン・ソリューションズは、買収したばかりの会社からユーザーデータをインポートしなければなりません。

## LDAPディレクトリの作成

1. 新しい OpenLDAP コンテナを起動します。

   ```bash
   docker run \
       --env LDAP_ORGANISATION="Fabulous Frames" \
       --env LDAP_DOMAIN="fabulousframes.com" \
       --env LDAP_BASE_DN="dc=fabulousframes,dc=com" \
       --name fabulousframesldap \
       -p 389:389 \
       -p 636:636 \
       osixia/openldap:1.5.0
   ```

1. `fabulousframesldap` コンテナの IP アドレスを見つける。 これは以下の設定ステップで使用される。

   ```bash
   docker network inspect bridge
   ```

1. LDIFファイルを生成して、LDAPにユーザーとユーザー・グループを設定する。

   ```bash
   cat <<EOT >> sarah.ldif
   dn: cn=sarah,dc=fabulousframes,dc=com
   objectClass: inetOrgPerson
   objectClass: organizationalPerson
   objectClass: person
   objectClass: top
   cn: Sarah
   sn: Stanley
   givenName: Sarah
   mail: sarah@fabulousframes.com
   title: IT Staff
   userPassword: learn

   cn: fabulousframes
   dn: cn=fabulousframes,dc=fabulousframes,dc=com
   objectClass: groupOfUniqueNames
   objectClass: top
   uniqueMember: cn=sarah,dc=fabulousframes,dc=com
   EOT
   ```

1. シェルで、LDIFファイルと同じフォルダに移動します。 ファイルをコンテナにコピーする。

   ```bash
   docker cp sarah.ldif fabulousframesldap:/container/service/slapd/assets/test
   ```

1. OpenLDAP サーバーにエントリーを追加します。

   ```bash
   docker exec fabulousframesldap ldapadd -x -D "cn=admin,dc=fabulousframes,dc=com" -w admin -f /container/service/slapd/assets/test/sarah.ldif -H ldap://localhost
   ```

## LiferayをLDAPディレクトリに接続する

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動する。

1. セキュリティの下で、 **LDAP** をクリックします。

1. 左のナビゲーションで、 **Servers** をクリックする。

1. ［**Add**］ をクリックします。

1. 新しいページで、LDAP接続情報を入力する。

   * サーバー名 `Fabulous Frames`
   * ベースプロバイダーURL： `ldap://[IPアドレス]:389`
   * ベース DN: `dc=fabulousframes,dc=com`
   * プリンシパル： `cn=admin,dc=fabulousframes,dc=com`
   * 認証情報： `管理者`

   ![接続情報を入力します。](./connecting-to-ldap/images/01.png)

**Test LDAP Connection** をクリックする。 LiferayがLDAPサーバーに正常に接続したことを示すポップアップウィンドウが表示されます。 **X** をクリックし、ウィンドウを閉じる。

1. LDAPユーザー情報セクションで、LDAPフィールドを適切なLiferayフィールドにマッピングします。 **UUID** フィールドに `uid` と入力し、Liferay の UUID フィールドを LDAP の `uid` フィールドにマッピングします。 これはLDAPにデータをエクスポートするために必要である。 **Test LDAP Users** をクリックして、ユーザー・フィールドのマッピングをプレビューします。

   ![ユーザーフィールド情報を入力する。](./connecting-to-ldap/images/02.png)

1. LDAP groupsセクションで、 `Fabulous Frames` を **Description** フィールドに入力する。 **Test LDAP Groups** をクリックして、 `fabulousframes` ユーザーグループが表示されていることを確認します。

1. ［**保存**］ をクリックします。

Clarity Vision SolutionsのLiferayインスタンスがFabulous FramesのLDAPディレクトリに接続されました。

次へ [ユーザーのインポートとエクスポート](./importing-and-exporting-users.md).

## 関連コンセプト

- [LDAPディレクトリへの接続](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory)
