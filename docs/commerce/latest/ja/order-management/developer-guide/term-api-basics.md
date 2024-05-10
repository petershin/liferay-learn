# Term API の基礎知識

アプリケーションメニューやREST APIで規約を管理することができます。 [headless-admin-commerce-order](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-order/v1.0/openapi.json) から `/terms` のエンドポイントを使用して、利用規約を作成・管理します。

## 用語の追加

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら。

1. Term API Basics](./liferay-a9v8.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/order-management/developer-guide/liferay-a9v8.zip -O
   ```

   ```bash
   unzip liferay-a9v8.zip
   ```

1. 条件を作成するには、ラベル、名前、優先順位、タイプの4つのパラメータが必要です。

   | パラメーター | 値のタイプ    | 説明/<br />例                                                                    |
   |:------ |:-------- |:----------------------------------------------------------------------------------- |
   | ラベル    | テキストボックス | ロケール/バリューのプロパティをカンマ区切りで入力してください。<br />`{"en_US":"Foo"、"es_ES":"Bar"}を入力します。`  |
   | 名前     | テキストボックス | 規約項目のユニークな名称を入力する。<br />`"name "を入力します。"foo"`                                 |
   | 重要度    | 数字（ダブル）  | ユニークな数値の優先順位を入力します。<br />`"priority "を入力します。1.2`                              |
   | 種類     | テキストボックス | `"payment-terms"` または `"delivery-terms"`:<br />`"type "を指定する。"payment-terms"` |

   cURLスクリプトを使用して、インスタンスに利用規約を追加します。 コマンドラインで、 `curl` フォルダに移動します。 `Term_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Term_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しく追加された規約が表示されます。

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/46418"
         }
      },
      "active" : false,
      "description" : {
         "en_US" : ""
      },
      "displayDate" : "2023-03-03T13:16:00Z",
      "externalReferenceCode" : "7fa19a0c-4c98-6c36-f1bc-5a2c4257220c",
      "id" : 46418,
      "label" : {
         "en_US" : "Foo"
      },
      "name" : "foo",
      "priority" : 0.0,
      "type" : "payment-terms",
      "typeLocalized" : "Payment Terms",
      "typeSettings" : "",
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) &rarr; **Commerce** &rarr; **Terms and Conditions** に移動します。 新しく追加された規約が表示されます。

   ![規約の追加を確認する。](./term-api-basics/images/01.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Term_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* Term_POST_ToInstance
   ```

## cURLコマンドの検証

`Term_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                                        | 説明                                 |
|:------------------------------------------------------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                                                     | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                                                                 | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms"`                                                      | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"foo\", \"priority\": 0, \"type\": \"payment-terms\"}"` | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                                                             | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Term_POST_ToInstance.java` クラスは、 `TermResource` サービスを呼び出して条件を追加します。

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                             | 説明                                                  |
|:------------------------------------------------------------------ |:--------------------------------------------------- |
| `TermResource.Builder builder = ...`                               | `TermResource` サービスインスタンスを生成するための `Builder` を取得します。 |
| `TermResource termResource = builder.authentication(...).build();` | 基本認証を使用し、 `TermResource` サービスインスタンスを生成します。          |
| `termResource.postTerm(...);`                                      | `termResource.postTerm` メソッドを呼び出し、postにデータを渡します。    |

プロジェクトには、依存関係として`com.liferay.headless.commerce.admin.order.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJARの依存情報は、`/o/api` (例: <http://localhost:8080/o/api>) にあるインストール先のAPIエクスプローラーで見つけることができます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りの例のJavaクラスは、異なる `TermResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [TermResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/TermResource.java) を参照ください。
```

以下は、cURL と Java を使って他の `Term` REST サービスを呼び出す例である。

## インスタンスから条件を取得する

LiferayのインスタンスからcURLやJavaのコマンドで全ての規約を一覧できます。

### Terms_GET_FromInstance.sh

コマンド：

```bash
./Terms_GET_FromInstance.sh
```

コード：

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Terms_GET_FromInstance.sh
   :language: bash
```

### Terms_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Terms_GET_FromInstance
```

コード：

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Terms_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-18
```

インスタンスの `Term` オブジェクトがJSONで一覧表示されます。

### 用語のフィルタリング、ページ分割、検索、ソート

返された条件をフィルタリング、ページ分割、検索、ソートすることができます。 詳しくは、 [`getTermsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/TermResource.java#L43-L46) メソッドをご覧ください。 `優先順位` および `タイプ` フィールドを使用して、結果のフィルタリング、検索、およびソートを行います。

| フィルタークエリ                  | 説明                       |
|:------------------------- |:------------------------ |
| `type eq 'payment-terms'` | 条件は、payment-terms型であること。 |
| `priority eq 0`           | 規約の優先順位が0になること           |

| ソートクエリ                    | 説明                                  |
|:------------------------- |:----------------------------------- |
| `priority:desc`           | `優先順位` で降順に並びます。                    |
| `priority:desc,type:desc` | まず `優先順位` の降順で並べ、次に `タイプ` の降順で並べます。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) をご参照ください。

## タームを取得する

cURLとJavaの `get` コマンドで特定の条件を取得します。 `1234` を規約のIDに置き換えてください。

```{tip}
`Terms_GET_FromInstance.[java|sh]`を使用して、すべての条件のリストを取得し、特に欲しい条件の `id` をメモする。
```

### Term_GET_ById.sh

コマンド：

```bash
./Term_GET_ById.sh 1234
```

コード：

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_GET_ById.sh
   :language: bash
```

### Term_GET_ById.java

コマンド:

```bash
java -classpath .:* -DtermId=1234 Term_GET_ById
```

コード:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

`Term` フィールドは、JSON でフォーマットされている。

## タームを貼る

cURLとJava `patch` コマンドで既存の規約を更新します。 `1234` を規約のIDに置き換えてください。

### Term_PATCH_ById.sh

コマンド：

```bash
./Term_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_PATCH_ById.sh
   :language: bash
```

### Term_PATCH_ById.java

コマンド:

```bash
java -classpath .:* -DtermId=1234 Term_PATCH_ById
```

コード:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## タームを削除する

cURLとJavaの `delete` コマンドで既存の規約を削除します。 `1234` を規約のIDに置き換えてください。

### Term_DELETE_ById.sh

コマンド：

```bash
./Term_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/curl/Term_DELETE_ById.sh
   :language: bash
```

### Term_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DtermId=1234 Term_DELETE_ById
```

コード:

```{literalinclude} ./term-api-basics/resources/liferay-a9v8.zip/java/Term_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-16
```

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) では、 `Term` のサービスとスキーマを表示し、各サービスをテストするためのインターフェイスを備えています。
