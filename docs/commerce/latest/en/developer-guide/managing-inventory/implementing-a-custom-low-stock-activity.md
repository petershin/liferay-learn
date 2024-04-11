---
uuid: e5148e0b-fc9a-4587-b71c-9bfe09c383cf
taxonomy-category-names:
- Commerce
- Java Development
- Inventory
- Liferay Self-Hosted
- Liferay PaaS
---
# Implementing a Custom Low Stock Activity

This tutorial adds a custom low stock activity by implementing the [CommerceLowStockActivity](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/stock/activity/CommerceLowStockActivity.java) interface.

Low stock activities are actions that are automatically taken if products fall below their configured minimum stock quantities. Liferay provides one [default low stock activity](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/stock/activity/CommerceLowStockActivityImpl.java), which unpublishes the product.

![Low stock activity available out-of-the-box.](./implementing-a-custom-low-stock-activity/images/01.png)

## Overview

1. [**Deploy an Example**](#deploy-an-example)
1. [**Walk Through the Example**](#walk-through-the-example)
1. [**Additional Information**](#related-topics)

## Deploy an Example

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the [Acme Commerce Low Stock Activity](./liferay-j1e4.zip).

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/managing-inventory/liferay-j1e4.zip -O
   ```

   ```bash
   unzip liferay-j1e4.zip
   ```

1. Build and deploy the example.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
       This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Docker container console.

   ```bash
   STARTED com.acme.j1e4.impl_1.0.0
   ```

1. Verify that the example low stock activity was added. Open your browser to `https://localhost:8080`. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* → *Products*. Then click *Edit* within the menu for any product. If necessary, you can add a [product](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md).

   From there, navigate to *Configuration*. The new activity ("Log a warning message") will be present under the *Low Stock Action* dropdown.

!!! note
    In Liferay Commerce 2.1 and earlier, find the products page by navigating to *Control Panel* → *Commerce* → *Products*.

![The newly added low stock activity](./implementing-a-custom-low-stock-activity/images/02.png)

## Walk Through the Example

This example consists of three main steps. First, we will annotate the class for OSGi registration. Second, we will review the `CommerceLowStockActivity` interface. And third, we will complete our implementation of `CommerceLowStockActivity`.

- [Annotate the class for OSGi Registration](#annotate-the-class-for-osgi-registration)
- [Review the `CommerceLowStockActivity` interface](#review-the-commercelowstockactivity-interface)
- [Complete the Low Stock Activity](#complete-the-low-stock-activity)

### Annotate the class for OSGi Registration

```{literalinclude} ./implementing-a-custom-low-stock-activity/resources/liferay-j1e4.zip/j1e4-impl/src/main/java/com/acme/j1e4/internal/commerce/stock/activity/J1E4CommerceLowStockActivity.java
    :language: java
    :lines: 18-25
```

It is important to provide a distinct key for the low stock activity so that Liferay can distinguish the new activity from others in the [low stock activity registry](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/stock/activity/CommerceLowStockActivityRegistryImpl.java). Reusing a key that is already in use will override the existing associated activity.

The `commerce.low.stock.activity.priority` value indicates how far into the list of low stock activities this activity appears in the UI. For example, the [Set as Unpublished activity](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/stock/activity/CommerceLowStockActivityImpl.java) has a value of 10. Giving this low stock activity a value of 9 ensures that it appears immediately before the Set as Unpublished" activity.

### Review the `CommerceLowStockActivity` Interface

Implement the following methods:

```java
public void execute(CPInstance cpInstance) throws PortalException;
```

This method will be where the business logic is implemented for the custom activity.

```java
public String getKey();
```

This provides a unique identifier for the low stock activity in the low stock activity registry. The key can be used to fetch the low stock activity from the registry.

```java
public String getLabel(Locale locale);
```

This returns a text label that describes the low stock activity. See the implementation in [J1E4CommerceLowStockActivity.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/managing-inventory/implementing-a-custom-low-stock-activity/resources/liferay-j1e4.zip/j1e4-impl/src/main/java/com/acme/j1e4/internal/commerce/stock/activity/J1E4CommerceLowStockActivity.java) for a reference in retrieving the label with a language key.

### Complete the Low Stock Activity

The low stock activity comprises of backend logic to perform the activity itself.

- [Add business logic to `execute`.](#add-business-logic-to-execute)
- [Add the language key to `Language.properties`.](#add-the-language-key-to-languageproperties)

#### Add Business Logic to `execute`

```{literalinclude} ./implementing-a-custom-low-stock-activity/resources/liferay-j1e4.zip/j1e4-impl/src/main/java/com/acme/j1e4/internal/commerce/stock/activity/J1E4CommerceLowStockActivity.java
    :dedent: 1
    :language: java
    :lines: 27-32
```

This adds a warning message to Liferay's logs.

The `cpInstance` object contains information about the item with low stock. This example uses it to get the SKU for the item to add to the warning message. See [CPInstance](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstance.java) and [CPInstanceModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstanceModel.java) to find more methods you can use with a `CPInstance`.

#### Add the Language Key to `Language.properties`

Add the language key and its value to a [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/managing-inventory/implementing-a-custom-low-stock-activity/resources/liferay-j1e4.zip/j1e4-impl/src/main/resources/content/Language.properties) file within the module:

```{literalinclude} ./implementing-a-custom-low-stock-activity/resources/liferay-j1e4.zip/j1e4-impl/src/main/resources/content/Language.properties
    :language: properties
    :lines: 1
```

See [Localizing Your Application](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application) for more information.

## Conclusion

Congratulations! You now know the basics for adding a new low stock activity to Liferay by implementing the `CommerceLowStockActivity` interface.

## Related Topics

* [Creating a Simple Product](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [Localizing Your Application](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application)
* [Low Stock Action](../../inventory-management/low-stock-action.md)
