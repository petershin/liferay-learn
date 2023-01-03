# Order API Basics

You can manage orders from the Applications menu, but you can also use Liferay’s REST APIs. Call these services to create and manage orders.

## Adding an Order

```{include} /_snippets/run-liferay-dxp.md
```

Then follow these steps:

1. Download and unzip [Order API Basics](./liferay-w6c8.zip).

   ```bash
   curl https://learn.liferay.com/commmerce/latest/en/order-management/developer-guide/liferay-w6c8.zip -O
   ```

   ```bash
   unzip liferay-w6c8.zip
   ```

1. To create an order, there are three required parameters. One, is the ID of the account that creates the order. Second, is the ID of the channel in which you create the order. Third, is the currency code of the currency used.  

   To get the account ID, open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)), and go to *Control Panel* &rarr; *Accounts*. Find the account and copy the ID present next to it. Alternatively, you can select the account and copy the ID from the *Account ID* field.

   ![Note down the ID of the account.](./order-api-basics/images/01.png)

   To get the channel ID, open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)), and go to *Commerce* &rarr; *Channels*. Select the channel where you'll add orders and note down the ID present next to its name.

   ![Note down the ID of the channel present next to its name.](./order-api-basics/images/02.png)

1. Use the cURL script to add a new order to the channel. On the command line, navigate to the `curl` folder. Execute the `Order_POST_ToChannel.sh` script with the appropriate values for account ID, channel ID and currency code.

   ```bash
   ./Order_POST_ToChannel.sh 1234 5678 USD
   ```

   The JSON response shows a new order has been added:

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

1. Verify this by opening the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)), and navigating to *Commerce* &rarr; *Orders*. See that a new order has been added.

   ![See that a new order has been added.](./order-api-basics/images/03.png)

1. You can also call the REST service using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `Order_POST_ToChannel` class. Replace the `accountId`, `channelId` and `currenyCode` with the appropriate values.

   ```bash
   java -classpath .:* -DaccountId=1234 -DchannelId=5678 -DcurrencyCode=Foo Order_POST_ToChannel
   ```

## Examine the cURL Command

The `Order_POST_ToChannel.sh` script calls the REST service with a cURL command.

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_POST_ToChannel.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                     | Description                                         |
| :---------------------------------------------------------------------------- | :-------------------------------------------------- |
| `-H "Content-Type: application/json"`                                         | Indicates that the request body format is JSON.     |
| `-X POST`                                                                     | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders"`         | The REST service endpoint                           |
| `-d "{\"accountId\": ${1}, \"channelId\": ${2}, \"currencyCode\": \"${3}\"}"` | The data to post                                    |
| `-u "test@liferay.com:learn"`                                                 | Basic authentication credentials                    |

```{note}
Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2.html). See [Using OAuth2 to Authorize Users](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) for a sample React application that utilizes OAuth2.
```

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `Order_POST_ToChannel.java` class adds an order by calling the order related service.

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_POST_ToChannel.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated)                                                   | Description                                                                      |
| :------------------------------------------------------------------- | :------------------------------------------------------------------------------- |
| `OrderResource.Builder builder = ...`                                | Gets a `Builder` for generating a `OrderResource` service instance.              |
| `OrderResource orderResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `OrderResource` service instance. |
| `orderResource.postOrder(...);`                                      | Calls the `orderResource.postOrder` method and passes the data to post.          |

Note that the project includes the `com.liferay.headless.commerce.admin.order.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

```{note}
The `main` method's comment demonstrates running the class.
```

The other example Java classes are similar to this one, but call different `OrderResource` methods.

```{important}
See [OrderResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderResource.java) for service details.
```

Below are examples of calling other `Order` REST services using cURL and Java.

## Get Orders from Instance

You can list all orders from your Liferay instance by executing the following cURL or Java command.

### Orders_GET_FromInstance.sh

Command:

```bash
./Orders_GET_FromInstance.sh
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Orders_GET_FromInstance.sh
   :language: bash
```

### Orders_GET_FromInstance.java

Command:

```bash
java -classpath .:* Orders_GET_FromInstance
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Orders_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 9-18
```

The `Order` objects of your Liferay instance are listed in JSON.

This API also accepts parameters to filter, paginate, search, and sort the orders. See the [`getOrdersPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-order-client/src/main/java/com/liferay/headless/commerce/admin/order/client/resource/v1_0/OrderResource.java#L43-L46) method for more information. You can use the following `Order` fields in your queries to filter, search, and sort the results.

* accountId
* channelId
* orderStatus
* orderId
* createDate
* modifiedDate
* orderDate

| Filter Query                                    | Description                                                                                                                                      |
| :---------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| `orderId eq 45958`                              | Order ID equals 45958                                                                                                                            |
| `createDate gt 2022-12-31T12:00:00Z`            | Order create date greater than 31st December 2022 12:00:00                                                                                       |
| `orderStatus/any(x:(x eq 10) or (x eq 1))`      | Order status equals processing (10) or pending (1). The term `any` specifies that at least one of the subsequent expressions must return `true`. |
| `accountId/any(x:(x eq 44170) or (x eq 44178))` | Account ID equals `44170` or `44178`. The term `any` specifies that at least one of the subsequent expressions must return `true`.               |

To filter by `orderStatus`, you must use its associated integer value. See the table below for the different order statuses and their corresponding integer values.

| Order Status      | Integer Value |
| :---------------- | :------------ |
| Open              | 2             |
| In Progress       | 6             |
| Pending           | 1             |
| Processing        | 10            |
| Shipped           | 15            |
| Completed         | 0             |
| Cancelled         | 8             |
| Partially Shipped | 14            |
| On Hold           | 20            |

| Sort Query                          | Description                                                                                    |
| :---------------------------------- | :--------------------------------------------------------------------------------------------- |
| `createDate:desc`                   | Sort by createDate in the descending order                                                     |
| `createDate:desc,modifiedDate:desc` | Sort by createDate in the descending order first, then by modifiedDate in the descending order |

Read [API Query Parameters](https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/api-query-parameters.html) for more information.

## Get an Order

Get a specific order with the following cURL or Java command. Replace `1234` with the order's ID.

```{tip}
Use `Orders_GET_FromInstance.[java|sh]` to get a list of all orders, and note the `id` of the order you want specifically.
```

### Order_GET_ById.sh

Command:

```bash
./Order_GET_ById.sh 1234
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_GET_ById.sh
   :language: bash
```

### Order_GET_ById.java

Command:

```bash
java -classpath .:* -DorderId=1234 Order_GET_ById
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

The `Order` fields are listed in JSON.

## Patch an Order

Update an existing order with the following cURL and Java commands. Replace `1234` with your order's ID.

### Order_PATCH_ById.sh

Command:

```bash
./Order_PATCH_ById.sh 1234
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_PATCH_ById.sh
   :language: bash
```

### Order_PATCH_ById.java

Command:

```bash
java -classpath .:* -DorderId=1234 Order_PATCH_ById
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## Delete an Order

Delete an existing order with the following cURL and Java commands. Replace `1234` with your order's ID.

### Order_DELETE_ById.sh

Command:

```bash
./Order_DELETE_ById.sh 1234
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/curl/Order_DELETE_ById.sh
   :language: bash
```

### Order_DELETE_ById.java

Command

```bash
java -classpath .:* -DorderId=1234 Order_DELETE_ById
```

Code:

```{literalinclude} ./order-api-basics/resources/liferay-w6c8.zip/java/Order_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-16
```

The [API Explorer](https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/consuming-rest-services.html) lists all of the `Order` services and schemas and has an interface to try out each service.
