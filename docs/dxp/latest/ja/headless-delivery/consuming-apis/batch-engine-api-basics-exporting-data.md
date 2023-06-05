# Batch Engine API の基本 - データのエクスポート

LiferayのHeadless Batch Engineは、データのインポートやエクスポートを行うためのREST APIを提供しています。 Liferayからデータをエクスポートするために、これらのサービスを呼び出します。

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## データのエクスポート

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順で操作してください：

1. [Batch Engine API Basics](./liferay-g4j2.zip) をダウンロードし、解凍する。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. データをエクスポートするには、エクスポートするエンティティの完全修飾クラス名が必要です。 クラス名は、インストールされているAPIエクスプローラから、 `/o/api`で取得することができます。 **Schemas** セクションまでスクロールダウンし、エクスポートしたいエンティティの `x-class-name` フィールドをメモしておきます。

1. Liferayインスタンスからアカウントをエクスポートするには、以下のcURLスクリプトを使用します。 コマンドラインで、 `curl`フォルダに移動します。 `ExportTask_POST_ToInstance.sh` スクリプトを、完全修飾クラス名 **Account** および `json` をパラメーターとして実行します。 `json` パラメーターは、エクスポートされたデータのフォーマットを示します。 また、 `jsonl` と `csv` のフォーマットにも対応しています。

   ```bash
   ./ExportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account json
   ```

   JSONレスポンスには、新しいエクスポートタスクの作成が表示されます。 タスクの `id` にご注目ください：

   ```json
   {
     "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "INITIAL",
     "externalReferenceCode" : "6c5286a2-aa28-175b-041e-eacca4a54d3b",
     "id" : 1234,
     "processedItemsCount" : 0,
     "totalItemsCount" : 0
   }
   ```

   ```{important}
   出力形式として `json` または `jsonl` を使用する場合、デフォルトですべてのフィールドがエクスポートされます。 フィールドを指定するには、エクスポートしたいフィールドを追加のクエリパラメータ(`fieldNames`）で指定する必要があります。 各項目はカンマ(,）で区切る必要があります。 エクスポート形式として `csv` を使用する場合、このクエリパラメータは必須である。
   ```

1. 現在の `executeStatus` は `INITIAL`です。 Batch Engineへのタスクの投入を表す。 データのダウンロードには、これが `COMPLETED` になるまで待つ必要があります。 コマンドラインで、 `ExportTask_GET_ById.sh` スクリプトを実行し、 `1234` をエクスポートタスクのIDに置き換えてください。

   ```bash
   ./ExportTask_GET_ById.sh 1234
   ```

   ```json
   {
     "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
     "contentType" : "JSON",
     "endTime" : "2022-10-19T14:13:58Z",
     "errorMessage" : "",
     "executeStatus" : "COMPLETED",
     "externalReferenceCode" : "6c5286a2-aa28-175b-041e-eacca4a54d3b",
     "id" : 1234,
     "processedItemsCount" : 8,
     "startTime" : "2022-10-19T14:13:58Z",
     "totalItemsCount" : 8
   }
   ```

   `executeStatus` が `COMPLETED`の場合、エクスポートされたデータをダウンロードすることができます。 実行されていない場合は、再度コマンドを実行し、タスクの実行が終了したことを確認します。 `executeStatus` が `FAILED`を示している場合、 `errorMessage` フィールドを確認し、何が問題だったかを理解する。

1. `executeStatus` が `COMPLETED`になったら、 `ExportTaskContent_GET_ById.sh` スクリプトを実行し、 `1234` をエクスポートタスクのIDに置き換えて、エクスポートしたデータをダウンロードできます。

   ```bash
   ./ExportTaskContent_GET_ById.sh 1234
   ```

   エクスポートしたデータを `.zip` ファイルとしてカレントディレクトリにダウンロードします。 抽出し、適切なアプリケーションを使用してデータを表示します。

1. また、Javaクライアントを使用してThe RESTサービスを呼び出すことができます。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `ExportTask_POST_ToInstance` クラスを実行します。 `able` をクラスの完全修飾名に置き換えてください。

   ```bash
   java -classpath .:* -DclassName=able ExportTask_POST_ToInstance
   ```

   例えば、 `Account` のデータをエクスポートします：

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account ExportTask_POST_ToInstance
   ```

   JSONレスポンスからエクスポートタスクの `id` に注目してください。

1. `ExportTask_GET_ById` クラスを以下のコマンドで実行します。 `1234` をエクスポートタスクのIDに置き換えてください。

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
   ```

1. `executeStatus` が `COMPLETED`を示したら、 `ExportTaskContent_GET_ById` クラスを実行して、データをダウンロードできます。 `1234` をエクスポートタスクのIDに置き換えてください。

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTaskContent_GET_ById
   ```

## cURLコマンドの検証

`ExportTask_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                           | 説明                              |
|:---------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                        | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                    | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/export-task/${1}/${2}"` | RESTサービスのエンドポイント                |
| `-u "test@liferay.com:learn"`                                                | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2.html) 経由でユーザーを認証する必要があります。 Oauth2を利用したReactアプリケーションのサンプルは、[OAuth2を使ってユーザーを認証する](../using-oauth2/using-oauth2-to-authorize-users.md)をご参照ください。
```

## Javaクラスを調べる

`ExportTask_POST_ToInstance.java` クラスは、Batch Engine 関連サービスを呼び出すことでデータをエクスポートします。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-21
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                         | 説明                                                            |
|:------------------------------------------------------------------------------ |:------------------------------------------------------------- |
| `ExportTaskResource.Builder builder = ...`                                     | `ExportTaskResource` サービスインスタンスを生成するための `Builder` を取得する。      |
| `ExportTaskResource exportTaskResource = builder.authentication(...).build();` | 基本認証を指定し、 `ExportTaskResource` サービスインスタンスを生成します。              |
| `exportTaskResource.postExportTask(...);`                                      | `exportTaskResource.postExportTask` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.batch.engine.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと似ていますが、異なる `ExportTaskResource` メソッドを呼び出します。

```{important}
サービスの詳細は [ExportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ExportTaskResource.java) を参照してください。
```

以下は、cURLとJavaを使用して他のBatch Engine export RESTサービスを呼び出す例です。

## ExportTaskのステータスを取得する

以下のcURLまたはJavaコマンドを実行することで、エクスポートタスクのステータスを取得することができます。 `1234` をエクスポートタスクのIDに置き換えてください。

### ExportTask_GET_ById.sh

コマンド：

```bash
./ExportTask_GET_ById.sh 1234
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_GET_ById.sh
   :language: bash
```

### ExportTask_GET_ById.java

`ExportTask_GET_ById` クラスを実行します。 `1234` をエクスポートタスクのIDに置き換えてください。

コマンド：

```bash
java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## サイトからのデータの書き出し

以下のcURLまたはJavaコマンドを実行することで、サイトからデータをエクスポートすることができます。 以下の例では、あるサイトからブログ記事をエクスポートしています。 [RESTサービスの使用](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html#identify-the-site-containing-the-data) を探し、 `1234` に置き換えます。 他のエンティティを使用する場合は、cURLスクリプトの完全修飾クラス名パラメータも更新する必要があります。

### ExportTask_POST_ToSite.sh

コマンド:

```bash
./ExportTask_POST_ToSite.sh com.liferay.headless.delivery.dto.v1_0.BlogPosting json 1234
```

コード:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToSite.sh
   :language: bash
```

### ExportTask_POST_ToSite.java

`ExportTask_POST_ToSite` クラスを実行します。 `1234` をあなたのサイトのIDに、 `able` をエクスポートしたいクラスの完全修飾名に置き換えてください：

```bash
java -classpath .:* -DsiteId=1234 -DclassName=able ExportTask_POST_ToSite
```

例えば、 `BlogPosting` のデータをエクスポートします：

```bash
java -classpath .:* -DsiteId=1234 -DclassName=com.liferay.headless.delivery.dto.v1_0.BlogPosting ExportTask_POST_ToSite
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

```{note}
第2パラメータは `json` で、エクスポートされたデータの出力形式を示す。 ここでは `jsonl` と `csv` を使用することもできます。 CSVを使用する場合は、エクスポートしたいフィールドをカンマ区切りの文字列で指定し、`exportTaskResource.postExportTask()`メソッドの第5パラメータとして渡すことが必須である。
```

JSONレスポンスには、新しく作成されたエクスポートタスクの情報が表示されます。 `id` に注意して、その `executeStatus`を追跡してください。 完了後、 `ExportTaskContent_GET_ById.[java|sh]` をエクスポートタスクIDで実行し、データをダウンロードすることができます。

## エクスポートされたデータの内容を取得する

エクスポートされたデータは、以下のcURLコマンドおよびJavaコマンドでダウンロードできます。 `1234` をエクスポートタスクのIDに置き換えてください。 そして、カレントディレクトリに `.zip` ファイルとしてダウンロードされます。

### ExportTaskContent_GET_ById.sh

コマンド：

```bash
./ExportTaskContent_GET_ById.sh 1234
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTaskContent_GET_ById.sh
   :language: bash
```

### ExportTaskContent_GET_ById.java

コマンド

```bash
java -classpath .:* -DexportTaskId=1234 ExportTaskContent_GET_ById
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTaskContent_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 11-27
```

[RESTサービスの使用](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html) には、Headless Batch Engine の全サービスとスキーマがリストアップされており、各サービスを試すためのインターフェイスが用意されています。

## 関連トピック

* [Batch Engine API の基本 - データのインポート](./batch-engine-api-basics-importing-data.md)
