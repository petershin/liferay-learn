# ドキュメントAPIの基本

LiferayのHeadless Deliveryアプリケーションは、 [ドキュメントとメディア](../../documents-and-media.md) のRESTサービスを提供し、ドキュメントとフォルダの追加、情報の一覧表示、変更、削除などを行います。 ここでは、cURLコマンドとJavaクラスを使用してこれらのサービスを呼び出します。

サンプルのcURLコマンドとJavaクラスを使用してドキュメントをアップロードすることから始めます。

## ドキュメントを投稿する

```{include} /_snippets/run-liferay-portal.md
```

ログインすると、 [サイトのIDを取得します](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) 。 このIDはいくつかのサービスコールで使用することになります。

次に、以下の手順に従います。

1. [サンプルのプロジェクト](https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/documents-and-media/developer-guide/liferay-g9i6.zip) をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/documents-and-media/developer-guide/liferay-g9i6.zip -O
   ```

   ```bash
   unzip liferay-g9i6.zip
   ```

cURLスクリプトを使用して、ファイルを [ドキュメントとメディア](../../documents-and-media.md) にアップロードします。

1. コマンドラインで `curl` フォルダに移動します。

   ```bash
   cd liferay-g9i6.zip/curl
   ```

1. サイトIDをパラメータとして`Document_POST_ToSite.sh`スクリプトを実行してファイルをアップロードする。 例えば、

   ```bash
   ./Document_POST_ToSite.sh 1234
   ```

    ```{note}
    ユーザーとパスワードがそれぞれ `test@liferay.com` と `test` でない場合は、`Document_POST_ToSite.sh` スクリプトを実行する前にこれらの値を置き換えてください。
    ```
スクリプトは、それ自体をサイトのドキュメントとメディアにアップロードします。

![The file uploaded to Documents and Media.](./document-api-basics/images/01.png)

コマンド応答は、次のように、JSONで新しいドキュメントとメディアファイルを記述します。

```json
{
  ...
  "description": "",
  ...
  "id": 38301,
  ...
  "title": "Document_POST_ToSite.sh"
}
```

応答には、ファイルの説明、新しく割り当てられたID、タイトルなどが含まれます。 後のコマンドのために`id`の値に注意すること。

次に、Javaクラスを使用してファイルをアップロードします。

1. `java`フォルダに移動し、Javaソースファイルをコンパイルする。

   ```bash
   cd ../java
   ```

   ```bash
   javac -classpath .:* *.java
   ```

1. 以下の `Document_POST_ToSite` クラスを実行し、`siteId` システムプロパティの値をサイトの ID に置き換えて、Documents and Media にファイルをアップロードします。

   ```bash
   java -classpath .:* -DsiteId=1234 Document_POST_ToSite
   ```

    ```{note}
    ユーザーとパスワードがそれぞれ `test@liferay.com` と `test` でない場合は、実行する前に `Document_POST_ToSite.java` ファイルでこれらの値を置き換えて、クラスを再コンパイルしてください。
    ```

このクラスはソースファイル `Document_POST_ToSite.java` を Documents and Media にアップロードする。

![The Java class uploaded the Java source file.](./document-api-basics/images/02.png)

cURLコマンドとJavaクラスの仕組みをご覧ください。

## cURLコマンドの検証

`Document_POST_ToSite.sh`スクリプトは、cURLを使って `headless-delivery` アプリケーションのRESTサービスを呼び出してファイルをアップロードする。

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_POST_ToSite.sh
   :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                      | 説明                                                                              |
| :---------------------------------------------------------------------- | :------------------------------------------------------------------------------ |
| `-F "file=@Document_POST_ToSite.sh"`                                    | 投稿するファイル。                                                                       |
| `-H "Content-Type: multipart/form-data"`                                | 投稿されているメディアタイプ（ [MIME 種別](https://en.wikipedia.org/wiki/Media_type) ）。 |
| `-X POST`                                                               | 指定されたエンドポイントで呼び出すHTTPメソッド。                                                      |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/documents"` | RESTサービスエンドポイント。 あなたのサイトIDパラメータは、`${1}`を置き換える。                                  |
| `-u "test@liferay.com:learn"`                                           | 基本認証の資格情報。                                                                      |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0](../../../headless-delivery/using-oauth2.md) を介してユーザーを認証する必要があります。 OAuth2 を使用する React アプリケーションのサンプルについては、 [OAuth2によるユーザーの認証](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```

`Document`と`DocumentFolder` RESTサービス用の他のcURLコマンドも同様の引数を使用する。

次に、Javaの呼び出しがいかに似ているかを見てみましょう。

## Javaクラスを調べる

`Document_POST_ToSite.java` クラスは、`headless-delivery` アプリケーション REST サービスを呼び出してファイルをアップロードする。

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 10-29
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                     | 説明                                                                                                                                                                                   |
| :------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DocumentResource.Builder builder = ...`                                   | `DocumentResource`サービスインスタンスを生成するための`Builder` を取得する。                                                                                                                                 |
| `DocumentResource documentResource = builder.authentication(...).build();` | 基本認証を指定し、`DocumentResource` サービスインスタンスを生成する。                                                                                                                                         |
| `Document document = documentResource.postSiteDocument(...);`              | `DocumentResource.postSiteDocument`メソッドを呼び出し、サイト ID、アップロードするファイルを表す`Document`オブジェクト、アップロードするファイルを指定するハッシュマップを渡す。 ファイルは任意である--この例では便宜上、ローカルのファイル`Document_POST_ToSite.java` を使っている。 |

このプロジェクトには `com.liferay.headless.delivery.client.jar` ファイルが依存関係として含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

```{note}
`main`メソッドのコメントは、クラスの実行を示している。
```
他のJavaクラスの例もこれと似ているが、異なる `DocumentResource` メソッドを呼び出している。

```{important}
サービスの詳細については、 [DocumentResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/DocumentResource.java) を参照のこと。
```
以下は、cURLとJavaを使って他の`Document` RESTサービスを呼び出す例である。

## サイトドキュメントを取得する

次のcURLまたはJavaコマンドを実行すると、サイトのドキュメントを一覧表示できます。 上記と同様に、`1234`をあなたのサイトのIDに置き換える。

### Documents_GET_FromSite.sh

コマンド：

```bash
./Documents_GET_FromSite.sh 1234
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Documents_GET_FromSite.sh
   :language: bash
```

### Documents_GET_FromSite.java

コマンド：

```bash
java -classpath .:* -DsiteId=1234 Documents_GET_FromSite
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Documents_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

サイトの `Document` オブジェクトはJSONでリストされている。

## ドキュメントを取得する

以下のcURLまたはJavaコマンドを実行することで、`Document`のフィールドを取得することができる。 `1234`を`ドキュメント`のIDに置き換える。

```{tip}
サイトの `Document` ID を取得するには `Documents_GET_FromSite.[java|sh]` を使用する。
```
### Document_GET_ById.sh

コマンド：

```bash
./Document_GET_ById.sh 1234
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_GET_ById.sh
   :language: bash
```

### Document_GET_ById.java

コマンド：

```bash
java -classpath .:* -DdocumentId=1234 Document_GET_ById
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Document`フィールドはJSONでリストされている。

## ドキュメントの内容を取得する

`Document` の内容は Base64 でエンコードされ、`Document`の`nestedFields` に埋め込まれる。 次のcURLまたはJavaコマンドを実行すると、コンテンツを取得できます。 1234`を`ドキュメント`のIDに置き換える。

### Document_GET_ById_ContentValue.sh

コマンド：

```bash
./Document_GET_ById_ContentValue.sh 1234
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_GET_ById_ContentValue.sh
   :language: bash
```

最初の引数行は、サービスエンドポイントと認証クレデンシャルをそれぞれ指定します。 URL の `/o/headless-delivery/v1.0/documents/${1}` の部分は、`Document` をその ID で取得するための REST サービスのエンドポイントである。 このURLは`Document_GET_ById.sh`スクリプトのURLと同じである。 `nestedFields=contentValue`の部分は`Document`の`nestedFields`に埋め込まれた`contentValue` を要求します。 最後に、`&fields=contentValue`の部分は、`contentValue`フィールドをフィルタリングし、コンテンツフィールドだけを返すようにする。 しかし、サービスだけを呼び出すと、次のようにJSONでラップされたBase64エンコードされたコンテンツが返される：

```json
{
  "contentValue" : "Y3VybCBcCgktRiAiZmlsZT1ARG9jdW1lbnRfUE9TVF9Ub1NpdGUuc2giIFwKCS1IICJDb250ZW50LVR5cGU6IG11bHRpcGFydC9mb3JtLWRhdGEiIFwKCS1YIFBPU1QgXAoJImh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9vL2hlYWRsZXNzLWRlbGl2ZXJ5L3YxLjAvc2l0ZXMvJHsxfS9kb2N1bWVudHMiIFwKCS11ICJ0ZXN0QGxpZmVyYXkuY29tOnRlc3Qi"
}
```

サービス呼び出しに続くルーチンで、エンコードされたコンテンツが処理されます。 `sed`と`awk`ルーチンは`Document`のコンテンツ値を分離し、`tr`ルーチンはそれをデコードする。 あなたがアップロードした`Document_POST_ToSite.sh` `Document` に対して返されたデコードされた内容です：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_GET_ById_ContentValue.sh
   :language: bash
```

### Document_GET_ById_ContentValue.java

ドキュメント`の内容を取得し、それをデコードするJavaのコードは、以前のcURLコマンドよりも単純になっている。

コマンド：

```bash
java -classpath .:* -DdocumentId=1234 Document_GET_ById_ContentValue
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_GET_ById_ContentValue.java
   :dedent: 1
   :language: java
   :lines: 11-27
```

ほとんどのコードは `Document_POST_ToSite.java` のコードに似ている。 主な違いがいくつかあります。

次の行は `contentValue` ネストされたフィールドをリクエストパラメータとして追加する。

```java
builder.parameter("nestedFields", "contentValue");
```

ID で `Document` を取得したら、`Base64.Decoder` が `Document` の内容をデコードする。

```java
Base64.Decoder decoder = Base64.getDecoder();
```

## ドキュメントにパッチを適用する

`Document`の PATCH サービスは`Document` とそのフィールドを更新する。 以下のcURLまたはJavaコマンドを実行することで、`Document`を更新することができる。 `1234`を`ドキュメント`のIDに置き換える。

### Document_PATCH_ById.sh

コマンド：

```bash
./Document_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_PATCH_ById.sh
   :language: bash
```

最初のフォームデータ部（`-F`に続く）は `Document` の `description` フィールドの新しい値を指定します。 2番目のフォームデータ部分は、アップロードする更新されたファイルを指定します。 なお、両方が必要なわけではない。 ファイルのみ、またはドキュメントのメタデータのみにパッチを当てることができます。

### Document_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DdocumentId=1234 Document_PATCH_ById
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 13-34
```

上の Java コードは `DocumentResource` の `patchDocument` メソッドを呼び出して、`Document` の ID、更新するフィールドを含む `Document` オブジェクト、アップロードする更新ファイルを渡している。

上記のコマンドは `Document` の説明を "Bar" に更新します。

![The cURL command changed the document's description.](./document-api-basics/images/03.png)

## ドキュメントを置き換える

`Document`のPUTサービスは、`Document`とそのフィールドを完全に置き換える。 以下のcURLまたはJavaコマンドを実行することで、`Document`を置き換えることができる。 1234`を`ドキュメント`のIDに置き換える。

### Document_PUT_ById.sh

コマンド：

```bash
./Document_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_PUT_ById.sh
   :language: bash
```

最初のフォームデータ部は、新しい `description` と `title` フィールド値を設定する。 2番目のフォームデータ部分は、アップロードする置換ファイルを指定します。

### Document_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DdocumentId=1234 Document_PUT_ById
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 13-35
```

上の Java コードは `DocumentResource` の `putDocument` メソッドを呼び出し、`Document` の ID、`Document` の `description` フィールドと `title` フィールドの値を含む `Document` オブジェクト、アップロードする置換ファイルを渡す。

上記のcURLコマンドとJavaクラスは、`Document`のインスタンスを全く新しいものに置き換えるもので、それぞれ "Document_PUT_ById.sh "と "Document_PUT_ById.java "という新しいタイトルを持ち、"Goo. "という説明を持つ。

```{warning}
現在の `Document` のタイトルを使用したいのでなければ、置換する `Document` に必要な `title` の値を指定してください。
```

![The cURL command replaced the document.](./document-api-basics/images/04.png)

## ドキュメントを削除する

以下のcURLまたはJavaコマンドを実行することで、`Document`を削除することができる。 1234`を`ドキュメント`のIDに置き換える。

### Document_DELETE_ById.sh

コマンド：

```bash
./Document_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/curl/Document_DELETE_ById.sh
   :language: bash
```

### Document_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DdocumentId=1234 Document_DELETE_ById
```

コード：

```{literalinclude} ./document-api-basics/resources/liferay-g9i6.zip/java/Document_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

ドキュメント」と「メディア」から「ドキュメント」が削除された。

## その他のドキュメントおよびドキュメントフォルダサービス

以下のcURLコマンドとJavaクラスは、より多くの `Document` サービスと `DocumentFolder` サービスを示している。

| ファイル                                         | 説明                      |
| :------------------------------------------- | :---------------------- |
| `Document_POST_ToDocumentFolder.[java\|sh]` | ドキュメントをフォルダに投稿します。      |
| `DocumentFolder_GET_ById.[java\|sh]`        | フォルダのフィールドを一覧表示します。     |
| `DocumentFolder_PATCH_ById.[java\|sh]`      | フォルダとそのフィールドを更新します。     |
| `DocumentFolder_POST_ToSite.[java\|sh]`     | ドキュメントフォルダをサイトに投稿します。   |
| `DocumentFolder_PUT_ById.[java\|sh]`        | フォルダとそのフィールドを完全に置き換えます。 |
| `DocumentFolders_GET_FromSite.[java\|sh]`   | サイトのフォルダを一覧表示します。       |

[API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) には `Document` と `DocumentFolder` のすべてのサービスとスキーマがリストアップされており、各サービスを試すためのインターフェイスが用意されている。

[DocumentResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/DocumentResource.java) と [DocumentFolderResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/DocumentFolderResource.java) のJavaインターフェースも参照してください。

## 関連トピック

* [ドキュメントとメディア](../../documents-and-media.md) 
* [RESTサービスの消費](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 
* [APIヘッダリファレンス](../../../headless-delivery/consuming-apis/api-headers-reference.md) 
* [GraphQL APIを消費する](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) 
