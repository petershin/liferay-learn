# ナレッジベースAPIの基本

[ナレッジベース記事の作成](../creating-knowledge-base-articles.md)と[ナレッジベースの管理](../managing-the-knowledge-base.md)はLiferayのナレッジベースアプリでできますが、Liferay のREST APIを使うことも可能です。 ナレッジベースのコンテンツを作成・管理するために、これらのサービスを呼び出します。

## ナレッジベースの記事を追加する

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順で進めてください：

1. [Knowledge Base API Basics](./liferay-t3x7.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/collaboration-and-social/knowledge-base/developer-guide/liferay-t3x7.zip -O
   ```

   ```bash
   unzip liferay-t3x7.zip
   ```

1. ログインすると、[サイトのIDを取得します](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data)。 このIDは、いくつかのサービス呼び出しで使用します。

1. cURLスクリプトを使用して、サイトに新しいナレッジベースの記事を追加します。 コマンドラインで、`curl`フォルダに移動します。 サイトIDをパラメーターとして使用して、`KnowledgeBaseArticle_POST_ToSite.sh`スクリプトを実行します。 例えば、

   ```bash
   ./KnowledgeBaseArticle_POST_ToSite.sh 1234
   ```

   JSON応答では、新しいナレッジベースの記事が追加されたことを示しています。

   ```json
   {
     "articleBody" : "Foo",
     "creator" : {
       "additionalName" : "",
       "contentType" : "UserAccount",
       "familyName" : "Test",
       "givenName" : "Test",
       "id" : 20125,
       "name" : "Test Test"
     },
     "customFields" : [ ],
     "dateCreated" : "2022-07-28T21:25:57Z",
     "dateModified" : "2022-07-28T21:25:57Z",
     "description" : "",
     "encodingFormat" : "text/html",
     "externalReferenceCode" : "0bace9ad-39ea-79b5-902e-c873806b8bd7",
     "friendlyUrlPath" : "able",
     "id" : 42447,
     "keywords" : [ ],
     "numberOfAttachments" : 0,
     "numberOfKnowledgeBaseArticles" : 0,
     "parentKnowledgeBaseArticleId" : 0,
     "relatedContents" : [ ],
     "siteId" : 20121,
     "subscribed" : false,
     "taxonomyCategoryBriefs" : [ ],
     "title" : "Able"
   }
   ```

1. **メニュー** アイコン(![Menu icon](../../../images/icon-menu.png)）をクリックし、 ［**コンテンツとデータ**］ &rarr; ［**ナレッジベース**］ に移動します。 新しいナレッジベースの記事が追加されたことを確認します。

   ![新しいナレッジベースの記事が追加されたことを確認します。](./knowledge-base-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `KnowledgeBaseArticle_POST_ToSite.java`クラスを実行します。 `siteId`システムプロパティ値をサイトのIDに置き換えます。

   ```bash
   java -classpath .:* -DsiteId=1234 KnowledgeBaseArticle_POST_ToSite
   ```

   Javaクラスにより、新しいナレッジベース記事が作成されました。

## cURLコマンドの検証

`KnowledgeBaseArticle_POST_ToSite.sh`スクリプトは、cURLコマンドを使用してRESTサービスを呼び出します。

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_POST_ToSite.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                    | 説明                              |
|:------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                 | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                             | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/knowledge-base-articles"` | RESTサービスのエンドポイント                |
| `-d "{\"articleBody\": \"Foo\", \"title\": \"Able\"}"`                        | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                         | 基本的な認証情報                        |

```{note}
デモのために基本認証を使用しています。 本番環境の場合は、[OAuth2](../../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。 OAuth2を使用したReactアプリケーションのサンプルは、[OAuth2によるユーザーの認証](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`KnowledgeBaseArticle_POST_ToSite.java`クラスは、ナレッジベース関連サービスを呼び出してナレッジベースの記事を追加します。

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-29
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                                                        | 説明                                                                                |
|:------------------------------------------------------------------------------------------------------------- |:--------------------------------------------------------------------------------- |
| `KnowledgeBaseArticleResource.Builder builder = ...`                                                          | `Builder`を取得し、`KnowledgeBaseArticleResource`サービスインスタンスを生成します。                     |
| `KnowledgeBaseArticleGroupResource knowledgeBaseArticleGroupResource = builder.authentication(...).build();`  | 基本認証を指定し、`KnowledgeBaseArticleResource`</0>サービスインスタンスを生成します。                      |
| `KnowledgeBaseArticle knowledgeBaseArticle = knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle(...);` | `knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle`メソッドを呼び出し、データを投稿に渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.delivery.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと類似していますが、異なる`KnowledgeBaseArticle`メソッドを呼び出します。

```{important}
サービスの詳細は、[KnowledgeBaseArticleResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/KnowledgeBaseArticleResource.java)を参照してください。
```

以下は、cURLとJavaを使って、他の`KnowledgeBaseArticle`RESTサービスを呼び出す例です。

## サイトからナレッジベース記事を取得する

次のcURLまたはJavaコマンドを実行すると、全てのサイトからナレッジベースの記事を取得できます。 `1234` をサイトのIDに置き換えてください。

### KnowledgeBaseArticles_GET_FromSite.sh

コマンド：

```bash
./KnowledgeBaseArticles_GET_FromSite.sh 1234
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticles_GET_FromSite.sh
   :language: bash
```

### KnowledgeBaseArticles_GET_FromSite.java

コマンド：

```bash
java -classpath .:* -DsiteId=1234 KnowledgeBaseArticles_GET_FromSite
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticles_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-26
```

インスタンスの`KnowledgeBaseArticles`オブジェクトがJSONで表示されます。

## ナレッジベースの記事を取得する

以下のcURLまたはJavaコマンドを使用し、特定のナレッジベースの記事をIDで取得します。

```{tip}
``KnowledgeBaseArticles_GET_FromSite.[java|sh]``を使用して、インスタンス``Knowledge Base Article`` IDを取得します。
```

### KnowledgeBaseArticle_GET_ById.sh

コマンド:

```bash
./KnowledgeBaseArticle_GET_ById.sh 1234
```

コード:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_GET_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_GET_ById.java

コマンド：

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_GET_ById
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

`KnowledgeBaseArticle`フィールドは、JSONで表示されます。

## ナレッジベースの記事にパッチを適用する

次のcURLおよびJavaコマンドを使用して、既存のナレッジベースの記事を部分的に編集します。 `1234`をナレッジベース記事のIDに置き換えてください。 修正したいフィールドとその新規値を指定します。

### KnowledgeBaseArticle_PATCH_ById.sh

コマンド：

```bash
./KnowledgeBaseArticle_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_PATCH_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_PATCH_ById
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

## ナレッジベース記事を上書きする

次のcURLおよびJavaコマンドを使用して、既存のナレッジベースの記事を完全に上書きします。 `1234`をナレッジベース記事のIDに置き換えてください。

### KnowledgeBaseArticle_PUT_ById.sh

コマンド：

```bash
./KnowledgeBaseArticle_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_PUT_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_PUT_ById
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-29
```

## ナレッジベース記事を削除する

次のcURLおよびJavaコマンドを使用して、既存のナレッジベースの記事を削除します。 `1234`をナレッジベース記事のIDに置き換えてください。

### KnowledgeBaseArticle_DELETE_ById.sh

コマンド:

```bash
./KnowledgeBaseArticle_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/curl/KnowledgeBaseArticle_DELETE_ById.sh
   :language: bash
```

### KnowledgeBaseArticle_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_DELETE_ById
```

コード:

```{literalinclude} ./knowledge-base-api-basics/resources/liferay-t3x7.zip/java/KnowledgeBaseArticle_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

## ナレッジベースフォルダサービス

ナレッジベースフォルダ用のcURLコマンドとJavaクラスは、ナレッジベースの記事と同じように機能します。

| ファイル                                            | 説明                        |
|:----------------------------------------------- |:------------------------- |
| `KnowledgeBaseFolder_DELETE_ById.[java\|sh]`   | ナレッジベースフォルダをIDで削除する。      |
| `KnowledgeBaseFolder_GET_ById.[java\|sh]`      | 特定のナレッジベースフォルダをIDで取得する    |
| `KnowledgeBaseFolder_PATCH_ById.[java\|sh]`    | IDでナレッジベースフォルダにパッチを適用する。  |
| `KnowledgeBaseFolder_POST_ToSite.[java\|sh]`   | ナレッジベースフォルダをサイトに投稿する。     |
| `KnowledgeBaseFolder_PUT_ToSite.[java\|sh]`    | ナレッジベースフォルダをIDで上書きする。     |
| `KnowledgeBaseFolders_GET_FromSite.[java\|sh]` | サイトからナレッジベースフォルダの一覧を取得する。 |

[APIエクスプローラー](../../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`KnowledgeBaseArticle`および`KnowledgeBaseFolder`のすべてのサービスとスキーマが表示され、各サービスを試すためのインターフェースがあります。
