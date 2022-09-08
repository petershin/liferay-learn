# User Groups APIの基本

アプリケーションメニューから [Create and Manage User Groups](../user-groups/creating-and-managing-user-groups.md) を利用できますが、LiferayのREST APIを利用することも可能です。 これらのサービスを呼び出して、ユーザーグループを管理します。

## ユーザーグループの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [User Groups API Basics](./liferay-y6f2.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/users-and-permissions/developer-guide/liferay-y6f2.zip -O
   ```

   ```bash
   unzip liferay-y6f2.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しいユーザーグループを追加します。 コマンドラインで、 `curl` フォルダに移動します。 `UserGroup_POST_ToInstance.sh` スクリプトを実行します。

   ```bash
   ./UserGroup_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しいユーザーグループが追加されたことが示されています。

   ```bash
   "description" : "",
   "externalReferenceCode" : "72c5739f-a6e9-d4b8-5481-7cf1a427ea79",
   "id" : 43099,
   "name" : "Able",
   "usersCount" : 0

   ```

2. *Global Menu* &rarr; *Control Panel* &rarr; *User Groups*に移動します。 新しいユーザーグループが追加されたことを確認します。

   ![新しいユーザーグループが追加されたことを確認します。](./user-groups-api-basics/images/01.png)

3. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

4. `UserGroup_POST_ToInstance.java` クラスを、以下のコマンドで実行します。

   ```bash
   java -classpath .:* UserGroup_POST_ToInstance
   ```

## cURLコマンドの検証

`UserGroup_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

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
ここでは、デモのためにベーシック認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`UserGroup_POST_ToInstance.java` クラスは、ユーザーグループ関連サービスを呼び出して、ユーザーグループを追加します。

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-24
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                       | 説明                                                          |
|:---------------------------------------------------------------------------- |:----------------------------------------------------------- |
| `UserGroupResource.Builder builder = ...`                                    | `UserGroupResource` サービスインスタンスを生成するための `Builder` を取得する。     |
| `UserGroupResource userGroupResource = builder.authentication(...).build();` | Basic 認証を指定し、 `UserGroupResource` サービスインスタンスを生成します。         |
| `UserGroup userGroup = userGroupResource.postUserGroup(...);`                | `userGroupResource.postUserGroup` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.user.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラスの例もこれと同様ですが、異なる `UserGroupResource` メソッドを呼び出しています。

```{important}
サービスの詳細は [UserGroupResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/UserGroupResource.java) を参照ください。
```

以下は、cURL と Java を使用して、他の `UserGroup` REST サービスを呼び出す例です。

## インスタンスからユーザーグループを取得する

以下のcURLまたはJavaコマンドを実行することで、User Groupの一覧を表示することができます。

### UserGroups_GET_FromInstance.sh

コマンド:

```bash
./UserGroups_GET_FromInstance.sh
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroups_GET_FromInstance.sh
   :language: bash
```

### UserGroups_GET_FromInstance.java

コマンド:

```bash
java -classpath .:* UserGroups_GET_FromInstance
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroups_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

Instance の `UserGroup` オブジェクトが JSON で表示されます。

## ユーザーグループの取得

以下のcURLまたはJavaコマンドで、特定のユーザーグループを取得します。

```{tip}
ユーザーグループ ID を取得するには、 ``UserGroups_GET_FromInstance.[java|sh]`` を使用します。
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

コマンド:

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_GET_ById
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 9-20
```

`UserGroup` フィールドは、JSONで表示されます。

## ユーザーグループのパッチ

以下のcURLとJavaコマンドを使用して、既存のユーザーグループの部分編集を行います。 `1234` をユーザーグループのIDに置き換えてください。

### UserGroup_PATCH_ById.sh

コマンド:

```bash
./UserGroup_PATCH_ById.sh 1234
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_PATCH_ById.sh
   :language: bash
```

### UserGroup_PATCH_ById.java

コマンド:

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_PATCH_ById
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## ユーザーグループを置く

以下のcURLとJavaのコマンドで、既存のユーザーグループを完全に上書きします。 `1234` をユーザーグループのIDに置き換えてください。

### UserGroup_PUT_ById.sh

コマンド:

```bash
./UserGroup_PUT_ById.sh 1234
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/curl/UserGroup_PUT_ById.sh
   :language: bash
```

### UserGroup_PUT_ById.java

コマンド:

```bash
java -classpath .:* -DuserGroupId=1234 UserGroup_PUT_ById
```

コード:

```{literalinclude} ./user-groups-api-basics/resources/liferay-y6f2.zip/java/UserGroup_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## ユーザーグループの削除

以下のcURLおよびJavaコマンドで、既存のUser Groupを削除します。 `1234` をユーザーグループのIDに置き換えてください。

### UserGroup_DELETE_ById.sh

コマンド:

```bash
./UserGroup_DELETE_ById.sh 1234
```

コード:

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

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には、 `UserGroup` のすべてのサービスとスキーマが表示され、各サービスを試用できるインターフェイスを備えています。
