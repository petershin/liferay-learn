# Countries API の基礎知識

{bdg-secondary}`Liferay 7.4 U24以降とGA24以降で利用可能`

Liferay の Rest API を使用して、国を作成および管理します。

## 国を追加する

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順で操作してください：

1. Countries API Basics](./liferay-g6m8.zip)をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-g6m8.zip -O
   ```

   ```bash
   unzip liferay-g6m8.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しい国を追加します。 コマンドラインで、 `curl`フォルダに移動します。 `Country_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Country_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しい国が追加されたことが示されています：

   ```json
   {
     "a2" : "AB",
     "a3" : "ABL",
     "active" : true,
     "billingAllowed" : true,
     "groupFilterEnabled" : false,
     "id" : 43501,
     "name" : "Foo",
     "number" : 1234,
     "position" : 0.0,
     "regions" : [ ],
     "shippingAllowed" : true,
     "subjectToVAT" : false,
     "title_i18n" : { },
     "zipRequired" : true
   }
   ```

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 このようにソースファイルをコンパイルします：

   ```bash
   javac -classpath .:* *.java
   ```

1. `Country_POST_ToInstance.java` クラスを実行します：

   ```bash
   java -classpath .:* Country_POST_ToInstance
   ```

## cURLコマンドの検証

`Country_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                | 説明                              |
|:------------------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                             | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                         | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-address/v1.0/countries"`                                 | RESTサービスのエンドポイント                |
| `-d "{\"a2\": \"AB\", \"a3\": \"ABL\", \"name\": \"Foo\", \"number\": \"1234\"}"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                                     | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。 OAuth2を利用したReactアプリケーションのサンプルは、[OAuth2を利用したユーザー認証](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) をご参照ください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Country_POST_ToInstance.java` クラスは、Country 関連サービスを呼び出して、国を追加します。

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                   | 説明                                                      |
|:------------------------------------------------------------------------ |:------------------------------------------------------- |
| `CountryResource.Builder builder = ...`                                  | `CountryResource` サービスインスタンスを生成するための `Builder` を取得する。   |
| `CountryResource countryResource = builder.authentication(...).build();` | 基本認証を指定し、 `CountryResource` サービスインスタンスを生成します。           |
| `Country country = countryResource.postCountry(...);`                    | `countryResource.postCountry` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.address.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと似ていますが、異なる `CountryResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [CountryResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/CountryResource.java) を参照してください。
```

以下は、cURLとJavaを使用して、他の `国` RESTサービスを呼び出す例です。

## インスタンスから国名を取得する

以下のcURLまたはJavaコマンドを実行することで、国を一覧表示することができます。

### Countries_GET_FromInstance.sh

コマンド:

```bash
./Countries_GET_FromInstance.sh
```

コード:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Countries_GET_FromInstance.sh
   :language: bash
```

### Countries_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Countries_GET_FromInstance
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Countries_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `国` オブジェクトがJSONで表示されます。

## 国を取得する

以下のcURLまたはJavaコマンドで、特定の国を取得します。

```{tip}
インスタンス ``Countries_GET_FromInstance.[java|sh]`` を使用して、インスタンス ``Country`` のIDを取得します。
```

### 国別_GET_ById.sh

コマンド：

```bash
./Country_GET_ById.sh 1234
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_GET_ById.sh
   :language: bash
```

### Country_GET_ById.java

コマンド：

```bash
java -classpath .:* -DcountryId=1234 Country_GET_ById
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Country` フィールドは、JSONで表示されます。

## 国を継ぐ

以下のcURLとJavaコマンドで、既存の国の部分編集を行います。 `1234` をあなたの国のIDに置き換えてください。

### Country_PATCH_ById.sh

コマンド：

```bash
./Country_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_PATCH_ById.sh
   :language: bash
```

### Country_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DcountryId=1234 Country_PATCH_ById
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 国名を入れる

以下のcURLとJavaのコマンドで、既存の国を完全に上書きする。 `1234` をあなたの国のIDに置き換えてください。

### 国別_PUT_ById.sh

コマンド：

```bash
./Country_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_PUT_ById.sh
   :language: bash
```

### Country_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DcountryId=1234 Country_PUT_ById
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

## 国を削除する

以下のcURLとJavaのコマンドで、既存の国を削除します。 `1234` をあなたの国のIDに置き換えてください。

### Country_DELETE_ById.sh

コマンド:

```bash
./Country_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_DELETE_ById.sh
   :language: bash
```

### Country_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DcountryId=1234 Country_DELETE_ById
```

コード:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には、 `Country` のすべてのサービスとスキーマが表示され、各サービスを試すためのインターフェイスが用意されています。
