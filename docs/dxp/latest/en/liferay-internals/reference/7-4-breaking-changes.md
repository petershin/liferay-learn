---
uuid: 9b2c9b01-3a91-48da-b947-8225fc78f9b2
---
# 7.4 Breaking Changes

Here are all of the breaking changes for Liferay 7.4, starting with the first quarterly release (2023 Q3). These changes break or significantly alter existing functionality or code structure. As the product changes and improves, we try our best to minimize these disruptions, but sometimes they are unavoidable.

<!-- So what's your vision for this? This looks different from what I was thinking. My expectation was to see an H2 heading like this: 
        ## 7.4 2023 Q3

        (other stuff here)

    That way, the quarterly releases (and I think this is for Q4, not Q3), all get listed on the right side in Learn, enabling people to jump right to the release (with the latest release on top) they need to see. -Rich -->

## Changes in Liferay DXP

Here is a list of changes that break or significantly alter existing functionality within Liferay.

| **Breaking Change** | **Description** | **Release** | **References** |
| :- | :- | :- | :- |
| **Location of the Mark as Cacheable option for fragments** | Mark (or unmark) fragments as cacheable in the Fragments menu (within the fragment's Actions menu) instead of the editor. This allows you to make this change separately from other edits to the fragment, which reduces the performance cost of propagating it to fragments in use. No implementation changes are necessary with this breaking change. | 2023 Q3 | [LPS-183735](https://liferay.atlassian.net/browse/LPS-183735) |

## Changes in the Source Code

Here are changes to Liferay's individual source code files that can break other code leveraging them, in chronological order.

<!-- I'm not sure the document in liferay-portal is going to be used anymore. -Rich --> 

Read more about 7.4 Breaking Changes directly in the [Liferay source code](https://github.com/liferay/liferay-portal/blob/master/readme/BREAKING_CHANGES.markdown). 

<!-- So you converted Alberto's HTML back into Markdown? Did you use something like Pandoc, or did you do it manually? -Rich --> 

### Modules

**ExtRepository.java**
[`modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java)
* **Release**: 2023 Q3
* **Date**: Sep. 29, 2023
* **Ticket**: [LPS-197315](https://liferay.atlassian.net/browse/LPS-197315)
* **What Changed**: A new `String` parameter (`fileName`) is added to the `addExtRepositoryFileEntry(String, String, String, String, String, InputStream)` method (so it now takes 6 `String` parameters and an `InputStream`).
* **Reason**: The file name is required to create files with a Sharepoint external repository.

**liferay-chart.tld**
`modules/apps/frontend-taglib/frontend-taglib-chart/src/main/resources/META-INF/liferay-chart.tld`
* **Release**: 2023 Q3
* **Date**: Oct. 6, 2023
* **Ticket**: [LPS-198114](https://liferay.atlassian.net/browse/LPS-198114)
* **What Changed**: The Liferay chart module's taglibs are removed.
* **Reason**: These taglibs are no longer used in Liferay, and Liferay removed support for soy.

**CommerceShipmentItemLocalService.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java)
**Release**: 2023 Q3
* **Date**: Oct. 6, 2023
* **Ticket**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534)
* **What Changed**: The `getCommerceShipmentOrderItemsQuantity` method returns a `BigDecimal` instead of an `int` value.
* **Reason**: A `BigDecimal` value is needed for new unit of measurement functionality.

**CommerceShipmentItemService.java**
[modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java)
* **Release**: 2023 Q3
* **Date**: Oct. 6, 2023
* **Ticket**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534)
* **What Changed**: The `getCommerceShipmentOrderItemsQuantity` method returns a `BigDecimal` instead of an `int` value.
* **Reason**: A `BigDecimal` value is needed for new unit of measurement functionality.

**BaseClayTag.java**
`modules/apps/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/base/BaseClayTag.java`
* **Release**: 2023 Q3
* **Date**: Oct. 10, 2023
* **Ticket**: [LPS-198462](https://liferay.atlassian.net/browse/LPS-198462)
* **What Changed** The `BaseClayTag` class is removed.
* **Reason**: The class is no longer used.

**ModelSearchRegistrarHelper.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/ModelSearchRegistrarHelper.java`
* **Release**: 2023 Q3
* **Date**: Oct. 11, 2023
* **Ticket**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809)
* **What Changed**: The `ModelSearchRegistrarHelper` class is removed.
* **Reason**: The search registrar bootstrapping style has changed, and this class is no longer used.

**ModelSearchDefinitionContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/contributor/ModelSearchDefinitionContributor.java`
* **Release**: 2023 Q3
* **Date**: Oct. 11, 2023
* **Ticket**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809)
* **What Changed**: The `ModelSearchDefinitionContributor` class is removed.
* **Reason**: The search registrar bootstrapping style has changed, and this class is no longer used.

**AccountRoleLocalService.java**
[`modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java)
* **Release**: 2023 Q3
* **Date**: Oct. 17, 2023
* **Ticket**: [LPS-173628](https://liferay.atlassian.net/browse/LPS-173628)
* **What Changed**: The `checkCompanyAccountRoles` method is removed.
* **Reason**: The `AddDefaultAccountRolesPortalInstanceLifecycleListener` and `AddDefaultAccountRolesPortletPermissionsPortalInstanceLifecycleListener` classes initialize and check default account roles instead.

**CommerceCheckoutStepHttpHelper.java**
[`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java)
* **Release**: 2023 Q3
* **Date**: Oct. 25, 2023
* **Ticket**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230)
* **What Changed**: The `isActiveShippingMethodCommerceCheckoutStep` method now uses an additional `CommerceOrder` value.
* **Reason**: A `CommerceOrder` value is passed as a parameter to help checkout performance.

**PaymentProcessCheckoutStepDisplayContext.java**
[`modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java)
* **Release**: 2023 Q3
* **Date**: Oct. 25, 2023
* **Ticket**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230)
* **What Changed**: The `PaymentProcessCheckoutStepDisplayContext` method nose uses an additional `CommerceOrder` value.
* **Reason**: A `CommerceOrder` value is passed as a parameter to help checkout performance.

**AssetEntryItemSelectorCriterion.java**
[`modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java)
* **Release**: 2023 Q3
* **Date**: Oct. 30, 2023
* **Ticket**: [LPS-197840](https://liferay.atlassian.net/browse/LPS-197840)
* **What Changed**: The `scopeGroupType` methods are removed.
* **Reason**: The `scopeGroupType` methods are no longer used.

**BasePreviewBackgroundTaskExecutor.java**
[`modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java)
* **Release**: 2023 Q3
* **Date**: Oct. 31, 2023
* **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
* **What Changed**: The class accesses the new `DLFileEntryConfigurationProvider` instead of directly accessing `DLFileEntryConfiguration`.
* **Reason**: The `DLFileEntryConfigurationProvider` class has been added.

**ExtendedObjectClassDefinition.java**
[`modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java)
* **Release**: 2023 Q3
* **Date**: Oct. 31, 2023
* **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
* **What Changed**: The class has a new static method, `getScope(String)`.
* **Reason**: The new method allows for retrieving a `Scope` object with a String scope value.

**DLFileEntryConfiguration.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java)
* **Release**: 2023 Q3
* **Date**: Oct. 31, 2023
* **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
* **What Changed**: The class uses a new attribute, `maxNumberOfPages`. This was formerly part of `PDFPreviewConfiguration`.
* **Reason**: `PDFPreviewConfiguration` is no longer used.

**DLFileEntryConfigurationProvider.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java)
* **Release**: 2023 Q3
* **Date**: Oct. 31, 2023
* **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
* **What Changed**: This class is a new configuration provider for `DLFileEntryConfiguration`.
* **Reason**: This configuration provider gives easier access to multiple configuration levels (system, instance, and site) for `DLFileEntryConfiguration`.

**DLFileEntryConfigurationConstants.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java)
* **Release**: 2023 Q3
* **Date**: Oct. 31, 2023
* **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
* **What Changed**: This a newly added class.
* **Reason**: This class defines common values to handle `DLFileEntryConfiguration` attributes.

**DLFileEntryConfigurationException.java**
[`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java)
* **Release**: 2023 Q3
* **Date**: Oct. 31, 2023
* **Ticket**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032)
* **What Changed**: This is a new type of Exception.
* **Reason**: This Exception is now used when an invalid value is set for `DLFileEntryConfiguration` attributes.

**CPContentHelper.java**
[`modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java)
* **Release**: 2023 Q3
* **Date**: Nov. 4, 2023
* **Ticket**: [COMMERCE-12579](https://liferay.atlassian.net/browse/COMMERCE-12579)
* **What Changed**: The `hasDirectReplacement` method is renamed to `isDirectReplacement`.
* **Reason**: The method now checks for whether the SKU is a replacement of another product, instead of checking whether it has replacements.

### `portal-impl` Classes

**UserImpl.java**
[`portal-impl/src/com/liferay/portal/model/impl/UserImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/impl/UserImpl.java)
* **Release**: 2023 Q3
* **Date**: Oct. 4, 2023
* **Ticket**: [LPS-196035](https://liferay.atlassian.net/browse/LPS-196035)
* **What Changed**: WebDAV clients must use `userId` instead of the user's screen name, email address, or regular password to authenticate via Digest Auth.
* **Reason**: WebDAV now requires each user to generate a separate password for access, requiring the user to take actions to change their accout settings. The user experience is simplified to use `userId` to compensate, avoiding unexpected WebDAV access rejections.

**portal.properties**
[`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties)
* **Release**: 2023 Q3
* **Date**: Oct. 8, 2023
* **Ticket**: [LPS-189621](https://liferay.atlassian.net/browse/LPS-189621)
* **What Changed**: The `sql.data.max.parameters` property is removed.
* **Reason**: The database-specific `database.max.parameters` property should be used instead.

**OpenIdUtil.java**
`portal-impl/src/com/liferay/portal/util/OpenIdUtil.java`
* **Release**: 2023 Q3
* **Date**: Oct. 19, 2023
* **Ticket**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877)
* **What Changed**: The `OpenIdUtil` class is removed. Use `OpenIdConnect` instead.
* **Reason**: OpenID has been deprecated and Liferay no longer uses it internally.

**PersistedModelLocalServiceRegistryUtil.java**
[`portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java)
* **Release**: 2023 Q3
* **Date**: Oct. 20, 2023
* **Ticket**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563)
* **What Changed**: The `PersistedModelLocalServiceRegistryUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**HttpAuthManagerUtil.java**
[`portal-impl/src/com/liferay/portal/security/auth/http.HttpAuthManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/http/HttpAuthManagerUtil.java)
* **Release**: 2023 Q3
* **Date**: Oct. 21, 2023
* **Ticket**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376)
* **What Changed**: The `HttpAuthManagerUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**ImageToolUtil.java**
[`portal-impl/src/com/liferay/portal/image/ImageToolUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/image/ImageToolUtil.java)**
* **Release**: 2023 Q3
* **Date**: Oct. 21, 2023
* **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
* **What Changed**: The `ImageToolUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**DLPreviewableProcessor.java**
`portal-impl/src/com/liferay/document/library/kernel/util/DLPreviewableProcessor.java`
* **Release**: 2023 Q3
* **Date**: Oct. 21, 2023
* **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
* **What Changed**: The `DLPreviewableProcessor` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**RoleMembershipPolicyFactoryUtil.java**
[`portal-kernel/src/com/liferay/portal/kernel/security.membershippolicy.RoleMembershipPolicyFactoryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyFactoryUtil.java)
* **Release** 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
* **What Changed**: The `RoleMembershipPolicyFactoryUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**RoleMembershipPolicyUtil.java**
[`https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java)
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
* **What Changed**: The `RoleMembershipPolicyUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**AuthenticatedSessionManagerUtil.java**
[`portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java)
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165)
* **What Changed**: The `AuthenticatedSessionManagerUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**Success.java**
[`portal-impl/src/com/liferay/portal/xmlrpc/Success.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Success.java)
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
* **What Changed**: The `Success` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**Fault.java**
[`portal-impl/src/com/liferay/portal/xmlrpc/Fault.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Fault.java)
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
* **What Changed**: The `Fault` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**XmlRpcUtil.java**
[`portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java)
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
* **What Changed**: The `XmlRpcUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

**StartupHelperUtil.java**
[`portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java)
* **Release**: 2023 Q3
* **Date**: Nov. 2, 2023
* **Ticket**: [LPS-200501](https://liferay.atlassian.net/browse/LPS-200501)
* **What Changed**: The `isStartupFinished` and `setStartupFinished(boolean)` methods are removed.
* **Reason**: The flag does not accurately reflect the startup status, so the methods are removed to avoid incorrect usage.

**ModelAdapterUtil.java**
[`portal-impl/src/com/liferay/portal/model/adapter/ModelAdapterUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/adapter/util/ModelAdapterUtil.java)
* **Release**: 2023 Q3
* **Date**: Nov. 3, 2023
* **Ticket**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825)
* **What Changed**: The `ModelAdapterUtil` class is refactored from `portal-kernel` to `portal-impl`. Add `portal-impl` to the build's dependencies to continue using it.
* **Reason**: The class is moved into `portal-impl` to simplify the code structure.

### `portal-kernel` classes

**DLProcessorRegistry.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistry.java`
* **Release**: 2023 Q3
* **Date**: Sep. 27, 2023
* **Ticket**: [LPS-196698](https://liferay.atlassian.net/browse/LPS-196698)
* **What Changed**: The `getPreviewableProcessorMaxSize` method is added.
* **Reason**: The method is needed to retrieve the configuration value.

**FormNavigatorEntryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/servlet/taglib/ui/FormNavigatorEntryUtil.java`
* **Release**: 2023 Q3
* **Date**: Oct. 12, 2023
* **Ticket**: [LPS-198653](https://liferay.atlassian.net/browse/LPS-198653)
* **What Changed**: The `FormNavigatorEntryUtil` class is removed. Use the OSGi service provided in `FormNavigatorEntryProvider` instead.
* **Reason**: The class is no longer used.

**OpenId.java**
`portal-kernel/src/com/liferay/portal/kernel/openid/OpenId.java`
* **Release**: 2023 Q3
* **Date**: Oct. 19, 2023
* **Ticket**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877)
* **What Changed**: The `OpenId` class is removed. Use `OpenIdConnect` instead.
* **Reason**: OpenID has been deprecated and Liferay no longer uses it internally.

**PersistedModelLocalServiceRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/service/PersistedModelLocalServiceRegistry.java`
* **Release**: 2023 Q3
* **Date**: Oct. 20, 2023
* **Ticket**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563)
* **What Changed**: The `PersistedModelLocalServiceRegistry` class is removed. Use `PersistedModelLocalServiceRegistryUtil` (which is also refactored into `portal-impl`) instead.
* **Reason**: The service collection and look-up logic is refactored into `PersistedModelLocalServiceRegistryUtil`.

**ImageTool.java**
`portal-kernel/src/com/liferay/portal/kernel/image/ImageTool.java`
* **Release**: 2023 Q3
* **Date**: Oct. 21, 2023
* **Ticket**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319)
* **What Changed**: The `ImageTool` class is removed. Its constant fields are refactored to `ImageConstants`, except for constants related to image orientation, which are removed. Use `ImageToolUtil`'s static methods or the constants in `ImageConstants` instead.
* **Reason**: The class is no longer used.

**PortletPermission.java**
`portal-kernel/src/com/liferay/portal/kernel/service/permission/PortletPermission.java`
* **Release**: 2023 Q3
* **Date**: Oct. 21, 2023
* **Ticket**: [LPS-196101](https://liferay.atlassian.net/browse/LPS-196101)
* **What Changed**: The `PortletPermission` class is removed. Use `PortletPermissionUtil` instead.
* **Reason**: The class is no longer used.

**RoleMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/RoleMembershipPolicyFactory.java`
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389)
* **What Changed**: The `RoleMembershipPolicyFactory` class is removed. Use `RoleMembershipPolicyFactoryUtil` (which is moved to `portal-impl`) instead.
* **Reason**: The class is no longer used.

**ThreadLocalDistributor.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributor.java`
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859)
* **What Changed**: The `ThreadLocalDistributor` class is removed.
* **Reason**: The class is no longer used.

**ThreadLocalDistributorRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributorRegistry.java`
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859)
* **What Changed**: The `ThreadLocalDistributorRegistry` class is removed.
* **Reason**: The class is no longer used.

**HttpAuthManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/http/HttpAuthManager.java`
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376)
* **What Changed**: The `HttpAuthManger` class is removed. Use `HttpAuthManagerUtil` instead.
* **Reason**: The class is no longer used. 

**XmlRpcParser.java**
`portal-kernel/src/com/liferay/portal/kernel.xmlrpc.XmlRpcParser.java`
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164)
* **What Changed**: The `XmlRpcParser` class is refactored into the `XmlRpcUtil` class (which is also now in `portal-impl`).
* **Reason**: The `XmlRpcParser` and `XmlRpcUtil` classes were closely related and depended on each other, so the two classes have been combined.

**AuthenticatedSessionManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/session/AuthenticatedSessionManager.java`
* **Release**: 2023 Q3
* **Date**: Oct. 23, 2023
* **Ticket**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165)
* **What Changed**: The `AuthenticatedSessionManager` class is removed. Use `AuthenticatedSessionManagerUtil` instead.
* **Reason**: The class is no longer used.

**TemplateManagerUtil.java**
[`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java)
* **Release**: 2023 Q3
* **Date**: Oct. 26, 2023
* **Ticket**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072)
* **What Changed**: The `destroy` and `getTemplateManagers` methods are removed.
* **Reason** These methods are no longer used.

**TemplateManager.java**
[`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java)
* **Release**: 2023 Q3
* **Date**: Oct. 26, 2023
* **Ticket**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072)
* **What Changed**: The `init` and `destroy` methods are removed.
* **Reason**: The lifecycle management is moved into internal service logic. The service's consumers should not directly control its lifecycle.

**ModelAdapterBuilderLocator.java**
`portal-kernel/src/com/liferay/portal/kernel/model/adapter/builder/ModelAdapterBuilderLocator.java`
* **Release**: 2023 Q3
* **Date**: Nov. 3, 2023
* **Ticket**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825)
* **What Changed**: The `ModelAdapterBuilderLocator` class is removed. Use `ModelAdapterUtil` directly instead.
* **Reason**: The class is no longer used.

**AssetEntriesFacet.java**
`portal-kernel/src/com/liferay/portal/kernel/search/facet/AssetEntriesFacet.java`
* **Release**: 2023 Q3
* **Date**: Nov. 3, 2023
* **Ticket**: [LPS-200073](https://liferay.atlassian.net/browse/LPS-200073)
* **What Changed**: The `AssetEntriesFacet` class is removed, in favor of logic from `FacetImpl`.
* **Reason**: The class is no longer used.

**AuditMessageFactory.java**
[`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java)
* **Release**: 2023 Q3
* **Date**: Nov. 7, 2023
* **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
* **What Changed**: Logic from `AuditMessageFactoryUtil` and `AuditMessageFactoryImpl` have been refactored into `AuditMessageFactory`.
* **Reason**: The logic was unnecessarily split between classes, so it is now combined into the `AuditMessageFactory` class to simplify the code structure.

**AuditMessageFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.java`
* **Release**: 2023 Q3
* **Date**: Nov. 7, 2023
* **Ticket**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086)
* **What Changed**: The `AuditMessageFactoryUtil` class is removed. The logic has been refactored into `AuditMessageFactory`.
* **Reason**: The logic was unnecessarily split between classes, so it is now combined into the `AuditMessageFactory` class to simplify the code structure.

**PortletToolbar.java**
[`portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java)
* **Release**: 2023 Q3
* **Date**: Nov. 21, 2023
* **Ticket**: [LPS-200453](https://liferay.atlassian.net/browse/LPS-200453)
* **What Changed**: The `PortletToolbar` class's constructor is now private. Use `PortletToolbar.INSTANCE` to get an instance of `PortletToolbar` instead.
* **Reason**: `PortletToolbar` is no longer in `util-spring`, so it needs a static instance instead.

### Taglibs

**`liferay-commerce` taglibs**
* **Release**: 2023 Q3
* **Date**: Oct. 16, 2023
* **Ticket**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170)
* **What Changed**: The `SearchInputTag` and `UserManagementBarTag` taglibs are removed.
* **Reason**: These were internal taglibs and are no longer used. They also used obsolete markup and logic.

**`liferay-export-import-changeset` taglibs
* **Release**: 2023 Q3
* **Date**: Oct. 16, 2023
* **Ticket**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170)
* **What Changed**: These taglibs were removed: `AddEntitiesTag`, `AddEntityTag`, `CreateTag`, `CreateTei`, `ExportEntityTag`, `ExportImportEntityManagementBarButtonTag`, `ExportImportEntitySearchContainerMappingTag`, `ImportEntityTag`, `PublishChangesetTag`, and `PublishModelMenuItemTag`.
* **Reason**: These were internal taglibs and are no longer used. They also used obsolete markup and logic.
