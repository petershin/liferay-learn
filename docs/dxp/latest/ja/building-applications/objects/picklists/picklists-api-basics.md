# ピックリストAPIの基本

[ピックリストの作成と管理](./using-picklists.md) アプリケーションメニューから、または REST API を使用して作成することができます。 [`headless-admin-list-types`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-list-type/v1.0/openapi.json) サービスを呼び出して、ピックリストを作成・管理します。

## ピックリストの追加

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら。

1. [Picklists API Basics](./liferay-v3n6.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/building-applications/objects/picklists/liferay-v3n6.zip -O
   ```

   ```bash
   unzip liferay-v3n6.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しいピックリストを追加します。 コマンドラインで、 `curl` フォルダに移動します。 `ListTypeDefinition_POST_ToInstance.sh` スクリプトを実行します。

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しいピックリストが追加されたことを示しています。

   ```json
   "dateCreated" : "2022-11-17T18:42:13Z",
   "dateModified" : "2022-11-17T18:42:13Z",
   "id" : 47502,
   "listTypeEntries" : [ ],
   "name" : "Foo",
   "name_i18n" : {
      "en-US" : "Foo"
   }
   ```

1. **Global Menu** &rarr; **Control Panel** &rarr; **Picklists** に移動します。 新しいピックリストが表示されます。

   ![新しいピックリストが追加されたことを確認します。](./picklists-api-basics/images/01.png)

1. また、Javaクライアントを使用してRESTサービスを呼び出すことも可能です。 `java` フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `ListTypeDefinition_POST_ToInstance.java` クラスを実行します。

   ```bash
   java -classpath .:* ListTypeDefinition_POST_ToInstance
   ```

## cURLコマンドの検証

`ListTypeDefinition_POST_ToInstance.sh` スクリプトは、cURL を使用して REST サービスを呼び出します。

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_POST_ToInstance.sh
   :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                              | 説明                              |
|:------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                           | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                       | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Foo\", \"name_i18n\": {\"en_US\": \"Foo\"}}"`       | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                   | 基本的な認証情報                        |

```{note}
ここでは、デモのためにベーシック認証を使用しています。 本番環境の場合は、[OAuth2](../../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`ListTypeDefinition_POST_ToInstance.java` クラスは、 `ListType`関連サービスを呼び出して、ピックリストを追加します。

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

このクラスは、3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                                                    | 説明                                                                         |
|:--------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------- |
| `ListTypeDefinitionResource.Builder builder = ...`                                                        | `Builder` `ListTypeDefinitionResource` サービスインスタンスを生成するためのビルダーを取得する。        |
| `ListTypeDefinitionResource listTypeDefinitionResource = builder.authentication(...).build();`            | Basic 認証を指定し、 `ListTypeDefinitionResource` サービスインスタンスを生成します。               |
| `ListTypeDefinition listTypeDefinitionResource = listTypeDefinitionResource.postListTypeDefinition(...);` | `listTypeDefinitionResource.postListTypeDefinition` メソッドを呼び出し、postにデータを渡す。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.list.type.client`ファイルが含まれていることに注意してください。 インストールの API エクスプローラで、すべての REST アプリケーションのクライアント JAR 依存情報を `/o/api` (例: <http://localhost:8080/o/api>) で確認することができます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラスも同様に、異なる `ListTypeDefinitionResource` メソッドを呼び出します。

```{important}
サービスの詳細は [ListTypeDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless-admin-list-type/headless-admin-list-type-client/src/main/java/com/liferay/headless/admin/list/type/client/resource/v1_0/ListTypeDefinitionResource.java) を参照ください。
```

以下は、cURL と Java を使用して、他の `ListTypeDefinition` REST サービスを呼び出す例です。

## インスタンスからピックリストを取得する

以下のcURLまたはJavaコマンドを実行することで、Picklistを一覧表示することができます。

### ListTypeDefinitions_GET_FromInstance.sh

コマンド:

```bash
./ListTypeDefinitions_GET_FromInstance.sh
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinitions_GET_FromInstance.sh
   :language: bash
```

### ListTypeDefinitions_GET_FromInstance.java

コマンド:

```bash
java -classpath .:* ListTypeDefinitions_GET_FromInstance
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinitions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

Instance の `Picklist` オブジェクトが JSON で表示されます。

## ピックリストの取得

以下のcURLまたはJavaコマンドで、特定のpicklistを取得します。

```{tip}
インスタンスの ``Picklist`` ID を取得するには、 ``ListTypeDefinitions_GET_FromInstance.[java|sh]`` を使用してください。
```

### ListTypeDefinition_GET_ById.sh

コマンド:

```bash
./ListTypeDefinition_GET_ById.sh 1234
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_GET_ById.sh
   :language: bash
```

### ListTypeDefinition_GET_ById.java

コマンド:

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_GET_ById
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`Picklist` フィールドはJSONで表示されます。

## ピックリストのパッチ

cURLとJavaパッチコマンドで既存のpicklistを編集します。 `1234` をピックリストのIDに置き換えてください。

### ListTypeDefinition_PATCH_ById.sh

コマンド:

```bash
./ListTypeDefinition_PATCH_ById.sh 1234
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PATCH_ById.sh
   :language: bash
```

### ListTypeDefinition_PATCH_ById.java

コマンド:

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_PATCH_ById
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## ピックリストを置く

cURL と Java `put` コマンドで既存の picklist を完全に上書きします。 `1234` をピックリストのIDに置き換えてください。

### ListTypeDefinition_PUT_ById.sh

コマンド:

```bash
./ListTypeDefinition_PUT_ById.sh 1234
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PUT_ById.sh
   :language: bash
```

### ListTypeDefinition_PUT_ById.java

コマンド:

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_PUT_ById
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## 選択リストを削除します

cURL と Java `delete` コマンドで既存の picklist を削除します。 `1234` をピックリストのIDに置き換えてください。

### ListTypeDefinition_DELETE_ById.sh

コマンド:

```bash
./Picklist_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_DELETE_ById.sh
   :language: bash
```

### ListTypeDefinition_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_DELETE_ById
```

コード:

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## ピックリストエントリーサービス

ピックリストを作成したら、以下のサービスを利用して、ピックリストのエントリーを作成・管理します。 `ListTypeEntry` のcURLコマンドとJavaクラスは、 `ListTypeDefinition`のように動作します。 サービスによっては、ピックリストのIDを渡す必要があります。

| ファイル                                                     | 説明                             |
|:-------------------------------------------------------- |:------------------------------ |
| `ListTypeEntries_GET_FromListTypeDefinition.[java\|sh]` | ピックリストからピックリストエントリーのリストを取得します。 |
| `ListTypeEntry_DELETE_ById.[java\|sh]`                  | ピックリストエントリーを削除する。              |
| `ListTypeEntry_GET_ById[java\|sh]`                      | IDで特定のピックリストエントリーを取得します。       |
| `ListTypeEntry_POST_ToListTypeDefinition.[java\|sh]`    | ピックリストにエントリーを投稿します。            |
| `ListTypeEntry_PUT_ById.[java\|sh]`                     | ピックリストエントリーを置く。                |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) `ListTypeDefinition` と `ListTypeEntry` のすべてのサービスとスキーマを表示し、各サービスをテストするインター フェースを備えています。
