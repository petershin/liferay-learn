# ユーザーグループAPIの基本

アプリケーションメニューから [Create and Manage User Groups](../user-groups/creating-and-managing-user-groups.md) ができますが、Liferay の REST API を使うこともできます。 これらのサービスを呼び出して、ユーザーグループを管理する。

## ユーザーグループの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. User Groups API Basics](./liferay-y6f2.zip)をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-y6f2.zip -O
   ```

   ```bash
   unzip liferay-y6f2.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しいユーザーグループを追加します。 コマンドラインで、 `curl`フォルダに移動します。 `UserGroup_POST_ToInstance.sh` スクリプトを実行します。

   ```bash
   ./UserGroup_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しいユーザーグループが追加されたことを示している：

   ```json
   {
     "description" : "",
     "externalReferenceCode" : "72c5739f-a6e9-d4b8-5481-7cf1a427ea79",
     "id" : 43099,
     "name" : "Able",
     "usersCount" : 0
   }
   ```

1. *Global Menu* &rarr; *Control Panel* &rarr; *User Groups*に移動する。 新しいユーザーグループが追加されていることを確認してください。

   ![新しいユーザーグループが追加されていることを確認してください。](./user-groups-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `UserGroup_POST_ToInstance.java` クラスを以下のコマンドで実行する。

   ```bash
   java -classpath .:* UserGroup_POST_ToInstance
   ```

## cURLコマンドの検証

`UserGroup_POST_ToInstance.sh` スクリプトは、cURLコマンドでRESTサービスを呼び出します。

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                               | 説明                              |
|:---------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                            | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                        | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/user-groups"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Able\"}"`                                  | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                    | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。 OAuth2を利用したReactアプリケーションのサンプルは、[OAuth2を利用したユーザー認証](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) をご参照ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`UserGroup_POST_ToInstance.java` クラスは、ユーザ・グループ関連サービスを呼び出してユーザ・グループを追加する。

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-24
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                       | 説明                                                          |
|:---------------------------------------------------------------------------- |:----------------------------------------------------------- |
| `UserGroupResource.Builder builder = ...`                                    | `UserGroupResource` サービスインスタンスを生成するための `Builder` を取得します。    |
| `UserGroupResource userGroupResource = builder.authentication(...).build();` | 基本認証を指定し、 `UserGroupResource` サービスインスタンスを生成する。              |
| `UserGroup userGroup = userGroupResource.postUserGroup(...);`                | `userGroupResource.postUserGroup` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.user.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラス例もこれと似ているが、異なる `UserGroupResource` メソッドを呼び出している。

```{important}
サービスの詳細は [UserGroupResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/UserGroupResource.java) を参照してください。
```

以下は、cURLとJavaを使用して、他の `UserGroup` RESTサービスを呼び出す例です。

## インスタンスからユーザーグループを取得する

以下のcURLまたはJavaコマンドを実行することで、ユーザーグループの一覧を表示することができます。

### UserGroups_GET_FromInstance.sh

コマンド：

```bash
./UserGroups_GET_FromInstance.sh
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroups_GET_FromInstance.sh
   :language: bash
```

### UserGroups_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* UserGroups_GET_FromInstance
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroups_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `UserGroup` オブジェクトがJSONで表示されます。

## ユーザーグループ

以下のcURLまたはJavaコマンドで特定のユーザー・グループを取得する。

```{tip}
インスタンスの ``ユーザグループ`` ID を取得するには ``UserGroups_GET_FromInstance.[java|sh]`` を使用してください。
```

### UserGroup_GET_ById.sh

コマンド:

```bash
./UserGroup_GET_ById.sh 1234
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_GET_ById.sh
   :language: bash
```

### UserGroup_GET_ById.java

コマンド：

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_GET_ById
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`UserGroup` フィールドはJSONで表示される。

## ユーザーグループにパッチを当てる

以下のcURLコマンドとJavaコマンドを使用して、既存のユーザー・グループを部分的に編集する。 `1234` をユーザーグループのIDに置き換えてください。

### UserGroup_PATCH_ById.sh

コマンド：

```bash
./UserGroup_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_PATCH_ById.sh
   :language: bash
```

### UserGroup_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_PATCH_ById
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## ユーザーグループを作る

以下のcURLとJavaコマンドで、既存のユーザーグループを完全に上書きする。 `1234` をユーザーグループのIDに置き換えてください。

### UserGroup_PUT_ById.sh

コマンド：

```bash
./UserGroup_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_PUT_ById.sh
   :language: bash
```

### UserGroup_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_PUT_ById
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## ユーザーグループの削除

以下のcURLおよびJavaコマンドを使用して、既存のユーザー・グループを削除する。 `1234` をユーザーグループのIDに置き換えてください。

### UserGroup_DELETE_ById.sh

コマンド:

```bash
./UserGroup_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_DELETE_ById.sh
   :language: bash
```

### UserGroup_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_DELETE_ById
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には、 `UserGroup` のすべてのサービスとスキーマが表示され、各サービスを試すためのインターフェイスが用意されている。
