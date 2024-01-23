# 製品APIの基本

アプリケーションメニューから製品を管理することができますが、LiferayのREST APIを使用することもできます。 これらのサービスを呼び出して、製品を作成・管理します。

## 製品の追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Product API Basics](./liferay-z8v2.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-z8v2.zip -O
   ```

   ```bash
   unzip liferay-z8v2.zip
   ```

1. 製品はカタログにスコープされ、カタログIDは必須パラメータの1つである。 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Catalogs** を開きます。 商品を追加するカタログを選択し、商品名の横にあるIDをメモしてください。

   ![カタログの名前の横にある、カタログのIDをメモしてください。](./product-api-basics/images/01.png)

1. cURLスクリプトを使用して、新しい製品をカタログに追加します。 コマンドラインで、`curl`フォルダに移動します。 `Product_POST_ToCatalog.sh` スクリプトを、カタログIDをパラメータとして実行します。

   ```bash
   ./Product_POST_ToCatalog.sh 1234
   ```

   JSONレスポンスは、新しい製品が追加されたことを示しています。

   ```bash
   "actions" : {
    "get" : {
      "method" : "GET",
      "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/47738"
    },
    "update" : {
      "method" : "PATCH",
      "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/47738"
    },
    "delete" : {
      "method" : "DELETE",
      "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/47738"
    }
   },
   "active" : true,
   "catalogId" : 47734,
   "categories" : [ ],
   "createDate" : "2022-10-14T09:58:20Z",
   "customFields" : [ ],
   "description" : {
      "en_US" : ""
   },
   "displayDate" : "2022-10-14T09:58:00Z",
   "expando" : { },
   "externalReferenceCode" : "5ad0eabb-6c69-6eaf-75aa-ec4000408c66",
   "id" : 47738,
   "metaDescription" : {
      "en_US" : ""
   },
   "metaKeyword" : {
      "en_US" : ""
   },
   "metaTitle" : {
      "en_US" : ""
   },
   "modifiedDate" : "2022-10-14T09:58:20Z",
   "name" : {
      "en_US" : "Foo"
   },
   "productAccountGroupFilter" : false,
   "productChannelFilter" : false,
   "productId" : 47739,
   "productStatus" : 0,
   "productType" : "simple",
   "productTypeI18n" : "Simple",
   "shortDescription" : {
      "en_US" : ""
   },
   "skuFormatted" : "",
   "tags" : [ ],
   "thumbnail" : "/o/commerce-media/default/?groupId=47735",
   "urls" : {
      "en_US" : "foo"
   },
   "version" : 1,
   "workflowStatusInfo" : {
      "code" : 0,
      "label" : "approved",
      "label_i18n" : "Approved"
   }
   ```

1. **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Products** に移動して確認してください。 新しい製品が追加されたことを確認する。

   ![新しい製品が追加されたことを確認する。](./product-api-basics/images/02.png)

1. また、Javaクライアントを使用してThe RESTサービスを呼び出すことができます。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Product_POST_ToCatalog` クラスを実行します。 `catalogId` の値を、お使いのカタログのIDに置き換えてください。

   ```bash
   java -classpath .:* -DcatalogId=1234 Product_POST_ToCatalog
   ```

## cURLコマンドの検証

`Product_POST_ToCatalog.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_POST_ToCatalog.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                                                              | 説明                              |
|:------------------------------------------------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                                                           | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                                                       | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products"`                                                       | RESTサービスのエンドポイント                |
| `-d "{\"active\": true, \"catalogId\": \"${1}\", \"name\": {\"en_US\": \"Foo\"}, \"productType\": \"simple\"}"` | 投稿するデータ                         |
| `-u "test@liferay.com:learn"`                                                                                                   | 基本的な認証情報                        |

!!! note
   ここでは、デモのためにベーシック認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2.html) 経由でユーザーを認可する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) をご覧ください。

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Product_POST_ToCatalog.java` クラスは、商品関連サービスを呼び出して商品を追加します。

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_POST_ToCatalog.java
   :dedent: 1
   :language: java
   :lines: 11-33
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                   | 説明                                                     |
|:------------------------------------------------------------------------ |:------------------------------------------------------ |
| `ProductResource.Builder builder = ...`                                  | `ProductResource` サービスインスタンスを生成するための `Builder` を取得する。  |
| `ProductResource productResource = builder.authentication(...).build();` | Basic 認証を指定し、 `ProductResource` サービスインスタンスを生成します。      |
| `productResource.postProduct(...);`                                      | `productResource.postProduct` メソッドを呼び出し、データをpostに渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.commerce.admin.catalog.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

!!! note
   `main`メソッドのコメントでは、クラスの実行を実演しています。

他の例のJavaクラスは、これと似ていますが、異なる `ProductResource` メソッドを呼び出します。

!!! important
   サービスの詳細は [ProductResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/ProductResource.java) を参照ください。

以下は、cURL と Java を使用して、他の `Product` REST サービスを呼び出す例です。

## インスタンスから製品を取得する

以下のcURLまたはJavaコマンドを実行することで、Liferayインスタンスの全製品を一覧表示することができます。

### Products_GET_FromInstance.sh

コマンド:

```bash
./Products_GET_FromInstance.sh
```

コード:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Products_GET_FromInstance.sh
   :language: bash
```

### Products_GET_FromInstance.java

コマンド:

```bash
java -classpath .:* Products_GET_FromInstance
```

コード:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Products_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

Liferay インスタンスの `Product` オブジェクトが JSON でリストアップされます。

このAPIでは、商品のフィルタリング、ページ送り、検索、ソートを行うためのパラメータも受け付ける。 詳しくは、 [`getProductsPage`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/ProductResource.java#L43-L46) メソッドをご覧ください。 クエリでは、以下のProductフィールドを使用して、結果のフィルタリング、検索、並べ替えを行うことができます。

- categoryIds
- channelId
- statusCode
- customFields
- createDate
- modifiedDate
- catalogId
- name
- productType

| フィルタークエリ                            | 説明                             |
|:----------------------------------- |:------------------------------ |
| productType eq 'simple'             | 製品タイプ＝シンプル                     |
| contains(name, 'Bar')               | 製品名にはBarを含む                    |
| customFields/sampleSize eq '100.0'. | sampleSizeというカスタムフィールドは100に等しい |

| ソートクエリ                     | 説明                                      |
|:-------------------------- |:--------------------------------------- |
| createDate:desc              | createDateの降順でソートします。                   |
| name:asc                      | 名前の昇順で並べ替える                             |
| createDate:desc,name:desc | 最初にcreateDateの降順でソートし、次にnameの降順でソートします。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/api-query-parameters.html) をお読みください。

## 製品を入手する

以下のcURLまたはJavaコマンドで、特定の製品を取得します。 `1234` を製品のIDに置き換えてください。

```{tip}
``Products_GET_FromInstance.[java|sh]`` を使用して、すべての製品のリストを取得し、特に必要な製品の `productId` をメモしてください。
```

### Product_GET_ById.sh

コマンド:

```bash
./Product_GET_ById.sh 1234
```

コード:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_GET_ById.sh
   :language: bash
```

### Product_GET_ById.java

コマンド:

```bash
java -classpath .:* -DproductId=1234 Product_GET_ById
```

コード:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Product` フィールドはJSONで記載されています。

## 製品にパッチを貼る

以下のcURLとJavaのコマンドで、既存の製品を更新します。 `1234` をお使いの製品のIDに置き換えてください。

### Product_PATCH_ById.sh

コマンド:

```bash
./Product_PATCH_ById.sh 1234
```

コード:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_PATCH_ById.sh
   :language: bash
```

### Product_PATCH_ById.java

コマンド:

```bash
java -classpath .:* -DproductId=1234 Product_PATCH_ById
```

コード:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## 製品を削除する

以下のcURLとJavaのコマンドで、既存の製品を削除します。 `1234` をお使いの製品のIDに置き換えてください。

### Product_DELETE_ById.sh

コマンド:

```bash
./Product_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/curl/Product_DELETE_ById.sh
   :language: bash
```

### Product_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DproductId=1234 Product_DELETE_ById
```

コード：

```{literalinclude} ./product-api-basics/resources/liferay-z8v2.zip/java/Product_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html) には、 `Product` の全サービスとスキーマがリストアップされており、各サービスを試用するためのインターフェイスが用意されています。