---
uuid: 35ec5e41-96da-4193-9084-17ef41489063
taxonomy-category-names:
- Commerce
- Products
- Product Information
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Product Delivery API Basics

[Product API Basics](./product-api-basics.md) covers the admin API used for creating and managing products. To display product data in your storefront, you must use the Product Delivery API. Call the [headless-commerce-delivery-catalog](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-commerce-delivery-catalog/v1.0/openapi.json) services to retrieve a single product from a channel or all products from a channel.

## Get a Product from a Channel

```{include} /_snippets/run-liferay-dxp.md
```

Then follow these steps:

1. Download and unzip [Product Delivery API Basics](./liferay-k9b9.zip).

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-k9b9.zip -O
   ```

   ```bash
   unzip liferay-k9b9.zip
   ```

1. By default, a product is visible across all channels. You can limit its visibility through configuration. See [Configuring Product Visibility Using Channels](../../store-management/channels/configuring-product-visibility-using-channels.md) for more information. 

   Find the channel ID by opening the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and navigating to *Commerce* &rarr; *Channels*. Select a channel to see its `ID`.

   Find the product ID by opening the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and navigating to *Commerce* &rarr; *Products*. Select a product to see its `ID`.

1. Use the cURL script to retrieve a product from a channel. On the command line, navigate to the `curl` folder. Execute the `Products_GET_ById.sh` script with your channel ID and product ID as parameters. Replace `1234` with the channel ID and `5678` with the product ID.

   ```bash
   ./Products_GET_ById.sh 1234 5678
   ```

   The JSON response shows the product:

   ```bash
   {
      "catalogName": "Minium",
      "createDate": "2024-11-11T13:15:37Z",
      "customFields": [],
      "description": "Product designed and manufactured to accommodate OEM applications. All\nproducts are tested and inspected in an ISO-9000 compliant environment",
      "expando": {},
      "externalReferenceCode": "MIN93015minium-initializer",
      "id": 34309,
      "metaDescription": "",
      "metaKeyword": "",
      "metaTitle": "",
      "modifiedDate": "2024-11-11T13:35:41Z",
      "name": "ABS Sensor",
      "productConfiguration": {
         "allowBackOrder": true,
         "allowedOrderQuantities": [],
         "availabilityEstimateId": 34326,
         "availabilityEstimateName": "3-5 days",
         "inventoryEngine": "",
         "maxOrderQuantity": 10000,
         "minOrderQuantity": 1,
         "multipleOrderQuantity": 1
      },
      "productId": 34310,
      "productType": "simple",
      "shortDescription": "",
      "slug": "abs-sensor",
      "tags": [],
      "urlImage": "https://localhost:8080/o/commerce-media/default/?groupId=34197",
      "urls": {
         "en_US": "abs-sensor"
      }
   }
   ```

1. You can also call the REST service using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `Products_GET_ById` class. Replace `1234` with the channel ID and `5678` with the product ID.

   ```bash
   java -classpath .:* -DchannelId=1234 -DproductId=5678 Products_GET_ById
   ```

## Examine the cURL Command

The `Products_GET_ById.sh` script calls the REST service with a cURL command.

```{literalinclude} ./product-delivery-api-basics/resources/liferay-k9b9.zip/curl/Products_GET_ById.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                                                       | Description                                         |
| :-------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------- |
| `"http://localhost:8080/o/headless-commerce-delivery-catalog/v1.0/channels/${1}/products/${2}"`                 | The REST service endpoint                           |
| `-u "test@liferay.com:learn"`                                                                                   | Basic authentication credentials                    |

!!! note
   Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2). See [Using OAuth2 to Authorize Users](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) for a sample React application that utilizes OAuth2.

## Examine the Java Class

The `Products_GET_ById.java` class retrieves a product from a channel by calling the product related service.

```{literalinclude} ./product-delivery-api-basics/resources/liferay-k9b9.zip/java/Products_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated)                                                       | Description                                                                                           |
| :----------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------- |
| `ProductResource.Builder builder = ...`                                  | Gets a `Builder` for generating a `ProductResource` service instance.                                 |
| `ProductResource productResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `ProductResource` service instance.                    |
| `productResource.getChannelProduct(...);`                                | Calls the `productResource.getChannelProduct` method and passes the parameters to retrieve a product. |

Note that the project includes the `com.liferay.headless.commerce.delivery.catalog.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

!!! note
   The `main` method's comment demonstrates running the class.

The other example Java class is similar to this one, but calls a different `ProductResource` method.

!!! important
   See [ProductResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-delivery-catalog-client/src/main/java/com/liferay/headless/commerce/delivery/catalog/client/resource/v1_0/ProductResource.java) for service details.

Below is another example of calling a `Product` REST service using cURL and Java.

## Get all Products from a Channel

You can list all products from a channel by executing the following cURL or Java command.

### Products_GET_FromChannels.sh

Command:

```bash
./Products_GET_FromChannels.sh
```

Code:

```{literalinclude} ./product-delivery-api-basics/resources/liferay-k9b9.zip/curl/Products_GET_FromChannels.sh
   :language: bash
```

### Products_GET_FromChannels.java

Command:

```bash
java -classpath .:* Products_GET_FromChannels
```

Code:

```{literalinclude} ./product-delivery-api-basics/resources/liferay-k9b9.zip/java/Products_GET_FromChannels.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

The `Product` objects of the channel are listed in JSON.

This API also accepts parameters to filter, paginate, search, and sort the products. See the [`getProductsPage`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-delivery-catalog-client/src/main/java/com/liferay/headless/commerce/delivery/catalog/client/resource/v1_0/ProductResource.java#L37-L40) method for more information. You can use the following Product fields in your queries to filter, search, and sort the results.

- catalogId
- categoryIds
- categoryNames
- createDate
- customFields {bdg-secondary}`Liferay DXP 2024.Q4+/GA129+`
- modifiedDate
- name
- productType
- statusCode
- tags

| Filter Query                         | Description                              |
| :----------------------------------- | :--------------------------------------- |
| `productType eq 'simple'`            | Product type equals simple               |
| `contains(name, 'Bar')`              | Product name contains Bar                |
| `customFields/sampleSize eq '100.0'` | Custom field named sampleSize equals 100 |

| Sort Query                  | Description                                                                            |
| :-------------------------- | :------------------------------------------------------------------------------------- |
| `createDate:desc`           | Sort by createDate in the descending order                                             |
| `name:asc`                  | Sort by name in the ascending order                                                    |
| `createDate:desc,name:desc` | Sort by createDate in the descending order first, then by name in the descending order |

Read [API Query Parameters](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) for more information.

!!! important
    Both the above endpoints also have an optional `accountId` parameter. When a user is part of multiple accounts, you must pass the `accountId` while invoking these APIs.

## Related Topics

- [Consuming REST Services](https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/consuming-rest-services)