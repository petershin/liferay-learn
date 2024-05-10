# オーダーAPIの基本

アプリケーションメニューから、またはREST APIを使って注文を管理することができます。 [headless-admin-commerce-order](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-admin-order/v1.0/openapi.json) サービスを呼び出して、注文を作成・管理します。

## 注文を追加する

```{include} /_snippets/run-liferay-dxp.md
```

Liferayの実行後、

1. [注文APIの基本](./liferay-w6c8.zip) をダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/order-management/developer-guide/liferay-w6c8.zip -O
   ```

   ```bash
   unzip liferay-w6c8.zip
   ```

1. 注文の作成には、アカウントID、チャネルID、使用通貨の [ISO 4217通貨コード](https://en.wikipedia.org/wiki/ISO_4217) （例：USD）の3つのパラメータが必要です。

   アカウントIDを取得するには、 **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **アカウント** にアクセスします。 アカウントを探し、そのIDをコピーする。 または、アカウントを選択し、 **アカウントID** をコピーします。

   ![アカウントIDをコピーする。](./order-api-basics/images/01.png)

   チャンネル ID を取得するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Channels** を選択します。 注文を追加するチャンネルを選択し、そのIDをコピーします。

   ![チャンネルIDをコピーする。](./order-api-basics/images/02.png)

   1 cURL スクリプトを使用して、チャネルに新しい注文を追加します。 コマンドラインで、`curl`フォルダに移動します。 `Order_POST_ToChannel.sh` スクリプトを、アカウントID、チャンネルID、通貨コードに適切な値を指定して実行します。

   ```bash
   ./Order_POST_ToChannel.sh 1234 5678 USD
   ```

JSONレスポンスは、そのアカウントとチャネルに新しい注文が追加されたことを示します。

   ```bash
   {
      "accountExternalReferenceCode" : "cc-west",
      "accountId" : 1234,
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/{id}"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/{id}"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/{id}"
         }
      },
      "advanceStatus" : "",
      "billingAddressId" : 0,
      "channelExternalReferenceCode" : "c8957c2f-4eb1-ce8f-4a38-5251bf740198",
      "channelId" : 5678,
      "couponCode" : "",
      "createDate" : "2023-01-03T12:25:15Z",
      "currencyCode" : "USD",
      "customFields" : { },
      "deliveryTermDescription" : "",
      "deliveryTermId" : 0,
      "deliveryTermName" : "",
      "externalReferenceCode" : "3ebcbc91-7240-2763-c2ce-f2a592851053",
      "id" : 45955,
      "modifiedDate" : "2023-01-03T12:25:15Z",
      "orderDate" : "2023-01-03T12:25:15Z",
      "orderStatus" : 1,
      "orderStatusInfo" : {
         "code" : 1,
         "label" : "pending",
         "label_i18n" : "Pending"
      },
      "orderTypeId" : 0,
      "paymentMethod" : "",
      "paymentStatus" : 1,
      "paymentStatusInfo" : {
         "code" : 1,
         "label" : "pending",
         "label_i18n" : "Pending"
      },
      "paymentTermDescription" : "",
      "paymentTermId" : 0,
      "paymentTermName" : "",
      "printedNote" : "",
      "purchaseOrderNumber" : "",
      "shippingAddressId" : 0,
      "shippingAmountFormatted" : "$ 0.00",
      "shippingAmountValue" : 0.0,
      "shippingDiscountAmount" : 0,
      "shippingDiscountAmountFormatted" : "$ 0.00",
      "shippingDiscountPercentageLevel1" : 0,
      "shippingDiscountPercentageLevel1WithTaxAmount" : 0,
      "shippingDiscountPercentageLevel2" : 0,
      "shippingDiscountPercentageLevel2WithTaxAmount" : 0,
      "shippingDiscountPercentageLevel3" : 0,
      "shippingDiscountPercentageLevel3WithTaxAmount" : 0,
      "shippingDiscountPercentageLevel4" : 0,
      "shippingDiscountPercentageLevel4WithTaxAmount" : 0,
      "shippingDiscountWithTaxAmount" : 0,
      "shippingDiscountWithTaxAmountFormatted" : "$ 0.00",
      "shippingOption" : "",
      "shippingWithTaxAmountFormatted" : "$ 0.00",
      "shippingWithTaxAmountValue" : 0.0,
      "subtotalAmount" : 0.0,
      "subtotalDiscountAmount" : 0,
      "subtotalDiscountAmountFormatted" : "$ 0.00",
      "subtotalDiscountPercentageLevel1" : 0,
      "subtotalDiscountPercentageLevel1WithTaxAmount" : 0,
      "subtotalDiscountPercentageLevel2" : 0,
      "subtotalDiscountPercentageLevel2WithTaxAmount" : 0,
      "subtotalDiscountPercentageLevel3" : 0,
      "subtotalDiscountPercentageLevel3WithTaxAmount" : 0,
      "subtotalDiscountPercentageLevel4" : 0,
      "subtotalDiscountPercentageLevel4WithTaxAmount" : 0,
      "subtotalDiscountWithTaxAmount" : 0,
      "subtotalDiscountWithTaxAmountFormatted" : "$ 0.00",
      "subtotalFormatted" : "$ 0.00",
      "subtotalWithTaxAmountFormatted" : "$ 0.00",
      "subtotalWithTaxAmountValue" : 0.0,
      "taxAmount" : 0,
      "taxAmountFormatted" : "$ 0.00",
      "taxAmountValue" : 0.0,
      "totalAmount" : 0.0,
      "totalDiscountAmount" : 0,
      "totalDiscountAmountFormatted" : "$ 0.00",
      "totalDiscountPercentageLevel1" : 0,
      "totalDiscountPercentageLevel2" : 0,
      "totalDiscountPercentageLevel3" : 0,
      "totalDiscountPercentageLevel4" : 0,
      "totalDiscountWithTaxAmount" : 0,
      "totalDiscountWithTaxAmountFormatted" : "$ 0.00",
      "totalFormatted" : "$ 0.00",
      "totalWithTaxAmountFormatted" : "$ 0.00",
      "totalWithTaxAmountValue" : 0.0,
      "transactionId" : "",
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) &rarr; **Commerce** &rarr; **Orders** に移動します。 新しいオーダーが表示されます。

  ![新規注文が追加されたことを確認する。](./order-api-basics/images/03.png)

1 または、Javaクライアントを使用してRESTサービスを呼び出します。 `java` フォルダに移動し、ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1 `Order_POST_ToChannel` クラスを実行し、 `accountId`, `channelId`, `currenyCode` を適切な値に置き換えてください。

   ```bash
   java -classpath .:* -DaccountId=1234 -DchannelId=5678 -DcurrencyCode=Foo Order_POST_ToChannel
   ```

## cURLコマンドの検証

`Order_POST_ToChannel.sh` スクリプトは、cURL コマンドで REST サービスを呼び出します。

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_POST_ToChannel.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                    | 説明                                 |
|:------------------------------------------------------------------------------------- |:---------------------------------- |
| `-H "Content-Type: application/json"`                                                 | リクエストボディの形式をJSONに設定します。            |
| `-X POST`                                                                             | 指定されたエンドポイントで呼び出す HTTP メソッドを設定します。 |
| `"http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders"`                 | RESTサービスのエンドポイントを指定します。            |
| `-d "{\"accountId\": ${1}, \"channelId\": ${2}, \"currencyCode\": \"${3}\"}"` | 投稿するデータを入力します。                     |
| `-u "test@liferay.com:learn"`                                                         | 基本認証の認証情報を入力します。                   |

!!! note
   ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を使ったReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`Order_POST_ToChannel.java` クラスは、注文関連サービスを呼び出すことで注文を追加します。

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_POST_ToChannel.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行（省略形）                                                               | 説明                                                  |
|:-------------------------------------------------------------------- |:--------------------------------------------------- |
| `OrderResource.Builder builder = ...`                                | `OrderResource` サービスインスタンスを生成するための `Builder` を取得する。 |
| `OrderResource orderResource = builder.authentication(...).build();` | 基本認証を使用し、 `OrderResource` サービスインスタンスを生成します。         |
| `orderResource.postOrder(...);`                                      | `orderResource.postOrder` メソッドを呼び出し、postにデータを渡します。  |


プロジェクトには、依存関係として`com.liferay.headless.commerce.admin.order.client.jar`ファイルが含まれていることに注意してください。 すべての REST アプリケーションのクライアント JAR の依存情報は、インストール先の API Explorer で `/o/api` (例: <http://localhost:8080/o/api>) に見つけることができます。

!!! note
   `main`メソッドのコメントでは、クラスの実行を実演しています。

他の例のJavaクラスは、異なる `OrderResource` メソッドを呼び出します。

!!! important
   サービスの詳細は [OrderResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderResource.java) を参照ください。

以下は、cURL と Java を使用して、他の `注文` REST サービスを呼び出す例です。

## インスタンスから注文を取得する

cURL または Java コマンドで、Liferay インスタンスからすべての注文をリストアップできます。

### Orders_GET_FromInstance.sh

コマンド:

```bash
./Orders_GET_FromInstance.sh
```

コード:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Orders_GET_FromInstance.sh
   :language: bash
```

### Orders_GET_FromInstance.java

コマンド:

```bash
java -classpath .:* Orders_GET_FromInstance
```

コード:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Orders_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-18
```

インスタンスの `注文` オブジェクトがJSONでリストアップされます。

### フィルタリング、ページ分割、検索、並び替えの順序を設定する。

このAPIから返される注文は、フィルタリング、ページ分割、検索、ソートすることができます。 詳しくは、 [`getOrdersPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderResource.java#L43-L46) メソッドをご覧ください。 次の `順序` フィールドを使用して、結果をフィルタリング、検索、並べ替えします。

- アカウントID
- channelId
- 注文状況
- オーダーId
- createDate
- modifiedDate
- 注文日

| フィルタークエリ                                        | 説明                                                                                          |
|:----------------------------------------------- |:------------------------------------------------------------------------------------------- |
| `orderId eq 45958`                              | 注文IDは45958と同じでなければなりません。                                                                    |
| `createDate gt 2022-12-31T12:00:00Z`            | 注文作成日は2022年12月31日12:00:00以上である必要があります。                                                      |
| `orderStatus/any(x:(x eq 10) or (x eq 1))`      | 注文の状態は、処理中（10）または保留中（1）のいずれかでなければなりません。 `any` は、後続の式の少なくとも1つが `true`を返さなければならないことを指定する。     |
| `accountId/any(x:(x eq 44170) or (x eq 44178))` | アカウントIDは、 `44170` または `44178`と同じである必要があります。 `any` は、後続の式の少なくとも1つが `true`を返さなければならないことを指定する。 |


`orderStatus`でフィルタリングするには、その関連する整数値を使用する必要があります。 以下の表は、各オーダーの状態とその整数値との対応です。

| 注文ステータス | 整数値 |
|:------- |:--- |
| 公開      | 2   |
| 処理中     | 6   |
| 申請中     | 1   |
| 処理中     | 10  |
| 出荷済み    | 15  |
| 完了      | 0   |
| キャンセル済み | 8   |
| 一部発送済み  | 14  |
| 申請済み    | 20  |


| ソートクエリ                              | 説明                                                      |
|:----------------------------------- |:------------------------------------------------------- |
| `createDate:desc`                   | `createDate` で降順にソートしてください。                             |
| `createDate:desc,modifiedDate:desc` | 最初に `createDate` で降順にソートし、次に `modifiedDate` で降順にソートします。 |


詳しくは、 [APIクエリパラメータ](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) をご参照ください。

## 注文する

cURL と Java `get` コマンドで特定のオーダーを取得します。 `1234` を注文のIDに置き換えてください。

!!! tip
   `Orders_GET_FromInstance.[java|sh]` を使用して、すべてのオーダーのリストを取得し、特に必要なオーダーの `id` をメモしてください。

### Order_GET_ById.sh

コマンド：

```bash
./Order_GET_ById.sh 1234
```

コード：

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_GET_ById.sh
   :language: bash
```

### Order_GET_ById.java

コマンド:

```bash
java -classpath .:* -DorderId=1234 Order_GET_ById
```

コード:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`注文` フィールドはJSONでフォーマットされています。

## 注文のパッチ

cURL と Java `パッチ` コマンドで既存の注文を更新します。 `1234` をご注文のIDに置き換えてください。

### Order_PATCH_ById.sh

コマンド：

```bash
./Order_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_PATCH_ById.sh
   :language: bash
```

### Order_PATCH_ById.java

コマンド:

```bash
java -classpath .:* -DorderId=1234 Order_PATCH_ById
```

コード:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

## 注文を削除する

cURL と Java `delete` コマンドで既存の注文を削除します。 `1234` をご注文のIDに置き換えてください。

### Order_DELETE_ById.sh

コマンド:

```bash
./Order_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_DELETE_ById.sh
   :language: bash
```

### Order_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DorderId=1234 Order_DELETE_ById
```

コード:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-16
```

[RESTサービスの使用](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) は、 `Order` のサービスとスキーマを表示し、各サービスをテストするためのインターフェイスを備えています。