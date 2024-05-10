# バッチエンジンAPIの基本 - データのエクスポート

Liferayのヘッドレスバッチエンジンは、データのインポートやエクスポートを行うためのREST APIを提供します。 これらのサービスを呼び出して、Liferayにデータをエクスポートします。

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## データのエクスポート

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [Batch Engine API Basics](./liferay-g4j2.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. データをエクスポートするには、エクスポートするエンティティの完全修飾クラス名が必要です。 クラス名は、インストールされているAPI Explorerの `/o/api` から取得できる。 **スキーマ** セクションまでスクロールダウンし、エクスポートしたいエンティティの `x-class-name` フィールドをメモする。

1. 以下のcURLスクリプトを使用して、Liferayインスタンスからアカウントをエクスポートします。 コマンドラインで `curl` フォルダに移動します。 `ExportTask_POST_ToInstance.sh`スクリプトを、完全修飾クラス名 **Account** と`json` をパラメータとして実行する。 json`パラメータはエクスポートされるデータのフォーマットを示す。 また、`jsont`、`jsonl`、`csv`形式もサポートしている。

   ```bash
   ./ExportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account json
   ```

   JSON応答は、新規エクスポートタスクの作成を示しています。 タスクの`id`に注意：

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
   `jsont`は、バッチクライアント拡張と組み合わせて使用する場合、`*.batch-engine-dat.json`ファイルの必須フォーマットです。 

   出力形式として `json` または `jsonl` を使用する場合、デフォルトですべてのフィールドがエクスポートされます。 フィールドを指定するには、エクスポートしたいフィールドを追加のクエリパラメータ（`fieldNames`）で指定する必要があります。 各フィールドはカンマ（,）で区切る必要があります。 エクスポート形式として `csv` を使用する場合、これは必須のクエリパラメーターとなります。
   ```

1. 現在の `executeStatus` は `INITIAL` である。 バッチエンジンへのタスクの送信を示します。 データをダウンロードするには、`COMPLETED`になるまで待たなければならない。 コマンドラインで`ExportTask_GET_ById.sh`スクリプトを実行し、`1234`をエクスポートタスクのIDに置き換える。

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

   `executeStatus`が`COMPLETED`の場合、エクスポートしたデータをダウンロードできる。 実行されていない場合は、再度コマンドを実行し、タスクの実行が終了したことを確認します。 もし `executeStatus`が`FAILED`と表示されたら、`errorMessage` フィールドをチェックして、何が問題だったのかを理解する。

1. `executeStatus`が`COMPLETED`になったら、`ExportTaskContent_GET_ById.sh`スクリプトを実行し、`1234`をエクスポートタスクのIDに置き換えることで、エクスポートしたデータをダウンロードすることができる。

   ```bash
   ./ExportTaskContent_GET_ById.sh 1234
   ```

   これはエクスポートされたデータを `.zip` ファイルとしてカレントディレクトリにダウンロードする。 ZIPファイルを展開し、適切なアプリケーションを使用してデータを表示します。

1. また、Javaクライアントを使用してThe RESTサービスを呼び出すことができます。 curl`フォルダから`java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java

   ```
1. `ExportTask_POST_ToInstance` クラスを実行する。 able`をクラスの完全修飾名に置き換える。

   ```bash
   java -classpath .:* -DclassName=able ExportTask_POST_ToInstance
   ```

   例えば、`Account`データをエクスポートします：

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account ExportTask_POST_ToInstance
   ```

   JSONレスポンスからエクスポートタスクの`id`に注目する。

1. 次のコマンドで `ExportTask_GET_ById` クラスを実行する。 `1234`をエクスポートタスクのIDに置き換えてください。

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
   ```

1. `executeStatus`に`COMPLETED`と表示されたら、`ExportTaskContent_GET_ById`クラスを実行してデータをダウンロードすることができる。 1234`をエクスポートタスクのIDに置き換えてください。

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTaskContent_GET_ById
   ```

## cURLコマンドの検証

`ExportTask_POST_ToInstance.sh`スクリプトは、cURLコマンドでRESTサービスを呼び出す。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                           | 説明                              |
| :--------------------------------------------------------------------------- | :------------------------------ |
| `-H "Content-Type: application/json"`                                        | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                    | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/export-task/${1}/${2}"` | RESTサービスのエンドポイント                |
| `-u "test@liferay.com:learn"`                                                | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) を介してユーザーを認証する必要があります。 Oauth2 を使用する React アプリケーションのサンプルについては、 [OAuth2によるユーザーの認証](../using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```

## Javaクラスを調べる

`ExportTask_POST_ToInstance.java` クラスは、バッチエンジン関連のサービスを呼び出してデータをエクスポートする。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-21
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                         | 説明                                                        |
| :----------------------------------------------------------------------------- | :-------------------------------------------------------- |
| `ExportTaskResource.Builder builder = ...`                                     | `ExportTaskResource`サービスインスタンスを生成するための`Builder` を取得する。    |
| `ExportTaskResource exportTaskResource = builder.authentication(...).build();` | 基本認証を指定し、`ExportTaskResource` サービスインスタンスを生成する。            |
| `exportTaskResource.postExportTask(...);`                                      | `exportTaskResource.postExportTask`メソッドを呼び出し、データをpostに渡す。 |

このプロジェクトには `com.liferay.headless.batch.engine.client.jar` ファイルが依存関係として含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

```{note}
`main`メソッドのコメントは、クラスの実行を示している。
```

他のJavaクラスの例もこれと似ているが、異なる `ExportTaskResource` メソッドを呼び出している。

```{important}
サービスの詳細については、 [ExportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ExportTaskResource.java) を参照してください。
```

以下は、cURLとJavaを使用して他のBatch Engine export RESTサービスを呼び出す例です。

## ExportTaskのステータスを取得する

以下のcURLまたはJavaコマンドを実行することで、エクスポートタスクのステータスを取得することができます。 `1234`をエクスポートタスクのIDに置き換えてください。

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

`ExportTask_GET_ById` クラスを実行する。 `1234`をエクスポートタスクのIDに置き換えてください。

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

## データをサイトからエクスポートする

以下のcURLまたはJavaコマンドを実行して、サイトからデータをエクスポートできます。 以下の例では、あるサイトからブログ記事をエクスポートしています。 [RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services#identify-the-site-containing-the-data) を探し、`1234`を置き換えてください。 別のエンティティを使用する場合は、cURLスクリプトの完全修飾クラス名パラメーターも更新する必要があります。

### ExportTask_POST_ToSite.sh

コマンド：

```bash
./ExportTask_POST_ToSite.sh com.liferay.headless.delivery.dto.v1_0.BlogPosting json 1234
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToSite.sh
   :language: bash
```

### ExportTask_POST_ToSite.java

`ExportTask_POST_ToSite` クラスを実行する。 1234`をあなたのサイトのIDに、`able`をエクスポートしたいクラスの完全修飾名に置き換えてください：

```bash
java -classpath .:* -DsiteId=1234 -DclassName=able ExportTask_POST_ToSite
```

例えば、`BlogPosting`データをエクスポートする：

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
第2パラメータは `json` で、エクスポートされたデータの出力形式を表示します。 ここでは `jsonl` と `csv` を使用することもできます。 CSVを使用する場合は、エクスポートしたいフィールドをカンマ区切りの文字列で指定し、`exportTaskResource.postExportTask()`メソッドの第5パラメータとして渡すことが必須です。
```

JSON応答には、新しく作成されたエクスポートタスクの情報が表示されます。 その `executeStatus` を追跡するために `id` に注意すること。 完了したら、エクスポートタスクIDを指定して`ExportTaskContent_GET_ById.[java|sh]`を実行し、データをダウンロードすることができる。

## エクスポートデータの内容を取得する

エクスポートしたデータは、以下のcURLコマンドとJavaコマンドでダウンロードできます。 `1234`をエクスポートタスクのIDに置き換える。 その後、カレントディレクトリに`.zip`ファイルとしてダウンロードされる。

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

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) には、ヘッドレスバッチエンジンの全サービスとスキーマが一覧表示され、各サービスを試すためのインターフェースがあります。

## 関連トピック

* [バッチエンジン API の基本 - データのインポート](./batch-engine-api-basics-importing-data.md)
* [データ移行センター](./data-migration-center.md)
