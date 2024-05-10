# ディスカウントAPIの基本

アプリケーションメニューから、またはREST APIを使用して割引を管理できます。 [headless-admin-commerce-pricing](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/openapi.json) サービスを呼び出して、割引を作成・管理します。

## ディスカウントを追加する

```{include} /_snippets/run-liferay-dxp.md
```

Liferayが起動したら。

1. [割引API基礎編](./liferay-r6f7.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/pricing/developer-guide/liferay-r6f7.zip -O
   ```

   ```bash
   unzip liferay-r6f7.zip
   ```

1. ディスカウントはインスタンスにスコープされます。 cURLスクリプトを使用して、新しい割引を追加してください。 コマンドラインで、 `curl` フォルダに移動します。 `Discount_POST_ToInstance.sh` スクリプトを実行する。

   ```bash
   ./Discount_POST_ToInstance.sh
   ```

   JSONレスポンスには、新しい割引が追加されたことが示されています。

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/46111"
         }
      },
      "active" : false,
      "amountFormatted" : "0.00%",
      "couponCode" : "",
      "customFields" : { },
      "displayDate" : "2023-02-27T12:31:00Z",
      "externalReferenceCode" : "9df9ffc2-be00-680b-2a2c-69f572bbe65c",
      "id" : 46111,
      "level" : "L1",
      "limitationTimes" : 0,
      "limitationTimesPerAccount" : 0,
      "limitationType" : "unlimited",
      "numberOfUse" : 0,
      "rulesConjunction" : false,
      "target" : "Products",
      "title" : "Foo",
      "useCouponCode" : false,
      "usePercentage" : true
   }
   ```

1. 割引の追加を確認するには、 **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コマース** &rarr; **ディスカウント** に移動します。 新しい割引が表示されます。

   ![新しい割引が追加されたことを確認する。](./discount-api-basics/images/01.png)

1. または、Javaクライアントを使用してRESTサービスを呼び出します。 `java`フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Discount_POST_ToInstance` クラスを実行します。

   ```bash
   java -classpath .:* Discount_POST_ToInstance
   ```

### クーポンコードを追加する

割引にクーポンコードを追加するには、 `useCouponCode` を `true` に設定し、 `couponCode` フィールドに値を設定する。 クーポンコードの利用を制限する場合は、下表の設定をご利用ください。

| 制限の種類          | 設定                                                                                                                                                 | 説明                                      |
|:-------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------- |:--------------------------------------- |
| 使用回数           | `"limitationType" : "limited for total"`<br />`"limitationTimes" : 5` (任意の整数)                                                                | クーポンコードは合計5回まで使用可能です。                   |
| 1アカウントあたりの利用回数 | `"limitationType "です。"limited for account"`<br />`"limitationTimesPerAccount" :5` (任意の整数)                                                    | 1アカウントにつき5回までクーポンコードを使用することができます。       |
| 使用回数とアカウント別    | `"limitationType" : "limited for account and total"`<br />`"limitationTimesPerAccount":2` (任意の整数)<br />`"limitationTimes" : 5` (任意の整数) | クーポンコードは1アカウントにつき2回まで使用でき、合計5回まで使用できます。 |

## cURLコマンドの検証

`Discount_POST_ToInstance.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_POST_ToInstance.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                                                                     | 説明                                 |
|:------------------------------------------------------------------------------------------------------------------------------------------------------ |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                                                                                  | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                                                                                              | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts"`                                                                             | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"level\": \"L1\", \"limitationType\": \"unlimited\", \"target\": \"products\", \"title\": \"Foo\", \"usePercentage\": true}"` | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                                                                                          | 基本認証の認証情報を入力します。                   |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Discount_POST_ToInstance.java` クラスは、 `DiscountResource` サービスを呼び出して割引を追加します。

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                                     | 説明                                                       |
|:-------------------------------------------------------------------------- |:-------------------------------------------------------- |
| `DiscountResource.Builder builder = ...`                                   | `DiscountResource` サービスインスタンスを生成するための `Builder` を取得する。   |
| `DiscountResource discountResource = builder.authentication(...).build();` | 基本認証を使用し、 `DiscountResource` サービスインスタンスを生成します。           |
| `discountResource.postDiscount(...);`                                      | `discountResource.postDiscount` メソッドを呼び出し、postにデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.commerce.admin.pricing.client.jar`ファイルが含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR 依存情報は、インストール先の API Explorer で `/o/api` (例: <http://localhost:8080/o/api>) から確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

残りのサンプルJavaクラスは、異なる `DiscountResource` のメソッドを呼び出します。

```{important}
サービスの詳細は [DiscountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless-commerce/headless-commerce-admin-pricing-client/src/main/java/com/liferay/headless/commerce/admin/pricing/client/resource/v2_0/DiscountResource.java) を参照ください。
```

以下は、cURLとJavaを使用して、他の `ディスカウント` RESTサービスを呼び出す例です。

## インスタンスから割引を受ける

cURLやJavaのコマンドで、Liferayインスタンスのすべてのディスカウントをリストアップします。

### Discounts_GET_FromInstance.sh

コマンド:

```bash
./Discounts_GET_FromInstance.sh
```

コード:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discounts_GET_FromInstance.sh
   :language: bash
```

### Discounts_GET_FromInstance.java

コマンド：

```bash
java -classpath .:* Discounts_GET_FromInstance
```

コード：

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discounts_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

インスタンスの `Discount` オブジェクトはJSONでフォーマットされています。

## 割引を受ける

cURL または Java `get` コマンドで特定の割引を取得します。 `1234` を割引のIDに置き換えてください。

```{tip}
Discounts_GET_FromInstance.[java|sh]`を使用して、すべての割引のリストを取得し、特に欲しい割引の `id` をメモします。
```

### Discount_GET_ById.sh

コマンド：

```bash
./Discount_GET_ById.sh 1234
```

コード：

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_GET_ById.sh
   :language: bash
```

### Discount_GET_ById.java

コマンド：

```bash
java -classpath .:* -DdiscountId=1234 Discount_GET_ById
```

コード：

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`Discount` フィールドはJSONで記載されています。

## パッチアディスカウント

cURLとJava `patch` コマンドで既存の割引を更新します。 `1234` を割引のIDに置き換えてください。

### Discount_PATCH_ById.sh

コマンド：

```bash
./Discount_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_PATCH_ById.sh
   :language: bash
```

### Discount_PATCH_ById.java

コマンド：

```bash
java -classpath .:* -DdiscountId=1234 Discount_PATCH_ById
```

コード：

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## ディスカウントを削除する

cURL と Java `delete` コマンドで既存の割引を削除する。 `1234` を割引のIDに置き換えてください。

### Discount_DELETE_ById.sh

コマンド:

```bash
./Discount_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/curl/Discount_DELETE_ById.sh
   :language: bash
```

### Discount_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DdiscountId=1234 Discount_DELETE_ById
```

コード：

```{literalinclude} ./discount-api-basics/resources/liferay-r6f7.zip/java/Discount_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) では、 `Discount` のサービスとスキーマを表示し、各サービスをテストするためのインターフェイスを備えています。
