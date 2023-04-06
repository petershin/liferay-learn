# Option API の基本

[オプションテンプレート](../../product-management/creating-and-managing-products/products/using-product-options.md)は、アプリケーションメニューやREST APIで管理できます。 [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) サービスを呼び出して、オプションを作成・管理します。

## オプションの追加

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら。

1. Option API Basics](./liferay-d3g5.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/commmerce/latest/en/product-management/developer-guide/liferay-d3g5.zip -O
   ```

   ```bash
   unzip liferay-d3g5.zip
   ```

1. オプションはインスタンスにスコープされ、各オプションは一意の `キー`を指定する必要があります。

   cURLスクリプトを使用して、新しいオプションを追加してください。 コマンドラインで、 `curl` フォルダに移動します。 `Option_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Option_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しいオプションが追加されたことを示します。

   ```bash
   {
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/46438"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/46438"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/46438"
         }
      },
      "description" : { },
      "externalReferenceCode" : "f73e12cd-feae-9e78-5921-6b65f6b993f6",
      "facetable" : false,
      "fieldType" : "select",
      "id" : 46438,
      "key" : "foo",
      "name" : {
         "en_US" : "Foo"
      },
      "required" : false,
      "skuContributor" : false
   }
   ```

1. オプションの追加を確認するには、 *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 *Commerce* &rarr; *Options*に移動してください。 新しいオプションが表示されます。

   ![新しいオプションが追加されたことを確認する。](./option-api-basics/images/01.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Option_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* Option_POST_ToInstance
   ```

![オプションを作成する際に、以下のオプションフィールドのタイプを使用することができます。](./option-api-basics/images/02.png)

| 項目タイプ    | API値                               |
|:-------- |:---------------------------------- |
| テキストボックス | `"fieldType": "text"`              |
| 一覧から選ぶ   | `"fieldType": "select"`            |
| ラジオボタン   | `"fieldType": "radio"`             |
| 複数選択     | `"fieldType": "checkbox_multiple"` |
| 日付       | `"fieldType": "date"`              |
| 数値       | `"fieldType": "numeric"`           |
| ブール値     | `"fieldType": "checkbox"`          |

## cURLコマンドの検証

`Option_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./option-api-basics/resources/liferay-d3g5.zip/curl/Option_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                 | 説明                                 |
|:-------------------------------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                              | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                                          | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options"`                           | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"fieldType\": \"select\", \"key\": \"foo\", \"name\": {\"en_US\": \"Foo\"}}"` | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                                      | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2.html) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Option_POST_ToInstance.java` クラスは、 `OptionResource` サービスを呼び出してオプションを追加します。

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/java/Option_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                 | 説明                                                   |
|:---------------------------------------------------------------------- |:---------------------------------------------------- |
| `OptionResource.Builder builder = ...`                                 | `OptionResource` サービスインスタンスを生成するための `Builder` を取得する。 |
| `OptionResource optionResource = builder.authentication(...).build();` | 基本認証を使用し、 `OptionResource` サービスインスタンスを生成します。         |
| `optionResource.postOption(...);`                                      | `optionResource.postOption` メソッドを呼び出し、postにデータを渡します。 |

このプロジェクトには、依存関係として `com.liferay.headless.commerce.admin.catalog.client.jar` ファイルが含まれています。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストール先の API Explorer で `/o/api` (例: <http://localhost:8080/o/api>) から確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りの例のJavaクラスは、異なる `OptionResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [OptionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/OptionResource.java) を参照してください。
```

以下は、cURLとJavaを使用して他の `Option` RESTサービスを呼び出す例です。

## インスタンスからオプションを取得する

cURLやJavaのコマンドで、Liferayインスタンスの全オプションをリストアップします。

### オプション_GET_FromInstance.sh

コマンド:

```bash
./Options_GET_FromInstance.sh
```

コード:

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/curl/Options_GET_FromInstance.sh
   :language: bash
```

### オプション_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Options_GET_FromInstance
```

コード：

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/java/Options_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `Option` オブジェクトはJSONでフォーマットされています。

### フィルタリング、ページ分割、検索、並べ替えのオプション

このAPIは、オプションのフィルタリング、ページ分割、検索、並べ替えのためのパラメータも受け付けます。 詳しくは、 [`getOptionsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/OptionResource.java#L43-#L46) メソッドをご覧ください。 クエリでは、以下の `Option` フィールドを使用して、結果のフィルタリング、検索、およびソートを行うことができます。

* フィールドタイプ
* キー
* name

| フィルタークエリ                | 説明                       |
|:----------------------- |:------------------------ |
| `name eq 'Able'`        | オプション名はAbleと等しくなければならない。 |
| `fieldType eq 'select'` | オプションの種類は必ず選択すること        |

| ソートクエリ      | 説明          |
|:----------- |:----------- |
| `key:desc`  | 名前の降順で並べます。 |
| `name:desc` | 名前の降順で並べます。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/api-query-parameters.html) をご参照ください。

## オプションの取得

cURL または Java `get` コマンドで特定のオプションを取得します。 `1234` をオプションのIDに置き換えてください。

```{tip}
Options_GET_FromInstance.[java|sh]`を使用して、すべてのオプションのリストを取得し、特に欲しいオプションの `id` をメモします。
```

### Option_GET_ById.sh

コマンド：

```bash
./Option_GET_ById.sh 1234
```

コード：

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/curl/Option_GET_ById.sh
   :language: bash
```

### Option_GET_ById.java

コマンド：

```bash
java -classpath .:* -DoptionId=1234 Option_GET_ById
```

コード：

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/java/Option_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Option` のフィールドはJSONで記載されています。

## パッチアオプション

cURL と Java `patch` コマンドで既存のオプションを更新します。 `1234` をオプションのIDに置き換えてください。

### Option_PATCH_ById.sh

コマンド：

```bash
./Option_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/curl/Option_PATCH_ById.sh
   :language: bash
```

### Option_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DoptionId=1234 Option_PATCH_ById
```

コード：

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/java/Option_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## オプションの削除

cURL と Java `delete` コマンドで既存のオプションを削除します。 `1234` をオプションのIDに置き換えてください。

### Option_DELETE_ById.sh

コマンド：

```bash
./Option_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/curl/Option_DELETE_ById.sh
   :language: bash
```

### Option_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DoptionId=1234 Option_DELETE_ById
```

コード：

```{literalinclude} ./options-api-basics/resources/liferay-d3g5.zip/java/Option_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html) では、 `Option` のサービスとスキーマを表示し、各サービスをテストするためのインターフェイスを備えています。
