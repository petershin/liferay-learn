---
uuid: 9b2c9b01-3a91-48da-b947-8225fc78f9b2
taxonomy-category-names:
- Development and Tooling
- Reference
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# 7.4 Breaking Changes

Breaking changes changes break or significantly alter existing functionality or code structure. Here are all of the breaking changes for Liferay 7.4, starting with the first quarterly release (2023 Q3). As the product changes and improves, we try our best to minimize these disruptions, but sometimes they are unavoidable.

Read about 7.4 breaking changes from before 2023 Q3 in the [Liferay source code](https://github.com/liferay/liferay-portal/blob/master/readme/BREAKING_CHANGES.markdown).

## 2024 Q1 Release

### Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change**                                         | **Description**                                                                                                                                                                                              | **References**                                                |
| :---------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Selecting Guest Role for Segments**                       | You can no longer select the Guest role when editing a Segment. The option was removed because selecting this role would not work properly.                                                                  | [LPS-199579](https://liferay.atlassian.net/browse/LPS-199579) |
| **Breadcrumb Portlet Access to Sites for Guests**           | Guests are now able to access sites via the Breadcrumb portlet as long as they are accessible to Guests. Previously, the portlet incorrectly denied access if the site had restricted or private membership. | [LPS-200487](https://liferay.atlassian.net/browse/LPS-200487) |
| **Selecting Administrator Role for Segments**               | You can no longer assign regular administrators to Segments (like Site Administrators and Site Owners). Te option was removed because it caused some unexpected behaviors.                                   | [LPD-4335](https://liferay.atlassian.net/browse/LPD-4335)     |
| **Case-Sensitive Tags**                                     | Tag names are now case-sensitive.                                                                                                                                                                            | [LPD-6882](https://liferay.atlassian.net/browse/LPD-6882)     |
| **Filtering Web Content**                                   | All web content filters now only apply to the currently selected folder. This change makes web content filter behavior more consistent.                                                                      | [LPD-6710](https://liferay.atlassian.net/browse/LPD-6710)     |
| **Searching Web Content with Filters**                      | If you have a filter applied when searching web content, performing a new search now clears the filter.                                                                                                      | [LPD-6710](https://liferay.atlassian.net/browse/LPD-6710)     |
| **Web Content Status Filter Names**                         | The filter options for web content status have been renamed: "With approved versions" is now "Approved," "With scheduled versions" is now "Scheduled," and "With expired versions" is now "Expired."         | [LPD-6709](https://liferay.atlassian.net/browse/LPD-6709)     |
| **Article ID in Web Content Template Editor**               | The `reserved-article-id` variable is renamed to `articleId` for web content templates. The `externalReferenceCode` and `resourcePrimKey` (i.e., the `structuredContentId`) variables are also added.        | [LPS-203949](https://liferay.atlassian.net/browse/LPS-203949) |
| **Utility Page Configurations**                             | The general configuration icon for utility pages no longer appears on the Page Design Options panel. You must now access them via the Actions menu on the Utility Pages page.                                | [LPD-4459](https://liferay.atlassian.net/browse/LPD-4459)     |
| **Allow Manual Membership Management Option for New Sites** | When creating a new site, the Allow Manual Membership Management option is disabled by default.                                                                                                              | [LPS-191374](https://liferay.atlassian.net/browse/LPS-191374) |

### Changes in Module Source Code

**PersonalMenuEntry.java**
[`modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/PersonalMenuEntry.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/PersonalMenuEntry.java)

* __Date:__ Nov. 6, 2023
* __Ticket:__ [LPS-198527](https://liferay.atlassian.net/browse/LPS-198527)
* __What changed:__ The new `getOnClickJSModuleURL` method is added.
* __Reason:__ This change allows for loading a JS module at run-time by clicking on Personal Menu entries.

**CacheControlConfiguration.java**
[`modules/apps/document-library/document-library-web/src/main/java/com/liferay/document/library/web/internal/configuration/CacheControlConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-web/src/main/java/com/liferay/document/library/web/internal/configuration/CacheControlConfiguration.java)

* __Date:__ Nov. 6, 2023
* __Ticket:__ [LPS-200359](https://liferay.atlassian.net/browse/LPS-200359)
* __What changed:__ A new configuration is added to not cache documents by default.
* __Reason:__ This configuration is the new default to improve security.

**BaseAMImageCounter.java**
[`modules/apps/adaptive-media/adaptive-media-image-api/src/main/java/com/liferay/adaptive/media/image/counter/BaseAMImageCounter.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/adaptive-media/adaptive-media-image-api/src/main/java/com/liferay/adaptive/media/image/counter/BaseAMImageCounter.java)

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
* __What changed:__ The `BaseAMImageCounter` class is a new base class for `AMImageCounter` implementations to use.
* __Reason:__ This class helps implement `AMImageCounter` with common logic implementations.

**BaseAMImageOptimizer.java**
[`modules/apps/adaptive-media/adaptive-media-image-api/src/main/java/com/liferay/adaptive/media/image/optimizer/BaseAMImageOptimizer.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/adaptive-media/adaptive-media-image-api/src/main/java/com/liferay/adaptive/media/image/optimizer/BaseAMImageOptimizer.java)

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
* __What changed:__ The `BaseAMImageOptimizer` class is a new base class for `AMImageOptimizer` implementations to use.
* __Reason:__ This class helps implement `AMImageOptimizer` with common logic implementations.

**DLFileEntryConfigurationProvider.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java)

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
* __What changed:__ The new `getGroupPreviewableProcessorMaxSizeMap` method is added to return all group values with the given `previewableProcessorMaxSize` attribute.
* __Reason:__ This change helps filter by groups with specific attribute values, instead of getting the attribute for all types.

**AuditMessageFactoryImpl.java**
`modules/apps/portal-security-audit/portal-security-audit-impl/src/main/java/com/liferay/portal/security/audit/internal/AuditMessageFactoryImpl.java`

* __Date__ Nov. 7, 2023
* __Ticket:__ [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
* __What changed:__ The class is removed. The logic previously in `AuditMessageFactoryImpl` is now implemented in `AuditMessageFactory` instead.
* __Reason:__ These classes being separated did not provide any value, so they were consolidated into `AuditMessageFactory` to simplify the code.

**CPDefinitionLinkTypeSettingsImpl.java**
`modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/configuration/CPDefinitionLinkTypeSettingsImpl.java`

* __Date:__ Nov. 8, 2023
* __Ticket:__ [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
* __What changed:__ The class is removed.
* __Reason:__ This functionality is handled by `CPDefinitionLinkTypeRegistry`.

**CPDefinitionLinkTypeSettings.java**
`modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPDefinitionLinkTypeSettings.java`

* __Date:__ Nov. 8, 2023
* __Ticket:__ [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
* __What changed:__ The class is removed.
* __Reason:__ This functionality is handled by `CPDefinitionLinkTypeRegistry`.

**CPDefinitionLinkTypeConfigurationWrapper.java**
`modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/configuration/CPDefinitionLinkTypeConfigurationWrapper.java`

* __Date:__ Nov. 8, 2023
* __Ticket:__ [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
* __What changed:__ The class is removed.
* __Reason:__ This functionality is handled by `CPDefinitionLinkTypeRegistry`.

**COREntryType.java**
[`modules/apps/commerce/commerce-order-rule-api/src/main/java/com/liferay/commerce/order/rule/entry/type/COREntryType.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-order-rule-api/src/main/java/com/liferay/commerce/order/rule/entry/type/COREntryType.java)

* __Date:__ Nov. 8, 2023
* __Ticket:__ [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
* __What changed:__ The new `evaluate(COREntry, List<COREntryTypeItem>)` method is added.
* __Reason:__ This change is made to evaluate rules before creating an order.

**CPContentHelper.java**
[`modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java)

* __Date:__ Nov. 10, 2023
* __Ticket:__ [COMMERCE-12682](https://liferay.atlassian.net/browse/COMMERCE-12682)
* __What changed:__ The `getImages` method now has a `boolean` parameter for `gallery`.
* __Reason:__ This change allows for retrieving images with a filter for images that are not allowed in an image gallery.

**AccountConstants.java**
[`modules/apps/account/account-api/src/main/java/com/liferay/account/constants/AccountConstants.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/account/account-api/src/main/java/com/liferay/account/constants/AccountConstants.java)

* __Date:__ Nov. 15, 2023
* __Ticket:__ [COMMERCE-12813](https://liferay.atlassian.net/browse/COMMERCE-12813)
* __What changed:__ The `getAccountEntryTypes` method now has a `long` parameter for `companyId`. The `ACCOUNT_ENTRY_TYPES` field is also removed.
* __Reason:__ This change allows feature flags to be based on specific Liferay DXP instances.

**SharingDropdownItemFactory.java**
[`modules/apps/sharing/sharing-api/src/main/java/com/liferay/sharing/display/context/util/SharingDropdownItemFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/sharing/sharing-api/src/main/java/com/liferay/sharing/display/context/util/SharingDropdownItemFactory.java)

* __Date:__ Nov. 16, 2023
* __Ticket:__ [LPS-200202](https://liferay.atlassian.net/browse/LPS-200202)
* __What changed:__ A new `createCopyLinkDropdownItem(String, long, HttpServletRequest)` method is added.
* __Reason:__ This method allows for creating a drop-down menu to copy document links.

**JavaScriptAwarePortalWebResources.java**
`modules/apps/frontend-js/frontend-js-loader-modules-extender-api/scr/main/java/com/liferay/frontend/js/loader/modules/extender/npm/JavaScriptAwarePortalWebResources.java`

* __Date:__ Nov. 22, 2023
* __Ticket:__ [LPS-199532](https://liferay.atlassian.net/browse/LPS-199532)
* __What changed:__ The class is removed.
* __Reason:__ This class is no longer used.

**ObjectFieldLocalServiceImpl.java**
[`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFieldLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFieldLocalServiceImpl.java)

* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
* __What changed:__ The `validateExternalReferenceCode`, `validateRequired`, and `validateReadOnlyAndReadOnlyConditionExpression` methods are now public and included in `ObjectFieldLocalService`.
* __Reason:__ This change is needed for object field validation when creating one-to-one or one-to-many relationships.

**ObjectRelationshipImpl.java**
[`modules/apps/object/object-service/src/main/java/com/liferay/object/model/impl/ObjectRelationshipImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-service/src/main/java/com/liferay/object/model/impl/ObjectRelationshipImpl.java`)

* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
* __What changed:__ A new `compareType(String)` method is added.
* __Reason:__ This change simplifies the logic implementation to allow for more code reuse.

**ObjectRelationshipLocalServiceImpl.java**
[`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectRelationshipLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectRelationshipLocalServiceImpl.java)

* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
* __What changed:__ The `addObjectRelationship` and `updateObjectRelationship` methods have a new `ObjectField` parameter.
* __Reason:__ This change allows for methods to set properties when creating a one-to-one or one-to-many object relationship.

**ObjectRelationshipServiceImpl.java**
[`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectRelationshipServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectRelationshipServiceImpl.java)

* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
* __What changed:__ The `addObjectRelationship` and `updateObjectRelationship` methods have a new `ObjectField` parameter.
* __Reason:__ This change allows for methods to set properties when creating a one-to-one or one-to-many object relationship.

**rest-openapi.yaml**
`modules/apps/object/object-admin-rest-impl/rest-openapi.yaml`
        
* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
* __What changed:__ The `ObjectRelationship` schema has a new `objectField` property.
* __Reason:__ This change allows for exporting object fields with its associated one-to-one or one-to-many object relationships.

`/modules/apps/users-admin/users-admin-test-util/bnd.bnd`

* __Date:__ Nov. 29, 2023
* __Ticket:__ [LPS-202908](https://liferay.atlassian.net/browse/LPS-202908)
* __What changed:__ The bundle version is increased to `6.0.0`.

`modules/apps/object/object-admin-rest-api/bnd.bnd`

* __Date:__ Nov. 30, 2023
* __Ticket:__ [LPS-172418](https://liferay.atlassian.net/browse/LPS-172418)
* __What changed:__ The bundle version is increased to `20.0.0`.

**CommercePaymentEntryLocalServiceImpl.java**
[`modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/service/impl/CommercePaymentEntryLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/service/impl/CommercePaymentEntryLocalServiceImpl.java)

* __Date:__ Nov. 30, 2023
* __Ticket:__ [COMMERCE-12384](https://liferay.atlassian.net/browse/COMMERCE-12384)
* __What changed:__ The `addCommercePaymentEntry` and `updateCommercePaymentEntry` methods have new parameters.
* __Reason:__ Commerce payment entries require more information to create and update.

* __Date:__ Dec. 19, 2023
* __Ticket:__ [COMMERCE-12943](https://liferay.atlassian.net/browse/COMMERCE-12943)
* __What changed:__ Various method signatures have had their parameters changed.
* __Reason:__ This change allows for managing the different types of payments.

**BundleManager.java**
`modules/apps/marketplace/marketplace-api/src/main/java/com/liferay/marketplace/bundle/BundleManager.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-201076](https://liferay.atlassian.net/browse/LPS-201076)
* __What changed:__ The class is removed. Instead, use `BundleManagerUtil`.
* __Reason:__ The class is being replaced by `BundleManagerUtil`.

**EntityExtensionHandler.java**
[`modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/extension/EntityExtensionHandler.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/extension/EntityExtensionHandler.java)

* __Date:__ Dec. 1, 2023
* __Ticket:__ [COMMERCE-12980](https://liferay.atlassian.net/browse/COMMERCE-12980)
* __What changed:__ The `getExtendedProperties` method has a new `long userId` parameter.
* __Reason:__ This change is required to pass `dtoConverterContext` with the correct user ID when converting the related unmodifiable system objects to DTO.

**ExtensionProvider.java**
[`modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/extension/ExtensionProvider.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/extension/ExtensionProvider.java)

* __Date:__ Dec. 1, 2023
* __Ticket:__ [COMMERCE-12980](https://liferay.atlassian.net/browse/COMMERCE-12980)
* __What changed:__ The `getExtendedProperties` method has a new `long userId` parameter.
* __Reason:__ This change is required to pass `dtoConverterContext` with the correct user ID when converting the related unmodifiable system objects to DTO.

**CommerceCountryItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommerceCountryItemSelectorCriterion.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
* __What changed:__ The class is removed.
* __Reason:__ This class was meant for internal use and is no longer used.

**CommerceInventoryWarehouseItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommerceInventoryWarehouseItemSelectorCriterion.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
* __What changed:__ The class is removed.
* __Reason:__ This class was meant for internal use and is no longer used.

**CommercePricingClassItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommercePricingClassItemSelectorCriterion.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
* __What changed:__ The class is removed.
* __Reason:__ This class was meant for internal use and is no longer used.

**CommerceProductInstanceItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommerceProductInstanceItemSelectorCriterion.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
* __What changed:__ The class is removed.
* __Reason:__ This class was meant for internal use and is no longer used.

**CPInstanceItemSelectorCriterion.java**
`modules/apps/commerce/commerce-product-item-selector-api/src/main/java/com/liferay/commerce/product/item/selector/criterion/CPInstanceItemSelectorCriterion.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
* __What changed:__ The class is removed.
* __Reason:__ This class was meant for internal use and is no longer used.

**LayoutPageTemplateEntryItemSelectorCriterion.java**
`modules/apps/commerce/commerce-product-item-selector-api/src/main/java/com/liferay/commerce/product/item/selector/criterion/LayoutPageTemplateEntryItemSelectorCriterion.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
* __What changed:__ The class is removed.
* __Reason:__ This class was meant for internal use and is no longer used.

**DLProcessorRegistryTest.java**
`modules/apps/document-library/document-library-test/src/testIntegration/java/com/liferay/document/library/util/test/DLProcessorRegistryTest.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The class is renamed to `DLProcessorHelperTest`, and moved from the `com.liferay.document.library.util.test` package to the `com.liferay.document.library.processor.test` package.
* __Reason:__ This change is made for clarity and to keep the package name matching the class name.

**DLProcessorRegistryImpl.java**
`modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/util/DLProcessorRegistryImpl.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The class is renamed to `DLProcessorHelperImpl`, and moved from the `com.liferay.document.library.internal.util` package to the `com.liferay.document.library.internal.processor` package. The `register` and `unregister` methods have also been removed. If you are providing your own non-OSGi `DLProcessor` implementation, convert it to an OSGi service.
* __Reason:__ The refactoring change is made for clarity and to keep the package name matching the class name. The `register` and `unregister` methods are removed because all out-of-the-box `DLProcessor` objects are now OSGi components.

**CommerceOrderValidator.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidator.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidator.java)

* __Date:__ Dec. 2, 2023
* __Ticket:__ [COMMERCE-12309](https://liferay.atlassian.net/browse/COMMERCE-12309)
* __What changed:__ The `validate(Locale, CommerceOrder, CPInstance, BigDecimal)` method has two new parameters: `String json` and `boolean child`.
* __Reason:__ This change helps with validation of products before they're added to a cart.

**AssetDisplayPageEntry.java**
[`modules/apps/asset/asset-display-page-api/src/main/java/com/liferay/asset/display/page/model/AssetDisplayPageEntry.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/asset/asset-display-page-api/src/main/java/com/liferay/asset/display/page/model/AssetDisplayPageEntry.java)

* __Date:__ Dec. 2, 2023
* __Ticket:__ [LPS-200477](https://liferay.atlassian.net/browse/LPS-200477)
* __What changed:__ A new `getPlid()` method is added. The `plid` column is removed from the `AssetDisplayPageEntry` table. Instead, call `AssetDisplayPageEntry.getPlid()`.
* __Reason:__ The `plid` column was temporarily removed from the `AssetDisplayPageEntry` table, so this was added as an alternative method to retrieve the `plid`.

**CommerceAddressService.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceAddressService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceAddressService.java)

* __Date:__ Dec. 2, 2023
* __Ticket:__ [COMMERCE-12658](https://liferay.atlassian.net/browse/COMMERCE-12658)
* __What changed:__ The `getBillingCommerceAddresses`, `getBillingCommerceAddressesCount`, `getShippingCommerceAddresses`, and `getShippingCommerceAddressesCount` methods have a new `long commerceChannelId` parameter.
* __Reason:__ This change allows addresses to be assigned to specific Commerce channels.

**CommerceShippingEngine.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceShippingEngine.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceShippingEngine.java)

* __Date:__ Dec. 2, 2023
* __Ticket:__ [COMMERCE-12879](https://liferay.atlassian.net/browse/COMMERCE-12879)
* __What changed:__ A new `getKey` method is added.
* __Reason:__ This change allows for managing both standard OSGi components and client extensions.dard osgi components and client extensions

**CETConfiguration.java**
[`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/configuration/CETConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/configuration/CETConfiguration.java)

* __Date:__ Dec. 4, 2023
* __Ticket:__ [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
* __What changed:__ A new `buildTimestamp` field is added for whenever a new build takes place in a Liferay Workspace.
* __Reason:__ Liferay DXP will use this field for the `${modifiedTimestamp}` variable for client extensions.

**CETFactory.java**
[`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/factory/CETFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/factory/CETFactory.java)

* __Date:__ Dec. 4, 2023
* __Ticket:__ [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
* __What changed:__ A new `boolean replaceVariables` parameter is added to the `create` methods.
* __Reason:__ This change is made to make the API easier to understand, maintain, and extend. The new parameter allows for controlling variable substitutions in URL fields.

**CETImplFactory.java**
[`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/factory/CETImplFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/factory/CETImplFactory.java)

* __Date:__ Dec. 4, 2023
* __Ticket:__ [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
* __What changed:__ Various changes to the interface's method signatures.
* __Reason:__ CET factory implementations are now responsible for constructing specific CET objects. This helps simplify implementation logic.

**CET.java**
[`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/CET.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/CET.java)

* __Date:__ Dec. 4, 2023
* __Ticket:__ [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
* __What changed:__ A new `getName` method is added to get a client extension's name with the full localization XML.
* __Reason:__ This change is needed to retrieve the name for all locales instead of one at a time.

**Sitemap.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/Sitemap.java`

* __Date:__ Dec. 5, 2023
* __Ticket:__ [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
* __What changed:__ The class is renamed to `SitemapManager`, and the `com.liferay.site.util` package is refactored to the `com.liferay.site.manager` package.
* __Reason:__ This change is made to make the naming more clear and consistent.

**RecentGroupManager.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java`

* __Date:__ Dec. 5, 2023
* __Ticket:__ [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
* __What changed:__ The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
* __Reason:__ This change is made to match the class name to the package name.

**GroupSearchProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/GroupSearchProvider.java`

* __Date:__ Dec. 5, 2023
* __Ticket:__ [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
* __What changed:__ The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
* __Reason:__ This change is made to match the class name to the package name.

**GroupURLProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/GroupURLProvider.java`

* __Date:__ Dec. 5, 2023
* __Ticket:__ [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
* __What changed:__ The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
* __Reason:__ This change is made to match the class name to the package name.

**SitemapURLProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/SitemapURLProvider.java`

* __Date:__ Dec. 5, 2023
* __Ticket:__ [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
* __What changed:__ The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
* __Reason:__ This change is made to match the class name to the package name.

**SitemapURLProviderHelper.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/SitemapURLProviderHelper.java`

* __Date:__ Dec. 5, 2023
* __Ticket:__ [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
* __What changed:__ The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
* __Reason:__ This change is made to match the class name to the package name.

**APIApplicationPublisher.java**
[`modules/apps/headless/headless-builder/headless-builder-api/src/main/java/com/liferay/headless/builder/application/publisher/APIApplicationPublisher.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/headless/headless-builder/headless-builder-api/src/main/java/com/liferay/headless/builder/application/publisher/APIApplicationPublisher.java)

* __Date:__ Dec. 5, 2023
* __Ticket:__ [LPS-203043](https://liferay.atlassian.net/browse/LPS-203043)
* __What changed:__ A new clusterable method is added to publish all the applications for a given company.
* __Reason:__ This change encapsulates the logic and potentially avoids intracluster calls.

**SegmentsExperimentLocalServiceImpl.java**
[`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperimentLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperimentLocalServiceImpl.java)

* __Date:__ Dec. 6, 2023
* __Ticket:__ [LRAC-15144](https://liferay.atlassian.net/browse/LRAC-15144)
* __What changed:__ The `runSegmentsExperiment` method has an added `Experiment` parameter.
* __Reason:__ The new parameter is needed for the implementation logic.

**SegmentsExperimentServiceImpl.java**
[`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperimentServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperimentServiceImpl.java)

* __Date:__ Dec. 6, 2023
* __Ticket:__ [LRAC-15144](https://liferay.atlassian.net/browse/LRAC-15144)
* __What changed:__ The `runSegmentsExperiment` method has an added `Experiment` parameter.
* __Reason:__ The new parameter is needed for the implementation logic.

**RatingsImporter.java**
[`modules/apps/commerce/commerce-initializer-util/src/main/java/com/liferay/commerce/initializer/util/RatingsImporter.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-initializer-util/src/main/java/com/liferay/commerce/initializer/util/RatingsImporter.java)

* __Date:__ Dec. 7, 2023
* __Ticket:__ [LPS-199636](https://liferay.atlassian.net/browse/LPS-199636)
* __What changed:__ The class is now removed.
* __Reason:__ The class had no usage.

[`modules/apps/cookies/cookies-impl/bnd.bnd`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/cookies/cookies-impl/bnd.bnd)

* __Date:__ Dec. 7, 2023
* __Ticket:__ [LPS-51404](https://liferay.atlassian.net/browse/LPS-51404)
* __What changed:__ The major version is increased to `6.0.0`.

**ObjectFolderLocalServiceImpl.java**
[`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFolderLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFolderLocalServiceImpl.java)

* __Date:__ Dec. 12, 2023
* __Ticket:__ [LPS-201520](https://liferay.atlassian.net/browse/LPS-201520)
* __What changed:__ The `updateObjectFolder(String, long, Map<Locale, String>, List<ObjectFolderItem>)` method has the list of object folder items removed.
* __Reason:__ Each object is able to update the object folder items they are associated with.

**ObjectFolderServiceImpl.java**
[`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFolderServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFolderServiceImpl.java)

* __Date:__ Dec. 12, 2023
* __Ticket:__ [LPS-201520](https://liferay.atlassian.net/browse/LPS-201520)
* __What changed:__ The `updateObjectFolder(String, long, Map<Locale, String>, List<ObjectFolderItem>)` method has the list of object folder items removed.
* __Reason:__ Each object is able to update the object folder items they are associated with.

[`modules/apps/commerce/commerce-initializer-util/bnd.bnd`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-initializer-util/bnd.bnd)

* __Date:__ Dec. 13, 2023
* __Ticket:__ [LPS-199636](https://liferay.atlassian.net/browse/LPS-199636)
* __What changed:__ The bundle's major version is increased to `9.0.0`.

**rest-openapi.yaml**
[`modules/apps/captcha/captcha-rest-impl/rest-openapi.yaml`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/captcha/captcha-rest-impl/rest-openapi.yaml)

* __Date:__ Dec. 13, 2023
* __Ticket:__ [LPS-185213](https://liferay.atlassian.net/browse/LPS-185213)
* __What changed:__ The API is changed to provide separate `GET` and `POST` paths.
* __Reason:__ This change simplifies the schemas.

**CategoryFacetFieldConfiguration.java**
[`modules/apps/portal-search/portal-search-api/src/main/java/com/liferay/portal/search/configuration/CategoryFacetFieldConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search/portal-search-api/src/main/java/com/liferay/portal/search/configuration/CategoryFacetFieldConfiguration.java)

* __Date:__ Dec. 17, 2023
* __Ticket:__ [LPS-203720](https://liferay.atlassian.net/browse/LPS-203720)
* __What changed:__ The class is now deleted.
* __Reason:__ The `assetVocabularyCategoryIds` field is now used as the aggregation field for the Category Facet.

**DefaultObjectEntryManagerImpl.java**
[`modules/apps/object/object-rest-impl/src/main/java/com/liferay/object/rest/internal/manager/v1_0/DefaultObjectEntryManagerImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-rest-impl/src/main/java/com/liferay/object/rest/internal/manager/v1_0/DefaultObjectEntryManagerImpl.java)

* __Date:__ Dec. 18, 2023
* __Ticket:__ [LPS-201793](https://liferay.atlassian.net/browse/LPS-201793)
* __What changed:__ The `_addOrUpdateNestedObjectEntries` method adds a new `String` parameter for a `scopeKey`.
* __Reason:__ This change allows the creation of site-scoped, nested object entries.

**CommercePaymentEntryRefundType.java**
[`modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/entry/CommercePaymentEntryRefundType.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/entry/CommercePaymentEntryRefundType.java)

* __Date:__ Dec. 19, 2023
* __Ticket:__ [COMMERCE-12943](https://liferay.atlassian.net/browse/COMMERCE-12943)
* __What changed:__ The new `getNameMap` method is added.
* __Reason:__ This method is necessary to retrieve the name map in the service layer.

**SitemapConfigurationManager.java**
[`modules/apps/site/site-api/src/main/java/com/liferay/site/configuration/manager/SitemapConfigurationManager.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/site/site-api/src/main/java/com/liferay/site/configuration/manager/SitemapConfigurationManager.java)

* __Date:__ Dec. 19, 2023
* __Ticket:__ [LPS-203214](https://liferay.atlassian.net/browse/LPS-203214)
* __What changed:__ The `includeCategories(long)`, `includePages(long)`, and `includeWebContent(long)` methods have been renamed to `includeCategoriesCompanyEnabled(long)`, `includePagesCompanyEnabled(long)`, and `includeWebContentCompanyEnabled(long)`, respectively. The new `includeCategoriesGroupEnabled(long, long)`, `includePagesGroupEnabled(long, long)`, `includeWebContentGroupEnabled(long, long)`, and `saveSitemapGroupConfiguration(long, boolean, boolean, boolean)` methods are also added.
* __Reason:__ This change is made for clarity since a site configuration is being added.

**StyleBookEntryLocalServiceImpl.java**
[`modules/apps/style-book/style-book-service/src/main/java/com/liferay/style/book/service/impl/StyleBookEntryLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/style-book/style-book-service/src/main/java/com/liferay/style/book/service/impl/StyleBookEntryLocalServiceImpl.java)

* __Date:__ Dec. 19, 2023
* __Ticket:__ [LPS-203973](https://liferay.atlassian.net/browse/LPS-203973)
* __What changed:__ The `addStyleBookEntry(long, long, String, String, String, ServiceContext)` method adds a new `boolean` parameter for `defaultStyleBookeEntry`.
* __Reason:__ This change allows a newly added style book to be made the default.

**SXPParameterContributor.java**
`modules/dxp/apps/search-experiences/search-experiences-service/src/main/java/com/liferay/search/experiences/internal/blueprint/parameter/contributor/SXPParameterContributor.java`

* __Date:__ Dec. 20, 2023
* __Ticket:__ [LPS-201309](https://liferay.atlassian.net/browse/LPS-201309)
* __What changed:__ The `SXPParameterContributor` interface is moved to the `search-experiences-api` module.
* __Reason:__ This change is needed for other modules to be able to access the interface.

**AssetDisplayPageEntryFormProcessor.java**
[`modules/apps/asset/asset-display-page-api/src/main/java/com/liferay/asset/display/page/portlet/AssetDisplayPageEntryFormProcessor.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/asset/asset-display-page-api/src/main/java/com/liferay/asset/display/page/portlet/AssetDisplayPageEntryFormProcessor.java)

* __Date:__ Dec. 20, 2023
* __Ticket:__ [LPS-202905](https://liferay.atlassian.net/browse/LPS-202905)
* __What changed:__ The new `process(long, long, String, long, int, String, long, ServiceContext)` and `process(String, long, ServiceContext)` methods are added.
* __Reason:__ The new method implementations make the class easier to use for services because they don't require a `PortletRequest` argument.

**ObjectDefinitionTestUtil.java**
[`modules/apps/object/object-rest-test-util/src/main/java/com/liferay/object/rest/test/util/ObjectDefinitionTestUtil.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-rest-test-util/src/main/java/com/liferay/object/rest/test/util/ObjectDefinitionTestUtil.java)

* __Date:__ Dec. 27, 2023
* __Ticket:__ [LPS-204463](https://liferay.atlassian.net/browse/LPS-204463)
* __What changed:__ The `publishObjectDefinition(List<ObjectField>, String, long)` method is removed, and a new `publishObjectDefinition(String, List<ObjectField>, String)` is added.
* __Reason:__ The name needs to be specified when publishing an object definition.

**CommercePaymentEntryConstants.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/constants/CommercePaymentEntryConstants.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/constants/CommercePaymentEntryConstants.java)

* __Date:__ Dec. 28, 2023
* __Ticket:__ [COMMERCE-12755](https://liferay.atlassian.net/browse/COMMERCE-12755)
* __What changed:__ The `REFUND` constant field is renamed to `REFUNDED`.
* __Reason:__ The constant was renamed for consistency.

**FragmentWebKeys.java**
[`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/constants/FragmentWebKeys.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/constants/FragmentWebKeys.java)

* __Date:__ Dec. 30, 2023
* __Ticket:__ [LPS-204724](https://liferay.atlassian.net/browse/LPS-204724)
* __What changed:__ The `FRAGMENT_ENTRY_LINK` constant field is removed.
* __Reason:__ This constant is no longer used.

**FragmentPortletRenderer.java**
[`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/renderer/FragmentPortletRenderer.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/renderer/FragmentPortletRenderer.java)
        
* __Date:__ Dec. 30, 2023
* __Ticket:__ [LPS-204724](https://liferay.atlassian.net/browse/LPS-204724)
* __What changed:__ The `renderPortlet` method now has a `FragmentEntryLink` parameter.
* __Reason:__ The `FragmentEntryLink` is removed from the request.

**SegmentsEntryLocalServiceUtil.java**
[`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/service/SegmentsEntryLocalServiceUtil.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-api/src/main/java/com/liferay/segments/service/SegmentsEntryLocalServiceUtil.java)

* __Date:__ Jan. 4, 2024
* __Ticket:__ [LPS-205013](https://liferay.atlassian.net/browse/LPS-205013)
* __What changed:__ The `getSegmentsEntriesCount(long, boolean)`, `getSegmentsEntries(long, boolean, int, int, OrderByComparator)`, and `getSegmentsEntries(long, boolean, String, String, int, int, OrderByComparator)` methods each have the `boolean` parameter removed. The `searchSegmentsEntries(long, String, LinkedHashMap, int, int, Sort)` and `getSegmentsEntries(long, boolean, String, int, int, OrderByComparator)` methods are also removed.
* __Reason:__ The API is updated to simplify the implementation logic.

**SegmentsEntryServiceUtil.java**
[`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/service/SegmentsEntryServiceUtil.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-api/src/main/java/com/liferay/segments/service/SegmentsEntryServiceUtil.java)

* __Date:__ Jan. 4, 2024
* __Ticket:__ [LPS-205013](https://liferay.atlassian.net/browse/LPS-205013)
* __What changed:__ The `getSegmentsEntries(long, boolean)`, `getSegmentsEntries(long, boolean, int, int, OrderByComparator)`, and `getSegmentsEntriesCount(long, boolean)` methods each have the `boolean` parameter removed. The `getSegmentsEntries(long, int, int, OrderByComparator)` and `getSegmentsEntriesCount(long)` methods are also removed.
* __Reason:__ The API is updated to simplify the implementation logic.

**JournalServiceConfiguration.java**
[`modules/apps/journal/journal-api/src/main/java/com/liferay/journal/configuration/JournalServiceConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/journal/journal-api/src/main/java/com/liferay/journal/configuration/JournalServiceConfiguration.java)

* __Date:__ Jan. 4, 2024
* __Ticket:__ [LPS-204945](https://liferay.atlassian.net/browse/LPS-204945)
* __What changed:__ The `journalArticleStorageType` and `databaseContentKeywordSearchEnabled` methods are removed.
* __Reason:__ These methods have no usage and are not considered in other areas of the code.

**AntivirusAsyncStatisticsManager.java**
[`modules/dxp/apps/antivirus/antivirus-async-store/src/main/java/com/liferay/antivirus/async/store/jmx/AntivirusAsyncStatisticsManager.java`](https://github.com/liferay/liferay-portal/blob/master/modules/dxp/apps/antivirus/antivirus-async-store/src/main/java/com/liferay/antivirus/async/store/jmx/AntivirusAsyncStatisticsManager.java)

* __Date:__ Jan. 5, 2024
* __Ticket:__ [LPS-202191](https://liferay.atlassian.net/browse/LPS-202191)
* __What changed:__ The class no longer implements the `AntivirusStatisticsUpdaterAsyncEventListener` interface, so it no longer implements the `receive(Message)` method.
* __Reason:__ The class was refactored to avoid publishing multiple services.

**LayoutDisplayPageWebKeys.java**
[`modules/apps/layout/layout-display-page-api/src/main/java/com/liferay/layout/display/page/constants/LayoutDisplayPageWebKeys.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/layout/layout-display-page-api/src/main/java/com/liferay/layout/display/page/constants/LayoutDisplayPageWebKeys.java)

* __Date:__ Jan. 6, 2024
* __Ticket:__ [LPS-204842](https://liferay.atlassian.net/browse/LPS-204842)
* __What changed:__ The `DEFAULT_LAYOUT_DISPLAY` constant field is removed.
* __Reason:__ The only usage of this constant was removed.

**Field.java**
[`modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/batch/engine/Field.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/batch/engine/Field.java)

* __Date:__ Jan. 7, 2024
* __Ticket:__ [LPS-204467](https://liferay.atlassian.net/browse/LPS-204467)
* __What changed:__ The `unsupportedFormats` JSON property is added.
* __Reason:__ This change allows for checking if the batch engine supports a field.

**ContentTransformerHandler.java**
[`modules/apps/adaptive-media/adaptive-media-content-transformer-api/src/main/java/com/liferay/adaptive/media/content/transformer/ContentTransformerHandler.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/adaptive-media/adaptive-media-content-transformer-api/src/main/java/com/liferay/adaptive/media/content/transformer/ContentTransformerHandler.java)

* __Date:__ Jan. 10, 2024
* __Ticket:__ [LPS-203653](https://liferay.atlassian.net/browse/LPS-203653)
* __What changed:__ The `transform(ContentTransformerContentType, T)` method is removed, and replaced with the `transform(String)` method.
* __Reason:__ The content types were not used, and the logic supporting it was causing issues.

**ContentTransformer.java**
[`modules/apps/adaptive-media/adaptive-media-content-transformer-api/src/main/java/com/liferay/adaptive/media/content/transformer/ContentTransformer.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/adaptive-media/adaptive-media-content-transformer-api/src/main/java/com/liferay/adaptive/media/content/transformer/ContentTransformer.java)

* __Date:__ Jan. 10, 2024
* __Ticket:__ [LPS-203653](https://liferay.atlassian.net/browse/LPS-203653)
* __What changed:__ The generic type is removed from the class, and the `getContentTransformerContentType` and `transform(T)` methods are removed. Instead, a `transform(String)` method is added.
* __Reason:__ The content types were not used, and the logic supporting it was causing issues.

**SegmentsCriteriaContributorRegistry.java**
[`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/criteria/contributor/SegmentsCriteriaContributorRegistry.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-api/src/main/java/com/liferay/segments/criteria/contributor/SegmentsCriteriaContributorRegistry.java)

* __Date:__ Jan. 11, 2024
* __Ticket:__ [LPS-205239](https://liferay.atlassian.net/browse/LPS-205239)
* __What changed:__ The `String` parameter is removed from the `getSegmentsCriteriaContributors(String)` method. The `getSegmentsCriteriaContributors(String, Criteria.Type)` method is removed.
* __Reason:__ This is an internal registry, and this change simplifies the API. The removed method implementation had no usage.

**SegmentsEntryProviderRegistry.java**
[`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/provider/SegmentsEntryProviderRegistry.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-api/src/main/java/com/liferay/segments/provider/SegmentsEntryProviderRegistry.java)

* __Date:__ Jan. 11, 2024
* __Ticket:__ [LPS-205239](https://liferay.atlassian.net/browse/LPS-205239)
* __What changed:__ The `getSegmentsEntryIds(long, String, long, Context)` method is removed. Instead, add the `segmentEntryIds` array parameter to use the `getSegmentsEntryId(long, String, long, Context, long[])` implementation.
* __Reason:__ The removed method implementation was deprecated.

**SegmentsEntryRetriever.java**
[`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/SegmentsEntryRetriever.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-api/src/main/java/com/liferay/segments/SegmentsEntryRetriever.java)

* __Date:__ Jan. 11, 2024
* __Ticket:__ [LPS-205239](https://liferay.atlassian.net/browse/LPS-205239)
* __What changed:__ The `getSegmentsEntryIds(long, long, Context)` method is removed. Instead, add the `segmentEntryIds` array parameter to use the `getSegmentEntryIds(long, long, Context, long[])` implementation.
* __Reason:__ The removed method implementation was deprecated.

**CommerceMediaResolver.java**
[`modules/apps/commerce/commerce-media-api/src/main/java/com/liferay/commerce/media/CommerceMediaResolver.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-media-api/src/main/java/com/liferay/commerce/media/CommerceMediaResolver.java)

* __Date:__ Jan. 13, 2024
* __Ticket:__ [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
* __What changed:__ The `getDownloadVirtualOrderItemURL` method now has an extra `long` parameter, for `fileEntryId`.
* __Reason:__ The method must support specifying a file entry to download because you can now download more than one file at a time with an `OrderItem`.

**service.xml**
[`modules/apps/commerce/commerce-product-type-virtual-service/service.xml`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-type-virtual-service/service.xml)

* __Date:__ Jan. 13, 2024
* __Ticket:__ [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
* __What changed:__ The `fileEntryId` and `URL` columns are removed, and a one-to-many relationship is added with the `CPDVirtualSettingFileEntry` entity.
* __Reason:__ `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**service.xml**
[`modules/apps/commerce/commerce-product-type-virtual-order-service/service.xml`](
modules/apps/commerce/commerce-product-type-virtual-order-service/service.xml)

* __Date:__ Jan. 13, 2024
* __Ticket:__ [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
* __What changed:__ The `fileEntryId` and `URL` columns are removed, and a one-to-many relationship is added with the `CommerceVirtualOrderItemFileEntry` entity.
* __Reason:__ `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**CPDefinitionVirtualSettingLocalServiceImpl.java**
[`modules/apps/commerce/commerce-product-type-virtual-service/src/main/java/com/liferay/commerce/product/type/virtual/service/impl/CPDefinitionVirtualSettingLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-type-virtual-service/src/main/java/com/liferay/commerce/product/type/virtual/service/impl/CPDefinitionVirtualSettingLocalServiceImpl.java)

* __Date:__ Jan. 13, 2024
* __Ticket:__ [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
* __What changed:__ Some `add` method implementations are removed, and various other method signatures are changed to remove `fileEntryId` and `url` parameters.
* __Reason:__ `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries. The removed `add` implementations were redundant.

**CommerceVirtualOrderItemLocalServiceImpl.java**
[`modules/apps/commerce/commerce-product-type-virtual-order-service/src/main/java/com/liferay/commerce/product/type/virtual/order/service/impl/CommerceVirtualOrderItemLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-type-virtual-order-service/src/main/java/com/liferay/commerce/product/type/virtual/order/service/impl/CommerceVirtualOrderItemLocalServiceImpl.java)

* __Date:__ Jan. 13, 2024
* __Ticket:__ [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
* __What changed:__ Various method signatures are changed to remove `fileEntryId` and `url` parameters.
* __Reason:__ `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**CommerceVirtualOrderItemServiceImpl.java**
[`modules/apps/commerce/commerce-product-type-virtual-order-service/src/main/java/com/liferay/commerce/product/type/virtual/order/service/impl/CommerceVirtualOrderItemServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-type-virtual-order-service/src/main/java/com/liferay/commerce/product/type/virtual/order/service/impl/CommerceVirtualOrderItemServiceImpl.java)

* __Date:__ Jan. 13, 2024
* __Ticket:__ [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
* __What changed:__ Various method signatures are changed to remove `fileEntryId` and `url` parameters.
* __Reason:__ `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**CTClosureFactory.java**
[`modules/apps/change-tracking/change-tracking-api/src/main/java/com/liferay/change/tracking/closure/CTClosureFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/change-tracking/change-tracking-api/src/main/java/com/liferay/change/tracking/closure/CTClosureFactory.java)

* __Date:__ Jan. 16, 2024
* __Ticket:__ [LPS-203903](https://liferay.atlassian.net/browse/LPS-203903)
* __What changed:__ A new `clearCache(long ctCollectionId)` method is added`.
* __Reason:__ The new method implementation allows for caching `CTClosure` objects.

**Levels.java**
`modules/apps/portal/portal-log4j/src/main/java/com/liferay/portal/log4j/Levels.java`

* __Date:__ Jan. 17, 2024
* __Ticket:__ [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
* __What changed:__ The `Levels` class is removed.
* __Reason:__ The class was deprecated.

**AssetListEntryServiceImpl.java**
[`modules/apps/asset/asset-list-service/src/main/java/com/liferay/asset/list/service/impl/AssetListEntryServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/asset/asset-list-service/src/main/java/com/liferay/asset/list/service/impl/AssetListEntryServiceImpl.java)

* __Date:__ Jan. 22, 2024
* __Ticket:__ [LPS-206304](https://liferay.atlassian.net/browse/LPS-206304)
* __What changed:__ The `addDynamicAssetListEntry` and `addManualAssetListEntry` methods have removed the `long userId` parameter.
* __Reason:__ This change avoids exposing user IDs to the remote service.

**CommercePaymentMethodGroupRelLocalServiceImpl.java**
[`modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/service/impl/CommercePaymentMethodGroupRelLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/service/impl/CommercePaymentMethodGroupRelLocalServiceImpl.java)

* __Date:__ Jan. 24, 2024
* __Ticket:__ [COMMERCE-12385](https://liferay.atlassian.net/browse/COMMERCE-12385)
* __What changed:__ A new `updateCommercePaymentMethodGroupRel(CommercePaymentMethodGroupRel)` method is added.
* __Reason:__ The new method implementation is necessary to update a `CommercePaymentMethodGroupRel` object.

**ReflectionUtil.java**
[`modules/core/petra/petra-reflect/src/main/java/com/liferay/petra/reflect/ReflectionUtil.java`](https://github.com/liferay/liferay-portal/blob/master/modules/core/petra/petra-reflect/src/main/java/com/liferay/petra/reflect/ReflectionUtil.java)

* __Date:__ Jan. 25, 2024
* __Ticket:__ [LPD-15179](https://liferay.atlassian.net/browse/LPD-15179)
* __What changed:__ The `arrayClone` method is removed.
* __Reason:__ The `arrayClone` method had no usage.

**ObjectGraphUtil.java**
[`modules/core/petra/petra-reflect/src/main/java/com/liferay/petra/reflect/ObjectGraphUtil.java`](https://github.com/liferay/liferay-portal/blob/master/modules/core/petra/petra-reflect/src/main/java/com/liferay/petra/reflect/ObjectGraphUtil.java)

* __Date:__ Jan. 25, 2024
* __Ticket:__ [LPD-15179](https://liferay.atlassian.net/browse/LPD-15179)
* __What changed:__ The `ObjectGraphUtil` class is removed.
* __Reason:__ The class had no usage.

**SegmentsEntryServiceImpl.java**
[`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsEntryServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsEntryServiceImpl.java)

* __Date:__ Jan. 30, 2024
* __Ticket:__ [LPS-206170](https://liferay.atlassian.net/browse/LPS-206170)
* __What changed:__ Both `addSegmentsEntry` implementations have the `type` parameter removed. Update your implementation to remove the type from the method call.
* __Reason:__ The `type` parameter always has the same value, so this change simplifies the API.

**SegmentsEntryLocalServiceImpl.java**
[`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsEntryLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsEntryLocalServiceImpl.java)

* __Date:__ Jan. 30, 2024
* __Ticket:__ [LPS-206170](https://liferay.atlassian.net/browse/LPS-206170)
* __What changed:__ Both `addSegmentsEntry` implementations have the `type` parameter removed. Update your implementation to remove the type from the method call.
* __Reason:__ The `type` parameter always has the same value, so this change simplifies the API.

**CountriesCommerceHealthStatus.java**
`modules/apps/commerce/commerce-health-status-web/src/main/java/com/liferay/commerce/health/status/web/internal/CountriesCommerceHealthStatus.java`

* __Date:__ Jan. 30, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CountriesCommerceHealthStatus` class is removed.
* __Reason:__ The countries health check implementation did not provide value.

**FragmentEntryLocalServiceUtil.java**
[`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryLocalServiceUtil.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryLocalServiceUtil.java)

* __Date:__ Feb. 6, 2024
* __Ticket:__ [LPD-16310](https://liferay.atlassian.net/browse/LPD-16310)
* __What changed:__ The `addFragmentEntry(long, long, long, String, String, String, String, String, boolean, String, String, long, int, String, int, ServiceContext)` and `updateEntry(long, long, long, String, String, String, String, boolean, String, String, long, String, int)` methods are removed.
* __Reason:__ The methods are replaced with new `addFragmentEntry` and `updateFragmentEntry` methods, with updated parameters to improve fragment version logic.

**FragmentEntryServiceUtil.java**
[`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryServiceUtil.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryServiceUtil.java)
        
* __Date:__ Feb. 6, 2024
* __Ticket:__ [LPD-16310](https://liferay.atlassian.net/browse/LPD-16310)
* __What changed:__ The `addFragmentEntry(long, long, long, String, String, String, String, String, boolean, String, String, long, int, String, int, ServiceContext)` and `updateEntry(long, long, long, String, String, String, String, boolean, String, String, long, String, int)` methods are removed.
* __Reason:__ The methods are replaced with new `addFragmentEntry` and `updateFragmentEntry` methods, with updated parameters to improve fragment version logic.

**GroupSearchProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/provider/GroupSearchProvider.java`

* __Date:__ Feb. 6, 2024
* __Ticket:__ [LPD-16643](https://liferay.atlassian.net/browse/LPD-16643)
* __What changed:__ `GroupSearchProvider` is now a static class, and the `getGroupSearch(PortletRequest, PortletURL)` method is removed.
* __Reason:__ The `GroupSearchProvider` is an internal API class, and the change better aligns with its use case.

**SiteWebKeys.java**
[`modules/apps/site/site-api/src/main/java/com/liferay/site/constants/SiteWebKeys.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/site/site-api/src/main/java/com/liferay/site/constants/SiteWebKeys.java)

* __Date:__ Feb. 6, 2024
* __Ticket:__ [LPD-16643](https://liferay.atlassian.net/browse/LPD-16643)
* __What changed:__ The `GROUP_SEARCH_PROVIDER` is removed.
* __Reason:__ The `GROUP_SEARCH_PROVIDER` was meant for internal use and no longer has any usage.

**ObjectFieldLocalServiceImpl.java**
[`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFieldLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFieldLocalServiceImpl.java)

* __Date:__ Feb. 6, 2024
* __Ticket:__ [LPD-15616](https://liferay.atlassian.net/browse/LPD-15616)
* __What changed:__ The `validateRequired` method's parameters are reordered with a new `boolean` parameter.
* __Reason:__ This change is necessary for object definition validation.

**BatchEngineTaskItemDelegateRegistry.java**
[`modules/apps/batch-engine/batch-engine-api/src/main/java/com/liferay/batch/engine/BatchEngineTaskItemDelegateRegistry.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/batch-engine/batch-engine-api/src/main/java/com/liferay/batch/engine/BatchEngineTaskItemDelegateRegistry.java)

* __Date:__ Feb. 8, 2024
* __Ticket:__ [LPD-15236](https://liferay.atlassian.net/browse/LPD-15236)
* __What changed:__ The `getBatchEngineTaskItemDelegate` method has a new `long` parameter for a company ID.
* __Reason:__ The `BatchEngineTaskItemDelegate` needs a way to be retrieved by company ID.

**CommercePortletKeys.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/constants/CommercePortletKeys.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommercePortletKeys` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryPanelApp.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/application/list/CommerceCountryPanelApp.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryPanelApp` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryScreenNavigationConstants.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/constants/CommerceCountryScreenNavigationConstants.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryScreenNavigationConstants` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**BaseCommerceCountriesDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/BaseCommerceCountriesDisplayContext.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `BaseCommerceCountriesDisplayContext` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountriesDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceCountriesDisplayContext.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountriesDisplayContext` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountriesManagementToolbarDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceCountriesManagementToolbarDisplayContext.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountriesManagementToolbarDisplayContext` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceRegionsDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceRegionsDisplayContext.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceRegionsDisplayContext` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceRegionsManagementToolbarDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceRegionsManagementToolbarDisplayContext.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceRegionsManagementToolbarDisplayContext` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryRequestHelper.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/helper/CommerceCountryRequestHelper.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryRequestHelper` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryChannelsScreenNavigationCategory.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryChannelsScreenNavigationCategory.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryChannelsScreenNavigationCategory` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryChannelsScreenNavigationEntry.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryChannelsScreenNavigationEntry.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryChannelsScreenNavigationEntry` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryDetailsScreenNavigationCategory.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryDetailsScreenNavigationCategory.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryDetailsScreenNavigationCategory` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryDetailsScreenNavigationEntry.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryDetailsScreenNavigationEntry.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryDetailsScreenNavigationEntry` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryRegionsScreenNavigationCategory.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryRegionsScreenNavigationCategory.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryRegionsScreenNavigationCategory` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryRegionsScreenNavigationEntry.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryRegionsScreenNavigationEntry.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryRegionsScreenNavigationEntry` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountryPortlet.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/CommerceCountryPortlet.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountryPortlet` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**EditCommerceCountryMVCActionCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceCountryMVCActionCommand.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `EditCommerceCountryMVCActionCommand` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**EditCommerceCountryMVCRenderCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceCountryMVCRenderCommand.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `EditCommerceCountryMVCRenderCommand` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**EditCommerceRegionMVCActionCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceRegionMVCActionCommand.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `EditCommerceRegionMVCActionCommand` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**EditCommerceRegionMVCRenderCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceRegionMVCRenderCommand.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `EditCommerceRegionMVCRenderCommand` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**ImportCommerceRegionsMVCActionCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/ImportCommerceRegionsMVCActionCommand.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `ImportCommerceRegionsMVCActionCommand` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**ActionHelper.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/helper/ActionHelper.java`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `ActionHelper` class is removed.
* __Reason:__ The Commerce Country portlet is removed.

**channels.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country/channels.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `channels.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**commerce_regions.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country/commerce_regions.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `commerce_regions.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**details.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country/details.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `details.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**commerce_country_action.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country_action.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `commerce_country_action.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**commerce_region_action.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_region_action.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `commerce_region_action.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/css/main.scss`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `commerce-address-web` module's `main.scss` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**edit_commerce_country.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/edit_commerce_country.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `edit_commerce_country.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**edit_commerce_region.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/edit_commerce_region.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `edit_commerce_region.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceCountriesManagementToolbarPropsTransformer.js**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/js/CommerceCountriesManagementToolbarPropsTransformer.js`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceCountriesManagementToolbarPropsTransformer.js` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**CommerceRegionsManagementToolbarPropsTransformer.js**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/js/CommerceRegionsManagementToolbarPropsTransformer.js`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `CommerceRegionsManagementToolbarPropsTransformer.js` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/view.jsp`

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
* __What changed:__ The `commerce-address-web` module's `view.jsp` file is removed.
* __Reason:__ The Commerce Country portlet is removed.

**PersonalMenuEntry.java**
[`modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/PersonalMenuEntry.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/PersonalMenuEntry.java)

* __Date:__ Mar. 18, 2024
* __Ticket:__ [LPS-194004](https://liferay.atlassian.net/browse/LPS-194004)
* __What changed:__ The `getJSOnClickConfigJSONObject` method behavior now requires providing a JavaScript function for `getOnClickJSModuleURL`, which is called with the value from `getJSOnClickConfigJSONObject` as its parameter.
* __Reason:__ This change makes `getJSOnClickConfigJSONObject` more broadly usable for any type of on-click interaction, not just for opening a selection modal.

### Changes in `portal-impl` classes

**PortletContextFactoryImpl.java**
`portal-impl/src/com/liferay/portlet/internal/PortletContextFactoryImpl.java`

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-200088](https://liferay.atlassian.net/browse/LPS-200088)
* __What changed:__ The class is removed. Instead, use `PortletContextFactoryUtil` directly.
* __Reason:__ The code is being consolidated to simplify code structure.

**portal.properties**
[`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties)

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
* __What changed:__ The `dl.file.entry.processors` portal property is removed. Instead, add your own `DLProcessor` implementation as an OSGi service.
* __Reason:__ This portal property is no longer required because all out-of-the-box implementations of `DLProcessor` are now OSGi services.

**DLPreviewableProcessor.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/DLPreviewableProcessor.java`

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
* __What changed:__ The `DLPreviewableProcessor` class is moved from `portal-impl` to the `document-library-preview-api` module. Add `document-library-preview-api` as a build dependency to continue using this class.
* __Reason:__ `DLPreviewableProcessor`'s subclasses are now all in the module, so they can be converted into OSGi components.

**AudioProcessorImpl.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/AudioProcessorImpl.java`

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
* __What changed:__ The `AudioProcessorImpl` class is moved from `portal-impl` to the `document-library-preview-audio` module. Instead, reference the `DLProcessor` class with the target `"(type=" + DLProcessorConstants.AUDIO_PROCESSOR + ")"`.
* __Reason:__ This change allows `AudioProcessorImpl` to become an OSGi component.

**VideoProcessorImpl.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/VideoProcessorImpl.java`

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
* __What changed:__ The `VideoProcessorImpl` class is moved from `portal-impl` to the `document-library-preview-video` module. Instead, reference the `DLProcessor` class with the target `"(type=" + DLProcessorConstants.VIDEO_PROCESSOR + ")"`.
* __Reason:__ This change allows `AudioProcessorImpl` to become an OSGi component.

**DLFileEntryLocalServiceImpl.java**
[`portal-impl/src/com/liferay/portlet/documentlibrary/service/impl/DLFileEntryLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portlet/documentlibrary/service/impl/DLFileEntryLocalServiceImpl.java)

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
* __What changed:__ The new `forEachFileEntry(long, Consumer<DLFileEntry>, long, String[])` and `forEachFileEntry(long, long, Consumer<DLFileEntry>, long, String[])` methods are added.
* __Reason:__ These methods allow for executing arbitrary code on a long list of file entries without retrieving the entire list first.

**AssetTagFinderImpl.java**
[`portal-impl/src/com/liferay/portlet/asset/service/persistence/impl/AssetTagFinderImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portlet/asset/service/persistence/impl/AssetTagFinderImpl.java)

* __Date:__ Nov. 20, 2023
* __Ticket:__ [LPS-201547](https://liferay.atlassian.net/browse/LPS-201547)
* __What changed:__ The `countByG_N(long, String)` method is removed. Instead, use the `countByG_C_N(long, long, String)` method, passing `0` as the second argument (`classNameId`).
* __Reason:__ The `countByG_N(long, String)` method was redundant.

**AssetTagLocalServiceImpl.java** --> getTagsSize(long groupId, String name) `portal-impl/src/com/liferay/portlet/asset/service/impl/AssetTagLocalServiceImpl.java --> getTagsSize(long groupId, String name)`

* __Date:__ Nov. 20, 2023
* __Ticket:__ [LPS-201547](https://liferay.atlassian.net/browse/LPS-201547)
* __What changed:__ The `getTagsSize(long, String)` method is removed. Instead, use the `getTagsSize(long, long, String)` method, passing `0` as the second argument (`classNameId`).
* __Reason:__ The `getTagsSize(long, String)` method was redundant.

**AssetTagServiceImpl.java**
[`portal-impl/src/com/liferay/portlet/asset/service/impl/AssetTagServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portlet/asset/service/impl/AssetTagServiceImpl.java)

* __Date:__ Nov. 20, 2023
* __Ticket:__ [LPS-201547](https://liferay.atlassian.net/browse/LPS-201547)
* __What changed:__ The `getVisibleAssetsTagsCount(long, String)` method is removed. Instead, use the `getVisibleAssetsTagsCount(long, long, String)` method, passing `0` as the second argument (`classNameId`).
* __Reason:__ The `getVisibleAssetsTagsCount(long, String)` method was redundant.

**SiteMembershipPolicyFactoryUtil.java**
`portal-impl/src/com/liferay/portal/security/membershippolicy/SiteMembershipPolicyFactoryUtil.java`

* __Date:__ Nov. 23, 2023
* __Ticket:__ [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
* __What changed:__ The class is removed. Instead, use the static methods in `SiteMembershipPolicyUtil`.
* __Reason:__ The logic from this class is consolidated into `SiteMembershipPolicyUtil` to simplify the code structure.

**SiteMembershipPolicyFactoryImpl.java**
`portal-impl/src/com/liferay/portal/security/membershippolicy/SiteMembershipPolicyFactoryImpl.java`

* __Date:__ Nov. 23, 2023
* __Ticket:__ [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
* __What changed:__ The class is removed. Instead, use `SiteMembershipPolicyUtil` directly.
* __Reason:__ The logic from this class is consolidated into `SiteMembershipPolicyUtil` to simplify the code structure.

**UserLocalServiceImpl.java**
[`portal-impl/src/com/liferay/portal/service/impl/UserLocalServiceImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/service/impl/UserLocalServiceImpl.java)

* __Date:__ Nov. 24, 2023
* __Ticket:__ [LPS-201007](https://liferay.atlassian.net/browse/LPS-201007)
* __What changed:__ The `searchBySocial` method has a new `long[]` parameter for group IDs.
* __Reason:__ This change allows for searching for users who are added to a group via a user group.

**LayoutPrototypePermissionImpl.java**
`portal-impl/src/com/liferay/portal/service/permission/LayoutPrototypePermissionImpl.java`

* __Date:__ Nov. 24, 2023
* __Ticket:__ [LPS-201156](https://liferay.atlassian.net/browse/LPS-201156)
* __What changed:__ The class is removed. Instead, use `LayoutPrototypePermissionUtil` directly.
* __Reason:__ The `LayoutPrototypePermissionImpl` class is no longer needed Spring no longer needs to register it as an OSGi component.

**MethodFactoryRegistryImpl.java**
`portal-impl/src/com/liferay/portal/webdav/methods/MethodFactoryRegistryImpl.java`

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
* __What changed:__ The class is removed. Registering custom `MethodFactory` implementations is no longer supported.
* __Reason:__ No `MethodFactory` implementation is needed other than `MethodFactoryImpl`.

**BaseWebDAVStorageImpl.java**
`portal-impl/src/com/liferay/portal/webdav/BaseWebDAVStorageImpl.java`

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
* __What changed:__ The`BaseWebDAVStorageImpl` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to keep using the same class.
* __Reason:__ The `BaseWebDAVStorageImpl` class is moved into `portal-impl` to simplify the code structure.

**DLImpl.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/DLImpl.java`

* __Date:__ Dec. 6, 2023
* __Ticket:__ [LPS-202905](https://liferay.atlassian.net/browse/LPS-202905)
* __What changed:__ The `DLImpl` class is moved to the `document-library-service` module.
* __Reason:__ The class is rewritten to have access to some OSGi components in the `document-library-service` module to improve performance.

**JSONWebServiceHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/JSONWebServiceHotDeployListener.java`

* __Date:__ Dec. 13, 2023
* __Ticket:__ [LPS-203854](https://liferay.atlassian.net/browse/LPS-203854)
* __What changed:__ The class is removed.
* __Reason:__ Spring bean JSON web service registration is now centralized in `JSONWebServiceTracker`, so this class is no longer needed to respond to hot deploy events.

**messaging-misc-spring.xml**
`portal-impl/src/META-INF/messaging-misc-spring.xml`

* __Date:__ Dec. 15, 2023
* __Ticket:__ [LPS-203461](https://liferay.atlassian.net/browse/LPS-203461)
* __What changed:__ The `messaging-misc-spring.xml` file is removed.
* __Reason:__ The `messaging-misc-spring.xml` file is no longer used.

**system.properties**
[`portal-impl/src/system.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/system.properties)

* __Date:__ Jan. 8, 2024
* __Ticket:__ [LPS-204548](https://liferay.atlassian.net/browse/LPS-204548)
* __What changed:__ The `com.liferay.portal.kernel.util.ServiceProxyFactory.timeout` system property is removed.
Property com.liferay.portal.kernel.util.ServiceProxyFactory.timeout is being removed.
* __Reason:__ This property is only used for the `ServiceProxyFactory` class, which is being removed.

**ServiceBag.java**
[`portal-impl/src/com/liferay/portal/deploy/hot/ServiceBag.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/deploy/hot/ServiceBag.java)

* __Date:__ Jan. 10, 2024
* __Ticket:__ [LPS-204273](https://liferay.atlassian.net/browse/LPS-204273)
* __What changed:__ The `ServiceBag` constructor has removed the `ClassLoader` parameter and added `BundleContext` and `ServiceReference` parameters. The `replace` method also no longer throws `Exception`.
* __Reason:__ This change fixes issues with creating this class.

### Changes in `portal-kernel` classes

**IndexableActionableDynamicQuery.java**
[`portal-kernel/src/com/liferay/portal/kernel/dao/orm/IndexableActionableDynamicQuery.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/dao/orm/IndexableActionableDynamicQuery.java)

* __Date:__ Nov. 6, 2023
* __Ticket:__ [LPS-199958](https://liferay.atlassian.net/browse/LPS-199958)
* __What changed:__ The `setIndexWriterHelper` method is removed.
* __Reason:__ This method was only used for the `UserIndexer` class, which has been removed.

**PortletContextFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/portlet/PortletContextFactory.java`

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-200088](https://liferay.atlassian.net/browse/LPS-200088)
* __What changed:__ The interface is removed. Instead, add `portal-impl` as a build dependency and use `PortletContextFactoryUtil` directly.
* __Reason:__ The code is being consolidated and moved into `portal-impl` to simplify code structure.

**PortletContextFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/portlet/PortletContextFactoryUtil.java`

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
* __What changed:__ The `PortletContextFactoryUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
* __Reason:__ This class is moved into `portal-impl` to simplify the code structure.

**AuditMessageFactory.java**
[`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java)

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
* __What changed:__ The `AuditMessageFactory` interface is now an implemented class. The logic previously in `AuditMessageFactoryImpl` and `AuditMessageFactoryUtil` is now implemented in this class.
* __Reason:__ Having these classes separated did not provide any value, so they were consolidated into `AuditMessageFactory` to simplify the code.

**AuditMessageFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.java`

* __Date:__ Nov. 7, 2023
* __Ticket:__ [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
* __What changed:__ The class is removed. The logic from this class is moved into `AuditMessageFactory`.
* __Reason:__ Having these classes separated did not provide any value, so they were merged into a single class to simplify the code.

**AssetEntriesFacet.java**
`portal-kernel/src/com/liferay/portal/kernel/search/facet/AssetEntriesFacet.java`

* __Date:__ Nov. 15, 2023
* __Ticket:__ [LPS-200073](https://liferay.atlassian.net/browse/LPS-200073)
* __What changed:__ The class is removed.
* __Reason:__ The class was deprecated and its usages have been replaced by `FacetImpl`.

**AssetTagUtil.java**
[`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagUtil.java)

* __Date:__ Nov. 21, 2023
* __Ticket:__ [LPS-202248](https://liferay.atlassian.net/browse/LPS-202248)
* __What changed:__ The `findByG_LikeN`, `findByG_N_First`, `findByG_N_Last`, `findByG_N_PrevAndNext`, `removeByG_N`, and `countByG_N` methods are removed.
* __Reason:__ These methods no longer have any usage.

**AssetTagPersistence.java**
[`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagPersistence.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagPersistence.java)

* __Date:__ Nov. 21, 2023
* __Ticket:__ [LPS-202248](https://liferay.atlassian.net/browse/LPS-202248)
* __What changed:__ The `findByG_LikeN`, `findByG_N_First`, `findByG_N_Last`, `findByG_N_PrevAndNext`, `removeByG_N`, and `countByG_N` methods are removed.
* __Reason:__ These methods no longer have any usage.

**AssetTagFinder.java**
[`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagFinder.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagFinder.java`)

* __Date:__ Nov. 22, 2023
* __Ticket:__ [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
* __What changed:__ The `findByG_N_S_E` method is removed.
* __Reason:__ This method no longer has any usage.

**AssetTagFinderUtil.java**
[`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagFinderUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagFinderUtil.java)

* __Date:__ Nov. 22, 2023
* __Ticket:__ [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
* __What changed:__ The `findByG_N_S_E` method is removed.
* __Reason:__ This method no longer has any usage.

**AssetTagLocalService.java**
`portal-kernel/src/com/liferay/asset/kernel/service/AssetTagLocalService.java`

* __Date:__ Nov. 22, 2023
* __Ticket:__ [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
* __What changed:__ The `getSocialActivityCounterOffsetTags` and `getSocialActivityCounterPeriodTags` methods are removed.
* __Reason:__ These methods no longer have any usage.

**AssetTagLocalServiceUtil.java**
[`portal-kernel/src/com/liferay/asset/kernel/service/AssetTagLocalServiceUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/asset/kernel/service/AssetTagLocalServiceUtil.java)

* __Date:__ Nov. 22, 2023
* __Ticket:__ [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
* __What changed:__ The `getSocialActivityCounterOffsetTags` and `getSocialActivityCounterPeriodTags` methods are removed.
* __Reason:__ These methods no longer have any usage.

**SiteMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/SiteMembershipPolicyFactory.java`

* __Date:__ Nov. 23, 2023
* __Ticket:__ [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
* __What changed:__ The interface is removed. Instead, use `SiteMembershipPolicyFactoryUtil` directly.
* __Reason:__ This interface is no longer needed because Spring no longer needs to register its implementations as OSGi components.

**SiteMembershipPolicyFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/SiteMembershipPolicyFactoryUtil.java`

* __Date:__ Nov. 23, 2023
* __Ticket:__ [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
* __What changed:__ The `SiteMembershipPolicyFactoryUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
* __Reason:__ This class is moved into `portal-impl` to simplify the code structure.

**SiteMembershipPolicyUtil.java**
`portal-kernel/src/com/liferay/portal/security/membershippolicy/SiteMembershipPolicyUtil.java`

* __Date:__ Nov. 23, 2023
* __Ticket:__ [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
* __What changed:__ The `SiteMembershipPolicyUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
* __Reason:__ This class is moved into `portal-impl` to simplify the code structure.

**LayoutPrototypePermissionUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/service/permission/LayoutPrototypePermissionUtil.java`

* __Date:__ Nov. 24, 2023
* __Ticket:__ [LPS-201156](https://liferay.atlassian.net/browse/LPS-201156)
* __What changed:__ The `LayoutPrototypePermissionUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class. The `getLayoutPrototypePermission` is also removed. Instead, use `LayoutPrototypePermissionUtil` directly.
* __Reason:__ This class is moved into `portal-impl` to simplify the code structure.

**MethodFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/webdav/methods/MethodFactory.java`

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
* __What changed:__ The class is removed. Use `MethodFactoryUtil` instead.
* __Reason:__ This class no longer has any usage.

**WebDAVStorage.java**
[`portal-kernel/src/com/liferay/portal/kernel/webdav/WebDAVStorage.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/webdav/WebDAVStorage.java)

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
* __What changed:__ The `getMethodFactory` method is removed. Use `MethodFactoryUtil` instead.
* __Reason:__ `MethodFactory` is simplified and is now a `Util` class, so this method is no longer needed.

**MethodFactoryRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/webdav/methods/MethodFactoryRegistry.java`

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
* __What changed:__ The interface is removed. Registering custom `MethodFactory` implementations is no longer supported.
* __Reason:__ The default implementation, `MethodFactoryImpl`, was the only needed implementation, so the interface is no longer needed.

**MethodFactoryRegistryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/webdav/methods/MethodFactoryRegistryUtil.java`

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
* __What changed:__ The class is removed. Registering custom `MethodFactory` implementations is no longer supported.
* __Reason:__ The default implementation, `MethodFactoryImpl`, was the only needed implementation, so this class is no longer needed.

**PortletConfigurationIconMenu.java**
[`portal-kernel/src/com/liferay/portal/kernel/portlet/configuration/icon/PortletConfigurationIconMenu.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/portlet/configuration/icon/PortletConfigurationIconMenu.java)

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-200326](https://liferay.atlassian.net/browse/LPS-200326)
* __What changed:__ The `PortletConfigurationIconMenu` constructor is now private.
* __Reason:__ `PortletConfigurationIconMenu` is being removed from `util-spring`, so it needs a static `INSTANCE` field to replace existing usages.

**FriendlyURLNormalizerUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/util/FriendlyURLNormalizerUtil.java`

* __Date:__ Nov. 27, 2023
* __Ticket:__ [LPS-188565](https://liferay.atlassian.net/browse/LPS-188565)
* __What changed:__ The `setFriendlyURLNormalizer(FriendlyURLNormalizer)` method is removed.
* __Reason:__ The class uses OSGi to retrieve the service, so this method is no longer needed.
            
* __Alternatives:__ 
Register FriendlyURLNormalizer OSGi service.

**UserGroupMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/UserGroupMembershipPolicyFactory.java`

* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-200563](https://liferay.atlassian.net/browse/LPS-200563)
* __What changed:__ The interface is removed. Instead, use `UserGroupMembershipPolicyFactoryUtil` directly.
* __Reason:__ This interface is no longer needed because Spring no longer needs to register its implementations as OSGi components.

**UserGroupMembershipPolicyFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/UserGroupMembershipPolicyFactoryUtil.java`

* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-200563](https://liferay.atlassian.net/browse/LPS-200563)
* __What changed:__ The `UserGroupMembershipPolicyFactoryUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class. The `getUserGroupMembershipPolicyFactory` method is also removed. Directly use `UserGroupMembershipPolicyUtil` instead.
* __Reason:__ The class is moved into `portal-impl` to simplify the code structure. The `getUserGroupMembershipPolicyFactory` method is no longer needed.

**UserGroupMembershipPolicyUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/UserGroupMembershipPolicyUtil.java`

* __Date:__ Nov. 28, 2023
* __Ticket:__ [LPS-200563](https://liferay.atlassian.net/browse/LPS-200563)
* __What changed:__ The class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
* __Reason:__ The class is moved into `portal-impl` to simplify the code structure.

**AudioProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/AudioProcessor.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `AudioProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**AudioProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/AudioProcessorUtil.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `AudioProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**DLProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessor.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `DLProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package. The `afterPropertiesSet` and `destroy` methods are also removed. Instead, use the OSGi service lifecycle `activate` and `deactivate` methods.
* __Reason:__ The refactoring change matches the package name to the class name. The `afterPropertiesSet` and `destroy` methods are removed because `DLProcessor` implementations are no longer Spring beans.

**DLProcessorRegistry.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistry.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `DLProcessorRegistry` class is renamed to `DLProcessorHelper`, and it's moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This class no longer registers or unregisters `DLProcessor` objects, and the refactoring change matches the package name to the class name.

**DLProcessorRegistryUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistryUtil.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `DLProcessorRegistryUtil` class is renamed to `DLProcessorHelperUtil`, and it's moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ The class name change clarifies the class's usage, and the refactoring change matches the package name to the class name.

**DLProcessorThreadLocal.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorThreadLocal.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `DLProcessorThreadLocal` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**ImageProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/ImageProcessor.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `ImageProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**ImageProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/ImageProcessorUtil.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `ImageProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**PDFProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/PDFProcessor.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `PDFProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**PDFProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/PDFProcessorUtil.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `PDFProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**RawMetadataProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/RawMetadataProcessor.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `RawMetadataProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**RawMetadataProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/RawMetadataProcessorUtil.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `RawMetadataProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**VideoProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/VideoProcessor.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `VideoProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**VideoProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/VideoProcessorUtil.java`

* __Date:__ Dec. 1, 2023
* __Ticket:__ [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
* __What changed:__ The `VideoProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
* __Reason:__ This change matches the package name to the class name.

**ModelResourcePermissionFactory.java**
[`portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/ModelResourcePermissionFactory.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/ModelResourcePermissionFactory.java)

* __Date:__ Dec. 12, 2023
* __Ticket:__ [LPS-193174](https://liferay.atlassian.net/browse/LPS-193174)
* __What changed:__ The `getInstance` method is removed.
* __Reason:__ Service model resource permissions are now retrieved via `ModelResourcePermissionRegistryUtil`.

**PortletResourcePermissionFactory.java**
[`portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/PortletResourcePermissionFactory.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/PortletResourcePermissionFactory.java)

* __Date:__ Dec. 12, 2023
* __Ticket:__ [LPS-193174](https://liferay.atlassian.net/browse/LPS-193174)
* __What changed:__ The `getInstance` method is removed.
* __Reason:__ There are no longer any usages for this method.

**JSONWebServiceActionsManager.java**
[`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionsManager.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionsManager.java)

* __Date:__ Dec. 13, 2023
* __Ticket:__ [LPS-203854](https://liferay.atlassian.net/browse/LPS-203854)
* __What changed:__ The `registerServletContext(ServletContext)` and `unregisterServletContext(ServletContext)` methods are removed.
* __Reason:__ Spring bean JSON web service registration is now centralized in `JSONWebServiceTracker`, so there is no longer a need to explicitly register or unregister a `ServletContext`.

**JSONWebServiceActionsManagerUtil.java**
[`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionsManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionsManagerUtil.java)

* __Date:__ Dec. 13, 2023
* __Ticket:__ [LPS-203854](https://liferay.atlassian.net/browse/LPS-203854)
* __What changed:__ The `registerServletContext(ServletContext)` and `unregisterServletContext(ServletContext)` methods are removed.
* __Reason:__ Spring bean JSON web service registration is now centralized in `JSONWebServiceTracker`, so there is no longer a need to explicitly register or unregister a `ServletContext`.

**PhoneNumberFormatUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/format/PhoneNumberFormatUtil.java`

* __Date:__ Dec. 13, 2023
* __Ticket:__ [LPS-200292](https://liferay.atlassian.net/browse/LPS-200292)
* __What changed:__ The `PhoneNumberFormatUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class. Additionally, the `getPhoneNumberFormat` method is removed.
* __Reason:__ The class is moved into `portal-impl` to simplify the code structure. The `getPhoneNumberFormat` method is no longer used.

**ClusterBridgeMessageListener.java**
`portal-kernel/src/com/liferay/portal/kernel/cluster/messaging/ClusterBridgeMessageListener.java`

* __Date:__ Dec. 15, 2023
* __Ticket:__ [LPS-203461](https://liferay.atlassian.net/browse/LPS-203461)
* __What changed:__ The `ClusterBridgeMessageListener` class is moved from `portal-kernel` to the `user-admin-web` module.
* __Reason:__ This class is only used for the `live_users` destination in the `user-admin-web` module.

**DefaultControlPanelEntry.java**
`portal-kernel/com/liferay/portal/kernel/portlet/DefaultControlPanelEntry.java`
        
* __Date:__ Jan. 4, 2024
* __Ticket:__ [LPS-200537](https://liferay.atlassian.net/browse/LPS-200537)
* __What changed:__ The class is removed.
* __Reason:__ There is no longer any usage for this implementation.

**ServiceProxyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ServiceProxyFactory.java`
        
* __Date:__ Jan. 8, 2024
* __Ticket:__ [LPS-204548](https://liferay.atlassian.net/browse/LPS-204548)
* __What changed:__ The class is removed. Instead, directly use the `Snapshot` class.
* __Reason:__ This class no longer has any usage.

**LayoutSet.java**
[`portal-kernel/src/com/liferay/portal/kernel/model/LayoutSet.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/model/LayoutSet.java)

* __Date:__ Jan. 10, 2024
* __Ticket:__ [LPS-146160](https://liferay.atlassian.net/browse/LPS-146160)
* __What changed:__ A new `isLayoutSetReadyForPropagation` method is added.
* __Reason:__ This new method allows for identifying if a layout set is actively propagated from a layout set prototype.

**LayoutSetWrapper.java**
[`portal-kernel/src/com/liferay/portal/kernel/model/LayoutSetWrapper.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/model/LayoutSetWrapper.java)

* __Date:__ Jan. 10, 2024
* __Ticket:__ [LPS-146160](https://liferay.atlassian.net/browse/LPS-146160)
* __What changed:__ A new `isLayoutSetReadyForPropagation` method is added.
* __Reason:__ This new method allows for identifying if a layout set is actively propagated from a layout set prototype.

**FileEntry.java**
[`portal-kernel/src/com/liferay/portal/kernel/repository/model/FileEntry.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/repository/model/FileEntry.java)

* __Date:__ Jan. 29, 2024
* __Ticket:__ [LPD-6958](https://liferay.atlassian.net/browse/LPD-6958)
* __What changed:__ A new `getDisplayDate` method is added for the new display date field.
* __Reason:__ This new method allows for a display date to propogate to file entries in external repositories if they are enabled.

**FileVersion.java**
[`portal-kernel/src/com/liferay/portal/kernel/repository/model/FileVersion.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/repository/model/FileVersion.java)

* __Date:__ Jan. 29, 2024
* __Ticket:__ [LPD-6958](https://liferay.atlassian.net/browse/LPD-6958)
* __What changed:__ A new `getDisplayDate` method is added for the new display date field.
* __Reason:__ This new method allows for a display date to propogate to specific file versions in external repositories if they are enabled.

**DLStore.java**
[`portal-kernel/src/com/liferay/document/library/kernel/store/DLStore.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/document/library/kernel/store/DLStore.java)

* __Date:__ Jan. 31, 2024
* __Ticket:__ [LPD-15353](https://liferay.atlassian.net/browse/LPD-15353)
* __What changed:__ The `deleteFile(long, long, String)` has been restored after it was previously removed.
* __Reason:__ This method implementation is useful for deleting a single file.

[`portal-kernel/bnd.bnd`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/bnd.bnd)

* __Date:__ Feb. 7, 2024
* __Ticket:__ [LPS-206272](https://liferay.atlassian.net/browse/LPS-206272)
* __What changed:__ The `portal-kernel/src/com/liferay/portal/kernel/portlet/constants/packageinfo` version has increased to `1.6.0`, and the `portal-kernel/src/com/liferay/portal/kernel/portlet/packageinfo` version has increased to `29.2.0`.
* __Reason:__ The `FriendlyURLRegistryUtil` class now has a new method `getFriendlyURLResolverByDefaultURLSeparator(String defaultURLSeparator)`.

### Changes in `portal-test` classes

`portal-test/bnd.bnd`

* __Date:__ Jan. 17, 2024
* __Ticket:__ [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
* __What changed:__ The bundle version is increased to `24.0.0` due to multiple class removals.

**CaptureAppender.java**
`portal-test/src/com/liferay/portal/test/log/CaptureAppender.java`

* __Date:__ Jan. 17, 2024
* __Ticket:__ [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
* __What changed:__ The class is removed. Use `LoggerTestUtil`'s `Log4JLogCapture` method instead.
* __Reason:__ The `CaptureAppender` class was deprecated.

**Log4JLoggerTestUtil.java**
`portal-test/src/com/liferay/portal/test/log/Log4JLoggerTestUtil.java`

* __Date:__ Jan. 17, 2024
* __Ticket:__ [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
* __What changed:__ The class is removed. Use `LoggerTestUtil` directly instead.
* __Reason:__ The `Log4JLoggerTestUtil` class was deprecated.

**LogEvent.java**
`portal-test/src/com/liferay/portal/test/log/LogEvent.java`

* __Date:__ Jan. 17, 2024
* __Ticket:__ [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
* __What changed:__ The class is removed. Use `LoggerTestUtil`'s `Log4JLogEntry` method instead.
* __Reason:__ The `LogEvent` class was deprecated.

**LogAssertionAppender.java**
`portal-test/src/com/liferay/portal/test/rule/LogAssertionAppender.java`

* __Date:__ Jan. 17, 2024
* __Ticket:__ [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
* __What changed:__ The class is removed.
* __Reason:__ The `LogAssertionAppender` class was deprecated.

## 2023 Q4 Release

### Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change**                                      | **Description**                                                                                                                                                                          | **References**                                                                                                               |
| :------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------- |
| **Minimum Compatible Elasticsearch Version**             | Elasticsearch must be updated to at least version **7.17**. Liferay DXP no longer starts up with earlier versions (and a console error is shown).                                        | [Compatibility matrix](https://help.liferay.com/hc/en-us/articles/360016511651#Liferay-DXP-Quarterly-Releases-Elasticsearch) |
| **AB Testing**                                           | AB testing only supports **one variant** (in addition to the control). This prevents testing from taking exponentially longer time to complete.                                          | [LRAC-14353](https://liferay.atlassian.net/browse/LRAC-14353)                                                                |
| **Default Menu Display Configuration on Page Templates** | By default, Menu Display widgets inherited from page templates have the *Page Hierarchy* configuration, even if private pages are enabled. This does not apply if the site has no pages. | [LPS-194075](https://liferay.atlassian.net/browse/LPS-194075)                                                                |
| **No Cache Option for DM File Downloads**                | By default, the new *No Cache* option is used for DM file downloads that do not have permission for Guest users.                                                                         | [LPS-174415](https://liferay.atlassian.net/browse/LPS-174415)                                                                |
| **Support for Deploying Liferay with WebSphere**         | Deploying Liferay with an IBM WebSphere application server is deprecated. Support ends for this feature _in one year (with the 2024 Q4 release)_.                                        | TBA                                                                                                                          |
| **Supported Java Versions**                              | JDK 8 is deprecated and support for it ends _in one year (with the 2024 Q4 release)_. Liferay DXP 7.4 must then use JDK 11.                                                              | TBA                                                                                                                          |

### Changes in Module Source Code

**ExtRepository.java**
[`modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java)

-   **Date**: Sep. 29, 2023
-   **Ticket**: [LPS-197315](https://liferay.atlassian.net/browse/LPS-197315)
-   **What Changed**: A new `String` parameter (`fileName`) is added to the `addExtRepositoryFileEntry(String, String, String, String, String, InputStream)` method (so it now takes 6 `String` parameters and an `InputStream`).
-   **Reason**: The file name is required to create files with a Sharepoint external repository.

**liferay-chart.tld**
`modules/apps/frontend-taglib/frontend-taglib-chart/src/main/resources/META-INF/liferay-chart.tld`

-   **Date**: Oct. 6, 2023
-   **Ticket**: [LPS-198114](https://liferay.atlassian.net/browse/LPS-198114)
-   **What Changed**: The Liferay chart module's taglibs are removed.
-   **Reason**: These taglibs are no longer used in Liferay, and Liferay removed support for soy.

**CommerceShipmentItemLocalService.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java)

-   **Date**: Oct. 6, 2023
-   **Ticket**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534)
-   **What Changed**: The `getCommerceShipmentOrderItemsQuantity` method returns a `BigDecimal` instead of an `int` value.
-   **Reason**: A `BigDecimal` value is needed for new unit of measurement functionality.

**CommerceShipmentItemService.java**
[modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java)

-   **Date**: Oct. 6, 2023
-   **Ticket**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534)
-   **What Changed**: The `getCommerceShipmentOrderItemsQuantity` method returns a `BigDecimal` instead of an `int` value.
-   **Reason**: A `BigDecimal` value is needed for new unit of measurement functionality.

**BaseClayTag.java**
`modules/apps/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/base/BaseClayTag.java`

-   **Date**: Oct. 10, 2023
-   **Ticket**: [LPS-198462](https://liferay.atlassian.net/browse/LPS-198462)
-   **What Changed** The `BaseClayTag` class is removed.
-   **Reason**: The class is no longer used.

**ModelSearchRegistrarHelper.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/ModelSearchRegistrarHelper.java`

-   **Date**: Oct. 11, 2023
-   **Ticket**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809)
-   **What Changed**: The `ModelSearchRegistrarHelper` class is removed.
-   **Reason**: The search registrar bootstrapping style has changed, and this class is no longer used.

**ModelSearchDefinitionContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/contributor/ModelSearchDefinitionContributor.java`

-   **Date**: Oct. 11, 2023
-   **Ticket**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809)
-   **What Changed**: The `ModelSearchDefinitionContributor` class is removed.
-   **Reason**: The search registrar bootstrapping style has changed, and this class is no longer used.

**AccountRoleLocalService.java**
[`modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java)

-   **Date**: Oct. 17, 2023
-   **Ticket**: [LPS-173628](https://liferay.atlassian.net/browse/LPS-173628)
-   **What Changed**: The `checkCompanyAccountRoles` method is removed.
-   **Reason**: The `AddDefaultAccountRolesPortalInstanceLifecycleListener` and `AddDefaultAccountRolesPortletPermissionsPortalInstanceLifecycleListener` classes initialize and check default account roles instead.

**CommerceCheckoutStepHttpHelper.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java)

-   **Date**: Oct. 25, 2023
-   **Ticket**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230)
-   **What Changed**: The `isActiveShippingMethodCommerceCheckoutStep` method now uses an additional `CommerceOrder` value.
-   **Reason**: A `CommerceOrder` value is passed as a parameter to help checkout performance.

**PaymentProcessCheckoutStepDisplayContext.java**
[`modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java)

-   **Date**: Oct. 25, 2023
-   **Ticket**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230)
-   **What Changed**: The `PaymentProcessCheckoutStepDisplayContext` method nose uses an additional `CommerceOrder` value.
-   **Reason**: A `CommerceOrder` value is passed as a parameter to help checkout performance.

**AssetEntryItemSelectorCriterion.java**
[`modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java)

-   **Date**: Oct. 30, 2023
-   **Ticket**: [LPS-197840](https://liferay.atlassian.net/browse/LPS-197840)
-   **What Changed**: The `scopeGroupType` methods are removed.
-   **Reason**: The `scopeGroupType` methods are no longer used.

**BasePreviewBackgroundTaskExecutor.java**
[`modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java)

-   **Date**: Oct. 31, 2023
-   **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
-   **What Changed**: The class accesses the new `DLFileEntryConfigurationProvider` instead of directly accessing `DLFileEntryConfiguration`.
-   **Reason**: The `DLFileEntryConfigurationProvider` class has been added.

**ExtendedObjectClassDefinition.java**
[`modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java)

-   **Date**: Oct. 31, 2023
-   **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
-   **What Changed**: The class has a new static method, `getScope(String)`.
-   **Reason**: The new method allows for retrieving a `Scope` object with a String scope value.

**DLFileEntryConfiguration.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java)

-   **Date**: Oct. 31, 2023
-   **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
-   **What Changed**: The class uses a new attribute, `maxNumberOfPages`. This was formerly part of `PDFPreviewConfiguration`.
-   **Reason**: `PDFPreviewConfiguration` is no longer used.

**DLFileEntryConfigurationProvider.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java)

-   **Date**: Oct. 31, 2023
-   **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
-   **What Changed**: This class is a new configuration provider for `DLFileEntryConfiguration`.
-   **Reason**: This configuration provider gives easier access to multiple configuration levels (system, instance, and site) for `DLFileEntryConfiguration`.

**DLFileEntryConfigurationConstants.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java)

-   **Date**: Oct. 31, 2023
-   **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
-   **What Changed**: This a newly added class.
-   **Reason**: This class defines common values to handle `DLFileEntryConfiguration` attributes.

**DLFileEntryConfigurationException.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java)

-   **Date**: Oct. 31, 2023
-   **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
-   **What Changed**: This is a new type of Exception.
-   **Reason**: This Exception is now used when an invalid value is set for `DLFileEntryConfiguration` attributes.

**CPContentHelper.java**
[`modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java)

-   **Date**: Nov. 4, 2023
-   **Ticket**: [COMMERCE-12579](https://liferay.atlassian.net/browse/COMMERCE-12579)
-   **What Changed**: The `hasDirectReplacement` method is renamed to `isDirectReplacement`.
-   **Reason**: The method now checks for whether the SKU is a replacement of another product, instead of checking whether it has replacements.

### Changes in `portal-impl` Classes

**UserImpl.java**
[`portal-impl/src/com/liferay/portal/model/impl/UserImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/impl/UserImpl.java)

-   **Date**: Oct. 4, 2023
-   **Ticket**: [LPS-196035](https://liferay.atlassian.net/browse/LPS-196035)
-   **What Changed**: WebDAV clients must use `userId` instead of the user's screen name, email address, or regular password to authenticate via Digest Auth.
-   **Reason**: WebDAV now requires each user to generate a separate password for access, requiring the user to take actions to change their accout settings. The user experience is simplified to use `userId` to compensate, avoiding unexpected WebDAV access rejections.

**portal.properties**
[`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties)

-   **Date**: Oct. 8, 2023
-   **Ticket**: [LPS-189621](https://liferay.atlassian.net/browse/LPS-189621)
-   **What Changed**: The `sql.data.max.parameters` property is removed.
-   **Reason**: The database-specific `database.max.parameters` property should be used instead.

**OpenIdUtil.java**
`portal-impl/src/com/liferay/portal/util/OpenIdUtil.java`

-   **Date**: Oct. 19, 2023
-   **Ticket**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877)
-   **What Changed**: The `OpenIdUtil` class is removed. Use `OpenIdConnect` instead.
-   **Reason**: OpenID has been deprecated and Liferay no longer uses it internally.

**PersistedModelLocalServiceRegistryUtil.java**
[`portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java)

-   **Date**: Oct. 20, 2023
-   **Ticket**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563)
-   **What Changed**: The `PersistedModelLocalServiceRegistryUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**HttpAuthManagerUtil.java**
[`portal-impl/src/com/liferay/portal/security/auth/http.HttpAuthManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/http/HttpAuthManagerUtil.java)

-   **Date**: Oct. 21, 2023
-   **Ticket**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376)
-   **What Changed**: The `HttpAuthManagerUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**ImageToolUtil.java**
[`portal-impl/src/com/liferay/portal/image/ImageToolUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/image/ImageToolUtil.java)\*\*

-   **Date**: Oct. 21, 2023
-   **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
-   **What Changed**: The `ImageToolUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**DLPreviewableProcessor.java**
`portal-impl/src/com/liferay/document/library/kernel/util/DLPreviewableProcessor.java`

-   **Date**: Oct. 21, 2023
-   **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
-   **What Changed**: The `DLPreviewableProcessor` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**RoleMembershipPolicyFactoryUtil.java**
[`portal-kernel/src/com/liferay/portal/kernel/security.membershippolicy.RoleMembershipPolicyFactoryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyFactoryUtil.java)

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
-   **What Changed**: The `RoleMembershipPolicyFactoryUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**RoleMembershipPolicyUtil.java**
[`https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java)

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
-   **What Changed**: The `RoleMembershipPolicyUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**AuthenticatedSessionManagerUtil.java**
[`portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java)

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165)
-   **What Changed**: The `AuthenticatedSessionManagerUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**Success.java**
[`portal-impl/src/com/liferay/portal/xmlrpc/Success.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Success.java)

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
-   **What Changed**: The `Success` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**Fault.java**
[`portal-impl/src/com/liferay/portal/xmlrpc/Fault.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Fault.java)

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
-   **What Changed**: The `Fault` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**XmlRpcUtil.java**
[`portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java)

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
-   **What Changed**: The `XmlRpcUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**StartupHelperUtil.java**
[`portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java)

-   **Date**: Nov. 2, 2023
-   **Ticket**: [LPS-200501](https://liferay.atlassian.net/browse/LPS-200501)
-   **What Changed**: The `isStartupFinished` and `setStartupFinished(boolean)` methods are removed.
-   **Reason**: The flag does not accurately reflect the startup status, so the methods are removed to avoid incorrect usage.

**ModelAdapterUtil.java**
[`portal-impl/src/com/liferay/portal/model/adapter/ModelAdapterUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/adapter/util/ModelAdapterUtil.java)

-   **Date**: Nov. 3, 2023
-   **Ticket**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825)
-   **What Changed**: The `ModelAdapterUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
-   **Reason**: The class is moved into `portal-impl` to simplify the code structure.

### Changes in `portal-kernel` classes

**DLProcessorRegistry.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistry.java`

-   **Date**: Sep. 27, 2023
-   **Ticket**: [LPS-196698](https://liferay.atlassian.net/browse/LPS-196698)
-   **What Changed**: The `getPreviewableProcessorMaxSize` method is added.
-   **Reason**: The method is needed to retrieve the configuration value.

**FormNavigatorEntryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/servlet/taglib/ui/FormNavigatorEntryUtil.java`

-   **Date**: Oct. 12, 2023
-   **Ticket**: [LPS-198653](https://liferay.atlassian.net/browse/LPS-198653)
-   **What Changed**: The `FormNavigatorEntryUtil` class is removed. Use the OSGi service provided in `FormNavigatorEntryProvider` instead.
-   **Reason**: The class is no longer used.

**OpenId.java**
`portal-kernel/src/com/liferay/portal/kernel/openid/OpenId.java`

-   **Date**: Oct. 19, 2023
-   **Ticket**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877)
-   **What Changed**: The `OpenId` class is removed. Use `OpenIdConnect` instead.
-   **Reason**: OpenID has been deprecated and Liferay no longer uses it internally.

**PersistedModelLocalServiceRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/service/PersistedModelLocalServiceRegistry.java`

-   **Date**: Oct. 20, 2023
-   **Ticket**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563)
-   **What Changed**: The `PersistedModelLocalServiceRegistry` class is removed. Use `PersistedModelLocalServiceRegistryUtil` (which is also refactored into `portal-impl`) instead.
-   **Reason**: The service collection and look-up logic is refactored into `PersistedModelLocalServiceRegistryUtil`.

**ImageTool.java**
`portal-kernel/src/com/liferay/portal/kernel/image/ImageTool.java`

-   **Date**: Oct. 21, 2023
-   **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
-   **What Changed**: The `ImageTool` class is removed. Its constant fields are refactored to `ImageConstants`, except for constants related to image orientation, which are removed. Use `ImageToolUtil`'s static methods or the constants in `ImageConstants` instead.
-   **Reason**: The class is no longer used.

**PortletPermission.java**
`portal-kernel/src/com/liferay/portal/kernel/service/permission/PortletPermission.java`

-   **Date**: Oct. 21, 2023
-   **Ticket**: [LPS-196101](https://liferay.atlassian.net/browse/LPS-196101)
-   **What Changed**: The `PortletPermission` class is removed. Use `PortletPermissionUtil` instead.
-   **Reason**: The class is no longer used.

**RoleMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/RoleMembershipPolicyFactory.java`

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
-   **What Changed**: The `RoleMembershipPolicyFactory` class is removed. Use `RoleMembershipPolicyFactoryUtil` (which is moved to `portal-impl`) instead.
-   **Reason**: The class is no longer used.

**ThreadLocalDistributor.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributor.java`

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859)
-   **What Changed**: The `ThreadLocalDistributor` class is removed.
-   **Reason**: The class is no longer used.

**ThreadLocalDistributorRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributorRegistry.java`

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859)
-   **What Changed**: The `ThreadLocalDistributorRegistry` class is removed.
-   **Reason**: The class is no longer used.

**HttpAuthManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/http/HttpAuthManager.java`

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376)
-   **What Changed**: The `HttpAuthManger` class is removed. Use `HttpAuthManagerUtil` instead.
-   **Reason**: The class is no longer used.

**XmlRpcParser.java**
`portal-kernel/src/com/liferay/portal/kernel.xmlrpc.XmlRpcParser.java`

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
-   **What Changed**: The `XmlRpcParser` class is refactored into the `XmlRpcUtil` class (which is also now in `portal-impl`).
-   **Reason**: The `XmlRpcParser` and `XmlRpcUtil` classes were closely related and depended on each other, so the two classes have been combined.

**AuthenticatedSessionManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/session/AuthenticatedSessionManager.java`

-   **Date**: Oct. 23, 2023
-   **Ticket**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165)
-   **What Changed**: The `AuthenticatedSessionManager` class is removed. Use `AuthenticatedSessionManagerUtil` instead.
-   **Reason**: The class is no longer used.

**TemplateManagerUtil.java**
[`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java)

-   **Date**: Oct. 26, 2023
-   **Ticket**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072)
-   **What Changed**: The `destroy` and `getTemplateManagers` methods are removed.
-   **Reason** These methods are no longer used.

**TemplateManager.java**
[`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java)

-   **Date**: Oct. 26, 2023
-   **Ticket**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072)
-   **What Changed**: The `init` and `destroy` methods are removed.
-   **Reason**: The life cycle management is moved into internal service logic. The service's consumers should not directly control its life cycle.

**ModelAdapterBuilderLocator.java**
`portal-kernel/src/com/liferay/portal/kernel/model/adapter/builder/ModelAdapterBuilderLocator.java`

-   **Date**: Nov. 3, 2023
-   **Ticket**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825)
-   **What Changed**: The `ModelAdapterBuilderLocator` class is removed. Use `ModelAdapterUtil` directly instead.
-   **Reason**: The class is no longer used.

**AssetEntriesFacet.java**
`portal-kernel/src/com/liferay/portal/kernel/search/facet/AssetEntriesFacet.java`

-   **Date**: Nov. 3, 2023
-   **Ticket**: [LPS-200073](https://liferay.atlassian.net/browse/LPS-200073)
-   **What Changed**: The `AssetEntriesFacet` class is removed, in favor of logic from `FacetImpl`.
-   **Reason**: The class is no longer used.

**AuditMessageFactory.java**
[`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java)

-   **Date**: Nov. 7, 2023
-   **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
-   **What Changed**: Logic from `AuditMessageFactoryUtil` and `AuditMessageFactoryImpl` have been refactored into `AuditMessageFactory`.
-   **Reason**: The logic was unnecessarily split between classes, so it is now combined into the `AuditMessageFactory` class to simplify the code structure.

**AuditMessageFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.java`

-   **Date**: Nov. 7, 2023
-   **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
-   **What Changed**: The `AuditMessageFactoryUtil` class is removed. The logic has been refactored into `AuditMessageFactory`.
-   **Reason**: The logic was unnecessarily split between classes, so it is now combined into the `AuditMessageFactory` class to simplify the code structure.

**PortletToolbar.java**
[`portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java)

-   **Date**: Nov. 21, 2023
-   **Ticket**: [LPS-200453](https://liferay.atlassian.net/browse/LPS-200453)
-   **What Changed**: The `PortletToolbar` class's constructor is now private. Use `PortletToolbar.INSTANCE` to get an instance of `PortletToolbar` instead.
-   **Reason**: `PortletToolbar` is no longer in `util-spring`, so it needs a static instance instead.

### Changes in Taglibs

**`liferay-commerce` taglibs**

-   **Date**: Oct. 16, 2023
-   **Ticket**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170)
-   **What Changed**: The `SearchInputTag` and `UserManagementBarTag` taglibs are removed.
-   **Reason**: These were internal taglibs and are no longer used. They also used obsolete markup and logic.

**`liferay-export-import-changeset` taglibs**

-   **Date**: Oct. 16, 2023
-   **Ticket**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170)
-   **What Changed**: These taglibs were removed: `AddEntitiesTag`, `AddEntityTag`, `CreateTag`, `CreateTei`, `ExportEntityTag`, `ExportImportEntityManagementBarButtonTag`, `ExportImportEntitySearchContainerMappingTag`, `ImportEntityTag`, `PublishChangesetTag`, and `PublishModelMenuItemTag`.
-   **Reason**: These were internal taglibs and are no longer used. They also used obsolete markup and logic.

## 2023 Q3 Release

### Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change**                                        | **Description**                                                                                                                                                                                                                                                                                                                                  | **References**                                                |
| :--------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Location of the Mark as Cacheable option for fragments** | Mark (or unmark) fragments as cacheable in the Fragments menu (within the fragment's Actions menu) instead of the editor. Now you can make this change separately from other edits to the fragment, which reduces the performance cost of propagating it to fragments in use. No implementation changes are necessary with this breaking change. | [LPS-183735](https://liferay.atlassian.net/browse/LPS-183735) |

### Changes in Module Source Code

**SolrClientManager.java**
[`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientManager.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientManager.java)

-   **Date**: Jul. 4, 2023
-   **Ticket**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691)
-   **What Changed**: The `SolrClientManager` class's extension points are removed.
-   **Reason**: Liferay no longer supports extending this class.

**SolrClientFactory.java**
[`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientFactory.java)

-   **Date**: Jul. 4, 2023
-   **Ticket**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691)
-   **What Changed**: The `CLOUD` and `REPLICATED` extension points are removed.
-   **Reason**: Liferay no longer supports these extension points.

**HttpClientFactory.java**
[`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/http/HttpClientFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/http/HttpClientFactory.java)

-   **Date**: Jul. 4, 2023
-   **Ticket**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691)
-   **What Changed**: The `BASIC` and `CERT` extension points are removed.
-   **Reason**: Liferay no longer supports these extension points.

### Changes in `portal-impl` Classes

**MessagingHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/MessagingHotDeployListener.java`

-   **Date**: Aug. 4, 2023
-   **Ticket**: [LPS-192680](https://liferay.atlassian.net/browse/LPS-192680)
-   **What Changed**: The `MessagingHotDeployListener` class is removed. The accompanying `liferay/hot_deploy` message bus destination is also removed. Instead, register a `HotDeployListener` to listen for hot deploy events.
-   **Reason**: The removed message bus destination is no longer used.

**HookHotDeployListener.java**
[`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java)

-   **Date**: Aug. 17, 2023
-   **Ticket**: [LPS-193926](https://liferay.atlassian.net/browse/LPS-193926)
-   **What Changed**: The `HookHotDeployListener` class no longer supports deploying a [`DLProcessor`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/document/library/kernel/processor/DLProcessor.java) via hook. Instead, convert your `DLProcessor` into an OSGi implementation.
-   **Reason**: This prevents duplicated logic to register `DLProcessor` implementations between `DLProcessorRegistryImpl` and `HookHotDeployListener`.

**portal.properties**
[`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties)

-   **Date**: Sep. 4, 2023
-   **Ticket**: [LPS-194379](https://liferay.atlassian.net/browse/LPS-194379)
-   **What Changed**: The portal property `discussion.subscribe` is removed. Instead, set the same configuration in your instance settings in the UI.
-   **Reason**: Instance settings can be set specifically per instance and while Liferay is running, so it's more flexible to configure it as an instance setting.

**HookHotDeployListener.java**
[`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java)

-   **Date**: Sep. 4, 2023
-   **Ticket**: [LPS-194350](https://liferay.atlassian.net/browse/LPS-194350)
-   **What Changed**: The `HookHotDeployListener` class no longer supports deploying an external repository via hook. Instead, convert your own external repository implementation into an OSGi service.
-   **Reason**: OSGi services support more features than deploying external repositories via hook.

**portal.properties**
[`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties)

-   **Date**: Sep. 13, 2023
-   **Ticket**: [LPS-195006](https://liferay.atlassian.net/browse/LPS-195006)
-   **What Changed**: The portal property `discussion.comments.always.editable.by.owner` is removed. Instead, configure the same setting in your instance settings in the UI.
-   **Reason**: Instance settings can be set specifically per instance and while Liferay is running, so it's more flexible to configure it as an instance setting.

### Changes in `portal-kernel` Classes

**Document.java**
[`portal-kernel/src/com/liferay/portal/kernel/search/Document.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/search/Document.java)

-   **Date**: Jul. 7, 2023
-   **Ticket**: [LPS-188914](https://liferay.atlassian.net/browse/LPS-188914)
-   **What Changed**: These `addFile` methods are now deprecated: `addFile(String, byte[], String)`, `addFile(String, File, String)`, `addFile(String, InputStream, String)`, and `addFile(String, InputStream, String, int)`. Update your implementations by using an `InputStream` with the file's data and calling the [`TextExtractor`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/util/TextExtractor.java) class's `extractText` method. Then, call `addFile(String, String)` using the `extractText` call's return value.
-   **Reason**: The deprecated `addFile` implementations are no longer used.

**BaseModelPermissionChecker.java**
`com.liferay.portal.kernel.security.permission.BaseModelPermissionChecker`

-   **Date**: Aug. 11, 2023
-   **Ticket**: [LPS-182671](https://liferay.atlassian.net/browse/LPS-182671)
-   **What Changed**: The `BaseModelPermissionChecker` interface is removed. Implement [`ModelResourcePermission`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/ModelResourcePermission.java) instead.
-   **Reason**: The interface was deprecated in 7.1 and is no longer used.

**SchedulerEngine.java**
[`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngine.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngine.java)

-   **Date**: Aug. 24, 2023
-   **Ticket**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314)
-   **What Changed**: The `unschedule` method is removed. Instead, call the `delete` method.
-   **Reason**: The method is not needed because unscheduled jobs should be deleted at the same time.

**SchedulerEngineHelper.java**
[`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelper.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelper.java)

-   **Date**: Aug. 24, 2023
-   **Ticket**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314)
-   **What Changed**: The `unschedule` method is removed. Instead, call the `delete` method.
-   **Reason**: The method is not needed because unscheduled jobs should be deleted at the same time.

**SchedulerEngineHelperUtil.java**
[`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelperUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelperUtil.java)

-   **Date**: Aug. 24, 2023
-   **Ticket**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314)
-   **What Changed**: The `unschedule` method is removed. Instead, call the `delete` method.
-   **Reason**: The method is not needed because unscheduled jobs should be deleted at the same time.

**DestinationEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationEventListener.java`

-   **Date**: Sep. 1, 2023
-   **Ticket**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116)
-   **What Changed**: The `DestinationEventListener` interface is removed. Listening for `Destination` registration and unregistration events is no longer supported.
-   **Reason**: This listener is no longer used.

**MessageBusEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/MessageBusEventListener.java`

-   **Date**: Sep. 1, 2023
-   **Ticket**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116)
-   **What Changed**: The `MessageBusEventListener` interface is removed. Listening for `MessageListener` registration and unregistration events is no longer supported.
-   **Reason**: This listener is no longer used.

**Destination.java**
[`portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java)

-   **Date**: Sep. 1, 2023
-   **Ticket**: [LPS-194337](https://liferay.atlassian.net/browse/LPS-194337)
-   **What Changed**: These methods are removed: `copyMessageListeners`, `getMessageListenerCount`, `isRegistered`, `register`, `unregister`. The [`MessageListenerRegistry`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListenerRegistry.java) interface is added to get message listeners associated with a provided destination name. Update your code by registering a `MessageListener` as an OSGi service, using the `destination.name` property.
-   **Reason**: This change simplifies the message bus code structure.

**ConfigurationProvider.java**
`portal-kernel/src/com/liferay/portal/kernel/module/configuration/ConfigurationProvider.java`

-  **Date**: Sep. 5, 2023
-  **Ticket**: [LPS-188270](https://liferay.atlassian.net/browse/LPS-188270)
-  **What Changed**: The `ConfigurationProvider` class is moved into the `portal-configuration-module-configuration-api` module. Add `portal-configuration-module-configuration-api` as a build dependency to continue using the class.
-  **Reason**: The `ConfigurationProvider` class is only used for modules.

**ConfigurationProviderUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/module/configuration/ConfigurationProviderUtil.java`

-  **Date**: Sep. 5, 2023
-  **Ticket**: [LPS-188270](https://liferay.atlassian.net/browse/LPS-188270)
-  **What Changed**: The `ConfigurationProviderUtil` class is moved into the `portal-configuration-module-configuration-api` module. Add `portal-configuration-module-configuration-api` as a build dependency to continue using the class.
-  **Reason**: This class is being moved to ensure that the `ConfigurationProvider` class is always available to it.

**PortletDisplay.java**
[`portal-kernel/src/com/liferay/portal/kernel/theme/PortletDisplay.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/theme/PortletDisplay.java)

-  **Date**: Sep. 5, 2023
-  **Ticket**: [LPS-188270](https://liferay.atlassian.net/browse/LPS-188270)
-  **What Changed**: The `getPortletInstanceConfiguration(Class<T>)` method is removed. Use the `ConfigurationProviderUtil.getPortletInstanceConfiguration(Class<T>, ThemeDisplay)` method or reference the `ConfigurationProvider` class for the same method instead.
-  **Reason**: The `getPortletInstanceConfiguration` method should be handled in `ConfigurationProvider`.

**TriggerConfiguration.java**
[`portal-kernel/src/com/liferay/portal/kernel/scheduler/TriggerConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/TriggerConfiguration.java)

-   **Date**: Sep. 11, 2023
-   **Ticket**: [LPS-190994](https://liferay.atlassian.net/browse/LPS-190994)
-   **What Changed**: The scheduler framework no longer supports using an empty cron expression (or interval of `0`) to disable a job. Instead, use the component blacklist to disable specific scheduler components. Check the required class names in the error message shown when using an empty cron expression.
-   **Reason**: If a job should not be bootstrapped, it should not be registered with the scheduler framework.
