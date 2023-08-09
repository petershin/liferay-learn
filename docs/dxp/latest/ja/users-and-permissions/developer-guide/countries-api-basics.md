# 各国APIの基本

{bdg-secondary}`Liferay 7.4 U24以降とGA24以降で利用可能`

LiferayのRest APIを使用して国を作成し、管理します。

## 国の追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Countries API Basics](./liferay-g6m8.zip)をダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-g6m8.zip -O
   ```

   ```bash
   unzip liferay-g6m8.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しい国を追加します。 コマンドラインで、 `curl`フォルダに移動します。 `Country_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Country_POST_ToInstance.sh
   ```

   JSONレスポンスは、新しい国が追加されたことを示している：

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

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 ソース・ファイルを次のようにコンパイルする：

   ```bash
   javac -classpath .:* *.java
   ```

1. `Country_POST_ToInstance.java` クラスを実行します：

   ```bash
   java -classpath .:* Country_POST_ToInstance
   ```

## cURLコマンドの検証

`Country_POST_ToInstance.sh` スクリプトは、cURLコマンドでRESTサービスを呼び出します。

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

`Country_POST_ToInstance.java` クラスは、Country 関連サービスを呼び出して国を追加する。

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                   | 説明                                                      |
|:------------------------------------------------------------------------ |:------------------------------------------------------- |
| `CountryResource.Builder builder = ...`                                  | `CountryResource` サービスインスタンスを生成するための `Builder` を取得します。  |
| `CountryResource countryResource = builder.authentication(...).build();` | 基本認証を指定し、 `CountryResource` サービスインスタンスを生成する。            |
| `Country country = countryResource.postCountry(...);`                    | `countryResource.postCountry` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.address.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラス例もこれと似ていますが、異なる `CountryResource` メソッドを呼び出しています。

```{important}
サービスの詳細は [CountryResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/CountryResource.java) を参照してください。
```

以下は、cURLとJavaを使って他の `Country` RESTサービスを呼び出す例である。

## インスタンスから国を取得

以下のcURLまたはJavaコマンドを実行することで、国を一覧することができる。

### Countries_GET_FromInstance.sh

コマンド：

```bash
./Countries_GET_FromInstance.sh
```

コード：

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

インスタンスの `国` オブジェクトはJSONで表示される。

## カントリー

以下のcURLまたはJavaコマンドで特定の国を取得する。

```{tip}
インスタンスの ``国`` ID を取得するには ``Countries_GET_FromInstance.[java|sh]`` を使用してください。
```

### Country_GET_ById.sh

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

`Country` フィールドはJSONで表示される。

## 国をパッチする

以下のcURLとJavaコマンドを使って、既存の国を部分的に編集する。 `1234` をあなたの国のIDに置き換えてください。

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

## 国を置く

以下のcURLとJavaコマンドで、既存の国を完全に上書きする。 `1234` をあなたの国のIDに置き換えてください。

### Country_PUT_ById.sh

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

## 国の削除

以下のcURLとJavaコマンドを使って、既存の国を削除する。 `1234` をあなたの国のIDに置き換えてください。

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

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) は、 `Country` のすべてのサービスとスキーマを表示し、各サービスを試すためのインターフェイスを備えている。
