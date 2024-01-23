---
uuid: df90bbcd-2089-484a-8118-ce44f5bb7910
taxonomy-category-names:
- Commerce
- Java Development
- Payment
- Order Processing
- Liferay Self-Hosted
- Liferay PaaS
---
# Implementing a Custom Order Validator

This tutorial explains how to add a custom order validator by implementing the [CommerceOrderValidator](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidator.java) interface.

An order validator is a class that validates items in a customer's cart when proceeding through checkout. Liferay provides multiple out-of-the-box order validators, including a [default](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java), as well as validators to check [item versions](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/VersionCommerceOrderValidatorImpl.java) and [recurring items (subscriptions)](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/SubscriptionCommerceOrderValidatorImpl.java).

The order validator has validation logic for both adding a product to the cart and proceeding to a new checkout step. There are three parts:

1. [Validation logic for adding a product to cart.](#validation-logic-for-adding-a-product-to-cart)
1. [Validation logic for proceeding to checkout.](#validation-logic-for-proceeding-to-checkout)
1. [Language keys added to `Language.properties`.](#language-keys-added-to-languageproperties)

The two `validate` methods are where you define the custom validation logic for the order validator. This example adds logic to reject orders with more than ten of an item over a certain price.

## Deploy the Sample Order Validator

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the [Acme Commerce Order Validator](./liferay-n9b2.zip).

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-n9b2.zip -O
   ```

   ```bash
   unzip liferay-n9b2.zip
   ```

1. Build and deploy the example.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
      This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Docker container console.

   ```bash
   STARTED com.acme.n9b2.impl_1.0.0
   ```

1. Verify the addition of the example order validator by viewing the failure message. Open your browser to `https://localhost:8080` and navigate to a catalog with at least one item priced over $100. If no such product exists yet, add it yourself; see [Creating a Simple Product](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md) for more information.

   From the catalog, find the item with this price, then click *Add to Cart*. Increase the quantity to 11 or more, then click the arrow to continue. The error message that appears shows that the custom order validator successfully rejected adding the item.

   ![The custom order validator displays an error message.](./implementing-a-custom-order-validator/images/01.png)

Congratulations, you've successfully built and deployed a new order validator that implements `CommerceOrderValidator`.

Creating an Order Validator consists of three main steps. First, you annotate the class for OSGi registration. Second, you implement the `CommerceOrderValidator` interface. Finally, you create your implementation of `CommerceOrderValidator`.

## Annotate the Class for OSGi Registration

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
   :language: java
   :lines: 20-26
```

It is important to provide a distinct key for the order validator so that Liferay can distinguish the new order validator from others in the [order validator registry](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/CommerceOrderValidatorRegistryImpl.java). Reusing a key that is already in use overrides the existing associated validator.

The `commerce.order.validator.priority` value indicates when the order validator performs its validation in sequence with other validators. For example, the [default order validator](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java) has a value of 10. Giving your order validator a value of 9 ensures that it'll perform its validation immediately before the default validator.

## Review the `CommerceOrderValidator` Interface

The interface requires that you implement three methods:

```java
public String getKey();
```

This method provides a unique identifier for the order validator in the order validator registry. The key fetches the validator from the registry. Reusing a key that is already in use overrides the existing associated validator.

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrder commerceOrder, CPInstance cpInstance, int quantity) throws PortalException;
```

This is one of the two validation methods where you add your custom validation logic. This method is called whenever a customer adds an item to their cart. It does this by returning a `CommerceOrderValidatorResult`, which uses a boolean to signal whether or not the result passes validation. See [CommerceOrderValidatorResult.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidatorResult.java) for more information.

```java
public CommerceOrderValidatorResult validate(Locale locale, CommerceOrderItem commerceOrderItem) throws PortalException;
```

This is the second validation method where you can add custom validation logic. This method is called for items already in the cart, whenever the order transitions to `In Progress` or `Pending`.

### Validation Logic for Adding a Product to Cart

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
   :dedent: 1
   :language: java
   :lines: 34-61
```

```java
private static final double _MAX_ITEM_PRICE = 100.0;

private static final int _MAX_ITEM_QUANTITY = 10;
```

The main validation in the example checks if both the price (stored as a `BigDecimal`) is more than $100, and the quantity is greater than ten. This price information is available from the `CPInstance`, which contains information about the customer order. To find more methods you can use with a `CPInstance`, see [CPInstance](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstance.java) and [CPInstanceModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/model/CPInstanceModel.java).

!!! note
   It is best practice to include a localized message explaining why the validation failed for the main validation checks.

### Validation Logic for Proceeding to Checkout

```{literalinclude} ./implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/java/com/acme/n9b2/internal/commerce/order/N9B2CommerceOrderValidator.java
   :dedent: 1
   :language: java
   :lines: 63-83
```

Add the same validation logic to this method, since it's called for the items in the customer's cart. The main difference here is that you get the information from a `CommerceOrderItem` object; see [CommerceOrderItem](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItem.java) and [CommerceOrderItemModel](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderItemModel.java) to find more methods you can use with a `CommerceOrderItem`.

### Language Keys added to `Language.properties`

Add the language keys and their values to a [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-order-validator/resources/liferay-n9b2.zip/n9b2-impl/src/main/resources/content/Language.properties) file within your module. For example,

```properties
expensive-items-have-a-maximum-order-quantity-of-x=Expensive items have a maximum order quantity of {0}.
this-expensive-item-has-a-maximum-quantity-of-x=This expensive item has a maximum order quantity of {0}.
```

See [Localizing Your Application](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application) for more information.

## Modifying the Custom Order Validator

To change what your order validator does, edit your java file. Make the validator reject orders worth over $200 by changing the value of `_MAX_ITEM_PRICE`. Redeploy your custom order validator to send these changes to Liferay.

In your browser, try adding 10 items worth between $100 and $200. You can add these items to your cart because your validator no longer rejects orders over $100.

Try adding 10 items worth over $200. If you cannot add these items to your cart, your validator is working!

## Conclusion

Congratulations! You now know the basics for implementing the `CommerceOrderValidator` interface and have added a new order validator to Liferay.

## Related Topics

- [Creating a Simple Product](../../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
- [Localizing Your Application](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application)