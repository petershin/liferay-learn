# 組織APIの基本

アプリケーションメニューから [Create and Manage Organizations](../organizations/creating-and-managing-organizations.md) を利用できますが、Liferay の REST API を利用することも可能です。 これらのサービスを呼び出して、組織を管理します。

## 組織を追加する

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Organizations API Basics](./liferay-w2h3.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/users-and-permissions/developer-guide/liferay-w2h3.zip -O
   ```

   ```bash
   unzip liferay-w2h3.zip
   ```

1. cURL スクリプトを使用して、インスタンスに新しい組織を追加します。 コマンドラインで、 `curl` フォルダに移動します。 `Organization_POST_ToInstance.sh` スクリプトを実行します。

   ```bash
   ./Organization_POST_ToInstance.sh
   ```

   JSONレスポンスに、新しい組織が追加されたことが表示されます。

   ```bash
   "comment" : "",
   "customFields" : [ ],
   "dateCreated" : "2022-05-19T17:38:19Z",
   "dateModified" : "2022-05-19T17:38:19Z",
   "externalReferenceCode" : "",
   "id" : "40922",
   "keywords" : [ ],
   "location" : { },
   "name" : "Able",
   "numberOfAccounts" : 0,
   "numberOfOrganizations" : 0,
   "numberOfUsers" : 0,
   "organizationContactInformation" : {
      "emailAddresses" : [ ],
      "postalAddresses" : [ ],
      "telephones" : [ ],
      "webUrls" : [ ]

   ```

1. **Global Menu** &rarr; **Control Panel** &rarr; **User and Organizations** に移動します。 ［**Organizations**］ タブをクリックします。 新しい組織が追加されたことを確認します。

   ![新しい組織が追加されたことを確認します。](./organizations-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Organization_POST_ToInstance.java` クラスを次のコマンドで実行します。

   ```bash
   java -classpath .:* Organization_POST_ToInstance
   ```

## cURLコマンドの検証

`Organization_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                 | 説明                              |
|:------------------------------------------------------------------ |:------------------------------- |
| `-H "Content-Type: application/json"`                              | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                          | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/organizations"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Able\"}"`                                    | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                      | 基本的な認証情報                        |

```{note}
ここでは、デモのためにベーシック認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Organization_POST_ToInstance.java` クラスは、Organization 関連サービスを呼び出して、組織を追加します。

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-24
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                             | 説明                                                              |
|:---------------------------------------------------------------------------------- |:--------------------------------------------------------------- |
| `OrganizationResource.Builder builder = ...`                                       | `OrganizationResource` サービスインスタンスを生成するための `Builder` を取得する。      |
| `OrganizationResource organizationResource = builder.authentication(...).build();` | Basic 認証を指定し、 `OrganizationResource` サービスインスタンスを生成します。          |
| `Organization organization = organizationResource.postOrganization(...);`          | `organizationResource.postOrganization` メソッドを呼び出し、post にデータを渡す。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.user.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスは、これと似ていますが、異なる `OrganizationResource` メソッドを呼び出します。

```{important}
サービスの詳細は [OrganizationResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/OrganizationResource.java) を参照ください。
```

以下は、cURL と Java を使用して、他の `Organization` REST サービスを呼び出す例です。

## インスタンスから組織を取得する

以下のcURLまたはJavaコマンドを実行することで、Organizationを一覧表示することができます。

### Organizations_GET_FromInstance.sh

コマンド:

```bash
./Organizations_GET_FromInstance.sh
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organizations_GET_FromInstance.sh
   :language: bash
```

### Organizations_GET_FromInstance.java

コマンド:

```bash
java -classpath .:* Organizations_GET_FromInstance
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organizations_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

Instance の `Organization` オブジェクトは、JSON で表示されます。

## 組織を持つ

以下のcURLまたはJavaコマンドで、特定のOrganizationを取得します。

```{tip}
インスタンスの ``Organization`` ID を取得するには、 ``Organizations_GET_FromInstance.[java|sh]`` を使用します。
```

### Organization_GET_ById.sh

コマンド:

```bash
./Organization_GET_ById.sh 1234
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_GET_ById.sh
   :language: bash
```

### Organization_GET_ById.java

コマンド:

```bash
java -classpath .:* -DorganizationId=1234 Organization_GET_ById
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`組織` フィールドはJSONで表示されます。

## 組織のパッチ

以下のcURLとJavaコマンドで、既存の組織の部分編集を行います。 `1234` を組織IDに置き換えてください。

### 組織名_PATCH_ById.sh

コマンド:

```bash
./Organization_PATCH_ById.sh 1234
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PATCH_ById.sh
   :language: bash
```

### Organization_PATCH_ById.java

コマンド:

```bash
java -classpath .:* -DorganizationId=1234 Organization_PATCH_ById
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 組織を置く

以下のcURLとJavaのコマンドで、既存のOrganizationを完全に上書きします。 `1234` を組織IDに置き換えてください。

### 組織名_PUT_ById.sh

コマンド:

```bash
./Organization_PUT_ById.sh 1234
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PUT_ById.sh
   :language: bash
```

### Organization_PUT_ById.java

コマンド:

```bash
java -classpath .:* -DorganizationId=1234 Organization_PUT_ById
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 組織を削除する

以下のcURLとJavaのコマンドで、既存の組織を削除します。 `1234` を組織IDに置き換えてください。

### 組織名_DELETE_ById.sh

コマンド:

```bash
./Organization_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_DELETE_ById.sh
   :language: bash
```

### Organization_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DorganizationId=1234 Organization_DELETE_ById
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には、 `Organization` のすべてのサービスとスキーマが表示され、各サービスを試用できるインターフェイスを備えています。
