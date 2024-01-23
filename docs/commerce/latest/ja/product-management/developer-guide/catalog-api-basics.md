# カタログAPIの基礎知識

アプリケーションメニューやREST APIからカタログを管理することができます。 [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) サービスを呼び出して、カタログを作成・管理します。

## カタログを追加する

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら。

1. Catalog API Basics](./liferay-q2v8.zip)をダウンロードし、解凍する。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-q2v8.zip -O
   ```

   ```bash
   unzip liferay-q2v8.zip
   ```

1. カタログはインスタンスにスコープされます。 cURLスクリプトを使用して、新しいカタログを追加します。 コマンドラインで、 `curl` フォルダに移動します。 `Catalog_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Catalog_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しいカタログが追加されたことが示されています。

   ```bash
   {
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/46110"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/46110"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/46110"
         }
      },
      "currencyCode" : "USD",
      "defaultLanguageId" : "en_US",
      "externalReferenceCode" : "246ad89e-8da1-546c-0d62-06ac7061e1da",
      "id" : 46110,
      "name" : "Able",
      "system" : false
   }
   ```

1. カタログの追加を確認するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Catalogs** に移動してください。 新しいカタログが表示されます。

   ![カタログが追加されたことを確認する。](./catalog-api-basics/images/01.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Catalog_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* Catalog_POST_ToInstance
   ```

## cURLコマンドの検証

`Catalog_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                                   | 説明                                 |
|:---------------------------------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                                | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                                            | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalogs"`                            | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"currencyCode\": \"USD\", \"defaultLanguageId\": \"en_US\", \"name\": \"Able\"}"` | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                                        | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2.html) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Catalog_POST_ToInstance.java` クラスは、 `CatalogResource` サービスを呼び出してカタログを追加します。

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                   | 説明                                                     |
|:------------------------------------------------------------------------ |:------------------------------------------------------ |
| `CatalogResource.Builder builder = ...`                                  | `CatalogResource` サービスインスタンスを生成するための `Builder` を取得する。  |
| `CatalogResource catalogResource = builder.authentication(...).build();` | 基本認証を使用し、 `CatalogResource` サービスインスタンスを生成します。          |
| `catalogResource.postCatalog(...);`                                      | `catalogResource.postCatalog` メソッドを呼び出し、postにデータを渡します。 |

このプロジェクトには、依存関係として `com.liferay.headless.commerce.admin.catalog.client.jar` ファイルが含まれています。 すべてのRESTアプリケーションのクライアントJARの依存情報は、`/o/api` (例: <http://localhost:8080/o/api>) にあるインストール先のAPIエクスプローラーで見つけることができます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプルJavaクラスは、異なる `CatalogResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [CatalogResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/CatalogResource.java) を参照してください。
```

以下は、cURLとJavaを使用して、他の `Catalog` RESTサービスを呼び出す例です。

## インスタンスからカタログを取得する

cURLまたはJavaコマンドで、Liferayインスタンスのすべてのカタログをリストアップします。

### Catalogs_GET_FromInstance.sh

コマンド：

```bash
./Catalogs_GET_FromInstance.sh
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalogs_GET_FromInstance.sh
   :language: bash
```

### Catalogs_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Catalogs_GET_FromInstance
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalogs_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `カタログ` オブジェクトはJSONでフォーマットされています。

### カタログのフィルタリング、ページ分割、検索、ソート

このAPIでは、カタログのフィルタリング、ページ分割、検索、ソートなどのパラメータも受け付けます。 詳しくは、 [`getCatalogsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/CatalogResource.java#L93-#L96) メソッドをご覧ください。 `名前` フィールドを使用して、結果をフィルタリング、検索、ソートすることができます。

| フィルタークエリ         | 説明                      |
|:---------------- |:----------------------- |
| `name eq 'Able'` | カタログ名はAbleと同じでなければならない。 |
|                  |                         |

| ソートクエリ      | 説明          |
|:----------- |:----------- |
| `name:desc` | 名前の降順で並べます。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/api-query-parameters.html) をご参照ください。

## カタログを見る

cURL または Java `get` コマンドで特定のカタログを取得します。 `1234` をカタログのIDに置き換えてください。

```{tip}
Catalogs_GET_FromInstance.[java|sh]`を使用して、すべてのカタログのリストを取得し、特に欲しいカタログの `id` をメモします。
```

### Catalog_GET_ById.sh

コマンド：

```bash
./Catalog_GET_ById.sh 1234
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_GET_ById.sh
   :language: bash
```

### Catalog_GET_ById.java

コマンド：

```bash
java -classpath .:* -DcatalogId=1234 Catalog_GET_ById
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`カタログ` のフィールドをJSONで表示します。

## カタログを貼る

cURLとJava `patch` コマンドで既存のカタログを更新します。 `1234` をカタログのIDに置き換えてください。

### Catalog_PATCH_ById.sh

コマンド：

```bash
./Catalog_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_PATCH_ById.sh
   :language: bash
```

### Catalog_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DcatalogId=1234 Catalog_PATCH_ById
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## カタログを削除する

cURL と Java `delete` コマンドで既存のカタログを削除します。 `1234` をカタログのIDに置き換えてください。

### Catalog_DELETE_ById.sh

コマンド：

```bash
./Catalog_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/curl/Catalog_DELETE_ById.sh
   :language: bash
```

### Catalog_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DcatalogId=1234 Catalog_DELETE_ById
```

コード：

```{literalinclude} ./catalog-api-basics/resources/liferay-q2v8.zip/java/Catalog_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html) では、 `Catalog` のサービスやスキーマが表示され、各サービスをテストするためのインターフェイスが用意されています。
