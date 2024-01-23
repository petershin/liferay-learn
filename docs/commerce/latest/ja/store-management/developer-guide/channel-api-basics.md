# チャンネルAPIの基本

アプリケーションメニューやREST APIでチャンネルを管理することができます。 [headless-commerce-admin-channel](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-channel/v1.0/openapi.json) サービスを呼び出して、チャンネルを作成・管理します。

## チャネルを追加する

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら、

1. [Channel API Basics](./liferay-a2t5.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/store-management/developer-guide/liferay-a2t5.zip -O
   ```

   ```bash
   unzip liferay-a2t5.zip
   ```

1. チャンネルはインスタンスにスコープされ、各チャンネルは `currencyCode`、 `name`、 `type`を指定する必要があります。 1つのタイプ、 `サイト`は、すぐに利用可能です。

   cURLスクリプトを使用して、新しいチャンネルを追加します。 コマンドラインで、 `curl`フォルダに移動します。 `Channel_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Channel_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しいチャンネルが追加されたことが示されています：

   ```json
   {
      "currencyCode" : "USD",
      "externalReferenceCode" : "29f395e8-779c-e95e-36f6-844a1ebf00c4",
      "id" : 46901,
      "name" : "Foo",
      "siteGroupId" : 0,
      "type" : "site"
   }
   ```

1. チャンネルの追加を確認するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Channels** に移動してください。 新しいチャンネルが表示されます。

   ![新しいチャンネルが追加されたことを確認する。](./channel-api-basics/images/01.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Channel_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* Channel_POST_ToInstance
   ```

## cURLコマンドの検証

`Channel_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                    | 説明                                 |
|:------------------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                 | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                             | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-channel/v1.0/channels"`             | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"currencyCode\": \"USD\", \"name\": \"Foo\", \"type\": \"site\"}"` | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                         | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/ja/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/ja/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Channel_POST_ToInstance.java` クラスは、 `ChannelResource` サービスを呼び出してチャンネルを追加します。

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                   | 説明                                                      |
|:------------------------------------------------------------------------ |:------------------------------------------------------- |
| `ChannelResource.Builder builder = ...`                                  | `ChannelResource` サービスインスタンスを生成するための `Builder` を取得する。   |
| `ChannelResource channelResource = builder.authentication(...).build();` | 基本認証を使用し、 `ChannelResource` サービスインスタンスを生成します。           |
| `channelResource.postChannel(...);`                                      | `channelResource.postChannel` メソッドを呼び出し、post にデータを渡します。 |

このプロジェクトには、依存関係として`com.liferay.headless.commerce.admin.channel.client.jar` ファイルが含まれています。 すべてのRESTアプリケーションのクライアントJAR依存情報は、インストール先のAPIエクスプローラーで`/o/api` (例: <http://localhost:8080/o/api>) から確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプルJavaクラスは、異なる `ChannelResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [ChannelResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/admin-channel-client/src/main/java/com/liferay/headless/commerce/admin/channel/client/resource/v1_0/ChannelResource.java) を参照ください。
```

以下は、cURLとJavaを使用して他の `Channel` RESTサービスを呼び出す例です。

## インスタンスからチャンネルを取得する

cURLまたはJavaコマンドで、Liferayインスタンスの全チャンネルをリストアップします。

### Channels_GET_FromInstance.sh

コマンド：

```bash
./Channels_GET_FromInstance.sh
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channels_GET_FromInstance.sh
   :language: bash
```

### Channels_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Channels_GET_FromInstance
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channels_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-19
```

インスタンスの `Channel` オブジェクトはJSONでフォーマットされています。

### チャネルのフィルタリング、ページ分割、検索、ソート

このAPIは、チャンネルをフィルタリング、ページ分割、検索、ソートするためのパラメータも受け付けます。 詳しくは、 [`getChannelsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-channel-client/src/main/java/com/liferay/headless/commerce/admin/channel/client/resource/v1_0/ChannelResource.java#L43-#L46) メソッドをご参照ください。 クエリでは、以下の `Channel` フィールドを使用して、結果のフィルタリング、検索、ソートを行うことができます：

* name
* siteGroupId

| フィルタークエリ                 | 説明                                       |
|:------------------------ |:---------------------------------------- |
| `siteGroupId eq '12345'` | チャネルの siteGroupId は 12345 と同じでなければなりません。 |
| `name eq 'Foo'`          | チャンネル名はFooと同じでなければならない。                  |

| ソートクエリ            | 説明                    |
|:----------------- |:--------------------- |
| `name:desc`       | 名前の降順で並べます。           |
| `siteGroupId:asc` | siteGroupIdの昇順でソートする。 |

詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/api-query-parameters.html) をご参照ください。

## チャンネルを取得する

cURL または Java `get` コマンドで特定のチャンネルを取得します。 `1234` をチャンネルのIDに置き換えてください。

```{tip}
`Channels_GET_FromInstance.[java|sh]`を使用して、すべてのチャンネルのリストを取得し、特に必要なチャンネルの `id` をメモします。
```

### Channel_GET_ById.sh

コマンド：

```bash
./Channel_GET_ById.sh 1234
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_GET_ById.sh
   :language: bash
```

### Channel_GET_ById.java

コマンド：

```bash
java -classpath .:* -DchannelId=1234 Channel_GET_ById
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`チャンネル` のフィールドを JSON で列挙します。

## チャンネルをパッチする

cURL と Java `patch` コマンドで既存のチャンネルを更新します。 `1234` を自分のチャンネルのIDに置き換えてください。

### Channel_PATCH_ById.sh

コマンド：

```bash
./Channel_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_PATCH_ById.sh
   :language: bash
```

###  Channel_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DchannelId=1234 Channel_PATCH_ById
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## チャンネルを削除する

cURL と Java `delete` コマンドで既存のチャンネルを削除します。 `1234` を自分のチャンネルのIDに置き換えてください。

### Channel_DELETE_ById.sh

コマンド：

```bash
./Channel_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/curl/Channel_DELETE_ById.sh
   :language: bash
```

### Channel_DELETE_ById.java

コマンド：

```bash
java -classpath .:* -DchannelId=1234 Channel_DELETE_ById
```

コード：

```{literalinclude} ./channel-api-basics/resources/liferay-a2t5.zip/java/Channel_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/dxp/latest/ja/headless-delivery/consuming-apis/consuming-rest-services.html) では、 `Channel` のサービスとスキーマを表示し、各サービスをテストするためのインターフェイスを備えています。
