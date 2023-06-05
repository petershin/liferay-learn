# メッセージボードAPIの基本

Liferay の Headless Delivery アプリケーションは、 [掲示板](../../message-boards.md) アプリケーションに REST サービスを提供します。 これらのサービスでは、掲示板のカテゴリやスレッド、メッセージの追加、情報の一覧表示、内容の修正、削除が可能です。 ここでは、cURLコマンドとJavaクラスを使用してこれらのサービスを呼び出します。

```{note}
掲示板のカテゴリは、Liferayのバックエンドでは*sections*という名前になっています。 スレッドを整理するためのトピックを定義するセクションです。
```

## チュートリアルリソースの準備

チュートリアルに進む前に、まずクリーンなLiferay Dockerコンテナをセットアップし、提供されたチュートリアルコードを使用できるように準備します。

### Liferay Dockerコンテナ

```{include} /_snippets/run-liferay-portal.md
```

起動したら、サイトIDを取得します。サイトIDを調べるには、 **サイトメニュー**(！ [サイトメニュー](./../../images/icon-menu.png) ）を開き、 **設定** &rarr; **サイト設定** &rarr; **サイト設定** に移動します。

![サイト構成設定の下にあるサイトIDを探す](./message-board-api-basics/images/01.png)

### チュートリアルコード

以下は、ヘッドレスAPIをデモするためのサンプルコードです。このコードには、サンプルのcURLファイルとJavaファイルの両方が含まれています。

以下のコマンドを実行し、 [サンプルコード](https://learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip) をダウンロードし、解凍してください：

```bash
curl https://learn.liferay.com/dxp/latest/en/collaboration-and-social/message-boards/developer-guide/liferay-y3a6.zip -O
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

提供されるコードには、 `MessageBoardSection`、 `MessageBoardThread` 、 `MessageBoardMessage` サービス用のAPIが含まれています。 収録されているサンプルAPIの一覧は、 [チュートリアルコードリファレンス](#tutorial-code-reference) をご参照ください。

```{important}
提供されるコードは、デモのために基本認証を使用しています。 本番環境では、 [OAuth2](../../../headless-delivery/using-oauth2.md) を使用してユーザーを認証する必要があります。
```

## サンプルAPIを呼び出す

この演習では、cURL コマンドまたは Java クラスを使用して、 `MessageBoardSection`, `MessageBoardThread` and `MessageBoardMessage` の API を呼び出すことができます。 以下の出力例は、cURLコマンドに対応しており、提供されたJavaクラスの出力とは若干異なっています。

1. `liferay-y3a6` プロジェクトの `curl` または `java` フォルダに移動します。

   **cURLの場合：**

   ```bash
   cd liferay-y3a6/curl
   ```

   **Javaの場合：**

   ```bash
   cd liferay-y3a6/java
   ```

1. `MessageBoardSection_POST_ToSite` を、お客様のサイトIDをパラメータとして実行します。 指定したサイト内に、新しいメッセージボードセクションを作成します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_POST_ToSite.sh {site-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSection_POST_ToSite
   ```

   ターミナルには、新しく作成されたセクションの完全なスキーマが表示されます。 提供されるAPIコールは、新しいセクションの `description` 、 `name` フィールドのみを定義します。

1. 以下のGET、PATCH、PUT、DELETEメソッドで使用するために、セクションのIDをコピーします。

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

1. `MessageBoardSections_GET_FromSite` を、パラメータにサイトIDを使用して実行する。 指定したサイト内の全セクションの一覧を返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSections_GET_FromSite.sh {site-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardSections_GET_FromSite
   ```

1. `MessageBoardSection_PATCH_ById` をメッセージボードセクションのIDをパラメータとして実行する。 指定されたセクションの詳細を、APIコールで提供されたものに更新します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_PATCH_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PATCH_ById
   ```

   これにより、 `description` フィールドが `Bar`に更新されます。

1. `MessageBoardSection_PUT_ById` を、同じセクションIDをパラメータとして実行する。 指定されたセクションの詳細を、APIコールで提供されたものに置き換えます。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_PUT_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_PUT_ById
   ```

   これにより、 `name` フィールドが `Baker Section` に、 `description` フィールドが `Goo`に更新されます。

1. `MessageBoardThread_POST_ToSite` を、パラメータにサイトIDを使用して実行する。 これにより、サイトの新しい掲示板のスレッドが作成されます。

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

   すべてのスレッドは、スレッド内のすべての直接返信の親メッセージとして機能するルートメッセージで作成されます(すなわち、 `messageBoardRootMessageId`）。

1. `MessageBoardThread_POST_ToSection` を、上記セクションIDをパラメータとして実行する。 指定されたセクションの新しいメッセージボードスレッドを作成します。

   **cURLの場合：**

   ```bash
   ./MessageBoardThread_POST_ToSection.sh {message-board-section-id}
   ```

   **Javaの場合：**

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

1. `MessageBoardThread_PATCH_ById` を、スレッドの ID をパラメータとして実行する。 指定されたスレッドの詳細を、APIコールで提供されたものに更新します。

   **cURLの場合：**

   ```bash
   ./MessageBoardThread_PATCH_ById.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PATCH_ById
   ```

   これにより、 `articleBody` フィールドが `Bar`に更新されます。

1. `MessageBoardThread_PUT_ById` を、同じスレッドIDをパラメータとして実行する。 指定されたスレッドの詳細を、APIコールで提供されたものに置き換えます。

   **cURLの場合：**

   ```bash
   ./MessageBoardThread_PUT_ById.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardThread_PUT_ById
   ```

   これにより、 `headline` フィールドが `Charlie Thread` に、 `articleBody` フィールドが `Goo`に更新されます。

1. `MessageBoardThreads_GET_FromSite` を、パラメータにサイトIDを使用して実行する。 セクションを持たないすべてのサイトスレッドのリストを返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardThreads_GET_FromSite.sh {site-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DsiteId={site-id} MessageBoardThreads_GET_FromSite
   ```

1. `MessageBoardThreads_GET_FromSection` を、セクションIDをパラメータとして実行する。 指定されたセクションにあるすべてのスレッドのリストを返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardThreads_GET_FromSection.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardThreads_GET_FromSection
   ```

1. `MessageBoardMessage_POST_ToThread` を、上記のいずれかのスレッドIDをパラメータとして実行する。 指定されたスレッドに対して、新しいメッセージボードのメッセージを作成します。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessage_POST_ToThread.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessage_POST_ToThread
   ```

1. 以下のPUT、PATCH、POSTコマンドで使用するために、メッセージのIDをコピーします。

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

   新しいメッセージは、スレッドのルートメッセージ(`messageBoardRootMessageId`）の子として作成されます。

1. メッセージの ID をパラメータとして、 `MessageBoardMessage_PATCH_ById` を実行する。 指定されたメッセージの詳細を、APIコールで提供されたものに更新します。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessage_PATCH_ById.sh {message-board-message-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PATCH_ById
   ```

   これにより、 `articleBody` フィールドが `Bar`に更新されます。

1. `MessageBoardMessage_PUT_ById` を、同じメッセージ ID をパラメータとして実行する。 指定されたメッセージの詳細を、APIコールで提供されたものに置き換えます。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessage_PUT_ById.sh {message-board-message-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardMessageId={message-board-message-id} MessageBoardMessage_PUT_ById
   ```

   これにより、 `headline` フィールドが `Baker Message` に、 `articleBody` フィールドが `Goo`に更新されます。

1. `MessageBoardMessage_POST_ToParent` を、直前のメッセージIDをパラメータとして実行する。 指定されたメッセージの子メッセージを新規に作成します。

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

1. `MessageBoardMessages_GET_FromThread` を、スレッド ID をパラメータとして実行する。 スレッドのルートメッセージ(すなわち、 `messageBoardRootMessage`）に対する子メッセージのリストを返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessages_GET_FromThread.sh {message-board-thread-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardThreadId={message-board-thread-id} MessageBoardMessages_GET_FromThread
   ```

   出力には、スレッドで作成した最初のメッセージのデータが含まれ、そのメッセージ自体が1つの子メッセージを持つはずです。 これは、メッセージの `numberOfMessageBoardMessages` フィールドで示されます。

1. `MessageBoardMessages_GET_FromParent` を、直前のメッセージの ID をパラメータとして実行する。 指定されたMessageのすべての子メッセージのリストを返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardMessages_GET_FromParent.sh {parent-message-board-message-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DparentMessageBoardMessageId={parent-message-board-message-id} MessageBoardMessages_GET_FromParent
   ```

   出力には、最後に作成した子メッセージのデータも含まれるはずです。

1. `MessageBoardSection_DELETE_ById` を、同じセクションIDをパラメータとして実行する。 指定されたセクションを、そのスレッドやメッセージとともに削除します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_DELETE_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

   ```bash
   java -classpath .:* -DmessageBoardSectionId={message-board-section-id} MessageBoardSection_DELETE_ById
   ```

1. `MessageBoardSection_GET_ById` を、同じセクションIDをパラメータとして実行する。 指定されたセクションが存在する場合、その詳細を返します。

   **cURLの場合：**

   ```bash
   ./MessageBoardSection_GET_ById.sh {message-board-section-id}
   ```

   **Javaの場合：**

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

提供されるサンプルコードには、以下の `MessageBoardSection`、 `MessageBoardThread` 、 `MessageBoardMessage` の API の cURL スクリプトと Java クラスが含まれています。

### MessageBoardSectionのサンプルAPI

サンプルコードには、次のAPIを呼び出すcURLスクリプトとJavaクラスが含まれています。

| サービス                              | HTTP メソッド | HTTPエンドポイント                                            | 説明                                                           |
|:--------------------------------- |:--------- |:------------------------------------------------------ |:------------------------------------------------------------ |
| MessageBoardSection(メッセージボードセクション | `POST`    | `/v1.0/sites/[siteId]/message-board-sections`          | APIコールで指定された内容で、新しいカテゴリーを作成します。                              |
| MessageBoardSection(メッセージボードセクション | `GET`     | `/v1.0/sites/[siteId]/message-board-sections`          | 指定されたサイト内のすべてのカテゴリの完全なリストを返します。結果はページ分割、フィルタリング、検索、ソートが可能です。 |
| MessageBoardSection(メッセージボードセクション | `PATCH`   | `/v1.0/message-board-sections/[messageBoardSectionId]` | カテゴリのAPIコールで指定されたフィールドのみを更新します。                              |
| MessageBoardSection(メッセージボードセクション | `PUT`     | `/v1.0/message-board-sections/[messageBoardSectionId]` | 指定されたカテゴリのすべてのフィールドを、APIコールで提供されたフィールドに置き換えます。               |
| MessageBoardSection(メッセージボードセクション | `DELETE`  | `/v1.0/message-board-sections/[messageBoardSectionId]` | 指定されたカテゴリーを削除し、成功した場合は204を返す                                 |

### MessageBoardThreadのサンプルAPI

| サービス         | HTTP メソッド | HTTPエンドポイント                                                                  | 説明                                                             |
|:------------ |:--------- |:---------------------------------------------------------------------------- |:-------------------------------------------------------------- |
| メッセージボードスレッド | `POST`    | `/v1.0/sites/[siteId]/message-board-threads`                                 | APIコールで指定された内容で、新しいスレッドを作成します。                                 |
| メッセージボードスレッド | `POST`    | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | APIコールで提供された詳細を使用して、指定されたカテゴリ内に新しいスレッドを作成します。                  |
| メッセージボードスレッド | `GET`     | `/v1.0/sites/[siteId]/message-board-threads`                                 | カテゴリに属さないすべてのサイトスレッドの完全なリストを返します。結果はページ分割、フィルタリング、検索、ソートが可能です。 |
| メッセージボードスレッド | `GET`     | `/v1.0/message-board-sections/[messageBoardSectionId]/message-board-threads` | 指定されたカテゴリのすべてのスレッドの完全なリストを返します。結果は、ページ分割、フィルタリング、検索、ソートが可能です。  |
| メッセージボードスレッド | `PATCH`   | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | スレッドに対してAPIコールで指定されたフィールドのみを更新する。                              |
| メッセージボードスレッド | `PUT`     | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 指定されたスレッドのすべてのフィールドを、APIコールで提供されたものに置き換える。                     |
| メッセージボードスレッド | `DELETE`  | `/v1.0/message-board-threads/[messageBoardThreadId]`                         | 指定されたスレッドを削除し、成功した場合は 204 を返す                                  |

### MessageBoardMessageのサンプルAPI

| サービス                | HTTP メソッド | HTTPエンドポイント                                                                 | 説明                                                                   |
|:------------------- |:--------- |:--------------------------------------------------------------------------- |:-------------------------------------------------------------------- |
| MessageBoardMessage | `POST`    | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | APIコールで指定された詳細な内容で、指定されたスレッドに新しいメッセージを作成します。                         |
| MessageBoardMessage | `GET`     | `/v1.0/message-board-threads/[messageBoardThreadId]/message-board-messages` | 指定されたスレッドにあるすべてのメッセージの完全なリストを返します。結果は、ページ分割、フィルタリング、検索、ソートすることができます。 |
| MessageBoardMessage | `PATCH`   | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | メッセージのAPIコールで指定されたフィールドのみを更新する。                                      |
| MessageBoardMessage | `PUT`     | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 指定されたメッセージのすべてのフィールドを、APIコールで提供されたフィールドに置き換えます。                      |
| MessageBoardMessage | `DELETE`  | `/v1.0/message-board-messages/[messageBoardMessageId]`                      | 指定されたメッセージを削除し、成功すれば204を返す。                                          |

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

* [掲示板の概要](../user-guide/getting-started-with-message-boards.md)
* [掲示板の設定リファレンス](./../user-guide/message-boards-configuration-reference.md)
