# ヘッドレスAPIでオブジェクトを管理する

{bdg-secondary}`liferay 7.4+`

[アプリケーションメニューから](../creating-and-managing-objects.md) オブジェクトを作成・管理できますが、Liferay の REST API を使うこともできます。 これらのサービスを呼び出して、オブジェクトを作成・管理する。 Liferayのコードベースでは、オブジェクトは **オブジェクト定義** と呼ばれています。 各オブジェクト定義は、さまざまなオブジェクト・フィールドで構成されている。

## オブジェクト定義とオブジェクト・フィールドの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. 提供されているサンプルコードをダウンロードし、解凍します：

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/creating-and-managing-objects/liferay-r4g6.zip -O
   ```

   ```bash
   unzip liferay-r4g6.zip
   ```

1. cURLスクリプトを使用して、新しいオブジェクト定義をインスタンスに追加します。 コマンドラインで `curl` フォルダに移動します。 `ObjectDefinition_POST_ToInstance.sh`スクリプトを実行する。

   ```bash
   ./ObjectDefinition_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しいオブジェクト定義が追加されたことを示している：

   ```json
   "active" : false,
   "dateCreated" : "2023-05-31T16:51:18Z",
   "dateModified" : "2023-05-31T16:51:18Z",
   "defaultLanguageId" : "en_US",
   "enableCategorization" : true,
   "enableComments" : false,
   "enableObjectEntryHistory" : false,
   "externalReferenceCode" : "4574eea8-03e9-d4c6-b9f9-23368b94350c",
   "id" : 44525,
   "label" : {
     "en_US" : "Foo"
   },
   "name" : "Foo",
   "objectActions" : [ ],
   ...
   "pluralLabel" : {
     "en_US" : "Foos"
   },
   "portlet" : false,
   "restContextPath" : "/o/c/foos",
   "scope" : "company",
   "status" : {
      "code" : 2,
      "label" : "draft",
      "label_i18n" : "Draft"
   },
   "system" : false,
   "titleObjectFieldName" : "id"
   ```

1. **Global Menu** &rarr; **Applications** &rarr; **Objects** に移動します。 新しいオブジェクトが追加されたことを確認する。

   ![See that a new object definition has been added.](./managing-objects-with-headless-apis/images/01.png)

   Foo_オブジェクトをクリックする。 オブジェクトのID番号をメモする。

1. オブジェクト定義に新しいオブジェクト・フィールドを追加するには、cURLスクリプトを使用します。 コマンドラインで、`ObjectField_POST_ToObjectDefinition.sh`スクリプトを実行する。 1234をあなたのオブジェクトのIDに置き換えてください。

   ```bash
   ./ObjectField_POST_ToObjectDefinition.sh 1234
   ```

1. Liferayで **Foo** オブジェクトをもう一度クリックします。 Fields_タブをクリックする。 新しいエイブル・フィールドが追加された。

   ![See that a new object field has been added.](./managing-objects-with-headless-apis/images/02.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできる。 curl`フォルダから`java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `ObjectDefinition_POST_ToInstance.java`クラスを実行する：

   ```bash
   java -classpath .:* ObjectDefinition_POST_ToInstance
   ```

1. **Foo**オブジェクトのID番号に注意。 次に `ObjectField_POST_ToObjectDefinition.java` クラスを実行する。 1234をあなたのオブジェクトのIDに置き換えてください。

   ```bash
   java -classpath .:* -DobjectDefinitionId=1234 ObjectField_POST_ToObjectDefinition
   ```

新しく作成されたオブジェクトはまだドラフト状態です。 公開する前に、必要な変更や修正を加えてください。 オブジェクトがパブリッシュされると、編集は無効になります。 詳しくは [オブジェクトドラフトの公開](../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) を参照のこと。

## cURLコマンドを調べる

`ObjectDefinition_POST_ToInstance.sh`スクリプトはcURLコマンドでRESTサービスを呼び出す。

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                                          | 説明                          |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------- |
| `-H "Content-Type: application/json"`                                                                                       | リクエストボディのフォーマットをJSONで定義します。 |
| `-X POST`                                                                                                                   | 指定されたエンドポイントで起動するHTTPメソッド   |
| `"http://localhost:8080/o/object-admin/v1.0/object-definitions"`                                                            | RESTサービスのエンドポイント            |
| `-d "{"label": {"en_US": "Foo"}, "name": "Foo", "pluralLabel": {"en_US": "Foos"}, "scope": "company"}"` | お客様が掲載を希望するデータ              |
| `-u "test@liferay.com:learn"`                                                                                               | 基本的な認証情報                    |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../../headless-delivery/using-oauth2.md) を介してユーザーを認証する必要があります。 OAuth2 を使用する React アプリケーションのサンプルについては、 [OAuth2によるユーザーの認証](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`ObjectDefinition_POST_ToInstance.java` クラスは、関連するサービスを呼び出してオブジェクト定義を追加する。

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                                     | 説明                                                                         |
| :----------------------------------------------------------------------------------------- | :------------------------------------------------------------------------- |
| `ObjectDefinitionResource.Builder builder = ...`                                           | `ObjectDefinitionResource`サービスインスタンスを生成するための`Builder` を取得する。               |
| `ObjectDefinitionResource objectDefinitionResource = builder.authentication(...).build();` | 基本認証を指定し、`ObjectDefinitionResource` サービスインスタンスを生成する。                       |
| `ObjectDefinition objectDefinition = objectDefinitionResource.postObjectDefinition(...);`  | `objectDefinitionResource.postObjectDefinition` メソッドを呼び出して、post にデータを渡します。 |

このプロジェクトには依存関係として `com.liferay.object.admin.rest.client.jar` ファイルが含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

```{note}
`main`メソッドのコメントは、クラスの実行を示している。
```

他のJavaクラスの例は、このクラスと似ていますが、異なるメソッドを呼び出しています。

```{important}
サービスの詳細については、 [ObjectDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/object/object-admin-rest-client/src/main/java/com/liferay/object/admin/rest/client/resource/v1_0/ObjectDefinitionResource.java) を参照のこと。
```

以下は、cURLとJavaを使って、関連する他のRESTサービスを呼び出す例です。

## インスタンスからオブジェクトを取得する

以下のcURLまたはJavaコマンドを実行することで、オブジェクト定義を一覧することができる。

### ObjectDefinitions_GET_FromInstance.sh

コマンド：

```bash
./ObjectDefinitions_GET_FromInstance.sh
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinitions_GET_FromInstance.sh
   :language: bash
```

### ObjectDefinitions_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* ObjectDefinitions_GET_FromInstance
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinitions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

インスタンスのオブジェクト定義はJSONで表示される。

## オブジェクト定義の取得

以下のcURLまたはJavaコマンドで、特定のオブジェクト定義を取得する。

```{tip}
インスタンスの ``ObjectDefinition`` ID を取得するには ``ObjectDefinitions_GET_FromInstance.[java|sh]`` を使用してください。
```
### ObjectDefinition_GET_ById.sh

コマンド：

```bash
./ObjectDefinition_GET_ById.sh 1234
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_GET_ById.sh
   :language: bash
```

### ObjectDefinition_GET_ById.java

コマンド：

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_GET_ById
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

オブジェクト定義のフィールドはJSONで表示される。

## オブジェクト定義のパッチ

以下のcURLコマンドとJavaコマンドを使って、既存のオブジェクト定義を部分的に編集する。 1234`をオブジェクト定義のIDに置き換えてください。

### ObjectDefinition_PATCH_ById.sh

コマンド：

```bash
./ObjectDefinition_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_PATCH_ById.sh
   :language: bash
```

### ObjectDefinition_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PATCH_ById
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

## オブジェクトの定義を置く

以下のcURLとJavaコマンドで、既存のオブジェクト定義を完全に上書きする。 1234`をオブジェクト定義のIDに置き換えてください。

### ObjectDefinition_PUT_ById.sh

コマンド：

```bash
./ObjectDefinition_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_PUT_ById.sh
   :language: bash
```

### ObjectDefinition_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PUT_ById
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-33
```

## オブジェクト定義の削除

以下のcURLコマンドとJavaコマンドを使用して、既存のオブジェクト定義を削除する。 1234`をオブジェクト定義のIDに置き換えてください。

### ObjectDefinition_DELETE_ById.sh

コマンド：

```bash
./ObjectDefinition_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_DELETE_ById.sh
   :language: bash
```

### ObjectDefinition_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_DELETE_ById
```

コード：

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## オブジェクト・フィールドのサービス

オブジェクト・フィールド用のcURLコマンドとJavaクラスは、オブジェクト定義と同じように機能する。

| ファイル                                                | 説明                                |
| :-------------------------------------------------- | :-------------------------------- |
| `ObjectField_DELETE_ById.[java\|sh]`               | ID によってオブジェクト・フィールドを削除する。         |
| `ObjectField_GET_ById.[java\|sh]`                  | 特定のオブジェクト・フィールドを ID で取得します。       |
| `ObjectField_PATCH_ById.[java\|sh]`                | ID によって特定のオブジェクト・フィールドをパッチする。     |
| `ObjectField_POST_ToObjectDefinition.[java\|sh]`   | オブジェクト定義にオブジェクト・フィールドを投稿する。       |
| `ObjectField_PUT_ById.[java\|sh]`                  | 特定のオブジェクト・フィールドをIDで置き換える。         |
| `ObjectFields_GET_FromObjectDefinition.[java\|sh]` | オブジェクト定義からオブジェクト・フィールドのリストを取得します。 |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) には、オブジェクトのすべてのサービスとスキーマが表示され、各サービスを試すためのインターフェイスが用意されている。
