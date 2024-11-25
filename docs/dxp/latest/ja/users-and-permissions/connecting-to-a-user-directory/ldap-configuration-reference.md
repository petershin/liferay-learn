# LDAP設定リファレンス

LDAPの設定にアクセスするには、以下の手順で行います。 **コントロールパネル &rarr; 設定** &rarr; **インスタンスの設定** &rarr; **セキュリティ** &rarr; **LDAP** 。 左側には、［Export］、［General］、［Import］、および［Servers］の4つのカテゴリがあります。

## エクスポート

**エクスポートを有効にする。** ユーザーアカウントをLDAPにエクスポートするには、このボックスをオンにします。 リスナーは、 `User` オブジェクトに加えられた変更を追跡し、 `User` オブジェクトが変更されるたびに、LDAP サーバーに更新をプッシュします。 デフォルトでは、ログイン毎に `lastLoginDate` のようなフィールドが更新されることに注意。 エクスポートを有効にすると、ユーザーがログインするたびに、ユーザーのエクスポートが行われます。 `portal-ext.properties` ファイルに以下のプロパティを設定することで、ユーザーの `lastLoginDate` フィールドの更新が LDAP ユーザーエクスポートのトリガーにならないようにすることができま す。

```properties
users.update.last.login=false
```

**グループエクスポートを有効にする。** グループをLDAPにエクスポートします。

![［Export］タブ。](./ldap-configuration-reference/images/01.png)

## ［General］

**有効です。** LDAP認証を有効にする場合は、このボックスにチェックを入れます。

**必要です。** LDAP認証が必要な場合は、このボックスにチェックを入れてください。 LDAPディレクトリへのバインドが正常に行われないと、ユーザーはログインすることができません。 Liferayのアカウントを持ち、LDAPのアカウントを持たないユーザーがログインできる場合は、このボックスのチェックを外してください。

**LDAPパスワードポリシーを使用する。** Liferay はデフォルトで独自のパスワードポリシーを使用します。 これは、コントロールパネルの［Password Policies］ページで設定できます。 LDAPディレクトリで定義されたパスワードポリシーを使用する場合は、 ［**Use LDAP Password Policy**］ チェックボックスをオンにします。 これを有効にすると、［Password Policies］タブに、ローカルパスワードポリシーを使用していないことが示されます。 ここで、LDAPディレクトリの仕組みを利用して、パスワードポリシーを設定する必要があります。 Liferayはこれらのポリシーを強制することはできません。LDAPサーバーから返されるメッセージを通過させるのが精一杯です。 これは、サーバーが返すLDAPコントロール内のメッセージを解析することによって行われます。 Liferayのデフォルトの設定は、Fedora Directory Serverから返されたメッセージを解析します。 異なるLDAPサーバーを使用している場合、 **システム設定** &rarr; **セキュリティ** &rarr; **LDAP** &rarr; **接続** でメッセージをカスタマイズする必要があります。

**Method：**［**Bind**］（デフォルト）または ［**Password Compare**］ を選択します。 ［Bind］は標準のLDAPバインドを行います。［Password Compare］は、以下のフィールドで指定された暗号化アルゴリズムを使用して、LiferayとLDAPのパスワードを比較しようとします。 ［Password Compare］はめったに使用されません。

**Password Encryption Algorithm：** LDAPサーバーがパスワードの暗号化に使用するパスワード暗号化アルゴリズムを選択して、［Password Compare］バインド方式を使用する場合にパスワードを比較できるようにします。 これはほとんど使われません。

![［General］設定タブ。](./ldap-configuration-reference/images/02.png)

## ［Import］

以下のオプションを使用して、LDAPディレクトリからユーザーデータをインポートすることができます。

**インポートを有効にする。** LDAPディレクトリから大量にインポートする場合は、このボックスにチェックを入れます。 そうでない場合は、ログイン時にユーザーがインポートされます。

![ZiltoidとRexはログインしたため、インポートされました。](./ldap-configuration-reference/images/03.png)

**Enable Import on Startup:** このボックスをチェックすると、Liferay の起動時に一括インポートが行われます。 注：このボックスは、上記の ［**Enable Import**］ をオンにした場合にのみ表示されます。 Liferayクラスタを使用している場合は、必ずこのチェックを外してください。そうしないと、各ノードが起動したときに大量のインポートが行われます。

**インポート間隔。** ユーザーを大量にインポートする場合、X分ごとにユーザーをインポートする。

**Import Method：**［User］または［Group］を設定します。 これを［User］に設定すると、Liferayはサーバー接続で指定された場所からすべてのユーザーをインポートします。 ［Group］に設定すると、Liferayはすべてのグループを検索し、各グループ内のユーザーをインポートします。 どのグループにも属していないユーザーがいる場合、そのユーザーはインポートされません。

**Lock Expiration Time:** LDAP Userインポート時のアカウントロックの有効期限を設定します。 デフォルトは1日です。

**インポートユーザー同期ストラテジー。** ユーザーアカウントの同期に使用するストラテジーを設定します。 オプションは、［Auth Type］（つまり、ユーザーを認証する方法（画面名を使用するなど））と［UUID］（LDAP内にUUID属性が必要）です。

**Enable User Password on Import:** LDAPからユーザーをインポートする際に、デフォルトのパスワードを割り当てる。 このパスワードは自動生成することができます（下記参照）。

**インポート時にユーザーパスワードを自動生成** ユーザーインポート時にランダムなパスワードを作成します。

**Default User Password:****Enable User Password on Import** と **Autogenerate User Password on Import** が無効の場合、ここに入力したパスワードを使用します。

**インポート時にグループキャッシュを有効にします。** インポートされたグループをキャッシュすることで、データベースアクセスによるインポートの遅延を防ぎます。

**インポート時にグループごとにRoleを作成する。** LDAP グループごとに、対応する Liferay Role を作成します。

![インポート画面には、上記のオプションが含まれています。](./ldap-configuration-reference/images/04.png)

## ［Servers］

**LDAP サーバー。** Liferay は複数の LDAP サーバーへの接続をサポートしています。 ［**追加**］ ボタンを使用して、LDAPサーバーを追加します。

**サーバー名。** LDAPサーバーの名前を入力します。

**デフォルトの値です。** いくつかの一般的なディレクトリサーバーがここに表示されます。 これらのいずれかを使用する場合、それを選択すると、そのディレクトリのデフォルト値でフォームの残りの部分が入力されます。

LDAPへの接続に関する設定です。

**ベースプロバイダのURL。** LDAPサーバーへのリンク。 Liferay サーバーが LDAP サーバーと通信できることを確認します。 2つのシステムの間にファイアウォールがある場合は、適切なポートが開かれていることを確認してください。

**Base DN:** LDAPディレクトリの基本識別名で、通常は組織名をモデルにしています。 次のようになります。 `dc=companynamehere,dc=com`.

**Principal:** デフォルトのLDAP管理者ユーザーIDがここに入力されます。 管理者IDが異なる場合は、そのクレデンシャルを代わりに使用してください。 LiferayはこのIDを使用してLDAPとの間でユーザーアカウントを同期させるため、管理者クレデンシャルが必要です。

**認証情報を入力します。** LDAP管理ユーザーのパスワードを入力します。

![新しいLDAPサーバーを追加するには、いくつかのオプションを定義するだけです。](./ldap-configuration-reference/images/05.png)

LDAPの設定が完了したら、 ［**保存**］ ボタンをクリックします。

### システム設定から利用できるLDAPオプション

ほとんどの LDAP 設定は Instance Settings から行うことができますが、System Settings でしか利用できないパラメータがいくつかあります。 また、「インスタンス設定」の設定と重複しているものもあります。 これらは、新しい仮想インスタンスの **デフォルトの** 設定を変更します（以下の注を参照）。

```{note}
システム設定]を変更すると、現在の仮想インスタンスに影響します。 設定変更後、新規に仮想インスタンスを作成した場合、その仮想インスタンスは作成元の設定をデフォルトとして引き継ぎます。 たとえば、A、B、Cという名前の仮想インスタンスがあるとします。Aから、［*Error password history keywords*］を変更します。 この変更は、Aにのみ表示され、BまたはCには表示されません。次に、Aから仮想インスタンスDを作成します。DのデフォルトはAの設定に基づいているため（DはAから作成されたので）、［*Error password history keywords*］への変更はDに表示されます（BまたはCには表示されません）。
```

これらのオプションを変更する必要がある場合は、 **コントロールパネル** &rarr; **設定** &rarr; **システム設定** にナビゲートしてください。 ［**Security**］ セクションに移動し、タイトルにLDAPが含まれるエントリを見つけます。 ここで新たに設定するのは、 **Connection** の項目だけです。

**Error password age keywords** ここで、LDAPサーバーから返される可能性のあるエラーメッセージからフレーズのリストを設定することができます。 **ユーザーが LDAP にバインドするとき、サーバーは成功または失敗の応答とともに** コントロール* を返します。 これらのコントロールには、エラーを説明するメッセージや、レスポンスとともに返される情報が含まれます。 LDAP サーバー間でコントロールは同じですが、メッセージは異なる場合があります。 ここで説明するプロパティは、これらのメッセージの言葉の断片を含んでおり、Red HatのFedora Directory Serverで動作します。 そのサーバーを使用していない場合、ワードスニペットはLDAPサーバーで動作しない可能性があります。 そうでない場合は、これらのプロパティの値を、サーバーのエラーメッセージのフレーズで置き換えることができます。 これにより、Liferayはそれらを認識することができます。
