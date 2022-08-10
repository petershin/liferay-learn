# Regions API の基本

{bdg-secondary}`Liferay 7.4 U24以降とGA24以降で利用可能`

Liferay の REST API を使用して、地域を作成および管理します。

## リージョンの追加
```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Regions API Basics](./liferay-r2p3.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-r2p3.zip -O
   ```

   ```bash
   unzip liferay-r2p3.zip
   ```

1. cURL スクリプトを使用して、国に新しい地域を追加します。 コマンドラインで、 `curl` フォルダに移動します。 `Region_POST_ToCountry.sh` スクリプトを実行します。

   ```bash
   ./Region_POST_ToCountry.sh 1234
   ```

   `1234` を国のIDに置き換えてください。 [Get Countries from Instance](./countries-api-basics.md#get-countries-from-instance) を使用して、ID のリストを取得します。

   JSONレスポンスは、新しい地域が追加されたことを示します。

   ```bash
   "active" : true,
   "countryId" : 43501,
   "id" : 43503,
   "name" : "Foo",
   "position" : 0.0,
   "regionCode" : "ABL",
   "title_i18n" : { }

   ```

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Region_POST_ToCountry.java` クラスを実行します。

   ```bash
   java -classpath .:* -DcountryId=1234 Region_POST_ToCountry
   ```

## cURLコマンドの検証

`Region_POST_ToCountry.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

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
ここでは、デモのためにベーシック認証を使用しています。 本番環境では、 [OAuth2](../../headless-delivery/using-oauth2.md) 経由でユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Region_POST_ToCountry.java` クラスは、Region 関連サービスを呼び出すことで地域を追加します。

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_POST_ToCountry.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                 | 説明                                                   |
|:---------------------------------------------------------------------- |:---------------------------------------------------- |
| `RegionResource.Builder builder = ...`                                 | `RegionResource` サービスインスタンスを生成するための `Builder` を取得する。 |
| `RegionResource regionResource = builder.authentication(...).build();` | 基本認証を指定し、 `RegionResource` サービスインスタンスを生成します。         |
| `Region region = regionResource.postRegion(...);`                      | `regionResource.postRegion` メソッドを呼び出し、データをpostに渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.admin.address.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと似ているが、異なる `RegionResource` メソッドを呼び出している。

```{important}
サービスの詳細は [RegionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless-admin-address/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/RegionResource.java) を参照ください。
```

以下は、cURL と Java を使って、他の `Region` REST サービスを呼び出す例です。

## インスタンスからリージョンを取得する

以下のcURLまたはJavaコマンドを実行することで、リージョンの一覧を表示することができます。

### Regions_GET_FromInstance.sh

コマンド:

```bash
./Regions_GET_FromInstance.sh
```

コード:

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

Instance の `Region` オブジェクトが JSON で表示されます。

## リージョンを取得する

以下のcURLまたはJavaコマンドで、特定の地域を取得します。

```{tip}
インスタンスの ``Region`` ID を取得するには、 ``Regions_GET_FromInstance.[java|sh]`` を使用します。
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
   :lines: 9-20
```

`Region` フィールドは、JSONで表示されます。

## リージョンのパッチ

以下のcURLとJavaコマンドで、既存のRegionの部分編集を行う。 `1234` を自分のリージョンIDに置き換えてください。

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

## リージョンを置く

以下のcURLとJavaコマンドで、既存のリージョンを完全に上書きする。 `1234` を自分の地域のIDに置き換えてください。

### Region_PUT_ById.sh

コマンド:

```bash
./Region_PUT_ById.sh 1234
```

コード:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_PUT_ById.sh
   :language: bash
```

### Region_PUT_ById.java

コマンド:

```bash
java -classpath .:* -DregionId=1234 Region_PUT_ById
```

コード:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

## リージョンの削除

以下のcURLとJavaのコマンドで、既存のリージョンを削除する。 `1234` を自分の地域のIDに置き換えてください。

### Region_DELETE_ById.sh

コマンド:

```bash
./Region_DELETE_ById.sh 1234
```

コード:

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

[API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) には `Region` のすべてのサービスとスキーマが表示され、各サービスを試用するためのインターフェイスが用意されています。
