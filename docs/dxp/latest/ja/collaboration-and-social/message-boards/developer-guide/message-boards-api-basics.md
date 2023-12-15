# 掲示板APIの基本

LiferayのHeadless Deliveryアプリケーションは、 [掲示板](../../message-boards.md) アプリケーションにRESTサービスを提供します。 これらのサービスでは、掲示板カテゴリやスレッド、メッセージの追加、情報の一覧表示、内容の修正や完全な削除が可能です。 ここでは、cURLコマンドとJavaクラスを使用してこれらのサービスを呼び出します。

```{note}
掲示板カテゴリは、Liferayのバックエンドでは*sections*という名前になっています。 これらのセクションでは、スレッドを整理するためのトピックを定義します。
```
## チュートリアルリソースの準備

チュートリアルに進む前に、まずクリーンなLiferay Dockerコンテナをセットアップし、提供されたチュートリアルコードを使用できるように準備します。

### Liferay Dockerコンテナ

```{include} /_snippets/run-liferay-portal.md
```

開始したら、サイトIDを取得します。 サイトIDを見つけるには、 **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 ［**Configuration**］ &rarr; ［**Site Settings**］ &rarr; ［**Site Configuration**］ に移動します。

![Find the site ID under the Site Configuration settings.](./message-boards-api-basics/images/01.png)

### チュートリアルコード

以下はヘッドレスAPIをデモするサンプルコードです。 本コードには、サンプルのcURLとJavaファイルの両方が含まれています。

次のコマンドを実行して、 [サンプルコード](https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip) をダウンロードして解凍します。

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip -O
```

```bash
unzip liferay-y3a6.zip
```

cURLスクリプトを使用する準備ができたら、実行する前にJavaソースファイルを手動でコンパイルする必要があります。 これを行うには、プロジェクトの `java` フォルダーに行き、`javac` コマンドを実行する。

```bash
cd liferay-y3a6/java
```

```bash
javac -classpath .:* *.java
```

このプロジェクトには `com.liferay.headless.delivery.client.jar` ファイルが依存関係として含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

提供されるコードには `MessageBoardSection`、`MessageBoardThread`、`MessageBoardMessage` サービスの API が含まれる。 含まれているサンプルAPIの一覧は、 [Tutorial Code Reference](#tutorial-code-reference) をご参照ください。

```{important}
提供されるコードは、デモのために基本認証を使用しています。 本番環境では、 [OAuth2](../../../headless-delivery/using-oauth2.md) でユーザーを認証する必要があります。
```

## サンプルAPIの呼び出し

この練習では、cURLコマンドかJavaクラスを使って`MessageBoardSection`、`MessageBoardThread`、`MessageBoardMessage`の各APIを呼び出すことができる。 次の出力例はcURLコマンドに対応しており、提供されているJavaクラスの出力とは少し異なります。

1. `liferay-y3a6`プロジェクトの`curl`または`java` フォルダに移動します。

   **cURLの場合**

   ```bash
   cd liferay-y3a6/curl
   ```

   **Javaの場合**

   ```bash
   cd liferay-y3a6/java
   ```

1. サイトIDをパラメータとして`MessageBoardSection_POST_ToSite`を実行する。 これにより、指定したサイトに新しい掲示板セクションが作成されます。

   **cURLの場合**

   ```bash
   ./MessageBoardSection_POST_ToSite.sh {site-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSection_POST_ToSite
   ```

   端末には、新しく作成されたセクションの完全なスキーマが表示されます。 提供されるAPIコールは、新しいセクションの `description` フィールドと `name` フィールドを定義するだけである。

1. セクションのIDをコピーして、以下のGET、PATCH、PUT、DELETEメソッドで使用します。

   ```json
   {
     ...
     "description" : "Foo",
     "id" : 43925,
     ...
     "name" : "Able Section",
     ...
   }
   ```

1. パラメータにサイト ID を使用して `MessageBoardSections_GET_FromSite` を実行する。 これにより、指定したサイト内のすべてのセクションのリストが返されます。

   **cURLの場合**

   ```bash
   ./MessageBoardSections_GET_FromSite.sh {site-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSections_GET_FromSite
   ```

1. メッセージボードセクションのIDをパラメータとして `MessageBoardSection_PATCH_ById` を実行する。 これにより、指定されたエントリーの詳細がAPI呼び出しで提供された詳細に更新されます。

   **cURLの場合**

   ```bash
   ./MessageBoardSection_PATCH_ById.sh {message-board-section-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PATCH_ById
   ```

   これは `description` フィールドを `Bar` に更新する。

1. 同じセクションIDをパラメータとして `MessageBoardSection_PUT_ById` を実行する。 これにより、指定されたエントリーの詳細がAPI呼び出しで提供された詳細に置き換えられます。

   **cURLの場合**

   ```bash
   ./MessageBoardSection_PUT_ById.sh {message-board-section-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PUT_ById
   ```

   これは `name` フィールドを `Baker Section` に、`description` フィールドを `Goo` に更新します。

1. パラメータにサイト ID を使用して `MessageBoardThread_POST_ToSite` を実行する。 これにより、サイトの新しい掲示板スレッドが作成されます。

   **cURLの場合**

   ```bash
   ./MessageBoardThread_POST_ToSite.sh {site-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardThread_POST_ToSite
   ```

   ```bash
   {
     ...
     "articleBody" : "Foo",
     ...
     "headline" : "Able Thread",
     "id" : 43942,
     ...
     "messageBoardRootMessageId" : 43941,
   }
   ```

   すべてのスレッドは、スレッド内のすべての直接返信の親メッセージとなるルートメッ セージ（つまり `messageBoardRootMessageId`）で作成される。

1. 上記のセクションIDをパラメータとして`MessageBoardThread_POST_ToSection`を実行する。 これにより、指定されたセクションの新しい掲示板スレッドが作成されます。

   **cURLの場合**

   ```bash
   ./MessageBoardThread_POST_ToSection.sh {message-board-section-id}
   ```

   **Javaの場合**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThread_POST_ToSection
   ```

1. このスレッドのIDをコピーして、以下のGET、PATCH、PUTメソッドで使用します。

   ```bash
   {
     ...
     "articleBody" : "Foo",
     ...
     "headline" : "Baker Thread",
     "id" : 43934,
     ...
     "messageBoardRootMessageId" : 43933,
     "messageBoardSectionId" : 43925,
     ...
   }
   ```

1. スレッドの ID をパラメータとして `MessageBoardThread_PATCH_ById` を実行する。 これにより、指定されたスレッドの詳細がAPI呼び出しで提供された詳細に更新されます。

    **cURLの場合**

    ```bash
    ./MessageBoardThread_PATCH_ById.sh {message-board-thread-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PATCH_ById
    ```

    これは `articleBody` フィールドを `Bar` に更新する。

1. 同じスレッド ID をパラメータとして `MessageBoardThread_PUT_ById` を実行する。 これにより、指定されたスレッドの詳細がAPI呼び出しで提供された詳細に置き換えられます。

    **cURLの場合**

    ```bash
    ./MessageBoardThread_PUT_ById.sh {message-board-thread-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PUT_ById
    ```

    これにより、`headline` フィールドが `Charlie Thread` に、`articleBody` フィールドが `Goo` に更新される。

1. パラメータにサイト ID を使用して `MessageBoardThreads_GET_FromSite` を実行する。 これにより、セクションを持たないすべてのサイトスレッドのリストが返されます。

    **cURLの場合**

    ```bash
    ./MessageBoardThreads_GET_FromSite.sh {site-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DsiteId={site-id} MessageBoardThreads_GET_FromSite
    ```

1. セクション ID をパラメータとして `MessageBoardThreads_GET_FromSection` を実行する。 これにより、指定したセクション内のすべてのスレッドのリストが返されます。

    **cURLの場合**

    ```bash
    ./MessageBoardThreads_GET_FromSection.sh {message-board-section-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThreads_GET_FromSection
    ```

1. 上記のいずれかのスレッド ID をパラメータとして `MessageBoardMessage_POST_ToThread` を実行する。 これにより、指定されたスレッドの新しい掲示板のメッセージが作成されます。

    **cURLの場合**

    ```bash
    ./MessageBoardMessage_POST_ToThread.sh {message-board-thread-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessage_POST_ToThread
    ```

1. メッセージのIDをコピーして、以下のPUT、PATCH、POSTコマンドで使用します。

    ```bash
    {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Able Message",
      "id" : 43946,
      ...
      "messageBoardSectionId" : 43925,
      "messageBoardThreadId" : 43934,
      "parentMessageBoardMessageId" : 43933,
      ...
    }
    ```

    新しいメッセージはスレッドのルートメッセージ（`messageBoardRootMessageId`）の子メッセージとして作成されます。

1. メッセージの ID をパラメータとして `MessageBoardMessage_PATCH_ById` を実行する。 これにより、指定されたメッセージの詳細がAPI呼び出しで提供された詳細に更新されます。

    **cURLの場合**

    ```bash
    ./MessageBoardMessage_PATCH_ById.sh {message-board-message-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PATCH_ById
    ```

    これは `articleBody` フィールドを `Bar` に更新する。

1. 同じメッセージ ID をパラメータとして `MessageBoardMessage_PUT_ById` を実行する。 これにより、指定されたメッセージの詳細がAPI呼び出しで提供された詳細に置き換えられます。

    **cURLの場合**

    ```bash
    ./MessageBoardMessage_PUT_ById.sh {message-board-message-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PUT_ById
    ```

    これにより、`headline` フィールドが `Baker Message` に、`articleBody` フィールドが `Goo` に更新される。

1. 直前のメッセージ ID をパラメータとして `MessageBoardMessage_POST_ToParent` を実行する。 これにより、指定したメッセージの子メッセージが作成されます。

    **cURLの場合**

    ```bash
    ./MessageBoardMessage_POST_ToParent.sh {parent-message-board-message-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessage_POST_ToParent
    ```

    ```bash
    {
      ...
      "articleBody" : "Foo",
      ...
      "headline" : "Charlie Message",
      "id" : 43949,
      ...
      "messageBoardSectionId" : 43925,
      "messageBoardThreadId" : 43934,
      ...
      "parentMessageBoardMessageId" : 43946,
      ...
    }
    ```

1. スレッド ID をパラメータとして `MessageBoardMessages_GET_FromThread` を実行する。 これはスレッドのルートメッセージ（つまり `messageBoardRootMessage`）の子メッセージのリストを返します。

    **cURLの場合**

    ```bash
    ./MessageBoardMessages_GET_FromThread.sh {message-board-thread-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessages_GET_FromThread
    ```

    出力には、スレッドで作成した最初のメッセージのデータが含まれ、そのメッセージ自体に1つの子メッセージが含まれている必要があります。 これはメッセージの `numberOfMessageBoardMessages` フィールドで示される。

1. 直前のメッセージの ID をパラメータとして `MessageBoardMessages_GET_FromParent` を実行する。 これにより、指定したメッセージの子メッセージのすべてのリストが返されます。

    **cURLの場合**

    ```bash
    ./MessageBoardMessages_GET_FromParent.sh {parent-message-board-message-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessages_GET_FromParent
    ```

    出力には、最後に作成した子メッセージのデータも含まれるはずです。

1. 同じセクションIDをパラメータとして `MessageBoardSection_DELETE_ById` を実行する。 これにより、指定されたセクションが、そのスレッドやメッセージとともに削除されます。

    **cURLの場合**

    ```bash
    ./MessageBoardSection_DELETE_ById.sh {message-board-section-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_DELETE_ById
    ```

1. 同じセクション ID をパラメータとして `MessageBoardSection_GET_ById` を実行する。指定したセクションが存在すれば、その詳細を返します。

    **cURLの場合**

    ```bash
    ./MessageBoardSection_GET_ById.sh {message-board-section-id}
    ```

    **Javaの場合**

    ```bash
    java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_GET_ById
    ```

    前のステップでセクションを削除したため、次のメッセージが返されます。

    ```bash
    {
      "status" : "NOT_FOUND",
      "title" : "No MessageBoardSection exists with the primary key 43925"
    }
    ```

## コード参照

提供されているサンプルコードには、以下の `MessageBoardSection`、`MessageBoardThread`、`MessageBoardMessage` API 用の cURL スクリプトと Java クラスが含まれている。

### MessageBoardSectionのサンプルAPI

サンプルコードには、次のAPIを呼び出すcURLスクリプトとJavaクラスが含まれています。

| サービス                | HTTP メソッド | HTTPエンドポイント                                            | 説明                                                                    |
| :------------------ | :-------- | :----------------------------------------------------- | :-------------------------------------------------------------------- |
| MessageBoardSection | `POST`    | `/v1.0/sites/[siteId]/message-board-sections`          | API呼び出しで提供された詳細を使用して、新規カテゴリーを作成します                                    |
| MessageBoardSection | `GET`     | `/v1.0/sites/[siteId]/message-board-sections`          | 指定されたサイト内のすべてのカテゴリーの完全なリストを返します。結果に対して、ページ分割、絞り込み、検索、およびソートをすることができます |
| MessageBoardSection | `PATCH`   | `/v1.0/message-board-sections/[messageBoardSectionId]` | カテゴリのAPI呼び出しで指定されたフィールドのみを更新します                                       |
| MessageBoardSection | `PUT`     | `/v1.0/message-board-sections/[messageBoardSectionId]` | 指定されたカテゴリのすべてのフィールドを、API呼び出しで提供されたフィールドに置き換えます。                       |
| MessageBoardSection | `DELETE`  | `/v1.0/message-board-sections/[messageBoardSectionId]` | 指定されたスレッドを削除し、操作が成功した場合は204を返す                                     |

### MessageBoardThreadのサンプルAPI

| サービス               | HTTP メソッド | HTTPエンドポイント                                                                  | 説明                                                                    |
| :----------------- | :-------- | :--------------------------------------------------------------------------- | :-------------------------------------------------------------------- |
| MessageBoardThread | `POST`    | `/v1.0/sites/[siteId]/message-board-threads`                                 | API呼び出しで提供された詳細を使用して、新規スレッドを作成します                                     |
| MessageBoardThread | `POST`    | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | API呼び出しで提供された詳細を使用して、指定されたカテゴリ内に新規スレッドを作成します。                         |
| MessageBoardThread | `GET`     | `/v1.0/sites/[siteId]/message-board-threads`                                 | カテゴリに属さないすべてのサイトスレッドの完全なリストを返します。結果はページ分割、絞り込み、検索、ソートが可能です。           |
| MessageBoardThread | `GET`     | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | 指定されたカテゴリ内のすべてのスレッドの完全なリストを返します。結果に対して、ページ分割、絞り込み、検索、およびソートをすることができます |
| MessageBoardThread | `PATCH`   | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | スレッドのAPI呼び出しで指定されたフィールドのみを更新します                                       |
| MessageBoardThread | `PUT`     | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 指定されたスレッドのすべてのフィールドを、API呼び出しで提供されたフィールドに置き換えます                        |
| MessageBoardThread | `DELETE`  | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 指定されたスレッドを削除し、操作が成功した場合は204を返す                                      |

### MessageBoardMessageのサンプルAPI

| サービス                | HTTP メソッド | HTTPエンドポイント                                                                 | 説明                                                                     |
| :------------------ | :-------- | :-------------------------------------------------------------------------- | :--------------------------------------------------------------------- |
| MessageBoardMessage | `POST`    | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | API呼び出しで提供された詳細を使用して、指定されたスレッドに新規メッセージを作成します。                          |
| MessageBoardMessage | `GET`     | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | 指定されたスレッド内のすべてのメッセージの完全なリストを返します。結果に対して、ページ分割、絞り込み、検索、およびソートをすることができます |
| MessageBoardMessage | `PATCH`   | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | メッセージのAPI呼び出しで指定されたフィールドのみを更新します                                       |
| MessageBoardMessage | `PUT`     | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 指定されたメッセージのすべてのフィールドを、APIコールで提供されたフィールドに置き換えます                         |
| MessageBoardMessage | `DELETE`  | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 指定されたメッセージを削除し、成功すれば204を返す                                      |

## サンプルのcURLスクリプトの検証

以下は、チュートリアルのcURLコマンドの代表的な例です。

### MessageBoardSection_POST_ToSite.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSection_POST_ToSite.sh
   :language: bash
```

### MessageBoardSection_PUT_ById.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSection_PUT_ById.sh
   :language: bash
```

### MessageBoardSections_GET_FromSite.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSections_GET_FromSite.sh
   :language: bash
```

### MessageBoardSection_DELETE_ById.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardSection_DELETE_ById.sh
   :language: bash
```

### MessageBoardThread_POST_ToSection.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardThread_POST_ToSection.sh
   :language: bash
```

### MessageBoardMessage_POST_ToThread.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardMessage_POST_ToThread.sh
   :language: bash
```

### MessageBoardMessage_POST_ToParent.sh

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/curl/MessageBoardMessage_POST_ToParent.sh
   :language: bash
```

## サンプルのJavaクラスの検証

以下は、チュートリアルのJavaコマンドの代表的な例です。

### MessageBoardSection_POST_ToSite.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSection_POST_ToSite.java
   :language: java
   :lines: 4-31
```

### MessageBoardSection_PUT_ById.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSection_PUT_ById.java
   :language: java
   :lines: 4-31
```

### MessageBoardSections_GET_FromSite.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSections_GET_FromSite.java
   :language: java
   :lines: 6-28
```

### MessageBoardSection_DELETE_ById.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardSection_DELETE_ById.java
   :language: java
   :lines: 3-21
```

### MessageBoardThread_POST_ToSection.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardThread_POST_ToSection.java
   :language: java
   :lines: 4-32
```

### MessageBoardMessage_POST_ToThread.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardMessage_POST_ToThread.java
   :language: java
   :lines: 4-32
```

### MessageBoardMessage_POST_ToParent.java

```{literalinclude} ./message-boards-api-basics/resources/liferay-y3a6.zip/java/MessageBoardMessage_POST_ToParent.java
   :language: java
   :lines: 4-33
```

## 関連トピック

* [掲示板を始める](../user-guide/getting-started-with-message-boards.md) 
* [掲示板設定リファレンス](./../user-guide/message-boards-configuration-reference.md) 
