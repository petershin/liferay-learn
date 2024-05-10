# 仕様書APIの基礎知識

アプリケーションメニューやREST APIで商品仕様を管理することができます。 [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) サービスを呼び出し、仕様を作成・管理する。

## 仕様を追加する

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら、

1. [Specification API Basics](./liferay-u9x9.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-u9x9.zip -O
   ```

   ```bash
   unzip liferay-u9x9.zip
   ```

1. 仕様はインスタンスにスコープされ、各仕様は一意の `キー` と `タイトル`を指定する必要がある。

   cURLスクリプトを使用して、新しい仕様を追加します。 コマンドラインで、 `curl`フォルダに移動します。 `Specification_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Specification_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しい仕様が追加されたことを示します：

   ```bash
   {
      "description" : { },
      "facetable" : false,
      "id" : 45936,
      "key" : "foo",
      "title" : {
         "en_US" : "Foo"
      }
   }
   ```

1. 仕様追加を確認するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Specifications** に移動してください。 新しい仕様が「仕様ラベル」タブに表示されます。

   ![新しい仕様が追加されたことを確認する。](./specification-api-basics/images/01.png)

   ```{note}
   現在、APIでは仕様グループへの仕様ラベルの追加や仕様グループの作成はできません。 代わりにSpecifications UIを使用する必要があります。 *グローバルメニュー*(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png) ）を開き、*Commerce* &rarr; *Specifications* に移動します。 詳しくは、 [仕様グループ](../creating-and-managing-products/products/specifications.md#specification-groups) を参照してください。
   ```

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Specification_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* Specification_POST_ToInstance
   ```

## cURLコマンドの検証

`Specification_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./specification-api-basics/resources/liferay-u9x9.zip/curl/Specification_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                              | 説明                                 |
|:------------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                           | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                       | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/specifications"` | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"key\": \"foo\", \"title\": {\"en_US\": \"Foo\"}}"`            | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                   | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/ja/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/ja/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Specification_POST_ToInstance.java` クラスは、 `SpecificationResource` サービスを呼び出すことで仕様を追加します。

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                               | 説明                                                                 |
|:------------------------------------------------------------------------------------ |:------------------------------------------------------------------ |
| `SpecificationResource.Builder builder = ...`                                        | `SpecificationResource` サービスインスタンスを生成するための `Builder` を取得する。        |
| `SpecificationResource specificationResource = builder.authentication(...).build();` | 基本認証を使用し、 `SpecificationResource` サービスインスタンスを生成します。                |
| `specificationResource.postSpecification(...);`                                      | `specificationResource.postSpecification` メソッドを呼び出し、postにデータを渡します。 |

このプロジェクトには、依存関係として`com.liferay.headless.commerce.admin.catalog.client.jar` ファイルが含まれています。 すべてのRESTアプリケーションのクライアントJAR依存情報は、インストール先のAPIエクスプローラーで`/o/api` (例: <http://localhost:8080/o/api>) から確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプルJavaクラスは、異なる `SpecificationResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [SpecificationResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/SpecificationResource.java) を参照ください。
```

以下は、cURLとJavaを使用して、他の `仕様` RESTサービスを呼び出す例です。

## インスタンスから仕様を取得する

cURLやJavaのコマンドで、Liferayインスタンスのすべての仕様をリストアップします。

### Specifications_GET_FromInstance.sh

コマンド：

```bash
./Specifications_GET_FromInstance.sh
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specifications_GET_FromInstance.sh
   :language: bash
```

### Specifications_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Specifications_GET_FromInstance
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specifications_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `仕様` オブジェクトはJSONでフォーマットされています。

### フィルタリング、ページ分割、検索、並べ替えの仕様について

このAPIでは、仕様のフィルタリング、ページ分割、検索、並べ替えのためのパラメータも受け付ける。 詳しくは、 [`getSpecificationsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/SpecificationResource.java#L43-#L46) メソッドをご覧ください。 クエリでは、以下の `仕様` フィールドを使用して、結果のフィルタリング、検索、ソートを行うことができます：

* キー
* タイトル

| フィルタークエリ         | 説明                    |
|:---------------- |:--------------------- |
| `key eq 'foo'`   | 指定キーはfooと等しくなければならない。 |
| `title eq 'Bar'` | 仕様タイトルはBarである必要があります。 |

| ソートクエリ      | 説明            |
|:----------- |:------------- |
| `key:desc`  | キーで降順に並べます。   |
| `title:asc` | タイトルの昇順で並べます。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) をご参照ください。

## 仕様書を入手する

cURL または Java `get` コマンドで特定の仕様を取得します。 `1234` を仕様書のIDに置き換えてください。

```{tip}
`Specifications_GET_FromInstance.[java|sh]`を使用して、すべての仕様のリストを取得し、特に欲しい仕様の `id` をメモします。
```

### Specification_GET_ById.sh

コマンド：

```bash
./Specification_GET_ById.sh 1234
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specification_GET_ById.sh
   :language: bash
```

### Specification_GET_ById.java

コマンド：

```bash
java -classpath .:* -DspecificationId=1234 Specification_GET_ById
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`仕様書` のフィールドをJSONで記載します。

## 仕様書の貼り付け

cURLとJava `patch` コマンドで既存の仕様を更新します。 `1234` をお客様の仕様のIDに置き換えてください。

### Specification_PATCH_ById.sh

コマンド：

```bash
./Specification_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specification_PATCH_ById.sh
   :language: bash
```

### Specification_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DspecificationId=1234 Specification_PATCH_ById
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

## 仕様を削除する

cURL と Java `delete` コマンドで既存の仕様を削除する。 `1234` をお客様の仕様のIDに置き換えてください。

### Specification_DELETE_ById.sh

コマンド：

```bash
./Specification_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/curl/Specification_DELETE_ById.sh
   :language: bash
```

### Specification_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DspecificationId=1234 Specification_DELETE_ById
```

コード：

```{literalinclude} ./specifications-api-basics/resources/liferay-u9x9.zip/java/Specification_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) では、 `Specification` のサービスやスキーマが表示され、各サービスをテストするためのインターフェイスが用意されています。
