# Batch Engine APIの基本 - データのインポート

LiferayのHeadless Batch Engineは、データのインポートとエクスポートを行うためのREST APIを提供しています。 これらのサービスを呼び出して、Liferayにデータをインポートします。

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## データのインポート

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Batch Engine API Basics](./liferay-g4j2.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. データをインポートするには、インポートするエンティティの完全修飾クラス名が必要です。 クラス名は、インストールされているAPIエクスプローラから、 `/o/api`で取得することができます。 **Schemas** セクションまでスクロールダウンし、インポートしたいエンティティの `x-class-name` フィールドをメモしておきます。

1. 以下のcURLスクリプトを使用して、Liferayインスタンスにアカウントをインポートしてください。 コマンドラインで、 `curl` フォルダに移動します。 `ImportTask_POST_ToInstance.sh` スクリプトを、完全修飾クラス名 **Account** をパラメータとして実行します。

   ```bash
   ./ImportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account
   ```

   JSONレスポンスには、新しいインポートタスクの作成が表示されます。 タスクの `id` に注意してください。

   ```bash
   {
   "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
   "contentType" : "JSON",
   "errorMessage" : "",
   "executeStatus" : "INITIAL",
   "externalReferenceCode" : "4a6ab4b0-12cc-e8e3-fc1a-4726ebc09df2",
   "failedItems" : [ ],
   "id" : 1234,
   "importStrategy" : "ON_ERROR_FAIL",
   "operation" : "CREATE",
   "processedItemsCount" : 0,
   "startTime" : "2022-10-19T14:19:43Z",
   "totalItemsCount" : 0
   }
   ```

1. 現在の `executeStatus` は `INITIAL`です。 Batch Engineへのタスク投入を表す。 これが `COMPLETED` になるまで待って、データを確認する必要があります。 コマンドラインで、 `ImportTask_GET_ById.sh` スクリプトを実行し、 `1234` をインポートタスクのIDに置き換えます。

   ```bash
   ./ImportTask_GET_ById.sh 1234
   ```

   ```bash
   {
   "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
   "contentType" : "JSON",
   "endTime" : "2022-10-19T12:18:59Z",
   "errorMessage" : "",
   "executeStatus" : "COMPLETED",
   "externalReferenceCode" : "7d256faa-9b7e-9589-e85c-3a72f68b8f08",
   "failedItems" : [ ],
   "id" : 1234,
   "importStrategy" : "ON_ERROR_FAIL",
   "operation" : "CREATE",
   "processedItemsCount" : 2,
   "startTime" : "2022-10-19T12:18:58Z",
   "totalItemsCount" : 2
   }
   ```

   `executeStatus` が `COMPLETED`であれば、インポートデータを確認することができます。 そうでない場合は、再度コマンドを実行し、タスクの実行が終了したことを確認します。 `executeStatus` が `FAILED`を示している場合、何が問題だったのかを理解するために `errorMessage` フィールドをチェックしてください。

1. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **アカウント** に移動して、インポートしたデータを確認します。 2つの新しいアカウントが追加されていることを確認します。

   ![2つの新しいアカウントが追加されたことを確認します。](./batch-engine-api-basics/images/01.png)

1. また、Javaクライアントを使用してThe RESTサービスを呼び出すことができます。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `ImportTask_POST_ToInstance` クラスを実行します。 `able` をクラスの完全修飾名に、 `baker` をインポートしたい JSON データに置き換えてください。

   ```bash
   java -classpath .:* -DclassName=able -Ddata=baker ImportTask_POST_ToInstance
   ```

   例えば、 `アカウント` のデータをインポートします。

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]" ImportTask_POST_ToInstance
   ```

   JSONレスポンスから、インポートタスクの `id` に注目してください。

1. `ImportTask_GET_ById` クラスを実行します。 `1234` をインポートタスクのIDに置き換えてください。 `executeStatus` が `COMPLETED`と表示されたら、上記の手順でデータを確認することができます。

   ```bash
   java -cp .:* -DimportTaskId=1234 ImportTask_GET_ById
   ```

## cURLコマンドの検証

`ImportTask_POST_ToInstance.sh` スクリプトは、cURL を使用して REST サービスを呼び出します。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                                | 説明                              |
|:----------------------------------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                                             | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                                         | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}"`                                           | RESTサービスのエンドポイント                |
| `-d "[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                                                     | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本認証を使用しています。 本番環境では、 [OAuth2](https://learn.liferay.com/dxp/latest/ja/headless-delivery/using-oauth2.html) 経由でユーザーを認可する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`ImportTask_POST_ToInstance.java` クラスは、Batch Engine 関連サービスを呼び出してデータを取り込みます。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                     | 説明                                                                                                                                                                                                     |
|:------------------------------------------ |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ImportTaskResource.Builder builder = ...` | </code> `ImportTaskResource サービスインスタンスを生成するための Builder を取得する。` `</td>
</tr>
<tr>
  <td align="left"><code>ImportTaskResource importTaskResource = builder.authentication(...).build();` | 基本認証を指定し、 `ImportTaskResource` サービスインスタンスを生成します。 |
| `importTaskResource.postImportTask(...);`  | `importTaskResource.postImportTask` メソッドを呼び出し、postにデータを渡す。                                                                                                                                             |

プロジェクトには、依存関係として`com.liferay.headless.batch.engine.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスは、これと似ていますが、異なる `ImportTaskResource` メソッドを呼び出します。

```{important}
サービスの詳細は [ImportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ImportTaskResource.java) を参照ください。
```

以下は、cURLとJavaを使用して他のBatch EngineインポートRESTサービスを呼び出す例です。

## ImportTaskのステータスを取得します。

以下のcURLまたはJavaコマンドを実行することで、インポートタスクのステータスを取得することができます。 `1234` をインポートタスクのIDに置き換えてください。

### ImportTask_GET_ById.sh

コマンド:

```bash
./ImportTask_GET_ById.sh 1234
```

コード:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_GET_ById.sh
   :language: bash
```

### ImportTask_GET_ById.java

`ImportTask_GET_ById` クラスを実行します。 `1234` をインポートタスクのIDに置き換えてください。

コマンド：

```bash
java -classpath .:* -DimportTaskId=1234 ImportTask_GET_ById
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## サイトへのデータ取り込み

以下のcURLまたはJavaコマンドを実行することで、サイトにデータをインポートすることができます。 この例では、ブログの記事をサイトにインポートしています。 [あなたのサイトのID](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html#identify-the-site-containing-the-data) を探し、 `1234` をそれに置き換えてください。 別のエンティティを使用する場合は、cURLスクリプトの完全修飾クラス名パラメータとインポートするデータも更新する必要があります。

### ImportTask_POST_ToSite.sh

コマンド：

```bash
./ImportTask_POST_ToSite.sh com.liferay.headless.delivery.dto.v1_0.BlogPosting 1234
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_POST_ToSite.sh
   :language: bash
```

### ImportTask_POST_ToSite.java

`ImportTask_POST_ToSite` クラスを実行します。 `1234` をサイトの ID、 `able` をクラスの完全修飾名、 `baker` をインポートしたい JSON データに置き換えてください。

コマンド:

```bash
java -classpath .:* -DsiteId=1234 -DclassName=able -Ddata=baker ImportTask_POST_ToSite
```

例えば、 `BlogPosting` のデータをインポートします。

```bash
java -classpath .:* -DsiteId=1234 -DclassName=com.liferay.headless.delivery.dto.v1_0.BlogPosting -Ddata="[{\"articleBody\": \"Foo\", \"headline\": \"Able\"}, {\"articleBody\": \"Bar\", \"headline\": \"Baker\"}]" ImportTask_POST_ToSite
```

コード:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 8-22
```

JSONレスポンスには、新しく作成されたインポートタスクの情報が表示されます。 `id` に注意して、その `executeStatus`を追跡してください。

## インポートしたデータを置く

Batch Engineを使用して既存のデータを完全に上書きするには、以下のcURLまたはJavaコマンドを使用します。 この例では、既存のアカウントデータを更新しています。 別のエンティティを使用する場合は、cURLスクリプトで完全修飾クラス名パラメータと上書きするデータを更新する必要があります。

### ImportTask_PUT_ById.sh

コマンド：

```bash
./ImportTask_PUT_ById.sh com.liferay.headless.admin.user.dto.v1_0.Account
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_PUT_ById.sh
   :language: bash
```

### ImportTask_PUT_ById.java

`ImportTask_PUT_ById` クラスを実行します。 `able` をクラスの完全修飾名に、 `baker` をJSONデータに置き換えて、そこにあるものを上書きしてください。 データには、上書きしたいエンティティのIDが含まれている必要があります。

コマンド:

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_PUT_ById
```

例えば、既存の `アカウント` のデータを上書きしたい場合は、 `1234` と `5678` を既存のアカウントの ID に置き換えます。

```bash
java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"id\" :1234, \"name\": \"Bar\", \"type\": \"business\"}, {\"id\": 5678, \"name\": \"Goo\", \"type\": \"guest\"}]" ImportTask_PUT_ById
```

コード:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## インポートデータを削除する

Batch Engineを使用して既存のデータを削除するには、以下のcURLまたはJavaコマンドを使用します。 この例では、アカウントデータを削除しています。 別のエンティティを使用する場合は、完全修飾クラス名パラメータを更新し、さらにcURLスクリプトで削除するデータを更新する必要があります。

### ImportTask_DELETE_ById.sh

コマンド:

```bash
./ImportTask_DELETE_ById.sh com.liferay.headless.admin.user.dto.v1_0.Account
```

コード:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_DELETE_ById.sh
   :language: bash
```

### ImportTask_DELETE_ById.java

`ImportTask_DELETE_ById` クラスを実行します。 `able` をクラスの完全修飾名に、 `baker` をJSONデータに置き換えて、そこにあるものを上書きしてください。 データには、削除したいエンティティのIDが含まれている必要があります。

コマンド：

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_DELETE_ById
```

例えば、 `アカウント` のデータを削除する場合、 `1234` と `5678` を既存のアカウントの ID に置き換えてください。

```bash
java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"id\": 1234}, {\"id\": 5678}]" ImportTask_DELETE_ById
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## インポートデータの内容を取得する

インポートしたデータは、以下のcURLやJavaコマンドで取得することができます。 `1234` をインポートタスクのIDに置き換えてください。 そして、カレントディレクトリに `.zip` ファイルとしてダウンロードされます。

### ImportTaskContent_GET_ById.sh

コマンド：

```bash
./ImportTaskContent_GET_ById.sh 1234
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTaskContent_GET_ById.sh
   :language: bash
```

### ImportTaskContent_GET_ById.java

コマンド

```bash
java -classpath .:* -DimportTaskId=1234 ImportTaskContent_GET_ById
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTaskContent_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 11-27
```

[API Explorer](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html) には、Headless Batch Engine の全サービスとスキーマがリストアップされており、各サービスを試すためのインターフェイスが用意されています。

## 追加情報

* [Batch Engine APIの基本 - データのエクスポート](./batch-engine-api-basics-exporting-data.md)
