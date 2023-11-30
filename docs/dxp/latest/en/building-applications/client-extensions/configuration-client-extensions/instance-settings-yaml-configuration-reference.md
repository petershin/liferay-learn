---
uuid: 57ce5bc2-3e8a-4c7a-b379-bbcc42ae6784
---
# Instance Settings YAML Configuration Reference

You can use an instance settings client extension to configure a [wide variety of Liferay configurations](#currently-supported-instance-settings-pids). Each configuration is referenced by its PID (Persistent IDentity).

You can define an instance settings client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines an instance settings client extension:

```yaml
yoke-instance-settings:
    type: instanceSettings
```

## YAML Properties

These properties are specific to instance settings client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `description` | String | | The client extension's description. |
| `name` | String | (Derived) | The client extension's name. |
| `pid` | String | | The PID (Persistent IDentity) of the configured instance setting (from the [currently supported instance settings PIDs](#currently-supported-instance-settings-pids).) |

## Additional Properties

Instance settings client extensions are accompanied by additional properties which are defined by the schema for the PID (a Java class).

The schema PID is defined in the annotation property `@Meta.OCD.id` as follows:

```java
@Meta.OCD(
	id = "com.liferay.foo.FooConfiguration"
)
```

Configure this property in a client extension definition like this:

```yaml
yoke-instance-settings:
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

The following sections are examples of the types of properties in the schema classes and how to include them in the client extension definition.

### Scalar Properties

Given the following scalar schema property definition, in this case an `int` (integer):

```java
@Meta.AD(...)
public int invitationTokenExpirationTime();
```

Configure the `invitationTokenExpirationTime` client extension property as a scalar YAML property:

```yaml
yoke-instance-settings:
    invitationTokenExpirationTime: 600
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

Scalar properties include these data types:

* `int` (integer)
* `short`
* `long`
* `byte`
* `float` (decimal number)
* `double` (double-precision decimal number)
* `character`
* `boolean`
* `String`

### Array Property Example

Given the following array schema property definition:

```java
@Meta.AD(...)
public String[] customTLDs();
```

Configure the `customTLDs` client extension property as a YAML array:

```yaml
yoke-instance-settings:
    customTLDs:
        - "foo.net"
        - "*.other.com"
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

### LocalizedValuesMap Property Example

Given the following `LocalizedValuesMap` schema property definition:

```java
@Meta.AD(...)
public LocalizedValuesMap invitationEmailBody();
```

Configure the `invitationEmailBody` client extension property as a YAML object, where each object key is a specific locale string:

```yaml
yoke-instance-settings:
    invitationEmailBody:
        en_US: |
            <p>
                Follow the link below to set up your account:<br />
                <a href="[$CREATE_ACCOUNT_URL$]">Create Account</a>
                <br />
                <font size="-2">The link will expire after 3 days.</font>
            </p>
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

## Currently Supported Instance settings PIDs

Here are all of the PIDs that you can reference in an instance setting client extension, scoped by [virtual instance](#virtual-instance-scoped-pids) or by [site](#site-scoped-pids).

### Virtual Instance Scoped PIDs:

These PIDs allow for the configuration of virtual instance-scoped settings.

<!--
```bash
for o in $(git -P grep -l 'scope = ExtendedObjectClassDefinition.Scope.COMPANY' -- $(git grep -l '@ExtendedObjectClassDefinition' -- '*.java')); do i="${o#*src/main/java/}"; i="${i%.java}"; echo "<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/${o}'><code>${i//\//.}</code></a></li>"; done
```
-->

<ul>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/account/account-api/src/main/java/com/liferay/account/configuration/AccountEntryEmailConfiguration.java'><code>com.liferay.account.configuration.AccountEntryEmailConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/account/account-api/src/main/java/com/liferay/account/configuration/AccountEntryEmailDomainsConfiguration.java'><code>com.liferay.account.configuration.AccountEntryEmailDomainsConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/adaptive-media/adaptive-media-image-impl/src/main/java/com/liferay/adaptive/media/image/internal/configuration/AMImageCompanyConfiguration.java'><code>com.liferay.adaptive.media.image.internal.configuration.AMImageCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/ai-creator/ai-creator-openai-api/src/main/java/com/liferay/ai/creator/openai/configuration/AICreatorOpenAICompanyConfiguration.java'><code>com.liferay.ai.creator.openai.configuration.AICreatorOpenAICompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/analytics/analytics-settings-api/src/main/java/com/liferay/analytics/settings/configuration/AnalyticsConfiguration.java'><code>com.liferay.analytics.settings.configuration.AnalyticsConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-google-cloud-natural-language-impl/src/main/java/com/liferay/asset/auto/tagger/google/cloud/natural/language/internal/configuration/GCloudNaturalLanguageAssetAutoTaggerCompanyConfiguration.java'><code>com.liferay.asset.auto.tagger.google.cloud.natural.language.internal.configuration.GCloudNaturalLanguageAssetAutoTaggerCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-opennlp-impl/src/main/java/com/liferay/asset/auto/tagger/opennlp/internal/configuration/OpenNLPDocumentAssetAutoTaggerCompanyConfiguration.java'><code>com.liferay.asset.auto.tagger.opennlp.internal.configuration.OpenNLPDocumentAssetAutoTaggerCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-service/src/main/java/com/liferay/asset/auto/tagger/internal/configuration/AssetAutoTaggerCompanyConfiguration.java'><code>com.liferay.asset.auto.tagger.internal.configuration.AssetAutoTaggerCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-categories-api/src/main/java/com/liferay/asset/categories/configuration/AssetCategoriesCompanyConfiguration.java'><code>com.liferay.asset.categories.configuration.AssetCategoriesCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/batch-engine/batch-engine-api/src/main/java/com/liferay/batch/engine/configuration/BatchEngineTaskCompanyConfiguration.java'><code>com.liferay.batch.engine.configuration.BatchEngineTaskCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/change-tracking/change-tracking-api/src/main/java/com/liferay/change/tracking/configuration/CTSettingsConfiguration.java'><code>com.liferay.change.tracking.configuration.CTSettingsConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/change-tracking/change-tracking-web/src/main/java/com/liferay/change/tracking/web/internal/configuration/CTConfiguration.java'><code>com.liferay.change.tracking.web.internal.configuration.CTConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/click-to-chat/click-to-chat-web/src/main/java/com/liferay/click/to/chat/web/internal/configuration/ClickToChatConfiguration.java'><code>com.liferay.click.to.chat.web.internal.configuration.ClickToChatConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/configuration/CommercePaymentEntryAuditConfiguration.java'><code>com.liferay.commerce.payment.configuration.CommercePaymentEntryAuditConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPDefinitionOptionRelConfiguration.java'><code>com.liferay.commerce.product.configuration.CPDefinitionOptionRelConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPFriendlyURLConfiguration.java'><code>com.liferay.commerce.product.configuration.CPFriendlyURLConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/AccountEntryCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.AccountEntryCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/AccountGroupCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.AccountGroupCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/AddressCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.AddressCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/COREntryCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.COREntryCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceChannelCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommerceChannelCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceCurrencyCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommerceCurrencyCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceDiscountCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommerceDiscountCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceInventoryWarehouseCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommerceInventoryWarehouseCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceOrderTypeCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommerceOrderTypeCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommercePaymentMethodGroupRelCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommercePaymentMethodGroupRelCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommercePriceListCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommercePriceListCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceShippingFixedOptionCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommerceShippingFixedOptionCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceTermEntryCommerceQualifierConfiguration.java'><code>com.liferay.commerce.qualifier.configuration.CommerceTermEntryCommerceQualifierConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/digital-signature/digital-signature-api/src/main/java/com/liferay/digital/signature/configuration/DigitalSignatureConfiguration.java'><code>com.liferay.digital.signature.configuration.DigitalSignatureConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-asset-auto-tagger-google-cloud-vision/src/main/java/com/liferay/document/library/asset/auto/tagger/google/cloud/vision/internal/configuration/GCloudVisionAssetAutoTagProviderCompanyConfiguration.java'><code>com.liferay.document.library.asset.auto.tagger.google.cloud.vision.internal.configuration.GCloudVisionAssetAutoTagProviderCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-asset-auto-tagger-microsoft-cognitive-services/src/main/java/com/liferay/document/library/asset/auto/tagger/microsoft/cognitive/services/internal/configuration/MSCognitiveServicesAssetAutoTagProviderCompanyConfiguration.java'><code>com.liferay.document.library.asset.auto.tagger.microsoft.cognitive.services.internal.configuration.MSCognitiveServicesAssetAutoTagProviderCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-asset-auto-tagger-tensorflow/src/main/java/com/liferay/document/library/asset/auto/tagger/tensorflow/internal/configuration/TensorFlowImageAssetAutoTagProviderCompanyConfiguration.java'><code>com.liferay.document.library.asset.auto.tagger.tensorflow.internal.configuration.TensorFlowImageAssetAutoTagProviderCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-google-drive-api/src/main/java/com/liferay/document/library/google/drive/configuration/DLGoogleDriveCompanyConfiguration.java'><code>com.liferay.document.library.google.drive.configuration.DLGoogleDriveCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-web/src/main/java/com/liferay/document/library/web/internal/configuration/CacheControlConfiguration.java'><code>com.liferay.document.library.web.internal.configuration.CacheControlConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/export-import/export-import-api/src/main/java/com/liferay/exportimport/configuration/ExportImportServiceConfiguration.java'><code>com.liferay.exportimport.configuration.ExportImportServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/flags/flags-api/src/main/java/com/liferay/flags/configuration/FlagsGroupServiceConfiguration.java'><code>com.liferay.flags.configuration.FlagsGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/configuration/FragmentServiceConfiguration.java'><code>com.liferay.fragment.configuration.FragmentServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-entry-processor/fragment-entry-processor-freemarker/src/main/java/com/liferay/fragment/entry/processor/freemarker/internal/configuration/FreeMarkerFragmentEntryProcessorConfiguration.java'><code>com.liferay.fragment.entry.processor.freemarker.internal.configuration.FreeMarkerFragmentEntryProcessorConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-web/src/main/java/com/liferay/fragment/web/internal/configuration/FragmentPortletConfiguration.java'><code>com.liferay.fragment.web.internal.configuration.FragmentPortletConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/friendly-url/friendly-url-api/src/main/java/com/liferay/friendly/url/configuration/FriendlyURLRedirectionConfiguration.java'><code>com.liferay.friendly.url.configuration.FriendlyURLRedirectionConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/frontend-js/frontend-js-web/src/main/java/com/liferay/frontend/js/web/internal/configuration/CustomDialogsSettingsConfiguration.java'><code>com.liferay.frontend.js.web.internal.configuration.CustomDialogsSettingsConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/journal/journal-api/src/main/java/com/liferay/journal/configuration/JournalServiceConfiguration.java'><code>com.liferay.journal.configuration.JournalServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-content-page-editor-web/src/main/java/com/liferay/layout/content/page/editor/web/internal/configuration/PageEditorConfiguration.java'><code>com.liferay.layout.content.page.editor.web.internal.configuration.PageEditorConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-locked-layouts-web/src/main/java/com/liferay/layout/locked/layouts/web/internal/configuration/LockedLayoutsCompanyConfiguration.java'><code>com.liferay.layout.locked.layouts.web.internal.configuration.LockedLayoutsCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-reports-web/src/main/java/com/liferay/layout/reports/web/internal/configuration/LayoutReportsGooglePageSpeedCompanyConfiguration.java'><code>com.liferay.layout.reports.web.internal.configuration.LayoutReportsGooglePageSpeedCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-seo-service/src/main/java/com/liferay/layout/seo/internal/configuration/LayoutSEOCompanyConfiguration.java'><code>com.liferay.layout.seo.internal.configuration.LayoutSEOCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-set-prototype-api/src/main/java/com/liferay/layout/set/prototype/configuration/LayoutSetPrototypeConfiguration.java'><code>com.liferay.layout.set.prototype.configuration.LayoutSetPrototypeConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/mail/mail-outlook-auth-connector-provider/src/main/java/com/liferay/mail/outlook/auth/connector/provider/internal/configuration/MailOutlookAuthConnectorCompanyConfiguration.java'><code>com.liferay.mail.outlook.auth.connector.provider.internal.configuration.MailOutlookAuthConnectorCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/oauth2-provider/oauth2-provider-rest/src/main/java/com/liferay/oauth2/provider/rest/internal/configuration/OAuth2InAssertionConfiguration.java'><code>com.liferay.oauth2.provider.rest.internal.configuration.OAuth2InAssertionConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/oauth2-provider/oauth2-provider-rest/src/main/java/com/liferay/oauth2/provider/rest/internal/endpoint/authorize/configuration/AuthorizeScreenConfiguration.java'><code>com.liferay.oauth2.provider.rest.internal.endpoint.authorize.configuration.AuthorizeScreenConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-crypto-hash/portal-crypto-hash-provider/portal-crypto-hash-provider-bcrypt/src/main/java/com/liferay/portal/crypto/hash/provider/bcrypt/internal/configuration/BCryptCryptoHashProviderConfiguration.java'><code>com.liferay.portal.crypto.hash.provider.bcrypt.internal.configuration.BCryptCryptoHashProviderConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-crypto-hash/portal-crypto-hash-provider/portal-crypto-hash-provider-message-digest/src/main/java/com/liferay/portal/crypto/hash/provider/message/digest/internal/configuration/MessageDigestCryptoHashProviderConfiguration.java'><code>com.liferay.portal.crypto.hash.provider.message.digest.internal.configuration.MessageDigestCryptoHashProviderConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-remote/portal-remote-cors-api/src/main/java/com/liferay/portal/remote/cors/configuration/PortalCORSConfiguration.java'><code>com.liferay.portal.remote.cors.configuration.PortalCORSConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-api/src/main/java/com/liferay/portal/search/elasticsearch7/configuration/DeepPaginationConfiguration.java'><code>com.liferay.portal.search.elasticsearch7.configuration.DeepPaginationConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-search/portal-search-rest-api/src/main/java/com/liferay/portal/search/rest/configuration/SearchSuggestionsCompanyConfiguration.java'><code>com.liferay.portal.search.rest.configuration.SearchSuggestionsCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-search/portal-search/src/main/java/com/liferay/portal/search/internal/configuration/AsahSearchKeywordsConfiguration.java'><code>com.liferay.portal.search.internal.configuration.AsahSearchKeywordsConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security-sso/portal-security-sso-openid-connect-impl/src/main/java/com/liferay/portal/security/sso/openid/connect/internal/configuration/OpenIdConnectProviderConfiguration.java'><code>com.liferay.portal.security.sso.openid.connect.internal.configuration.OpenIdConnectProviderConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-api/src/main/java/com/liferay/portal/security/configuration/BasicAuthHeaderSupportConfiguration.java'><code>com.liferay.portal.security.configuration.BasicAuthHeaderSupportConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-auto-login/src/main/java/com/liferay/portal/security/auto/login/internal/basic/auth/header/configuration/BasicAuthHeaderAutoLoginConfiguration.java'><code>com.liferay.portal.security.auto.login.internal.basic.auth.header.configuration.BasicAuthHeaderAutoLoginConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/authenticator/configuration/LDAPAuthConfiguration.java'><code>com.liferay.portal.security.ldap.authenticator.configuration.LDAPAuthConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/configuration/LDAPServerConfiguration.java'><code>com.liferay.portal.security.ldap.configuration.LDAPServerConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/configuration/SystemLDAPConfiguration.java'><code>com.liferay.portal.security.ldap.configuration.SystemLDAPConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/exportimport/configuration/LDAPExportConfiguration.java'><code>com.liferay.portal.security.ldap.exportimport.configuration.LDAPExportConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/exportimport/configuration/LDAPImportConfiguration.java'><code>com.liferay.portal.security.ldap.exportimport.configuration.LDAPImportConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-vulcan/portal-vulcan-impl/src/main/java/com/liferay/portal/vulcan/internal/configuration/HeadlessAPICompanyConfiguration.java'><code>com.liferay.portal.vulcan.internal.configuration.HeadlessAPICompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-vulcan/portal-vulcan-impl/src/main/java/com/liferay/portal/vulcan/internal/configuration/VulcanCompanyConfiguration.java'><code>com.liferay.portal.vulcan.internal.configuration.VulcanCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/product-navigation/product-navigation-applications-menu-api/src/main/java/com/liferay/product/navigation/applications/menu/configuration/ApplicationsMenuInstanceConfiguration.java'><code>com.liferay.product.navigation.applications.menu.configuration.ApplicationsMenuInstanceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/configuration/PersonalMenuConfiguration.java'><code>com.liferay.product.navigation.personal.menu.configuration.PersonalMenuConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/redirect/redirect-service/src/main/java/com/liferay/redirect/internal/configuration/RedirectURLConfiguration.java'><code>com.liferay.redirect.internal.configuration.RedirectURLConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/segments/segments-api/src/main/java/com/liferay/segments/configuration/SegmentsCompanyConfiguration.java'><code>com.liferay.segments.configuration.SegmentsCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/segments/segments-context-vocabulary/src/main/java/com/liferay/segments/context/vocabulary/internal/configuration/SegmentsContextVocabularyCompanyConfiguration.java'><code>com.liferay.segments.context.vocabulary.internal.configuration.SegmentsContextVocabularyCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/sharing/sharing-service/src/main/java/com/liferay/sharing/internal/configuration/SharingCompanyConfiguration.java'><code>com.liferay.sharing.internal.configuration.SharingCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/social/social-activity-impl/src/main/java/com/liferay/social/activity/internal/configuration/SocialActivityCompanyConfiguration.java'><code>com.liferay.social.activity.internal.configuration.SocialActivityCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/staging/staging-api/src/main/java/com/liferay/staging/configuration/StagingConfiguration.java'><code>com.liferay.staging.configuration.StagingConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-aws/src/main/java/com/liferay/translation/translator/aws/internal/configuration/AWSTranslatorConfiguration.java'><code>com.liferay.translation.translator.aws.internal.configuration.AWSTranslatorConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-azure/src/main/java/com/liferay/translation/translator/azure/internal/configuration/AzureTranslatorConfiguration.java'><code>com.liferay.translation.translator.azure.internal.configuration.AzureTranslatorConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-deepl/src/main/java/com/liferay/translation/translator/deepl/internal/configuration/DeepLTranslatorConfiguration.java'><code>com.liferay.translation.translator.deepl.internal.configuration.DeepLTranslatorConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-google-cloud/src/main/java/com/liferay/translation/translator/google/cloud/internal/configuration/GoogleCloudTranslatorConfiguration.java'><code>com.liferay.translation.translator.google.cloud.internal.configuration.GoogleCloudTranslatorConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/user-associated-data/user-associated-data-web/src/main/java/com/liferay/user/associated/data/web/internal/configuration/AnonymousUserConfiguration.java'><code>com.liferay.user.associated.data.web.internal.configuration.AnonymousUserConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/document-library-opener/document-library-opener-onedrive-web/src/main/java/com/liferay/document/library/opener/onedrive/web/internal/configuration/DLOneDriveCompanyConfiguration.java'><code>com.liferay.document.library.opener.onedrive.web.internal.configuration.DLOneDriveCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-email-otp-api/src/main/java/com/liferay/multi/factor/authentication/email/otp/configuration/MFAEmailOTPConfiguration.java'><code>com.liferay.multi.factor.authentication.email.otp.configuration.MFAEmailOTPConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-fido2-web/src/main/java/com/liferay/multi/factor/authentication/fido2/web/internal/configuration/MFAFIDO2Configuration.java'><code>com.liferay.multi.factor.authentication.fido2.web.internal.configuration.MFAFIDO2Configuration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-ip-address-impl/src/main/java/com/liferay/multi/factor/authentication/ip/address/internal/configuration/MFAIPAddressConfiguration.java'><code>com.liferay.multi.factor.authentication.ip.address.internal.configuration.MFAIPAddressConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-sample/src/main/java/com/liferay/multi/factor/authentication/sample/internal/configuration/MFASampleConfiguration.java'><code>com.liferay.multi.factor.authentication.sample.internal.configuration.MFASampleConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-timebased-otp-web/src/main/java/com/liferay/multi/factor/authentication/timebased/otp/web/internal/configuration/MFATimeBasedOTPConfiguration.java'><code>com.liferay.multi.factor.authentication.timebased.otp.web.internal.configuration.MFATimeBasedOTPConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/saml/saml-api/src/main/java/com/liferay/saml/runtime/configuration/SamlProviderConfiguration.java'><code>com.liferay.saml.runtime.configuration.SamlProviderConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/search-experiences/search-experiences-api/src/main/java/com/liferay/search/experiences/configuration/SemanticSearchConfiguration.java'><code>com.liferay.search.experiences.configuration.SemanticSearchConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/search-experiences/search-experiences-service/src/main/java/com/liferay/search/experiences/internal/configuration/IpstackConfiguration.java'><code>com.liferay.search.experiences.internal.configuration.IpstackConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/search-experiences/search-experiences-service/src/main/java/com/liferay/search/experiences/internal/configuration/OpenWeatherMapConfiguration.java'><code>com.liferay.search.experiences.internal.configuration.OpenWeatherMapConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/segments/segments-asah-connector/src/main/java/com/liferay/segments/asah/connector/internal/configuration/SegmentsAsahCompanyConfiguration.java'><code>com.liferay.segments.asah.connector.internal.configuration.SegmentsAsahCompanyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/sharepoint-rest/sharepoint-rest-repository/src/main/java/com/liferay/sharepoint/rest/repository/internal/configuration/SharepointRepositoryConfiguration.java'><code>com.liferay.sharepoint.rest.repository.internal.configuration.SharepointRepositoryConfiguration</code></a></li>
</ul>

### Site Scoped PIDs:

These PIDs allow for the configuration of site-scoped settings.

Specifying site settings in this bare form sets the default for all sites in the virtual instance.

<!--
```bash
for o in $(git -P grep -l 'scope = ExtendedObjectClassDefinition.Scope.GROUP' -- $(git grep -l '@ExtendedObjectClassDefinition' -- '*.java')); do i="${o#*src/main/java/}"; i="${i%.java}"; echo "<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/${o}'><code>${i//\//.}</code></a></li>"; done
```
-->

<ul>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/accessibility/accessibility-menu-web/src/main/java/com/liferay/accessibility/menu/web/internal/configuration/AccessibilityMenuConfiguration.java'><code>com.liferay.accessibility.menu.web.internal.configuration.AccessibilityMenuConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/account/account-service/src/main/java/com/liferay/account/internal/configuration/AccountEntryGroupConfiguration.java'><code>com.liferay.account.internal.configuration.AccountEntryGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/ai-creator/ai-creator-openai-api/src/main/java/com/liferay/ai/creator/openai/configuration/AICreatorOpenAIGroupConfiguration.java'><code>com.liferay.ai.creator.openai.configuration.AICreatorOpenAIGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-service/src/main/java/com/liferay/asset/auto/tagger/internal/configuration/AssetAutoTaggerGroupConfiguration.java'><code>com.liferay.asset.auto.tagger.internal.configuration.AssetAutoTaggerGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/blogs/blogs-api/src/main/java/com/liferay/blogs/configuration/BlogsGroupServiceConfiguration.java'><code>com.liferay.blogs.configuration.BlogsGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/bookmarks/bookmarks-api/src/main/java/com/liferay/bookmarks/configuration/BookmarksGroupServiceConfiguration.java'><code>com.liferay.bookmarks.configuration.BookmarksGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/comment/comment-api/src/main/java/com/liferay/comment/configuration/CommentGroupServiceConfiguration.java'><code>com.liferay.comment.configuration.CommentGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceAccountGroupServiceConfiguration.java'><code>com.liferay.commerce.configuration.CommerceAccountGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceOrderCheckoutConfiguration.java'><code>com.liferay.commerce.configuration.CommerceOrderCheckoutConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceOrderFieldsConfiguration.java'><code>com.liferay.commerce.configuration.CommerceOrderFieldsConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceOrderImporterDateFormatConfiguration.java'><code>com.liferay.commerce.configuration.CommerceOrderImporterDateFormatConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceShippingGroupServiceConfiguration.java'><code>com.liferay.commerce.configuration.CommerceShippingGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-inventory-api/src/main/java/com/liferay/commerce/inventory/configuration/CommerceInventoryGroupConfiguration.java'><code>com.liferay.commerce.inventory.configuration.CommerceInventoryGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-media-impl/src/main/java/com/liferay/commerce/media/internal/configuration/CommerceMediaDefaultImageConfiguration.java'><code>com.liferay.commerce.media.internal.configuration.CommerceMediaDefaultImageConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-authorize-net/src/main/java/com/liferay/commerce/payment/method/authorize/net/internal/configuration/AuthorizeNetGroupServiceConfiguration.java'><code>com.liferay.commerce.payment.method.authorize.net.internal.configuration.AuthorizeNetGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-mercanet/src/main/java/com/liferay/commerce/payment/method/mercanet/internal/configuration/MercanetGroupServiceConfiguration.java'><code>com.liferay.commerce.payment.method.mercanet.internal.configuration.MercanetGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-money-order/src/main/java/com/liferay/commerce/payment/method/money/order/internal/configuration/MoneyOrderGroupServiceConfiguration.java'><code>com.liferay.commerce.payment.method.money.order.internal.configuration.MoneyOrderGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-paypal/src/main/java/com/liferay/commerce/payment/method/paypal/internal/configuration/PayPalGroupServiceConfiguration.java'><code>com.liferay.commerce.payment.method.paypal.internal.configuration.PayPalGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPDisplayLayoutConfiguration.java'><code>com.liferay.commerce.product.configuration.CPDisplayLayoutConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-shipping-engine-fedex/src/main/java/com/liferay/commerce/shipping/engine/fedex/internal/configuration/FedExCommerceShippingEngineGroupServiceConfiguration.java'><code>com.liferay.commerce.shipping.engine.fedex.internal.configuration.FedExCommerceShippingEngineGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-tax-api/src/main/java/com/liferay/commerce/tax/configuration/CommerceShippingTaxConfiguration.java'><code>com.liferay.commerce.tax.configuration.CommerceShippingTaxConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-tax-engine-fixed-api/src/main/java/com/liferay/commerce/tax/engine/fixed/configuration/CommerceTaxByAddressTypeConfiguration.java'><code>com.liferay.commerce.tax.engine.fixed.configuration.CommerceTaxByAddressTypeConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-tax-engine-remote/src/main/java/com/liferay/commerce/tax/engine/remote/internal/configuration/RemoteCommerceTaxConfiguration.java'><code>com.liferay.commerce.tax.engine.remote.internal.configuration.RemoteCommerceTaxConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/cookies/cookies-api/src/main/java/com/liferay/cookies/configuration/CookiesPreferenceHandlingConfiguration.java'><code>com.liferay.cookies.configuration.CookiesPreferenceHandlingConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/cookies/cookies-api/src/main/java/com/liferay/cookies/configuration/banner/CookiesBannerConfiguration.java'><code>com.liferay.cookies.configuration.banner.CookiesBannerConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/cookies/cookies-api/src/main/java/com/liferay/cookies/configuration/consent/CookiesConsentConfiguration.java'><code>com.liferay.cookies.configuration.consent.CookiesConsentConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java'><code>com.liferay.document.library.configuration.DLFileEntryConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/configuration/DLFileOrderConfiguration.java'><code>com.liferay.document.library.internal.configuration.DLFileOrderConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/configuration/DLSizeLimitConfiguration.java'><code>com.liferay.document.library.internal.configuration.DLSizeLimitConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/configuration/DDMGroupServiceConfiguration.java'><code>com.liferay.dynamic.data.mapping.configuration.DDMGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/data/provider/configuration/DDMDataProviderConfiguration.java'><code>com.liferay.dynamic.data.mapping.data.provider.configuration.DDMDataProviderConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/dynamic-data-mapping/dynamic-data-mapping-form-web/src/main/java/com/liferay/dynamic/data/mapping/form/web/internal/configuration/DDMFormWebConfiguration.java'><code>com.liferay.dynamic.data.mapping.form.web.internal.configuration.DDMFormWebConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/configuration/DefaultInputFragmentEntryConfiguration.java'><code>com.liferay.fragment.configuration.DefaultInputFragmentEntryConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/frontend-js/frontend-js-walkthrough-web/src/main/java/com/liferay/frontend/js/walkthrough/web/internal/configuration/WalkthroughConfiguration.java'><code>com.liferay.frontend.js.walkthrough.web.internal.configuration.WalkthroughConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/journal/journal-api/src/main/java/com/liferay/journal/configuration/JournalGroupServiceConfiguration.java'><code>com.liferay.journal.configuration.JournalGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/knowledge-base/knowledge-base-api/src/main/java/com/liferay/knowledge/base/configuration/KBGroupServiceConfiguration.java'><code>com.liferay.knowledge.base.configuration.KBGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-api/src/main/java/com/liferay/layout/configuration/LockedLayoutsGroupConfiguration.java'><code>com.liferay.layout.configuration.LockedLayoutsGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-impl/src/main/java/com/liferay/layout/internal/configuration/LayoutCrawlerClientConfiguration.java'><code>com.liferay.layout.internal.configuration.LayoutCrawlerClientConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-reports-web/src/main/java/com/liferay/layout/reports/web/internal/configuration/LayoutReportsGooglePageSpeedGroupConfiguration.java'><code>com.liferay.layout.reports.web.internal.configuration.LayoutReportsGooglePageSpeedGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-seo-service/src/main/java/com/liferay/layout/seo/internal/configuration/LayoutSEOGroupConfiguration.java'><code>com.liferay.layout.seo.internal.configuration.LayoutSEOGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/login/login-web/src/main/java/com/liferay/login/web/internal/configuration/AuthLoginConfiguration.java'><code>com.liferay.login.web.internal.configuration.AuthLoginConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/message-boards/message-boards-moderation-api/src/main/java/com/liferay/message/boards/moderation/configuration/MBModerationGroupConfiguration.java'><code>com.liferay.message.boards.moderation.configuration.MBModerationGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/object/object-storage-salesforce-api/src/main/java/com/liferay/object/storage/salesforce/configuration/SalesforceConfiguration.java'><code>com.liferay.object.storage.salesforce.configuration.SalesforceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-content-security-policy/src/main/java/com/liferay/portal/security/content/security/policy/internal/configuration/ContentSecurityPolicyConfiguration.java'><code>com.liferay.portal.security.content.security.policy.internal.configuration.ContentSecurityPolicyConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/redirect/redirect-service/src/main/java/com/liferay/redirect/internal/configuration/RedirectPatternConfiguration.java'><code>com.liferay.redirect.internal.configuration.RedirectPatternConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/sharing/sharing-service/src/main/java/com/liferay/sharing/internal/configuration/SharingGroupConfiguration.java'><code>com.liferay.sharing.internal.configuration.SharingGroupConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/site/site-api/src/main/java/com/liferay/site/configuration/MenuAccessConfiguration.java'><code>com.liferay.site.configuration.MenuAccessConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/social/social-activity-api/src/main/java/com/liferay/social/activity/configuration/SocialActivityGroupServiceConfiguration.java'><code>com.liferay.social.activity.configuration.SocialActivityGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/wiki/wiki-api/src/main/java/com/liferay/wiki/configuration/WikiGroupServiceConfiguration.java'><code>com.liferay.wiki.configuration.WikiGroupServiceConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/commerce-punchout/commerce-punchout-api/src/main/java/com/liferay/commerce/punchout/configuration/PunchOutConfiguration.java'><code>com.liferay.commerce.punchout.configuration.PunchOutConfiguration</code></a></li>
<li><a href='https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/portal-reports-engine-console/portal-reports-engine-console-api/src/main/java/com/liferay/portal/reports/engine/console/configuration/ReportsGroupServiceEmailConfiguration.java'><code>com.liferay.portal.reports.engine.console.configuration.ReportsGroupServiceEmailConfiguration</code></a></li>
</ul>

## Related Topics

* [Working with Client Extensions](../working-with-client-extensions.md)
* [Configuration CLient Extensions](../configuration-client-extensions.md)
