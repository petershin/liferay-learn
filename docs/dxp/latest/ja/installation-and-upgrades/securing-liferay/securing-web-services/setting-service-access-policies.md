# サービス・アクセス・ポリシーの設定

**サービス・アクセス・ポリシー** は、リモートで呼び出せるサービスまたはサービスメソッドを定義します。 それらの多くを一度に適用して、複合効果を生み出すことができます。 これらは、Webサービスの（IP権限後の）[2番目のセキュリティ層](../securing-web-services.md)です。 カスタムサービス・アクセス・ポリシーは、ポータル管理者が作成できます。 これらは、ポータルのトークン認証システム（OAuth 2）によって適用されます。

サービス・アクセス・ポリシーは、Webサービスの呼び出しを介して公開されるメソッドのホワイトリストを定義します。 ワイルドカードを使用して、ホワイトリストに登録されているクラスとメソッドを定義できます。 サービス・アクセス・ポリシーは権限システムを尊重することに注意してください。 ポリシーがユーザーにリモートサービスへのアクセスを許可する場合、そのユーザーは引き続き、そのサービスを呼び出すための適切な権限を持っている必要があります。

## デフォルトサービス・アクセス・ポリシー

サービス・アクセス・ポリシーを表示および管理するには、 ［**Control Panel**］ &rarr; ［**Configuration**］ &rarr; ［**Service Access Policy**］ に移動します。

![サービス・アクセス・ポリシービュー](./setting-service-access-policies/images/01.png)

12のサービス・アクセス・ポリシーがデフォルトで有効になっています。 これらのうち5つはシステムに関係しています。

| サービス・アクセス・ポリシー              | Description                                                                                                                                                                                                                                                              | デフォルト設定で有効 |
|:--------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |:---------- |
| **ASSET** ENTRY **DEFAULT** | アセットが取得されたときにアセットのビューカウンターを更新できるようにします。                                                                                                                                                                                                                                  | &#10004;   |
| **AUTHORIZED** OAUTH2 **SAP** | OAuth 2によって承認されたすべてのRESTリクエストを許可します。                                                                                                                                                                                                                                     | &#10004;   |
| **CALENDAR_DEFAULT** | カレンダーで公開イベントを検索できるようにします。                                                                                                                                                                                                                                                | &#10004;   |
| **SYSTEM_DEFAULT** | JavaScriptの呼び出しによって国/地域のサービスにアクセスできるため、ユーザーはその場で言語を切り替えることができます。 認証されていないリクエストを含むすべてのリクエストに適用されます。                                                                                                                                                                       | &#10004;   |
| **SYSTEM** USER **PASSWORD** | 任意のメソッドを呼び出すことができます。 もちろん、API関数には権限チェックが含まれているため、この呼び出しは、ユーザーが必要な権限を持っている場合にのみ機能します。 これは、`AuthVerifierResult.isPasswordBasedAuthentication` が`true`のリクエスト（つまりユーザー認証がパスワードを使用して行われたとき）に適用されます。 特定のAPI関数の呼び出しを完全に禁止する場合は、`SYSTEM_USER_PASSWORD`ポリシーを`*`よりも制限の厳しいものに変更できます。 | &#10004;   |

```{note}
`SYSTEM_DEFAULT`、および`Default`が`Yes`に設定されている他のポリシーは、認証されていないリクエストを含むすべての受信リクエストに適用されます。
```

他の7つのポリシーは、OAuthおよびJSON Webサービスに関係しています。

| サービス・アクセス・ポリシー                                         | 説明                                                                                                                                                                                                                      | デフォルト設定で有効 |
|:------------------------------------------------------ |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:---------- |
| **OAUTH2_analytics.read/write** | [Liferay Analytics Cloud](https://www.liferay.com/products/analytics-cloud) と統合して、JSON Webサービスにアクセスできるようにします。                                                                                                            | &#10004;   |
| **OAUTH2** everything/read/documents/userprofile/write **| Everythingポリシーは、さまざまな理由ですべてのJSON Webサービスへのアクセスを許可します。 Everythingとはすべて、つまりすべてのJSON Webサービスです（`*`に一致）。 その他は、その説明に適したメソッドシグネチャと一致します。 たとえば、OAUTH2** everything.readは、`fetch`、`get`、`has`、`is`、または`search`で始まるすべてのメソッドに一致します。 | &#10004;   |

デフォルト設定では、システムに付属するすべてのWebサービスへのアクセスを提供する対応するスコープが使用可能になります。 スコープを使用できるようにするには、OAuth 1または2アプリケーションに割り当てる必要があります。 管理者は、使用するスコープを確認し、他のスコープを無効にする必要があります。

## サービス・アクセス・ポリシーについて

サービス・アクセス・ポリシーを作成または編集するときは、次の点に注意してください。

* サービスアクセスポリシー名は、ポータルインスタンスごとに一意である必要があります。
* サービスアクセスポリシー名には、次の許可された文字のみを含めることができます。

    ```
    0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#:@-./_
    ```

* サービス・アクセス・ポリシーのタイトルはローカライズできます。サービスアクセスポリシー名はローカライズできません。
* 許可されたサービス署名は、1行に1つずつ入力する必要があります。 ワイルドカード（`*`）は、クラス名とメソッド名の両方に使用できます。 クラス名とメソッド名を区切るには、`#`記号を使用する必要があります。

たとえば、`com.liferay.portal.kernel.service.UserService`では、`UserService`クラスの任意のメソッドを呼び出すことができます。 `com.liferay.document.library.kernel.service.DLAppService#get*`を使用すると、`get`で始まる`DLAppService`の任意のメソッドを呼び出すことができます。

次の例では、`UserService`クラスの任意のメソッドを呼び出すことができ、名前が`get`で始まる`DLAppService`の任意のメソッドを呼び出すことができます。

```
com.liferay.portal.kernel.service.UserService
com.liferay.document.library.kernel.service.DLAppService#get*
```

## サービス・アクセス・ポリシーの作成

新規サービスアクセスポリシーを作成するには：

1. コントロールパネルの ［**設定**］ &rarr; ［**サービス・アクセス・ポリシー**］ セクションに移動します。
1. **追加**（![add](../../../images/icon-add.png)）をクリックします。
1. ポリシーに名前を付けます。
1. ポリシーを有効にするには、 ［**Enabled**］ トグルを切り替えます。
1. 認証されていない要求と認証されている要求にポリシーを適用する場合は、 ［**Default**］ というラベルの付いたトグルを切り替えます。
1. ポリシーにローカライズされたタイトルを付けます。
1. ［**サービスシグネチャーを許可**］ で、インストールされているサービスクラスの完全修飾名を入力します。
1. ［メッソド名］で、サービスメソッド呼び出しの入力を開始します。

    ```{note}
    コード補完は、`Service Class`フィールドと`Method Name`フィールドの両方で使用できます。
    ```

1. 別のサービスまたはメソッドを指定するには、プラスアイコンをクリックして別のエントリを追加します。
1. 完了したら、 ［**保存**］ をクリックします。

```{tip}
すべてのメソッドシグネチャが事前にわかっている場合は、［*詳細モードに切り替え*］をクリックして、すべてを1つのフィールドの別々の行に入力します。
```

<!-- The following two paragraphs feel out of place; not sure where they should go. -->
Liferayアプリケーションは、独自のデフォルトポリシーを宣言できます。 このポリシーは、管理者が変更または無効にすることができます。 この場合でも、プラグインはポリシーが存在することを確認できるため、ポリシーを再定義したり更新する必要はありません。

デフォルトでは、Liferayのトンネリングサーブレットは`SYSTEM_USER_PASSWORD`サービスアクセスポリシーを使用します。 ただし、トンネリングサーブレット用に独自のポリシーを作成し、`TunnelingServletAuthVerifier`の`service.access.policy.name`プロパティを使用して、代わりに自分のポリシーを使用するように指定できます。

## サービス・アクセス・ポリシーモジュールについて

Liferayのサービス・アクセス・ポリシー機能は、サービス・アクセス・ポリシーモジュールによって提供されます。 このモジュールには、次の重要なクラスが含まれています。

* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicy`：`ServiceAccessPolicy`のパブリックインターフェースを定義します。
* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyManager`：`ServiceAccessPolicy`のインスタンスを取得するためのパブリックインターフェースを定義します。
* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyManagerUtil`：サービス・アクセス・ポリシー機能を、まだモジュール化されていないLiferayのコアの部分にブリッジします。
* `com.liferay.portal.kernel.security.service.access.policy.ServiceAccessPolicyThreadLocal`：`ServiceAccessPolicy`インスタンスをアクティブにします。

Liferayのサービス・アクセス・ポリシーモジュールは、ソースコードの`modules/apps/service-access-policy`フォルダにあります。 次の3つのバンドルを実行すると、サービス・アクセス・ポリシー機能が提供されます（これらは`［Liferay Home］/osgi/modules`フォルダにあります）。

* `com.liferay.service.access.policy.api.jar`
* `com.liferay.service.access.policy.service.jar`
* `com.liferay.service.access.policy.web.jar`

これらのモジュールは、コントロールパネルからアクセスできるサービス・アクセス・ポリシー管理UIを提供します。 また、`ServiceAccessPolicy`のインターフェースとデフォルト実装も提供します。

## サービス・アクセス・ポリシーモジュールの構成

1. ［**Control Panel**］ &rarr; ［**System Settings**］ &rarr; ［**API Authentication**］ に移動します。

    ![サービス・アクセス・ポリシーモジュールの場所](./setting-service-access-policies/images/02.png)

1. ［セキュリティ］セクションの ［**Service Access Policies**］ モジュールをクリックします。 名前をクリックして編集します。

1. デフォルトのサービス・アクセス・ポリシー設定は編集できます。 `AuthVerifier`によってポリシーが適用されていない場合でも、デフォルトのポリシーを強制的に適用することもできます。

`AuthenticatedAccessControlPolicy`もあります。 `ServiceAccessPolicyManager`実装が存在する場合、このポリシーは何もしません。 ただし、サービス・アクセス・ポリシーモジュールが無効になっている場合、`AuthenticatedAccessControlPolicy`によってフォールバックが提供され、Webサービスには引き続き認証済みのアクセスが必要になります。
