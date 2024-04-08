---
uuid: 8b949a1f-5f7c-40f7-a041-a06c6a799055
taxonomy-category-names:
- Commerce
- Java Development
- Promotions and Discounts
- Liferay Self-Hosted
- Liferay PaaS
---
# Adding a New Discount Rule Type

You can add a new discount rule type by implementing two interfaces: [CommerceDiscountRuleType](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-api/src/main/java/com/liferay/commerce/discount/rule/type/CommerceDiscountRuleType.java) and [CommerceDiscountRuleTypeJSPContributor](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-api/src/main/java/com/liferay/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributor.java).

Discount rule types define conditions for evaluating when discounts are applied to an order. Liferay provides three discount rule types out-of-the-box: [AddedAllCommerceDiscountRuleTypeImpl](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/AddedAllCommerceDiscountRuleTypeImpl.java), [AddedAnyCommerceDiscountRuleTypeImpl](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/AddedAnyCommerceDiscountRuleTypeImpl.java), and [CartTotalCommerceDiscountRuleTypeImpl](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/CartTotalCommerceDiscountRuleTypeImpl.java).

![Discount rule types available out-of-the-box.](./adding-a-new-discount-rule-type/images/01.png)

## Overview

1. [**Deploy an Example**](#deploy-an-example)
1. [**Walk Through the Example**](#walk-through-the-example)
1. [**Additional Information**](#related-topics)

## Deploy an Example

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to deploy an example discount rule type on your Liferay instance:

1. Download and unzip the [Acme Commerce Discount Rule Type](./liferay-m6a8.zip).

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/promotions/liferay-m6a8.zip -O
   ```

   ```bash
   unzip liferay-m6a8.zip
   ```

1. Build and deploy the example.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
       This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

   ```bash
   STARTED com.acme.m6a8.web_1.0.0
   ```

1. Verify that the example discount rule type was added. Open your browser to `https://localhost:8080`. Then click the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Discounts*. Click *Edit* within the menu for any discount. Scroll down to the *Rules* section and click *Add* (![Add](../../images/icon-add.png)) to add a new discount rule. The new discount rule type ("Has a minimum number of products") is present under the *Type* dropdown.

!!! note
    In Commerce 2.1 and earlier, you can find discounts by navigating to *Control Panel* &rarr; *Commerce* &rarr; *Discounts*. Click any *Edit* within the menu for any discount and then click *Rules* at the top of the screen.

![Verify the addition of a new discount rule type](./adding-a-new-discount-rule-type/images/02.png)

Congratulations, you've successfully built and deployed a new discount rule type that implements `CommerceDiscountRuleType`.

## Walk Through the Example

There are two classes: a discount rule type class and a JSP contributor for a custom UI input. Follow these steps:

* [Annotate the Discount Rule Type Class for OSGi Registration](#annotate-the-discount-rule-type-class-for-osgi-registration)
* [Review the `CommerceDiscountRuleType` Interface](#review-the-commercediscountruletype-interface)
* [Annotate the JSP Contributor Class for OSGi Registration](#annotate-the-jsp-contributor-class-for-osgi-registration)
* [Review the `CommerceDiscountRuleTypeJSPContributor` Interface](#review-the-commercediscountruletypejspcontributor-interface)
* [Complete the Discount Rule Type](#complete-the-discount-rule-type)

### Annotate the Discount Rule Type Class for OSGi Registration

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/M6A8CommerceDiscountRuleTypeImpl.java
:language: java
:lines: 19-27
```

It is important to provide a distinct key for the discount rule type so that Liferay can distinguish the new type from others in the [discount rule type registry](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/CommerceDiscountRuleTypeRegistryImpl.java). Declaring a key that is already in use overrides the existing associated type.

The `commerce.discount.rule.type.order` value indicates how far in the list of available discount rule types this type appears. For example, the ["added all" discount rule type](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/internal/rule/type/AddedAllCommerceDiscountRuleTypeImpl.java) has a value of 50. Giving your discount rule type a value of 51 ensures that it appears immediately after the "added all" type.

### Review the `CommerceDiscountRuleType` Interface

Implement the following methods:

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/M6A8CommerceDiscountRuleTypeImpl.java
:dedent: 1
:language: java
:lines: 30-33
```

This method is where you implement the business logic for evaluating when the discount rule is applied.

```java
public String getKey();
```

This provides a unique identifier for the discount rule type in the discount rule type registry. The key can be used to fetch the new type from the registry.

```java
public String getLabel(Locale locale);
```

This returns a text label that describes how the discount rule is applied. See the implementation in [M6A8CommerceDiscountRuleTypeImpl.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/M6A8CommerceDiscountRuleTypeImpl.java) for a reference in retrieving the label with a language key.

### Annotate the JSP Contributor Class for OSGi Registration

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributor.java
:language: java
:lines: 13-18
```

It is important to provide a distinct key for the JSP contributor so that Liferay can distinguish the contributor from others in the [discount rule type JSP contributor registry](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-api/src/main/java/com/liferay/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributorRegistry.java). Declaring a key that is already in use overrides the existing associated type.

### Review the `CommerceDiscountRuleTypeJSPContributor` Interface

Implement the following method:

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributor.java
:dedent:1
:language: java
:lines: 21-25
```

This is where the code to render a custom UI input for our discount rule type goes.

### Complete the Discount Rule Type

The discount rule type comprises of the backend logic for evaluating when to apply a discount rule to an order, logic to render UI inputs for the discount rule type, and the custom UI inputs themselves.

* [Configure the `ServletContext` for the module.](#configure-the-servletcontext-for-the-module)
* [Implement the `CommerceDiscountRuleTypeJSPContributor`'s `render` method.](#implement-the-commercediscountruletypejspcontributors-render-method)
* [Add the evaluation logic to `evaluate`.](#add-the-evaluation-logic-to-evaluate)
* [Add a JSP to render the custom UI input.](#add-a-jsp-to-render-the-custom-ui-input)
* [Add the language keys to `Language.properties`.](#add-the-language-keys-to-languageproperties)

#### Configure the `ServletContext` for the Module

Define the `ServletContext` in the JSP contributor class using the bundle's symbolic name so it can find the JSP:

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributor.java
:dedent:1
:language: java
:lines: 35-36
```

The value set for `osgi.web.symbolicname` matches the value for `Bundle-SymbolicName` in the [bnd.bnd file](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/bnd.bnd). These values must match for the `ServletContext` to locate the JSP.

Declare a unique value for `Web-ContextPath` in the bnd.bnd file so the `ServletContext` is correctly generated. In this example, `Web-ContextPath` is set to `/m6a8-web`. See the [bnd.bnd file](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/bnd.bnd) for a reference on these values.

#### Implement the `CommerceDiscountRuleTypeJSPContributor`'s `render` Method

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/CommerceDiscountRuleTypeJSPContributor.java
:dedent:1
:language: java
:lines: 20-30
```

Use a `JSPRenderer` to render the JSP for the discount rule type's custom UI input (in our example, [view.jsp](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/resources/META-INF/resources/view.jsp)). Provide the `ServletContext` as a parameter to find the JSP.

#### Add the Evaluation Logic to `evaluate`

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/java/com/acme/m6a8/web/internal/commerce/discount/rule/type/M6A8CommerceDiscountRuleTypeImpl.java
:dedent: 1
:language: java
:lines: 29-53
```

Implement any conditions here that must be true for a discount rule to be applied. This example checks that the order contains at least a minimum number of items, using a minimum value defined by a custom UI input (stored as a String within the [CommerceDiscountRule](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-discount-service/src/main/java/com/liferay/commerce/discount/model/impl/CommerceDiscountRuleImpl.java)).

The `CommerceOrder` object represents information about the order being evaluated. See [CommerceOrder.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrder.java) and [CommerceOrderModel.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceOrderModel.java) to find more information you can get from a `CommerceOrder`.

#### Add a JSP to Render the Custom UI Input

The example uses a JSP called `view.jsp` with a numeric input for a minimum number of products.

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 1-6
```

Implement UI elements to present when defining a discount rule. These appear immediately after selecting the discount rule type. Defining an input causes the saved value to be stored in the discount rule's settings properties.

See [Using AUI Taglibs](https://help.liferay.com/hc/en-us/articles/360020189212-Using-AUI-Taglibs) for more information on using AUI inputs.

#### Add the Language Keys to `Language.properties`

Add the language keys and their values to a [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/promotions/adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/resources/content/Language.properties) file:

```{literalinclude} ./adding-a-new-discount-rule-type/resources/liferay-m6a8.zip/m6a8-web/src/main/resources/content/Language.properties
:language: properties
:lines: 1-2
```

See [Localizing Your Application](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application) for more information.

## Conclusion

Congratulations! You now know the basics for implementing the `CommerceDiscountRuleType` interface, and have added a new discount rule type with a custom UI input to Liferay.

## Related Topics

* [Creating a Discount](../../pricing/promoting-products/creating-a-discount.md)
* [Localizing Your Application](https://help.liferay.com/hc/en-us/articles/360018168251-Localizing-Your-Application)
* [Using AUI Taglibs](https://help.liferay.com/hc/en-us/articles/360020189212-Using-AUI-Taglibs)
