# Organizations API の基礎知識

アプリケーションメニューから [Create and Manage Organizations](../organizations/creating-and-managing-organizations.md) を利用できますが、Liferay の REST API を利用することも可能です。 これらのサービスを呼び出して、組織を管理します。

## 組織を追加する

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Organizations API Basics](./liferay-w2h3.zip)  をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-w2h3.zip -O
   ```

   ```bash
   unzip liferay-w2h3.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しいOrganizationを追加します。 コマンドラインで、 `curl`フォルダに移動します。 `Organization_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Organization_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しい組織が追加されたことを示します：

   ```json
   {
     "comment": "",
     "customFields": [],
     "dateCreated": "2022-05-19T17:38:19Z",
     "dateModified": "2022-05-19T17:38:19Z",
     "externalReferenceCode": "",
     "id": "40922",
     "keywords": [],
     "location": {},
     "name": "Able",
     "numberOfAccounts": 0,
     "numberOfOrganizations": 0,
     "numberOfUsers": 0,
     "organizationContactInformation": {
       "emailAddresses": [],
       "postalAddresses": [],
       "telephones": [],
       "webUrls": []
     }
   }
   ```

1. **グローバルメニュー** &rarr; **コントロールパネル** &rarr; **ユーザーと組織** に移動します。 ［**Organizations**］ タブをクリックします。 新しい組織が追加されたことを確認します。

   ![新しい組織が追加されたことを確認する。](./organizations-api-basics/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Organization_POST_ToInstance.java` クラスを以下のコマンドで実行します。

   ```bash
   java -classpath .:* Organization_POST_ToInstance
   ```

## cURLコマンドの検証

`Organization_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_POST_ToInstance.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                 | 説明                              |
|:------------------------------------------------------------------ |:------------------------------- |
| `-H "Content-Type: application/json"`                              | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                          | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/organizations"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Able\"}"`                                    | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                      | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。 OAuth2を利用したReactアプリケーションのサンプルは、[OAuth2を利用したユーザー認証](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) をご参照ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Organization_POST_ToInstance.java` クラスは、Organization 関連サービスを呼び出して、組織を追加します。

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-24
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                             | 説明                                                                |
|:---------------------------------------------------------------------------------- |:----------------------------------------------------------------- |
| `OrganizationResource.Builder builder = ...`                                       | `OrganizationResource` サービスインスタンスを生成するための `Builder` を取得する。        |
| `OrganizationResource organizationResource = builder.authentication(...).build();` | 基本認証を指定し、 `OrganizationResource` サービスインスタンスを生成します。                |
| `Organization organization = organizationResource.postOrganization(...);`          | `organizationResource.postOrganization` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.user.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと似ていますが、異なる `OrganizationResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [OrganizationResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/OrganizationResource.java) を参照ください。
```

以下は、cURLとJavaを使用して、他の `Organization` RESTサービスを呼び出す例です。

## インスタンスからオーガニゼーションを取得する

以下のcURLまたはJavaコマンドを実行することで、Organizationを一覧表示することができます。

### Organizations_GET_FromInstance.sh(オーガニゼーションズ・ゲット・フロムインスタンス）。

コマンド：

```bash
./Organizations_GET_FromInstance.sh
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organizations_GET_FromInstance.sh
   :language: bash
```

### Organizations_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Organizations_GET_FromInstance
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organizations_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `組織` オブジェクトは、JSON で表示されます。

## 組織化する

以下のcURLまたはJavaコマンドで、特定の組織を取得します。

```{tip}
インスタンスの ``組織`` ID を取得するには ``Organizations_GET_FromInstance.[java|sh]`` を使用します。
```

### Organization_GET_ById.sh

コマンド:

```bash
./Organization_GET_ById.sh 1234
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_GET_ById.sh
   :language: bash
```

### Organization_GET_ById.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 Organization_GET_ById
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Organization` フィールドは、JSONで表示されます。

## 組織にパッチを貼る

以下のcURLとJavaコマンドで、既存の組織の部分編集を行います。 `1234` をあなたの組織のIDに置き換えてください。

### Organization_PATCH_ById.sh

コマンド：

```bash
./Organization_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PATCH_ById.sh
   :language: bash
```

### Organization_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 Organization_PATCH_ById
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 組織を入れる

以下のcURLとJavaのコマンドで、既存のOrganizationを完全に上書きする。 `1234` をあなたの組織のIDに置き換えてください。

### Organization_PUT_ById.sh

コマンド：

```bash
./Organization_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_PUT_ById.sh
   :language: bash
```

### Organization_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DorganizationId=1234 Organization_PUT_ById
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 組織を削除する

以下のcURLコマンドとJavaコマンドで、既存の組織を削除する。 `1234` をあなたの組織のIDに置き換えてください。

### rganization_DELETE_ById.sh

コマンド:

```bash
./Organization_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/curl/Organization_DELETE_ById.sh
   :language: bash
```

### Organization_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DorganizationId=1234 Organization_DELETE_ById
```

コード:

```{literalinclude} ./organizations-api-basics/resources/liferay-w2h3.zip/java/Organization_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には、 `Organization` のすべてのサービスとスキーマが表示され、各サービスを試すためのインターフェイスが用意されています。
