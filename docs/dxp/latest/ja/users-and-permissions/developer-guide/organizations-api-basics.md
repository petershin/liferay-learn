# 組織 API の基本

アプリケーションメニューから [Create and Manage Organizations](../organizations/creating-and-managing-organizations.md) を利用できますが、Liferay の REST API を利用することもできます。 組織を管理するためにこれらのサービスを呼び出す。

## 組織の追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [Organizations API Basics](./liferay-w2h3.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-w2h3.zip -O
   ```

   ```bash
   unzip liferay-w2h3.zip
   ```

1. cURL スクリプトを使用して、インスタンスに新しい組織を追加します。 コマンドラインで `curl` フォルダに移動します。 `Organization_POST_ToInstance.sh`スクリプトを実行する。

   ```bash
   ./Organization_POST_ToInstance.sh
   ```

   JSON レスポンスは、新しい組織が追加されたことを示している：

   ```json
   {
     "comment": "",
     "customFields": [],
     "dateCreated": "2022-05-19T17:38:19Z",
     "dateModified": "2022-05-19T17:38:19Z",
     "externalReferenceCode": "",
     "id": "40922",
     "keywords": [],
     "location": {},
     "name": "Able",
     "numberOfAccounts": 0,
     "numberOfOrganizations": 0,
     "numberOfUsers": 0,
     "organizationContactInformation": {
       "emailAddresses": [],
       "postalAddresses": [],
       "telephones": [],
       "webUrls": []
     }
   }
   ```

1. *Global Menu* &rarr; _Control Panel_ &rarr; _User and Organizations_に移動します。 組織*」タブをクリックします。 新しい組織が追加されたことを確認する。

   ![See that a new organization has been added.](./organizations-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl`フォルダから`java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Organization_POST_ToInstance.java`クラスを以下のコマンドで実行する。

   ```bash
   java -classpath .:* Organization_POST_ToInstance
   ```

## cURLコマンドの検証

`Organization_POST_ToInstance.sh`スクリプトは、cURLコマンドでRESTサービスを呼び出す。

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                 | 説明                              |
| :----------------------------------------------------------------- | :------------------------------ |
| `-H "Content-Type: application/json"`                              | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                          | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/organizations"` | RESTサービスのエンドポイント                |
| `-d "{"name": "Able"}"`                                        | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                      | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を介してユーザーを認証する必要があります。 OAuth2 を使用する React アプリケーションのサンプルについては、 [Using OAuth2 to Authorize Users](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

Organization_POST_ToInstance.java` クラスは、Organization 関連サービスを呼び出して組織を追加する。

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-24
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                             | 説明                                                            |
| :--------------------------------------------------------------------------------- | :------------------------------------------------------------ |
| `OrganizationResource.Builder builder = ...`                                       | `OrganizationResource`サービスインスタンスを生成するための`Builder` を取得する。      |
| `OrganizationResource organizationResource = builder.authentication(...).build();` | 基本認証を指定し、`OrganizationResource` サービスインスタンスを生成する。              |
| `Organization organization = organizationResource.postOrganization(...);`          | `organizationResource.postOrganization`メソッドを呼び出し、データをpostに渡す。 |

このプロジェクトには依存関係として `com.liferay.headless.admin.user.client.jar` ファイルが含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

```{note}
`main`メソッドのコメントは、クラスの実行を示している。
```

他のJavaクラスの例もこれと似ているが、異なる `OrganizationResource` メソッドを呼び出している。

```{important}
サービスの詳細は [OrganizationResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/OrganizationResource.java) を参照のこと。
```

以下は、cURLとJavaを使って他の`Organization` RESTサービスを呼び出す例である。

## インスタンスから組織を取得する

以下のcURLまたはJavaコマンドを実行することで、Organizationsをリストアップできる。

### Organizations_GET_FromInstance.sh

コマンド：

```bash
./Organizations_GET_FromInstance.sh
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organizations_GET_FromInstance.sh
   :language: bash
```

### Organizations_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Organizations_GET_FromInstance
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organizations_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `Organization` オブジェクトは JSON で表示される。

## 組織を作る

以下のcURLまたはJavaコマンドで特定の組織を取得する。

```{tip}
インスタンスの ``組織`` ID を取得するには ``Organizations_GET_FromInstance.[java|sh]`` を使用します。
```

### 組織_GET_ById.sh

コマンド：

```bash
./Organization_GET_ById.sh 1234
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_GET_ById.sh
   :language: bash
```

### 組織_GET_ById.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 Organization_GET_ById
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Organization`フィールドはJSONで表示される。

## 組織にパッチを当てる

以下のcURLとJavaコマンドを使って、既存の組織を部分的に編集する。 `1234`をあなたの組織のIDに置き換えてください。

### 組織_PATCH_ById.sh

コマンド：

```bash
./Organization_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PATCH_ById.sh
   :language: bash
```

### 組織_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 Organization_PATCH_ById
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 組織を置く

以下のcURLとJavaコマンドで、既存の組織を完全に上書きする。 `1234`をあなたの組織のIDに置き換えてください。

### 組織_PUT_ById.sh

コマンド：

```bash
./Organization_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PUT_ById.sh
   :language: bash
```

### 組織_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 Organization_PUT_ById
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 組織の削除

以下のcURLコマンドとJavaコマンドを使用して、既存の組織を削除する。 `1234`をあなたの組織のIDに置き換えてください。

### 組織_DELETE_ById.sh

コマンド：

```bash
./Organization_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_DELETE_ById.sh
   :language: bash
```

### 組織_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DorganizationId=1234 Organization_DELETE_ById
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には、すべての `Organization` サービスとスキーマが表示され、各サービスを試すためのインターフェイスが用意されている。

!!! note
   [PostalAddresses_GET_FromOrganization で組織の郵便住所を取得](./postal-address-api-basics.md#get-postal-addresses-from-organization) 
