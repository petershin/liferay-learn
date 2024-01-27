# 住所APIの基本

{bdg-secondary}`liferay DXP/Portal 7.4+`.

Liferay の REST API を使用して郵便住所を管理します。

## アカウントに住所を追加する

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [Postal Address API Basics](./liferay-n8y7.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-n8y7.zip -O
   ```

   ```bash
   unzip liferay-n8y7.zip
   ```

1. アカウントのリストを取得するには、 [Accounts_GET_FromInstance](./accounts-api-basics.md#get-accounts-from-instance) を使用します。 住所を追加するアカウントのIDをメモしてください。 また、_Global Menu_ &rarr; _Control Panel_ &rarr; _Accounts_ に移動してアカウントのリストを見ることもできます。

1. cURLスクリプトを使用して、選択したアカウントに新しい住所を追加します。 コマンドラインで `curl` フォルダに移動します。 `PostalAddress_POST_ToAccount.sh`スクリプトを実行する。 `1234`をアカウントIDに置き換える。

   ```bash
   ./PostalAddress_POST_ToAccount.sh 1234
   ```

   JSONレスポンスは、新しい住所が追加されたことを示しています：

   ```json
    {
      "addressCountry" : "United States",
      "addressLocality" : "Diamond Bar",
      "addressRegion" : "California",
      "addressType" : "shipping",
      "id" : 35706,
      "name" : "Able Address",
      "postalCode" : "12345",
      "primary" : false,
      "streetAddressLine1" : "123 Foo St",
      "streetAddressLine2" : "",
      "streetAddressLine3" : ""
    }
   ```

1. *Global Menu* &rarr; _Control Panel_ &rarr; _Accounts_ に移動します。 ステップ2で選択したアカウントを選択し、_Addresses_に移動します。 アカウントに新しい住所が追加されていることを確認してください。

   ![See that a new postal address has been added.](./postal-address-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl`フォルダから`java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. PostalAddress_POST_ToAccount.java`クラスを実行する。 1234`をアカウントIDに置き換える。

   ```bash
   java -classpath .:* -DaccountId=1234 PostalAddress_POST_ToAccount
   ```

## cURLコマンドの検証

`PostalAddress_POST_ToAccount.sh`スクリプトはcURLコマンドでRESTサービスを呼び出す。

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_POST_ToAccount.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                                                                                                                                                                                                                                                    | 説明                              |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------ |
| `-H "Content-Type: application/json"`                                                                                                                                                                                                                                                                                                 | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                                                                                                                                                                                                                                                             | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/postal-addresses"`                                                                                                                                                                                                                                                   | RESTサービスのエンドポイント                |
| `-d "{\"addressCountry\": \"United States\", \"addressLocality\": \"Diamond Bar\", \"addressRegion\": \"California\", \"addressType\": \"shipping\", \"name\": \"Able Address\", \"postalCode\": \"12345\", \"primary\": false, \"streetAddressLine1\": \"123 Foo St\", \"streetAddressLine2\": \"\", \"streetAddressLine3\": \"\"}"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                                                                                                                                                                                                                                                                         | 基本的な認証情報                        |

!!! note
    ここでは、デモのためにBasic認証を使用している。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を介してユーザーを認証する必要があります。 OAuth2 を使用する React アプリケーションのサンプルについては、 [Using OAuth2 to Authorize Users](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

PostalAddress_POST_ToAccount.java`クラスは、郵便住所関連サービスを呼び出して郵便住所を追加する。

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_POST_Account.java
   :dedent: 1
   :language: java
   :lines: 9-35
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                               | 説明                                                                     |
| :----------------------------------------------------------------------------------- | :--------------------------------------------------------------------- |
| `PostalAddress.Builder builder = ...`                                                | `PostalAddressResource`サービスインスタンスを生成するための`Builder` を取得する。              |
| `PostalAddressResource postalAddressResource = builder.authentication(...).build();` | 基本認証を指定し、`PostalAddressResource` サービスインスタンスを生成する。                      |
| `PostalAddress postalAddress = postalAddressResource.postAccountPostalAddress(...);` | `postalAddressResource.postAccountPostalAddress`メソッドを呼び出し、データをpostに渡す。 |

このプロジェクトには依存関係として `com.liferay.headless.admin.user.client.jar` ファイルが含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

!!! note
    `main`メソッドのコメントは、クラスの実行を示している。

他のJavaクラスの例もこれと似ているが、異なる `PostalAddressResource` メソッドを呼び出している。

!!! important
サービスの詳細は [PostalAddressResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/PostalAddressResource.java) を参照のこと。

以下は、cURLとJavaを使って他の`PostalAddress` RESTサービスを呼び出す例である。

## アカウントから住所を取得する

以下のcURLまたはJavaコマンドを使用して、アカウントから郵便住所のリストを取得する。 1234`をアカウントIDに置き換える。

### PostalAddresses_GET_FromAccount.sh

コマンド：

```bash
./PostalAddresses_GET_FromAccount.sh 1234
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddresses_GET_FromAccount.sh
   :language: bash
```

### PostalAddresses_GET_FromAccount.java

コマンド：

```bash
java -classpath .:* -DaccountId=1234 PostalAddresses_GET_FromAccount
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddresses_GET_FromAccount.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

アカウントの郵便住所はJSONレスポンスで返される。

## 組織から住所を取得する

以下のcURLまたはJavaコマンドを使って、ある組織から郵便住所のリストを取得する。 `1234`を組織のIDに置き換えてください。

### PostalAddresses_GET_FromOrganization.sh

コマンド：

```bash
./PostalAddresses_GET_FromOrganization.sh 1234
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddresses_GET_FromOrganization.sh
   :language: bash
```

### PostalAddresses_GET_FromOrganization.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 PostalAddresses_GET_FromOrganization
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddresses_GET_FromOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

組織の郵便住所がJSONレスポンスで返される。

## ユーザーから住所を取得する

以下のcURLまたはJavaコマンドで、ユーザーから郵便住所のリストを取得する。 `1234`をユーザーIDに置き換える。

### PostalAddresses_GET_FromUser.sh

コマンド：

```bash
./PostalAddresses_GET_FromUser.sh 1234
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddresses_GET_FromUser.sh
   :language: bash
```

### PostalAddresses_GET_FromUser.java

コマンド：

```bash
java -classpath .:* -DuserAccountId=1234 PostalAddresses_GET_FromUser
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddresses_GET_FromUser.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

ユーザーの住所はJSONレスポンスで返される。

## 住所の取得

以下のcURLまたはJavaコマンドで特定の郵便住所を取得する。 1234`を郵便住所のIDに置き換える。

!!! tip
    ``PostalAddress_GET_FromAccount.[java|sh]`` を使用して、アカウントの `郵便住所` ID を取得します。

    組織の郵便番号IDを取得するには ``PostalAddress_GET_FromOrganization.[java|sh]`` を使用してください。

    ユーザーの ``郵便住所`` ID を取得するには ``PostalAddress_GET_FromUser.[java|sh]`` を使用してください。

### PostalAddress_GET_ById.sh

コマンド：

```bash
./PostalAddress_GET_ById.sh 1234
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_GET_ById.sh
   :language: bash
```

### PostalAddress_GET_ById.java

コマンド：

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_GET_ById
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

郵便番号はJSONレスポンスで返される。

## 住所をパッチする

以下のcURLまたはJavaコマンドを使って、既存の郵便住所を部分的に編集する。 `1234`を郵便住所のIDに置き換える。

### PostalAddress_PATCH_ById.sh

コマンド：

```bash
./PostalAddress_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_PATCH_ById.sh.sh
   :language: bash
```

### PostalAddress_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_PATCH_ById
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_PATCH_ById.sh.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 住所を記入する

以下のcURLまたはJavaコマンドで、既存の郵便住所を完全に上書きする。 `1234`を郵便住所のIDに置き換える。

### PostalAddress_PUT_ById.sh

コマンド：

```bash
./PostalAddress_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_PUT_ById.sh.sh
   :language: bash
```

### PostalAddress_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_PUT_ById
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_PUT_ById.sh.java
   :dedent: 1
   :language: java
   :lines: 9-34
```

## 住所を削除する

以下のcURLまたはJavaコマンドを使用して、既存の郵便住所を削除する。 `1234`を郵便住所のIDに置き換える。

### PostalAddress_DELETE_ById.sh

コマンド：

```bash
./PostalAddress_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/curl/PostalAddress_DELETE_ById.sh.sh
   :language: bash
```

### PostalAddress_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DpostalAddressId=1234 PostalAddress_DELETE_ById
```

コード：

```{literalinclude} ./postal-address-api-basics/resources/liferay-n8y7.zip/java/PostalAddress_DELETE_ById.sh.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) はすべての `PostalAddress` サービスとスキーマを表示し、各サービスを試すためのインターフェイスを持っています。
