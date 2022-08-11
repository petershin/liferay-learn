# ロールAPIの基本

アプリケーションメニューから [Create and Manage Roles](../roles-and-permissions/creating-and-managing-roles.md) を利用できますが、LiferayのREST APIを利用することも可能です。 これらのサービスを呼び出して、Roleを管理します。

## ユーザーを通常の役割に関連付ける
```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. Download and unzip [Roles API Basics](./liferay-z3v5.zip) .

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/users-and-permissions/developer-guide/liferay-z3v5.zip -O
   ```

   ```bash
   unzip liferay-z3v5.zip
   ```

1. ユーザーIDの一覧を取得するには、 [Users_GET_FromInstance](./user-account-api-basics.md#get-instance-users) を使用します。 Regular Roleに関連付けたいユーザーIDをメモしておきます。

1. [Roles_GET_FromInstance](#get-roles-from-instance) を使用して、すべてのRole IDのリストを取得します。 `roleType: regular`関連付けたいロールIDをメモしておきます。 例えば、「Analytics Administrator Regular Role」タイプ。

1. cURL スクリプトを使用して、ユーザーを通常のロールに関連付けます。 コマンドラインで、 `curl` フォルダに移動します。 `RoleUserAssociation_POST_ToInstance.sh` スクリプトを実行します。 `1234` を Regular Role の ID に置き換えてください。 `5678` をユーザーIDに置き換えてください。

   ```bash
   ./RoleUserAssociation_POST_ToInstance.sh 1234 5678
   ```

1. *Global Menu* &rarr; *Control Panel* &rarr; *Roles*に移動します。 通常の役割]タブで、ユーザーを関連付けるために使用した特定の役割をクリックします。 *Assignees* タブをクリックします。 選択した役割にユーザーが関連付けられていることを確認します。

   ![ユーザーが関連付けられたことを確認します。](./roles-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `RoleUserAssociation_POST_ToInstance.java` クラスを次のコマンドで実行します。

   ```bash
   java -classpath .:* -DroleId=1234 -DuserAccountId=5678 RoleUserAssociation_POST_ToInstance
   ```

## cURLコマンドの検証

`RoleUserAssociation_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                            | 説明                              |
|:--------------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                         | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                     | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/roles/${1}/association/user-account/${2}"` | RESTサービスのエンドポイント                |
| `-u "test@liferay.com:learn"`                                                                 | 基本的な認証情報                        |

```{note}
ここでは、デモのためにベーシック認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) 経由でユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`RoleUserAssociation_POST_ToInstance.java` クラスは、Role 関連サービスを呼び出すことで、User を Regular Role に関連付けました。

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                             | 説明                                                      |
|:------------------------------------------------------------------ |:------------------------------------------------------- |
| `RoleResource.Builder builder = ...`                               | `RoleResource` サービスインスタンスを生成するための `Builder` を取得する。      |
| `RoleResource roleResource = builder.authentication(...).build();` | Basic 認証を指定し、 `RoleResource` サービスインスタンスを生成します。          |
| `roleResource.postRoleUserAccountAssociation(...);`                | `postRoleUserAccountAssociation` メソッドを呼び出し、postにデータを渡す。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.user.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラスの例もこれと同様であるが、異なる `RoleResource` メソッドを呼び出している。

```{important}
サービスの詳細は、 [RoleResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/AccountResource.java) を参照してください。
```

以下は、cURL と Java を使用して、他の `Role` REST サービスを呼び出す例です。

## インスタンスからロールを取得する

以下のcURLまたはJavaコマンドを実行することで、Roleの一覧を表示することができます。

### Roles_GET_FromInstance.sh

コマンド:

```bash
./Roles_GET_FromInstance.sh
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Roles_GET_FromInstance.sh
   :language: bash
```

### Roles_GET_FromInstance.java

コマンド:

```bash
java -classpath .:* Roles_GET_FromInstance
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Roles_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-21
```

Instance の `Roles` オブジェクトが JSON で表示されます。

## 役割分担をする

以下のcURLまたはJavaコマンドを使用して、特定のRoleを取得します。

```{tip}
インスタンスの ``Role`` ID を取得するには、 ``Roles_GET_FromInstance.[java|sh]`` を使用します。
```

### Role_GET_ById.sh（ロールゲットバイアイディー）。

コマンド:

```bash
./Role_GET_ById.sh 1234
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Role_GET_ById.sh
   :language: bash
```

### Role_GET_ById.java

コマンド:

```bash
java -classpath .:* -DroleId=1234 Role_GET_ById
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Role_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 9-20
```

`Role` フィールドは、JSONで表示されます。

## ユーザーをサイトの役割に関連付ける

ユーザーを特定のサイトロールに関連付けることができます。 `1234` をRoleのIDに置き換えてください。 `5678` をお客様のサイトIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_POST_ToSite.shを実行します。

コマンド:

```bash
./RoleUserAssociation_POST_ToSite.sh 1234 5678 9012
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToSite.sh
   :language: bash
```

### RoleUserAssociation_POST_ToSite.java

コマンド:

```bash
java -classpath .:* -DroleId=1234 -DsiteId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToSite
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## ユーザーを組織の役割に関連付ける

ユーザーを特定の組織ロールに関連付けることができます。 `1234` を組織のIDに置き換えてください。 `5678` を自分のRoleのIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_POST_ToOrganization.shを実行します。

コマンド:

```bash
./RoleUserAssociation_POST_ToOrganization.sh 1234 5678 9012
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToOrganization.sh
   :language: bash
```

### RoleUserAssociation_POST_ToOrganization.java

コマンド:

```bash
java -classpath .:* -DorganizationId=1234 -DroleId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToOrganization
```

コード:

```{literalinclude} ./role-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## レギュラーロールの関連付けを解除する

特定のユーザーから通常の役割の関連付けを削除します。 `1234` をRoleのIDに置き換えてください。 `5678` をユーザーIDに置き換えてください。

### RoleUserAssociation_DELETE_FromInstance.shを実行します。

コマンド:

```bash
./RoleUserAssociation_DELETE_FromInstance.sh 1234 5678
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromInstance.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromInstance.java

コマンド

```bash
java -classpath .:* -DroleId=1234 -DuserAccountId=5678 RoleUserAssociation_DELETE_FromInstance
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## サイトの役割の関連付けを削除する

特定のユーザーからサイトロールの関連付けを削除する。 `1234` をRoleのIDに置き換えてください。 `5678` をお客様のサイトIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_DELETE_FromSite.shを実行します。

コマンド:

```bash
./RoleUserAssociation_DELETE_FromSite.sh 1234 5678 9012
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromSite.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromSite.java

コマンド

```bash
java -classpath .:* -DroleId=1234 -DsiteId=5678 -DuserAccountId=9012 RoleUserAssociation_DELETE_FromSite
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 組織の役割の関連付けを解除する

特定のユーザーから組織ロールの関連付けを解除する。 `1234` を組織のIDに置き換えてください。 `5678` を自分のRoleのIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_DELETE_FromOrganization.sh

コマンド：

```bash
./RoleUserAssociation_DELETE_FromOrganization.sh 1234 5678 9012
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromOrganization.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromOrganization.java

コマンド

```bash
java -classpath .:* -DorganizationId=1234 -DroleId=5678 -DuserAccountId=9012 RoleUserAssociation_DELETE_FromOrganization
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には `Role` のすべてのサービスとスキーマが表示され、各サービスを試用するためのインターフェイスが用意されています。
