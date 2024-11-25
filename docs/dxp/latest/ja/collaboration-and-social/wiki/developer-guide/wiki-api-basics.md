# Wiki APIの基本

LiferayのHeadless Deliveryアプリケーションは、 [Wiki](../getting-started-with-wikis.md) アプリケーションにRESTサービスを提供します。 これらのサービスを使用すると、Wikiノードとページを追加したり、それらの情報を一覧表示したり、コンテンツを変更したり、完全に削除したりできます。 ここでは、cURLコマンドとJavaクラスを使用してこれらのサービスを呼び出します。

## チュートリアルリソースの準備

チュートリアルに進む前に、まずクリーンなLiferay Dockerコンテナをセットアップし、提供されたチュートリアルコードを使用できるように準備します。

### Liferay Dockerコンテナ

```{include} /_snippets/run-liferay-portal.md
```

開始したら、Site IDを取得します。 サイトIDを見つけるには、 **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 ［**Configuration**］ &rarr; ［**Site Settings**］ &rarr; ［**Site Configuration**］ に移動します。

![Find the Site ID under Site Configuration settings.](./wiki-api-basics/images/01.png)

### チュートリアルコード

このチュートリアルでは、Headless APIを示すサンプルコードを提供します。 このコードには、チュートリアル全体で使用するためのサンプルのcURLファイルとJavaファイルの両方が含まれています。

次のコマンドを実行して、 [サンプルコード](https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/wiki/developer-guide/liferay-q8u2.zip) をダウンロードして解凍します。

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/wiki/developer-guide/liferay-q8u2.zip -O
```

```bash
unzip liferay-q8u2.zip
```

cURLスクリプトを使用する準備ができたら、実行する前にJavaソースファイルを手動でコンパイルする必要があります。 これを行うには、プロジェクトの `java` フォルダーに行き、`javac` コマンドを実行する。

```bash
cd liferay-q8u2/java
```

```bash
javac -classpath .:* *.java
```

このプロジェクトには `com.liferay.headless.delivery.client.jar` ファイルが依存関係として含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

提供されるコードには `WikiNode` と `WikiPage` サービスの API が含まれている。 含まれているサンプルAPIの一覧は、 [Tutorial Code Reference](#tutorial-code-reference) をご参照ください。

```{important}
提供されるコードは、デモのために基本認証を使用しています。 本番環境では、 [OAuth2](../../../headless-delivery/using-oauth2.md) でユーザーを認証する必要があります。
```
## サンプルWikiNodeのAPIを呼び出す

この演習では、`WikiNode` APIを呼び出すためにcURLコマンドまたはJavaクラスのいずれかを使用することができます。 次の出力例はcURLコマンドに対応しており、提供されているJavaクラスの出力とは少し異なります。

1. `liferay-q8u2`プロジェクトの`curl`または`java` フォルダに移動します。

   **cURLの場合**

   ```bash
   cd liferay-q8u2/curl
   ```

   **Javaの場合**

   ```bash
   cd liferay-q8u2/java
   ```

1. サイトIDをパラメータとして `WikiNode_POST_ToSite` を実行します。 これにより、指定したサイトに新しいWikiノードが作成されます。

   **cURLの場合**

   ```bash
   ./WikiNode_POST_ToSite.sh {site-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNode_POST_ToSite
   ```

   ターミナルには、新しく作成されたWikiノードの完全なスキーマが表示されます。 提供されるAPIコールは、新しいノードの `description` フィールドと `name` フィールドのみを定義する。

1. ノードのIDをコピーして、以下のGET、PUT、DELETEメソッドで使用します。

   ```json
   {
     ...
     "description" : "Foo",
     ...
     "id" : 38405,
     "name" : "Able Node",
     ...
   }
   ```

1. パラメータにサイトIDを使用して `WikiNodes_GET_FromSite` を実行します。 これにより、指定したサイト内のすべてのWikiノードのリストが返されます。

   **cURLの場合**

   ```bash
   ./WikiNodes_GET_FromSite.sh {site-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNodes_GET_FromSite
   ```

   ```{note}
   すべてのDXP/ポータルインスタンスには、 `Main`と呼ばれるデフォルトのWikiノードが付属しています。 このノードは、作成したノードとともに上記の出力に表示されます。
   ```

1. Wiki ノード ID をパラメータとして `WikiNode_PUT_ById` を実行する。 これにより、指定されたWikiノードの詳細がAPI呼び出しで提供された詳細に置き換えられます。

   **cURLの場合**

   ```bash
   ./WikiNode_PUT_ById.sh {wiki-node-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_PUT_ById
   ```

   ```json
   {
     ...
     "description" : "Bar",
     ...
     "id" : 38405,
     "name" : "Baker Node",
     ...
   }
   ```

1. 同じ Wiki ノード ID をパラメータとして `WikiNode_DELETE_ById` を実行します。 これにより、指定したノードが削除されます。

   **cURLの場合**

   ```bash
   ./WikiNode_DELETE_ById.sh {wiki-node-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_DELETE_ById
   ```

1. 同じ Wiki ノード ID をパラメータとして `WikiNode_GET_ById` を実行します。 これにより、指定されたノードが存在する場合はその詳細が返されます。

   **cURLの場合**

   ```bash
   ./WikiNode_GET_ById.sh {wiki-node-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_GET_ById
   ```

   前の手順でノードを削除したため、次のメッセージが返されます。

   ```json
   {
     "status" : "NOT_FOUND",
     "title" : "No WikiNode exists with the primary key 38405"
   }
   ```

## サンプルWikiPageのAPIを呼び出す

WikiPage`のAPIを呼び出すには、cURLコマンドかJavaクラスを使用します。 次の出力例はcURLコマンドに対応しており、提供されているJavaクラスの出力とは少し異なります。

1. `liferay-q8u2`プロジェクトの`curl`または`java` フォルダに移動します。

   **cURLの場合**

   ```bash
   cd liferay-q8u2/curl
   ```

   **Javaの場合**

   ```bash
   cd liferay-q8u2/java
   ```

1. `WikiNode_POST_ToSite` を実行して、Wikiページのノードを作成します。

   **cURLの場合**

   ```bash
   ./WikiNode_POST_ToSite.sh {site-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNode_POST_ToSite
   ```

   ```{note}
   WikiページはWikiノードに保存されるため、Wikiページを作成する前に少なくとも1つのノードが存在する必要があります。
   ```
1. `WikiPage_POST_ToNode`コールで使用するために、ノードのIDを出力からコピーします。

   ```json
   {
     ...
     "description" : "Foo",
     ...
     "id" : 38504,
     "name" : "Able Node",
     ...
   }
   ```

1. 上記のノードIDをパラメータとして`WikiPage_POST_ToNode`を実行する。 これにより、指定したノードの新しいWikiページが作成されます。

   **cURLの場合**

   ```bash
   ./WikiPage_POST_ToNode.sh {wiki-node-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiPage_POST_ToNode
   ```

1. `WikiPage_POST_ToParent`呼び出しで使用するためにページのIDをコピーします。

   ```json
   {
     ...
     "content" : "Foo",
     ...
     "description" : "Able Page",
     "encodingFormat" : "text/x-wiki",
     ...
     "headline" : "Able Page",
     "id" : 38506,
     ...
   }
   ```

1. 上記のWikiページIDをパラメータとして `WikiPage_POST_ToParent` を実行する。 これにより、指定したWikiページの子ページが作成されます。

   **cURLの場合**

   ```bash
   ./WikiPage_POST_ToNode.sh {wiki-page-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DparentWikiPageId={wiki-page-id} WikiPage_POST_ToParent
   ```

   ```json
   {
      ...
      "content" : "Foo",
      ...
      "description" : "Charlie Page",
      "encodingFormat" : "text/x-wiki",
      ...
      "headline" : "Charlie Page",
      "id" : 38510,
      ...
   }
   ```

1. Wiki ノード ID をパラメータとして `WikiPages_GET_FromNode` を実行する。 これにより、指定したノードに追加されたすべてのWikiページのリストが返されます。これには、新しく作成された両方のWikiページが含まれます。

   **cURLの場合**

   ```bash
   ./WikiPages_GET_FromNode.sh {wiki-node-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiPages_GET_FromNode
   ```

1. Wiki の親ページ ID をパラメータとして `WikiPages_GET_FromParent` を実行します。 これにより、指定したWikiページの既存の子ページが返されます。

   **cURLの場合**

   ```bash
   ./WikiPages_GET_FromParent.sh {wiki-page-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DparentWikiPageId={wiki-page-id} WikiPages_GET_FromParent
   ```

1. 上記のいずれかのWikiページIDをパラメータとして `WikiPage_PUT_ById` を実行する。 これにより、元のページのコンテンツがAPI呼び出しで定義されたコンテンツに置き換えられます。

   **cURLの場合**

   ```bash
   ./WikiPage_PUT_ById.sh {wiki-page-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_PUT_ById
   ```

   ```json
   {
     "content" : "Bar",
     ...
     "encodingFormat" : "text/x-wiki",
     ...
     "headline": "Baker Page",
     "id" : 38515,
     ...
   }
   ```

1. WikiページIDをパラメータとして `WikiPage_DELETE_ById` を実行する。 これにより、指定したWikiページが削除されます。

    **cURLの場合**

    ```bash
    ./WikiPage_DELETE_ById.sh {wiki-page-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_DELETE_ById
    ```

1. 削除された Wiki ページの ID をパラメータとして `WikiPage_GET_ById` を実行する。 これにより、指定されたページが存在する場合はその詳細が返されます。

    **cURLの場合**

    ```bash
    ./WikiPage_GET_ById.sh {wiki-page-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_GET_ById
    ```

    前の手順でページが削除されたため、次のメッセージが表示されます。

    ```json
    {
      "status" : "NOT_FOUND",
      "title" : "No WikiNode exists with the primary key 38515"
    }
    ```

## チュートリアルコードのリファレンス

提供されているサンプルコードには、以下の `WikiNode` と `WikiPage` API 用の cURL スクリプトと Java クラスが含まれています。

### WikiNodeのサンプルAPI

| サービス     | HTTP メソッド | HTTPエンドポイント                       | 説明                                                                      |
| :------- | :-------- | :-------------------------------- | :---------------------------------------------------------------------- |
| WikiNode | `POST`    | `/v1.0/sites/[siteId]/wiki-nodes` | API呼び出しで提供された詳細を使用して、指定されたサイトに新規Wikiノードを作成します                           |
| WikiNode | `GET`     | `/v1.0/sites/[siteId]/wiki-nodes` | 指定されたサイト内のすべてのWikiノードの完全なリストを返します。結果に対して、ページ分割、絞り込み、検索、およびソートをすることができます |
| WikiNode | `GET`     | `/v1.0/wiki-nodes/[wikiNodeId]`   | 指定されたノードエンティティの詳細を返します                                                  |
| WikiNode | `PUT`     | `/v1.0/wiki-nodes/[wikiNodeId]`   | 指定されたノードの詳細をAPI呼び出しで提供されたものに置き換えます                                      |
| WikiNode | `DELETE`  | `/v1.0/wiki-nodes/[wikiNodeId]`   | 指定されたノードを削除し、操作が成功した場合**は204を返します                                         |

### WikiPageのサンプルAPI

| サービス     | HTTP メソッド | HTTPエンドポイント                                      | 説明                                                                              |
| :------- | :-------- | :----------------------------------------------- | :------------------------------------------------------------------------------ |
| WikiPage | `POST`    | `/v1.0/wiki-nodes/[wikiNodeId]/wiki-pages`       | API呼び出しで提供された詳細を使用して、指定されたノードに新しいWikiページを作成します                                  |
| WikiPage | `POST`    | `/v1.0/wiki-pages/[parentWikiPageId]/wiki-pages` | API呼び出しで提供された詳細を使用して、指定されたWikiページの新しいWiki子ページを作成します。                            |
| WikiPage | `GET`     | `/v1.0/wiki-nodes/[wikiNodeId]/wiki-pages`       | 指定されたWikiノードに追加されたすべてのWikiページの完全なリストを返します。結果に対して、ページ分割、絞り込み、検索、およびソートをすることができます |
| WikiPage | `GET`     | `/v1.0/wiki-pages/[parentWikiPageId]/wiki-pages` | 指定されたWikiページに追加されたすべてのWiki子ページの完全なリストを返します。結果に対して、ページ分割、絞り込み、検索、およびソートすることができます |
| WikiPage | `GET`     | `/v1.0/wiki-pages/[wikiPageId]`                  | 指定されたWikiページエンティティの詳細を返します                                                      |
| WikiPage | `PUT`     | `/v1.0/wiki-pages/[wikiPageId]`                  | 指定されたページの詳細をAPI呼び出しで提供されたものに置き換えます                                              |
| WikiPage | `DELETE`  | `/v1.0/wiki-pages/[wikiPageId]`                  | 指定されたページを削除し、操作が成功した場合**は204を返します                                                 |

```{important}
WikiページにPOSTメソッドとPUTメソッドを使用する場合、 `headline` フィールドと `encodingFormat` フィールドの両方を定義する必要があります。`headline` フィールドはページのメインタイトルを設定し、`encodingFormat` フィールドはページのメディアフォーマット（HTML、BBCodeなど）を決定します。
```
## サンプルのcURLスクリプトの検証

以下は、チュートリアルのcURLコマンドの代表的な例です。

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiNode_POST_ToSite.sh
   :language: bash
```

### `WikiPage_POST_ToNode.sh`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiPage_POST_ToNode.sh
   :language: bash
```

### `WikiPages_GET_FromNode.sh`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiPages_GET_FromNode.sh
   :language: bash
```

## サンプルのJavaクラスの検証

以下は、チュートリアルのJavaコマンドの代表的な例です。

### `WikiNode_POST_ToSite.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiNode_POST_ToSite.java
   :language: java
   :lines: 4-28
```

### `WikiPage_POST_ToNode.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiPage_POST_ToNode.java
   :language: java
   :lines: 4-29
```

### `WikiPages_GET_FromNode.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiPages_GET_FromNode.java
   :language: java
   :lines: 6-25
```

## 関連トピック

* [Liferayをヘッドレスプラットフォームとして使う](../../../headless-delivery/using-liferay-as-a-headless-platform.md)
* [休憩サービスの消費](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
