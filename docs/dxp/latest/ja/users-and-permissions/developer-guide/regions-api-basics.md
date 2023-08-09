# リージョンAPIの基本

{bdg-secondary}`Liferay 7.4 U24以降とGA24以降で利用可能`

Liferay の REST API を使ってリージョンを作成・管理します。

## リージョンの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Regions API Basics](./liferay-r2p3.zip)をダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-r2p3.zip -O
   ```

   ```bash
   unzip liferay-r2p3.zip
   ```

1. 国に新しい地域を追加するには、cURLスクリプトを使用します。 コマンドラインで、 `curl`フォルダに移動します。 `Region_POST_ToCountry.sh` スクリプトを実行する。

   ```bash
   ./Region_POST_ToCountry.sh 1234
   ```

   `1234` を国のIDに置き換えてください。 [Get Countries from Instance](./countries-api-basics.md#get-countries-from-instance) を使ってIDのリストを取得する。

   JSON レスポンスは、新しいリージョンが追加されたことを示す：

   ```json
   {
     "active" : true,
     "countryId" : 43501,
     "id" : 43503,
     "name" : "Foo",
     "position" : 0.0,
     "regionCode" : "ABL",
     "title_i18n" : { }
   }
   ```

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Region_POST_ToCountry.java` クラスを実行する：

   ```bash
   java -classpath .:* -DcountryId=1234 Region_POST_ToCountry
   ```

## cURLコマンドの検証

`Region_POST_ToCountry.sh` スクリプトは、cURLコマンドでRESTサービスを呼び出す。

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_POST_ToCountry.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                             | 説明                              |
|:------------------------------------------------------------------------------ |:------------------------------- |
| `-H "Content-Type: application/json"`                                          | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                      | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}/regions"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Foo\", \"regionCode\": \"ABL\"}"`                    | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                  | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) を使ってユーザーを認証する必要があります。 OAuth2を利用したReactアプリケーションのサンプルは、[OAuth2を利用したユーザー認証](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) をご参照ください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Region_POST_ToCountry.java` クラスは、Region 関連サービスを呼び出して地域を追加する。

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_POST_ToCountry.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                 | 説明                                                    |
|:---------------------------------------------------------------------- |:----------------------------------------------------- |
| `RegionResource.Builder builder = ...`                                 | `RegionResource` サービスインスタンスを生成するための `Builder` を取得します。 |
| `RegionResource regionResource = builder.authentication(...).build();` | 基本認証を指定し、 `RegionResource` サービスインスタンスを生成する。           |
| `Region region = regionResource.postRegion(...);`                      | `regionResource.postRegion` メソッドを呼び出し、post にデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.address.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラス例もこれと似ているが、異なる `RegionResource` メソッドを呼び出している。

```{important}
サービスの詳細は [RegionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/RegionResource.java) を参照してください。
```

以下は、cURLとJavaを使って、他の `Region` RESTサービスを呼び出す例である。

## インスタンスからリージョンを取得する

以下のcURLまたはJavaコマンドを実行することで、リージョンの一覧を表示することができる。

### Regions_GET_FromInstance.sh

コマンド：

```bash
./Regions_GET_FromInstance.sh
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Regions_GET_FromInstance.sh
   :language: bash
```

### Regions_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Regions_GET_FromInstance
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Regions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `Region` オブジェクトはJSONで表示される。

## リージョン

以下のcURLまたはJavaコマンドで特定の地域を取得する。

```{tip}
インスタンスの ``リージョンID`` を取得するには ``Regions_GET_FromInstance.[java|sh]`` を使用してください。
```

### Region_GET_ById.sh

コマンド：

```bash
./Region_GET_ById.sh 1234
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_GET_ById.sh
   :language: bash
```

### Region_GET_ById.java

コマンド：

```bash
java -classpath .:* -DregionId=1234 Region_GET_ById
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Region` フィールドはJSONで表示される。

## リージョンをパッチする

以下のcURLとJavaコマンドを使って、既存のリージョンを部分的に編集する。 `1234` をあなたのリージョンのIDに置き換えてください。

### Region_PATCH_ById.sh

コマンド：

```bash
./Region_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_PATCH_ById.sh
   :language: bash
```

### Region_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DregionId=1234 Region_PATCH_ById
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## 地域を置く

以下のcURLとJavaコマンドで、既存のリージョンを完全に上書きする。 `1234` をあなたの地域のIDに置き換えてください。

### Region_PUT_ById.sh

コマンド：

```bash
./Region_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_PUT_ById.sh
   :language: bash
```

### Region_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DregionId=1234 Region_PUT_ById
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

## リージョンの削除

以下のcURLコマンドとJavaコマンドを使用して、既存のリージョンを削除する。 `1234` をあなたの地域のIDに置き換えてください。

### Region_DELETE_ById.sh

コマンド:

```bash
./Region_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_DELETE_ById.sh
   :language: bash
```

### Region_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DregionId=1234 Region_DELETE_ById
```

コード:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) は、 `Region` のすべてのサービスとスキーマを表示し、各サービスを試すためのインターフェイスを備えている。
