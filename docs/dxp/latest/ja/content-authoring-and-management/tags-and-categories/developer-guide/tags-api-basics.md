# タグAPIの基本

LiferayのREST APIは、Liferay DXP/ポータルのタグにサービスを提供します。 APIを使用してタグを作成および編集できます。 まずは、新しいタグを追加する例を見てみましょう。 Liferayのコードベースでは、タグはキーワードと呼ばれることに注意してください。

## タグの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Tags API Basics](./liferay-r7u9.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/content-authoring-and-management/tags-and-categories/developer-guide/liferay-r7u9.zip -O
   ```

   ```bash
   unzip liferay-r7u9.zip
   ```

1. [サイトのIDを検索します](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) 。 これは、以下のさまざまなサービス呼び出しで使用します。

1. cURLスクリプトを使用して、サイトに新しいタグを追加します。 コマンドラインで、`curl`フォルダに移動します。 サイトIDをパラメーターとして使用して、`Keyword_POST_ToSite.sh`スクリプトを実行します。

    ```bash
    ./Keyword_POST_ToSite.sh 1234
    ```

    JSON応答では、新しいタグが追加されたことを示しています。

    ```bash
   "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Test",
    "givenName" : "Test",
    "id" : 20129,
    "name" : "Test Test",
    "profileURL" : "/web/test"
   },
   "dateCreated" : "2021-09-09T21:15:46Z",
   "dateModified" : "2021-09-09T21:15:46Z",
   "id" : 40130,
   "keywordUsageCount" : 0,
   "name" : "foo",
   "siteId" : 20125
    ```

1. ［**Administration Menu**］ &rarr; ［**カテゴリー設定**］ &rarr; ［**Tags**］ に移動して、タグアプリケーションに移動します。 新しいタグが追加されたことを確認してください。

    ![新しいタグが追加されたことを確認してください。](./tags-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

    ```bash
    javac -classpath .:* *.java
    ```

1. 以下のコマンドを使用して`Keyword_POST_ToSite`クラスを実行します。 `siteId`値をサイトのIDに置き換えます。

    ```bash
    java -classpath .:* -DsiteId=1234 Keyword_POST_ToSite
    ```

## cURLコマンドの検証

`Keyword_POST_ToSite.sh`スクリプトは、cURLコマンドを使用してRESTサービスを呼び出します。

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/curl/Keyword_POST_ToSite.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                           | 説明                              |
|:---------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                        | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                    | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-taxonomy/v1.0/sites/${1}/keywords"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Foo\"}"`                                               | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                | 基本的な認証情報                        |

```{note}
ここでは、デモのためにベーシック認証を使用しています。 本番環境の場合は、[OAuth2](../../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Keyword_POST_ToSite.java`クラスは、キーワード関連サービスを呼び出すことにより、タグを追加します。

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/java/Keyword_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                   | 説明                                                       |
|:------------------------------------------------------------------------ |:-------------------------------------------------------- |
| `KeywordResource.Builder builder = ...`                                  | `Builder`を取得し、`KeywordResource`サービスインスタンスを生成します。         |
| `KeywordResource keywordResource = builder.authentication(...).build();` | 基本認証を指定し、`KeywordResource`サービスインスタンスを生成します。              |
| `Keyword keyword = keywordResource.postSiteKeyword(...);`                | `keywordResource.postSiteKeyword`メソッドを呼び出し、投稿するデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.taxonomy.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと類似していますが、異なる`KeywordResource`メソッドを呼び出します。

```{important}
サービスの詳細は、 [KeywordResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-taxonomy/headless-admin-taxonomy-client/src/main/java/com/liferay/headless/admin/taxonomy/client/resource/v1_0/KeywordResource.java) を参照してください。
```

以下は、cURLとJavaを使って、他の`Keyword` RESTサービスを呼び出す例です。

## サイトからキーワード投稿を取得する

次のcURLまたはJavaコマンドを実行すると、サイトのタグを一覧表示できます。 上記のように、`1234`をサイトのIDに置き換えてください。

### Keywords_GET_FromSite.sh

コマンド:

```bash
./Keywords_GET_FromSite.sh 1234
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/curl/Keywords_GET_FromSite.sh
   :language: bash
```

### Keywords_GET_FromSite.java

コマンド:

```bash
java -classpath .:* -DsiteId=1234 Keywords_GET_FromSite
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/java/Keywords_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

サイトの`Keyword`オブジェクトがJSONに一覧表示されます。

## キーワードの取得

次のcURLまたはJavaコマンドを使用して、特定のタグを取得します。 `1234`をタグのIDに置き換えてください。

```{tip}
``Keywords_GET_FromSite.[java|sh]``を使用して、サイトの``Keyword`` IDを取得します。
```

### Keyword_GET_ById.sh

コマンド:

```bash
./Keyword_GET_ById.sh 1234
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/curl/Keyword_GET_ById.sh
   :language: bash
```

### Keyword_GET_ById.java

コマンド:

```bash
java -classpath .:* -DkeywordId=1234 Keyword_GET_ById
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/java/Keyword_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Keyword`フィールドがJSONに一覧表示されます。

## キーワードの配置

次のcURLおよびJavaコマンドを使用して、既存のタグを完全に上書きします。 注： `1234`をタグのIDに置き換えてください。

### Keyword_PUT_ById.sh

コマンド:

```bash
./Keyword_PUT_ById.sh 1234
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/curl/Keyword_PUT_ById.sh
   :language: bash
```

### Keyword_PUT_ById.java

コマンド:

```bash
java -classpath .:* -DkeywordId=1234 Keyword_PUT_ById
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/java/Keyword_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## キーワードの削除

次のcURLおよびJavaコマンドを使用して、既存のタグを削除します。 注： `1234`をタグのIDに置き換えてください。

### Keyword_DELETE_ById.sh

コマンド:

```bash
./Keyword_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/curl/Keyword_DELETE_ById.sh
   :language: bash
```

### Keyword_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DkeywordId=1234 Keyword_DELETE_ById
```

コード:

```{literalinclude} ./tags-api-basics/resources/liferay-r7u9.zip/java/Keyword_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`Keyword`のすべてのサービスとスキーマが一覧表示され、各サービスを試すためのインターフェイスがあります。
