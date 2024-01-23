# Order Type API 基本編

注文タイプの管理は、 [アプリケーションメニュー](../order-types/using-order-types.md) から、または REST API で行うことができます。 [headless-admin-commerce-order](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-order/v1.0/openapi.json) から `/order-types` のエンドポイントを使用して、注文タイプを作成および管理します。

## オーダータイプを追加する

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら、

1. Order Type API Basics](./liferay-t5n8.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/order-management/developer-guide/liferay-t5n8.zip -O
   ```

   ```bash
   unzip liferay-t5n8.zip
   ```

1. オーダータイプはインスタンスにスコープされ、作成には `名` が必要です。

   cURLスクリプトを使用して、注文タイプを追加します。 コマンドラインで、 `curl`フォルダに移動します。 `OrderType_POST_ToInstance.sh` スクリプトを実行します。

   ```bash
   ./OrderType_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しく追加された注文タイプが表示されます：

   ```json
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:9090/o/headless-commerce-admin-order/v1.0/order-types/48698"
         }
      },
      "active" : false,
      "customFields" : { },
      "description" : { },
      "displayDate" : "2023-03-23T16:30:00Z",
      "displayOrder" : 0,
      "externalReferenceCode" : "fd8fbd90-0f19-0d4d-46db-c7807f3660ce",
      "id" : 48698,
      "name" : {
         "en_US" : "Foo"
      },
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) &rarr; **Commerce** &rarr; **Order Types** に移動します。 新しく追加された注文タイプが表示されます。

   ![注文種別の追加を確認する。](./order-type-api-basics/images/01.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `OrderType_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* OrderType_POST_ToInstance
   ```

## cURLコマンドの検証

`OrderType_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                         | 説明                                 |
|:-------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                      | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                  | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-order/v1.0/order-types"` | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"name\": {\"en_US\": \"Foo\"}}"`                              | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                              | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/ja/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/ja/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`OrderType_POST_ToInstance.java` クラスは、 `OrderTypeResource` サービスを呼び出して注文タイプを追加します。

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                       | 説明                                                         |
|:---------------------------------------------------------------------------- |:---------------------------------------------------------- |
| `OrderTypeResource.Builder builder = ...`                                    | `OrderTypeResource` サービスインスタンスを生成するための `Builder` を取得する。    |
| `OrderTypeResource orderTypeResource = builder.authentication(...).build();` | 基本認証を使用し、 `OrderTypeResource` サービスインスタンスを生成します。            |
| `orderTypeResource.postOrderType(...);`                                      | `orderTypeResource.postOrderType` メソッドを呼び出し、postにデータを渡します。 |

このプロジェクトには、依存関係として`com.liferay.headless.commerce.admin.order.client.jar` ファイルが含まれています。 すべてのRESTアプリケーションのクライアントJARの依存情報は、`/o/api` (例: <http://localhost:8080/o/api>) にあるインストール先のAPIエクスプローラーで見つけることができます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプルJavaクラスは、異なる `OrderTypeResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [OrderTypeResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderTypeResource.java) を参照ください。
```

以下は、cURL と Java を使用して他の `OrderType` REST サービスを呼び出す例です。

## インスタンスから注文タイプを取得する

LiferayインスタンスからcURLやJavaのコマンドで全ての注文タイプをリストアップできます。

### OrderTypes_GET_FromInstance.sh

コマンド：

```bash
./OrderTypes_GET_FromInstance.sh
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderTypes_GET_FromInstance.sh
   :language: bash
```

### OrderTypes_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* OrderTypes_GET_FromInstance
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderTypes_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-19
```

インスタンスの `OrderType` オブジェクトがJSONで表示されます。

### ページ分割、検索、並び替え オーダータイプ

返されたオーダータイプのページ分割、検索、並べ替えが可能です。 詳しくは、 [`getOrderTypesPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderTypeResource.java#L50-L53) メソッドをご参照ください。 検索や並べ替えには、 `名前` フィールドを使用します：

| ソートクエリ      | 説明             |
|:----------- |:-------------- |
| `name:desc` | `名前` で降順に並びます。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/api-query-parameters.html) をご参照ください。

## オーダータイプを取得する

cURL と Java `get` コマンドで、特定の注文タイプを取得します。 `1234` を注文種別のIDに置き換えてください。

```{tip}
`OrderTypes_GET_FromInstance.[java|sh]`を使用して、すべてのオーダータイプのリストを取得し、特に欲しいオーダータイプの `id` をメモします。
```

### OrderType_GET_ById.sh

コマンド：

```bash
./OrderType_GET_ById.sh 1234
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_GET_ById.sh
   :language: bash
```

### OrderType_GET_ById.java

コマンド：

```bash
java -classpath .:* -DorderTypeId=1234 OrderType_GET_ById
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`OrderType` フィールドはJSONでフォーマットされています。

## オーダータイプをパッチする

cURLとJavaの `パッチ` コマンドで既存の注文タイプを更新します。 `1234` を注文種別のIDに置き換えてください。

### OrderType_PATCH_ById.sh

コマンド：

```bash
./OrderType_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_PATCH_ById.sh
   :language: bash
```

### OrderType_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DorderTypeId=1234 OrderType_PATCH_ById
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## オーダータイプを削除する

cURL および Java の `delete` コマンドで、既存の注文タイプを削除することができます。 `1234` を注文種別のIDに置き換えてください。

### OrderType_DELETE_ById.sh

コマンド：

```bash
./OrderType_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/curl/OrderType_DELETE_ById.sh
   :language: bash
```

### OrderType_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DorderTypeId=1234 OrderType_DELETE_ById
```

コード：

```{literalinclude} ./order-type-api-basics/resources/liferay-t5n8.zip/java/OrderType_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html) では、 `OrderType` のサービスとスキーマを表示し、各サービスをテストするためのインターフェイスを備えています。
