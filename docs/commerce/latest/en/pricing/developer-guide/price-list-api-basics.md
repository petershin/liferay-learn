# Price List API Basics

You can manage price lists from the Applications menu, but you can also use Liferay’s REST APIs. Call these services to create and manage price lists.

## Adding a Price List

```{include} /_snippets/run-liferay-dxp.md
```

Then follow these steps:

1. Download and unzip [Price List API Basics](./liferay-c2v4.zip).

   ```bash
   curl https://learn.liferay.com/commmerce/latest/en/pricing/developer-guide/liferay-c2v4.zip -O
   ```

   ```bash
   unzip liferay-c2v4.zip
   ```

1. Price lists are scoped to catalogs and you require the catalog ID to create a price list.

   To get a catalog's ID, open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)), and go to *Commerce* &rarr; *Catalogs*. Select the desired catalog and note down the ID present next to its name.

   ![Note down the ID of the catalog.](./price-list-api-basics/images/01.png)

1. Use the cURL script to add a new price list to the catalog. On the command line, navigate to the `curl` folder. Execute the `PriceList_POST_ToCatalog.sh` script with the appropriate value of the catalog ID as a parameter.

   ```bash
   ./PriceList_POST_ToCatalog.sh 1234
   ```

   The JSON response shows a new price list has been added:

   ```bash
   {
      "actions" : {
         "permissions" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "get" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "update" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         },
         "delete" : {
         "method" : "DELETE",
         "href" : "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/46002"
         }
      },
      "active" : true,
      "author" : "Test Test",
      "catalogBasePriceList" : false,
      "catalogId" : 1234,
      "catalogName" : "Master",
      "createDate" : "2023-01-04T12:41:03Z",
      "currencyCode" : "USD",
      "customFields" : { },
      "displayDate" : "2023-01-04T12:41:00Z",
      "externalReferenceCode" : "b314f22b-72ff-c47c-4fb6-c34539257821",
      "id" : 46002,
      "name" : "Able",
      "netPrice" : true,
      "parentPriceListId" : 0,
      "priority" : 0.0,
      "type" : "price-list",
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

1. Verify this by opening the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)), and navigating to *Commerce* &rarr; *Price Lists*. See that a new price list has been added.

   ![See that a new price list has been added.](./price-list-api-basics/images/02.png)

1. You can also call the REST service using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `PriceList_POST_ToCatalog` class. Replace the `catalogId` with the appropriate value.

   ```bash
   java -classpath .:* -DcatalogId=1234 PriceList_POST_ToCatalog
   ```

## Examine the cURL Command

The `PriceList_POST_ToCatalog.sh` script calls the REST service with a cURL command.

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_POST_ToCatalog.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                                             | Description                                         |
| :---------------------------------------------------------------------------------------------------- | :-------------------------------------------------- |
| `-H "Content-Type: application/json"`                                                                 | Indicates that the request body format is JSON.     |
| `-X POST`                                                                                             | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists"`                          | The REST service endpoint                           |
| `-d "{\"catalogId\": ${1}, \"currencyCode\": \"USD\", \"name\": \"Able\", \"type\": \"price-list\"}"` | The data to post                                    |
| `-u "test@liferay.com:learn"`                                                                         | Basic authentication credentials                    |

```{note}
Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2.html). See [Using OAuth2 to Authorize Users](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) for a sample React application that utilizes OAuth2.
```

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `PriceList_POST_ToCatalog.java` class adds a price list by calling the order related service.

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_POST_ToCatalog.java
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

## Get Price Lists from Instance

You can list all orders from your Liferay instance by executing the following cURL or Java command.

### PriceLists_GET_FromInstance.sh

Command:

```bash
./PriceLists_GET_FromInstance.sh
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceLists_GET_FromInstance.sh
   :language: bash
```

### PriceLists_GET_FromInstance.java

Command:

```bash
java -classpath .:* PriceLists_GET_FromInstance
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceLists_GET_FromInstance.java
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

| Filter Query                               | Description                                                                                                                                 |
| :----------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------ |
| `orderId eq 45958`                         | Order ID equals 45958                                                                                                                       |
| `createDate gt 2022-12-31T12:00:00Z`       | Order create date greater than 31st December 2022 12:00:00                                                                                  |
| `orderStatus/any(x:(x eq 10) or (x eq 1))` | Order status equals processing (10) or pending (1). The term `any` means that at least one of the following expressions must return `true`. |

The `accountId` and `orderStatus` filter fields are collection fields and the format to filter them is different. To filter by `orderStatus`, you must use its associated integer value. See the table below for the different order statuses and their corresponding integer values.

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

## Get a Price List

Get a specific order with the following cURL or Java command. Replace `1234` with the order's ID.

```{tip}
Use `Orders_GET_FromInstance.[java|sh]` to get a list of all orders, and note the `id` of the order you want specifically.
```

### PriceList_GET_ById.sh

Command:

```bash
./PriceList_GET_ById.sh 1234
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_GET_ById.sh
   :language: bash
```

### PriceList_GET_ById.java

Command:

```bash
java -classpath .:* -DorderId=1234 PriceList_GET_ById
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

The `Order` fields are listed in JSON.

## Patch a Price List

Update an existing order with the following cURL and Java commands. Replace `1234` with your order's ID.

### PriceList_PATCH_ById.sh

Command:

```bash
./PriceList_PATCH_ById.sh 1234
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_PATCH_ById.sh
   :language: bash
```

### PriceList_PATCH_ById.java

Command:

```bash
java -classpath .:* -DorderId=1234 PriceList_PATCH_ById
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-29
```

## Delete a Price List

Delete an existing order with the following cURL and Java commands. Replace `1234` with your order's ID.

### PriceList_DELETE_ById.sh

Command:

```bash
./PriceList_DELETE_ById.sh 1234
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/curl/PriceList_DELETE_ById.sh
   :language: bash
```

### PriceList_DELETE_ById.java

Command

```bash
java -classpath .:* -DorderId=1234 PriceList_DELETE_ById
```

Code:

```{literalinclude} ./price-list-api-basics/resources/liferay-c2v4.zip/java/PriceList_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-16
```

The [API Explorer](https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/consuming-rest-services.html) lists all of the `Order` services and schemas and has an interface to try out each service.