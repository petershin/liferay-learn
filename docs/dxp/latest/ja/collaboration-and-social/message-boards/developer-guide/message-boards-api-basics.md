# メッセージボードAPIの基本

Liferay の Headless Delivery アプリケーションは、 [掲示板](../../message-boards.md) アプリケーションの REST サービスを提供します。 これらのサービスでは、掲示板のカテゴリ、スレッド、メッセージの追加、情報の一覧表示、内容の修正、削除が可能です。 ここでは、cURLコマンドとJavaクラスを使用してこれらのサービスを呼び出します。

```{note}
掲示板のカテゴリは、Liferayのバックエンドでは*sections*という名前になっています。 スレッドを整理するためのトピックを定義するセクションです。
```

## チュートリアルリソースの準備

チュートリアルに進む前に、まずクリーンなLiferay Dockerコンテナをセットアップし、提供されたチュートリアルコードを使用できるように準備します。

### Liferay Dockerコンテナ

```{include} /_snippets/run-liferay-portal.md
```

起動したら、サイトIDを取得します。サイトIDを取得するには、 **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 **設定** &rarr; **サイト設定** &rarr; **サイト設定** に移動します。

サイト構成設定の下にあるサイトIDを探す](./message-boards-api-basics/images/01.png)。

### チュートリアルコード

以下は、Headless APIのデモを行うためのサンプルコードです。このコードには、サンプルのcURLファイルとJavaファイルの両方が含まれています。

以下のコマンドを実行し、 [サンプルコード](https://learn.liferay.com/dxp/latest/ja/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip) をダウンロード、解凍してください。

```bash
curl https://learn.liferay.com/dxp/latest/ja/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip -O
```

```bash
unzip liferay-y3a6.zip
```

cURLスクリプトはすぐに使えるようになっていますが、Javaのソースファイルは実行する前に手動でコンパイルする必要があります。 そのためには、プロジェクトの `java` フォルダに移動して、 `javac` コマンドを実行します。

```bash
cd liferay-y3a6/java
```

```bash
javac -classpath .:* *.java
```

プロジェクトには、依存関係として`com.liferay.headless.delivery.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

提供されるコードには、 `MessageBoardSection`, `MessageBoardThread` and `MessageBoardMessage` サービス用のAPIが含まれています。 含まれるすべてのサンプルAPIの一覧は、 [チュートリアル・コード・リファレンス](#tutorial-code-reference) を参照してください。

```{important}
提供されるコードでは、デモのためにBasic認証を使用しています。 本番環境では、 [OAuth2](../../.../headless-delivery/using-oauth2.md) を使用してユーザーを認証する必要があります。
```

## サンプルAPIを呼び出す

この演習では、cURL コマンドまたは Java クラスを使って、 `MessageBoardSection`、 `MessageBoardThread` 、 `MessageBoardMessage` の API を呼び出すことができます。 以下の出力例は、cURLコマンドに対応するもので、提供されたJavaクラスの出力とは若干異なります。

1. `liferay-y3a6` プロジェクト内の `curl` または `java` フォルダに移動します。

   **cURLの場合：**

   ```bash
   cd liferay-y3a6/curl
   ```

   **Javaの場合：**

   ```bash
   cd liferay-y3a6/java
   ```

1. `MessageBoardSection_POST_ToSite` を、サイト ID をパラメータとして実行します。 指定されたサイトに新しい掲示板セクションを作成します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_POST_ToSite.sh {site-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSection_POST_ToSite
   ```

   ターミナルには、新しく作成されたセクションの完全なスキーマが表示されます。 提供されるAPIコールは、新しいセクションの `description` と `name` フィールドのみを定義します。

1. 以下のGET、PATCH、PUT、DELETEメソッドで使用するために、セクションのIDをコピーします。

   ```bash
   {
     ...
     "description" : "Foo",
     "id" : 43925,
     ...
     "name" : "Able Section",
     ...
   }
   ```

1. `MessageBoardSections_GET_FromSite` を、パラメータにサイトIDを指定して実行します。 指定されたサイト内のすべてのセクションのリストを返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSections_GET_FromSite.sh {site-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSections_GET_FromSite
   ```

1. `MessageBoardSection_PATCH_ById` をメッセージボードセクションの ID をパラメータとして実行します。 指定されたセクションの詳細を、APIコールで提供されたものに更新します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_PATCH_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PATCH_ById
   ```

   これにより、 `説明文` フィールドが `バー`に更新されます。

1. `MessageBoardSection_PUT_ById` を、同じセクション ID をパラメータとして実行する。 指定されたセクションの詳細を、APIコールで提供されるものに置き換えます。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_PUT_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PUT_ById
   ```

   これにより、 `name` フィールドが `Baker Section` に、 `description` フィールドが `Goo`に更新されます。

1. `MessageBoardThread_POST_ToSite` を、パラメータにサイトIDを指定して実行します。 これにより、このサイトの新しい掲示板のスレッドが作成されます。

   **cURLの場合：**

   ```bash
   ./MessageBoardThread_POST_ToSite.sh {site-id}
   ```

   **Javaの場合：**

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

   すべてのスレッドは、スレッド内のすべての直接返信の親メッセージとして機能するルートメッセージで作成されます（すなわち、 `messageBoardRootMessageId`）。

1. `MessageBoardThread_POST_ToSection` を上記セクションIDをパラメータに実行します。 指定したセクションの新しい掲示板のスレッドを作成します。

   **cURLの場合：**

   ```bash
   ./MessageBoardThread_POST_ToSection.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThread_POST_ToSection
   ```

1. 以下のGET、PATCH、PUTメソッドで使用するために、このスレッドのIDをコピーします。

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

1. `MessageBoardThread_PATCH_ById` を、スレッドの ID をパラメータとして実行します。 指定されたスレッドの詳細を、APIコールで提供されたものに更新する。

   **cURLの場合：**

   ```bash
   ./MessageBoardThread_PATCH_ById.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PATCH_ById
   ```

   これにより、 `articleBody` フィールドが `Bar`に更新されます。

1. `MessageBoardThread_PUT_ById` を、パラメータに同じスレッド ID を使って実行する。 これは、指定されたスレッドの詳細を、APIコールで提供されたものに置き換えるものである。

   **cURLの場合：**

   ```bash
   ./MessageBoardThread_PUT_ById.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PUT_ById
   ```

   これにより、 `headline` フィールドが `Charlie Thread` に、 `articleBody` フィールドが `Goo`に更新されます。

1. `MessageBoardThreads_GET_FromSite` を、パラメータにサイトIDを指定して実行します。 これは、セクションを持たないすべてのサイトスレッドのリストを返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardThreads_GET_FromSite.sh {site-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardThreads_GET_FromSite
   ```

1. `MessageBoardThreads_GET_FromSection` を、セクション ID をパラメータとして実行します。 指定されたセクションにあるすべてのスレッドのリストを返す。

   **cURLの場合：**

   ```bash
   ./MessageBoardThreads_GET_FromSection.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThreads_GET_FromSection
   ```

1. `MessageBoardMessage_POST_ToThread` を、上記のいずれかのスレッド ID をパラメータとして実行します。 指定されたスレッドに対して、新しい掲示板のメッセージを作成します。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessage_POST_ToThread.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessage_POST_ToThread
   ```

1. 次の PUT、PATCH、POST コマンドで使用するために、メッセージの ID をコピーします。

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

   新しいメッセージは、スレッドのルートメッセージ（`messageBoardRootMessageId`）の子として作成されます。

1. メッセージの ID をパラメータに、 `MessageBoardMessage_PATCH_ById` を実行する。 指定されたメッセージの内容を、APIコールで提供された内容で更新する。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessage_PATCH_ById.sh {message-board-message-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PATCH_ById
   ```

   これにより、 `articleBody` フィールドが `Bar`に更新されます。

1. 同じメッセージ ID をパラメータとして、 `MessageBoardMessage_PUT_ById` を実行する。 指定されたメッセージの内容を、APIコールで提供された内容で置き換えます。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessage_PUT_ById.sh {message-board-message-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PUT_ById
   ```

   これにより、 `headline` フィールドが `Baker Message` に、 `articleBody` フィールドが `Goo`に更新されます。

1. `MessageBoardMessage_POST_ToParent` を、直前のメッセージ ID をパラメータに実行する。 指定されたメッセージの新しい子メッセージを作成します。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessage_POST_ToParent.sh {parent-message-board-message-id}
   ```

   **Javaの場合：**

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

1. `MessageBoardMessages_GET_FromThread` を、パラメータにスレッド ID を指定して実行します。 スレッドのルートメッセージに対する子メッセージのリストを返します（すなわち、 `messageBoardRootMessage`）。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessages_GET_FromThread.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessages_GET_FromThread
   ```

   出力には、スレッドで作成した最初のメッセージのデータが含まれるはずで、それ自体が1つの子メッセージを持つはずです。 これは、メッセージの `numberOfMessageBoardMessages` フィールドで示される。

1. 直前のメッセージの ID をパラメータとして、 `MessageBoardMessages_GET_FromParent` を実行する。 指定された Message の全ての子メッセージのリストを返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessages_GET_FromParent.sh {parent-message-board-message-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessages_GET_FromParent
   ```

   最後に作成した子メッセージのデータも出力されるはずです。

1. `MessageBoardSection_DELETE_ById` を、同じセクション ID をパラメータとして実行します。 指定されたセクションとそのスレッド、メッセージを削除します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_DELETE_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_DELETE_ById
   ```

1. 同じセクション ID をパラメータに、 `MessageBoardSection_GET_ById` を実行する。 指定されたセクションが存在する場合、その詳細を返す。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_GET_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_GET_ById
   ```

   前のステップでセクションを削除したため、次のようなメッセージが返されます。

   ```bash
   {
     "status" : "NOT_FOUND",
     "title" : "No MessageBoardSection exists with the primary key 43925"
   }
   ```

## コード参照

提供するサンプルコードには、以下の `MessageBoardSection`、 `MessageBoardThread` 、 `MessageBoardMessage` API のための cURL スクリプトと Java クラスが含まれています。

### MessageBoardSection API のサンプル

サンプルコードには、次のAPIを呼び出すcURLスクリプトとJavaクラスが含まれています。

| サービス                | HTTP メソッド | HTTPエンドポイント                                            | 説明                                                             |
|:------------------- |:--------- |:------------------------------------------------------ |:-------------------------------------------------------------- |
| MessageBoardSection | `POST`    | `/v1.0/sites/[siteId]/message-board-sections`          | APIコールで指定された内容で、新しいカテゴリーを作成する                                  |
| MessageBoardSection | `GET`     | `/v1.0/sites/[siteId]/message-board-sections`          | 指定されたサイトのすべてのカテゴリの完全なリストを返します。結果はページ分割、フィルタリング、検索、およびソートが可能です。 |
| MessageBoardSection | `PATCH`   | `/v1.0/message-board-sections/[messageBoardSectionId]` | カテゴリのAPIコールで指定されたフィールドのみを更新する                                  |
| MessageBoardSection | `PUT`     | `/v1.0/message-board-sections/[messageBoardSectionId]` | 指定されたカテゴリのすべてのフィールドを、APIコールで提供されたフィールドに置き換える                   |
| MessageBoardSection | `DELETE`  | `/v1.0/message-board-sections/[messageBoardSectionId]` | 指定されたカテゴリを削除し、成功した場合は204を返す。                                   |

### MessageBoardThread API のサンプル

| サービス         | HTTP メソッド | HTTPエンドポイント                                                                  | 説明                                                                |
|:------------ |:--------- |:---------------------------------------------------------------------------- |:----------------------------------------------------------------- |
| メッセージボードスレッド | `POST`    | `/v1.0/sites/[siteId]/message-board-threads`                                 | APIコールで指定された内容で新しいスレッドを作成します。                                     |
| メッセージボードスレッド | `POST`    | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | APIコールで提供された詳細を使用して、指定されたカテゴリ内に新しいスレッドを作成します。                     |
| メッセージボードスレッド | `GET`     | `/v1.0/sites/[siteId]/message-board-threads`                                 | カテゴリに属さないすべてのサイトスレッドの完全なリストを返します。結果はページ分割、フィルタリング、検索、およびソートが可能です。 |
| メッセージボードスレッド | `GET`     | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | 指定されたカテゴリの全スレッドの完全なリストを返します。結果はページ分割、フィルタリング、検索、ソートが可能です          |
| メッセージボードスレッド | `PATCH`   | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | スレッドのAPIコールで指定されたフィールドのみを更新する                                     |
| メッセージボードスレッド | `PUT`     | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 指定されたスレッドのすべてのフィールドを、APIコールで提供されたフィールドに置き換える。                     |
| メッセージボードスレッド | `DELETE`  | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 指定されたスレッドを削除し、操作に成功した場合は204を返す                                    |

### MessageBoardMessage API のサンプル

| サービス           | HTTP メソッド | HTTPエンドポイント                                                                 | 説明                                                        |
|:-------------- |:--------- |:--------------------------------------------------------------------------- |:--------------------------------------------------------- |
| メッセージボード・メッセージ | `POST`    | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | 指定されたスレッドに、APIコールで指定された詳細な情報を持つ新規メッセージを作成する。              |
| メッセージボード・メッセージ | `GET`     | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | 指定されたスレッドにある全てのメッセージの完全なリストを返す。結果はページ分割、フィルタリング、検索、ソートが可能 |
| メッセージボード・メッセージ | `PATCH`   | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | メッセージのAPIコールで指定されたフィールドのみを更新します。                          |
| メッセージボード・メッセージ | `PUT`     | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 指定されたメッセージのすべてのフィールドを、APIコールで提供されたフィールドに置き換える             |
| メッセージボード・メッセージ | `DELETE`  | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 指定されたメッセージを削除し、成功した場合は 204 を返す。                           |

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

### MessageBoardThread_POST_ToSection.sh（メッセージボードスレッドポストセクション）。

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

## 追加情報

* [掲示板の概要](../user-guide/getting-started-with-message-boards.md)
* [掲示板の設定リファレンス](./../user-guide/message-boards-configuration-reference.md)
