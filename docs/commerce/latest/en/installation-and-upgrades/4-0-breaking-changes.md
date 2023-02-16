---
uuid: 46c7dc12-df1b-47d3-9292-40f292b8f8be
---
# 4.0 Breaking Changes

This document presents a chronological list of changes that break existing functionality, APIs, or contracts with third party Liferay Commerce developers or users in Commerce 4.0. We try our best to minimize these disruptions, but sometimes they are unavoidable.

Here are some of the types of changes documented in this file:

* Functionality that is removed or replaced

* API incompatibilities: Changes to public Java or JavaScript APIs

* Changes to context variables available to templates

* Changes in CSS classes available to Liferay themes and portlets

* Configuration changes: Changes in configuration files, like `com.liferay.commerce.*.cfg` etc.

* Execution requirements: Java version, JEE Version, browser versions, etc.

* Deprecations or end of support: For example, warning that a certain feature or API will be dropped in an upcoming version.

* Recommendations: For example, recommending using a newly introduced API that replaces an old API, in spite of the old API being kept in Liferay Portal for backwards compatibility.

## Destination Names Changed

* **Date:** 2020-Sep-10

* **JIRA Ticket:** [COMMERCE-4762](https://issues.liferay.com/browse/COMMERCE-4762)

### What changed?

The prefix `commerce_` has been added to the Commerce destinations defined in `com.liferay.commerce.constants.CommerceDestinationNames`:

* `liferay/commerce_order_status`;

* `liferay/commerce_payment_status`;

* `liferay/commerce_order_status`;

* `liferay/commerce_payment_status`;

* `liferay/commerce_subscription_status`.

### Who is affected?

Anyone who references or uses these destinations.

### How should I update my code?

Update any explicit reference to Commerce destinations with the new names.

### Why was this change made?

This change introduces Liferay's naming pattern for the Commerce destinations.

## Destination Names Changed

* **Date:** 2021-Feb-22

* **JIRA Ticket:** [COMMERCE-4762](https://issues.liferay.com/browse/COMMERCE-5788)

### What changed?

Rearrangement of methods that reference the `externalReferenceCode`.

Classes with updated methods:

* `com.liferay.commerce.inventory.service.CommerceInventoryWarehouseLocalService`

* `com.liferay.commerce.inventory.service.CommerceInventoryWarehouseService`

* `com.liferay.commerce.price.list.service.CommercePriceEntryLocalService`

* `com.liferay.commerce.price.list.service.CommercePriceEntryService`

* `com.liferay.commerce.price.list.service.CommercePriceListLocalService`

* `com.liferay.commerce.price.list.service.CommercePriceListService`

* `com.liferay.commerce.price.list.service.CommerceTierPriceEntryLocalService`

* `com.liferay.commerce.price.list.service.CommerceTierPriceEntryService`

* `com.liferay.commerce.pricing.service.CommercePriceModifierLocalService`

* `com.liferay.commerce.pricing.service.CommercePriceModifierService`

* `com.liferay.commerce.pricing.service.CommercePricingClassLocalService`

* `com.liferay.commerce.pricing.service.CommercePricingClassService`

* `com.liferay.commerce.product.service.CommerceCatalogLocalService`

* `com.liferay.commerce.product.service.CommerceCatalogService`

* `com.liferay.commerce.product.service.CommerceChannelLocalService`

* `com.liferay.commerce.product.service.CommerceChannelService`

* `com.liferay.commerce.product.service.CPAttachmentFileEntryLocalService`

* `com.liferay.commerce.product.service.CPAttachmentFileEntryService`

* `com.liferay.commerce.product.service.CPDefinitionLocalService`

* `com.liferay.commerce.product.service.CPDefinitionService`

* `com.liferay.commerce.product.service.CPInstanceLocalService`

* `com.liferay.commerce.product.service.CPInstanceService`

* `com.liferay.commerce.product.service.CPOptionLocalService`

* `com.liferay.commerce.product.service.CPOptionService`

* `com.liferay.commerce.product.service.CPOptionValueLocalService`

* `com.liferay.commerce.product.service.CPOptionValueService`

* `com.liferay.commerce.product.service.CProductLocalService`

* `com.liferay.commerce.product.service.CProductService`

* `com.liferay.commerce.service.CommerceAddressLocalService`

* `com.liferay.commerce.service.CommerceAddressService`

* `com.liferay.commerce.service.CommerceOrderItemLocalService`

* `com.liferay.commerce.service.CommerceOrderItemService`

* `com.liferay.commerce.service.CommerceOrderLocalService`

* `com.liferay.commerce.service.CommerceOrderNoteLocalService`

* `com.liferay.commerce.service.CommerceOrderNoteService`

* `com.liferay.commerce.service.CommerceOrderService`

### Who is affected?

Anyone who references or uses methods from these classes.

### How should I update my code?

Update methods to use the new corresponding method.

### Why was this change made?

This change was introduced to follow Liferay source formatting.

## MiniCart Component Extensibility

* **Date:** 2021-Feb-12

* **JIRA Ticket:** [COMMERCE-4974](https://issues.liferay.com/browse/COMMERCE-4974)

### What changed?

* The `MiniCart` Tag and FE React Component have been extended to support partial and total replacement of its component views and labels and have some of its features configurable, either via standard Tag attribute, or via direct import of the JS implementation.

  * The exposed `MiniCartTag` attributes changed.

  * The `commerce-frontend-js` module is now exposed with a proper interface to allow a controlled access and exposure of its content (and in particular, of the `MiniCartContext` which is needed for `MiniCart` integration).

  * Usability and extensibility of the MiniCart component is documented [here](https://issues.liferay.com/browse/LRDOCS-9462).

### Who is affected?

Developers relying or extending the old `MiniCartTag`.

### Why was this change made?

Alignment with Liferay DXP standards to support component extensibility.

## CommerceCountry and CommerceRegion Removed

* **Date:** 2021-Mar-02

* **JIRA Ticket:** [LPS-125991](https://issues.liferay.com/browse/LPS-125991)

### What changed?

* The `CommerceCountry` and `CommerceRegion` tables have been removed from the database.

* Service and persistence classes for `CommerceCountry` and `CommerceRegion` have been removed.

* References to `com.liferay.commerce.model.CommerceCountry` and `com.liferay.commerce.model.CommerceRegion` have been replaced by `com.liferay.portal.kernel.model.Country` and `com.liferay.portal.kernel.model.Region`.

* Foreign keys that references `CommerceCountry` and `CommerceRegion` have been renamed from `commerceCountryId` and `commerceRegionId` to `countryId` and `regionId` respectively. Tables that have columns that were updated are

  * `CommerceAddress`

  * `CommerceAddressRestriction`

  * `CommerceShippingFixedOptionRel`

  * `CommerceTaxFixedRateAddressRel`

  * `com.liferay.commerce.country.CommerceCountryManager` is added for retrieving Commerce-specific countries. Available methods are:

  * `getBillingCountries`

  * `getBillingCountriesByChannelId`

  * `getShippingCountries`

  * `getShippingCountriesByChannelId`

  * `getWarehouseCountries`

### Who is affected?

Anyone who references or uses these models and services.

### How should I update my code?

Update any explicit reference to `CommerceCountry` and/or `CommerceRegion` with the new corresponding models and services.

### Why was this change made?

This change removes duplicate models and services in Liferay Portal.

## Mini Compare Widget + Mini Compare Component

* **Date:** 2021-Mar-26

* **JIRA Ticket:** [COMMERCE-2909](https://issues.liferay.com/browse/COMMERCE-2909)

### What changed?

* Migration of the `MiniCompare` FE implementation from JSP/vanilla JavaScript to React (in `commerce-frontend-js`). It's loaded directly from the same JSP source in `commerce-product-content-web`.

* CP Definition ID's are now stored in and eventually read from a cookie, instead of using the session.

* Refactored the `CompareCheckboxTag` to render via JSP. The JSP in turn renders the `CompareCheckbox` React component.

  * **Deprecated** and **removed** the old Soy/MetalJS implementation of the `CompareCheckbox` in the `commerce-frontend-taglib` module.

### Who is affected?

Developers relying or extending the old implementation of the MiniCompare component/widget.

### Why was this change made?

* Due to Soy/MetalJS deprecation

* To align with Liferay DXP to support Liferay Classic Theme in Commerce, paving way for future DXP WEM integration.

## Revamped Account Selector

* **Date:** 2021-Apr-27

* **JIRA Ticket:** [COMMERCE-5888](https://issues.liferay.com/browse/COMMERCE-6315)

### What changed?

* Refactored the `AccountSelectorTag` to render via JSP and extend it from the `IncludeTag`. The JSP hydrates and renders the `AccountSelector` React component migrated from Soy/MetalJS.

* Renamed the event names to notify other components about Account/Order changes communicated during the runtime life cycle via the Commerce Headless API.

### Who is affected?

Developers who rely or extend the old Soy/MetalJS component with its related Tag.

### Why was this change made?

* Due to Soy/MetalJS deprecation

* To align with Liferay DXP to support Liferay Classic Theme in Commerce, paving way for future DXP WEM integration.

## Product Card and Product Rendering Strategies in Storefront

* **Date:** 2021-Apr-27

* **JIRA Ticket:** [COMMERCE-5889](https://issues.liferay.com/browse/COMMERCE-5889)

### What changed?

* The Product Card component is now ported to a JSP template to display product information. It hydrates and renders via `CPContentListRenderer` &rarr; `CPContentListEntryRenderer`.

  * The Product Publisher, Search Results, Compare widgets now use these rendering strategies.

  * Commerce Theme Minium Site Initializer is now configured to use these rendering strategies.

  * The implementation now resides in the `commerce-product-content-web` module and is extensible through `CPContentRenderer` override, JSP override, or
  Liferay Dynamic Include.

  * **Deprecated** and **removed** The old Soy/MetalJS implementation of the Product Card in the `commerce-frontend-taglib` module has been **deprecated** and **removed**.

  * The old Minium-specific `CPContentRenderer`'s in the `commerce-theme-minium-impl` module have been **deprecated** and **removed**.

* Refactored the `AddToCartTag` to render via JSP and now extends from the `IncludeTag`. The JSP in turn renders the `AddToCart` React component, including the `QuantitySelector` React component.

  * **Deprecated** and **removed** the old Soy/MetalJS implementation of the `AddToCartButton` in the `commerce-frontend-taglib` module.

  * **Deprecated** and **removed** the old Soy/MetalJS implementation of the `QuantitySelector` in the `commerce-frontend-taglib` module.

  * **Deprecated** and **removed** the old `QuantitySelectorTag` in the `commerce-frontend-taglib` module.

* The `PriceTag` has been refactored to render via JSP and now extends from the `IncludeTag`. The JSP both renders the correctly structured template (for SEO purposes) and eventually renders the `Price` React component (for user page landing).

  * **Deprecated** and **removed** the old Soy/MetalJS implementation of the `Price` in the `commerce-frontend-taglib` module.

### Who is affected?

Developers relying on or extending:

* the Minium-specific CP Content Renderers in `commerce-theme-minium-impl`

* the Soy/MetalJS `AddToCartTag` and `AddToCartButton*`.

* the Soy/MetalJS `QuantitySelectorTag` and `QuantitySelector*`.

* the Soy/MetalJS `PriceTag` and `Price*`.

### Why was this change made?

* Due to Soy/MetalJS deprecation

* To align with Liferay DXP to support Liferay Classic Theme in Commerce, paving way for future DXP WEM integration.

## Standardize Method Names to Use AddOrUpdate vs. Upsert in *ServiceImpl Classes

* **Date:** 2021-Jun-4

* **JIRA Ticket:** [COMMERCE-6095](https://issues.liferay.com/browse/COMMERCE-6095)

### What changed?

Any methods in Commerce `*ServiceImpl` classes with the name `upsert*` are now renamed to `addOrUpdate*`.

### Who is affected?

Developers who are using any `*ServiceImpl` `upsert*` methods must use the corresponding methods `addOrUpdate*`.

### Why was this change made?

This change introduces Liferay's source formatting to the above methods.

## BOM Feature Is Replaced by Shop by Diagram Feature

* **Date:** 2021-Oct-14

* **JIRA Ticket:** [COMMERCE-3030](https://issues.liferay.com/browse/COMMERCE-3030)

### What changed?

Shop by Diagram replaces the BOM feature. This means that the entries Folder and BOM entry do not exist and there is a new Product Type called Diagram.

### Who is affected?

Product specialists who must create diagrams for their store don't need to create products with the Diagram product type.

### Why was this change made?

This change fixes BOM issues and better fulfills spare parts use cases.

## Remove the Accounts widget so it is no longer a module in Liferay Commerce

* **Date:** 2021-Nov-21

* **JIRA Ticket:** [COMMERCE-7288](https://issues.liferay.com/browse/COMMERCE-7288)

### What changed?

The Account widget replaces the Commerce Account widget. All instances on an existing running system have been updated.

### Who is affected?

* Developers who have customized the Commerce Account widget and/or used it with site initializers.

* End users (Account managers) that will use a different widget to manage accounts.

### Why was this change made?

This change was necessary to conform with the migration of Commerce Account to Account.

## Refactor CommerceOrderLocalServiceImpl

* **Date:** 2022-Feb-16

* **JIRA Ticket:** [COMMERCE-8440](https://issues.liferay.com/browse/COMMERCE-8440)

### What changed?

* There are now only three instances of the `updateCommerceOrder` method, instead of four.

* Removed the `updateCustomFields` method.

* Removed the `updateOrderStatus` method.

* Removed the `updateTransactionId` method.

* Removed the `updateUser` method.

### Who is affected?

Developers who are calling any of these methods in their code.

### How should I update my code?

* Use the remaining 3 `updateCommerceOrder` methods as a direct replacement.

* Use `updateCommerceOrder(CommerceOrder commerceOrder)` method after setting `expandoBridgeAttributes` with `commerceOrder.setExpandoBridgeAttributes(ServiceContext serviceContext)` to update the `customFields`.

* Use `updateCommerceOrder(CommerceOrder commerceOrder)` method after setting the `orderStatus` with `commerceOrder.setOrderStatus(int orderStatus)` to update the `orderStatus`.

* Use `updateCommerceOrder(CommerceOrder commerceOrder)` method after setting `transactionId` with `commerceOrder.setTransactionId(String transactionId)` to update the `transactionId`.

* Use `updateCommerceOrder(CommerceOrder commerceOrder)` method after setting the `userId` and `userName` with `commerceOrder.setUserId(long userId)` and `commerceOrder.setUserName(String userName)` to update the user information.

### Why was this change made?

This change was introduced to clean up the class `CommerceOrderLocalServiceImpl`.

## Refine CommerceOrder in commerce-service service.xml

* **Date:** 2022-Apr-13

* **JIRA Ticket:** [COMMERCE-8408](https://issues.liferay.com/browse/COMMERCE-8408)

### What changed?

* Rearrangement of parameters for the `addCommerceOrder` method in `CommerceOrderLocalService` and `CommerceOrderService`.

* Rearrangement of parameters for the `addOrUpdateCommerceOrder` method in `CommerceOrderLocalService` and `CommerceOrderService`.

* Rearrangement of parameters for the `updateCommerceOrder` method in `CommerceOrderLocalService` and `CommerceOrderService`.

* Rearrangement of parameters for the `updateCommerceOrderPrices` method in `CommerceOrderLocalService` and `CommerceOrderService`.

### Who is affected?

Developers who are calling any of these methods in their code.

### How should I update my code?

* Verify that parameters are correctly aligned with new `addCommerceOrder` method(s).

* Verify that parameters are correctly aligned with new `addOrUpdateCommerceOrder` method(s).

* Verify that parameters are correctly aligned with new `updateCommerceOrder` method(s).

* Verify that parameters are correctly aligned with new `updateCommerceOrderPrices` method(s).

### Why was this change made?

This change cleans up the entity `CommerceOrder` in `commerce-service` `service.xml`.

## Refactor CPContentHelper and CPContentHelperImpl

* **Date:** 2021-Dec-16

* **JIRA Ticket:** [COMMERCE-7830](https://issues.liferay.com/browse/COMMERCE-7830)

### What changed?

* Change in signature of method in `CPContentHelper.java` and `CPContentHelperImpl.java`: 
  * `getReplacementCommerceProductFriendlyURL(long cProductId, String cpIntanceUuid, ThemeDisplay themeDisplay)` to `getReplacementCommerceProductFriendlyURL(CPSku cpSku, ThemeDisplay themeDisplay)`
* Renamed the `getCPAttachmentFileEntries()` method in `CPContentHelper.java` and `CPContentHelperImpl.java` to `getCPMedias()`

### Who is affected?

This affects any developers referencing or using these methods in their code.

### How should I update my code?

Replace any references and usages of the above methods with the new ones.

### Why was this change made?

The methods were refactored for better readability, consistency and maintainability.
