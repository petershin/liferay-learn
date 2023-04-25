# カテゴリーとボキャブラリAPIの基本

LiferayのREST APIは、Liferayのカテゴリーとボキャブラリ機能のためのサービスを提供します。 APIを使用してボキャブラリを作成および編集できます。 カテゴリーをAPIに関連付けて編集することもできます。 まずは、新しいボキャブラリを追加する例を見てみましょう。

## ボキャブラリの追加

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順で操作してください：

1. [Categories and Vocabulary API Basics](./liferay-f5w3.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/tags-and-categories/developer-guide/liferay-f5w3.zip -O
   ```

   ```bash
   unzip liferay-f5w3.zip
   ```

1. [サイトのIDを検索します](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) 。 これは、以下のさまざまなサービス呼び出しで使用します。

1. cURLスクリプトを使用して、サイトに新しいボキャブラリを追加します。 コマンドラインで、`curl`フォルダに移動します。 サイトIDをパラメーターとして使用して、`TaxonomyVocabulary_POST_ToSite.sh`スクリプトを実行します。

   ```bash
   ./TaxonomyVocabulary_POST_ToSite.sh 1234
   ```

   JSON応答では、新しいボキャブラリが追加されたことを示しています。

   ```json
   {
     "availableLanguages" : [ "en-US" ],
     "creator" : {
       "additionalName" : "",
       "contentType" : "UserAccount",
       "familyName" : "Test",
       "givenName" : "Test",
       "id" : 20129,
       "name" : "Test Test",
       "profileURL" : "/web/test"
     },
     "dateCreated" : "2021-09-09T21:03:15Z",
     "dateModified" : "2021-09-09T21:03:15Z",
     "description" : "Foo",
     "id" : 40126,
     "name" : "Able",
     "numberOfTaxonomyCategories" : 0,
     "siteId" : 20125
   }
   ```

1. ［**Administration Menu**］ &rarr; ［**カテゴリー設定**］ &rarr; ［**カテゴリー**］ に移動して、カテゴリーアプリケーションに移動します。 新しいボキャブラリが追加されたことを確認してください。

   ![新しいボキャブラリが追加されました。](./categories-and-vocabulary-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. 以下のコマンドを使用して`TaxonomyVocabulary_POST_ToSite`クラスを実行します。 `siteId`値をサイトのIDに置き換えます。

   ```bash
   java -classpath .:* -DsiteId=1234 TaxonomyVocabulary_POST_ToSite
   ```

## cURLコマンドの検証

`TaxonomyVocabulary_POST_ToSite.sh`スクリプトは、cURLコマンドを使用してRESTサービスを呼び出します。

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_POST_ToSite.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                        | 説明                              |
|:----------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                     | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                 | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-taxonomy/v1.0/sites/${1}/taxonomy-vocabularies"` | RESTサービスのエンドポイント                |
| `-d "{\"description\": \"Foo\", \"name\": \"Able\"}"`                             | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                             | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境の場合は、[OAuth2](../../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。 OAuth2を使用したReactアプリケーションのサンプルは、[OAuth2によるユーザーの認証](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`TaxonomyVocabulary_POST_ToSite.java`クラスは、ボキャブラリ関連サービスを呼び出すことによってボキャブラリを追加します。

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                                                | 説明                                                          |
|:----------------------------------------------------------------------------------------------------- |:----------------------------------------------------------- |
| `TaxonomyVocabularyResource.Builder builder = ...`                                                    | `Builder`を取得し、`TaxonomyVocabularyResource`サービスインスタンスを生成します。 |
| `TaxonomyVocabularyResource taxonomyVocabularyResource = builder.authentication(...).build();`        | 基本認証を指定し、`TaxonomyVocabularyResource`サービスインスタンスを生成します。      |
| `TaxonomyVocabulary taxonomyVocabulary = taxonomyVocabularyResource.postSiteTaxonomyVocabulary(...);` | `postSiteTaxonomyVocabulary`メソッドを呼び出し、投稿するデータを渡します。         |

プロジェクトには、依存関係として`com.liferay.headless.admin.taxonomy.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと類似していますが、異なる`TaxonomyVocabularyResource`メソッドを呼び出します。

```{important}
サービスの詳細は、 [TaxonomyVocabularyResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-taxonomy/headless-admin-taxonomy-client/src/main/java/com/liferay/headless/admin/taxonomy/client/resource/v1_0/TaxonomyVocabularyResource.java) を参照してください。
```

以下は、cURLとJavaを使って、他の`TaxonomyVocabulary` RESTサービスを呼び出す例です。

## サイトからボキャブラリを取得する

次のcURLまたはJavaコマンドを実行すると、サイトのボキャブラリを一覧表示できます。 上記のように、`1234`をサイトのIDに置き換えてください。

### TaxonomyVocabularies_GET_FromSite.sh

コマンド：

```bash
./TaxonomyVocabularies_GET_FromSite.sh 1234
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabularies_GET_FromSite.sh
   :language: bash
```

### TaxonomyVocabularies_GET_FromSite.java

コマンド：

```bash
java -classpath .:* -DsiteId=1234 TaxonomyVocabularies_GET_FromSite
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabularies_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

サイトの`TaxonomyVocabulary`オブジェクトがJSONに一覧表示されます。

## ボキャブラリの取得

次のcURLまたはJavaコマンドを使用して、特定のボキャブラリを取得します。 `1234`をボキャブラリのIDに置き換えてください。

```{tip}
`TaxonomyVocabularies_GET_FromSite.[java|sh]`を使用して`Vocabulary` IDを取得します。
```

### TaxonomyVocabulary_GET_ById.sh

コマンド:

```bash
./TaxonomyVocabulary_GET_ById.sh 1234
```

コード:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_GET_ById.sh
   :language: bash
```

### TaxonomyVocabulary_GET_ById.java

コマンド：

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_GET_ById
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`TaxonomyVocabulary`フィールドがJSONに一覧表示されます。

## ボキャブラリにパッチを適用する

次のcURLおよびJavaコマンドを使用して、既存のボキャブラリを部分的に編集します。 注： `1234`をボキャブラリのIDに置き換えてください。

### TaxonomyVocabulary_PATCH_ById.sh

コマンド：

```bash
./TaxonomyVocabulary_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_PATCH_ById.sh
   :language: bash
```

### TaxonomyVocabulary_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_PATCH_ById
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

この例では、説明がFooからBarに変更されています。

## ボキャブラリの配置

次のcURLおよびJavaコマンドを使用して、既存のボキャブラリを上書きします。 注： `1234`をボキャブラリのIDに置き換えてください。

### TaxonomyVocabulary_PUT_ById.sh

コマンド：

```bash
./TaxonomyVocabulary_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_PUT_ById.sh
   :language: bash
```

### TaxonomyVocabulary_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_PUT_ById
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-29
```

## ボキャブラリの削除

次のcURLおよびJavaコマンドを使用して、既存のボキャブラリを削除します。 注： `1234`をボキャブラリのIDに置き換えてください。

### TaxonomyVocabulary_DELETE_ById.sh

コマンド:

```bash
./TaxonomyVocabulary_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/curl/TaxonomyVocabulary_DELETE_ById.sh
   :language: bash
```

### TaxonomyVocabulary_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DtaxonomyVocabularyId=1234 TaxonomyVocabulary_DELETE_ById
```

コード:

```{literalinclude} ./categories-and-vocabulary-api-basics/resources/liferay-f5w3.zip/java/TaxonomyVocabulary_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

## タクソノミーカテゴリーサービス

タクソノミーカテゴリーのcURLコマンドとJavaクラスは、タクソノミーボキャブラリと同様に機能します。 一部のサービスではタクソノミーのボキャブラリIDが必要であることに注意してください。

| ファイル                                                        | 説明                      |
|:----------------------------------------------------------- |:----------------------- |
| `TaxonomyCategories_GET_FromTaxonomyVocabulary.[java\|sh]` | ボキャブラリからカテゴリーの一覧を取得します。 |
| `TaxonomyCategory_DELETE_ById.[java\|sh]`                  | カテゴリーを削除します。            |
| `TaxonomyCategory_GET_ById[java\|sh]`                      | IDで特定のカテゴリーを取得します。      |
| `TaxonomyCategory_PATCH_ById.[java\|sh]`                   | カテゴリーにパッチを適用します。        |
| `TaxonomyCategory_POST_ToTaxonomyVocabulary.[java\|sh]`    | カテゴリーをボキャブラリに投稿します。     |
| `TaxonomyCategory_PUT_ById.[java\|sh]`                     | カテゴリーを配置します。            |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`TaxonomyVocabulary`および`TaxonomyCategory`のすべてのサービスとスキーマが一覧表示され、各サービスを試すためのインターフェイスがあります。
