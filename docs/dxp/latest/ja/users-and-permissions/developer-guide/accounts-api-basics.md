# アカウントAPIの基本

> 対応可能：Liferay DXP/Portal 7.4以降

アプリケーションメニューから [アカウント](../accounts.md) を管理することができますが、LiferayのREST APIを利用することもできます。 これらのサービスを呼び出して、アカウントの作成や管理を行います。

## アカウントの追加

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順で操作してください：

1. [Accounts API Basics](./liferay-t5p9.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-t5p9.zip -O
   ```

   ```bash
   unzip liferay-t5p9.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しいAccountを追加します。 コマンドラインで、 `curl`フォルダに移動します。 `Account_POST_ToInstance.sh` スクリプトを実行します。

   ```bash
   ./Account_POST_ToInstance.sh
   ```

   JSONレスポンスでは、新しいAccountが追加されたことを示しています。

   ```json
   {
     "description" : "Foo",
     "domains" : [ ],
     "externalReferenceCode" : "",
     "id" : 39302,
     "name" : "Able",
     "numberOfUsers" : 0,
     "organizationIds" : [ ],
     "parentAccountId" : 0,
     "status" : 0,
     "type" : "business"
   }
   ```

1. *グローバルメニュー* &rarr; *［アプリケーション］* &rarr; *［Accounts］*に移動します。 新しいアカウントが追加されたことを確認してください。

   ![新しいアカウントが追加されたことを確認します。](./accounts-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

    ```bash
    javac -classpath .:* *.java
    ```

1. `Account_POST_ToInstance.java` クラスを以下のコマンドで実行します。

    ```bash
    java -classpath .:* Account_POST_ToInstance
    ```

## cURLコマンドの検証

`Account_POST_ToInstance.sh` スクリプトは、cURLコマンドでRESTサービスを呼び出します。

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                            | 説明                              |
|:------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                         | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                     | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/accounts"` | RESTサービスのエンドポイント                |
| `-d "{\"description\": \"Foo\", \"name\": \"Able\"}"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                 | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。 OAuth2を利用したReactアプリケーションのサンプルは、[OAuth2を利用したユーザー認証](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) をご参照ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Account_POST_ToInstance.java` クラスは、Account関連のサービスを呼び出してアカウントを追加します。

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                   | 説明                                                     |
|:------------------------------------------------------------------------ |:------------------------------------------------------ |
| `AccountResource.Builder builder = ...`                                  | ` AccountResourc`サービスインスタンスを生成するための`Builder`を取得します。    |
| `AccountResource accountResource = builder.authentication(...).build();` | ベーシック認証を指定し、 `AccountResource` サービスインスタンスを生成します。       |
| `Account account = accountResource.postAccount(...);`                    | `accountResource.postAccount` メソッドを呼び出し、データをpostに渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.user.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラスの例はこれと似ていますが、異なる `AccountResource` メソッドを呼び出しています。

```{important}
サービスの詳細は、 [AccountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/AccountResource.java)を参照してください。
```

以下は、cURLとJavaを使って、他の `Account` RESTサービスを呼び出す例です。

## インスタンスからアカウントを取得

以下のcURLまたはJavaコマンドを実行することで、アカウントを一覧表示することができます。

### Accounts_GET_FromInstance.sh

コマンド：

```bash
./Accounts_GET_FromInstance.sh
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Accounts_GET_FromInstance.sh
   :language: bash
```

### Accounts_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Accounts_GET_FromInstance
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Accounts_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `アカウント` オブジェクトがJSONで表示されます。

## アカウントの取得

以下のcURLまたはJavaコマンドで特定のアカウントを取得します。

```{tip}
インスタンスのアカウントIDを取得するには、Accounts_GET_FromInstance.[java|sh]を使用します。
```

### Account_GET_ById.sh

コマンド:

```bash
./Account_GET_ById.sh 1234
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_GET_ById.sh
   :language: bash
```

### Account_GET_ById.java

コマンド：

```bash
java -classpath .:* -DaccountId=1234 Account_GET_ById
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Account` フィールドはJSONで表示されます。

## アカウントへのパッチ適用

以下のcURLおよびJavaコマンドで、既存のAccountの部分編集を行います。 なお、 `1234` は、アカウントのIDに置き換えてください。

### Account_PATCH_ById.sh

コマンド：

```bash
./Account_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_PATCH_ById.sh
   :language: bash
```

### Account_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DaccountId=1234 Account_PATCH_ById
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## アカウントの作成

以下のcURLとJavaコマンドで、既存のAccountを完全に上書きします。 なお、 `1234` は、アカウントのIDに置き換えてください。

### Account_PUT_ById.sh

コマンド：

```bash
./Account_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_PUT_ById.sh
   :language: bash
```

### Account_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DaccountId=1234 Account_PUT_ById
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## アカウントの削除

以下のcURLおよびJavaコマンドで既存のAccountを削除します。 なお、 `1234` は、アカウントのIDに置き換えてください。

### Account_DELETE_ById.sh

コマンド:

```bash
./Account_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/Account_DELETE_ById.sh
   :language: bash
```

### Account_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DaccountId=1234 Account_DELETE_ById
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[APIエクスプローラー](../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`アカウント`のすべてのサービスとスキーマが一覧表示され、各サービスを試すためのインターフェースがあります。
