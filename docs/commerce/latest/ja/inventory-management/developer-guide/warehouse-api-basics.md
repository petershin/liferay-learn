# Warehouse API の基礎知識

アプリケーションメニューやREST APIから倉庫を管理することができます。 [headless-commerce-admin-inventory](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/openapi.json) サービスを呼び出して、倉庫を作成・管理します。

## 倉庫の追加

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら。

1. Warehouse API Basics](./liferay-v9s5.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/inventory-management/developer-guide/liferay-v9s5.zip -O
   ```

   ```bash
   unzip liferay-v9s5.zip
   ```

1. ウェアハウスはインスタンスにスコープされる。 cURLスクリプトを使用して、新しい倉庫を追加します。 コマンドラインで、 `curl` フォルダに移動します。 `Warehouse_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Warehouse_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しい倉庫が追加されたことが示されています。

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/46429"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/46429"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/46429"
         }
      },
      "active" : false,
      "city" : "",
      "countryISOCode" : "",
      "description" : { },
      "externalReferenceCode" : "c441eb70-dcd4-e040-92e5-eae0727cc958",
      "id" : 46429,
      "latitude" : 0.0,
      "longitude" : 0.0,
      "name" : {
         "en_US" : "Foo"
      },
      "regionISOCode" : "",
      "street1" : "",
      "street2" : "",
      "street3" : "",
      "type" : "",
      "zip" : ""
   }
   ```

1. 倉庫の追加を確認するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Warehouses** に移動してください。 新しいウェアハウスが表示されます。

   ![ウェアハウスが追加されたことを確認する。](./warehouse-api-basics/images/01.png)

   ```{note}
   新倉庫は非稼働です。 アクティブにする前に `latitude` と `longitude` の座標を設定する。
   ```

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Warehouse_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* Warehouse_POST_ToInstance
   ```

## cURLコマンドの検証

`Warehouse_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                            | 説明                                 |
|:----------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                         | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                     | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses"` | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"active\": false, \"name\": {\"en_US\": \"Foo\"}}"`            | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                 | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Warehouse_POST_ToInstance.java` クラスは、 `WarehouseResource` サービスを呼び出して倉庫を追加します。

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                       | 説明                                                         |
|:---------------------------------------------------------------------------- |:---------------------------------------------------------- |
| `WarehouseResource.Builder builder = ...`                                    | `WarehouseResource` サービスインスタンスを生成するための `Builder` を取得する。    |
| `WarehouseResource warehouseResource = builder.authentication(...).build();` | 基本認証を使用し、 `WarehouseResource` サービスインスタンスを生成します。            |
| `warehouseResource.postWarehouse(...);`                                      | `warehouseResource.postWarehouse` メソッドを呼び出し、postにデータを渡します。 |

このプロジェクトには、依存関係として `com.liferay.headless.commerce.admin.inventory.client.jar` ファイルが含まれています。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストール先の API Explorer で `/o/api` (例: <http://localhost:8080/o/api>) から確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプルJavaクラスは、異なる `WarehouseResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [WarehouseResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless-commerce/headless-commerce-admin-inventory-client/src/main/java/com/liferay/headless/commerce/admin/inventory/client/resource/v1_0/WarehouseResource.java) を参照ください。
```

以下は、cURLとJavaを使用して他の `Warehouse` RESTサービスを呼び出す例です。

## インスタンスからウェアハウスを取得する

cURLまたはJavaコマンドで、Liferayインスタンスのすべての倉庫をリストアップします。

### Warehouses_GET_FromInstance.sh

コマンド：

```bash
./Warehouses_GET_FromInstance.sh
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouses_GET_FromInstance.sh
   :language: bash
```

### Warehouses_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Warehouses_GET_FromInstance
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouses_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `倉庫` のオブジェクトは JSON でフォーマットされています。

### 倉庫のフィルタリング、ページ分割、並べ替え

このAPIは、倉庫をフィルタリング、ページ分割、ソートするためのパラメータも受け付けます。 詳しくは、 [`getWarehousesPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-inventory-client/src/main/java/com/liferay/headless/commerce/admin/inventory/client/resource/v1_0/WarehouseResource.java#L43-#L45) メソッドをご覧ください。 クエリで以下の `Warehouse` フィールドを使用して、結果をフィルタリングおよびソートすることができます。

* 有効
* 市区町村
* カントリーアイエスオーコード
* 緯度
* 経度
* name
* リージョンISOCODE
* ストリートワン

| フィルタークエリ           | 説明                      |
|:------------------ |:----------------------- |
| `active eq true`   | ウェアハウスがアクティブであることが必要です。 |
| `name eq 'Foo'`    | 倉庫名は'Foo'と同じでなければなりません。 |
| `latitude eq 12.0` | 倉庫の緯度が12.0になること。        |

| ソートクエリ                | 説明              |
|:--------------------- |:--------------- |
| `name:desc`           | 名前の降順で並べる       |
| `countryISOCode:desc` | 国のISOコードで降順に並べる |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) をご参照ください。

## ウェアハウスを取得する

cURL または Java `get` コマンドで特定の倉庫を取得します。 `1234` を倉庫のIDに置き換えてください。

```{tip}
`Warehouses_GET_FromInstance.[java|sh]`を使用して、すべての倉庫のリストを取得し、特に欲しい倉庫の `id` をメモします。
```

### Warehouse_GET_ById.sh

コマンド：

```bash
./Warehouse_GET_ById.sh 1234
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_GET_ById.sh
   :language: bash
```

### Warehouse_GET_ById.java

コマンド：

```bash
java -classpath .:* -DwarehouseId=1234 Warehouse_GET_ById
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Warehouse` のフィールドは、JSONで表示されます。

## 倉庫にパッチを貼る

cURLとJava `patch` コマンドで既存の倉庫を更新します。 `1234` を倉庫のIDに置き換えてください。

### Warehouse_PATCH_ById.java

コマンド：

```bash
./Warehouse_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_PATCH_ById.sh
   :language: bash
```

### Warehouse_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DwarehouseId=1234 Warehouse_PATCH_ById
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## 倉庫を削除する

cURL と Java `delete` コマンドで既存の倉庫を削除する。 `1234` を倉庫のIDに置き換えてください。

### Warehouse_DELETE_ById.sh

コマンド：

```bash
./Warehouse_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/curl/Warehouse_DELETE_ById.sh
   :language: bash
```

### Warehouse_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DwarehouseId=1234 Warehouse_DELETE_ById
```

コード：

```{literalinclude} ./warehouse-api-basics/resources/liferay-v9s5.zip/java/Warehouse_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) では、 `Warehouse` のサービスやスキーマが表示され、各サービスをテストするためのインターフェイスが用意されています。
