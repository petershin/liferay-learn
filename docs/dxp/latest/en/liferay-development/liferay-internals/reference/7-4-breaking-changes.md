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

Breaking changes break or significantly alter existing functionality or code structure. Here are all of the breaking changes for Liferay 7.4, starting with the latest quarterly release (2023 Q3). As the product changes and improves, we try our best to minimize these disruptions, but sometimes they are unavoidable.

Read about 7.4 breaking changes from before 2023 Q3 in the [Liferay source code](https://github.com/liferay/liferay-portal/blob/master/readme/BREAKING_CHANGES.markdown).

## 2024 Q3 Release

### Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change**                             | **Description**                                                                                                                                                        | **References**                                              |
| :---------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------- |
| **Web Content Filters**                         | The *Mine* and *Recent* filters for web content now displays the creation date instead of the modified.                                                                | [LPD-11218](https://liferay.atlassian.net/browse/LPD-11218) |
| **Custom User Attributes with Asset Publisher** | The Asset Publisher widget's Custom User Attributes functionality is now deprecated, because the behavior can be confusing. Instead, use content sets and experiences. | [LPD-11037](https://liferay.atlassian.net/browse/LPD-11037) |

### Changes in Module Source Code

**FragmentCollectionLocalServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentCollectionLocalServiceImpl.java`

- **Date**: May 3, 2024
- **Ticket**: [LPD-24491](https://liferay.atlassian.net/browse/LPD-24491)
- **What Changed**: The overloaded `addFragmentCollection` methods have a new `String` parameter for an external reference code.
- **Reason**: This change adds support for handling fragment collections with an external reference code.

**FragmentCollectionServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentCollectionServiceImpl.java`

- **Date**: May 3, 2024
- **Ticket**: [LPD-24491](https://liferay.atlassian.net/browse/LPD-24491)
- **What Changed**: The overloaded `addFragmentCollection` methods have a new `String` parameter for an external reference code.
- **Reason**: This change adds support for handling fragment collections with an external reference code.

**FragmentEntryProcessorHelper.java**
`modules/apps/fragment/fragment-entry-processor/fragment-entry-processor-api/src/main/java/com/liferay/fragment/entry/processor/helper/FragmentEntryProcessorHelper.java`

- **Date**: May 4, 2024
- **Ticket**: [LPD-24494](https://liferay.atlassian.net/browse/LPD-24494)
- **What Changed**: The `getMappedInfoItemFieldValue(JSONObject, String, InfoItemFieldValues, Locale)` method has a new `FragmentEntryProcessorContext` parameter.
- **Reason**: This change adds necessary information from the `FragmentEntryProcessorContext` for checking permissions.

**SegmentsExperienceLocalServiceImpl.java**
`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperienceLocalServiceImpl.java`

- **Date**: May 6, 2024
- **Ticket**: [LPD-25044](https://liferay.atlassian.net/browse/LPD-25044)
- **What Changed**: The `addSegmentsExperience` and `addDefaultSegmentsExperience` methods now have a new `String` parameter for an external reference code.
- **Reason**: This change adds support for handling `SegmentsExperience` objects with an external reference code.

**SegmentsExperienceServiceImpl.java**
`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperienceServiceImpl.java`

- **Date**: May 6, 2024
- **Ticket**: [LPD-25044](https://liferay.atlassian.net/browse/LPD-25044)
- **What Changed**: The `addSegmentsExperience` method has a new `String` parameter for an external reference code.
- **Reason**: This change adds support for handling `SegmentsExperience` objects with an external reference code.

**KBArticleLocalService.java**
`modules/apps/knowledge-base/knowledge-base-api/src/main/java/com/liferay/knowledge/base/service/KBArticleLocalService.java`

- **Date**: May 8, 2024
- **Ticket**: [LPD-25047](https://liferay.atlassian.net/browse/LPD-25047)
- **What Changed**: The `unlockKBArticle(long)` method is removed. Instead, use the new `unlockKBArticle(long, long)` and `unlockKBArticle(long, long, boolean)` methods by supplying a user ID.
- **Reason**: A user ID is needed to check for a lock's ownership, so this change prevents issues when unlocking KB articles.

**CartItemResource.java**
`modules/apps/commerce/headless/headless-commerce/headless-commerce-delivery-cart-api/src/main/java/com/liferay/headless/commerce/delivery/cart/resource/v1_0/CartItemResource.java`

- **Date**: May 9, 2024
- **Ticket**: [LPD-19824](https://liferay.atlassian.net/browse/LPD-19824)
- **What Changed**: The `deleteCartItem` method's return type is now `void` instead of `Response`.
- **Reason**: This change fixes the definition to be consistent with the other removal methods, as it was incorrectly defined previously.

**SiteNavigationMenuItemLocalService**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuItemLocalService.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenuItem(long, long, long, long, String, int, String, ServiceContext)` and `addSiteNavigationMenuItem(long, long, long, long, String, String, ServiceContext)` methods add a new `String` parameter for an external reference code. The new `deleteSiteNavigationMenuItem(String, long)` method is also added.
- **Reason**: These changes add support for handling site navigation menu items with external reference codes.

**SiteNavigationMenuItemLocalServiceUtil.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuItemLocalServiceUtil.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenuItem(long, long, long, long, String, int, String, SiteNavigationMenuItem)` and `addSiteNavigationMenuItem(long, long, long, long, String, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenuItem(String, long)` method is added.
- **Reason**: These changes add support for handling site navigation menu items with external reference codes.

**SiteNavigationMenuItemLocalServiceWrapper.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuItemLocalServiceWrapper.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenuItem(long, long, long, long, String, int, String, ServiceContext)` and `addSiteNavigationMenuItem(long, long, long, long, String, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenuItem(String, long)` method is added.
- **Reason**: These changes add support for handling site navigation menu items with external reference codes.

**SiteNavigationMenuItemService.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuItemService.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenuItem(long, long, long, String, String, ServiceContext)` method has a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenuItem(String, long)` and `getSiteNavigationMenuItemByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menu items with external reference codes.

**SiteNavigationMenuItemServiceUtil.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuItemServiceUtil.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenuItem(long, long, long, String, String, ServiceContext)` method has a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenuItem(String, long)` and `getSiteNavigationMenuItemByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menu items with external reference codes.

**SiteNavigationMenuItemServiceUtil.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuItemServiceUtil.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenuItem(long, long, long, String, String, ServiceContext)` method has a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenuItem(String, long)` and `getSiteNavigationMenuItemByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menu items with external reference codes.

**SiteNavigationMenuItemServiceWrapper.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuItemServiceWrapper.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenuItem(long, long, long, String, String, ServiceContext)` method has a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenuItem(String, long)` and `getSiteNavigationMenuItemByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menu items with external reference codes.

**SiteNavigationMenuLocalService.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuLocalService.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenu(long, long, String, int, boolean, ServiceContext)`, `addSiteNavigationMenu(long, long, String, int, ServiceContext)`, and `addSiteNavigationMenu(long, long, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenu(String, long)`, `fetchSiteNavigationMenuByExternalReferenceCode(String, long)`, and `getSiteNavigationMenuByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**SiteNavigationMenuLocalServiceUtil.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuLocalServiceUtil.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenu(long, long, String, int, boolean, ServiceContext)`, `addSiteNavigationMenu(long, long, String, int, ServiceContext)`, and `addSiteNavigationMenu(long, long, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `addSiteNavigationMenu(String, long, long, String, ServiceContext)`, `deleteSiteNavigationMenu(String, long)`, `fetchSiteNavigationMenuByExternalReferenceCode(String, long)`, and `getSiteNavigationMenuByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**SiteNavigationMenuLocalServiceWrapper.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuLocalServiceWrapper.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenu(long, long, String, int, boolean, ServiceContext)`, `addSiteNavigationMenu(long, long, String, int, ServiceContext)`, and `addSiteNavigationMenu(long, long, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `addSiteNavigationMenu(String, long, long, ServiceContext)`, `deleteSiteNavigationMenu(String, long)`, `fetchSiteNavigationMenuByExternalReferenceCode(String, long)`, `getSiteNavigationMenuByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**SiteNavigationMenuService.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuService.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenu(long, String, int, boolean, ServiceContext)`, `addSiteNavigationMenu(long, String, int, ServiceContext)`, and `addSiteNavigationMenu(long, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenu(String, long)` and `getSiteNavigationMenuByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**SiteNavigationMenuServiceUtil.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuServiceUtil.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenu(long, String, int, boolean, ServiceContext)`, `addSiteNavigationMenu(long, String, int, ServiceContext)`, and `addSiteNavigationMenu(long, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenu(String, long)` and `getSiteNavigationMenuByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**SiteNavigationMenuServiceWrapper.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/SiteNavigationMenuServiceWrapper.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The `addSiteNavigationMenu(long, String, int, boolean, ServiceContext)`, `addSiteNavigationMenu(long, String, int, ServiceContext)`, and `addSiteNavigationMenu(long, String, ServiceContext)` methods have a new `String` parameter for an external reference code. Additionally, the new `deleteSiteNavigationMenu(String, long)` and `getSiteNavigationMenuByExternalReferenceCode(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**SiteNavigationMenuPersistence.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/persistence/SiteNavigationMenuPersistence.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The new `findByERC_G(String, long)`, `fetchByERC_G(String, long)`, `fetchByERC_G(String, long, boolean)`, `removeByERC_G(String, long)`, and `countByERC_G(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**SiteNavigationMenuUtil.java**
`modules/apps/site-navigation/site-navigation-api/src/main/java/com/liferay/site/navigation/service/persistence/SiteNavigationMenuUtil.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-24944](https://liferay.atlassian.net/browse/LPD-24944)
- **What Changed**: The new `findByERC_G(String, long)`, `fetchByERC_G(String, long)`, `fetchByERC_G(String, long, boolean)`, `removeByERC_G(String, long)`, and `countByERC_G(String, long)` methods are added.
- **Reason**: These changes add support for handling site navigation menus with external reference codes.

**CommerceTierPriceEntryLocalService.java**
`modules/apps/commerce/commerce-price-list-api/src/main/java/com/liferay/commerce/price/list/service/CommerceTierPriceEntryLocalService.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-3481](https://liferay.atlassian.net/browse/LPD-3481)
- **What Changed**: The `fetchCommerceTierPriceEntries` method is removed. The `findClosestCommerceTierPriceEntry` method is also renamed to `fetchClosestCommerceTierPriceEntry`, and the `findCommerceTierPriceEntries` method is renamed to `getCommerceTierPriceEntries`.
- **Reason**: This change enforces consistency with method names.

**CommerceTierPriceEntryService.java**
`modules/apps/commerce/commerce-price-list-api/src/main/java/com/liferay/commerce/price/list/service/CommerceTierPriceEntryService.java`

- **Date**: May 10, 2024
- **Ticket**: [LPD-3481](https://liferay.atlassian.net/browse/LPD-3481)
- **What Changed**: The `fetchCommerceTierPriceEntries` method is removed.
- **Reason**: The `fetchCommerceTierPriceEntries` method was deprecated and no longer used.

**rest-config.yaml**
`modules/apps/portal-search/portal-search-rest-impl/rest-config.yaml`

- **Date**: May 14, 2024
- **Ticket**: [LPD-24803](https://liferay.atlassian.net/browse/LPD-24803)
- **What Changed**: The new `/search` base URI is added.
- **Reason**: This change simplifies the headless portal search base URI.

**DefaultAccountGroupException.java**
`modules/apps/account/account-api/src/main/java/com/liferay/account/exception/DefaultAccountGroupException.java`

- **Date**: May 16, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The constructors are no longer publicly accessible.
- **Reason**: The inner class should be instantiated instead.

**ResolveTask.java**
`modules/sdk/gradle-plugins-target-platform/src/main/java/com/liferay/gradle/plugins/target/platform/task/ResolveTask.java`

- **Date**: May 16, 2024
- **Ticket**: [LPD-21814](https://liferay.atlassian.net/browse/LPD-21814)
- **What Changed**: The `ResolveTask` class now extends the `aQute.bnd.gradle.AbstractBndrun` class. The `isOffline`, `setOffline`, `resolve`, `getBndrunFile`, and `setBndrunFile(Object)` methods are also deprecated. Use the `worker` and `getProperties` methods instead of the `resolve` method. Use the `bndrun` property instead of the `getBndrunFile` and `setBndrunFile(Object)` methods. 
- **Reason**: This change allows for upgrading the `biz.aQute.bnd.*` dependencies to support Gradle 8.

**TargetPlatformPlugin.java**
`modules/sdk/gradle-plugins-target-platform/src/main/java/com/liferay/gradle/plugins/target/platform/TargetPlatformPlugin.java`

- **Date**: May 16, 2024
- **Ticket**: [LPD-21814](https://liferay.atlassian.net/browse/LPD-21814)
- **What Changed**: The `compileClasspath`, `runtimeClasspath`, `testCompileClasspath`, and `testRuntimeClasspath` configurations are no longer targeted for platform dependencies.
- **Reason**: This change is necessary to support Gradle 8.

**AMImageConfigurationException.java**
`modules/apps/adaptive-media/adaptive-media-api/src/main/java/com/liferay/adaptive/media/exception/AMImageConfigurationException.java`

- **Date**: May 16, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The constructors are no longer publicly accessible.
- **Reason**: The inner class should be instantiated instead.

**LayoutPageTemplateServiceUpgradeStepRegistrator.java**
`modules/apps/layout/layout-page-template-service/src/main/java/com/liferay/layout/page/template/internal/upgrade/registry/LayoutPageTemplateServiceUpgradeStepRegistrator.java`

- **Date**: May 16, 2024
- **Ticket**: [LPD-25467](https://liferay.atlassian.net/browse/LPD-25467)
- **What Changed**: The new `BaseExternalReferenceCodeUpgradeProcess` is added, for the addition of external reference codes to layout page template entries.
- **Reason**: The upgrade process handles existing layout page template entries without external reference codes.

**LayoutPageTemplateEntryLocalServiceImpl.java**
`modules/apps/layout/layout-page-template-service/src/main/java/com/liferay/layout/page/template/service/impl/LayoutPageTemplateEntryLocalServiceImpl.java`

- **Date**: May 16, 2024
- **Ticket**: [LPD-25467](https://liferay.atlassian.net/browse/LPD-25467)
- **What Changed**: Each overloaded `addLayoutPageTemplateEntry` method has a new `String` parameter for an external reference code.
- **Reason**: This change adds support for external reference codes for `LayoutPageTemplateEntry` entities.

**LayoutPageTemplateEntryServiceImpl.java**
`modules/apps/layout/layout-page-template-service/src/main/java/com/liferay/layout/page/template/service/impl/LayoutPageTemplateEntryServiceImpl.java`

- **Date**: May 16, 2024
- **Ticket**: [LPD-25467](https://liferay.atlassian.net/browse/LPD-25467)
- **What Changed**: Each overloaded `addLayoutPageTemplateEntry` method has a new `String` parameter for an external reference code.
- **Reason**: This change adds support for external reference codes for `LayoutPageTemplateEntry` entities.

**CommercePaymentEngineException.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/exception/CommercePaymentEngineException.java`

- **Date**: May 17, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The inner `MustSetPrimaryCurrency` class is removed.
- **Reason**: The public constructors should be used for `CommercePaymentEngineException` instead.

**CommerceShippingEngineException.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/exception/CommerceShippingEngineException.java`

- **Date**: May 17, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The constructors are no longer publicly accessible.
- **Reason**: The inner class should be instantiated instead.

**SearchPermissionFilterContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/permission/SearchPermissionFilterContributor.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `SearchPermissionFilterContributor` class's location is moved (to `modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/permission/contributor/SearchPermissionFilterContributor.java`).
- **Reason**: The contributor class should be located in a `contributor/` package.

**SearchPermissionFieldContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/permission/SearchPermissionFieldContributor.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `SearchPermissionFieldContributor` class's location is moved (to `modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/permission/contributor/SearchPermissionFieldContributor.java`).
- **Reason**: The contributor class should be located in a `contributor/` package.

**IndexContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/index/contributor/IndexContributor.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `IndexContributor` class is renamed and moved to `modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/index/listener/CompanyIndexListener.java`. Additionally, the `onBeforeRemove` method is renamed to `onBeforeDelete`.
- **Reason**: The Listener code pattern is well known and provides better context as to when the implemented code should be executed. In this case the code executes either after a company index is created, or before a company index is deleted. The method renaming change enforces consistency with other methods in the same execution scope.

**CPOptionKeyException.java**
`modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/exception/CPOptionKeyException.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The inner `MustNotBeDuplicate` class is removed.
- **Reason**: The public constructors should be used for `CPOptionKeyException` instead.

**CPSpecificationOptionKeyException.java**
`modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/exception/CPSpecificationOptionKeyException.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The constructors are no longer publicly accessible.
- **Reason**: The inner class should be instantiated instead.

**IndexConfigurationContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/index/configuration/contributor/IndexConfigurationContributor.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `contributeMappings` method's `indexName` parameter is removed.
- **Reason**: The framework that calls `IndexConfigurationContributor` would have already determined the index to apply mappings to.

**IndexSettingsContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/settings/IndexSettingsContributor.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `IndexSettingsContributor` class is removed. The `contribute` method is renamed to `contributeMappings` and the `populate` method is renamed to `contributeSettings`, both methods moved to `IndexConfigurationContributor.java`.
- **Reason**: This change improves clarity because the methods in this interface contribute to both mappings and settings.

**TypeMappingsHelper.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/settings/TypeMappingsHelper.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `TypeMappingsHelper` class's location is changed (to `modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/index/configuration/contributor/helper/TypeMappingsHelper.java
`). Additionally, the `addTypeMappings` method is renamed to `putTypeMappings`, and the `indexName` parameter is removed.
- **Reason**: The class's new package location is more aligned with the interface's functionality. For the `indexName` parameter removal, the framework that calls `IndexConfigurationContributor` would have already determined the index to put mappings into.

**ClientSettingsHelper.java**
`modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-api/src/main/java/com/liferay/portal/search/elasticsearch7/settings/ClientSettingsHelper.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `ClientSettingsHelper` class is removed.
- **Reason**: This class is no longer used.

**IndexSettingsHelper.java**
`modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-api/src/main/java/com/liferay/portal/search/elasticsearch7/settings/IndexSettingsHelper.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `IndexSettingsHelper` class is removed.
- **Reason**: This class is no longer used.

**TypeMappingsHelper.java**
`modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-api/src/main/java/com/liferay/portal/search/elasticsearch7/settings/TypeMappingsHelper.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `TypeMappingsHelper` class is removed.
- **Reason**: This class is no longer used.

**XPackSecuritySettings.java**
`modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-api/src/main/java/com/liferay/portal/search/elasticsearch7/settings/XPackSecuritySettings.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `XPackSecuritySettings` class is removed.
- **Reason**: The class is no longer used.

**IndexSettingsHelper.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/settings/IndexSettingsHelper.java`

- **Date**: May 22, 2024
- **Ticket**: [LPD-7822](https://liferay.atlassian.net/browse/LPD-7822)
- **What Changed**: The `IndexSettingsHelper` class's location is changed (to `modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/index/configuration/contributor/helper/IndexSettingsHelper.java`).
- **Reason**: The new package location is more aligned with the interface's functionality.

**OpenIdConnectServiceException.java**
`modules/apps/portal-security-sso/portal-security-sso-openid-connect-api/src/main/java/com/liferay/portal/security/sso/openid/connect/OpenIdConnectServiceException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `OpenIdConnectServiceException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**RequiredTemplateException.java**
`modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/exception/RequiredTemplateException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `RequiredTemplateException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**DepotEntryGroupRelToGroupException.java**
`modules/apps/depot/depot-api/src/main/java/com/liferay/depot/exception/DepotEntryGroupRelToGroupException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `DepotEntryGroupRelToGroupException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**CircularRedirectEntryException.java**
`modules/apps/redirect/redirect-api/src/main/java/com/liferay/redirect/exception/CircularRedirectEntryException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `CircularRedirectEntryException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**DefaultSegmentsEntryException.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/exception/DefaultSegmentsEntryException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `DefaultSegmentsEntryException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**RequiredSegmentsEntryException.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/exception/RequiredSegmentsEntryException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `RequiredSegmentsEntryException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**RequiredSegmentsExperienceException.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/exception/RequiredSegmentsExperienceException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `RequiredSegmentsExperienceException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**FormInstanceFieldSettingsException.java**
`modules/apps/dynamic-data-mapping/dynamic-data-mapping-form-web/src/main/java/com/liferay/dynamic/data/mapping/form/web/internal/FormInstanceFieldSettingsException.java`

- **Date**: May 26, 2024
- **Ticket**: [LPD-25246](https://liferay.atlassian.net/browse/LPD-25246)
- **What Changed**: The `FormInstanceFieldSettingsException` class's constructor methods are now private.
- **Reason**: The inner class should be instantiated instead.

**client_serdes.ftl**
`modules/util/portal-tools-rest-builder/src/main/resources/com/liferay/portal/tools/rest/builder/dependencies/client_serdes.ftl`

- **Date**: May 27, 2024
- **Ticket**: [LPD-23771](https://liferay.atlassian.net/browse/LPD-23771)
- **What Changed**: The serialization behavior for the `toJSON` function now properly handles arrays.
- **Reason**: This change is necessary to correctly represent array fields in JSON.

**WarehouseResourceImpl.java**
`modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-inventory-impl/src/main/java/com/liferay/headless/commerce/admin/inventory/internal/resource/v1_0/WarehouseResourceImpl.java`

- **Date**: May 27, 2024
- **Ticket**: [LPD-25885](https://liferay.atlassian.net/browse/LPD-25885)
- **What Changed**: The `getWarehousesPage(Filter, Pagination, Sort[])` method adds a new `String` parameter for a search string.
- **Reason**: This parameter is necessary for this API to work with data sets.

**DropdownGroupItem.java**
`modules/apps/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/util/DropdownGroupItem.java`

- **Date**: May 28, 2024
- **Ticket**: [LPD-25954](https://liferay.atlassian.net/browse/LPD-25954)
- **What Changed**: The new `setDropdownItems(List<DropdownItem>)` method is added.
- **Reason**: The new method implementation adds more flexibility when using the Clay Drop-down taglib.

**DropdownItem.java**
`modules/apps/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/util/DropdownItem.java`

- **Date**: May 28, 2024
- **Ticket**: [LPD-25954](https://liferay.atlassian.net/browse/LPD-25954)
- **What Changed**: The new `setDropdownItems(List<DropdownItem>)` method is added.
- **Reason**: The new method implementation adds more flexibility when using the Clay Drop-down taglib.

**DropdownItemBuilder.java**
`modules/apps/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/util/DropdownItemBuilder.java`

- **Date**: May 28, 2024
- **Ticket**: [LPD-25954](https://liferay.atlassian.net/browse/LPD-25954)
- **What Changed**: The new `setDropdownItems(List<DropdownItem>)` method is added.
- **Reason**: The new method implementation adds more flexibility when using the Clay Drop-down taglib.

**LayoutPageTemplateCollectionLocalServiceImpl.java**
`modules/apps/layout/layout-page-template-service/src/main/java/com/liferay/layout/page/template/service/impl/LayoutPageTemplateCollectionLocalServiceImpl.java`

- **Date**: May 28, 2024
- **Ticket**: [LPD-20993](https://liferay.atlassian.net/browse/LPD-20993)
- **What Changed**: The `fetchLayoutPageTemplateCollectionByName` is removed, and the new `fetchLayoutPageTemplateCollection(long, String, long, int)` method is added instead. The `getUniqueLayoutPageTemplateCollectionName` method also has a new `long` parameter for `parentLayoutPageTemplateCollectionId`.
- **Reason**: This change is required to ensure that these methods return unique elements.

**LayoutPageTemplateEntryLocalServiceImpl.java**
`modules/apps/layout/layout-page-template-service/src/main/java/com/liferay/layout/page/template/service/impl/LayoutPageTemplateEntryLocalServiceImpl.java`

- **Date**: May 28, 2024
- **Ticket**: [LPD-20993](https://liferay.atlassian.net/browse/LPD-20993)
- **What Changed**: The `fetchLayoutPageTemplateEntry(long, String)` and `fetchLayoutPageTemplateEntry(long, String, int)` overloaded methods are replaced with the `fetchLayoutPageTemplateEntry(long, long, String, int)` and `fetchLayoutPageTemplateEntry(long, String)` overloaded methods. The `getUniqueLayoutPageTemplateEntryNanem(long, String, int)` method is also replaced with the `getUniqueLayoutPageTemplateEntryName(long, long, String, int)` method.
- **Reason**: This change is required to ensure that these methods return unique elements.

**CommercePaymentEntryLocalServiceImpl.java**
`modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/service/impl/CommercePaymentEntryLocalServiceImpl.java`

- **Date**: Jun. 3, 2024
- **Ticket**: [LPD-22281](https://liferay.atlassian.net/browse/LPD-22281)
- **What Changed**: The `addCommercePaymentEntry`, `addOrUpdateCommercePaymentEntry`, and `updateCommercePaymentEntry` methods have a new `String` parameter for a payload.
- **Reason**: This change is necessary to support the new payload field.

**RelatedInfoItemProvider.java**
`modules/apps/info/info-api/src/main/java/com/liferay/info/item/provider/RelatedInfoItemProvider.java`

- **Date**: Jun. 7, 2024
- **Ticket**: [LPD-27648](https://liferay.atlassian.net/browse/LPD-27648)
- **What Changed**: The `getRelatedItemClassNames` method is removed. A new `getRelatedInfoItems` method is added in its place (which returns a `List<RelatedInfoItem>`).
- **Reason**: This change is necessary to manage relationships in the content page editor.

**AccountEntryEmailAddressValidator.java**
`modules/apps/account/account-api/src/main/java/com/liferay/account/validator/AccountEntryEmailAddressValidator.java`

- **Date**: Jun. 11, 2024
- **Ticket**: [LPD-3478](https://liferay.atlassian.net/browse/LPD-3478)
- **What Changed**: The new `isEmailAddressAlreadyUsed` is added.
- **Reason**: The new method allows for identifying if an email is already present in the system.

**QuantityInputTag.java**
`modules/apps/commerce/commerce-taglib/src/main/java/com/liferay/commerce/taglib/servlet/taglib/QuantityInputTag.java`

- **Date**: Jun. 13, 2024
- **Ticket**: [LPD-27036](https://liferay.atlassian.net/browse/LPD-27036)
- **What Changed**: The `setValue` method now uses a `BigDecimal` parameter instead of an `int` parameter, and the `getValue` method now returns a `BigDecimal` value instead of an `int` value.
- **Reason**: Decimal values are now supported, so the internal value must update to reflect this.

**FragmentCompositionLocalServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentCompositionLocalServiceImpl.java`

- **Date**: Jun. 14, 2024
- **Ticket**: [LPD-25303](https://liferay.atlassian.net/browse/LPD-25303)
- **What Changed**: The `addFragmentComposition` method has a new `String` method for an external reference code.
- **Reason**: This change is necessary to support adding fragment compositions with an external reference code.

**FragmentCompositionServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentCompositionServiceImpl.java`

- **Date**: Jun. 14, 2024
- **Ticket**: [LPD-25303](https://liferay.atlassian.net/browse/LPD-25303)
- **What Changed**: The `addFragmentComposition` method has a new `String` method for an external reference code.
- **Reason**: This change is necessary to support adding fragment compositions with an external reference code.

**FragmentEntryServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentEntryServiceImpl.java`

- **Date**: Jun. 14, 2024
- **Ticket**: [LPD-25303](https://liferay.atlassian.net/browse/LPD-25303)
- **What Changed**: The `addFragmentEntry` method has a new `String` method for an external reference code.
- **Reason**: This change is necessary to support adding fragment entries with an external reference code.

**FragmentEntryLocalServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentEntryLocalServiceImpl.java`

- **Date**: Jun. 14, 2024
- **Ticket**: [LPD-25303](https://liferay.atlassian.net/browse/LPD-25303)
- **What Changed**: The `addFragmentEntry` method has a new `String` method for an external reference code.
- **Reason**: This change is necessary to support adding fragment entries with an external reference code.

**CPSpecificationOptionLocalServiceImpl.java**
`modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/service/impl/CPSpecificationOptionLocalServiceImpl.java`

- **Date**: Jun. 17, 2024
- **Ticket**: [LPD-22571](https://liferay.atlassian.net/browse/LPD-22571)
- **What Changed**: The `addCPSpecificationOption` and `updateCPSpecificationOption` methods have a new `long` parameter for `listTypeDefinitionId`. A new `countCPSpecificationOptionByListTypeDefinitionId(long)` method is also added.
- **Reason**: This change is necessary to relate a `SpecificationOption` to its corresponding `ListTypeDefinition`.

**StyleBookEntryLocalServiceImpl.java**
`modules/apps/style-book/style-book-service/src/main/java/com/liferay/style/book/service/impl/StyleBookEntryLocalServiceImpl.java`

- **Date**: Jun. 17, 2024
- **Ticket**: [LPD-25325](https://liferay.atlassian.net/browse/LPD-25325)
- **What Changed**: The `addStyleBookEntry` method has a new `String` parameter for an external reference code.
- **Reason**: This change is needed to support adding a template with an external reference code.

**StyleBookEntryServiceImpl.java**
`modules/apps/style-book/style-book-service/src/main/java/com/liferay/style/book/service/impl/StyleBookEntryServiceImpl.java`

- **Date**: Jun. 17, 2024
- **Ticket**: [LPD-25325](https://liferay.atlassian.net/browse/LPD-25325)
- **What Changed**: The `addStyleBookEntry` methods have a new `String` parameter for an external reference code.
- **Reason**: This change is needed to support adding a template with an external reference code.

**KBArticleLocalServiceImpl.java**
`modules/apps/knowledge-base/knowledge-base-service/src/main/java/com/liferay/knowledge/base/service/impl/KBArticleLocalServiceImpl.java`

- **Date**: Jun. 21, 2024
- **Ticket**: [LPD-28764](https://liferay.atlassian.net/browse/LPD-28764)
- **What Changed**: The new `getLatestKBArticle(long, int[])` method is added. The overloaded `findByR_S` method implementations also replace their `int` parameter (for the article status) with an `int[]` parameter for multiple statuses.
- **Reason**: This change allows for retrieving a knowledge base article using multiple statuses.

**DDMTemplateServiceImpl.java**
`modules/apps/dynamic-data-mapping/dynamic-data-mapping-service/src/main/java/com/liferay/dynamic/data/mapping/service/impl/DDMTemplateServiceImpl.java`

- **Date**: Jun. 23, 2024
- **Ticket**: [LPD-25303](https://liferay.atlassian.net/browse/LPD-25303)
- **What Changed**: The `addTemplate` methods add a new `String` parameter for an external reference code.
- **Reason**: This change is needed to support adding a template with an external reference code.

**DDMTemplateLocalServiceImpl.java**
`modules/apps/dynamic-data-mapping/dynamic-data-mapping-service/src/main/java/com/liferay/dynamic/data/mapping/service/impl/DDMTemplateLocalServiceImpl.java`

- **Date**: Jun. 23, 2024
- **Ticket**: [LPD-25303](https://liferay.atlassian.net/browse/LPD-25303)
- **What Changed**: The `addTemplate` methods add a new `String` parameter for an external reference code.
- **Reason**: This change is needed to support adding a template with an external reference code.

**Context.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/context/Context.java`

- **Date**: Jun. 27, 2024
- **Ticket**: [LPD-28576](https://liferay.atlassian.net/browse/LPD-28576)
- **What Changed**: The `DEVICE_MODEL`, `DEVICE_BRAND`, `DEVICE_SCREEN_RESOLUTION_WIDTH` and `DEVICE_SCREEN_RESOLUTION_HEIGHT` constant fields are removed.
- **Reason**: These constants relied on a third-party library that is no longer used.

**AssetListEntryCreateDateComparator.java**
`modules/apps/asset/asset-list-api/src/main/java/com/liferay/asset/list/util/comparator/AssetListEntryCreateDateComparator.java`

- **Date**: Jun. 28, 2024
- **Ticket**: [LPD-26157](https://liferay.atlassian.net/browse/LPD-26157)
- **What Changed**: The constructor methods are no longer publicly accessible. A new `getInstance(boolean)` method is also added. Use `AssetListEntryCreateDateComparator.getInstance(boolean)` to get a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**AssetTagCountComparator.java**
`modules/apps/asset/asset-api/src/main/java/com/liferay/asset/util/comparator/AssetTagCountComparator.java`

- **Date**: Jun. 28, 2024
- **Ticket**: [LPD-26157](https://liferay.atlassian.net/browse/LPD-26157)
- **What Changed**: The constructor methods are no longer publicly accessible. A new `getInstance(boolean)` method is also added. Use `AssetTagCountComparator.getInstance(boolean)` to get a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**StructureStructureKeyComparator.java**
`modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/util/comparator/StructureStructureKeyComparator.java`

- **Date**: Jun. 28, 2024
- **Ticket**: [LPD-26157](https://liferay.atlassian.net/browse/LPD-26157)
- **What Changed**: The `INSTANCE_ASCENDING` and `INSTANCE_DESCENDING` constant fields are removed.
- **Reason**: This change applies the default singleton pattern to improve the code's organization.

**NestedFieldsContext.java**
`/modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/fields/NestedFieldsContext.java`

- **Date**: Jul. 3, 2024
- **Ticket**: [LPD-17027](https://liferay.atlassian.net/browse/LPD-17027)
- **What Changed**: The `NestedFieldsContext` class now implements the `Cloneable` interface (and the `clone` method).
- **Reason**: When the code executed with lazy loading, the registered depth of the data was not being properly incremented or decremented, causing issues. This change fixes those issues by ensuring the supplier always runs with the same context as when it was created.

**ColumnDescriptorProvider.java**
`/modules/apps/batch-engine/batch-engine-api/src/main/java/com/liferay/batch/engine/csv/ColumnDescriptorProvider.java`

- **Date**: Jul. 3, 2024
- **Ticket**: [LPD-17027](https://liferay.atlassian.net/browse/LPD-17027)
- **What Changed**: The `getColumnDescriptors` method has a new `Map<String, ObjectValuePair<Field, Method>>` parameter replacing the `Map<Field, Method>` parameter.
- **Reason**: This change improves the abstraction between the batch engine and object layers in the code.

**CommerceTierPriceEntryMinQuantityComparator.java**
`modules/apps/commerce/commerce-price-list-api/src/main/java/com/liferay/commerce/price/list/util/comparator/CommerceTierPriceEntryMinQuantityComparator.java`

- **Date**: Jul. 4, 2024
- **Ticket**: [LPD-28067](https://liferay.atlassian.net/browse/LPD-28067)
- **What Changed**: The constructor methods are now private. A new static `getInstance(boolean)` method is also added. Use `CommerceTierPriceEntryMinQuantityComparator.getInstance(boolean)` to create a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**CommercePricingClassCreateDateComparator.java**
`modules/apps/commerce/commerce-pricing-api/src/main/java/com/liferay/commerce/pricing/util/comparator/CommercePricingClassCreateDateComparator.java`

- **Date**: Jul. 4, 2024
- **Ticket**: [LPD-28067](https://liferay.atlassian.net/browse/LPD-28067)
- **What Changed**: The constructor methods are now private. A new static `getInstance(boolean)` method is also added. Use `CommercePricingClassCreateDateComparator.getInstance(boolean)` to create a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**CommercePriceListPriorityComparator.java**
`modules/apps/commerce/commerce-price-list-api/src/main/java/com/liferay/commerce/price/list/util/comparator/CommercePriceListPriorityComparator.java`

- **Date**: Jul. 4, 2024
- **Ticket**: [LPD-28067](https://liferay.atlassian.net/browse/LPD-28067)
- **What Changed**: The constructor methods are now private. A new static `getInstance(boolean)` method is also added. Use `CommercePriceListPriorityComparator.getInstance(boolean)` to create a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**CommercePriceListDisplayDateComparator.java**
`modules/apps/commerce/commerce-price-list-api/src/main/java/com/liferay/commerce/price/list/util/comparator/CommercePriceListDisplayDateComparator.java`

- **Date**: Jul. 4, 2024
- **Ticket**: [LPD-28067](https://liferay.atlassian.net/browse/LPD-28067)
- **What Changed**: The constructor methods are now private. A new static `getInstance(boolean)` method is also added. Use `CommercePriceListDisplayDateComparator.getInstance(boolean)` to create a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**CommercePriceListCreateDateComparator.java**
`modules/apps/commerce/commerce-price-list-api/src/main/java/com/liferay/commerce/price/list/util/comparator/CommercePriceListCreateDateComparator.java`

- **Date**: Jul. 4, 2024
- **Ticket**: [LPD-28067](https://liferay.atlassian.net/browse/LPD-28067)
- **What Changed**: The constructor methods are now private. A new static `getInstance(boolean)` method is also added. Use `CommercePriceListCreateDateComparator.getInstance(boolean)` to create a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**CommercePriceEntryUOMCreateDateComparator.java**
`modules/apps/commerce/commerce-price-list-api/src/main/java/com/liferay/commerce/price/list/util/comparator/CommercePriceEntryUOMCreateDateComparator.java`

- **Date**: Jul. 4, 2024
- **Ticket**: [LPD-28067](https://liferay.atlassian.net/browse/LPD-28067)
- **What Changed**: The constructor methods are now private. A new static `getInstance(boolean)` method is also added. Use `CommercePriceEntryUOMCreateDateComparator.getInstance(boolean)` to create a new instance.
- **Reason**: This change applies the singleton pattern to improve the code's organization.

**ObjectEntryThreadLocal.java**
`modules/apps/object/object-api/src/main/java/com/liferay/object/entry/util/ObjectEntryThreadLocal.java`

- **Date**: Jul. 5, 2024
- **Ticket**: [LPD-29830](https://liferay.atlassian.net/browse/LPD-29830)
- **What Changed**: New `addValidatedObjectEntryId(long)` and `isValidatedObjectEntry(long)` methods are added.
- **Reason**: The `ThreadLocal` object handling validated object entries is used in the object entry context.

**ObjectValidationRuleThreadLocal.java**
`modules/apps/object/object-api/src/main/java/com/liferay/object/validation/rule/util/ObjectValidationRuleThreadLocal.java`

- **Date**: Jul. 5, 2024
- **Ticket**: [LPD-29830](https://liferay.atlassian.net/browse/LPD-29830)
- **What Changed**: The `ObjectValidationRuleThreadLocal` class is removed.
- **Reason**: The `ThreadLocal` object handling validated object entries is used in the object entry context.

**FragmentEntryLinkServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentEntryLinkServiceImpl.java`

- **Date**: Jul. 10, 2024
- **Ticket**: [LPD-30533](https://liferay.atlassian.net/browse/LPD-30533)
- **What Changed**: The `addFragmentEntryLink` method has a new `String` parameter for an external reference code. New `deleteFragmentEntryLink(String, long)` and `getFragmentEntryLinkByExternalReferenceCode(String, long)` methods are also added.
- **Reason**: These changes are needed to support using external reference codes to add and handle fragment entry links.

**FragmentEntryLinkLocalServiceImpl.java**
`modules/apps/fragment/fragment-service/src/main/java/com/liferay/fragment/service/impl/FragmentEntryLinkLocalServiceImpl.java`

- **Date**: Jul. 10, 2024
- **Ticket**: [LPD-30533](https://liferay.atlassian.net/browse/LPD-30533)
- **What Changed**: The `addFragmentEntryLink` method has a new `String` parameter for an external reference code. New `deleteFragmentEntryLink(String, long)` and `getFragmentEntryLinkByExternalReferenceCode(String, long)` methods are also added.
- **Reason**: These changes are needed to support using external reference codes to add and handle fragment entry links.

**ContentPageEditorSidebarPanel.java**
`modules/apps/layout/layout-content-page-editor-api/src/main/java/com/liferay/layout/content/page/editor/sidebar/panel/ContentPageEditorSidebarPanel.java`

- **Date**: Jul. 16, 2024
- **Ticket**: [LPD-31389](https://liferay.atlassian.net/browse/LPD-31389)
- **What Changed**: The `getURL`, `includeSeparator`, and `isLink` methods are removed.
- **Reason**: These methods are not used because links and separators are no longer needed.

**SAPConfiguration.java**
`modules/apps/portal-security/portal-security-service-access-policy-api/src/main/java/com/liferay/portal/security/service/access/policy/configuration/SAPConfiguration.java`

- **Date**: Jul. 17, 2024
- **Ticket**: [LPD-26931](https://liferay.atlassian.net/browse/LPD-26931)
- **What Changed**: New configurations are added to create SAP entries.
- **Reason**: This change allows for creating new SAP entries because they're required to allow `RESTClient` requests from templates.

**ObjectFieldInfoFieldConverter.java**
`modules/apps/object/object-info-api/src/main/java/com/liferay/object/info/field/converter/ObjectFieldInfoFieldConverter.java`

- **Date**: Jul. 21, 2024
- **Ticket**: [LPD-31592](https://liferay.atlassian.net/browse/LPD-31592)
- **What Changed**: The `ObjectFieldInfoFieldConverter` constructor now has new `ObjectStateFlowLocalService` and `ObjectStateLocalService` parameters.
- **Reason**: This change is required to fetch the next allowed object states for the current `ListTypeEntry`.

### Changes in `portal-impl` Classes

**PortalImpl.java**
`portal-impl/src/com/liferay/portal/util/PortalImpl.java`

- **Date**: Jun. 11, 2024
- **Ticket**: [LPD-28051](https://liferay.atlassian.net/browse/LPD-28051)
- **What Changed**: The `initCustomSQL` method is removed.
- **Reason**: The class name IDs should be loaded from the company-aware `ClassName` cache, which is informed by `CompanyThreadLocal`. `initCustomSQL` is called in `CustomSQLImpl#activate` where `CompanyThreadLocal` is not yet initialized. Therefore, `transformCustomSQL` should load the class name IDs instead.

**LayoutLocalServiceImpl.java**
`portal-impl/src/com/liferay/portal/service/impl/LayoutLocalServiceImpl.java`

- **Date**: Jun. 27, 2024
- **Ticket**: [LPD-29128](https://liferay.atlassian.net/browse/LPD-29128)
- **What Changed**: The overloaded `addLayout` methods have a new `String` parameter for an external reference code.
- **Reason**: This change adds support for handling layouts with external reference codes.

**LayoutServiceImpl.java**
`portal-impl/src/com/liferay/portal/service/impl/LayoutServiceImpl.java`

- **Date**: Jun. 27, 2024
- **Ticket**: [LPD-29128](https://liferay.atlassian.net/browse/LPD-29128)
- **What Changed**: The overloaded `addLayout` methods have a new `String` parameter for an external reference code.
- **Reason**: This change adds support for handling layouts with external reference codes.

**PortalPreferencesLocalServiceImpl.java**
`portal-impl/src/com/liferay/portal/service/impl/PortalPreferencesLocalServiceImpl.java`

- **Date**: Jul. 11, 2024
- **Ticket**: [LPD-25552](https://liferay.atlassian.net/browse/LPD-25552)
- **What Changed**: The `fetchCompanyPortalPreferences(long)` method is removed. Use `fetchPortalPreferences(companyId, PortletKeys.PREFS_OWNER_TYPE_COMPANY)` instead.
- **Reason**: The removed method is no longer needed.

### Changes in `portal-kernel` Classes

**JSONWebServiceActionManagerUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionManagerUtil.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-24836](https://liferay.atlassian.net/browse/LPD-24836)
- **What Changed**: The `JSONWebServiceActionManagerUtil` class is moved to the `portal-remote-json-web-service-web` module. Use a service reference or snapshot to get the JSONWebServiceActionManager service for other modules instead.
- **Reason**: This change simplifies the code structure, because the class is only needed in `portal-remote-json-web-service-web`.

**JSONWebServiceAction.java**
`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceAction.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-24836](https://liferay.atlassian.net/browse/LPD-24836)
- **What Changed**: The `JSONWebServiceAction` class is moved to the `portal-remote-json-web-service-api` module. Add `portal-remote-json-web-service-api` as a new dependency to continue using its public methods.
- **Reason**: This change simplifies the code structure, because the class is only needed in `portal-remote-json-web-service-api`.

**JSONWebServiceActionMapping.java**
`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionMapping.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-24836](https://liferay.atlassian.net/browse/LPD-24836)
- **What Changed**: The `JSONWebServiceActionMapping` class is moved to the `portal-remote-json-web-service-api` module. Add `portal-remote-json-web-service-api` as a new dependency to continue using its public methods.
- **Reason**: This change simplifies the code structure, because the class is only needed in `portal-remote-json-web-service-api`.

**JSONWebServiceActionsManager.java**
`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionsManager.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-24836](https://liferay.atlassian.net/browse/LPD-24836)
- **What Changed**: The `JSONWebServiceActionsManager` class is moved to the `portal-remote-json-web-service-api` module. Add `portal-remote-json-web-service-api` as a new dependency to continue using its public methods.
- **Reason**: This change simplifies the code structure, because the class is only needed in `portal-remote-json-web-service-api`.

**NoSuchJSONWebServiceException.java**
`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/NoSuchJSONWebServiceException.java`

- **Date**: May 19, 2024
- **Ticket**: [LPD-24836](https://liferay.atlassian.net/browse/LPD-24836)
- **What Changed**: The `NoSuchJSONWebServiceException` class is moved to the `portal-remote-json-web-service-api` module. Add `portal-remote-json-web-service-api` as a new dependency to continue using its public methods.
- **Reason**: This change simplifies the code structure, because the class is only needed in `portal-remote-json-web-service-api`.

**ClassLoaderRequestDispatcherWrapper.java**
`portal-kernel/src/com/liferay/portal/kernel/servlet/ClassLoaderRequestDispatcherWrapper.java`

- **Date**: May 29, 2024
- **Ticket**: N/A
- **What Changed**: The `ClassLoaderRequestDispatcherWrapper` class is removed.
- **Reason**: This class is no longer needed because PACL has been removed.

**Portal.java**
`portal-kernel/src/com/liferay/portal/kernel/util/Portal.java`

- **Date**: Jun. 11, 2024
- **Ticket**: [LPD-28051](https://liferay.atlassian.net/browse/LPD-28051)
- **What Changed**: The `initCustomSQL` method is removed.
- **Reason**: The class name IDs should be loaded from the company-aware `ClassName` cache, which is informed by `CompanyThreadLocal`. `initCustomSQL` is called in `CustomSQLImpl#activate` where `CompanyThreadLocal` is not yet initialized. Therefore, `transformCustomSQL` should load the class name IDs instead.

**PortalUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/util/PortalUtil.java`

- **Date**: Jun. 11, 2024
- **Ticket**: [LPD-28051](https://liferay.atlassian.net/browse/LPD-28051)
- **What Changed**: The `initCustomSQL` method is removed.
- **Reason**: The class name IDs should be loaded from the company-aware `ClassName` cache, which is informed by `CompanyThreadLocal`. `initCustomSQL` is called in `CustomSQLImpl#activate` where `CompanyThreadLocal` is not yet initialized. Therefore, `transformCustomSQL` should load the class name IDs instead.

**DestinationWrapper.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationWrapper.java`

- **Date**: Jun. 16, 2024
- **Ticket**: [LPD-28526](https://liferay.atlassian.net/browse/LPD-28526)
- **What Changed**: The `DestinationWrapper` is removed.
- **Reason**: This class is removed because MPI/SPI is no longer supported.

**UserLocalService.java**
`portal-kernel/src/com/liferay/portal/kernel/service/UserLocalService.java`

- **Date**: Jul. 4, 2024
- **Ticket**: [LPD-1909](https://liferay.atlassian.net/browse/LPD-1909)
- **What Changed**: The `decryptUserId(long, String, String)` method is removed.
- **Reason**: This change improves security when processing user credentials.

**DLStoreUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/store/DLStoreUtil.java`

- **Date**: Jul. 17, 2024
- **Ticket**: [LPD-1536](https://liferay.atlassian.net/browse/LPD-1536)
- **What Changed**: The `setStore` method is removed. Use the new `setDLStore` method instead.
- **Reason**: This change enforces naming consistency.

## 2024 Q2 Release

### Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change**                                               | **Description**                                                                                                                                                                                                                                                              | **References**                                              |
| :---------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------- |
| **Commerce Countries Page Removed**                               | The Countries page is removed from the Commerce menu because it's no longer a Commerce-specific feature. Countries are now instead managed via the Countries Management page in the Control Panel.                                                                           | [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148) |
| **Translating Status for Web Content Articles**                   | Translating any field in a web content article now changes the status to *Translating*. The article is only considered translated once all fields are translated.                                                                                                            | [LPD-6589](https://liferay.atlassian.net/browse/LPD-6589)   |
| **Confirming Permissions when Publishing Content**                | Users are prompted to confirm permissions for new content when initially published or saved, requiring an extra click. This is not required for updates or subsequent publishes.                                                                                             | [LPD-6769](https://liferay.atlassian.net/browse/LPD-6769)   |
| **Date Shown in the Mine Content Filter**                         | The *Mine* content filter displays creation dates for content instead of modified dates.                                                                                                                                                                                     | [LPD-6830](https://liferay.atlassian.net/browse/LPD-6830)   |
| **Date Shown in the Recent Content Filter**                       | The *Recent* content filter displays creation dates for content instead of modified dates.                                                                                                                                                                                   | [LPD-6828](https://liferay.atlassian.net/browse/LPD-6828)   |
| **Virtual Hosts for Default Sites in Company XML Sitemaps**       | A new SEO menu is added to Instance Settings to select specific sites for the instance, and the default site cannot be removed from the list. If the default site has a Virtual Host defined, it is not added to the company's XML sitemap (though it is in the description). | [LPD-6672](https://liferay.atlassian.net/browse/LPD-6672)   |
| **Removed Configuration Screens for Utility Pages**               | Configuration screens not relevant to utility pages no longer appear when configuring them. The HTML Title, HTML Description, and SEO Configuration screens are still included.                                                                                  | [LPD-4459](https://liferay.atlassian.net/browse/LPD-4459)   |
| **Clearing Facet Selections for New Searches**                    | Searching with a new keyword (in the header's search bar or a search bar widget) clears all selected facets. The old behavior of keeping selected facets can be enabled via the *Retain Facet Selections Across Searches* option in the Search Options widget.               | [LPD-19994](https://liferay.atlassian.net/browse/LPD-19994) |
| **`com.liferay.portal.kernel.util.RemotePreference` API Removed** | The `com.liferay.portal.kernel.util.RemotePreference` API is removed. Any custom code using the `User.getRemotePreference(String)` or `User.getRemotePreferences()` methods is impacted. Instead, get the necessary cookies from the request to get remote preferences.      | [LPD-20659](https://liferay.atlassian.net/browse/LPD-20659) |
| **Localizations for Custom Objects**                              | Users can now set the localization for custom objects. Translatable object fields now use the preferred Locale given by the `DTOConverterContext`. Depending on your use case, adjust your code to add or remove the `Accept-Language` header.                               | [LPD-19561](https://liferay.atlassian.net/browse/LPD-19651) |

### Changes in Module Source Code

**CMISRepositoryHandler.java**
`modules/apps/document-library/document-library-repository-cmis-api/src/main/java/com/liferay/document/library/repository/cmis/CMISRepositoryHandler.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-6960](https://liferay.atlassian.net/browse/LPD-6960)
- **What Changed**: The `addFileEntry(String, long, long, String, String, String, String, String, String, InputStream, long, Date, Date, ServiceContext)` has a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter implements the new method in `DocumentRepository`.

**FragmentEntryLocalServiceUtil.java**
`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryLocalServiceUtil.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-16310](https://liferay.atlassian.net/browse/LPD-16310)
- **What Changed**: The `updateFragmentEntry(long, long, long, String, String, String, String, boolean, String, String, long, int)` method was removed. Instead, use `updateFragmentEntry(long, long, long, String, String, String, String, boolean, String, String, long, boolean, String, int)`.
- **Reason**: Updating a fragment entry now requires additional parameters.

**FragmentEntryServiceUtil.java**
`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryServiceUtil.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-16310](https://liferay.atlassian.net/browse/LPD-16310)
- **What Changed**: The `updateFragmentEntry(long, long, String, String, String, String, boolean, String, String, long, int)` method was deleted. Instead, use `updateFragmentEntry(long, long, String, String, String, String, boolean, String, String, long, boolean, String, int)`.
- **Reason**: Updated a fragment entry now requires additional parameters.

**GroupSearchProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/provider/GroupSearchProvider.java`

- **Date**: Feb. 12, 2024
- **Ticket**: [LPD-17465](https://liferay.atlassian.net/browse/LPD-17465)
- **What Changed**: The `setResultsAndTotal(List<String>, GroupSearch, PortletRequest)` method has a new `long[]` (`excludedGroupIds`) parameter.
- **Reason**: This change is necessary to exclude some sites from the site item selector (for example, when the parent site is being changed).

**FriendlyURLSeparatorCompanyConfiguration.java**
`modules/apps/friendly-url/friendly-url-api/src/main/java/com/liferay/friendly/url/configuration/FriendlyURLSeparatorCompanyConfiguration.java`

- **Date**: Feb. 14, 2024
- **Ticket**: [LPD-15434](https://liferay.atlassian.net/browse/LPD-15434)
- **What Changed**: The `friendlyURLSeparators` method is removed. Instead, a new `friendlyURLSeparatorsJSONObjectString` method is added.
- **Reason**: This change is made to be consistent with the naming pattern in other locations.

**SitemapConfigurationManager.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/configuration/manager/SitemapConfigurationManager.java`

- **Date**: Feb. 15, 2024
- **Ticket**: [LPD-15718](https://liferay.atlassian.net/browse/LPD-15718)
- **What Changed**: The `saveSitemapCompanyConfiguration` method has a new `long[]` (`companySitemapGroupIds`) parameter. Additionally, the new `getCompanySitemapGroupIds(long)` method is added.
- **Reason**: This change is necessary to save the group IDs for the company sitemap configuration.

**BatchEngineImportTaskServiceImpl.java**
`modules/apps/batch-engine/batch-engine-service/src/main/java/com/liferay/batch/engine/service/impl/BatchEngineImportTaskServiceImpl.java`

- **Date**: Feb. 19, 2024
- **Ticket**: [LPD-15802](https://liferay.atlassian.net/browse/LPD-15802)
- **What Changed**: The new `addBatchEngineImportTask(String, long, long, long, String, String, byte[], String, String, Map<String, String>, int, String, Map<String, Serializable>, String)`, `addBatchEngineImportTask(String, long, long, long, String, String, byte[], String, String, Map<String, String>, int, String, Map<String, Serializable>, String, BatchEngineTaskItemDelegate<?>)`, `getBatchEngineImportTaskByExternalReferenceCode(String, long)`, and `getBatchEngineImportTasksCount(long)` methods are added.
- **Reasons**: This change is necessary to ensure only administrators and owners can read exported information.

**BatchEngineImportTaskServiceImpl.java**
`modules/apps/batch-engine/batch-engine-service/src/main/java/com/liferay/batch/engine/service/impl/BatchEngineImportTaskServiceImpl.java`

- **Date**: Feb. 19, 2024
- **Ticket**: [LPD-15576](https://liferay.atlassian.net/browse/LPD-15576)
- **What Changed**: The new `getBatchEngineImportTask(long)` method is added.
- **Reason**: This change is necessary to retrieve a specific `BatchEngineImportTask` with controlled permissions.

**rest-openapi.yaml**
`/modules/apps/digital-signature/digital-signature-rest-impl/rest-openapi.yaml`

- **Date**: Feb. 19, 2024
- **Ticket**: [LPD-15600](https://liferay.atlassian.net/browse/LPD-15600)
- **What Changed**: The `getSiteDSEnvelopesPage` API has new `String` parameters (for `fromDate`, `keywords`, `order`, and `status`).
- **Reason**: The additional parameters are necessary to filter `DSEnvelope` objects.

**BatchEngineExportTaskServiceImpl.java**
`modules/apps/batch-engine/batch-engine-service/src/main/java/com/liferay/batch/engine/service/impl/BatchEngineExportTaskServiceImpl.java`

- **Date**: Feb. 19, 2024
- **Ticket**: [LPD-15802](https://liferay.atlassian.net/browse/LPD-15802)
- **What Changed**: The new `addBatchEngineExportTask(String, long, long, String, String, String, String, List<String>, Map<String, Serializable>, String)`, `getBatchEngineExportTaskByExternalReferenceCode(String, long)`, and `getBatchEngineExportTasksCount(long)` methods are added.
- **Reason**: The new methods are necessary to ensure only administrators and owners can read exported information.

**BatchEngineExportTaskServiceImpl.java**
`modules/apps/batch-engine/batch-engine-service/src/main/java/com/liferay/batch/engine/service/impl/BatchEngineExportTaskServiceImpl.java`

- **Date**: Feb. 19, 2024
- **Ticket**: [LPD-15576](https://liferay.atlassian.net/browse/LPD-15576)
- **What Changed**: The new `getBatchEngineExportTask(long)` method is added.
- **Reason**: The new method is necessary to retrieve a specific `BatchEngineExportTask` with controlled permissions.

**BatchEngineImportTaskServiceImpl.java**
`modules/apps/batch-engine/batch-engine-service/src/main/java/com/liferay/batch/engine/service/impl/BatchEngineImportTaskServiceImpl.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-15576](https://liferay.atlassian.net/browse/LPD-15576)
- **What Changed**: The `getBatchEngineImportTaskErrors` method is removed.
- **Reason**: The `getBatchEngineImportTaskErrors` logic belongs in `BatchEngineImportErrorTaskLocalService` instead.

**APIApplication.java**
`modules/apps/headless/headless-builder/headless-builder-api/src/main/java/com/liferay/headless/builder/application/APIApplication.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-11973](https://liferay.atlassian.net/browse/LPD-11973)
- **What Changed**: The new `getPropertyType` method is added.
- **Reason**: This change adds support for API property types.

**CTCollectionResource.java**
`modules/apps/change-tracking/change-tracking-rest-api/src/main/java/com/liferay/change/tracking/rest/resource/v1_0/CTCollectionResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCTCollectionsPage` and `postCTCollectionsPageExportBatch` are reordered.
- **Reason**: This change sorts the parameters in a consistent order.

**CTEntryResource.java**
`modules/apps/change-tracking/change-tracking-rest-api/src/main/java/com/liferay/change/tracking/rest/resource/v1_0/CTEntryResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCtCollectionCTEntriesPage` are reordered.
- **Reason**: This change sorts the parameters in a consistent order.

**CTProcessReource.java**
`modules/apps/change-tracking/change-tracking-rest-api/src/main/java/com/liferay/change/tracking/rest/resource/v1_0/CTProcessResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCTProcessesPage` and `postCTProcessesPageExportBatch` are reordered.
- **Reason**: This change sorts the parameters in a consistent order.

**CTCollectionResource.java**
`modules/apps/change-tracking/change-tracking-rest-client/src/main/java/com/liferay/change/tracking/rest/client/resource/v1_0/CTCollectionResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCTCollectionsPage`, `getCTCollectionsPageHttpResponse`, `postCTCollectionsPageExportBatch`, and `postCTCollectionsPageExportBatchHttpResponse` in multiple classes contained in `CTCollectionResource` are reordered.
- **Reason**: This change sorts the parameters consistently.

**CTEntryResource.java**
`modules/apps/change-tracking/change-tracking-rest-client/src/main/java/com/liferay/change/tracking/rest/client/resource/v1_0/CTEntryResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCtCollectionCTEntriesPage` and `getCtCollectionCTEntriesPageHttpResponse` in multiple classes contained in `CTEntryResource` are reordered.
- **Reason**: This change sorts the parameters consistently.

**CTProcessResource.java**
`modules/apps/change-tracking/change-tracking-rest-client/src/main/java/com/liferay/change/tracking/rest/client/resource/v1_0/CTProcessResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCTProcessesPage`, `getCTProcessesPageHttpResponse`, `postCTProcessesPageExportBatch`, and `postCTProcessesPageExportBatchHttpResponse` in multiple classes contained in `CTProcessResource` are reordered.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/change-tracking/change-tracking-rest-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getCTCollectionsPage`, `getCtCollectionCTEntriesPage`, and `getCTProcessesPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**CTCollectionResourceImpl.java**
`modules/apps/change-tracking/change-tracking-rest-impl/src/main/java/com/liferay/change/tracking/rest/internal/resource/v1_0/CTCollectionResourceImpl.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCTCollectionsPage` and `postCTCollectionsPageExportBatch` are reordered.
- **Reason**: This change sorts the parameters consistently.

**CTEntryResourceImpl.java**
`modules/apps/change-tracking/change-tracking-rest-impl/src/main/java/com/liferay/change/tracking/rest/internal/resource/v1_0/CTEntryResourceImpl.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCtCollectionCTEntriesPage` are reordered.
- **Reason**: This change sorts the parameters consistently.

**CTProcessResourceImpl.java**
`modules/apps/change-tracking/change-tracking-rest-impl/src/main/java/com/liferay/change/tracking/rest/internal/resource/v1_0/CTProcessResourceImpl.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getCTProcessesPage` are reordered.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getProductByExternalReferenceCodeRelatedProductsPage` and `getProductIdRelatedProductsPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-inventory-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getWarehouseItemsUpdatedPage` API.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/commerce/headless/headless-commerce/headless-commerce-delivery-cart-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getCartItemsPage` API.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/commerce/headless/headless-commerce/headless-commerce-delivery-catalog-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getChannelProductProductOptionProductOptionValuesPage`, `postChannelProductProductOptionProductOptionValuesPage`, and `getChannelProductRelatedProductsPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/headless/headless-admin-content/headless-admin-content-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getSiteDisplayPageTemplatesPage` and `getSiteStructuredContentsPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**KeywordResource.java**
`modules/apps/headless/headless-admin-taxonomy/headless-admin-taxonomy-api/src/main/java/com/liferay/headless/admin/taxonomy/resource/v1_0/KeywordResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getKeywordsRankedPage` are reordered.
- **Reason**: This change sorts the parameters consistently.

**KeywordResource.java**
`modules/apps/headless/headless-admin-taxonomy/headless-admin-taxonomy-client/src/main/java/com/liferay/headless/admin/taxonomy/client/resource/v1_0/KeywordResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getKeywordsRankedPage` and `getKeywordsRankedPageHttpResponse` in multiple classes contained in `KeywordResource` are reordered.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/headless/headless-admin-taxonomy/headless-admin-taxonomy-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getAssetLibraryKeywordsPage`, `getAssetLibraryTaxonomyVocabulariesPage`, `getKeywordsRankedPage`, `getSiteKeywordsPage`, `getSiteTaxonomyVocabulariesPage`, `getTaxonomyCategoriesRankedPage`, `getTaxonomyCategoryTaxonomyCategoriesPage`, and `getTaxonomyVocabularyTaxonomyCategoriesPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**KeywordResourceImpl.java**
`modules/apps/headless/headless-admin-taxonomy/headless-admin-taxonomy-impl/src/main/java/com/liferay/headless/admin/taxonomy/internal/resource/v1_0/KeywordResourceImpl.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getKeywordsRankedPage` are reordered.
- **Reason**: This change sorts the parameters consistently.

**RoleResource.java**
`modules/apps/headless/headless-admin-user/headless-admin-user-api/src/main/java/com/liferay/headless/admin/user/resource/v1_0/RoleResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getRolesPage` and `postRolesPageExportBatch` are reordered.
- **Reason**: This change sorts the parameters consistently.

**RoleResource.java**
`modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/RoleResource.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getRolesPage`, `getRolesPageHttpResponse`, `postRolesPageExportBatch`, and `postRolesPageExportBatchHttpResponse` in multiple classes contained in `RoleResource` are reordered.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/headless/headless-admin-user/headless-admin-user-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getAccountAccountRolesByExternalReferenceCodePage`, `getAccountAccountRolesPage`, `getOrganizationsPage`, `getOrganizationChildOrganizationsPage`, `getOrganizationOrganizationsPage`, and `getRolesPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**RoleResourceImpl.java**
`modules/apps/headless/headless-admin-user/headless-admin-user-impl/src/main/java/com/liferay/headless/admin/user/internal/resource/v1_0/RoleResourceImpl.java`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters in `getRolesPage` are reordered.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/headless/headless-admin-workflow/headless-admin-workflow-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getWorkflowInstanceWorkflowLogsPage`, `getWorkflowTasksAssignedToRolePage`, and `getWorkflowTaskWorkflowLogsPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/headless/headless-delivery/headless-delivery-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getAssetLibraryContentElementsPage`, `getAssetLibraryContentSetByKeyContentSetElementsPage`, `getAssetLibraryContentSetByUuidContentSetElementsPage`, `getAssetLibraryContentStructuresPage`, `getAssetLibraryContentTemplatesPage`, `getAssetLibraryDocumentFoldersPage`, `getAssetLibraryDocumentsPage`, `getAssetLibraryStructuredContentFoldersPage`, `getAssetLibraryStructuredContentsPage`, `getBlogPostingCommentsPage`, `getCommentCommentsPage`, `getContentSetContentSetElementsPage`, `getContentStructureStructuredContentsPage`, `getDocumentFolderDocumentsPage`, `getDocumentFolderDocumentFoldersPage`, `getDocumentCommentsPage`, `getKnowledgeBaseArticleKnowledgeBaseArticlesPage`, `getKnowledgeBaseFolderKnowledgeBaseArticlesPage`, `getKnowledgeBaseFolderKnowledgeBaseFoldersPage`, `getMessageBoardMessageMessageBoardMessagesPage`, `getMessageBoardSectionMessageBoardThreadsPage`, `getMessageBoardSectionMessageBoardSectionsPage`, `getMessageBoardThreadsRankedPage`, `getMessageBoardThreadMessageBoardMessagesPage`, `getSiteBlogPostingImagesPage`, `getSiteBlogPostingsPage`, `getSiteContentElementsPage`, `getSiteContentSetByKeyContentSetElementsPage`, `getSiteContentSetByUuidContentSetElementsPage`, `getSiteContentStructuresPage`, `getSiteContentTemplatesPage`, `getSiteDocumentFoldersPage`, `getSiteDocumentsPage`, `getSiteKnowledgeBaseArticlesPage`, `getSiteKnowledgeBaseFoldersPage`, `getSiteMessageBoardMessagesPage`, `getSiteMessageBoardSectionsPage`, `getSiteMessageBoardThreadsPage`, `getSiteNavigationMenusPage`, `getSiteSitePagesPage`, `getSiteStructuredContentFoldersPage`, `getSiteStructuredContentsPage`, `getSiteWikiNodesPage`, `getStructuredContentFolderStructuredContentFoldersPage`, `getStructuredContentFolderStructuredContentsPage`, `getStructuredContentCommentsPage`, and `getWikiNodeWikiPagesPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/headless/headless-user-notification/headless-user-notification-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getMyUserNotificationsPage` and `getUserAccountUserNotificationsPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/object/object-rest-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getObjectEntriesPage` and `getScopeScopeKeyPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/apps/portal-search/portal-search-rest-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `postSearchPage` API.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/dxp/apps/commerce/headless/headless-commerce-machine-learning-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getSkuForecastsByMonthlyRevenuePage` API.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/dxp/apps/portal-workflow/portal-workflow-metrics-rest-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `getProcessMetricsPage`, `getProcessInstancesPage`, `getProcessNodeMetricsPage`, and `getProcessSLAsPage` APIs.
- **Reason**: This change sorts the parameters consistently.

**rest-openapi.yaml**
`modules/dxp/apps/search-experiences/search-experiences-rest-impl/rest-openapi.yaml`

- **Date**: Feb. 21, 2024
- **Ticket**: [LPD-18192](https://liferay.atlassian.net/browse/LPD-18192)
- **What Changed**: The parameters are reordered for the `postSearch` API.
- **Reason**: This change sorts the parameters consistently.

**com-fedex-ws**
`/modules/third-party/com-fedex-ws`

- **Date**: Feb. 22, 2024
- **Ticket**: [LPD-3475](https://liferay.atlassian.net/browse/LPD-3475)
- **What Changed**: The `com-fedex-ws` module is removed.
- **Reason**: The module is removed for security concerns.

**commerce-shipping-engine-fedex**
`/modules/apps/commerce/commerce-shipping-engine-fedex`

- **Date**: Feb. 22, 2024
- **Ticket**: [LPD-3475](https://liferay.atlassian.net/browse/LPD-3475)
- **What Changed**: The `commerce-shipping-engine-fedex` module is removed.
- **Reason**: The module is removed for security concerns.

**PanelCategoryRegistry.java**
`modules/apps/application-list/application-list-api/src/main/java/com/liferay/application/list/PanelCategoryRegistry.java`

- **Date**: Feb. 26, 2024
- **Ticket**: [LPS-196226](https://liferay.atlassian.net/browse/LPS-196226)
- **What Changed**: The `PanelCategoryRegistry` class is renamed to `PanelCategoryRegistryUtil` and moved to the `com.liferay.application.list.util` package.
- **Reason**: The `PanelCategoryRegistry` component has its own name as a service.

**CPDefinitionSpecificationOptionValueLocalService.java**
`modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/service/CPDefinitionSpecificationOptionValueLocalService.java`

- **Date**: Feb. 26, 2024
- **Ticket**: [LPD-13466](https://liferay.atlassian.net/browse/LPD-13466)
- **What Changed**: The `addCPDefinitionSpecificationOptionValue` and `updateCPDefinitionSpecificationOptionValue` methods have reordered parameters. Additionally, the `updateCPDefinitionSpecificationOptionValue` method has a new `String` (`key`) parameter.
- **Reason**: The new parameter is required to create fragments showing product specifications based on a key. The method parameters are reordered to sort them properly.

**BaseDBPartitionTestCase.java**
`modules/apps/portal/portal-db-partition-test-util/src/main/java/com/liferay/portal/db/partition/test/util/BaseDBPartitionTestCase.java`

- **Date**: Feb. 26, 2024
- **Ticket**: [LPD-17898](https://liferay.atlassian.net/browse/LPD-17898)
- **What Changed**: The `enableDBPartition` and `disableDBPartition` methods are removed.
- **Reason**: Database partition tests are only executed when the database partition is enabled, so these methods are unnecessary.

**AccountEntryEmailConfiguration.java**
`modules/apps/account/account-api/src/main/java/com/liferay/account/configuration/AccountEntryEmailConfiguration.java`

- **Date**: Feb. 28, 2024
- **Ticket**: [LPD-4319](https://liferay.atlassian.net/browse/LPD-4319)
- **What Changed**: The new `invitationEmailSenderEmailAddress` and `invitationEmailSenderName` settings are added.
- **Reason**: This change is necessary to define specific names or email addresses for users sending invitation emails.

**VirtualCPTypeTestUtil.java**
`modules/apps/commerce/commerce-product-type-virtual-test-util/src/main/java/com/liferay/commerce/product/type/virtual/test/util/VirtualCPTypeTestUtil.java`

- **Date**: Feb. 29, 2024
- **Ticket**: [LPD-15104](https://liferay.atlassian.net/browse/LPD-15104)
- **What Changed**: The `addJournalArticle(long)` method is removed.
- **Reason**: The method was not used.

**AssetListAssetEntryProvider.java**
`modules/apps/asset/asset-list-api/src/main/java/com/liferay/asset/list/asset/entry/provider/AssetListAssetEntryProvider.java`

- **Date**: Mar. 1, 2024
- **Ticket**: [LPD-19219](https://liferay.atlassian.net/browse/LPD-19219)
- **What Changed**: The `getAssetEntriesCount` method is removed. Additionally, the `getAssetEntries` method now returns an `InfoPage<AssetEntry>` instead of a `List<AssetEntry>`.
- **Reason**: This change improves the performance of getting asset entry counts and search results.

**SimilarResultsContributor.java**
`modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web-spi/src/main/java/com/liferay/portal/search/similar/results/web/spi/contributor/SimilarResultsContributor.java`

- **Date**: Mar. 4, 2024
- **Ticket**: [LPD-19398](https://liferay.atlassian.net/browse/LPD-19398)
- **What Changed**: The `SimilarResultsContributor` class is moved to the `portal-search-similar-results-web` module (now `modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web/src/main/java/com/liferay/portal/search/similar/results/web/internal/contributor/SimilarResultsContributor.java`).
- **Reason**: The `SimilarResultsContributor` class is only ever implemented or used in the `portal-search-similar-results-web`, and it is not an SPI.

**CommercePaymentEntryRefundType.java**
`modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/entry/CommercePaymentEntryRefundType.java`

- **Date**: Mar. 5, 2024
- **Ticket**: [LPD-15909](https://liferay.atlassian.net/browse/LPD-15909)
- **What Changed**: The new `getEnabled` method is added.
- **Reason**: This change is necessary to manage whether a `CommercePaymentEntryRefundType` is enabled.

**LearnMessageUtil.java**
`modules/apps/learn/learn-api/src/main/java/com/liferay/learn/LearnMessageUtil.java`

- **Date**: Mar. 6, 2024
- **Ticket**: [LPD-19760](https://liferay.atlassian.net/browse/LPD-19760)
- **What Changed**: The `dev` and `off` resources modes are added. If the resource mode is set to `dev`, Learn resources are read from `http://localhost:3062`. If the mode is `on`, they are read from https://s3.amazonaws.com/learn-resources.liferay.com. If the mode is `off`, the Learn tag library is disabled. 
- **Reason**: This change makes it easier to add new messages to Liferay Learn.

**CPSpecificationOptionLocalService.java**
`modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/service/CPSpecificationOptionLocalService.java`

- **Date**: Mar. 8, 2024
- **Ticket**: [LPD-13560](https://liferay.atlassian.net/browse/LPD-13560)
- **What Changed**: The `addCPSpecificationOption` and `updateCPSpecificationOption` methods have a new `double` (`priority`) parameter.
- **Reason**: This change is required to sort specifications in the storefront.

**CPSpecificationOptionService.java**
`modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/service/CPSpecificationOptionService.java`

- **Date**: Mar. 8, 2024
- **Ticket**: [LPD-13560](https://liferay.atlassian.net/browse/LPD-13560)
- **What Changed**: The `addCPSpecificationOption` and `updateCPSpecificationOption` methods have a new `double` (`priority`) parameter.
- **Reason**: This change is required to sort specifications in the storefront.

**FrontendTokenDefinitionRegistry.java**
`modules/apps/frontend-token/frontend-token-definition-api/src/main/java/com/liferay/frontend/token/definition/FrontendTokenDefinitionRegistry.java`

- **Date**: Mar. 12, 2024
- **Ticket**: [LPD-7080](https://liferay.atlassian.net/browse/LPD-7080)
- **What Changed**: The `getFrontendTokenDefinition` method's `String` (`themeId`) parameter is replaced with a new `LayoutSet` parameter.
- **Reason**: This change is required to retrieve a `FrontendTokenDefinition` added by a theme CSS client extension.

**ObjectStateLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectStateLocalServiceImpl.java`

- **Date**: Mar. 14, 2024
- **Ticket**: [LPD-20078](https://liferay.atlassian.net/browse/LPD-20078)
- **What Changed**: The new `fetchObjectStateFlowObjectState` method is added.
- **Reason**: This change is necessary to check whether an object state exists without having to wrap the code in a try-catch block.

**WorkspaceExtension.java**
`modules/sdk/gradle-plugins-workspace/src/main/java/com/liferay/gradle/plugins/workspace/WorkspaceExtension.java`

- **Date**: Mar. 14, 2024
- **Ticket**: [LPD-16636](https://liferay.atlassian.net/browse/LPD-16636)
- **What Changed**: The `getBundleChecksumMD5` and `setBundleChecksumMD5(java.lang.Object)` methods are removed. Instead, use the `getBundleChecksumSHA512` and `setBundleChecksumSHA512(java.lang.Object)` methods. The `getDefaultBundleChecksumMD5`, `getDefaultBundleUrl`, `getProduceInfo`, `getBundleTokenEmailAddress`, `getBundleTokenPassword`, `getBundleTokenPasswordFile`, `isBundleTokenDownload`, `isBundleTokenForce`, `isBundleTokenDownload(java.lang.Object)`, `setBundleTokenEmailAddress(java.lang.Object)`, `setBundleTokenForce(java.lang.Object)`, `setBundleTokenPassword(java.lang.Object)`, and `setBundleTokenPasswordFile(java.lang.Object)` methods and the inner `ProductInfo` class are also removed.
- **Reason**: Bundles are now instead verified with a checksum using the SHA-512 algorithm. The details of retrieving release info from the product key is now completely internal, so this implementation is no longer useful. Properties that relate to release data using the product key have been removed (though individual details can still be overridden manually in the DSL). Authentication is no longer needed to download bundles.

**BasePortalToolsTask.java**
`modules/sdk/gradle-plugins/src/main/java/com/liferay/gradle/plugins/task/BasePortalToolsTask.java`

- **Date**: Mar. 15, 2024
- **Ticket**: [LPD-15162](https://liferay.atlassian.net/browse/LPD-15162)
- **What Changed**: The `getMain` method is removed.
- **Reason**: The underlying `JavaExec` class removed the method with Gradle 8.

**LayoutPageTemplateCollectionTreeNodeItemSelectorCriterion.java**
`modules/apps/layout/layout-page-template-item-selector-api/src/main/java/com/liferay/layout/page/template/item/selector/criterion/LayoutPageTemplateCollectionTreeNodeItemSelectorCriterion.java`

- **Date**: Mar. 25, 2024
- **Ticket**: [LPD-19160](https://liferay.atlassian.net/browse/LPD-19160)
- **What Changed**: The `getLayoutPageTemplateCollectionId` method is replaced by the new `getLayoutPageTemplateCollectionIds` method, which returns a `long[]` value. The `setLayoutPageTemplateCollectionId(long)` method is also replaced by the new `setLayoutPageTemplateCollectionIds(long[])` method.
- **Reason**: This change is necessary to support setting multiple layout page template collection IDs.

**util.js**
`modules/apps/frontend-js/frontend-js-aui-web/src/main/resources/META-INF/resources/liferay/util.js`

- **Date**: Mar. 28, 2024
- **Ticket**: [LPD-18840](https://liferay.atlassian.net/browse/LPD-18840)
- **What Changed**: The `selectEntity` function is no longer provided.
- **Reason**: The function was no longer used.

**ObjectEntryLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectEntryLocalServiceImpl.java`

- **Date**: Mar. 28, 2024
- **Ticket**: [LPD-19409](https://liferay.atlassian.net/browse/LPD-19409)
- **What Changed**: The `getValuesList` method replaces the `OrderByExpression[]` parameter with a `Sort[]` parameter.
- **Reason**: This change is necessary because the expressions must be calculated in the object service layer.

**BaseNotificationType.java**
`modules/apps/notification/notification-api/src/main/java/com/liferay/notification/type/BaseNotificationType.java`

- **Date**: Mar. 28, 2024
- **Ticket**: [LPD-20526](https://liferay.atlassian.net/browse/LPD-20526)
- **What Changed**: The `formatContent` and `formatLocalizedContent` methods is removed.
- **Reason**: The `formatContent` logic is moved to the `DefaultEmailProvider` class. The `formatLocalizedContent` logic is moved to the `NotificationTypeUtil` class.

**CommercePaymentEntryRefundTypeRegistry.java**
`modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/entry/CommercePaymentEntryRefundTypeRegistry.java`

- **Date**: Mar. 28, 2024
- **Ticket**: [LPD-15909](https://liferay.atlassian.net/browse/LPD-15909)
- **What Changed**: The `getCommercePaymentEntryRefundType` and `getCommercePaymentEntryRefundTypes` methods have a new `long` (`companyId`) parameter.
- **Reason**: This change is necessary to manage different configurations per company.

**AccountListTypeConstants.java**
`modules/apps/account/account-api/src/main/java/com/liferay/account/constants/AccountListTypeConstants.java`

- **Date**: Mar. 29, 2024
- **Ticket**: [LPD-18486](https://liferay.atlassian.net/browse/LPD-18486)
- **What Changed**: The `ACCOUNT_ENTRY_PHONE_TYPE_TOOL_FREE` constant is renamed to `ACCOUNT_ENTRY_PHONE_TYPE_TOLL_FREE`.
- **Reason**: This change corrects a typo in the constant name.

**DefaultCommerceOrderValidatorImpl.java**
`modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/order/DefaultCommerceOrderValidatorImpl.java`

- **Date**: Mar. 29, 2024
- **Ticket**: [LPD-3387](https://liferay.atlassian.net/browse/LPD-3387)
- **What Changed**: `DefaultCommerceOrderValidatorImpl` has a new check for commerce order status.
- **Reason**: This change requires commerce orders to have the open status to add an order item.

**ObjectDefinitionLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectDefinitionLocalServiceImpl.java`

- **Date**: Apr. 3, 2024
- **Ticket**: [LPD-19574](https://liferay.atlassian.net/browse/LPD-19574)
- **What Changed**: The `addObjectDefinition` method has a new `long` (`rootObjectDefinitionId`) parameter.
- **Reason**: This change is necessary to associate `ObjectDefinition` objects with their root object definitions to allow imports.

**InputLocalized.tsx**
`modules/apps/frontend-js/frontend-js-components-web/src/main/resources/META-INF/resources/forms/input/InputLocalized.tsx`

- **Date**: Apr. 3, 2024
- **Ticket**: [LPD-1952](https://liferay.atlassian.net/browse/LPD-1952)
- **What Changed**: `InputLocalized` no longer receives the `disableFlag` property.
- **Reason**: This change improves the `InputLocalized` component's usability.

**PlacedOrderItemResourceImpl.java**
`modules/apps/commerce/headless/headless-commerce/headless-commerce-delivery-order-impl/src/main/java/com/liferay/headless/commerce/delivery/order/internal/resource/v1_0/PlacedOrderItemResourceImpl.java`

- **Date**: Apr. 5, 2024
- **Ticket**: [LPD-20059](https://liferay.atlassian.net/browse/LPD-20059)
- **What Changed**: The `getPlacedOrderPlacedOrdItemsPage` method has new `String` (`search`) and `Sort[]` (`sorts`) parameters.
- **Reason**: This change is necessary to allow searches through Placed Order Items to initiate a Return.

**CTDisplayRendererRegistry.java**
`modules/apps/change-tracking/change-tracking-spi/src/main/java/com/liferay/change/tracking/spi/display/CTDisplayRendererRegistry.java`

- **Date**: Apr. 9, 2024
- **Ticket**: [LPD-19748](https://liferay.atlassian.net/browse/LPD-19748)
- **What Changed**: A new `isWorkflowEnabled(CTEntry, T)` generic method is added.
- **Reason**: This change is required to check whether workflow is enabled for a `CTEntry` object.

**IndexNameBuilder.java**
`modules/apps/portal-search/portal-search-api/src/main/java/com/liferay/portal/search/index/IndexNameBuilder.java`

- **Date**: Apr. 9, 2024
- **Ticket**: [LPD-20777](https://liferay.atlassian.net/browse/LPD-20777)
- **What Changed**: The new `getIndexNamePrefix` method is added.
- **Reason**: This change is required to identify Liferay indices in the search engine cluster.

**TranslationEntryLocalService.java**
`modules/apps/translation/translation-api/src/main/java/com/liferay/translation/service/TranslationEntryLocalService.java`

- **Date**: Apr. 13, 2024
- **Ticket**: [LPD-22843](https://liferay.atlassian.net/browse/LPD-22843)
- **What Changed**: The `addOrUpdateTranslationEntry` method has a new `String` (`languageId`) parameter.
- **Reason**: This change is necessary to perform translations correctly.

**TranslationEntryLocalServiceUtil.java**
`modules/apps/translation/translation-api/src/main/java/com/liferay/translation/service/TranslationEntryLocalServiceUtil.java`

- **Date**: Apr. 13, 2024
- **Ticket**: [LPD-22843](https://liferay.atlassian.net/browse/LPD-22843)
- **What Changed**: The `addOrUpdateTranslationEntry` method has a new `String` (`languageId`) parameter.
- **Reason**: This change is necessary to perform translations correctly.

**TranslationEntryLocalServiceWrapper.java**
`modules/apps/translation/translation-api/src/main/java/com/liferay/translation/service/TranslationEntryLocalServiceWrapper.java`

- **Date**: Apr. 13, 2024
- **Ticket**: [LPD-22843](https://liferay.atlassian.net/browse/LPD-22843)
- **What Changed**: The `addOrUpdateTranslationEntry` method has a new `String` (`languageId`) parameter.
- **Reason**: This change is necessary to perform translations correctly.

**TranslationEntryService.java**
`modules/apps/translation/translation-api/src/main/java/com/liferay/translation/service/TranslationEntryService.java`

- **Date**: Apr. 13, 2024
- **Ticket**: [LPD-22843](https://liferay.atlassian.net/browse/LPD-22843)
- **What Changed**: The `addOrUpdateTranslationEntry` method has a new `String` (`languageId`) parameter.
- **Reason**: This change is necessary to perform translations correctly.

**TranslationEntryServiceUtil.java**
`modules/apps/translation/translation-api/src/main/java/com/liferay/translation/service/TranslationEntryServiceUtil.java`

- **Date**: Apr. 13, 2024
- **Ticket**: [LPD-22843](https://liferay.atlassian.net/browse/LPD-22843)
- **What Changed**: The `addOrUpdateTranslationEntry` method has a new `String` (`languageId`) parameter.
- **Reason**: This change is necessary to perform translations correctly.

**TranslationEntryServiceWrapper.java**
`modules/apps/translation/translation-api/src/main/java/com/liferay/translation/service/TranslationEntryServiceWrapper.java`

- **Date**: Apr. 13, 2024
- **Ticket**: [LPD-22843](https://liferay.atlassian.net/browse/LPD-22843)
- **What Changed**: The `addOrUpdateTranslationEntry` method now has a new `String` (`languageId`) parameter.
- **Reason**: This change is necessary to perform translations correctly.

**CommerceOrderItemQuantityFormatter.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/util/CommerceOrderItemQuantityFormatter.java`

- **Date**: Apr. 17, 2024
- **Ticket**: [LPD-3472](https://liferay.atlassian.net/browse/LPD-3472)
- **What Changed**: New methods are added: `format(CommerceOrderItem, Locale)`, `parse(ActionRequest, String)`, and `parse(String, Locale)`.
- **Reason**: This change is necessary to parse non-US locale inputs for price and quantity correctly.

**CommerceQuantityFormatter.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/util/CommerceQuantityFormatter.java`

- **Date**: Apr. 17, 2024
- **Ticket**: [LPD-3472](https://liferay.atlassian.net/browse/LPD-3472)
- **What Changed**: A new `parse(String, Locale)` method is added.
- **Reason**: This change is necessary to parse non-US locale inputs for price and quantity correctly.

**ObjectEntryDTOConverter.java**
`modules/apps/object/object-rest-impl/src/main/java/com/liferay/object/rest/internal/dto/v1_0/converter/ObjectEntryDTOConverter.java`

- **Date**: Apr. 17, 2024
- **Ticket**: [LPD-21413](https://liferay.atlassian.net/browse/LPD-21413)
- **What Changed**: Translatable object fields now use the preferred `Locale` given by the `DTOConverterContext` instead of the user's configured `languageId`.
- **Reason**: The new implementation returns the appropriate translatable object field values for the language in the `Accept-Language` header.

**LayoutUtilityPageEntryLocalServiceImpl.java**
`modules/apps/layout/layout-utility-page-service/src/main/java/com/liferay/layout/utility/page/service/impl/LayoutUtilityPageEntryLocalServiceImpl.java`

- **Date**: Apr. 18, 2024
- **Ticket**: [LPD-19863](https://liferay.atlassian.net/browse/LPD-19863)
- **What Changed**: The `addLayoutUtilityPageEntry` methods have new `String` (`friendlyURL`) and `boolean` (`privateLayout`) parameters.
- **Reason**: This change allows utility pages to be created in a public layout.

**COREntryConfiguration.java**
`modules/apps/commerce/commerce-order-rule-api/src/main/java/com/liferay/commerce/order/rule/configuration/COREntryConfiguration.java`

- **Date**: Apr. 18, 2024
- **Ticket**: [LPD-23389](https://liferay.atlassian.net/browse/LPD-23389)
- **What Changed**: The `enabled` method is removed.
- **Reason**: The `enabled` method was originally introduced as a feature flag.

**MockInfoServiceRegistrationHolder.java**
`modules/apps/info/info-test-util/src/main/java/com/liferay/info/test/util/MockInfoServiceRegistrationHolder.java`

- **Date**: Apr. 22, 2024
- **Ticket**: [LPD-23742](https://liferay.atlassian.net/browse/LPD-23742)
- **What Changed**: The `MockInfoServiceRegistrationHolder` constructor now has new `MockObject` and `Portal` parameters.
- **Reason**: This change adds display page support to the mock info framework.

**MockObject.java**
`modules/apps/info/info-test-util/src/main/java/com/liferay/info/test/util/model/MockObject.java`

- **Date**: Apr. 22, 2024
- **Ticket**: [LPD-23742](https://liferay.atlassian.net/browse/LPD-23742)
- **What Changed**: A new constructor is added (`MockObject(long, boolean, boolean)`).
- **Reason**: This change adds permission support to the mock info framework.

**CommerceAddressFormatterImpl.java**
`modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/address/CommerceAddressFormatterImpl.java`

- **Date**: Apr. 22, 2024
- **Ticket**: [LPD-3491](https://liferay.atlassian.net/browse/LPD-3491)
- **What Changed**: The `getBasicAddress` and `getDescriptiveAddress` methods have a new `Locale` parameter.
- **Reason**: This change adds support for localized country names.

**ClientExtensionEntryConstants.java**
`modules/apps/client-extension/client-extension-api/src/main/java/com/liferay/client/extension/constants/ClientExtensionEntryConstants.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-22159](https://liferay.atlassian.net/browse/LPD-22159)
- **What Changed**: The `TYPE_THEME_JS` constant (for theme JS client extensions) is removed.
- **Reason**: The theme JS client extension type is not used because it's unnecessary.

**ThemeJSCET.java**
`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/ThemeJSCET.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-22159](https://liferay.atlassian.net/browse/LPD-22159)
- **What Changed**: The `ThemeJSCET` class is removed.
- **Reason**: The theme JS client extension type is not used because it's unnecessary.

**TemplateEntryLocalServiceImpl.java**
`modules/apps/template/template-service/src/main/java/com/liferay/template/service/impl/TemplateEntryLocalServiceImpl.java`

- **Date**: Apr. 27, 2024
- **Ticket**: [LPD-24010](https://liferay.atlassian.net/browse/LPD-24010)
- **What Changed**: The `addTemplateEntry` method has a new `ExternalReferenceCode` parameter.
- **Reason**: The new parameter adds support for external reference codes in `TemplateEntry` entities.

**FieldPredicateProvider.java**
`modules/apps/object/object-api/src/main/java/com/liferay/object/odata/filter/expression/field/predicate/provider/FieldPredicateProvider.java`

- **Date**: Apr. 29, 2024
- **Ticket**: [LPD-22155](https://liferay.atlassian.net/browse/LPD-22155)
- **What Changed**: The `getContainsPredicate` method has a new `String` parameter (`fieldName`), the `getInPredicate` method has a new `Object` parameter (`left`), and the `getStartsWithPredicate` method has a new `String` parameter (`fieldName`).
- **Reason**: These parameters are necessary to enable filtering by `MultiselectPicklist` Object fields.

**WorkflowDefinitionConfiguration.java**
`modules/apps/portal-workflow/portal-workflow-api/src/main/java/com/liferay/portal/workflow/configuration/WorkflowDefinitionConfiguration.java`

- **Date**: Apr. 29, 2024
- **Ticket**: [LPD-23925](https://liferay.atlassian.net/browse/LPD-23925)
- **What Changed**: The new `preventNotifyingAncestorSites` method is added.
- **Reason**: This new method is needed to configure notifications to notify ancestor sites.

**LayoutPageTemplateCollectionServiceImpl.java**
`modules/apps/layout/layout-page-template-service/src/main/java/com/liferay/layout/page/template/service/impl/LayoutPageTemplateCollectionServiceImpl.java`

- **Date**: Apr. 29, 2024
- **Ticket**: [LPD-24298](https://liferay.atlassian.net/browse/LPD-24298)
- **What Changed**: The `addLayoutPageTemplateCollection` method has a new `ExternalReferenceCode` parameter.
- **Reason**: The new parameter adds support for external reference codes in `LayoutPageTemplateCollection` entities.

**AssetListEntryLocalServiceImpl.java**
`modules/apps/asset/asset-list-service/src/main/java/com/liferay/asset/list/service/impl/AssetListEntryLocalServiceImpl.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24142](https://liferay.atlassian.net/browse/LPD-24142)
- **What Changed**: The `addAssetListEntry` method now has a new `ExternalReferenceCode` parameter.
- **Reason**: The new parameter adds support for external reference codes in `AssetList` entities.

**AccountEntryLocalServiceUtil.java**
`modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountEntryLocalServiceUtil.java`

- **Date**: May 1, 2024
- **Ticket**: [LPD-24745](https://liferay.atlassian.net/browse/LPD-24745)
- **What Changed**: The `setService` method is removed.
- **Reason**: The `AccountEntryLocalServiceUtil` class tracks the service via `Snapshot`, so setting it explicitly is no longer necessary.

### Changes in `portal-impl` Classes

**PortalImpl.java**
`portal-impl/src/com/liferay/portal/util/PortalImpl.java`

- **Date**: Feb. 22, 2024
- **Ticket**: [LPD-2110](https://liferay.atlassian.net/browse/LPD-2110)
- **What Changed**: The `LocalizedFriendlyUrl` method is removed.
- **Reason**: The code was moved into the `FriendlyURLServlet` class because it's only used for this servlet. 

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `transaction.isolation.counter` portal property is removed.
- **Reason**: The `CounterLocalService` code is refactored to manage transactions directly instead of using an AOP proxy.

**PropsValues.java**
`portal-impl/src/com/liferay/portal/util/PropsValues.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `TRANSACTION_ISOLATION_COUNTER` field is removed.
- **Reason**: The `CounterLocalService` code is refactored to manage transactions directly instead of using an AOP proxy.

**PortalSessionCreator.java**
`portal-impl/src/com/liferay/portal/servlet/PortalSessionCreator.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `PortalSessionCreator` class is removed.
- **Reason**: The logic from `PortalSessionCreator` is moved into `DependencyManagerSyncUtil`'s `registerSyncCallable` method.

**PortalSessionDestroyer.java**
`portal-impl/src/com/liferay/portal/servlet/PortalSessionDestroyer.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `PortalSessionDestroyer` class is removed.
- **Reason**: The logic from `PortalSessionCreator` is moved into `DependencyManagerSyncUtil`'s `registerSyncCallable` method.

## Changes in `portal-kernel` Classes

**DLAppLocalService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLAppLocalService.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-6960](https://liferay.atlassian.net/browse/LPD-6960)
- **What Changed**: The `addFileEntry(String, long, long, long, String, String, byte[], Date, Date, ServiceContext)`, `addFileEntry(String, long, long, long, String, String, String, String, String, String, byte[], Date, Date, ServiceContext)`, `addFileEntry(String, long, long, long, String, String, String, String, String, String, File, Date, Date, ServiceContext)`, and `addFileEntry(String, long, long, long, String, String, String, String, String, String, InputStream, long, Date, Date, ServiceContext)` methods all have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for adding file entries and file versions with display dates.

**DLAppService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLAppService.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-6960](https://liferay.atlassian.net/browse/LPD-6960)
- **What Changed**: The `addFileEntry(String, long, long, String, String, String, String, String, String, byte[], Date, Date, ServiceContext)`, `addFileEntry(String, long, long, String, String, String, String, String, String, File, Date, Date, ServiceContext)`, and `addFileEntry(String, long, long, String, String, String, String, String, String, InputStream, long, Date, Date, ServiceContext)` methods all have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for adding file entries and file versions with display dates.

**BaseRepositoryImpl.java**
`portal-kernel/src/com/liferay/portal/kernel/repository/BaseRepositoryImpl.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-6960](https://liferay.atlassian.net/browse/LPD-6960)
- **What Changed**: The `addFileEntry(String, long, long, String, String, String, String, String, String, File, Date, Date, ServiceContext)` and `addFileEntry(String, long, long, String, String, String, String, String, String, InputStream, long, Date, Date, ServiceContext)` methods both have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for adding file entries and file versions with display dates.

**DocumentRepository.java**
`portal-kernel/src/com/liferay/portal/kernel/repository/DocumentRepository.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-6960](https://liferay.atlassian.net/browse/LPD-6960)
- **What Changed**: The `addFileEntry(String, long, long, String, String, String, String, String, String, File, Date, Date, ServiceContext)` and `addFileEntry(String, long, long, String, String, String, String, String, String, InputStream, long, Date, Date, ServiceContext)` methods both have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for adding file entries and file versions with display dates.

**DLFileEntryLocalService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLFileEntryLocalService.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-6960](https://liferay.atlassian.net/browse/LPD-6960)
- **What Changed**: The `addFileEntry(String, long, long, long, String, String, String, String, String, String, long, Map<String, DDMFormValues>, File, InputStream, long, Date, Date, ServiceContext)` method has a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for adding file entries and file versions with display dates.

**DLFileEntryService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLFileEntryService.java`

- **Date**: Feb. 9, 2024
- **Ticket**: [LPD-6960](https://liferay.atlassian.net/browse/LPD-6960)
- **What Changed**: The `addFileEntry(String, long, long, long, String, String, String, String, String, String, long, Map<String, DDMFormValues>, File, InputStream, long, Date, Date, ServiceContext)` method has a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for adding file entries and file versions with display dates.

**DLAppLocalService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLAppLocalService.java`

- **Date**: Feb. 12, 2024
- **Ticket**: [LPD-16993](https://liferay.atlassian.net/browse/LPD-16993)
- **What Changed**: The `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, byte[], Date, Date, ServiceContext)`, `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, File, Date, Date, ServiceContext)`, and `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, InputStream, long, Date, Date, ServiceContext)` methods all have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for updating display dates for file entries and file versions.

**DLAppService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLAppService.java`

- **Date**: Feb. 12, 2024
- **Ticket**: [LPD-16993](https://liferay.atlassian.net/browse/LPD-16993)
- **What Changed**: The `updateFileEntry(long, String, String, String, String, String, String, DLVersionNumberIncrease, byte[], Date, Date, ServiceContext)`, `updateFileEntry(long, String, String, String, String, String, String, DLVersionNumberIncrease, File, Date, Date, ServiceContext)`, `updateFileEntry(long, String, String, String, String, String, String, DLVersionNumberIncrease, InputStream, long, Date, Date, ServiceContext)`, `updateFileEntryAndCheckIn(long, String, String, String, String, String, String, DLVersionNumberIncrease, File, Date, Date, ServiceContext)`, and `updateFileEntryAndCheckIn(long, String, String, String, String, String, String, DLVersionNumberIncrease, InputStream, long, Date, Date, ServiceContext)` methods all have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for updating display dates for file entries and file versions.

**BaseRepositoryImpl.java**
`portal-kernel/src/com/liferay/portal/kernel/repository/BaseRepositoryImpl.java`

- **Date**: Feb. 12, 2024
- **Ticket**: [LPD-16993](https://liferay.atlassian.net/browse/LPD-16993)
- **What Changed**: The `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, File, Date, Date, ServiceContext)` and `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, InputStream, long, Date, Date, ServiceContext)` methods both have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for updating display dates for file entries and file versions.

**DocumentRepository.java**
`portal-kernel/src/com/liferay/portal/kernel/repository/DocumentRepository.java`

- **Date**: Feb. 12, 2024
- **Ticket**: [LPD-16993](https://liferay.atlassian.net/browse/LPD-16993)
- **What Changed**: The `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, File, Date, Date, ServiceContext)` and `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, InputStream, long, Date, Date, ServiceContext)` methods both have a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for updating display dates for file entries and file versions.

**DLFileEntryLocalService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLFileEntryLocalService.java`

- **Date**: Feb. 12, 2024
- **Ticket**: [LPD-16993](https://liferay.atlassian.net/browse/LPD-16993)
- **What Changed**: The `updateFileEntry(long, long, String, String, String, String, String, String, DLVersionNumberIncrease, long, Map<String, DDMFormValues>, File, InputStream, long, Date, Date, ServiceContext)` method has a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for updating display dates for file entries and file versions.

**DLFileEntryService.java**
`portal-kernel/src/com/liferay/document/library/kernel/service/DLFileEntryService.java`

- **Date**: Feb. 12, 2024
- **Ticket**: [LPD-16993](https://liferay.atlassian.net/browse/LPD-16993)
- **What Changed**: The `updateFileEntry(long, String, String, String, String, String, String, DLVersionNumberIncrease, long, Map<String, DDMFormValues>, File, InputStream, long, Date, Date, ServiceContext)` method has a new `Date` (`displayDate`) parameter.
- **Reason**: The new parameter allows for updating display dates for file entries and file versions.

**PortalUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/util/PortalUtil.java`

- **Date**: Feb. 22, 2024
- **Ticket**: [LPD-2110](https://liferay.atlassian.net/browse/LPD-2110)
- **What Changed**: The `getLocalizedFriendlyURL` method is removed.
- **Reason**: The `PortalImpl.getLocalizedFriendlyURL` method is also removed, so this method is no longer needed.

**Portal.java**
`portal-kernel/src/com/liferay/portal/kernel/util/Portal.java`

- **Date**: Feb. 22, 2024
- **Ticket**: [LPD-2110](https://liferay.atlassian.net/browse/LPD-2110)
- **What Changed**: The `getLocalizedFriendlyURL` method is removed.
- **Reason**: The `PortalImpl.getLocalizedFriendlyURL` method is also removed, so this method is no longer needed.

**FileVersion.java**
`portal-kernel/src/com/liferay/portal/kernel/repository/model/FileVersion.java`

- **Date**: Feb. 28, 2024
- **Ticket**: [LPD-6962](https://liferay.atlassian.net/browse/LPD-6962)
- **What Changed**: The new `isScheduled` method is added, which returns a `Date` object.
- **Reason**: The new method allows for checking whether a `FileVersion`'s status is enabled (`WorkflowConstants.STATUS_SCHEDULED`), if it's not in an external repository.

**RemotePreference.java**
`portal-kernel/src/com/liferay/portal/kernel/util/RemotePreference.java`

- **Date**: Mar. 16, 2024
- **Ticket**: [LPD-20659](https://liferay.atlassian.net/browse/LPD-20659)
- **What Changed**: The `RemotePreference` class is removed.
- **Reason**: The `RemotePreference` class is not used.

**InfrastructureUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/util/InfrastructureUtil.java`

- **Date**: Mar. 27, 2024
- **Ticket**: [LPD-19928](https://liferay.atlassian.net/browse/LPD-19928)
- **What Changed**: The `getMailSession` method is removed.
- **Reason**: The `getMailSessionLogic` is moved into `MailServiceImpl`, because it's the only class that uses it.

**BaseTransactionExecutor.java**
`portal-impl/src/com/liferay/portal/spring/transaction/BaseTransactionExecutor.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `BaseTransactionExecutor` class is removed.
- **Reason**: The `BaseTransactionExecutor` class is no longer used.

**CounterTransactionExecutor.java**
`portal-impl/src/com/liferay/portal/spring/transaction/CounterTransactionExecutor.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `CounterTransactionExecutor` class is removed.
- **Reason**: The `CounterTransactionExecutor` class is no longer used.

**DefaultTransactionExecutor.java**
`portal-impl/src/com/liferay/portal/spring/transaction/DefaultTransactionExecutor.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `DefaultTransactionExecutor` class no longer extends `BaseTransactionExecutor`. It now implements `TransactionExecutor` itself instead. A new `execute(TransactionAttributeAdapter, UnsafeSupplier<T, Throwable>)` method is added.
- **Reason**: The `BaseTransactionExecutor` class is removed.

**Isolation.java**
`portal-kernel/src/com/liferay/portal/kernel/transaction/Isolation.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `COUNTER` field is removed.
- Reason**: The `CounterLocalService` code is refactored to manage transactions directly instead of using an AOP proxy.

**TransactionDefinition.java**
`portal-kernel/src/com/liferay/portal/kernel/transaction/TransactionDefinition.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `ISOLATION_COUNTER` field is removed.
- **Reason**: The `CounterLocalService` code is refactored to manage transactions directly instead of using an AOP proxy.

**PropsKeys.java**
`portal-kernel/src/com/liferay/portal/kernel/util/PropsKeys.java`

- **Date**: Apr. 24, 2024
- **Ticket**: [LPD-24115](https://liferay.atlassian.net/browse/LPD-24115)
- **What Changed**: The `TRANSACTION_ISOLATION_COUNTER` field is removed.
- **Reason**: The `CounterLocalService` code is refactored to manage transactions directly instead of using an AOP proxy.

**HotDeployEvent.java**
`portal-kernel/src/com/liferay/portal/kernel/deploy/hot/HotDeployEvent.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `addPortalLifeCycle(PortalLifecycle)` and `flushInits` methods are removed.
- **Reason**: These methods are no longer used.

**HotDeployUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/deploy/hot/HotDeployUtil.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `registerDependentPortalLifecycle(String, PortalLifecycle)` method is removed.
- **Reason**: This method is no longer used.

**InvokerFilter.java**
`portal-kernel/src/com/liferay/portal/kernel/servlet/filters/invoker/InvokerFilter.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `InvokerFilter` class no longer extends `BasePortalLifecycle`.
- **Reason**: The `PortalLifecycle` API is no longer needed.

**BasePortalLifecycle.java**
`portal-kernel/src/com/liferay/portal/kernel/util/BasePortalLifecycle.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `BasePortalLifecycle` class is removed.
- **Reason**: The `PortalLifecycle` API is no longer needed.

**PortalLifecycle.java**
`portal-kernel/src/com/liferay/portal/kernel/util/PortalLifecycle.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `PortalLifecycle` class is removed.
- **Reason**: The `PortalLifecycle` API is no longer needed.

**PortalLifecycleUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/util/PortalLifecycleUtil.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `PortalLifecycleUtil` class is removed.
- **Reason**: The `PortalLifecycle` API is no longer needed.

**LogContextRegistryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/log/LogContextRegistryUtil.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `LogContextRegistryUtil` class is removed.
- **Reason**: The logic from `LogContextRegistryUtil` is moved into `Log4jLogContextLogWrapper`.

**ModuleServiceLifecycle.java**
`portal-kernel/src/com/liferay/portal/kernel/module/framework/ModuleServiceLifecycle.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `DATABASE_INITIALIZED` and `SPRING_INITIALIZED` fields are removed.
- **Reason**: These states are no longer used.

### Changes in Taglibs

**InputPermissionsTag.java**
`util-taglib/src/com/liferay/taglib/ui/InputPermissionsTag.java`

- **Date**: Feb. 20, 2024
- **Ticket**: [LPD-15184](https://liferay.atlassian.net/browse/LPD-15184)
- **What Changed**: The `doTag` method now has a new `boolean` (`showAllRoles`) parameter. The new `isShowAllRoles` and `setShowAllRoles(boolean)` methods are also added.
- **Reason**: The new parameter allows for viewing all roles when configuring permissions.

**JspFactoryServletContainerInitializer.java**
`util-taglib/src/com/liferay/taglib/servlet/JspFactoryServletContainerInitializer.java`

- **Date**: Apr. 30, 2024
- **Ticket**: [LPD-24699](https://liferay.atlassian.net/browse/LPD-24699)
- **What Changed**: The `JspFactoryServletContainerInitializer` class is removed.
- **Reason**: The `JspFactoryServletContainerInitializer` class is no longer used.

## 2024 Q1 Release

### Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change**                                         | **Description**                                                                                                                                                                                       | **References**                                                |
|:------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------|
| **Selecting Guest Role for Segments**                       | You can no longer select the Guest role when editing a Segment. The option was removed because selecting this role would not work properly.                                                           | [LPS-199579](https://liferay.atlassian.net/browse/LPS-199579) |
| **Breadcrumb Portlet Access to Sites for Guests**           | Guests can now access sites via the Breadcrumb portlet as long as they are accessible to Guests. Previously, the portlet incorrectly denied access if the site had restricted or private membership.  | [LPS-200487](https://liferay.atlassian.net/browse/LPS-200487) |
| **Selecting Administrator Role for Segments**               | You can no longer assign regular administrators to Segments (like Site Administrators and Site Owners). Te option was removed because it caused some unexpected behaviors.                            | [LPD-4335](https://liferay.atlassian.net/browse/LPD-4335)     |
| **Case-Sensitive Tags**                                     | Tag names are now case-sensitive.                                                                                                                                                                     | [LPD-6882](https://liferay.atlassian.net/browse/LPD-6882)     |
| **Filtering Web Content**                                   | All web content filters now only apply to the currently selected folder. This change makes web content filter behavior more consistent.                                                               | [LPD-6710](https://liferay.atlassian.net/browse/LPD-6710)     |
| **Searching Web Content with Filters**                      | If you have a filter applied when searching web content, performing a new search now clears the filter.                                                                                               | [LPD-6710](https://liferay.atlassian.net/browse/LPD-6710)     |
| **Web Content Status Filter Names**                         | The filter options for web content status have been renamed: "With approved versions" is now "Approved," "With scheduled versions" is now "Scheduled," and "With expired versions" is now "Expired."  | [LPD-6709](https://liferay.atlassian.net/browse/LPD-6709)     |
| **Article ID in Web Content Template Editor**               | The `reserved-article-id` variable is renamed to `articleId` for web content templates. The `externalReferenceCode` and `resourcePrimKey` (i.e., the `structuredContentId`) variables are also added. | [LPS-203949](https://liferay.atlassian.net/browse/LPS-203949) |
| **Utility Page Configurations**                             | The general configuration icon for utility pages no longer appears on the Page Design Options panel. You must now access them via the Actions menu on the Utility Pages page.                         | [LPD-4459](https://liferay.atlassian.net/browse/LPD-4459)     |
| **Allow Manual Membership Management Option for New Sites** | When creating a new site, the Allow Manual Membership Management option is disabled by default.                                                                                                       | [LPS-191374](https://liferay.atlassian.net/browse/LPS-191374) |
| **Configuration for Auto-extending Session Timeouts**       | The `session.timeout.auto.extend` and `session.timeout.auto.extend.offset` portal properties are now configured in site, instance, or system settings instead.                                        | [LPS-199234](https://liferay.atlassian.net/browse/LPS-199234) |

### Changes in Module Source Code

**PersonalMenuEntry.java**
`modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/PersonalMenuEntry.java`

- **Date**: Nov. 6, 2023
- **Ticket**: [LPS-198527](https://liferay.atlassian.net/browse/LPS-198527)
- **What Changed**: The new `getOnClickJSModuleURL` method is added.
- **Reason**: This change allows for loading a JS module at run-time by clicking on Personal Menu entries.

**CacheControlConfiguration.java**
`modules/apps/document-library/document-library-web/src/main/java/com/liferay/document/library/web/internal/configuration/CacheControlConfiguration.java`

- **Date**: Nov. 6, 2023
- **Ticket**: [LPS-200359](https://liferay.atlassian.net/browse/LPS-200359)
- **What Changed**: A new configuration is added to not cache documents by default.
- **Reason**: This configuration is the new default to improve security.

**BaseAMImageCounter.java**
`modules/apps/adaptive-media/adaptive-media-image-api/src/main/java/com/liferay/adaptive/media/image/counter/BaseAMImageCounter.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
- **What Changed**: The `BaseAMImageCounter` class is a new base class for `AMImageCounter` implementations to use.
- **Reason**: This class helps implement `AMImageCounter` with common logic implementations.

**BaseAMImageOptimizer.java**
`modules/apps/adaptive-media/adaptive-media-image-api/src/main/java/com/liferay/adaptive/media/image/optimizer/BaseAMImageOptimizer.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
- **What Changed**: The `BaseAMImageOptimizer` class is a new base class for `AMImageOptimizer` implementations to use.
- **Reason**: This class helps implement `AMImageOptimizer` with common logic implementations.

**DLFileEntryConfigurationProvider.java**
`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
- **What Changed**: The new `getGroupPreviewableProcessorMaxSizeMap` method is added to return all group values with the given `previewableProcessorMaxSize` attribute.
- **Reason**: This change helps filter by groups with specific attribute values, instead of getting the attribute for all types.

**AuditMessageFactoryImpl.java**
`modules/apps/portal-security-audit/portal-security-audit-impl/src/main/java/com/liferay/portal/security/audit/internal/AuditMessageFactoryImpl.java`

* __Date__ Nov. 7, 2023
- **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
- **What Changed**: The class is removed. The logic previously in `AuditMessageFactoryImpl` is now implemented in `AuditMessageFactory` instead.
- **Reason**: These classes being separated did not provide any value, so they were consolidated into `AuditMessageFactory` to simplify the code.

**CPDefinitionLinkTypeSettingsImpl.java**
`modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/configuration/CPDefinitionLinkTypeSettingsImpl.java`

- **Date**: Nov. 8, 2023
- **Ticket**: [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
- **What Changed**: The class is removed.
- **Reason**: This functionality is handled by `CPDefinitionLinkTypeRegistry`.

**CPDefinitionLinkTypeSettings.java**
`modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPDefinitionLinkTypeSettings.java`

- **Date**: Nov. 8, 2023
- **Ticket**: [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
- **What Changed**: The class is removed.
- **Reason**: This functionality is handled by `CPDefinitionLinkTypeRegistry`.

**CPDefinitionLinkTypeConfigurationWrapper.java**
`modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/configuration/CPDefinitionLinkTypeConfigurationWrapper.java`

- **Date**: Nov. 8, 2023
- **Ticket**: [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
- **What Changed**: The class is removed.
- **Reason**: This functionality is handled by `CPDefinitionLinkTypeRegistry`.

**COREntryType.java**
`modules/apps/commerce/commerce-order-rule-api/src/main/java/com/liferay/commerce/order/rule/entry/type/COREntryType.java`

- **Date**: Nov. 8, 2023
- **Ticket**: [COMMERCE-12306](https://liferay.atlassian.net/browse/COMMERCE-12306)
- **What Changed**: The new `evaluate(COREntry, List<COREntryTypeItem>)` method is added.
- **Reason**: This change is made to evaluate rules before creating an order.

**CPContentHelper.java**
`modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java`

- **Date**: Nov. 10, 2023
- **Ticket**: [COMMERCE-12682](https://liferay.atlassian.net/browse/COMMERCE-12682)
- **What Changed**: The `getImages` method now has a `boolean` parameter for `gallery`.
- **Reason**: This change allows for retrieving images with a filter for images that are not allowed in an image gallery.

**AccountConstants.java**
`modules/apps/account/account-api/src/main/java/com/liferay/account/constants/AccountConstants.java`

- **Date**: Nov. 15, 2023
- **Ticket**: [COMMERCE-12813](https://liferay.atlassian.net/browse/COMMERCE-12813)
- **What Changed**: The `getAccountEntryTypes` method now has a `long` parameter for `companyId`. The `ACCOUNT_ENTRY_TYPES` field is also removed.
- **Reason**: This change allows feature flags to be based on specific Liferay DXP instances.

**SharingDropdownItemFactory.java**
`modules/apps/sharing/sharing-api/src/main/java/com/liferay/sharing/display/context/util/SharingDropdownItemFactory.java`

- **Date**: Nov. 16, 2023
- **Ticket**: [LPS-200202](https://liferay.atlassian.net/browse/LPS-200202)
- **What Changed**: A new `createCopyLinkDropdownItem(String, long, HttpServletRequest)` method is added.
- **Reason**: This method allows for creating a drop-down menu to copy document links.

**JavaScriptAwarePortalWebResources.java**
`modules/apps/frontend-js/frontend-js-loader-modules-extender-api/scr/main/java/com/liferay/frontend/js/loader/modules/extender/npm/JavaScriptAwarePortalWebResources.java`

- **Date**: Nov. 22, 2023
- **Ticket**: [LPS-199532](https://liferay.atlassian.net/browse/LPS-199532)
- **What Changed**: The class is removed.
- **Reason**: This class is no longer used.

**ObjectFieldLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFieldLocalServiceImpl.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
- **What Changed**: The `validateExternalReferenceCode`, `validateRequired`, and `validateReadOnlyAndReadOnlyConditionExpression` methods are now public and included in `ObjectFieldLocalService`.
- **Reason**: This change is needed for object field validation when creating one-to-one or one-to-many relationships.

**ObjectRelationshipImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/model/impl/ObjectRelationshipImpl.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
- **What Changed**: A new `compareType(String)` method is added.
- **Reason**: This change simplifies the logic implementation to allow for more code reuse.

**ObjectRelationshipLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectRelationshipLocalServiceImpl.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
- **What Changed**: The `addObjectRelationship` and `updateObjectRelationship` methods have a new `ObjectField` parameter.
- **Reason**: This change allows for methods to set properties when creating a one-to-one or one-to-many object relationship.

**ObjectRelationshipServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectRelationshipServiceImpl.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
- **What Changed**: The `addObjectRelationship` and `updateObjectRelationship` methods have a new `ObjectField` parameter.
- **Reason**: This change allows for methods to set properties when creating a one-to-one or one-to-many object relationship.

**rest-openapi.yaml**
`modules/apps/object/object-admin-rest-impl/rest-openapi.yaml`
        
- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-196717](https://liferay.atlassian.net/browse/LPS-196717)
- **What Changed**: The `ObjectRelationship` schema has a new `objectField` property.
- **Reason**: This change allows for exporting object fields with its associated one-to-one or one-to-many object relationships.

`/modules/apps/users-admin/users-admin-test-util/bnd.bnd`

- **Date**: Nov. 29, 2023
- **Ticket**: [LPS-202908](https://liferay.atlassian.net/browse/LPS-202908)
- **What Changed**: The bundle version is increased to `6.0.0`.

`modules/apps/object/object-admin-rest-api/bnd.bnd`

- **Date**: Nov. 30, 2023
- **Ticket**: [LPS-172418](https://liferay.atlassian.net/browse/LPS-172418)
- **What Changed**: The bundle version is increased to `20.0.0`.

**CommercePaymentEntryLocalServiceImpl.java**
`modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/service/impl/CommercePaymentEntryLocalServiceImpl.java`

- **Date**: Nov. 30, 2023
- **Ticket**: [COMMERCE-12384](https://liferay.atlassian.net/browse/COMMERCE-12384)
- **What Changed**: The `addCommercePaymentEntry` and `updateCommercePaymentEntry` methods have new parameters.
- **Reason**: Commerce payment entries require more information to create and update.

- **Date**: Dec. 19, 2023
- **Ticket**: [COMMERCE-12943](https://liferay.atlassian.net/browse/COMMERCE-12943)
- **What Changed**: Various method signatures have had their parameters changed.
- **Reason**: This change allows for managing the different types of payments.

**BundleManager.java**
`modules/apps/marketplace/marketplace-api/src/main/java/com/liferay/marketplace/bundle/BundleManager.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-201076](https://liferay.atlassian.net/browse/LPS-201076)
- **What Changed**: The class is removed. Instead, use `BundleManagerUtil`.
- **Reason**: The class is being replaced by `BundleManagerUtil`.

**EntityExtensionHandler.java**
`modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/extension/EntityExtensionHandler.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [COMMERCE-12980](https://liferay.atlassian.net/browse/COMMERCE-12980)
- **What Changed**: The `getExtendedProperties` method has a new `long userId` parameter.
- **Reason**: This change is required to pass `dtoConverterContext` with the correct user ID when converting the related unmodifiable system objects to DTO.

**ExtensionProvider.java**
`modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/extension/ExtensionProvider.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [COMMERCE-12980](https://liferay.atlassian.net/browse/COMMERCE-12980)
- **What Changed**: The `getExtendedProperties` method has a new `long userId` parameter.
- **Reason**: This change is required to pass `dtoConverterContext` with the correct user ID when converting the related unmodifiable system objects to DTO.

**CommerceCountryItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommerceCountryItemSelectorCriterion.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
- **What Changed**: The class is removed.
- **Reason**: This class was meant for internal use and is no longer used.

**CommerceInventoryWarehouseItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommerceInventoryWarehouseItemSelectorCriterion.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
- **What Changed**: The class is removed.
- **Reason**: This class was meant for internal use and is no longer used.

**CommercePricingClassItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommercePricingClassItemSelectorCriterion.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
- **What Changed**: The class is removed.
- **Reason**: This class was meant for internal use and is no longer used.

**CommerceProductInstanceItemSelectorCriterion.java**
`modules/apps/commerce/commerce-item-selector-api/src/main/java/com/liferay/commerce/item/selector/criterion/CommerceProductInstanceItemSelectorCriterion.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
- **What Changed**: The class is removed.
- **Reason**: This class was meant for internal use and is no longer used.

**CPInstanceItemSelectorCriterion.java**
`modules/apps/commerce/commerce-product-item-selector-api/src/main/java/com/liferay/commerce/product/item/selector/criterion/CPInstanceItemSelectorCriterion.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
- **What Changed**: The class is removed.
- **Reason**: This class was meant for internal use and is no longer used.

**LayoutPageTemplateEntryItemSelectorCriterion.java**
`modules/apps/commerce/commerce-product-item-selector-api/src/main/java/com/liferay/commerce/product/item/selector/criterion/LayoutPageTemplateEntryItemSelectorCriterion.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-201373](https://liferay.atlassian.net/browse/LPS-201373)
- **What Changed**: The class is removed.
- **Reason**: This class was meant for internal use and is no longer used.

**DLProcessorRegistryTest.java**
`modules/apps/document-library/document-library-test/src/testIntegration/java/com/liferay/document/library/util/test/DLProcessorRegistryTest.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The class is renamed to `DLProcessorHelperTest`, and moved from the `com.liferay.document.library.util.test` package to the `com.liferay.document.library.processor.test` package.
- **Reason**: This change is made for clarity and to keep the package name matching the class name.

**DLProcessorRegistryImpl.java**
`modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/util/DLProcessorRegistryImpl.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The class is renamed to `DLProcessorHelperImpl`, and moved from the `com.liferay.document.library.internal.util` package to the `com.liferay.document.library.internal.processor` package. The `register` and `unregister` methods have also been removed. If you are providing your own non-OSGi `DLProcessor` implementation, convert it to an OSGi service.
- **Reason**: The refactoring change is made for clarity and to keep the package name matching the class name. The `register` and `unregister` methods are removed because all out-of-the-box `DLProcessor` objects are now OSGi components.

**CommerceOrderValidator.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/CommerceOrderValidator.java`

- **Date**: Dec. 2, 2023
- **Ticket**: [COMMERCE-12309](https://liferay.atlassian.net/browse/COMMERCE-12309)
- **What Changed**: The `validate(Locale, CommerceOrder, CPInstance, BigDecimal)` method has two new parameters: `String json` and `boolean child`.
- **Reason**: This change helps with validation of products before they're added to a cart.

**AssetDisplayPageEntry.java**
`modules/apps/asset/asset-display-page-api/src/main/java/com/liferay/asset/display/page/model/AssetDisplayPageEntry.java`

- **Date**: Dec. 2, 2023
- **Ticket**: [LPS-200477](https://liferay.atlassian.net/browse/LPS-200477)
- **What Changed**: A new `getPlid()` method is added. The `plid` column is removed from the `AssetDisplayPageEntry` table. Instead, call `AssetDisplayPageEntry.getPlid()`.
- **Reason**: The `plid` column was temporarily removed from the `AssetDisplayPageEntry` table, so this was added as an alternative method to retrieve the `plid`.

**CommerceAddressService.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceAddressService.java`

- **Date**: Dec. 2, 2023
- **Ticket**: [COMMERCE-12658](https://liferay.atlassian.net/browse/COMMERCE-12658)
- **What Changed**: The `getBillingCommerceAddresses`, `getBillingCommerceAddressesCount`, `getShippingCommerceAddresses`, and `getShippingCommerceAddressesCount` methods have a new `long commerceChannelId` parameter.
- **Reason**: This change allows addresses to be assigned to specific Commerce channels.

**CommerceShippingEngine.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/model/CommerceShippingEngine.java`

- **Date**: Dec. 2, 2023
- **Ticket**: [COMMERCE-12879](https://liferay.atlassian.net/browse/COMMERCE-12879)
- **What Changed**: A new `getKey` method is added.
- **Reason**: This change allows for managing both standard OSGi components and client extensions.dard osgi components and client extensions

**CETConfiguration.java**
`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/configuration/CETConfiguration.java`

- **Date**: Dec. 4, 2023
- **Ticket**: [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
- **What Changed**: A new `buildTimestamp` field is added for whenever a new build takes place in a Liferay Workspace.
- **Reason**: Liferay DXP will use this field for the `${modifiedTimestamp}` variable for client extensions.

**CETFactory.java**
`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/factory/CETFactory.java`

- **Date**: Dec. 4, 2023
- **Ticket**: [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
- **What Changed**: A new `boolean replaceVariables` parameter is added to the `create` methods.
- **Reason**: This change is made to make the API easier to understand, maintain, and extend. The new parameter allows for controlling variable substitutions in URL fields.

**CETImplFactory.java**
`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/factory/CETImplFactory.java`

- **Date**: Dec. 4, 2023
- **Ticket**: [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
- **What Changed**: Various changes to the interface's method signatures.
- **Reason**: CET factory implementations are now responsible for constructing specific CET objects. This helps simplify implementation logic.

**CET.java**
`modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/CET.java`

- **Date**: Dec. 4, 2023
- **Ticket**: [LPS-202104](https://liferay.atlassian.net/browse/LPS-202104)
- **What Changed**: A new `getName` method is added to get a client extension's name with the full localization XML.
- **Reason**: This change is needed to retrieve the name for all locales instead of one at a time.

**Sitemap.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/Sitemap.java`

- **Date**: Dec. 5, 2023
- **Ticket**: [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
- **What Changed**: The class is renamed to `SitemapManager`, and the `com.liferay.site.util` package is refactored to the `com.liferay.site.manager` package.
- **Reason**: This change is made to make the naming more clear and consistent.

**RecentGroupManager.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java`

- **Date**: Dec. 5, 2023
- **Ticket**: [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
- **What Changed**: The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
- **Reason**: This change is made to match the class name to the package name.

**GroupSearchProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/GroupSearchProvider.java`

- **Date**: Dec. 5, 2023
- **Ticket**: [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
- **What Changed**: The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
- **Reason**: This change is made to match the class name to the package name.

**GroupURLProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/GroupURLProvider.java`

- **Date**: Dec. 5, 2023
- **Ticket**: [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
- **What Changed**: The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
- **Reason**: This change is made to match the class name to the package name.

**SitemapURLProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/SitemapURLProvider.java`

- **Date**: Dec. 5, 2023
- **Ticket**: [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
- **What Changed**: The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
- **Reason**: This change is made to match the class name to the package name.

**SitemapURLProviderHelper.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/util/SitemapURLProviderHelper.java`

- **Date**: Dec. 5, 2023
- **Ticket**: [LPS-203260](https://liferay.atlassian.net/browse/LPS-203260)
- **What Changed**: The class has been moved from the `com.lifereay.site.util` package to the `com.liferay.site.manager` package.
modules/apps/site/site-api/src/main/java/com/liferay/site/util/RecentGroupManager.java was moved from com.liferay.site.util package to the com.liferay.site.manager package
- **Reason**: This change is made to match the class name to the package name.

**APIApplicationPublisher.java**
`modules/apps/headless/headless-builder/headless-builder-api/src/main/java/com/liferay/headless/builder/application/publisher/APIApplicationPublisher.java`

- **Date**: Dec. 5, 2023
- **Ticket**: [LPS-203043](https://liferay.atlassian.net/browse/LPS-203043)
- **What Changed**: A new clusterable method is added to publish all the applications for a given company.
- **Reason**: This change encapsulates the logic and potentially avoids intracluster calls.

**SegmentsExperimentLocalServiceImpl.java**
`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperimentLocalServiceImpl.java`

- **Date**: Dec. 6, 2023
- **Ticket**: [LRAC-15144](https://liferay.atlassian.net/browse/LRAC-15144)
- **What Changed**: The `runSegmentsExperiment` method has an added `Experiment` parameter.
- **Reason**: The new parameter is needed for the implementation logic.

**SegmentsExperimentServiceImpl.java**
`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsExperimentServiceImpl.java`

- **Date**: Dec. 6, 2023
- **Ticket**: [LRAC-15144](https://liferay.atlassian.net/browse/LRAC-15144)
- **What Changed**: The `runSegmentsExperiment` method has an added `Experiment` parameter.
- **Reason**: The new parameter is needed for the implementation logic.

**RatingsImporter.java**
`modules/apps/commerce/commerce-initializer-util/src/main/java/com/liferay/commerce/initializer/util/RatingsImporter.java`

- **Date**: Dec. 7, 2023
- **Ticket**: [LPS-199636](https://liferay.atlassian.net/browse/LPS-199636)
- **What Changed**: The class is now removed.
- **Reason**: The class had no usage.

`modules/apps/cookies/cookies-impl/bnd.bnd`

- **Date**: Dec. 7, 2023
- **Ticket**: [LPS-51404](https://liferay.atlassian.net/browse/LPS-51404)
- **What Changed**: The major version is increased to `6.0.0`.

**ObjectFolderLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFolderLocalServiceImpl.java`

- **Date**: Dec. 12, 2023
- **Ticket**: [LPS-201520](https://liferay.atlassian.net/browse/LPS-201520)
- **What Changed**: The `updateObjectFolder(String, long, Map<Locale, String>, List<ObjectFolderItem>)` method has the list of object folder items removed.
- **Reason**: Each object is able to update the object folder items they are associated with.

**ObjectFolderServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFolderServiceImpl.java`

- **Date**: Dec. 12, 2023
- **Ticket**: [LPS-201520](https://liferay.atlassian.net/browse/LPS-201520)
- **What Changed**: The `updateObjectFolder(String, long, Map<Locale, String>, List<ObjectFolderItem>)` method has the list of object folder items removed.
- **Reason**: Each object is able to update the object folder items they are associated with.

`modules/apps/commerce/commerce-initializer-util/bnd.bnd`

- **Date**: Dec. 13, 2023
- **Ticket**: [LPS-199636](https://liferay.atlassian.net/browse/LPS-199636)
- **What Changed**: The bundle's major version is increased to `9.0.0`.

**rest-openapi.yaml**
`modules/apps/captcha/captcha-rest-impl/rest-openapi.yaml`

- **Date**: Dec. 13, 2023
- **Ticket**: [LPS-185213](https://liferay.atlassian.net/browse/LPS-185213)
- **What Changed**: The API is changed to provide separate `GET` and `POST` paths.
- **Reason**: This change simplifies the schemas.

**CategoryFacetFieldConfiguration.java**
`modules/apps/portal-search/portal-search-api/src/main/java/com/liferay/portal/search/configuration/CategoryFacetFieldConfiguration.java`

- **Date**: Dec. 17, 2023
- **Ticket**: [LPS-203720](https://liferay.atlassian.net/browse/LPS-203720)
- **What Changed**: The class is now deleted.
- **Reason**: The `assetVocabularyCategoryIds` field is now used as the aggregation field for the Category Facet.

**DefaultObjectEntryManagerImpl.java**
`modules/apps/object/object-rest-impl/src/main/java/com/liferay/object/rest/internal/manager/v1_0/DefaultObjectEntryManagerImpl.java`

- **Date**: Dec. 18, 2023
- **Ticket**: [LPS-201793](https://liferay.atlassian.net/browse/LPS-201793)
- **What Changed**: The `_addOrUpdateNestedObjectEntries` method adds a new `String` parameter for a `scopeKey`.
- **Reason**: This change allows the creation of site-scoped, nested object entries.

**CommercePaymentEntryRefundType.java**
`modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/entry/CommercePaymentEntryRefundType.java`

- **Date**: Dec. 19, 2023
- **Ticket**: [COMMERCE-12943](https://liferay.atlassian.net/browse/COMMERCE-12943)
- **What Changed**: The new `getNameMap` method is added.
- **Reason**: This method is necessary to retrieve the name map in the service layer.

**SitemapConfigurationManager.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/configuration/manager/SitemapConfigurationManager.java`

- **Date**: Dec. 19, 2023
- **Ticket**: [LPS-203214](https://liferay.atlassian.net/browse/LPS-203214)
- **What Changed**: The `includeCategories(long)`, `includePages(long)`, and `includeWebContent(long)` methods have been renamed to `includeCategoriesCompanyEnabled(long)`, `includePagesCompanyEnabled(long)`, and `includeWebContentCompanyEnabled(long)`, respectively. The new `includeCategoriesGroupEnabled(long, long)`, `includePagesGroupEnabled(long, long)`, `includeWebContentGroupEnabled(long, long)`, and `saveSitemapGroupConfiguration(long, boolean, boolean, boolean)` methods are also added.
- **Reason**: This change is made for clarity since a site configuration is being added.

**StyleBookEntryLocalServiceImpl.java**
`modules/apps/style-book/style-book-service/src/main/java/com/liferay/style/book/service/impl/StyleBookEntryLocalServiceImpl.java`

- **Date**: Dec. 19, 2023
- **Ticket**: [LPS-203973](https://liferay.atlassian.net/browse/LPS-203973)
- **What Changed**: The `addStyleBookEntry(long, long, String, String, String, ServiceContext)` method adds a new `boolean` parameter for `defaultStyleBookeEntry`.
- **Reason**: This change allows a newly added style book to be made the default.

**SXPParameterContributor.java**
`modules/dxp/apps/search-experiences/search-experiences-service/src/main/java/com/liferay/search/experiences/internal/blueprint/parameter/contributor/SXPParameterContributor.java`

- **Date**: Dec. 20, 2023
- **Ticket**: [LPS-201309](https://liferay.atlassian.net/browse/LPS-201309)
- **What Changed**: The `SXPParameterContributor` interface is moved to the `search-experiences-api` module.
- **Reason**: This change is needed for other modules to be able to access the interface.

**AssetDisplayPageEntryFormProcessor.java**
`modules/apps/asset/asset-display-page-api/src/main/java/com/liferay/asset/display/page/portlet/AssetDisplayPageEntryFormProcessor.java`

- **Date**: Dec. 20, 2023
- **Ticket**: [LPS-202905](https://liferay.atlassian.net/browse/LPS-202905)
- **What Changed**: The new `process(long, long, String, long, int, String, long, ServiceContext)` and `process(String, long, ServiceContext)` methods are added.
- **Reason**: The new method implementations make the class easier to use for services because they don't require a `PortletRequest` argument.

**ObjectDefinitionTestUtil.java**
`modules/apps/object/object-rest-test-util/src/main/java/com/liferay/object/rest/test/util/ObjectDefinitionTestUtil.java`

- **Date**: Dec. 27, 2023
- **Ticket**: [LPS-204463](https://liferay.atlassian.net/browse/LPS-204463)
- **What Changed**: The `publishObjectDefinition(List<ObjectField>, String, long)` method is removed, and a new `publishObjectDefinition(String, List<ObjectField>, String)` is added.
- **Reason**: The name needs to be specified when publishing an object definition.

**CommercePaymentEntryConstants.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/constants/CommercePaymentEntryConstants.java`

- **Date**: Dec. 28, 2023
- **Ticket**: [COMMERCE-12755](https://liferay.atlassian.net/browse/COMMERCE-12755)
- **What Changed**: The `REFUND` constant field is renamed to `REFUNDED`.
- **Reason**: The constant was renamed for consistency.

**FragmentWebKeys.java**
`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/constants/FragmentWebKeys.java`

- **Date**: Dec. 30, 2023
- **Ticket**: [LPS-204724](https://liferay.atlassian.net/browse/LPS-204724)
- **What Changed**: The `FRAGMENT_ENTRY_LINK` constant field is removed.
- **Reason**: This constant is no longer used.

**FragmentPortletRenderer.java**
`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/renderer/FragmentPortletRenderer.java`
        
- **Date**: Dec. 30, 2023
- **Ticket**: [LPS-204724](https://liferay.atlassian.net/browse/LPS-204724)
- **What Changed**: The `renderPortlet` method now has a `FragmentEntryLink` parameter.
- **Reason**: The `FragmentEntryLink` is removed from the request.

**SegmentsEntryLocalServiceUtil.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/service/SegmentsEntryLocalServiceUtil.java`

- **Date**: Jan. 4, 2024
- **Ticket**: [LPS-205013](https://liferay.atlassian.net/browse/LPS-205013)
- **What Changed**: The `getSegmentsEntriesCount(long, boolean)`, `getSegmentsEntries(long, boolean, int, int, OrderByComparator)`, and `getSegmentsEntries(long, boolean, String, String, int, int, OrderByComparator)` methods each have the `boolean` parameter removed. The `searchSegmentsEntries(long, String, LinkedHashMap, int, int, Sort)` and `getSegmentsEntries(long, boolean, String, int, int, OrderByComparator)` methods are also removed.
- **Reason**: The API is updated to simplify the implementation logic.

**SegmentsEntryServiceUtil.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/service/SegmentsEntryServiceUtil.java`

- **Date**: Jan. 4, 2024
- **Ticket**: [LPS-205013](https://liferay.atlassian.net/browse/LPS-205013)
- **What Changed**: The `getSegmentsEntries(long, boolean)`, `getSegmentsEntries(long, boolean, int, int, OrderByComparator)`, and `getSegmentsEntriesCount(long, boolean)` methods each have the `boolean` parameter removed. The `getSegmentsEntries(long, int, int, OrderByComparator)` and `getSegmentsEntriesCount(long)` methods are also removed.
- **Reason**: The API is updated to simplify the implementation logic.

**JournalServiceConfiguration.java**
`modules/apps/journal/journal-api/src/main/java/com/liferay/journal/configuration/JournalServiceConfiguration.java`

- **Date**: Jan. 4, 2024
- **Ticket**: [LPS-204945](https://liferay.atlassian.net/browse/LPS-204945)
- **What Changed**: The `journalArticleStorageType` and `databaseContentKeywordSearchEnabled` methods are removed.
- **Reason**: These methods have no usage and are not considered in other areas of the code.

**AntivirusAsyncStatisticsManager.java**
`modules/dxp/apps/antivirus/antivirus-async-store/src/main/java/com/liferay/antivirus/async/store/jmx/AntivirusAsyncStatisticsManager.java`

- **Date**: Jan. 5, 2024
- **Ticket**: [LPS-202191](https://liferay.atlassian.net/browse/LPS-202191)
- **What Changed**: The class no longer implements the `AntivirusStatisticsUpdaterAsyncEventListener` interface, so it no longer implements the `receive(Message)` method.
- **Reason**: The class was refactored to avoid publishing multiple services.

**LayoutDisplayPageWebKeys.java**
`modules/apps/layout/layout-display-page-api/src/main/java/com/liferay/layout/display/page/constants/LayoutDisplayPageWebKeys.java`

- **Date**: Jan. 6, 2024
- **Ticket**: [LPS-204842](https://liferay.atlassian.net/browse/LPS-204842)
- **What Changed**: The `DEFAULT_LAYOUT_DISPLAY` constant field is removed.
- **Reason**: The only usage of this constant was removed.

**Field.java**
`modules/apps/portal-vulcan/portal-vulcan-api/src/main/java/com/liferay/portal/vulcan/batch/engine/Field.java`

- **Date**: Jan. 7, 2024
- **Ticket**: [LPS-204467](https://liferay.atlassian.net/browse/LPS-204467)
- **What Changed**: The `unsupportedFormats` JSON property is added.
- **Reason**: This change allows for checking if the batch engine supports a field.

**ContentTransformerHandler.java**
`modules/apps/adaptive-media/adaptive-media-content-transformer-api/src/main/java/com/liferay/adaptive/media/content/transformer/ContentTransformerHandler.java`

- **Date**: Jan. 10, 2024
- **Ticket**: [LPS-203653](https://liferay.atlassian.net/browse/LPS-203653)
- **What Changed**: The `transform(ContentTransformerContentType, T)` method is removed, and replaced with the `transform(String)` method.
- **Reason**: The content types were not used, and the logic supporting it was causing issues.

**ContentTransformer.java**
`modules/apps/adaptive-media/adaptive-media-content-transformer-api/src/main/java/com/liferay/adaptive/media/content/transformer/ContentTransformer.java`

- **Date**: Jan. 10, 2024
- **Ticket**: [LPS-203653](https://liferay.atlassian.net/browse/LPS-203653)
- **What Changed**: The generic type is removed from the class, and the `getContentTransformerContentType` and `transform(T)` methods are removed. Instead, a `transform(String)` method is added.
- **Reason**: The content types were not used, and the logic supporting it was causing issues.

**SegmentsCriteriaContributorRegistry.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/criteria/contributor/SegmentsCriteriaContributorRegistry.java`

- **Date**: Jan. 11, 2024
- **Ticket**: [LPS-205239](https://liferay.atlassian.net/browse/LPS-205239)
- **What Changed**: The `String` parameter is removed from the `getSegmentsCriteriaContributors(String)` method. The `getSegmentsCriteriaContributors(String, Criteria.Type)` method is removed.
- **Reason**: This is an internal registry, and this change simplifies the API. The removed method implementation had no usage.

**SegmentsEntryProviderRegistry.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/provider/SegmentsEntryProviderRegistry.java`

- **Date**: Jan. 11, 2024
- **Ticket**: [LPS-205239](https://liferay.atlassian.net/browse/LPS-205239)
- **What Changed**: The `getSegmentsEntryIds(long, String, long, Context)` method is removed. Instead, add the `segmentEntryIds` array parameter to use the `getSegmentsEntryId(long, String, long, Context, long[])` implementation.
- **Reason**: The removed method implementation was deprecated.

**SegmentsEntryRetriever.java**
`modules/apps/segments/segments-api/src/main/java/com/liferay/segments/SegmentsEntryRetriever.java`

- **Date**: Jan. 11, 2024
- **Ticket**: [LPS-205239](https://liferay.atlassian.net/browse/LPS-205239)
- **What Changed**: The `getSegmentsEntryIds(long, long, Context)` method is removed. Instead, add the `segmentEntryIds` array parameter to use the `getSegmentEntryIds(long, long, Context, long[])` implementation.
- **Reason**: The removed method implementation was deprecated.

**CommerceMediaResolver.java**
`modules/apps/commerce/commerce-media-api/src/main/java/com/liferay/commerce/media/CommerceMediaResolver.java`

- **Date**: Jan. 13, 2024
- **Ticket**: [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
- **What Changed**: The `getDownloadVirtualOrderItemURL` method now has an extra `long` parameter, for `fileEntryId`.
- **Reason**: The method must support specifying a file entry to download because you can now download more than one file at a time with an `OrderItem`.

**service.xml**
`modules/apps/commerce/commerce-product-type-virtual-service/service.xml`

- **Date**: Jan. 13, 2024
- **Ticket**: [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
- **What Changed**: The `fileEntryId` and `URL` columns are removed, and a one-to-many relationship is added with the `CPDVirtualSettingFileEntry` entity.
- **Reason**: `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**service.xml**
`modules/apps/commerce/commerce-product-type-virtual-order-service/service.xml`(
modules/apps/commerce/commerce-product-type-virtual-order-service/service.xml)

- **Date**: Jan. 13, 2024
- **Ticket**: [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
- **What Changed**: The `fileEntryId` and `URL` columns are removed, and a one-to-many relationship is added with the `CommerceVirtualOrderItemFileEntry` entity.
- **Reason**: `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**CPDefinitionVirtualSettingLocalServiceImpl.java**
`modules/apps/commerce/commerce-product-type-virtual-service/src/main/java/com/liferay/commerce/product/type/virtual/service/impl/CPDefinitionVirtualSettingLocalServiceImpl.java`

- **Date**: Jan. 13, 2024
- **Ticket**: [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
- **What Changed**: Some `add` method implementations are removed, and various other method signatures are changed to remove `fileEntryId` and `url` parameters.
- **Reason**: `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries. The removed `add` implementations were redundant.

**CommerceVirtualOrderItemLocalServiceImpl.java**
`modules/apps/commerce/commerce-product-type-virtual-order-service/src/main/java/com/liferay/commerce/product/type/virtual/order/service/impl/CommerceVirtualOrderItemLocalServiceImpl.java`

- **Date**: Jan. 13, 2024
- **Ticket**: [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
- **What Changed**: Various method signatures are changed to remove `fileEntryId` and `url` parameters.
- **Reason**: `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**CommerceVirtualOrderItemServiceImpl.java**
`modules/apps/commerce/commerce-product-type-virtual-order-service/src/main/java/com/liferay/commerce/product/type/virtual/order/service/impl/CommerceVirtualOrderItemServiceImpl.java`

- **Date**: Jan. 13, 2024
- **Ticket**: [COMMERCE-12776](https://liferay.atlassian.net/browse/COMMERCE-12776)
- **What Changed**: Various method signatures are changed to remove `fileEntryId` and `url` parameters.
- **Reason**: `CPDefinitionVirtualSetting` and `CommerceVirtualOrderItem` must now handle multiple file entries.

**CTClosureFactory.java**
`modules/apps/change-tracking/change-tracking-api/src/main/java/com/liferay/change/tracking/closure/CTClosureFactory.java`

- **Date**: Jan. 16, 2024
- **Ticket**: [LPS-203903](https://liferay.atlassian.net/browse/LPS-203903)
- **What Changed**: A new `clearCache(long ctCollectionId)` method is added`.
- **Reason**: The new method implementation allows for caching `CTClosure` objects.

**Levels.java**
`modules/apps/portal/portal-log4j/src/main/java/com/liferay/portal/log4j/Levels.java`

- **Date**: Jan. 17, 2024
- **Ticket**: [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
- **What Changed**: The `Levels` class is removed.
- **Reason**: The class was deprecated.

**AssetListEntryServiceImpl.java**
`modules/apps/asset/asset-list-service/src/main/java/com/liferay/asset/list/service/impl/AssetListEntryServiceImpl.java`

- **Date**: Jan. 22, 2024
- **Ticket**: [LPS-206304](https://liferay.atlassian.net/browse/LPS-206304)
- **What Changed**: The `addDynamicAssetListEntry` and `addManualAssetListEntry` methods have removed the `long userId` parameter.
- **Reason**: This change avoids exposing user IDs to the remote service.

**CommercePaymentMethodGroupRelLocalServiceImpl.java**
`modules/apps/commerce/commerce-payment-service/src/main/java/com/liferay/commerce/payment/service/impl/CommercePaymentMethodGroupRelLocalServiceImpl.java`

- **Date**: Jan. 24, 2024
- **Ticket**: [COMMERCE-12385](https://liferay.atlassian.net/browse/COMMERCE-12385)
- **What Changed**: A new `updateCommercePaymentMethodGroupRel(CommercePaymentMethodGroupRel)` method is added.
- **Reason**: The new method implementation is necessary to update a `CommercePaymentMethodGroupRel` object.

**ReflectionUtil.java**
`modules/core/petra/petra-reflect/src/main/java/com/liferay/petra/reflect/ReflectionUtil.java`

- **Date**: Jan. 25, 2024
- **Ticket**: [LPD-15179](https://liferay.atlassian.net/browse/LPD-15179)
- **What Changed**: The `arrayClone` method is removed.
- **Reason**: The `arrayClone` method had no usage.

**ObjectGraphUtil.java**
`modules/core/petra/petra-reflect/src/main/java/com/liferay/petra/reflect/ObjectGraphUtil.java`

- **Date**: Jan. 25, 2024
- **Ticket**: [LPD-15179](https://liferay.atlassian.net/browse/LPD-15179)
- **What Changed**: The `ObjectGraphUtil` class is removed.
- **Reason**: The class had no usage.

**SegmentsEntryServiceImpl.java**
`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsEntryServiceImpl.java`

- **Date**: Jan. 30, 2024
- **Ticket**: [LPS-206170](https://liferay.atlassian.net/browse/LPS-206170)
- **What Changed**: Both `addSegmentsEntry` implementations have the `type` parameter removed. Update your implementation to remove the type from the method call.
- **Reason**: The `type` parameter always has the same value, so this change simplifies the API.

**SegmentsEntryLocalServiceImpl.java**
`modules/apps/segments/segments-service/src/main/java/com/liferay/segments/service/impl/SegmentsEntryLocalServiceImpl.java`

- **Date**: Jan. 30, 2024
- **Ticket**: [LPS-206170](https://liferay.atlassian.net/browse/LPS-206170)
- **What Changed**: Both `addSegmentsEntry` implementations have the `type` parameter removed. Update your implementation to remove the type from the method call.
- **Reason**: The `type` parameter always has the same value, so this change simplifies the API.

**CountriesCommerceHealthStatus.java**
`modules/apps/commerce/commerce-health-status-web/src/main/java/com/liferay/commerce/health/status/web/internal/CountriesCommerceHealthStatus.java`

- **Date**: Jan. 30, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CountriesCommerceHealthStatus` class is removed.
- **Reason**: The countries health check implementation did not provide value.

**FragmentEntryLocalServiceUtil.java**
`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryLocalServiceUtil.java`

- **Date**: Feb. 6, 2024
- **Ticket**: [LPD-16310](https://liferay.atlassian.net/browse/LPD-16310)
- **What Changed**: The `addFragmentEntry(long, long, long, String, String, String, String, String, boolean, String, String, long, int, String, int, ServiceContext)` and `updateEntry(long, long, long, String, String, String, String, boolean, String, String, long, String, int)` methods are removed.
- **Reason**: The methods are replaced with new `addFragmentEntry` and `updateFragmentEntry` methods, with updated parameters to improve fragment version logic.

**FragmentEntryServiceUtil.java**
`modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/service/FragmentEntryServiceUtil.java`
        
- **Date**: Feb. 6, 2024
- **Ticket**: [LPD-16310](https://liferay.atlassian.net/browse/LPD-16310)
- **What Changed**: The `addFragmentEntry(long, long, long, String, String, String, String, String, boolean, String, String, long, int, String, int, ServiceContext)` and `updateEntry(long, long, long, String, String, String, String, boolean, String, String, long, String, int)` methods are removed.
- **Reason**: The methods are replaced with new `addFragmentEntry` and `updateFragmentEntry` methods, with updated parameters to improve fragment version logic.

**GroupSearchProvider.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/provider/GroupSearchProvider.java`

- **Date**: Feb. 6, 2024
- **Ticket**: [LPD-16643](https://liferay.atlassian.net/browse/LPD-16643)
- **What Changed**: `GroupSearchProvider` is now a static class, and the `getGroupSearch(PortletRequest, PortletURL)` method is removed.
- **Reason**: The `GroupSearchProvider` is an internal API class, and the change better aligns with its use case.

**SiteWebKeys.java**
`modules/apps/site/site-api/src/main/java/com/liferay/site/constants/SiteWebKeys.java`

- **Date**: Feb. 6, 2024
- **Ticket**: [LPD-16643](https://liferay.atlassian.net/browse/LPD-16643)
- **What Changed**: The `GROUP_SEARCH_PROVIDER` is removed.
- **Reason**: The `GROUP_SEARCH_PROVIDER` was meant for internal use and no longer has any usage.

**ObjectFieldLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFieldLocalServiceImpl.java`

- **Date**: Feb. 6, 2024
- **Ticket**: [LPD-15616](https://liferay.atlassian.net/browse/LPD-15616)
- **What Changed**: The `validateRequired` method's parameters are reordered with a new `boolean` parameter.
- **Reason**: This change is necessary for object definition validation.

**BatchEngineTaskItemDelegateRegistry.java**
`modules/apps/batch-engine/batch-engine-api/src/main/java/com/liferay/batch/engine/BatchEngineTaskItemDelegateRegistry.java`

- **Date**: Feb. 8, 2024
- **Ticket**: [LPD-15236](https://liferay.atlassian.net/browse/LPD-15236)
- **What Changed**: The `getBatchEngineTaskItemDelegate` method has a new `long` parameter for a company ID.
- **Reason**: The `BatchEngineTaskItemDelegate` needs a way to be retrieved by company ID.

**ObjectFieldLocalServiceImpl.java**
`modules/apps/object/object-service/src/main/java/com/liferay/object/service/impl/ObjectFieldLocalServiceImpl.java`

- **Date**: Feb. 20, 2024
- **Ticket**: [LPD-16492](https://liferay.atlassian.net/browse/LPD-16492)
- **What Changed**: The object field local service's validation now makes sure that `BUSINESS_TYPE_AGGREGATION` and `BUSINESS_TYPE_FORMULA` object fields are not indexable.
- **Reason**: Elasticsearch does not properly support indexing these types of object fields, which set their values at runtime.

**CommercePortletKeys.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/constants/CommercePortletKeys.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommercePortletKeys` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryPanelApp.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/application/list/CommerceCountryPanelApp.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryPanelApp` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryScreenNavigationConstants.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/constants/CommerceCountryScreenNavigationConstants.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryScreenNavigationConstants` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**BaseCommerceCountriesDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/BaseCommerceCountriesDisplayContext.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `BaseCommerceCountriesDisplayContext` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountriesDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceCountriesDisplayContext.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountriesDisplayContext` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountriesManagementToolbarDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceCountriesManagementToolbarDisplayContext.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountriesManagementToolbarDisplayContext` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceRegionsDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceRegionsDisplayContext.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceRegionsDisplayContext` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceRegionsManagementToolbarDisplayContext.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/CommerceRegionsManagementToolbarDisplayContext.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceRegionsManagementToolbarDisplayContext` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryRequestHelper.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/display/context/helper/CommerceCountryRequestHelper.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryRequestHelper` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryChannelsScreenNavigationCategory.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryChannelsScreenNavigationCategory.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryChannelsScreenNavigationCategory` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryChannelsScreenNavigationEntry.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryChannelsScreenNavigationEntry.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryChannelsScreenNavigationEntry` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryDetailsScreenNavigationCategory.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryDetailsScreenNavigationCategory.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryDetailsScreenNavigationCategory` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryDetailsScreenNavigationEntry.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryDetailsScreenNavigationEntry.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryDetailsScreenNavigationEntry` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryRegionsScreenNavigationCategory.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryRegionsScreenNavigationCategory.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryRegionsScreenNavigationCategory` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryRegionsScreenNavigationEntry.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/frontend/taglib/servlet/taglib/CommerceCountryRegionsScreenNavigationEntry.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryRegionsScreenNavigationEntry` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountryPortlet.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/CommerceCountryPortlet.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountryPortlet` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**EditCommerceCountryMVCActionCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceCountryMVCActionCommand.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `EditCommerceCountryMVCActionCommand` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**EditCommerceCountryMVCRenderCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceCountryMVCRenderCommand.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `EditCommerceCountryMVCRenderCommand` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**EditCommerceRegionMVCActionCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceRegionMVCActionCommand.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `EditCommerceRegionMVCActionCommand` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**EditCommerceRegionMVCRenderCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/EditCommerceRegionMVCRenderCommand.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `EditCommerceRegionMVCRenderCommand` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**ImportCommerceRegionsMVCActionCommand.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/ImportCommerceRegionsMVCActionCommand.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `ImportCommerceRegionsMVCActionCommand` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**ActionHelper.java**
`modules/apps/commerce/commerce-address-web/src/main/java/com/liferay/commerce/address/web/internal/portlet/action/helper/ActionHelper.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `ActionHelper` class is removed.
- **Reason**: The Commerce Country portlet is removed.

**channels.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country/channels.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `channels.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**commerce_regions.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country/commerce_regions.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `commerce_regions.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**details.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country/details.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `details.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**commerce_country_action.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_country_action.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `commerce_country_action.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**commerce_region_action.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/commerce_region_action.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `commerce_region_action.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/css/main.scss`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `commerce-address-web` module's `main.scss` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**edit_commerce_country.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/edit_commerce_country.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `edit_commerce_country.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**edit_commerce_region.jsp**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/edit_commerce_region.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `edit_commerce_region.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceCountriesManagementToolbarPropsTransformer.js**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/js/CommerceCountriesManagementToolbarPropsTransformer.js`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceCountriesManagementToolbarPropsTransformer.js` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**CommerceRegionsManagementToolbarPropsTransformer.js**
`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/js/CommerceRegionsManagementToolbarPropsTransformer.js`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `CommerceRegionsManagementToolbarPropsTransformer.js` file is removed.
- **Reason**: The Commerce Country portlet is removed.

`modules/apps/commerce/commerce-address-web/src/main/resources/META-INF/resources/view.jsp`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPD-15148](https://liferay.atlassian.net/browse/LPD-15148)
- **What Changed**: The `commerce-address-web` module's `view.jsp` file is removed.
- **Reason**: The Commerce Country portlet is removed.

**PersonalMenuEntry.java**
`modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/PersonalMenuEntry.java`

- **Date**: Mar. 18, 2024
- **Ticket**: [LPS-194004](https://liferay.atlassian.net/browse/LPS-194004)
- **What Changed**: The `getJSOnClickConfigJSONObject` method behavior now requires providing a JavaScript function for `getOnClickJSModuleURL`, which is called with the value from `getJSOnClickConfigJSONObject` as its parameter.
- **Reason**: This change makes `getJSOnClickConfigJSONObject` more broadly usable for any type of on-click interaction, not just for opening a selection modal.

### Changes in `portal-impl` Classes

**PortletContextFactoryImpl.java**
`portal-impl/src/com/liferay/portlet/internal/PortletContextFactoryImpl.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-200088](https://liferay.atlassian.net/browse/LPS-200088)
- **What Changed**: The class is removed. Instead, use `PortletContextFactoryUtil` directly.
- **Reason**: The code is being consolidated to simplify code structure.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
- **What Changed**: The `dl.file.entry.processors` portal property is removed. Instead, add your own `DLProcessor` implementation as an OSGi service.
- **Reason**: This portal property is no longer required because all out-of-the-box implementations of `DLProcessor` are now OSGi services.

**DLPreviewableProcessor.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/DLPreviewableProcessor.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
- **What Changed**: The `DLPreviewableProcessor` class is moved from `portal-impl` to the `document-library-preview-api` module. Add `document-library-preview-api` as a build dependency to continue using this class.
- **Reason**: `DLPreviewableProcessor`'s subclasses are now all in the module, so they can be converted into OSGi components.

**AudioProcessorImpl.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/AudioProcessorImpl.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
- **What Changed**: The `AudioProcessorImpl` class is moved from `portal-impl` to the `document-library-preview-audio` module. Instead, reference the `DLProcessor` class with the target `"(type=" + DLProcessorConstants.AUDIO_PROCESSOR + ")"`.
- **Reason**: This change allows `AudioProcessorImpl` to become an OSGi component.

**VideoProcessorImpl.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/VideoProcessorImpl.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
- **What Changed**: The `VideoProcessorImpl` class is moved from `portal-impl` to the `document-library-preview-video` module. Instead, reference the `DLProcessor` class with the target `"(type=" + DLProcessorConstants.VIDEO_PROCESSOR + ")"`.
- **Reason**: This change allows `AudioProcessorImpl` to become an OSGi component.

**DLFileEntryLocalServiceImpl.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/service/impl/DLFileEntryLocalServiceImpl.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-197738](https://liferay.atlassian.net/browse/LPS-197738)
- **What Changed**: The new `forEachFileEntry(long, Consumer<DLFileEntry>, long, String[])` and `forEachFileEntry(long, long, Consumer<DLFileEntry>, long, String[])` methods are added.
- **Reason**: These methods allow for executing arbitrary code on a long list of file entries without retrieving the entire list first.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Nov. 16, 2023
- **Ticket**: [LPS-199234](https://liferay.atlassian.net/browse/LPS-199234)
- **What Changed**: The `session.timeout.auto.extend` and `session.timeout.auto.extend.offset` portal properties are removed. Instead, set these configurations (with the same names) in the system, instance, or site settings.
- **Reason**: These configurations are now handled in the UI via site, instance, or system settings, so they do not require adjustments to `portal-ext.properties`.

**AssetTagFinderImpl.java**
`portal-impl/src/com/liferay/portlet/asset/service/persistence/impl/AssetTagFinderImpl.java`

- **Date**: Nov. 20, 2023
- **Ticket**: [LPS-201547](https://liferay.atlassian.net/browse/LPS-201547)
- **What Changed**: The `countByG_N(long, String)` method is removed. Instead, use the `countByG_C_N(long, long, String)` method, passing `0` as the second argument (`classNameId`).
- **Reason**: The `countByG_N(long, String)` method was redundant.

**AssetTagLocalServiceImpl.java** --> getTagsSize(long groupId, String name) `portal-impl/src/com/liferay/portlet/asset/service/impl/AssetTagLocalServiceImpl.java --> getTagsSize(long groupId, String name)`

- **Date**: Nov. 20, 2023
- **Ticket**: [LPS-201547](https://liferay.atlassian.net/browse/LPS-201547)
- **What Changed**: The `getTagsSize(long, String)` method is removed. Instead, use the `getTagsSize(long, long, String)` method, passing `0` as the second argument (`classNameId`).
- **Reason**: The `getTagsSize(long, String)` method was redundant.

**AssetTagServiceImpl.java**
`portal-impl/src/com/liferay/portlet/asset/service/impl/AssetTagServiceImpl.java`

- **Date**: Nov. 20, 2023
- **Ticket**: [LPS-201547](https://liferay.atlassian.net/browse/LPS-201547)
- **What Changed**: The `getVisibleAssetsTagsCount(long, String)` method is removed. Instead, use the `getVisibleAssetsTagsCount(long, long, String)` method, passing `0` as the second argument (`classNameId`).
- **Reason**: The `getVisibleAssetsTagsCount(long, String)` method was redundant.

**SiteMembershipPolicyFactoryUtil.java**
`portal-impl/src/com/liferay/portal/security/membershippolicy/SiteMembershipPolicyFactoryUtil.java`

- **Date**: Nov. 23, 2023
- **Ticket**: [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
- **What Changed**: The class is removed. Instead, use the static methods in `SiteMembershipPolicyUtil`.
- **Reason**: The logic from this class is consolidated into `SiteMembershipPolicyUtil` to simplify the code structure.

**SiteMembershipPolicyFactoryImpl.java**
`portal-impl/src/com/liferay/portal/security/membershippolicy/SiteMembershipPolicyFactoryImpl.java`

- **Date**: Nov. 23, 2023
- **Ticket**: [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
- **What Changed**: The class is removed. Instead, use `SiteMembershipPolicyUtil` directly.
- **Reason**: The logic from this class is consolidated into `SiteMembershipPolicyUtil` to simplify the code structure.

**UserLocalServiceImpl.java**
`portal-impl/src/com/liferay/portal/service/impl/UserLocalServiceImpl.java`

- **Date**: Nov. 24, 2023
- **Ticket**: [LPS-201007](https://liferay.atlassian.net/browse/LPS-201007)
- **What Changed**: The `searchBySocial` method has a new `long[]` parameter for group IDs.
- **Reason**: This change allows for searching for users who are added to a group via a user group.

**LayoutPrototypePermissionImpl.java**
`portal-impl/src/com/liferay/portal/service/permission/LayoutPrototypePermissionImpl.java`

- **Date**: Nov. 24, 2023
- **Ticket**: [LPS-201156](https://liferay.atlassian.net/browse/LPS-201156)
- **What Changed**: The class is removed. Instead, use `LayoutPrototypePermissionUtil` directly.
- **Reason**: The `LayoutPrototypePermissionImpl` class is no longer needed Spring no longer needs to register it as an OSGi component.

**MethodFactoryRegistryImpl.java**
`portal-impl/src/com/liferay/portal/webdav/methods/MethodFactoryRegistryImpl.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
- **What Changed**: The class is removed. Registering custom `MethodFactory` implementations is no longer supported.
- **Reason**: No `MethodFactory` implementation is needed other than `MethodFactoryImpl`.

**BaseWebDAVStorageImpl.java**
`portal-impl/src/com/liferay/portal/webdav/BaseWebDAVStorageImpl.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
- **What Changed**: The`BaseWebDAVStorageImpl` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to keep using the same class.
- **Reason**: The `BaseWebDAVStorageImpl` class is moved into `portal-impl` to simplify the code structure.

**DLImpl.java**
`portal-impl/src/com/liferay/portlet/documentlibrary/util/DLImpl.java`

- **Date**: Dec. 6, 2023
- **Ticket**: [LPS-202905](https://liferay.atlassian.net/browse/LPS-202905)
- **What Changed**: The `DLImpl` class is moved to the `document-library-service` module.
- **Reason**: The class is rewritten to have access to some OSGi components in the `document-library-service` module to improve performance.

**JSONWebServiceHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/JSONWebServiceHotDeployListener.java`

- **Date**: Dec. 13, 2023
- **Ticket**: [LPS-203854](https://liferay.atlassian.net/browse/LPS-203854)
- **What Changed**: The class is removed.
- **Reason**: Spring bean JSON web service registration is now centralized in `JSONWebServiceTracker`, so this class is no longer needed to respond to hot deploy events.

**messaging-misc-spring.xml**
`portal-impl/src/META-INF/messaging-misc-spring.xml`

- **Date**: Dec. 15, 2023
- **Ticket**: [LPS-203461](https://liferay.atlassian.net/browse/LPS-203461)
- **What Changed**: The `messaging-misc-spring.xml` file is removed.
- **Reason**: The `messaging-misc-spring.xml` file is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 4, 2024
- **Ticket**: [LPS-199540](https://liferay.atlassian.net/browse/LPS-199540)
- **What Changed**: The `index.permission.filter.search.amplification.factor` property is removed. Instead, if the total amount of time searching is still a concern, regulate it with the new Permission Filtering Time Limit configuration (*Control Panel* &rarr; *System Settings* &rarr; *Search* &rarr; *Default Search Result Permission Filter*).
- **Reason**: The `index.permission.filter.search.amplification.factor` property did not effectively improve permission filtering, and it only applied on the first search.

**system.properties**
`portal-impl/src/system.properties`

- **Date**: Jan. 8, 2024
- **Ticket**: [LPS-204548](https://liferay.atlassian.net/browse/LPS-204548)
- **What Changed**: The `com.liferay.portal.kernel.util.ServiceProxyFactory.timeout` system property is removed.
Property com.liferay.portal.kernel.util.ServiceProxyFactory.timeout is being removed.
- **Reason**: This property is only used for the `ServiceProxyFactory` class, which is being removed.

**ServiceBag.java**
`portal-impl/src/com/liferay/portal/deploy/hot/ServiceBag.java`

- **Date**: Jan. 10, 2024
- **Ticket**: [LPS-204273](https://liferay.atlassian.net/browse/LPS-204273)
- **What Changed**: The `ServiceBag` constructor has removed the `ClassLoader` parameter and added `BundleContext` and `ServiceReference` parameters. The `replace` method also no longer throws `Exception`.
- **Reason**: This change fixes issues with creating this class.

### Changes in `portal-kernel` Classes

**IndexableActionableDynamicQuery.java**
`portal-kernel/src/com/liferay/portal/kernel/dao/orm/IndexableActionableDynamicQuery.java`

- **Date**: Nov. 6, 2023
- **Ticket**: [LPS-199958](https://liferay.atlassian.net/browse/LPS-199958)
- **What Changed**: The `setIndexWriterHelper` method is removed.
- **Reason**: This method was only used for the `UserIndexer` class, which has been removed.

**PortletContextFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/portlet/PortletContextFactory.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-200088](https://liferay.atlassian.net/browse/LPS-200088)
- **What Changed**: The interface is removed. Instead, add `portal-impl` as a build dependency and use `PortletContextFactoryUtil` directly.
- **Reason**: The code is being consolidated and moved into `portal-impl` to simplify code structure.

**PortletContextFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/portlet/PortletContextFactoryUtil.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
- **What Changed**: The `PortletContextFactoryUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
- **Reason**: This class is moved into `portal-impl` to simplify the code structure.

**AuditMessageFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
- **What Changed**: The `AuditMessageFactory` interface is now an implemented class. The logic previously in `AuditMessageFactoryImpl` and `AuditMessageFactoryUtil` is now implemented in this class.
- **Reason**: Having these classes separated did not provide any value, so they were consolidated into `AuditMessageFactory` to simplify the code.

**AuditMessageFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
- **What Changed**: The class is removed. The logic from this class is moved into `AuditMessageFactory`.
- **Reason**: Having these classes separated did not provide any value, so they were merged into a single class to simplify the code.

**AssetEntriesFacet.java**
`portal-kernel/src/com/liferay/portal/kernel/search/facet/AssetEntriesFacet.java`

- **Date**: Nov. 15, 2023
- **Ticket**: [LPS-200073](https://liferay.atlassian.net/browse/LPS-200073)
- **What Changed**: The class is removed.
- **Reason**: The class was deprecated and its usages have been replaced by `FacetImpl`.

**AssetTagUtil.java**
`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagUtil.java`

- **Date**: Nov. 21, 2023
- **Ticket**: [LPS-202248](https://liferay.atlassian.net/browse/LPS-202248)
- **What Changed**: The `findByG_LikeN`, `findByG_N_First`, `findByG_N_Last`, `findByG_N_PrevAndNext`, `removeByG_N`, and `countByG_N` methods are removed.
- **Reason**: These methods no longer have any usage.

**AssetTagPersistence.java**
`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagPersistence.java`

- **Date**: Nov. 21, 2023
- **Ticket**: [LPS-202248](https://liferay.atlassian.net/browse/LPS-202248)
- **What Changed**: The `findByG_LikeN`, `findByG_N_First`, `findByG_N_Last`, `findByG_N_PrevAndNext`, `removeByG_N`, and `countByG_N` methods are removed.
- **Reason**: These methods no longer have any usage.

**AssetTagFinder.java**
`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagFinder.java`

- **Date**: Nov. 22, 2023
- **Ticket**: [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
- **What Changed**: The `findByG_N_S_E` method is removed.
- **Reason**: This method no longer has any usage.

**AssetTagFinderUtil.java**
`portal-kernel/src/com/liferay/asset/kernel/service/persistence/AssetTagFinderUtil.java`

- **Date**: Nov. 22, 2023
- **Ticket**: [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
- **What Changed**: The `findByG_N_S_E` method is removed.
- **Reason**: This method no longer has any usage.

**AssetTagLocalService.java**
`portal-kernel/src/com/liferay/asset/kernel/service/AssetTagLocalService.java`

- **Date**: Nov. 22, 2023
- **Ticket**: [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
- **What Changed**: The `getSocialActivityCounterOffsetTags` and `getSocialActivityCounterPeriodTags` methods are removed.
- **Reason**: These methods no longer have any usage.

**AssetTagLocalServiceUtil.java**
`portal-kernel/src/com/liferay/asset/kernel/service/AssetTagLocalServiceUtil.java`

- **Date**: Nov. 22, 2023
- **Ticket**: [LPS-202275](https://liferay.atlassian.net/browse/LPS-202275)
- **What Changed**: The `getSocialActivityCounterOffsetTags` and `getSocialActivityCounterPeriodTags` methods are removed.
- **Reason**: These methods no longer have any usage.

**SiteMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/SiteMembershipPolicyFactory.java`

- **Date**: Nov. 23, 2023
- **Ticket**: [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
- **What Changed**: The interface is removed. Instead, use `SiteMembershipPolicyFactoryUtil` directly.
- **Reason**: This interface is no longer needed because Spring no longer needs to register its implementations as OSGi components.

**SiteMembershipPolicyFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/SiteMembershipPolicyFactoryUtil.java`

- **Date**: Nov. 23, 2023
- **Ticket**: [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
- **What Changed**: The `SiteMembershipPolicyFactoryUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
- **Reason**: This class is moved into `portal-impl` to simplify the code structure.

**SiteMembershipPolicyUtil.java**
`portal-kernel/src/com/liferay/portal/security/membershippolicy/SiteMembershipPolicyUtil.java`

- **Date**: Nov. 23, 2023
- **Ticket**: [LPS-199470](https://liferay.atlassian.net/browse/LPS-199470)
- **What Changed**: The `SiteMembershipPolicyUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
- **Reason**: This class is moved into `portal-impl` to simplify the code structure.

**LayoutPrototypePermissionUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/service/permission/LayoutPrototypePermissionUtil.java`

- **Date**: Nov. 24, 2023
- **Ticket**: [LPS-201156](https://liferay.atlassian.net/browse/LPS-201156)
- **What Changed**: The `LayoutPrototypePermissionUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class. The `getLayoutPrototypePermission` is also removed. Instead, use `LayoutPrototypePermissionUtil` directly.
- **Reason**: This class is moved into `portal-impl` to simplify the code structure.

**MethodFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/webdav/methods/MethodFactory.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
- **What Changed**: The class is removed. Use `MethodFactoryUtil` instead.
- **Reason**: This class no longer has any usage.

**WebDAVStorage.java**
`portal-kernel/src/com/liferay/portal/kernel/webdav/WebDAVStorage.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
- **What Changed**: The `getMethodFactory` method is removed. Use `MethodFactoryUtil` instead.
- **Reason**: `MethodFactory` is simplified and is now a `Util` class, so this method is no longer needed.

**MethodFactoryRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/webdav/methods/MethodFactoryRegistry.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
- **What Changed**: The interface is removed. Registering custom `MethodFactory` implementations is no longer supported.
- **Reason**: The default implementation, `MethodFactoryImpl`, was the only needed implementation, so the interface is no longer needed.

**MethodFactoryRegistryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/webdav/methods/MethodFactoryRegistryUtil.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-200166](https://liferay.atlassian.net/browse/LPS-200166)
- **What Changed**: The class is removed. Registering custom `MethodFactory` implementations is no longer supported.
- **Reason**: The default implementation, `MethodFactoryImpl`, was the only needed implementation, so this class is no longer needed.

**PortletConfigurationIconMenu.java**
`portal-kernel/src/com/liferay/portal/kernel/portlet/configuration/icon/PortletConfigurationIconMenu.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-200326](https://liferay.atlassian.net/browse/LPS-200326)
- **What Changed**: The `PortletConfigurationIconMenu` constructor is now private.
- **Reason**: `PortletConfigurationIconMenu` is being removed from `util-spring`, so it needs a static `INSTANCE` field to replace existing usages.

**FriendlyURLNormalizerUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/util/FriendlyURLNormalizerUtil.java`

- **Date**: Nov. 27, 2023
- **Ticket**: [LPS-188565](https://liferay.atlassian.net/browse/LPS-188565)
- **What Changed**: The `setFriendlyURLNormalizer(FriendlyURLNormalizer)` method is removed.
- **Reason**: The class uses OSGi to retrieve the service, so this method is no longer needed.
            
* __Alternatives:__ 
Register FriendlyURLNormalizer OSGi service.

**UserGroupMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/UserGroupMembershipPolicyFactory.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-200563](https://liferay.atlassian.net/browse/LPS-200563)
- **What Changed**: The interface is removed. Instead, use `UserGroupMembershipPolicyFactoryUtil` directly.
- **Reason**: This interface is no longer needed because Spring no longer needs to register its implementations as OSGi components.

**UserGroupMembershipPolicyFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/UserGroupMembershipPolicyFactoryUtil.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-200563](https://liferay.atlassian.net/browse/LPS-200563)
- **What Changed**: The `UserGroupMembershipPolicyFactoryUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class. The `getUserGroupMembershipPolicyFactory` method is also removed. Directly use `UserGroupMembershipPolicyUtil` instead.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure. The `getUserGroupMembershipPolicyFactory` method is no longer needed.

**UserGroupMembershipPolicyUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/UserGroupMembershipPolicyUtil.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-200563](https://liferay.atlassian.net/browse/LPS-200563)
- **What Changed**: The class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**AudioProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/AudioProcessor.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `AudioProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**AudioProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/AudioProcessorUtil.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `AudioProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**DLProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessor.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `DLProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package. The `afterPropertiesSet` and `destroy` methods are also removed. Instead, use the OSGi service lifecycle `activate` and `deactivate` methods.
- **Reason**: The refactoring change matches the package name to the class name. The `afterPropertiesSet` and `destroy` methods are removed because `DLProcessor` implementations are no longer Spring beans.

**DLProcessorRegistry.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistry.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `DLProcessorRegistry` class is renamed to `DLProcessorHelper`, and it's moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This class no longer registers or unregisters `DLProcessor` objects, and the refactoring change matches the package name to the class name.

**DLProcessorRegistryUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistryUtil.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `DLProcessorRegistryUtil` class is renamed to `DLProcessorHelperUtil`, and it's moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: The class name change clarifies the class's usage, and the refactoring change matches the package name to the class name.

**DLProcessorThreadLocal.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorThreadLocal.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `DLProcessorThreadLocal` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**ImageProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/ImageProcessor.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `ImageProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**ImageProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/ImageProcessorUtil.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `ImageProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**PDFProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/PDFProcessor.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `PDFProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**PDFProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/PDFProcessorUtil.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `PDFProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**RawMetadataProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/RawMetadataProcessor.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `RawMetadataProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**RawMetadataProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/RawMetadataProcessorUtil.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `RawMetadataProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**VideoProcessor.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/VideoProcessor.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `VideoProcessor` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**VideoProcessorUtil.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/VideoProcessorUtil.java`

- **Date**: Dec. 1, 2023
- **Ticket**: [LPS-188559](https://liferay.atlassian.net/browse/LPS-188559)
- **What Changed**: The `VideoProcessorUtil` class is moved from the `com.liferay.document.library.kernel.util` package to the `com.liferay.document.library.kernel.processor` package.
- **Reason**: This change matches the package name to the class name.

**ModelResourcePermissionFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/ModelResourcePermissionFactory.java`

- **Date**: Dec. 12, 2023
- **Ticket**: [LPS-193174](https://liferay.atlassian.net/browse/LPS-193174)
- **What Changed**: The `getInstance` method is removed.
- **Reason**: Service model resource permissions are now retrieved via `ModelResourcePermissionRegistryUtil`.

**PortletResourcePermissionFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/PortletResourcePermissionFactory.java`

- **Date**: Dec. 12, 2023
- **Ticket**: [LPS-193174](https://liferay.atlassian.net/browse/LPS-193174)
- **What Changed**: The `getInstance` method is removed.
- **Reason**: There are no longer any usages for this method.

**JSONWebServiceActionsManager.java**
`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionsManager.java`

- **Date**: Dec. 13, 2023
- **Ticket**: [LPS-203854](https://liferay.atlassian.net/browse/LPS-203854)
- **What Changed**: The `registerServletContext(ServletContext)` and `unregisterServletContext(ServletContext)` methods are removed.
- **Reason**: Spring bean JSON web service registration is now centralized in `JSONWebServiceTracker`, so there is no longer a need to explicitly register or unregister a `ServletContext`.

**JSONWebServiceActionsManagerUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/jsonwebservice/JSONWebServiceActionsManagerUtil.java`

- **Date**: Dec. 13, 2023
- **Ticket**: [LPS-203854](https://liferay.atlassian.net/browse/LPS-203854)
- **What Changed**: The `registerServletContext(ServletContext)` and `unregisterServletContext(ServletContext)` methods are removed.
- **Reason**: Spring bean JSON web service registration is now centralized in `JSONWebServiceTracker`, so there is no longer a need to explicitly register or unregister a `ServletContext`.

**PhoneNumberFormatUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/format/PhoneNumberFormatUtil.java`

- **Date**: Dec. 13, 2023
- **Ticket**: [LPS-200292](https://liferay.atlassian.net/browse/LPS-200292)
- **What Changed**: The `PhoneNumberFormatUtil` class is moved from `portal-kernel` to `portal-impl`. Add `portal-impl` as a build dependency to continue using this class. Additionally, the `getPhoneNumberFormat` method is removed.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure. The `getPhoneNumberFormat` method is no longer used.

**ClusterBridgeMessageListener.java**
`portal-kernel/src/com/liferay/portal/kernel/cluster/messaging/ClusterBridgeMessageListener.java`

- **Date**: Dec. 15, 2023
- **Ticket**: [LPS-203461](https://liferay.atlassian.net/browse/LPS-203461)
- **What Changed**: The `ClusterBridgeMessageListener` class is moved from `portal-kernel` to the `user-admin-web` module.
- **Reason**: This class is only used for the `live_users` destination in the `user-admin-web` module.

**DefaultControlPanelEntry.java**
`portal-kernel/com/liferay/portal/kernel/portlet/DefaultControlPanelEntry.java`
        
- **Date**: Jan. 4, 2024
- **Ticket**: [LPS-200537](https://liferay.atlassian.net/browse/LPS-200537)
- **What Changed**: The class is removed.
- **Reason**: There is no longer any usage for this implementation.

**ServiceProxyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ServiceProxyFactory.java`
        
- **Date**: Jan. 8, 2024
- **Ticket**: [LPS-204548](https://liferay.atlassian.net/browse/LPS-204548)
- **What Changed**: The class is removed. Instead, directly use the `Snapshot` class.
- **Reason**: This class no longer has any usage.

**LayoutSet.java**
`portal-kernel/src/com/liferay/portal/kernel/model/LayoutSet.java`

- **Date**: Jan. 10, 2024
- **Ticket**: [LPS-146160](https://liferay.atlassian.net/browse/LPS-146160)
- **What Changed**: A new `isLayoutSetReadyForPropagation` method is added.
- **Reason**: This new method allows for identifying if a layout set is actively propagated from a layout set prototype.

**LayoutSetWrapper.java**
`portal-kernel/src/com/liferay/portal/kernel/model/LayoutSetWrapper.java`

- **Date**: Jan. 10, 2024
- **Ticket**: [LPS-146160](https://liferay.atlassian.net/browse/LPS-146160)
- **What Changed**: A new `isLayoutSetReadyForPropagation` method is added.
- **Reason**: This new method allows for identifying if a layout set is actively propagated from a layout set prototype.

**FileEntry.java**
`portal-kernel/src/com/liferay/portal/kernel/repository/model/FileEntry.java`

- **Date**: Jan. 29, 2024
- **Ticket**: [LPD-6958](https://liferay.atlassian.net/browse/LPD-6958)
- **What Changed**: A new `getDisplayDate` method is added for the new display date field.
- **Reason**: This new method allows for a display date to propogate to file entries in external repositories if they are enabled.

**FileVersion.java**
`portal-kernel/src/com/liferay/portal/kernel/repository/model/FileVersion.java`

- **Date**: Jan. 29, 2024
- **Ticket**: [LPD-6958](https://liferay.atlassian.net/browse/LPD-6958)
- **What Changed**: A new `getDisplayDate` method is added for the new display date field.
- **Reason**: This new method allows for a display date to propogate to specific file versions in external repositories if they are enabled.

**DLStore.java**
`portal-kernel/src/com/liferay/document/library/kernel/store/DLStore.java`

- **Date**: Jan. 31, 2024
- **Ticket**: [LPD-15353](https://liferay.atlassian.net/browse/LPD-15353)
- **What Changed**: The `deleteFile(long, long, String)` has been restored after it was previously removed.
- **Reason**: This method implementation is useful for deleting a single file.

`portal-kernel/bnd.bnd`

- **Date**: Feb. 7, 2024
- **Ticket**: [LPS-206272](https://liferay.atlassian.net/browse/LPS-206272)
- **What Changed**: The `portal-kernel/src/com/liferay/portal/kernel/portlet/constants/packageinfo` version has increased to `1.6.0`, and the `portal-kernel/src/com/liferay/portal/kernel/portlet/packageinfo` version has increased to `29.2.0`.
- **Reason**: The `FriendlyURLRegistryUtil` class now has a new method `getFriendlyURLResolverByDefaultURLSeparator(String defaultURLSeparator)`.

### Changes in `portal-test` Classes

`portal-test/bnd.bnd`

- **Date**: Jan. 17, 2024
- **Ticket**: [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
- **What Changed**: The bundle version is increased to `24.0.0` due to multiple class removals.

**CaptureAppender.java**
`portal-test/src/com/liferay/portal/test/log/CaptureAppender.java`

- **Date**: Jan. 17, 2024
- **Ticket**: [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
- **What Changed**: The class is removed. Use `LoggerTestUtil`'s `Log4JLogCapture` method instead.
- **Reason**: The `CaptureAppender` class was deprecated.

**Log4JLoggerTestUtil.java**
`portal-test/src/com/liferay/portal/test/log/Log4JLoggerTestUtil.java`

- **Date**: Jan. 17, 2024
- **Ticket**: [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
- **What Changed**: The class is removed. Use `LoggerTestUtil` directly instead.
- **Reason**: The `Log4JLoggerTestUtil` class was deprecated.

**LogEvent.java**
`portal-test/src/com/liferay/portal/test/log/LogEvent.java`

- **Date**: Jan. 17, 2024
- **Ticket**: [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
- **What Changed**: The class is removed. Use `LoggerTestUtil`'s `Log4JLogEntry` method instead.
- **Reason**: The `LogEvent` class was deprecated.

**LogAssertionAppender.java**
`portal-test/src/com/liferay/portal/test/rule/LogAssertionAppender.java`

- **Date**: Jan. 17, 2024
- **Ticket**: [LPS-200582](https://liferay.atlassian.net/browse/LPS-200582)
- **What Changed**: The class is removed.
- **Reason**: The `LogAssertionAppender` class was deprecated.

### Changes in Taglibs

**liferay-hook_7_4_0.dtd**
`definitions/liferay-hook_7_4_0.dtd`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-196123](https://liferay.atlassian.net/browse/LPS-196123)
- **What Changed**: The `dl.file.entry.processors` portal property is removed from the list. Instead of using this portal property, add your own `DLProcessor` implementation as an OSGi service.
- **Reason**: This portal property is no longer required because all out-of-the-box implementations of `DLProcessor` are now OSGi services.

**liferay-ui.tld**
`util-taglib/src/META-INF/liferay-ui.tld`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-202768](https://liferay.atlassian.net/browse/LPS-202768)
- **What Changed**: The `liferay-ui:logo-selector` and `liferay-ui:progress` taglibs are removed. Instead, use the `liferay-frontend:logo-selector` and `liferay-document-library:upload-progress` taglibs, respectively.
- **Reason**: The locations of these two taglibs were moved into modules.

**LogoSelectorTag.java**
`util-taglib/src/com/liferay/taglib/ui/LogoSelectorTag.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-202768](https://liferay.atlassian.net/browse/LPS-202768)
- **What Changed**: This taglib class is removed. Use `liferay-frontend:logo-selector` instead.
- **Reason**: The frontend module now handles the same functionality.

**UploadProgressTag.java**
`util-taglib/src/com/liferay/taglib/ui/UploadProgressTag.java`

- **Date**: Nov. 28, 2023
- **Ticket**: [LPS-202768](https://liferay.atlassian.net/browse/LPS-202768)
- **What Changed**: This taglib class is removed. Use `liferay-document-library:upload-progress` instead.
- **Reason**: The document library module now handles the same functionality.

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

**PermissionConverter.java**
`modules/apps/portal-security/portal-security-permission-api/src/main/java/com/liferay/portal/security/permission/converter/PermissionConverter.java`

- **Date**: Sep. 25, 2023
- **Ticket**: [LPS-197267](https://liferay.atlassian.net/browse/LPS-197267)
- **What Changed**: The `convertPermissions(long)` and `convertPermissions(long, PermissionConversionFilter)` methods are removed from PermissionConverter.
- **Reason**: These methods are no longer used after refactoring the PermissionConverter APIs.

**ExtRepository.java**
`modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java`

- **Date**: Sep. 29, 2023
- **Ticket**: [LPS-197315](https://liferay.atlassian.net/browse/LPS-197315)
- **What Changed**: A new `String` parameter (`fileName`) is added to the `addExtRepositoryFileEntry(String, String, String, String, String, InputStream)` method (so it now takes 6 `String` parameters and an `InputStream`).
- **Reason**: The file name is required to create files with a Sharepoint external repository.

**WorkflowTaskResourceImpl.java**
`modules/apps/headless/headless-admin-workflow/headless-admin-workflow-impl/src/main/java/com/liferay/headless/admin/workflow/internal/resource/v1_0/WorkflowTaskResourceImpl.java`

- **Date**: Oct. 3, 2023
- **Ticket**: [LPS-197317](https://liferay.atlassian.net/browse/LPS-197317)
- **What Changed**: The `_workflowTaskModelResourcePermission` field's target reference field is changed from `(model.class.name=com.liferay.portal.kernel.workflow.WorkflowTask)` to `(model.class.name=com.liferay.portal.workflow.kaleo.model.KaleoTaskInstanceToken)`.
- **Reason**: This change is made to enforce class name consistency.

**WorkflowTaskModelResourcePermission.java**
`modules/apps/portal-workflow/portal-workflow-kaleo-runtime-integration-impl/src/main/java/com/liferay/portal/workflow/kaleo/runtime/integration/internal/security/permission/resource/WorkflowTaskModelResourcePermission.java`

- **Date**: Oct. 3, 2023
- **Ticket**: [LPS-197317](https://liferay.atlassian.net/browse/LPS-197317)
- **What Changed**: The class's OSGi property value is changed from `model.class.name=com.liferay.portal.kernel.workflow.WorkflowTask` to `model.class.name=com.liferay.portal.workflow.kaleo.model.KaleoTaskInstanceToken`.
- **Reason**: This change is made to enforce class name consistency.

**liferay-chart.tld**
`modules/apps/frontend-taglib/frontend-taglib-chart/src/main/resources/META-INF/liferay-chart.tld`

- **Date**: Oct. 6, 2023
- **Ticket**: [LPS-198114](https://liferay.atlassian.net/browse/LPS-198114)
- **What Changed**: The Liferay chart module's taglibs are removed.
- **Reason**: These taglibs are no longer used in Liferay, and Liferay removed support for soy.

**CommerceShipmentItemLocalService.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java`

- **Date**: Oct. 6, 2023
- **Ticket**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534)
- **What Changed**: The `getCommerceShipmentOrderItemsQuantity` method returns a `BigDecimal` instead of an `int` value.
- **Reason**: A `BigDecimal` value is needed for new unit of measurement functionality.

**CommerceShipmentItemService.java**
[modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java]

- **Date**: Oct. 6, 2023
- **Ticket**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534)
- **What Changed**: The `getCommerceShipmentOrderItemsQuantity` method returns a `BigDecimal` instead of an `int` value.
- **Reason**: A `BigDecimal` value is needed for new unit of measurement functionality.

**BaseClayTag.java**
`modules/apps/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/base/BaseClayTag.java`

- **Date**: Oct. 10, 2023
- **Ticket**: [LPS-198462](https://liferay.atlassian.net/browse/LPS-198462)
- **What Changed** The `BaseClayTag` class is removed.
- **Reason**: The class is no longer used.

**ModelSearchRegistrarHelper.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/ModelSearchRegistrarHelper.java`

- **Date**: Oct. 11, 2023
- **Ticket**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809)
- **What Changed**: The `ModelSearchRegistrarHelper` class is removed.
- **Reason**: The search registrar bootstrapping style has changed, and this class is no longer used.

**ModelSearchDefinitionContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/contributor/ModelSearchDefinitionContributor.java`

- **Date**: Oct. 11, 2023
- **Ticket**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809)
- **What Changed**: The `ModelSearchDefinitionContributor` class is removed.
- **Reason**: The search registrar bootstrapping style has changed, and this class is no longer used.

**AccountRoleLocalService.java**
`modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java`

- **Date**: Oct. 17, 2023
- **Ticket**: [LPS-173628](https://liferay.atlassian.net/browse/LPS-173628)
- **What Changed**: The `checkCompanyAccountRoles` method is removed.
- **Reason**: The `AddDefaultAccountRolesPortalInstanceLifecycleListener` and `AddDefaultAccountRolesPortletPermissionsPortalInstanceLifecycleListener` classes initialize and check default account roles instead.

**CommerceCheckoutStepHttpHelper.java**
`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java`

- **Date**: Oct. 25, 2023
- **Ticket**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230)
- **What Changed**: The `isActiveShippingMethodCommerceCheckoutStep` method now uses an additional `CommerceOrder` value.
- **Reason**: A `CommerceOrder` value is passed as a parameter to help checkout performance.

**PaymentProcessCheckoutStepDisplayContext.java**
`modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java`

- **Date**: Oct. 25, 2023
- **Ticket**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230)
- **What Changed**: The `PaymentProcessCheckoutStepDisplayContext` method nose uses an additional `CommerceOrder` value.
- **Reason**: A `CommerceOrder` value is passed as a parameter to help checkout performance.

**AssetEntryItemSelectorCriterion.java**
`modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java`

- **Date**: Oct. 30, 2023
- **Ticket**: [LPS-197840](https://liferay.atlassian.net/browse/LPS-197840)
- **What Changed**: The `scopeGroupType` methods are removed.
- **Reason**: The `scopeGroupType` methods are no longer used.

**BasePreviewBackgroundTaskExecutor.java**
`modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java`

- **Date**: Oct. 31, 2023
- **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
- **What Changed**: The class accesses the new `DLFileEntryConfigurationProvider` instead of directly accessing `DLFileEntryConfiguration`.
- **Reason**: The `DLFileEntryConfigurationProvider` class has been added.

**ExtendedObjectClassDefinition.java**
`modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java`

- **Date**: Oct. 31, 2023
- **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
- **What Changed**: The class has a new static method, `getScope(String)`.
- **Reason**: The new method allows for retrieving a `Scope` object with a String scope value.

**DLFileEntryConfiguration.java**
`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java`

- **Date**: Oct. 31, 2023
- **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
- **What Changed**: The class uses a new attribute, `maxNumberOfPages`. This was formerly part of `PDFPreviewConfiguration`.
- **Reason**: `PDFPreviewConfiguration` is no longer used.

**DLFileEntryConfigurationProvider.java**
`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java`

- **Date**: Oct. 31, 2023
- **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
- **What Changed**: This class is a new configuration provider for `DLFileEntryConfiguration`.
- **Reason**: This configuration provider gives easier access to multiple configuration levels (system, instance, and site) for `DLFileEntryConfiguration`.

**DLFileEntryConfigurationConstants.java**
`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java`

- **Date**: Oct. 31, 2023
- **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
- **What Changed**: This a newly added class.
- **Reason**: This class defines common values to handle `DLFileEntryConfiguration` attributes.

**DLFileEntryConfigurationException.java**
`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java`

- **Date**: Oct. 31, 2023
- **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
- **What Changed**: This is a new type of Exception.
- **Reason**: This Exception is now used when an invalid value is set for `DLFileEntryConfiguration` attributes.

**CPContentHelper.java**
`modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java`

- **Date**: Nov. 4, 2023
- **Ticket**: [COMMERCE-12579](https://liferay.atlassian.net/browse/COMMERCE-12579)
- **What Changed**: The `hasDirectReplacement` method is renamed to `isDirectReplacement`.
- **Reason**: The method now checks for whether the SKU is a replacement of another product, instead of checking whether it has replacements.

### Changes in `portal-impl` Classes

**UserImpl.java**
`portal-impl/src/com/liferay/portal/model/impl/UserImpl.java`

- **Date**: Oct. 4, 2023
- **Ticket**: [LPS-196035](https://liferay.atlassian.net/browse/LPS-196035)
- **What Changed**: WebDAV clients must use `userId` instead of the user's screen name, email address, or regular password to authenticate via Digest Auth.
- **Reason**: WebDAV now requires each user to generate a separate password for access, requiring the user to take actions to change their accout settings. The user experience is simplified to use `userId` to compensate, avoiding unexpected WebDAV access rejections.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Oct. 8, 2023
- **Ticket**: [LPS-189621](https://liferay.atlassian.net/browse/LPS-189621)
- **What Changed**: The `sql.data.max.parameters` property is removed.
- **Reason**: The database-specific `database.max.parameters` property should be used instead.

**OpenIdUtil.java**
`portal-impl/src/com/liferay/portal/util/OpenIdUtil.java`

- **Date**: Oct. 19, 2023
- **Ticket**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877)
- **What Changed**: The `OpenIdUtil` class is removed. Use `OpenIdConnect` instead.
- **Reason**: OpenID has been deprecated and Liferay no longer uses it internally.

**PersistedModelLocalServiceRegistryUtil.java**
`portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java`

- **Date**: Oct. 20, 2023
- **Ticket**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563)
- **What Changed**: The `PersistedModelLocalServiceRegistryUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**HttpAuthManagerUtil.java**
`portal-impl/src/com/liferay/portal/security/auth/http.HttpAuthManagerUtil.java`

- **Date**: Oct. 21, 2023
- **Ticket**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376)
- **What Changed**: The `HttpAuthManagerUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**ImageToolUtil.java**
`portal-impl/src/com/liferay/portal/image/ImageToolUtil.java`\*\*

- **Date**: Oct. 21, 2023
- **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
- **What Changed**: The `ImageToolUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**DLPreviewableProcessor.java**
`portal-impl/src/com/liferay/document/library/kernel/util/DLPreviewableProcessor.java`

- **Date**: Oct. 21, 2023
- **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
- **What Changed**: The `DLPreviewableProcessor` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**RoleMembershipPolicyFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security.membershippolicy.RoleMembershipPolicyFactoryUtil.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
- **What Changed**: The `RoleMembershipPolicyFactoryUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**RoleMembershipPolicyUtil.java**
`portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
- **What Changed**: The `RoleMembershipPolicyUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**AuthenticatedSessionManagerUtil.java**
`portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165)
- **What Changed**: The `AuthenticatedSessionManagerUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**Success.java**
`portal-impl/src/com/liferay/portal/xmlrpc/Success.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
- **What Changed**: The `Success` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**Fault.java**
`portal-impl/src/com/liferay/portal/xmlrpc/Fault.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
- **What Changed**: The `Fault` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**XmlRpcUtil.java**
`portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
- **What Changed**: The `XmlRpcUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**StartupHelperUtil.java**
`portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java`

- **Date**: Nov. 2, 2023
- **Ticket**: [LPS-200501](https://liferay.atlassian.net/browse/LPS-200501)
- **What Changed**: The `isStartupFinished` and `setStartupFinished(boolean)` methods are removed.
- **Reason**: The flag does not accurately reflect the startup status, so the methods are removed to avoid incorrect usage.

**ModelAdapterUtil.java**
`portal-impl/src/com/liferay/portal/model/adapter/ModelAdapterUtil.java`

- **Date**: Nov. 3, 2023
- **Ticket**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825)
- **What Changed**: The `ModelAdapterUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
- **Reason**: The class is moved into `portal-impl` to simplify the code structure.

### Changes in `portal-kernel` classes

**PermissionConverterUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/security/permission/PermissionConverterUtil.java`

- **Date**: Sep. 25, 2023
- **Ticket**: [LPS-197267](https://liferay.atlassian.net/browse/LPS-197267)
- **What Changed**: The `PermissionConverterUtil` class is removed. Instead, use an OSGi service to reference `PermissionConverter`.
- **Reason**: The `PermissionConverter` APIs are now in `portal-security-permission-api`.

**DLProcessorRegistry.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistry.java`

- **Date**: Sep. 27, 2023
- **Ticket**: [LPS-196698](https://liferay.atlassian.net/browse/LPS-196698)
- **What Changed**: The `getPreviewableProcessorMaxSize` method is added.
- **Reason**: The method is needed to retrieve the configuration value.

**FormNavigatorEntryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/servlet/taglib/ui/FormNavigatorEntryUtil.java`

- **Date**: Oct. 12, 2023
- **Ticket**: [LPS-198653](https://liferay.atlassian.net/browse/LPS-198653)
- **What Changed**: The `FormNavigatorEntryUtil` class is removed. Use the OSGi service provided in `FormNavigatorEntryProvider` instead.
- **Reason**: The class is no longer used.

**OpenId.java**
`portal-kernel/src/com/liferay/portal/kernel/openid/OpenId.java`

- **Date**: Oct. 19, 2023
- **Ticket**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877)
- **What Changed**: The `OpenId` class is removed. Use `OpenIdConnect` instead.
- **Reason**: OpenID has been deprecated and Liferay no longer uses it internally.

**PersistedModelLocalServiceRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/service/PersistedModelLocalServiceRegistry.java`

- **Date**: Oct. 20, 2023
- **Ticket**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563)
- **What Changed**: The `PersistedModelLocalServiceRegistry` class is removed. Use `PersistedModelLocalServiceRegistryUtil` (which is also refactored into `portal-impl`) instead.
- **Reason**: The service collection and look-up logic is refactored into `PersistedModelLocalServiceRegistryUtil`.

**ImageTool.java**
`portal-kernel/src/com/liferay/portal/kernel/image/ImageTool.java`

- **Date**: Oct. 21, 2023
- **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
- **What Changed**: The `ImageTool` class is removed. Its constant fields are refactored to `ImageConstants`, except for constants related to image orientation, which are removed. Use `ImageToolUtil`'s static methods or the constants in `ImageConstants` instead.
- **Reason**: The class is no longer used.

**PortletPermission.java**
`portal-kernel/src/com/liferay/portal/kernel/service/permission/PortletPermission.java`

- **Date**: Oct. 21, 2023
- **Ticket**: [LPS-196101](https://liferay.atlassian.net/browse/LPS-196101)
- **What Changed**: The `PortletPermission` class is removed. Use `PortletPermissionUtil` instead.
- **Reason**: The class is no longer used.

**RoleMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/RoleMembershipPolicyFactory.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
- **What Changed**: The `RoleMembershipPolicyFactory` class is removed. Use `RoleMembershipPolicyFactoryUtil` (which is moved to `portal-impl`) instead.
- **Reason**: The class is no longer used.

**ThreadLocalDistributor.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributor.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859)
- **What Changed**: The `ThreadLocalDistributor` class is removed.
- **Reason**: The class is no longer used.

**ThreadLocalDistributorRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributorRegistry.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859)
- **What Changed**: The `ThreadLocalDistributorRegistry` class is removed.
- **Reason**: The class is no longer used.

**HttpAuthManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/http/HttpAuthManager.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376)
- **What Changed**: The `HttpAuthManger` class is removed. Use `HttpAuthManagerUtil` instead.
- **Reason**: The class is no longer used.

**XmlRpcParser.java**
`portal-kernel/src/com/liferay/portal/kernel.xmlrpc.XmlRpcParser.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
- **What Changed**: The `XmlRpcParser` class is refactored into the `XmlRpcUtil` class (which is also now in `portal-impl`).
- **Reason**: The `XmlRpcParser` and `XmlRpcUtil` classes were closely related and depended on each other, so the two classes have been combined.

**AuthenticatedSessionManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/session/AuthenticatedSessionManager.java`

- **Date**: Oct. 23, 2023
- **Ticket**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165)
- **What Changed**: The `AuthenticatedSessionManager` class is removed. Use `AuthenticatedSessionManagerUtil` instead.
- **Reason**: The class is no longer used.

**TemplateManagerUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java`

- **Date**: Oct. 26, 2023
- **Ticket**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072)
- **What Changed**: The `destroy` and `getTemplateManagers` methods are removed.
- **Reason** These methods are no longer used.

**TemplateManager.java**
`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java`

- **Date**: Oct. 26, 2023
- **Ticket**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072)
- **What Changed**: The `init` and `destroy` methods are removed.
- **Reason**: The life cycle management is moved into internal service logic. The service's consumers should not directly control its life cycle.

**ModelAdapterBuilderLocator.java**
`portal-kernel/src/com/liferay/portal/kernel/model/adapter/builder/ModelAdapterBuilderLocator.java`

- **Date**: Nov. 3, 2023
- **Ticket**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825)
- **What Changed**: The `ModelAdapterBuilderLocator` class is removed. Use `ModelAdapterUtil` directly instead.
- **Reason**: The class is no longer used.

**AssetEntriesFacet.java**
`portal-kernel/src/com/liferay/portal/kernel/search/facet/AssetEntriesFacet.java`

- **Date**: Nov. 3, 2023
- **Ticket**: [LPS-200073](https://liferay.atlassian.net/browse/LPS-200073)
- **What Changed**: The `AssetEntriesFacet` class is removed, in favor of logic from `FacetImpl`.
- **Reason**: The class is no longer used.

**AuditMessageFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
- **What Changed**: Logic from `AuditMessageFactoryUtil` and `AuditMessageFactoryImpl` have been refactored into `AuditMessageFactory`.
- **Reason**: The logic was unnecessarily split between classes, so it is now combined into the `AuditMessageFactory` class to simplify the code structure.

**AuditMessageFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.java`

- **Date**: Nov. 7, 2023
- **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
- **What Changed**: The `AuditMessageFactoryUtil` class is removed. The logic has been refactored into `AuditMessageFactory`.
- **Reason**: The logic was unnecessarily split between classes, so it is now combined into the `AuditMessageFactory` class to simplify the code structure.

**PortletDisplay.java**
`portal-kernel/src/com/liferay/portal/kernel/theme/PortletDisplay.java`

- **Date**: Nov. 20, 2023
- **Ticket**: [LPS-196539](https://liferay.atlassian.net/browse/LPS-196539)
- **What Changed**: The `getPortletSetup` method is renamed to `getPortletPreferences`, and the `setPortletSetup` method is renamed to `setPortletPreferences`. Update any references to use the new method names.
- **Reason**: This change makes the method names consistent with the `PortletPreferences` variable.

**PortletToolbar.java**
`portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java`

- **Date**: Nov. 21, 2023
- **Ticket**: [LPS-200453](https://liferay.atlassian.net/browse/LPS-200453)
- **What Changed**: The `PortletToolbar` class's constructor is now private. Use `PortletToolbar.INSTANCE` to get an instance of `PortletToolbar` instead.
- **Reason**: `PortletToolbar` is no longer in `util-spring`, so it needs a static instance instead.

### Changes in `osgi-util` classes

**Snapshot.java**
`osgi-util/src/main/java/com/liferay/osgi/util/service/Snapshot.java`

- **Date**: Sep. 27, 2023
- **Ticket**: [LPS-196524](https://liferay.atlassian.net/browse/LPS-196524)
- **What Changed**: The `Snapshot` class is moved from `osgi-util` into `portal-kernel`.
- **Reason**: The `Snapshot` class is replacing all usages of `ServiceProxyFactory`.

### Changes in Taglibs

**`liferay-commerce` taglibs**

- **Date**: Oct. 16, 2023
- **Ticket**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170)
- **What Changed**: The `SearchInputTag` and `UserManagementBarTag` taglibs are removed.
- **Reason**: These were internal taglibs and are no longer used. They also used obsolete markup and logic.

**`liferay-export-import-changeset` taglibs**

- **Date**: Oct. 16, 2023
- **Ticket**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170)
- **What Changed**: These taglibs were removed: `AddEntitiesTag`, `AddEntityTag`, `CreateTag`, `CreateTei`, `ExportEntityTag`, `ExportImportEntityManagementBarButtonTag`, `ExportImportEntitySearchContainerMappingTag`, `ImportEntityTag`, `PublishChangesetTag`, and `PublishModelMenuItemTag`.
- **Reason**: These were internal taglibs and are no longer used. They also used obsolete markup and logic.

## 2023 Q3 Release

### Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change**                                        | **Description**                                                                                                                                                                                                                                                                                                                                  | **References**                                                |
| :--------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Location of the Mark as Cacheable option for fragments** | Mark (or unmark) fragments as cacheable in the Fragments menu (within the fragment's Actions menu) instead of the editor. Now you can make this change separately from other edits to the fragment, which reduces the performance cost of propagating it to fragments in use. No implementation changes are necessary with this breaking change. | [LPS-183735](https://liferay.atlassian.net/browse/LPS-183735) |

### Changes in Module Source Code

**SolrClientManager.java**
`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientManager.java`

- **Date**: Jul. 4, 2023
- **Ticket**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691)
- **What Changed**: The `SolrClientManager` class's extension points are removed.
- **Reason**: Liferay no longer supports extending this class.

**SolrClientFactory.java**
`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientFactory.java`

- **Date**: Jul. 4, 2023
- **Ticket**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691)
- **What Changed**: The `CLOUD` and `REPLICATED` extension points are removed.
- **Reason**: Liferay no longer supports these extension points.

**HttpClientFactory.java**
`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/http/HttpClientFactory.java`

- **Date**: Jul. 4, 2023
- **Ticket**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691)
- **What Changed**: The `BASIC` and `CERT` extension points are removed.
- **Reason**: Liferay no longer supports these extension points.

### Changes in `portal-impl` Classes

**MessagingHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/MessagingHotDeployListener.java`

- **Date**: Aug. 4, 2023
- **Ticket**: [LPS-192680](https://liferay.atlassian.net/browse/LPS-192680)
- **What Changed**: The `MessagingHotDeployListener` class is removed. The accompanying `liferay/hot_deploy` message bus destination is also removed. Instead, register a `HotDeployListener` to listen for hot deploy events.
- **Reason**: The removed message bus destination is no longer used.

**HookHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`

- **Date**: Aug. 17, 2023
- **Ticket**: [LPS-193926](https://liferay.atlassian.net/browse/LPS-193926)
- **What Changed**: The `HookHotDeployListener` class no longer supports deploying a `DLProcessor` via hook. Instead, convert your `DLProcessor` into an OSGi implementation.
- **Reason**: This prevents duplicated logic to register `DLProcessor` implementations between `DLProcessorRegistryImpl` and `HookHotDeployListener`.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Sep. 4, 2023
- **Ticket**: [LPS-194379](https://liferay.atlassian.net/browse/LPS-194379)
- **What Changed**: The portal property `discussion.subscribe` is removed. Instead, set the same configuration in your instance settings in the UI.
- **Reason**: Instance settings can be set specifically per instance and while Liferay is running, so it's more flexible to configure it as an instance setting.

**HookHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`

- **Date**: Sep. 4, 2023
- **Ticket**: [LPS-194350](https://liferay.atlassian.net/browse/LPS-194350)
- **What Changed**: The `HookHotDeployListener` class no longer supports deploying an external repository via hook. Instead, convert your own external repository implementation into an OSGi service.
- **Reason**: OSGi services support more features than deploying external repositories via hook.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Sep. 13, 2023
- **Ticket**: [LPS-195006](https://liferay.atlassian.net/browse/LPS-195006)
- **What Changed**: The portal property `discussion.comments.always.editable.by.owner` is removed. Instead, configure the same setting in your instance settings in the UI.
- **Reason**: Instance settings can be set specifically per instance and while Liferay is running, so it's more flexible to configure it as an instance setting.

### Changes in `portal-kernel` Classes

**Document.java**
`portal-kernel/src/com/liferay/portal/kernel/search/Document.java`

- **Date**: Jul. 7, 2023
- **Ticket**: [LPS-188914](https://liferay.atlassian.net/browse/LPS-188914)
- **What Changed**: These `addFile` methods are now deprecated: `addFile(String, byte[], String)`, `addFile(String, File, String)`, `addFile(String, InputStream, String)`, and `addFile(String, InputStream, String, int)`. Update your implementations by using an `InputStream` with the file's data and calling the `TextExtractor` class's `extractText` method. Then, call `addFile(String, String)` using the `extractText` call's return value.
- **Reason**: The deprecated `addFile` implementations are no longer used.

**BaseModelPermissionChecker.java**
`com.liferay.portal.kernel.security.permission.BaseModelPermissionChecker`

- **Date**: Aug. 11, 2023
- **Ticket**: [LPS-182671](https://liferay.atlassian.net/browse/LPS-182671)
- **What Changed**: The `BaseModelPermissionChecker` interface is removed. Implement `ModelResourcePermission` instead.
- **Reason**: The interface was deprecated in 7.1 and is no longer used.

**SchedulerEngine.java**
`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngine.java`

- **Date**: Aug. 24, 2023
- **Ticket**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314)
- **What Changed**: The `unschedule` method is removed. Instead, call the `delete` method.
- **Reason**: The method is not needed because unscheduled jobs should be deleted at the same time.

**SchedulerEngineHelper.java**
`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelper.java`

- **Date**: Aug. 24, 2023
- **Ticket**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314)
- **What Changed**: The `unschedule` method is removed. Instead, call the `delete` method.
- **Reason**: The method is not needed because unscheduled jobs should be deleted at the same time.

**SchedulerEngineHelperUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelperUtil.java`

- **Date**: Aug. 24, 2023
- **Ticket**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314)
- **What Changed**: The `unschedule` method is removed. Instead, call the `delete` method.
- **Reason**: The method is not needed because unscheduled jobs should be deleted at the same time.

**DestinationEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationEventListener.java`

- **Date**: Sep. 1, 2023
- **Ticket**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116)
- **What Changed**: The `DestinationEventListener` interface is removed. Listening for `Destination` registration and unregistration events is no longer supported.
- **Reason**: This listener is no longer used.

**MessageBusEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/MessageBusEventListener.java`

- **Date**: Sep. 1, 2023
- **Ticket**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116)
- **What Changed**: The `MessageBusEventListener` interface is removed. Listening for `MessageListener` registration and unregistration events is no longer supported.
- **Reason**: This listener is no longer used.

**Destination.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java`

- **Date**: Sep. 1, 2023
- **Ticket**: [LPS-194337](https://liferay.atlassian.net/browse/LPS-194337)
- **What Changed**: These methods are removed: `copyMessageListeners`, `getMessageListenerCount`, `isRegistered`, `register`, `unregister`. The `MessageListenerRegistry` interface is added to get message listeners associated with a provided destination name. Update your code by registering a `MessageListener` as an OSGi service, using the `destination.name` property.
- **Reason**: This change simplifies the message bus code structure.

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
`portal-kernel/src/com/liferay/portal/kernel/theme/PortletDisplay.java`

-  **Date**: Sep. 5, 2023
-  **Ticket**: [LPS-188270](https://liferay.atlassian.net/browse/LPS-188270)
-  **What Changed**: The `getPortletInstanceConfiguration(Class<T>)` method is removed. Use the `ConfigurationProviderUtil.getPortletInstanceConfiguration(Class<T>, ThemeDisplay)` method or reference the `ConfigurationProvider` class for the same method instead.
-  **Reason**: The `getPortletInstanceConfiguration` method should be handled in `ConfigurationProvider`.

**TriggerConfiguration.java**
`portal-kernel/src/com/liferay/portal/kernel/scheduler/TriggerConfiguration.java`

- **Date**: Sep. 11, 2023
- **Ticket**: [LPS-190994](https://liferay.atlassian.net/browse/LPS-190994)
- **What Changed**: The scheduler framework no longer supports using an empty cron expression (or interval of `0`) to disable a job. Instead, use the component blacklist to disable specific scheduler components. Check the required class names in the error message shown when using an empty cron expression.
- **Reason**: If a job should not be bootstrapped, it should not be registered with the scheduler framework.

## Before Quarterly Releases

These breaking changes came before the first quarterly release (2023 Q3).

### Changes in `portal-impl` Classes

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 10, 2022
- **Ticket**: [LPS-144693](https://liferay.atlassian.net/browse/LPS-144693)
- **What Changed**: The `ehcache.socket.so.timeout` and `ehcache.socket.start.port` portal properties are removed.
- **Reason**: These properties are no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 18, 2022
- **Ticket**: [LPS-145063](https://liferay.atlassian.net/browse/LPS-145063)
- **What Changed**: The `verify.patch.levels.disabled` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 18, 2022
- **Ticket**: [LPS-145076](https://liferay.atlassian.net/browse/LPS-145076)
- **What Changed**: The `auto.deploy.websphere.wsadmin.app.name.suffix` and `auto.deploy.websphere.wsadmin.properties.file.name` portal properties are removed.
- **Reason**: These properties are no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 25, 2022
- **Ticket**: [LPS-145769](https://liferay.atlassian.net/browse/LPS-145769)
- **What Changed**: The `browser.compatibility.ie.versions` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 25, 2022
- **Ticket**: [LPS-145853](https://liferay.atlassian.net/browse/LPS-145853)
- **What Changed**: The `control.panel.navigation.max.sites` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 27, 2022
- **Ticket**: [LPS-145171](https://liferay.atlassian.net/browse/LPS-145171)
- **What Changed**: The `wsadmin.py`, `auto.deploy.websphere.wsadmin.app.manager.install.options`, `auto.deploy.websphere.wsadmin.app.manager.list.options`, `auto.deploy.websphere.wsadmin.app.manager.update.options`, and `auto.deploy.websphere.wsadmin.app.manager.query` portal properties are removed.
- **Reason**: These properties are no longer used.

**wsadmin.py**
`portal-impl/src/com/liferay/portal/deploy/dependencies/wsadmin.py`

- **Date**: Jan. 27, 2022
- **Ticket**: [LPS-145171](https://liferay.atlassian.net/browse/LPS-145171)
- **What Changed**: The `wsadmin.py` file is removed.
- **Reason**: The file was deprecated and no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 27, 2022
- **Ticket**: [LPS-145345](https://liferay.atlassian.net/browse/LPS-145345)
- **What Changed**: The `default.guest.public.layout.column-1`, `default.guest.public.layout.column-2`, `default.guest.public.layout.column-3`, and `default.guest.public.layout.column-4` portal properties are removed.
- **Reason**: These properties are no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 27, 2022
- **Ticket**: [LPS-146148](https://liferay.atlassian.net/browse/LPS-146148)
- **What Changed**: The `control.panel.navigation.max.organizations` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Jan. 31, 2022
- **Ticket**: [LPS-145771](https://liferay.atlassian.net/browse/LPS-145771)
- **What Changed**: The `portlet.url.generate.by.path.enabled` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 4, 2022
- **Ticket**: [LPS-146153](https://liferay.atlassian.net/browse/LPS-146153)
- **What Changed**: The `layout.comments.enabled` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 4, 2022
- **Ticket**: [LPS-146376](https://liferay.atlassian.net/browse/LPS-146376)
- **What Changed**: The `editor.wysiwyg.portal-web.docroot.html.portlet.mail.edit.jsp` and `editor.wysiwyg.portal-web.docroot.html.portlet.mail.edit_message.jsp` portal properties are removed.
- **Reason**: These properties are no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 8, 2022
- **Ticket**: [LPS-145344](https://liferay.atlassian.net/browse/LPS-145344)
- **What Changed**: The `verify.patch.levels.disabled` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 10, 2022
- **Ticket**: [LPS-145600](https://liferay.atlassian.net/browse/LPS-145600)
- **What Changed**: The `multi.value.map.com.liferay.portal.convert.ConvertPermissionAlgorithm.convertResourcePermission` and `multi.value.map.com.liferay.portal.convert.ConvertPermissionAlgorithm.convertRoles` portal properties are removed.
- **Reason**: These properties are no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 10, 2022
- **Ticket**: [LPS-145905](https://liferay.atlassian.net/browse/LPS-145905)
- **What Changed**: The `pop.server.notifications.interval` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 17, 2022
- **Ticket**: [LPS-145571](https://liferay.atlassian.net/browse/LPS-145571)
- **What Changed**: The `index.with.thread` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 17, 2022
- **Ticket**: [LPS-145595](https://liferay.atlassian.net/browse/LPS-145595)
- **What Changed**: The `index.dump.compression.enabled` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 28, 2022
- **Ticket**: [LPS-145773](https://liferay.atlassian.net/browse/LPS-145773)
- **What Changed**: The `users.list.views` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 28, 2022
- **Ticket**: [LPS-145904](https://liferay.atlassian.net/browse/LPS-145904)
- **What Changed**: The `cluster.link.node.bootup.response.timeout` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 28, 2022
- **Ticket**: [LPS-145907](https://liferay.atlassian.net/browse/LPS-145907)
- **What Changed**: The `rtl.css.excluded.paths.regexp` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Feb. 28, 2022
- **Ticket**: [LPS-145919](https://liferay.atlassian.net/browse/LPS-145919)
- **What Changed**: The `scripting.jruby.compile.mode` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Mar. 4, 2022
- **Ticket**: [LPS-145906](https://liferay.atlassian.net/browse/LPS-145906)
- **What Changed**: The `rss.publish.to.live.by.default` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Mar. 4, 2022
- **Ticket**: [LPS-145920](https://liferay.atlassian.net/browse/LPS-145920)
- **What Changed**: The `calendar.publish.to.live.by.default` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Mar. 4, 2022
- **Ticket**: [LPS-146150](https://liferay.atlassian.net/browse/LPS-146150)
- **What Changed**: The `zip.file.name.encoding` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Mar. 4, 2022
- **Ticket**: [LPS-146151](https://liferay.atlassian.net/browse/LPS-146151)
- **What Changed**: The `my.sites.display.style` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Mar. 4, 2022
- **Ticket**: [LPS-147192](https://liferay.atlassian.net/browse/LPS-147192)
- **What Changed**: The `asset.categories.properties.default` portal property is removed.
- **Reason**: This property is no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Mar. 9, 2022
- **Ticket**: [LPS-145921](https://liferay.atlassian.net/browse/LPS-145921)
- **What Changed**: The `dl.folder.icon.check.count`, `dl.file.entry.open.in.ms.office.manual.check.in.required`, `dl.file.entry.version.policy`, `dl.file.entry.thumbnail.video.frame.percentage`, `dl.file.entry.preview.document.depth`, and `dl.file.entry.preview.auto.create.on.upgrade` portal properties are removed.
- **Reason**: These properties are no longer used.

**portal.properties**
`portal-impl/src/portal.properties`

- **Date**: Mar. 18, 2022
- **Ticket**: [LPS-148110](https://liferay.atlassian.net/browse/LPS-148110)
- **What Changed**: The `portal.jaas.impl` and `portal.jaas.strict.password` portal properties are removed.
- **Reason**: These properties are no longer used.
