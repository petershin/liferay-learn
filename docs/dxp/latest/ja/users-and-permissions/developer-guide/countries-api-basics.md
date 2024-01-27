# 各国APIの基本

{bdg-secondary}`Liferay 7.4 U24+ および GA24+`

LiferayのRest APIを使用して国を作成し、管理します。

## 国の追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [Countries API Basics](./liferay-g6m8.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-g6m8.zip -O
   ```

   ```bash
   unzip liferay-g6m8.zip
   ```

1. cURLスクリプトを使用して、インスタンスに新しい国を追加します。 コマンドラインで `curl` フォルダに移動します。 `Country_POST_ToInstance.sh`スクリプトを実行する。

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

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl`フォルダから`java` フォルダに移動します。 ソース・ファイルを次のようにコンパイルする：

   ```bash
   javac -classpath .:* *.java
   ```

1. `Country_POST_ToInstance.java`クラスを実行する：

   ```bash
   java -classpath .:* Country_POST_ToInstance
   ```

## cURLコマンドの検証

`Country_POST_ToInstance.sh`スクリプトは、cURLコマンドでRESTサービスを呼び出す。

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                | 説明                              |
| :-------------------------------------------------------------------------------- | :------------------------------ |
| `-H "Content-Type: application/json"`                                             | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                         | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-address/v1.0/countries"`                 | RESTサービスのエンドポイント                |
| `-d "{"a2": "AB", "a3": "ABL", "name": "Foo", "number": "1234"}"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                     | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を介してユーザーを認証する必要があります。 OAuth2 を使用する React アプリケーションのサンプルについては、 [Using OAuth2 to Authorize Users](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Country_POST_ToInstance.java`クラスは、Country関連サービスを呼び出して国を追加する。

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                   | 説明                                                  |
| :----------------------------------------------------------------------- | :-------------------------------------------------- |
| `CountryResource.Builder builder = ...`                                  | `CountryResource`サービスインスタンスを生成するための`Builder` を取得する。 |
| `CountryResource countryResource = builder.authentication(...).build();` | 基本認証を指定し、`CountryResource` サービスインスタンスを生成する。         |
| `Country country = countryResource.postCountry(...);`                    | `countryResource.postCountry`メソッドを呼び出し、データをpostに渡す。 |

このプロジェクトには `com.liferay.headless.admin.address.client.jar` ファイルが依存関係として含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストー ルの API エクスプローラーの `/o/api` にある。

```{note}
`main`メソッドのコメントは、クラスの実行を示している。
```

他のJavaクラスの例もこれと似ているが、異なる `CountryResource` メソッドを呼び出している。

```{important}
サービスの詳細は [CountryResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-address/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/CountryResource.java) を参照。
```

以下は、cURLとJavaを使って他の`国`RESTサービスを呼び出す例である。

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

インスタンスの `Country` オブジェクトは JSON で表示される。

## 国を手に入れる

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

`Country`フィールドはJSONで表示される。

## 国をパッチする

以下のcURLとJavaコマンドを使って、既存の国を部分的に編集する。 1234`をあなたの国のIDに置き換えてください。

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

以下のcURLとJavaコマンドで既存の国を完全に上書きする。 `1234`をあなたの国のIDに置き換えてください。

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

以下のcURLとJavaコマンドを使って、既存の国を削除する。 `1234`をあなたの国のIDに置き換えてください。

### Country_DELETE_ById.sh

コマンド：

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

コード：

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md)には、すべての `Country` サービスとスキーマが表示され、各サービスを試すためのインターフェイスが用意されている。
