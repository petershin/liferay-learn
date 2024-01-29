# ユーザーアカウントAPIの基本

コントロールパネルから [ユーザーの追加と管理](../users/adding-and-managing-users.md) ができますが、Liferay の REST API を使うこともできます。 これらのサービスを呼び出して、ユーザーの追加、編集、削除を行うことができます。

まず、新しいユーザーを追加します。

## ユーザーの追加

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従います。

1. [User Account API Basics](./liferay-y6q4.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-y6q4.zip -O
   ```

   ```bash
   unzip liferay-y6q4.zip
   ```

1. cURLスクリプトを使用して、Liferayインスタンスに新規ユーザーを追加します。 コマンドラインで `curl` フォルダに移動します。 `User_POST_ToInstance.sh`スクリプトを実行する。

   ```bash
   ./User_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しいUserが追加されたことを示しています。

   ```json
   {
     "additionalName": "",
     "alternateName": "able",
     "birthDate": "1977-01-01T00:00:00Z",
     "customFields": [],
     "dashboardURL": "",
     "dateCreated": "2021-05-19T16:04:46Z",
     "dateModified": "2021-05-19T16:04:46Z",
     "emailAddress": "able@liferay.com",
     "familyName": "Foo",
     "givenName": "Able",
     "id": 39321,
     "jobTitle": "",
     "keywords": [],
     "name": "Able Foo",
     "organizationBriefs": [],
     "profileURL": "",
     "roleBriefs": [
       {
         "id": 20113,
         "name": "User"
       }
     ],
     "siteBriefs": [
       {
         "id": 20127,
         "name": "Global"
       },
       {
         "id": 20125,
         "name": "Guest"
       }
     ],
     "userAccountContactInformation": {
       "emailAddresses": [],
       "facebook": "",
       "jabber": "",
       "postalAddresses": [],
       "skype": "",
       "sms": "",
       "telephones": [],
       "twitter": "",
       "webUrls": []
     }
   }%
   ```

   コントロールパネルで、新しく追加されたユーザーを確認します。 後のコマンドのために、ユーザーの `id` 番号を控えておくこと。

   ![See the added User in Control Panel.](./user-account-api-basics/images/01.png)

1. RESTサービスは、Javaクラスで呼び出すこともできます。 `curl`フォルダから`java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. 以下のコマンドで `User_POST_ToInstance` クラスを実行する：

   ```bash
   java -classpath .:* User_POST_ToInstance
   ```

   コントロールパネルで、別のユーザーが追加されていることを確認します。

   ![In Control Panel, another User has been added.](user-account-api-basics/images/02.png)

cURLコマンドとJavaクラスの仕組みをご覧ください。

## cURLコマンドの検証

`User_POST_ToInstance.sh`スクリプトは、cURLコマンドでRESTサービスを呼び出す。

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                                             | 説明                              |
| :----------------------------------------------------------------------------------------------------------------------------- | :------------------------------ |
| `-H "Content-Type: application/json"`                                                                                          | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                                                      | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/user-accounts"`                                                             | RESTサービスのエンドポイント                |
| `-d "{\"alternateName\": \"Able\", \"emailAddress\": \"able@liferay.com\", \"familyName\": \"Foo\", \"givenName\": \"Able\"}"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                                                                  | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を介してユーザーを認証する必要があります。 OAuth2 を使用する React アプリケーションのサンプルについては、 [OAuth2によるユーザーの認証](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```
他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`User_POST_ToInstance.java` クラスは、ユーザー関連サービスを呼び出してユーザーを追加する。

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                          | 説明                                                          |
| :------------------------------------------------------------------------------ | :---------------------------------------------------------- |
| `UserAccountResource.Builder builder = ...`                                     | `UserAccountResource`サービスインスタンスを生成するための`Builder` を取得する。     |
| `UserAccountResource userAccountResource = builder.authentication(...).build()` | 基本認証を指定し、`UserAccountResources` サービスインスタンスを生成する。            |
| `UserAccount userAccount = userAccountResource.postUserAccount(...)`            | `userAccountResource.postUserAccount`メソッドを呼び出し、データをpostに渡す。 |

このプロジェクトには依存関係として `com.liferay.headless.admin.user.client.jar` ファイルが含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

```{note}
main`メソッドのコメントは、クラスの実行を示している。
```
他のJavaクラスの例もこれと似ているが、異なる `UserAccountResource` メソッドを呼び出している。

```{important}
サービスの詳細については、 [UserAccountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/UserAccountResource.java) を参照のこと。
```
以下は、cURLとJavaを使って、他のUser RESTサービスを呼び出す例です。

## インスタンスユーザーの取得

以下のcURLとJavaのコマンドで全ユーザーのリストを取得します。

### Users_GET_FromInstance.sh

コマンド：

```bash
./Users_GET_FromInstance.sh
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/Users_GET_FromInstance.sh
   :language: bash
```

### Users_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Users_GET_FromInstance
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/Users_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

JSON レスポンスには、そのインスタンスのすべてのユーザーがリストアップされます。

## ユーザーの取得

以下のcURLとJavaコマンドで特定のユーザーを取得します。 `1234`はあなたのユーザーIDに置き換えてください。

### User_GET_ById.sh

コマンド：

```bash
./User_GET_ById.sh 1234
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_GET_ById.sh
   :language: bash
```

### User_GET_ById.java

コマンド：

```bash
java -classpath .:* -DuserId=1234 User_GET_ById
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

ユーザーはJSON レスポンスで返されます。

## ユーザーへのパッチ

以下のcURLとJavaコマンドで、既存ユーザーの部分編集を行います。 `1234`はあなたのユーザーIDに置き換えてください。

### User_PATCH_ById.sh

コマンド：

```bash
./User_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_PATCH_ById.sh
   :language: bash
```

### User_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DuserId=1234 User_PATCH_ById
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

この例では、AbleとBakerの名字がFooからBarに変わっていることに注意してください。

## ユーザーの配置

以下のcURLとJavaコマンドで、既存ユーザーを完全に上書きします。 `1234`はあなたのユーザーIDに置き換えてください。

### User_PUT_ById.sh

コマンド：

```bash
./User_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_PUT_ById.sh
   :language: bash
```

### User_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DuserId=1234 User_PUT_ById
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

なお、この例では、以前のデータがAble GooとBaker Gooに置き換えられています。

![The previous user data has been replaced with the Patch service.](./user-account-api-basics/images/03.png)

!!! tip
    `User_PATCH_ById.[java|sh]` または `User_PUT_ById.[java|sh]` を使用して、`status` フィールドを `Active` または `Inactive` に変更して、ユーザーをアクティブまたは非アクティブにすることができる。

```
ワークフローがアクティブなユーザーのステータスを変更するには、代わりに `headless-admin-workflow` API を使用する必要があります。使い方の詳細は [API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) を参照。
```

## ユーザーの削除

以下のcURLおよびJavaコマンドで既存ユーザーを削除します。 `1234`はあなたのユーザーIDに置き換えてください。

### User_DELETE_ById.sh

コマンド：

```bash
./User_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_DELETE_ById.sh
   :language: bash
```

### User_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DuserId=1234 User_DELETE_ById
```

コード：

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

ユーザー［Able Goo］と［Baker Goo］は削除されました。

## 関連トピック

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md)で、User関連のすべてのRESTサービスのリストを確認してください。

!!! note
    [PostalAddresses_GET_FromUser](./postal-address-api-basics.md#get-postal-addresses-from-user) でユーザーの郵便住所を取得する。
