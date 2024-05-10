# バッチエンジンAPIの基本 - データのインポート

Liferayのヘッドレスバッチエンジンは、データのインポートやエクスポートを行うためのREST APIを提供します。 これらのサービスを呼び出して、Liferayにデータをインポートします。

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## データのインポート

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順に従ってください：

1. [Batch Engine API Basics](./liferay-g4j2.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. データをインポートするには、インポートするエンティティの完全修飾クラス名が必要です。 クラス名は、インストールされているAPI Explorerの `/o/api` から取得できる。 **スキーマ** セクションまでスクロールダウンし、インポートしたいエンティティの`x-class-name`フィールドをメモする。

1. 以下のcURLスクリプトを使用して、Liferayインスタンスにアカウントをインポートします。 コマンドラインで `curl` フォルダに移動します。 `ImportTask_POST_ToInstance.sh`スクリプトを **Account** の完全修飾クラス名をパラメータとして実行する。

   ```bash
   ./ImportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account
   ```

   JSON応答は、新しいインポートタスクの作成を示しています。 タスクの`id`に注意：

   ```json
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

1. 現在の `executeStatus` は `INITIAL` である。 バッチエンジンへのタスクの送信を示します。 データを確認するためには、これが`COMPLETED`になるまで待たなければならない。 コマンドラインで`ImportTask_GET_ById.sh`スクリプトを実行し、`1234`をインポートタスクのIDに置き換える。

   ```bash
   ./ImportTask_GET_ById.sh 1234
   ```

   ```json
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

   `executeStatus`が`COMPLETED`の場合、インポートしたデータを確認することができる。 実行されていない場合は、再度コマンドを実行し、タスクの実行が終了したことを確認します。 もし `executeStatus`が`FAILED`と表示されたら、`errorMessage` フィールドをチェックして、何が問題だったのかを理解する。

1. **グローバルメニュー**( [アプリケーションメニューアイコン](../../images/icon-applications-menu.png) )を開き、 **コントロールパネル** &rarr; **アカウント** に移動して、インポートされたデータを確認します。 新しいアカウントが2つ追加されたことを確認します。

   ![Verify that two new accounts have been added.](./batch-engine-api-basics/images/01.png)

1. また、Javaクライアントを使用してThe RESTサービスを呼び出すことができます。 `curl`フォルダから`java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `ImportTask_POST_ToInstance` クラスを実行する。 `able`をクラスの完全修飾名に、`baker`をインポートしたいJSONデータに置き換える。

   ```bash
   java -classpath .:* -DclassName=able -Ddata=baker ImportTask_POST_ToInstance
   ```

   例えば、`Account` データをインポートする：

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]" ImportTask_POST_ToInstance
   ```

   JSONレスポンスから、インポートタスクの`id`に注目してほしい。

1. `ImportTask_GET_ById` クラスを実行する。 `1234`をインポートタスクのIDに置き換えてください。 `executeStatus`に`COMPLETED`と表示されたら、上記の手順でデータを確認することができる。

   ```bash
   java -cp .:* -DimportTaskId=1234 ImportTask_GET_ById
   ```

## cURLコマンドの検証

`ImportTask_POST_ToInstance.sh`スクリプトはcURLを使ってRESTサービスを呼び出す。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                | 説明                              |
| :------------------------------------------------------------------------------------------------ | :------------------------------ |
| `-H "Content-Type: application/json"`                                                             | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                         | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}"`                           | RESTサービスのエンドポイント                |
| `-d "[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                                     | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) を介してユーザーを認証する必要があります。 Oauth2 を使用するサンプル React アプリケーションについては、 [Use OAuth2 to authorize users](../using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`ImportTask_POST_ToInstance.java` クラスはバッチエンジン関連のサービスを呼び出してデータをインポートする。

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                         | 説明                                                        |
| :----------------------------------------------------------------------------- | :-------------------------------------------------------- |
| `ImportTaskResource.Builder builder = ...`                                     | `ImportTaskResource`サービスインスタンスを生成するための`Builder` を取得する。    |
| `ImportTaskResource importTaskResource = builder.authentication(...).build();` | 基本認証を指定し、`ImportTaskResource` サービスインスタンスを生成する。            |
| `importTaskResource.postImportTask(...);`                                      | `importTaskResource.postImportTask`メソッドを呼び出し、データをpostに渡す。 |

このプロジェクトには `com.liferay.headless.batch.engine.client.jar` ファイルが依存関係として含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

```{note}
`main`メソッドのコメントは、クラスの実行を示している。
```
他のJavaクラスの例もこれと似ているが、異なる `ImportTaskResource` メソッドを呼び出している。

```{important}
サービスの詳細については、 [ImportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ImportTaskResource.java) を参照。
```

以下は、cURLとJavaを使用して他のBatch Engine import RESTサービスを呼び出す例です。

## ImportTaskのステータスを取得する

以下のcURLまたはJavaコマンドを実行することで、インポートタスクのステータスを取得することができます。 `1234`をインポートタスクのIDに置き換えてください。

### ImportTask_GET_ById.sh

コマンド：

```bash
./ImportTask_GET_ById.sh 1234
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_GET_ById.sh
   :language: bash
```

### ImportTask_GET_ById.java

`ImportTask_GET_ById` クラスを実行する。 `1234`をインポートタスクのIDに置き換えてください。

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

## データをサイトにインポートする

次のcURLまたはJavaコマンドを実行して、サイトにデータをインポートできます。 この例では、ブログの記事をサイトにインポートしています。 [RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services#identify-the-site-containing-the-data) を探し、`1234`を置き換えてください。 別のエンティティを使用する場合は、cURLスクリプトでインポートする完全修飾クラス名パラメーターとデータも更新する必要があります。

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

`ImportTask_POST_ToSite` クラスを実行する。 `1234` をあなたのサイトの ID に、`able` をクラスの完全修飾名に、`baker` をインポートしたい JSON データに置き換える。

コマンド：

```bash
java -classpath .:* -DsiteId=1234 -DclassName=able -Ddata=baker ImportTask_POST_ToSite
```

例えば、`BlogPosting` データをインポートする：

```bash
java -classpath .:* -DsiteId=1234 -DclassName=com.liferay.headless.delivery.dto.v1_0.BlogPosting -Ddata="[{\"articleBody\": \"Foo\", \"headline\": \"Able\"}, {\"articleBody\": \"Bar\", \"headline\": \"Baker\"}]" ImportTask_POST_ToSite
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 8-22
```

JSON応答には、新しく作成されたインポートタスクの情報が表示されます。 その `executeStatus` を追跡するために `id` に注意すること。

## インポートデータを配置する

以下のcURLまたはJavaコマンドにより、バッチエンジンを使用して、既存のデータを完全に上書きできます。 この例では、既存のアカウントデータを更新しています。 他のエンティティを使用する場合は、cURLスクリプトで上書きする完全修飾クラス名パラメーターとデータを更新する必要があります。

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

`ImportTask_PUT_ById` クラスを実行する。 `able`をクラスの完全修飾名に、`baker`をJSONデータに置き換えて上書きする。 データには、上書きしたいエンティティのIDが含まれているはずです。

コマンド：

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_PUT_ById
```

例えば、既存の`Account`のデータを上書きしたい場合は、`1234`と`5678`を既存のAccountのIDに置き換える：

```bash
java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"id\" :1234, \"name\": \"Bar\", \"type\": \"business\"}, {\"id\": 5678, \"name\": \"Goo\", \"type\": \"guest\"}]" ImportTask_PUT_ById
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## インポートデータを削除する

以下のcURLまたはJavaコマンドにより、バッチエンジンを使用して、既存のデータを削除できます。 例では、アカウントデータを削除しています。 他のエンティティを使用する場合は、cURLスクリプトで削除する完全修飾クラス名パラメーターとデータも更新する必要があります。

### ImportTask_DELETE_ById.sh

コマンド：

```bash
./ImportTask_DELETE_ById.sh com.liferay.headless.admin.user.dto.v1_0.Account
```

コード：

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_DELETE_ById.sh
   :language: bash
```

### ImportTask_DELETE_ById.java

`ImportTask_DELETE_ById` クラスを実行する。 `able`をクラスの完全修飾名に、`baker`をJSONデータに置き換えて上書きする。 データには、削除したいエンティティのIDが含まれているはずです。

コマンド：

```bash
java -classpath .:* -DclassName=able -Ddata=baker ImportTask_DELETE_ById
```

例えば、`アカウント`のデータを削除したい場合は、`1234`と`5678`を既存のアカウントのIDに置き換える：

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

インポートしたデータは、以下のcURLコマンドとJavaコマンドで取得することができます。 `1234`をインポートタスクのIDに置き換える。 その後、カレントディレクトリに`.zip`ファイルとしてダウンロードされる。

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

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) には、ヘッドレスバッチエンジンの全サービスとスキーマが一覧表示され、各サービスを試すためのインターフェースがあります。

## 関連トピック

* [バッチエンジン API の基本 - データのエクスポート](./batch-engine-api-basics-exporting-data.md) 
* [データ移行センター](./data-migration-center.md) 
