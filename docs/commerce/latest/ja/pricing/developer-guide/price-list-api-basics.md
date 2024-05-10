# 価格表APIの基本

アプリケーションメニューやREST APIで価格表を管理することができます。 [headless-admin-commerce-pricing](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/openapi.json) サービスに電話し、価格表を作成・管理します。

## 価格表の追加

```{include} /_snippets/run-liferay-dxp.md
```

Liferayの実行後、

1. Download and unzip [Price List API Basics](./liferay-c2v4.zip) .

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/pricing/developer-guide/liferay-c2v4.zip -O
   ```

   ```bash
   unzip liferay-c2v4.zip
   ```

1. 価格表はカタログにスコープされているので、作成するにはカタログIDが必要です。

   カタログの ID を取得するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Catalogs** に進みます。 カタログを選択し、そのIDをコピーする。

   ![カタログIDをコピーする。](./price-list-api-basics/images/01.png)

1. cURLスクリプトを使用して、新しい価格表をカタログに追加します。 コマンドラインで、`curl`フォルダに移動します。 `PriceList_POST_ToCatalog.sh` スクリプトを、適切なカタログIDの値をパラメータとして実行します。

   ```bash
   ./PriceList_POST_ToCatalog.sh 1234
   ```

   JSONレスポンスに、新しい価格表が追加されたことが示されています。

   ```bash
   {
      "actions" : {
         "permissions" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "get" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "update" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "delete" : {
         "method" : "DELETE",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         }
      },
      "active" : true,
      "author" : "Test Test",
      "catalogBasePriceList" : false,
      "catalogId" : 1234,
      "catalogName" : "Master",
      "createDate" : "2023-01-04T12:41:03Z",
      "currencyCode" : "USD",
      "customFields" : { },
      "displayDate" : "2023-01-04T12:41:00Z",
      "externalReferenceCode" : "b314f22b-72ff-c47c-4fb6-c34539257821",
      "id" : 46002,
      "name" : "Able",
      "netPrice" : true,
      "parentPriceListId" : 0,
      "priority" : 0.0,
      "type" : "price-list",
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. 価格表の追加を確認するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Price Lists** に移動してください。 新しい価格表が表示されます。

   ![新しい価格表が追加されたことを確認する。](./price-list-api-basics/images/02.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java` フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `PriceList_POST_ToCatalog` クラスを実行し、 `catalogId` を適切な値に置き換えてください。

   ```bash
   java -classpath .:* -DcatalogId=1234 PriceList_POST_ToCatalog
   ```

## cURLコマンドの検証

`PriceList_POST_ToCatalog.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_POST_ToCatalog.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                                                  | 説明                                 |
|:------------------------------------------------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                                               | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                                                           | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists"`                                        | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"catalogId\": ${1}, \"currencyCode\": \"USD\", \"name\": \"Able\", \"type\": \"price-list\"}"` | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                                                       | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を使ったReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`PriceList_POST_ToCatalog.java` クラスは、 `PriceListResource` サービスを呼び出して価格リストを追加します。

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_POST_ToCatalog.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                       | 説明                                                          |
|:---------------------------------------------------------------------------- |:----------------------------------------------------------- |
| `PriceListResource.Builder builder = ...`                                    | `PriceListResource` サービスインスタンスを生成するための `Builder` を取得する。     |
| `PriceListResource priceListResource = builder.authentication(...).build();` | Basic 認証を使用し、 `PriceListResource` サービスインスタンスを生成します。         |
| `priceListResource.postPriceList(...);`                                      | `priceListResource.postPriceList` メソッドを呼び出し、postするデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.commerce.admin.pricing.client.jar`ファイルが含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR の依存情報は、インストール先の API Explorer で `/o/api` (例: <http://localhost:8080/o/api>) に見つけることができます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプルJavaクラスは、異なる `PriceListResource` メソッドを呼び出します。

```{important}
サービスの詳細は [PriceListResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless-commerce/headless-admin-pricing-client/src/main/java/com/liferay/headless/commerce/admin/pricing/client/resource/v2_0/PriceListResource.java) を参照ください。
```

以下は、cURL と Java を使用して、他の `PriceList` REST サービスを呼び出す例です。

## インスタンスから価格表を取得する

cURL または Java コマンドで、Liferay インスタンスのすべての価格リストをリストアップします。

### PriceLists_GET_FromInstance.sh

コマンド:

```bash
./PriceLists_GET_FromInstance.sh
```

コード:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceLists_GET_FromInstance.sh
   :language: bash
```

### PriceLists_GET_FromInstance.java

コマンド:

```bash
java -classpath .:* PriceLists_GET_FromInstance
```

コード:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceLists_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `PriceList` オブジェクトは、JSON でフォーマットされています。

### 価格表のフィルタリング、ページ送り、検索、ソート

このAPIでは、価格表のフィルタリング、ページ分割、検索、ソートなどのパラメータも受け付ける。 詳しくは、 [`getPriceListsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-pricing-client/src/main/java/com/liferay/headless/commerce/admin/pricing/client/resource/v2_0/PriceListResource.java#L43-#L46) メソッドをご覧ください。 以下の `PriceList` のフィールドを使用して、結果のフィルタリング、検索、ソートを行います。

* アカウントID
* accountGroupId
* catalogId
* channelId
* orderTypeId
* name
* カタログベースプライスリスト
* 種類
* createDate

| フィルタークエリ                                         | 説明                                                                              |
|:------------------------------------------------ |:------------------------------------------------------------------------------- |
| `name eq 'Able'`                                 | 価格表名はAbleと同じでなければならない。                                                          |
| `createDate gt 2022-12-31T12:00:00Z`             | 価格表の作成日は、2022年12月31日12:00:00より大きいことが必要です。                                       |
| `catalogId/any(x:(x eq 43956) and (x eq 43199))` | カタログ43956と43199に関連する価格表と一致する。 `any` という用語は、後続の式の少なくとも1つが `true`を返す必要があることを意味する。 |

`accountId`, `accountGroupId`, `catalogId`, `channelId`, and `orderTypeId` filter フィールドはコレクションフィールドである。 コレクションフィールドによるフィルタリングは、上表の3行目に示すように行う必要があります。

| ソートクエリ                      | 説明                                      |
|:--------------------------- |:--------------------------------------- |
| `createDate:desc`           | createDateの降順でソートします。                   |
| `createDate:desc,type:desc` | 最初にcreateDateの降順でソートし、次にtypeの降順でソートします。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) をご参照ください。

## 価格表を見る

cURL または Java `get` コマンドで特定の価格表を取得します。 `1234` を価格表のIDに置き換えてください。

```{tip}
価格リストのリストを取得するには `PriceLists_GET_FromInstance.[java|sh]` を使用し、特に必要な価格リストの `id` をメモしてください。
```

### PriceList_GET_ById.sh

コマンド：

```bash
./PriceList_GET_ById.sh 1234
```

コード：

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_GET_ById.sh
   :language: bash
```

### PriceList_GET_ById.java

コマンド:

```bash
java -classpath .:* -DpriceListId=1234 PriceList_GET_ById
```

コード:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`PriceList` のフィールドをJSONで列挙する。

## 価格表の貼り付け

cURL と Java `パッチ` コマンドで、既存の価格表を更新します。 `1234` を価格表のIDに置き換えてください。

### PriceList_PATCH_ById.sh

コマンド：

```bash
./PriceList_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_PATCH_ById.sh
   :language: bash
```

### PriceList_PATCH_ById.java

コマンド:

```bash
java -classpath .:* -DpriceListId=1234 PriceList_PATCH_ById
```

コード:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## 価格表を削除する

cURL と Java `delete` コマンドで、既存の価格表を削除することができます。 `1234` を価格表のIDに置き換えてください。

### PriceList_DELETE_ById.sh

コマンド:

```bash
./PriceList_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_DELETE_ById.sh
   :language: bash
```

### PriceList_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DpriceListId=1234 PriceList_DELETE_ById
```

コード:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) では、 `PriceList` のサービスとスキーマが表示され、各サービスをテストするためのインターフェイスを備えています。
