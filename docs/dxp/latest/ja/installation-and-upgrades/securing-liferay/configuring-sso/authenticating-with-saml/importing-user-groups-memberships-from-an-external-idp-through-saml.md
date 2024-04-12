# SAMLを介した外部IdPからのユーザーグループのメンバーシップのインポート

```{warning}
この機能は現在 [dev feature flag](../../../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) の後ろにあります。 これを本番で使ってはならない。 テスト目的でのみ使用してください。
```

外部 ID プロバイダ（IdP）からユーザーのユーザーグループ・メンバーシップをインポートできます。 これには、IdP登録時に必要なフィールドを設定するだけでよい。 XMLの構造はIdPによって異なるので、最初のステップはIdPからユーザーグループの多値属性を見つけることである。

例えば、Oktaのユーザーグループの構造は次のようになっている：

```xml
<saml2:Attribute Name="userGroup" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:unspecified">
      <saml2:AttributeValue xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                           xsi:type="xs:string"
                           >Okta-UserGroup2
      </saml2:AttributeValue>
      <saml2:AttributeValue xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                           xsi:type="xs:string"
                           >Okta-UserGroup1
      </saml2:AttributeValue>
</saml2:Attribute>
```

以下は、外部 IdP からユーザグループをインポートするために、この構造を使用する構成である。

## Okta での SAML 2.0 アプリの作成

1. Oktaの管理ダッシュボードにログインします。

1. **Applications** &rarr; **Applications** に移動し、 **Create App Integration** をクリックします。

1. **SAML 2.0** を選択し、 **Next** をクリックする。

1. 名前を **liferaysaml** と入力し、 **次へ** をクリックする。

1. **SAML 設定** セクションの「**全般**」 に以下の値を入力する：

   **シングルサインオン URL:** `http://[IP_ADDRESS]:[PORT_NUMBER]/c/portal/saml/acs` （ローカルで Liferay インスタンスを実行している場合、これは `http://localhost:8080/c/portal/saml/acs`となります。）

   **オーディエンス URI (SP エンティティ ID):** `okta-saml`

   **名前 ID フォーマット：** `メールアドレス`

   **アプリケーションユーザー名：** `Eメール：`

   ![SAML アプリの設定を構成する。](./importing-user-group-memberships-from-an-external-idp-through-saml/images/01.png)

   このフィールドは、ユーザが Okta にログインする際に使用するユーザ名のソースを示し、SAML を使用する場合は Okta から Liferay にログインします。

1. **属性ステートメント** の下に以下の値を追加する：

   **firstName (Unspecified):** `user.firstName`

   **lastName (Unspecified):** `user.lastName`

   **emailAddress (Unspecified):** `user.email`

   **screenName (Unspecified):** `user.firstName`

   左側の値は、SAML 属性の名前である。 これらは、Oktaの異なるユーザーフィールドを指定する右側の対応する値にマッピングされます。

1. **Group Attribute Statements** の下に以下の値を追加する：

   **userGroup（未指定）：**** `Okta` で始まる（Okta のユーザーグループはプレフィックス `Okta`で始まると仮定します）。 例えば `Okta-UserGroup-1`)

   ![ユーザー属性とグループ属性のマッピングを作成します。](./importing-user-group-memberships-from-an-external-idp-through-saml/images/02.png)

   ```{note}
   上記の手順では、Okta上ですでに異なるグループ（接頭辞が`Okta`で始まる）に属するユーザーセットがあることを想定しています。 Oktaでは、グループメンバーシップの定義に[keywords]または [regex](https://support.okta.com/help/s/article/How-to-pass-a-user-s-group-membership-in-a-SAML-Assertion-from-Okta?language=en_US) を使用することを推奨しています。 これらのグループはLiferayのユーザーグループと名前によって一致します。 

   グループ属性文には、フィルター条件または正規表現を指定することが必須です。 フィルタ条件または正規表現がない場合、SAML 属性は空で送信される。 
   ```

1. ［**Next**］ をクリックします。

1. フォームの残りの部分はOkta固有のもので、設定には影響しません。 最適なものを選択し、 **Finish** をクリックする。

## メタデータの保存

Liferayインスタンスに移行する前の最後のステップは、SAMLメタデータを保存することである。

1. **アプリケーション** &rarr; **アプリケーション** に移動し、 **liferaysaml** を選択します。

1. **Assignments** タブがデフォルトで表示されます。 **Assign** をクリックし、 **Assign to People** を選択する。 この SAML アプリを使って Liferay にログインできるユーザーを検索し、 **Assign** をクリックします。 ここでグループ別に選択することもできる。

   ![SAML アプリにユーザまたはグループを割り当てる。](./importing-user-group-memberships-from-an-external-idp-through-saml/images/03.png)

1. ［**完了**］ をクリックします。

1. **Sign On** タブを選択する。

1. 右側で、 **View SAML setup instructions** をクリックする。

1. 新しい画面で、Optionalセクションまでスクロールダウンする。 XMLコードのブロック全体をコピーし、 `oktasamlmetadata.xml`という名前の新しいファイルに貼り付けます。

![XMLブロックをコピーし、新しいファイルに貼り付ける。](./importing-user-group-memberships-from-an-external-idp-through-saml/images/04.png)

## Liferay の設定

ここで、Liferay の SAML Admin で Okta をサービスプロバイダとして設定する必要がある。

1. **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **SAML Admin** に移動する。

1. General タブで、エンティティ ID として **okta-saml** と入力します。

1. **Create Certificate** をクリックする。

1. 新しいウィンドウで、 **okta-saml** を **Common Name** として、 **learn** を **Key Password** として入力する。

1. ［**保存**］ をクリックします。

1. Identity Provider Connections」の下で、「**Add Identity Provider**」をクリックする。

1. 名前には **Okta** と入力してください。

1. `oktasamlmetadata.xml` ファイルからエンティティ ID をコピーし、ここに貼り付ける。

1. [**Enabled**] のチェックボックスをオンにします。

1. Metadata」の下にある「**Upload Metadata XML**」をクリックし、先ほど作成したファイルを選択します。

1. **Email Address** を Name Identifier Format に設定する。

1. Attribute Mapping（属性マッピング）で、3つの新しい基本ユーザー・フィールドを作成し、合計4つのフィールドを作成する。 図のように情報を入力する：

   | ユーザーフィールド | SAML 属性  |
   |:--------- |:-------- |
   | メールアドレス   | メールアドレス  |
   | ファーストネーム  | ファーストネーム |
   | ラストネーム    | ラストネーム   |
   | スクリーン名    | スクリーン名   |

   ![Okta で作成した SAML 属性に対応する新しい基本ユーザ・フィールドを作成する。](./importing-user-group-memberships-from-an-external-idp-through-saml/images/05.png)

1. User Membershipsセクションで、ドロップダウンから `userGroups` を選択し、その値を `userGroup`と設定する。

   ![userGroup フィールドと Okta の対応する SAML 属性のマッピングを追加します。](./importing-user-group-memberships-from-an-external-idp-through-saml/images/06.png)

   上記のマッピングはどちらも、Liferay のユーザー属性と Okta で設定された SAML 属性をリンクしています。 例えば、Okta のユーザ・グループ SAML 属性の名前は `userGroup`です。 これは Liferay の `userGroups` 属性にマッピングされます。

1. ［**Save**］ をクリックします。

Liferay インスタンスにアクセスし、 **Sign In** をクリックします。 IDプロバイダのサインインページにリダイレクトされます。 ログインすると、Liferayのホームページにリダイレクトされます。 また、 **グローバルメニュー**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **ユーザーグループ** に移動することでも、ユーザーのユーザーグループメンバーシップを確認できます。

   ![ログインに成功すると、ユーザーはLiferayユーザーグループに追加されます。](./importing-user-group-memberships-from-an-external-idp-through-saml/images/07.png)

```{important}
ユーザーは、すでに存在している場合のみ、自動的にユーザーグループに割り当てられます。 LiferayのユーザーグループがOktaのグループに対応していることを確認してください。 Oktaがグループ情報を送信し、対応するユーザーグループがLiferayに存在しない場合、その属性は無視されます。 ユーザー・グループの作成と管理方法については、[ユーザー・グループの作成と管理](../../../../users-and-permissions/user-groups/creating-and-managing-user-groups.md)を参照してください。 

サインイン後にLiferayでユーザーを他のユーザーグループに割り当てると、これらのメンバーシップは次回IdP経由でログインしたときに上書きされます。 
```
