# 候補リストAPIの基本

Liferayは、候補リストの定義 (`ListTypeDefinition`)とそのエントリー(`ListTypeEntry`)を作成・管理するための [`headless-admin-list-types`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-list-type/v1.0/openapi.json) REST APIを提供します。 RESTサービスメニューの`[server]:[port]/o/api` (例: `localhost:8080/o/api`)にあるLiferayのAPIエクスプローラーで利用できるAPIを表示し、テストすることができます。

![headless-admin-list-typeで候補リストのAPIにアクセスします。](./picklists-api-basics/images/01.png)

[`headless-admin-list-types`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-list-type/v1.0/openapi.json) サービスを呼び出して、候補リストを作成・管理します。

## 候補リストを追加する

```{include} /_snippets/run-liferay-dxp.md
```

次にサンプルコードを用意する：

1. [Picklists API Basics](./liferay-v3n6.zip) をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/picklists/liferay-v3n6.zip -O
   ```

   ```bash
   unzip liferay-v3n6.zip
   ```

1. cURLスクリプトを使用して、新しい候補リストをインスタンスに追加します。 コマンドラインで、 `curl`フォルダに移動します。 `ListTypeDefinition_POST_ToInstance.sh`スクリプトを実行します。

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

   JSONのレスポンスには、新しい候補リストが追加されたことが示されています。

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

1. ［**グローバルメニュー**］ &rarr; ［**コントロールパネル**］ &rarr; ［**Picklists**］ に移動します。 新しい候補リストが表示されます。

   ![新しい候補リストが追加されたことを確認します。](./picklists-api-basics/images/02.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出すことができます。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `ListTypeDefinition_POST_ToInstance.java`クラスを実行します。

   ```bash
   java -classpath .:* ListTypeDefinition_POST_ToInstance
   ```

## cURLコマンドの検証

`ListTypeDefinition_POST_ToInstance.sh` スクリプトは、cURLでRESTサービスを呼び出します。

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_POST_ToInstance.sh
   :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                              | 説明                              |
|:------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                           | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                       | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Foo\", \"name_i18n\": {\"en_US\": \"Foo\"}}"`       | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                   | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境の場合は、[OAuth2](../../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`ListTypeDefinition_POST_ToInstance.java`クラスは、`ListType`関連サービスを呼び出して候補リストを追加します。

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-30
```

このクラスは、3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                                                    | 説明                                                                         |
|:--------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------- |
| `ListTypeDefinitionResource.Builder builder = ...`                                                        | `ListTypeDefinitionResource`サービスインスタンスを生成するための`Builder`を取得します。             |
| `ListTypeDefinitionResource listTypeDefinitionResource = builder.authentication(...).build();`            | 基本認証を指定し、`ListTypeDefinitionResource`サービスインスタンスを生成します。                     |
| `ListTypeDefinition listTypeDefinitionResource = listTypeDefinitionResource.postListTypeDefinition(...);` | `listTypeDefinitionResource.postListTypeDefinition`メソッドを呼び出し、投稿するデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.list.type.client`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存情報は、インストール先のAPIエクスプローラーで、`/o/api` (例: <http://localhost:8080/o/api>)から確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラスも同様に、異なる`ListTypeDefinitionResource`メソッドを呼び出します。

```{important}
サービスの詳細は [ListTypeDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-list-type-client/src/main/java/com/liferay/headless/admin/list/type/client/resource/v1_0/ListTypeDefinitionResource.java) を参照ください。
```

以下は、cURLとJavaを使用して、他の `ListTypeDefinition` RESTサービスを呼び出す例です。

## インスタンスから候補リストを取得する

以下のcURLまたはJavaコマンドを実行することで、候補リストの一覧を表示することができます。

### ListTypeDefinitions_GET_FromInstance.sh

コマンド：

```bash
./ListTypeDefinitions_GET_FromInstance.sh
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinitions_GET_FromInstance.sh
   :language: bash
```

### ListTypeDefinitions_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* ListTypeDefinitions_GET_FromInstance
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinitions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

インスタンスの`Picklist`オブジェクトがJSONで表示されます。

## 候補リストを取得する

以下のcURLまたはJavaコマンドで、特定の候補リストを取得します。

```{tip}
インスタンスの``Picklist`` IDを取得するには、``ListTypeDefinitions_GET_FromInstance.[java|sh]``を使用します。
```

### ListTypeDefinition_GET_ById.sh

コマンド：

```bash
./ListTypeDefinition_GET_ById.sh 1234
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_GET_ById.sh
   :language: bash
```

### ListTypeDefinition_GET_ById.java

コマンド：

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_GET_ById
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`Picklist`フィールドはJSONで表示されます。

## 候補リストへのパッチ

cURLとJavaパッチコマンドで、既存の候補リストを編集します。 `1234`を候補リストのIDに置き換えます。

### ListTypeDefinition_PATCH_ById.sh

コマンド：

```bash
./ListTypeDefinition_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PATCH_ById.sh
   :language: bash
```

### ListTypeDefinition_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_PATCH_ById
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## 候補リストを配置する

cURLとJavaの `put` コマンドで、既存の候補リストを完全に上書きします。 `1234`を候補リストのIDに置き換えます。

### ListTypeDefinition_PUT_ById.sh

コマンド：

```bash
./ListTypeDefinition_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/curl/ListTypeDefinition_PUT_ById.sh
   :language: bash
```

### ListTypeDefinition_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_PUT_ById
```

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-31
```

## 候補リストを削除する

cURLとJavaの `delete` コマンドで既存の候補リストを削除します。 `1234`を候補リストのIDに置き換えます。

### ListTypeDefinition_DELETE_ById.sh

コマンド：

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

コード：

```{literalinclude} ./picklists-api-basics/resources/liferay-v3n6.zip/java/ListTypeDefinition_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## 候補リストエントリサービス

候補リストを作成したら、以下のサービスを利用して、候補リストのエントリーを作成・管理します。 `ListTypeEntry`のcURLコマンドとJavaクラスは`ListTypeDefinition`のように機能します。 サービスによっては、候補リストIDを渡す必要があります。

| ファイル                                                     | 説明                          |
|:-------------------------------------------------------- |:--------------------------- |
| `ListTypeEntries_GET_FromListTypeDefinition.[java\|sh]` | 候補リストから候補リストエントリーの一覧を取得します。 |
| `ListTypeEntry_DELETE_ById.[java\|sh]`                  | 候補リストエントリーを削除します。           |
| `ListTypeEntry_GET_ById[java\|sh]`                      | IDで特定の候補リストエントリーを取得します。     |
| `ListTypeEntry_POST_ToListTypeDefinition.[java\|sh]`    | 候補リストにエントリーを投稿します。          |
| `ListTypeEntry_PUT_ById.[java\|sh]`                     | 候補リストエントリーを配置します。           |

[APIエクスプローラー](../../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`ListTypeDefinition`と`ListTypeEntry`のすべてのサービスとスキーマが表示され、各サービスをテストするインターフェースがあります。

## 関連トピック

* [候補リストの使用](./using-picklists.md)
* [候補リストのエクスポートとインポート](./exporting-and-importing-picklists.md)
