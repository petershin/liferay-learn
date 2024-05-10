# オプション値APIの基本

オプションの値は、オプション・アプリケーションから、またはREST APIを使って管理することができます。 [headless-commerce-admin-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json) サービスを呼び出して、オプション値を作成・管理する。

## オプション値の追加

```{include} /_snippets/run-liferay-dxp.md
```

1. [Option Value API Basics](./liferay-c7w9.zip) をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-c7w9.zip -O
   ```

   ```bash
   unzip liferay-c7w9.zip
   ```

1. オプション値はオプションにスコープされる。 まだオプションを作成していない場合は、 [オプションAPIの基本](./option-api-basics.md) を参照してください。 新規オプシ ョ ン値を作成す る 際には、 オプシ ョ ンの `id` と 、 一意キー と 、 オプシ ョ ン値の名前を与え る 必要があ り ます。

   cURLスクリプトを使用して、新しいオプション値を追加する。 コマンドラインで、 `curl`フォルダに移動します。 `OptionValue_POST_ToOption.sh` スクリプトを、適切なオプションIDをパラメータとして実行する。

   ```bash
   ./OptionValue_POST_ToOption.sh 1234
   ```

   JSONレスポンスは、新しいオプション値が追加されたことを示す：

   ```json
   {
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/optionValues/{id}"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/optionValues/{id}"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/optionValues/{id}"
         }
      },
      "externalReferenceCode" : "c63216c7-9043-90ab-35b9-6efbe36b47ff",
      "id" : 46709,
      "key" : "able",
      "name" : {
         "en_US" : "Able"
      },
      "priority" : 0.0
   }
   ```

1. オプション値の追加を確認するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Options** に移動します。 適切なオプションを選択してください。 新しいオプション値がValuesセクションに表示される。

   ![新しいオプション値が追加されたことを確認する。](./option-value-api-basics/images/01.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `OptionValue_POST_ToOption` クラスを実行し、 `optionId` を適切な値に置き換える。

   ```bash
   java -classpath .:* -DoptionId=1234 OptionValue_POST_ToOption
   ```

## cURLコマンドの検証

`OptionValue_POST_ToOption.sh` スクリプトは、cURLコマンドでRESTサービスを呼び出します。

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_POST_ToOption.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                         | 説明                                 |
|:------------------------------------------------------------------------------------------ |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                      | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                                  | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/${1}/optionValues"` | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"key\": \"able\", \"name\": {\"en_US\": \"Able\"}}"`                      | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                              | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`OptionValue_POST_ToOption.java` クラスは、 `OptionValueResource` サービスを呼び出してオプション値を追加します。

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_POST_ToOption.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                           | 説明                                                                      |
|:-------------------------------------------------------------------------------- |:----------------------------------------------------------------------- |
| `OptionValueResource.Builder builder = ...`                                      | `OptionValueResource` サービスインスタンスを生成するための `Builder` を取得します。              |
| `OptionValueResource optionValueResource = builder.authentication(...).build();` | 基本認証を使用し、 `OptionValueResource` サービスインスタンスを生成する。                        |
| `optionValueResource.postOption(...);`                                           | `optionValueResource.postOptionIdOptionValue` メソッドを呼び出し、post にデータを渡します。 |

このプロジェクトには、依存関係として`com.liferay.headless.commerce.admin.catalog.client.jar` ファイルが含まれています。 すべてのRESTアプリケーションのクライアントJAR依存情報は、インストール先のAPIエクスプローラーで`/o/api` (例: <http://localhost:8080/o/api>) から確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプル Java クラスは、異なる `OptionValueResource` メソッドを呼び出します。

```{important}
サービスの詳細は [OptionValueResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/resource/v1_0/OptionValueResource.java) を参照してください。
```

以下は、cURL と Java を使用して他の `OptionValue` REST サービスを呼び出す例です。

## オプションからオプション値を取得する

cURLまたはJavaコマンドでオプションからすべてのオプション値をリストする。 `1234`をオプションのIDに置き換えます。

### OptionValues_GET_FromOption.sh

コマンド：

```bash
./OptionValues_GET_FromOption.sh 1234
```

コード：

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValues_GET_FromOption.sh
   :language: bash
```

### OptionValues_GET_FromOption.java

コマンド：

```bash
java -classpath .:* -DoptionId=1234 OptionValues_GET_FromOption
```

コード：

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValues_GET_FromOption.java
   :dedent: 1
   :language: java
   :lines: 9-20
```

オプションの `OptionValue` オブジェクトはJSONでフォーマットされています。

## オプション値の取得

cURL または Java `get` コマンドで特定のオプション値を取得。 `1234` をオプション値のIDに置き換える。

```{tip}
`OptionValues_GET_FromOption.[java|sh]`を使用して、オプションに関連するすべてのオプション値のリストを取得し、特に必要なオプション値の`id`をメモする。
```

### OptionValue_GET_ById.sh

コマンド:

```bash
./OptionValue_GET_ById.sh 1234
```

コード:

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_GET_ById.sh
   :language: bash
```

### OptionValue_GET_ById.java

コマンド：

```bash
java -classpath .:* -DoptionValueId=1234 OptionValue_GET_ById
```

コード：

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`OptionValue` フィールドがJSONでリストされている。

## オプション値のパッチ

cURL と Java `patch` コマンドで既存のオプション値を更新。 `1234` をオプション値のIDに置き換えてください。

### OptionValue_PATCH_ById.sh

コマンド：

```bash
./OptionValue_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_PATCH_ById.sh
   :language: bash
```

### OptionValue_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DoptionValueId=1234 OptionValue_PATCH_ById
```

コード：

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

## オプション値の削除

cURL と Java `delete` コマンドで既存のオプション値を削除。 `1234` をオプション値のIDに置き換えてください。

### OptionValue_DELETE_ById.sh

コマンド：

```bash
./OptionValue_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/curl/OptionValue_DELETE_ById.sh
   :language: bash
```

### OptionValue_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DoptionValueId=1234 OptionValue_DELETE_ById
```

コード：

```{literalinclude} ./option-value-api-basics/resources/liferay-c7w9.zip/java/OptionValue_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) は、 `OptionValue` サービスとスキーマを表示し、各サービスをテストするインターフェイスを持っています。
