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
