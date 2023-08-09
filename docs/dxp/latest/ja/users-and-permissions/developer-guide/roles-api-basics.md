# ロールAPIの基本

アプリケーションメニューから [Create and Manage Roles](../roles-and-permissions/creating-and-managing-roles.md) ができますが、Liferay の REST API を使うこともできます。 ロールを管理するためにこれらのサービスを呼び出す。

## ユーザーを通常の役割に関連付ける

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Roles API Basics](./liferay-z3v5.zip)をダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-z3v5.zip -O
   ```

   ```bash
   unzip liferay-z3v5.zip
   ```

1. ユーザーIDのリストを取得するには、 [Users_GET_FromInstance](./user-account-api-basics.md#get-instance-users)。 レギュラー・ロールに関連付けたいユーザーIDをメモしてください。

1. [Roles_GET_FromInstance](#get-roles-from-instance) を使用して、すべてのロールIDのリストを取得します。 `roleType: regular`関連付けたいロールIDをメモしておくこと。 例えば、アナリティクス管理者の通常の役割タイプ。

1. cURLスクリプトを使用して、ユーザーを通常の役割に関連付けます。 コマンドラインで、 `curl`フォルダに移動します。 `RoleUserAssociation_POST_ToInstance.sh` スクリプトを実行します。 `1234` をレギュラー・ロールのIDに置き換えてください。 `5678` をユーザーIDに置き換えてください。

   ```bash
   ./RoleUserAssociation_POST_ToInstance.sh 1234 5678
   ```

1. *Global Menu* &rarr; *Control Panel* &rarr; *Roles*に移動する。 Regular Roles]タブで、ユーザの関連付けに使用した特定の[Role]をクリックします。 *Assignees* タブをクリックします。 ユーザが選択したロールに関連付けられたことを確認します。

   ![ユーザが関連付けられたことを確認する。](./roles-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `RoleUserAssociation_POST_ToInstance.java` クラスを以下のコマンドで実行します。

   ```bash
   java -classpath .:* -DroleId=1234 -DuserAccountId=5678 RoleUserAssociation_POST_ToInstance
   ```

## cURLコマンドの検証

`RoleUserAssociation_POST_ToInstance.sh` スクリプトは、cURLコマンドでRESTサービスを呼び出します。

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
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。 OAuth2を利用したReactアプリケーションのサンプルは、[OAuth2を利用したユーザー認証](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) をご参照ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`RoleUserAssociation_POST_ToInstance.java` クラスは、Role関連サービスを呼び出すことで、ユーザーを通常のRoleに関連付けます。

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                             | 説明                                                         |
|:------------------------------------------------------------------ |:---------------------------------------------------------- |
| `RoleResource.Builder builder = ...`                               | `RoleResource` サービスインスタンスを生成するための `Builder` を取得します。        |
| `RoleResource roleResource = builder.authentication(...).build();` | 基本認証を指定し、 `RoleResource` サービスインスタンスを生成する。                  |
| `roleResource.postRoleUserAccountAssociation(...);`                | `postRoleUserAccountAssociation` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.user.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラス例もこれと似ているが、異なる `RoleResource` メソッドを呼び出している。

```{important}
サービスの詳細は、 [RoleResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/AccountResource.java)を参照してください。
```

以下は、cURLとJavaを使用して他の `Role` RESTサービスを呼び出す例です。

## インスタンスからロールを取得する

以下のcURLまたはJavaコマンドを実行することで、ロールを一覧表示できる。

### Roles_GET_FromInstance.sh

コマンド：

```bash
./Roles_GET_FromInstance.sh
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Roles_GET_FromInstance.sh
   :language: bash
```

### Roles_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Roles_GET_FromInstance
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Roles_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-21
```

インスタンスの `Roles` オブジェクトがJSONで表示される。

## 役割を得る

以下のcURLまたはJavaコマンドで特定のRoleを取得する。

```{tip}
インスタンスの ``役割`` ID を取得するには ``Roles_GET_FromInstance.[java|sh]`` を使用してください。
```

### Role_GET_ById.sh

コマンド:

```bash
./Role_GET_ById.sh 1234
```

コード:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Role_GET_ById.sh
   :language: bash
```

### Role_GET_ById.java

コマンド：

```bash
java -classpath .:* -DroleId=1234 Role_GET_ById
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Role_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

`Role` フィールドはJSONで表示される。

## ユーザーをサイトの役割に関連付ける

ユーザを特定のサイト役割に関連付けることができます。 `1234` を役割のIDに置き換えてください。 `5678` をあなたのサイトのIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_POST_ToSite.sh

コマンド：

```bash
./RoleUserAssociation_POST_ToSite.sh 1234 5678 9012
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToSite.sh
   :language: bash
```

### RoleUserAssociation_POST_ToSite.java

コマンド：

```bash
java -classpath .:* -DroleId=1234 -DsiteId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToSite
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## ユーザーを組織の役割に関連付ける

ユーザーを特定の組織ロールに関連付けることができます。 `1234` をあなたの組織のIDに置き換えてください。 `5678` をあなたのロールのIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_POST_ToOrganization.sh

コマンド：

```bash
./RoleUserAssociation_POST_ToOrganization.sh 1234 5678 9012
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToOrganization.sh
   :language: bash
```

### RoleUserAssociation_POST_ToOrganization.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 -DroleId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToOrganization
```

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## レギュラー・ロールの関連付けを解除

特定のユーザーから通常の役割の関連付けを削除します。 `1234` をロールのIDに置き換えてください。 `5678` をユーザーIDに置き換えてください。

### RoleUserAssociation_DELETE_FromInstance.sh

コマンド:

```bash
./RoleUserAssociation_DELETE_FromInstance.sh 1234 5678
```

コード：

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

特定のユーザーからサイト役割の関連付けを削除します。 `1234` を役割のIDに置き換えてください。 `5678` をあなたのサイトのIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_DELETE_FromSite.sh

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

コード：

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 組織の役割協会を削除

特定のユーザーから組織ロールの関連付けを削除します。 `1234` を組織のIDに置き換えてください。 `5678` をあなたのロールのIDに置き換えてください。 `9012` をユーザーIDに置き換えてください。

### RoleUserAssociation_DELETE_FromOrganization.sh

コマンド：

```bash
./RoleUserAssociation_DELETE_FromOrganization.sh 1234 5678 9012
```

コード：

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

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) は、 `Role` のすべてのサービスとスキーマを表示し、各サービスを試すためのインターフェイスを備えている。
