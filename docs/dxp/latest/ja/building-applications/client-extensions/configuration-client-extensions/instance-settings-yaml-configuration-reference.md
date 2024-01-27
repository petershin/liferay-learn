# インスタンス設定 YAML 構成リファレンス

インスタンス設定クライアントエクステンションを使って、 [さまざまな Liferay の設定を行うことができます](#currently-supported-instance-settings-pids) 。 各コンフィギュレーションはPID（Persistent IDentity）によって参照される。

インスタンス設定のクライアント拡張を定義するには、`client-extension.yaml` ファイルを使用する。

## 使用法の詳細

この `client-extension.yaml` ファイルはインスタンス設定のクライアント拡張を定義する：

```yaml
yoke-instance-settings:
    type: instanceSettings
```

## YAML プロパティ

これらのプロパティは、インスタンス設定クライアント・エクステンションに固有のものです：

| 名前            | データ型 | デフォルト値 | 説明                                                                                                                                                                       |
| :------------ | :--- | :----- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `description` | 文字列  |        | クライアント拡張の説明                                                                                                                                                              |
| `name`        | 文字列  | 派生     | クライアントの拡張子名。                                                                                                                                                             |
| `pid`         | 文字列  |        | 構成されたインスタンス設定の PID (Persistent IDentity) ( [現在サポートされているインスタンス設定の PID](#currently-supported-instance-settings-pids) から .) |

## 追加プロパティ

インスタンス設定クライアントの拡張は、PID（Javaクラス）のスキーマによって定義される追加プロパティを伴う。

スキーマのPIDはアノテーション・プロパティ `@Meta.OCD.id` で定義される：

```java
@Meta.OCD(
	id = "com.liferay.foo.FooConfiguration"
)
```

クライアント・エクステンション定義で、このプロパティを次のように設定する：

```yaml
yoke-instance-settings:
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

以下は、スキーマ・クラスに含まれるプロパティの種類と、それらをクライアント拡張定義に含める方法の例です。

### スカラー特性

以下のスカラ・スキーマ・プロパティ定義が与えられ、この場合は `int`（整数）である、

```java
@Meta.AD(...)
public int invitationTokenExpirationTime();
```

スカラー YAML プロパティとして `invitationTokenExpirationTime` クライアント拡張プロパティを設定する：

```yaml
yoke-instance-settings:
    invitationTokenExpirationTime: 600
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

スカラー・プロパティにはこれらのデータ型が含まれる：

* `int` (整数)
* `short`
* `long`
* `byte`
* `float` (10進数)
* `double` (倍精度10進数)
* `character`
* `boolean`
* `String`

### 配列プロパティの例

以下の配列スキーマ・プロパティ定義が与えられている、

```java
@Meta.AD(...)
public String[] customTLDs();
```

`customTLDs`クライアント拡張プロパティをYAML配列として設定する：

```yaml
yoke-instance-settings:
    customTLDs:
        - "foo.net"
        - "*.other.com"
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

### LocalizedValuesMap プロパティの例

以下の `LocalizedValuesMap` スキーマ・プロパティ定義が与えられる、

```java
@Meta.AD(...)
public LocalizedValuesMap invitationEmailBody();
```

invitationEmailBody`クライアント拡張プロパティをYAMLオブジェクトとして設定します：

```yaml
yoke-instance-settings:
    invitationEmailBody:
        en_US: |
            <p>
                Follow the link below to set up your account:<br />
                [Create Account]([$CREATE_ACCOUNT_URL$]) 
                <br />
                <font size="-2">The link will expire after 3 days.</font>
            </p>
    pid: com.liferay.foo.FooConfiguration
    type: instanceSettings
```

## 現在サポートされているインスタンス設定 PID

[仮想インスタンス](#virtual-instance-scoped-pids) または [サイト](#site-scoped-pids) によってスコープされるインスタンス設定クライアント拡張で参照できるすべての PID を示します。

### 仮想インスタンススコープのPID：

これらのPIDは、仮想インスタンス・スコープの設定を可能にする。

<!--
```bash
for o in $(git -P grep -l 'scope = ExtendedObjectClassDefinition.Scope.COMPANY' -- $(git grep -l '@ExtendedObjectClassDefinition' -- '*.java')); do i="${o#*src/main/java/}"; i="${i%.java}"; echo "* [`${i////.}`](https://github.com/liferay/liferay-portal/blob/HEAD/${o}) "; done
```
-->

* [`com.liferay.account.configuration.AccountEntryEmailConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/account/account-api/src/main/java/com/liferay/account/configuration/AccountEntryEmailConfiguration.java) 
* [`com.liferay.account.configuration.AccountEntryEmailDomainsConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/account/account-api/src/main/java/com/liferay/account/configuration/AccountEntryEmailDomainsConfiguration.java) 
* [`com.liferay.adaptive.media.image.internal.configuration.AMImageCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/adaptive-media/adaptive-media-image-impl/src/main/java/com/liferay/adaptive/media/image/internal/configuration/AMImageCompanyConfiguration.java) 
* [`com.liferay.ai.creator.openai.configuration.AICreatorOpenAICompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/ai-creator/ai-creator-openai-api/src/main/java/com/liferay/ai/creator/openai/configuration/AICreatorOpenAICompanyConfiguration.java) 
* [`com.liferay.analytics.settings.configuration.AnalyticsConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/analytics/analytics-settings-api/src/main/java/com/liferay/analytics/settings/configuration/AnalyticsConfiguration.java) 
* [`com.liferay.asset.auto.tagger.google.cloud.natural.language.internal.configuration.GCloudNaturalLanguageAssetAutoTaggerCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-google-cloud-natural-language-impl/src/main/java/com/liferay/asset/auto/tagger/google/cloud/natural/language/internal/configuration/GCloudNaturalLanguageAssetAutoTaggerCompanyConfiguration.java) 
* [`com.liferay.asset.auto.tagger.opennlp.internal.configuration.OpenNLPDocumentAssetAutoTaggerCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-opennlp-impl/src/main/java/com/liferay/asset/auto/tagger/opennlp/internal/configuration/OpenNLPDocumentAssetAutoTaggerCompanyConfiguration.java) 
* [com.liferay.asset.auto.tagger.internal.configuration.AssetAutoTaggerCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-service/src/main/java/com/liferay/asset/auto/tagger/internal/configuration/AssetAutoTaggerCompanyConfiguration.java) 
* [com.liferay.asset.categories.configuration.AssetCategoriesCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-categories-api/src/main/java/com/liferay/asset/categories/configuration/AssetCategoriesCompanyConfiguration.java) 
* [com.liferay.batch.engine.configuration.BatchEngineTaskCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/batch-engine/batch-engine-api/src/main/java/com/liferay/batch/engine/configuration/BatchEngineTaskCompanyConfiguration.java) 
* [com.liferay.change.tracking.configuration.CTSettingsConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/change-tracking/change-tracking-api/src/main/java/com/liferay/change/tracking/configuration/CTSettingsConfiguration.java) 
* [com.liferay.change.tracking.web.internal.configuration.CTConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/change-tracking/change-tracking-web/src/main/java/com/liferay/change/tracking/web/internal/configuration/CTConfiguration.java) 
* [com.liferay.click.to.chat.web.internal.configuration.ClickToChatConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/click-to-chat/click-to-chat-web/src/main/java/com/liferay/click/to/chat/web/internal/configuration/ClickToChatConfiguration.java) 
* [`com.liferay.client.extension.type.configuration.CETConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/client-extension/client-extension-type-api/src/main/java/com/liferay/client/extension/type/configuration/CETConfiguration.java) 
* [com.liferay.commerce.payment.configuration.CommercePaymentEntryAuditConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/configuration/CommercePaymentEntryAuditConfiguration.java) 
* [`com.liferay.commerce.payment.configuration.CommercePaymentEntryRefundTypeConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/configuration/CommercePaymentEntryRefundTypeConfiguration.java) 
* [com.liferay.commerce.product.configuration.CPDefinitionOptionRelConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPDefinitionOptionRelConfiguration.java) 
* [com.liferay.commerce.product.configuration.CPFriendlyURLConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPFriendlyURLConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.AccountEntryCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/AccountEntryCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.AccountGroupCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/AccountGroupCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.AddressCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/AddressCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.COREntryCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/COREntryCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommerceChannelCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceChannelCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommerceCurrencyCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceCurrencyCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommerceDiscountCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceDiscountCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommerceInventoryWarehouseCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceInventoryWarehouseCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommerceOrderTypeCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceOrderTypeCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommercePaymentMethodGroupRelCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommercePaymentMethodGroupRelCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommercePriceListCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommercePriceListCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommerceShippingFixedOptionCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceShippingFixedOptionCommerceQualifierConfiguration.java) 
* [com.liferay.commerce.qualifier.configuration.CommerceTermEntryCommerceQualifierConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-qualifier-api/src/main/java/com/liferay/commerce/qualifier/configuration/CommerceTermEntryCommerceQualifierConfiguration.java) 
* [com.liferay.digital.signature.configuration.DigitalSignatureConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/digital-signature/digital-signature-api/src/main/java/com/liferay/digital/signature/configuration/DigitalSignatureConfiguration.java) 
* [com.liferay.document.library.asset.auto.tagger.google.cloud.vision.internal.configuration.GCloudVisionAssetAutoTagProviderCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-asset-auto-tagger-google-cloud-vision/src/main/java/com/liferay/document/library/asset/auto/tagger/google/cloud/vision/internal/configuration/GCloudVisionAssetAutoTagProviderCompanyConfiguration.java) 
* [`com.liferay.document.library.asset.auto.tagger.microsoft.cognitive.services.internal.configuration.MSCognitiveServicesAssetAutoTagProviderCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-asset-auto-tagger-microsoft-cognitive-services/src/main/java/com/liferay/document/library/asset/auto/tagger/microsoft/cognitive/services/internal/configuration/MSCognitiveServicesAssetAutoTagProviderCompanyConfiguration.java) 
* [com.liferay.document.library.asset.auto.tagger.tensorflow.internal.configuration.TensorFlowImageAssetAutoTagProviderCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-asset-auto-tagger-tensorflow/src/main/java/com/liferay/document/library/asset/auto/tagger/tensorflow/internal/configuration/TensorFlowImageAssetAutoTagProviderCompanyConfiguration.java) 
* [com.liferay.document.library.google.drive.configuration.DLGoogleDriveCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-google-drive-api/src/main/java/com/liferay/document/library/google/drive/configuration/DLGoogleDriveCompanyConfiguration.java) 
* [com.liferay.document.library.web.internal.configuration.CacheControlConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-web/src/main/java/com/liferay/document/library/web/internal/configuration/CacheControlConfiguration.java) 
* [com.liferay.exportimport.configuration.ExportImportServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/export-import/export-import-api/src/main/java/com/liferay/exportimport/configuration/ExportImportServiceConfiguration.java) 
* [com.liferay.flags.configuration.FlagsGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/flags/flags-api/src/main/java/com/liferay/flags/configuration/FlagsGroupServiceConfiguration.java) 
* [com.liferay.fragment.configuration.FragmentServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/configuration/FragmentServiceConfiguration.java) 
* [com.liferay.fragment.entry.processor.freemarker.internal.configuration.FreeMarkerFragmentEntryProcessorConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-entry-processor/fragment-entry-processor-freemarker/src/main/java/com/liferay/fragment/entry/processor/freemarker/internal/configuration/FreeMarkerFragmentEntryProcessorConfiguration.java) 
* [com.liferay.fragment.web.internal.configuration.FragmentPortletConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-web/src/main/java/com/liferay/fragment/web/internal/configuration/FragmentPortletConfiguration.java) 
* [com.liferay.friendly.url.configuration.FriendlyURLRedirectionConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/friendly-url/friendly-url-api/src/main/java/com/liferay/friendly/url/configuration/FriendlyURLRedirectionConfiguration.java) 
* [`com.liferay.frontend.js.web.internal.configuration.CustomDialogsSettingsConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/frontend-js/frontend-js-web/src/main/java/com/liferay/frontend/js/web/internal/configuration/CustomDialogsSettingsConfiguration.java) 
* [com.liferay.journal.configuration.JournalServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/journal/journal-api/src/main/java/com/liferay/journal/configuration/JournalServiceConfiguration.java) 
* [com.liferay.layout.content.page.editor.web.internal.configuration.PageEditorConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-content-page-editor-web/src/main/java/com/liferay/layout/content/page/editor/web/internal/configuration/PageEditorConfiguration.java) 
* [`com.liferay.layout.locked.layouts.web.internal.configuration.LockedLayoutsCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-locked-layouts-web/src/main/java/com/liferay/layout/locked/layouts/web/internal/configuration/LockedLayoutsCompanyConfiguration.java) 
* [com.liferay.layout.reports.web.internal.configuration.LayoutReportsGooglePageSpeedCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-reports-web/src/main/java/com/liferay/layout/reports/web/internal/configuration/LayoutReportsGooglePageSpeedCompanyConfiguration.java) 
* [com.liferay.layout.seo.internal.configuration.LayoutSEOCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-seo-service/src/main/java/com/liferay/layout/seo/internal/configuration/LayoutSEOCompanyConfiguration.java) 
* [com.liferay.layout.set.prototype.configuration.LayoutSetPrototypeConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-set-prototype-api/src/main/java/com/liferay/layout/set/prototype/configuration/LayoutSetPrototypeConfiguration.java) 
* [`com.liferay.mail.outlook.auth.connector.provider.internal.configuration.MailOutlookAuthConnectorCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/mail/mail-outlook-auth-connector-provider/src/main/java/com/liferay/mail/outlook/auth/connector/provider/internal/configuration/MailOutlookAuthConnectorCompanyConfiguration.java) 
* [`com.liferay.oauth2.provider.rest.internal.configuration.OAuth2InAssertionConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/oauth2-provider/oauth2-provider-rest/src/main/java/com/liferay/oauth2/provider/rest/internal/configuration/OAuth2InAssertionConfiguration.java) 
* [com.liferay.oauth2.provider.rest.internal.endpoint.authorize.configuration.AuthorizeScreenConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/oauth2-provider/oauth2-provider-rest/src/main/java/com/liferay/oauth2/provider/rest/internal/endpoint/authorize/configuration/AuthorizeScreenConfiguration.java) 
* [com.liferay.portal.crypto.hash.provider.bcrypt.internal.configuration.BCryptCryptoHashProviderConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-crypto-hash/portal-crypto-hash-provider/portal-crypto-hash-provider-bcrypt/src/main/java/com/liferay/portal/crypto/hash/provider/bcrypt/internal/configuration/BCryptCryptoHashProviderConfiguration.java) 
* [com.liferay.portal.crypto.hash.provider.message.digest.internal.configuration.MessageDigestCryptoHashProviderConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-crypto-hash/portal-crypto-hash-provider/portal-crypto-hash-provider-message-digest/src/main/java/com/liferay/portal/crypto/hash/provider/message/digest/internal/configuration/MessageDigestCryptoHashProviderConfiguration.java) 
* [com.liferay.portal.remote.cors.configuration.PortalCORSConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-remote/portal-remote-cors-api/src/main/java/com/liferay/portal/remote/cors/configuration/PortalCORSConfiguration.java) 
* [com.liferay.portal.search.elasticsearch7.configuration.DeepPaginationConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-api/src/main/java/com/liferay/portal/search/elasticsearch7/configuration/DeepPaginationConfiguration.java) 
* [com.liferay.portal.search.rest.configuration.SearchSuggestionsCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-search/portal-search-rest-api/src/main/java/com/liferay/portal/search/rest/configuration/SearchSuggestionsCompanyConfiguration.java) 
* [com.liferay.portal.search.internal.configuration.SiteActivityAsahConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-search/portal-search/src/main/java/com/liferay/portal/search/internal/configuration/SiteActivityAsahConfiguration.java) 
* [com.liferay.portal.search.internal.configuration.UserActivityAsahConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-search/portal-search/src/main/java/com/liferay/portal/search/internal/configuration/UserActivityAsahConfiguration.java) 
* [com.liferay.portal.security.sso.openid.connect.internal.configuration.OpenIdConnectProviderConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security-sso/portal-security-sso-openid-connect-impl/src/main/java/com/liferay/portal/security/sso/openid/connect/internal/configuration/OpenIdConnectProviderConfiguration.java) 
* [com.liferay.portal.security.configuration.BasicAuthHeaderSupportConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-api/src/main/java/com/liferay/portal/security/configuration/BasicAuthHeaderSupportConfiguration.java) 
* [`com.liferay.portal.security.auto.login.internal.basic.auth.header.configuration.BasicAuthHeaderAutoLoginConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-auto-login/src/main/java/com/liferay/portal/security/auto/login/internal/basic/auth/header/configuration/BasicAuthHeaderAutoLoginConfiguration.java) 
* [com.liferay.portal.security.ldap.authenticator.configuration.LDAPAuthConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/authenticator/configuration/LDAPAuthConfiguration.java) 
* [com.liferay.portal.security.ldap.configuration.LDAPServerConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/configuration/LDAPServerConfiguration.java) 
* [com.liferay.portal.security.ldap.configuration.SystemLDAPConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/configuration/SystemLDAPConfiguration.java) 
* [com.liferay.portal.security.ldap.exportimport.configuration.LDAPExportConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/exportimport/configuration/LDAPExportConfiguration.java) 
* [com.liferay.portal.security.ldap.exportimport.configuration.LDAPImportConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-ldap-api/src/main/java/com/liferay/portal/security/ldap/exportimport/configuration/LDAPImportConfiguration.java) 
* [com.liferay.portal.vulcan.internal.configuration.HeadlessAPICCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-vulcan/portal-vulcan-impl/src/main/java/com/liferay/portal/vulcan/internal/configuration/HeadlessAPICompanyConfiguration.java) 
* [com.liferay.portal.vulcan.internal.configuration.VulcanCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-vulcan/portal-vulcan-impl/src/main/java/com/liferay/portal/vulcan/internal/configuration/VulcanCompanyConfiguration.java) 
* [com.liferay.product.navigation.applications.menu.configuration.ApplicationsMenuInstanceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/product-navigation/product-navigation-applications-menu-api/src/main/java/com/liferay/product/navigation/applications/menu/configuration/ApplicationsMenuInstanceConfiguration.java) 
* [com.liferay.product.navigation.personal.menu.configuration.PersonalMenuConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/product-navigation/product-navigation-personal-menu-api/src/main/java/com/liferay/product/navigation/personal/menu/configuration/PersonalMenuConfiguration.java) 
* [`com.liferay.redirect.internal.configuration.RedirectURLConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/redirect/redirect-service/src/main/java/com/liferay/redirect/internal/configuration/RedirectURLConfiguration.java) 
* [com.liferay.segments.configuration.SegmentsCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/segments/segments-api/src/main/java/com/liferay/segments/configuration/SegmentsCompanyConfiguration.java) 
* [`com.liferay.segments.context.vocabulary.internal.configuration.SegmentsContextVocabularyCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/segments/segments-context-vocabulary/src/main/java/com/liferay/segments/context/vocabulary/internal/configuration/SegmentsContextVocabularyCompanyConfiguration.java) 
* [com.liferay.sharing.internal.configuration.SharingCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/sharing/sharing-service/src/main/java/com/liferay/sharing/internal/configuration/SharingCompanyConfiguration.java) 
* [com.liferay.social.activity.internal.configuration.SocialActivityCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/social/social-activity-impl/src/main/java/com/liferay/social/activity/internal/configuration/SocialActivityCompanyConfiguration.java) 
* [com.liferay.staging.configuration.StagingConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/staging/staging-api/src/main/java/com/liferay/staging/configuration/StagingConfiguration.java) 
* [com.liferay.translation.translator.aws.internal.configuration.AWSTranslatorConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-aws/src/main/java/com/liferay/translation/translator/aws/internal/configuration/AWSTranslatorConfiguration.java) 
* [com.liferay.translation.translator.azure.internal.configuration.AzureTranslatorConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-azure/src/main/java/com/liferay/translation/translator/azure/internal/configuration/AzureTranslatorConfiguration.java) 
* [com.liferay.translation.translator.deepl.internal.configuration.DeepLTranslatorConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-deepl/src/main/java/com/liferay/translation/translator/deepl/internal/configuration/DeepLTranslatorConfiguration.java) 
* [com.liferay.translation.translator.google.cloud.internal.configuration.GoogleCloudTranslatorConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/translation/translation-translator-google-cloud/src/main/java/com/liferay/translation/translator/google/cloud/internal/configuration/GoogleCloudTranslatorConfiguration.java) 
* [com.liferay.user.associated.data.web.internal.configuration.AnonymousUserConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/user-associated-data/user-associated-data-web/src/main/java/com/liferay/user/associated/data/web/internal/configuration/AnonymousUserConfiguration.java) 
* [com.liferay.users.admin.configuration.UserFileUploadsConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/users-admin/users-admin-api/src/main/java/com/liferay/users/admin/configuration/UserFileUploadsConfiguration.java) 
* [`com.liferay.document.library.opener.onedrive.web.internal.configuration.DLOneDriveCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/document-library-opener/document-library-opener-onedrive-web/src/main/java/com/liferay/document/library/opener/onedrive/web/internal/configuration/DLOneDriveCompanyConfiguration.java) 
* [`com.liferay.multi.factor.authentication.email.otp.configuration.MFAEmailOTPConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-email-otp-api/src/main/java/com/liferay/multi/factor/authentication/email/otp/configuration/MFAEmailOTPConfiguration.java) 
* [`com.liferay.multi.factor.authentication.fido2.web.internal.configuration.MFAFIDO2Configuration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-fido2-web/src/main/java/com/liferay/multi/factor/authentication/fido2/web/internal/configuration/MFAFIDO2Configuration.java) 
* [`com.liferay.multi.factor.authentication.ip.address.internal.configuration.MFAIPAddressConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-ip-address-impl/src/main/java/com/liferay/multi/factor/authentication/ip/address/internal/configuration/MFAIPAddressConfiguration.java) 
* [`com.liferay.multi.factor.authentication.sample.internal.configuration.MFASampleConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-sample/src/main/java/com/liferay/multi/factor/authentication/sample/internal/configuration/MFASampleConfiguration.java) 
* [`com.liferay.multi.factor.authentication.timebased.otp.web.internal.configuration.MFATimeBasedOTPConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/multi-factor-authentication/multi-factor-authentication-timebased-otp-web/src/main/java/com/liferay/multi/factor/authentication/timebased/otp/web/internal/configuration/MFATimeBasedOTPConfiguration.java) 
* [com.liferay.saml.runtime.configuration.SamlProviderConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/saml/saml-api/src/main/java/com/liferay/saml/runtime/configuration/SamlProviderConfiguration.java) 
* [com.liferay.search.experiences.configuration.SemanticSearchConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/search-experiences/search-experiences-api/src/main/java/com/liferay/search/experiences/configuration/SemanticSearchConfiguration.java) 
* [com.liferay.search.experiences.internal.configuration.IpstackConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/search-experiences/search-experiences-service/src/main/java/com/liferay/search/experiences/internal/configuration/IpstackConfiguration.java) 
* [com.liferay.search.experiences.internal.configuration.OpenWeatherMapConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/search-experiences/search-experiences-service/src/main/java/com/liferay/search/experiences/internal/configuration/OpenWeatherMapConfiguration.java) 
* [`com.liferay.segments.asah.connector.internal.configuration.SegmentsAsahCompanyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/segments/segments-asah-connector/src/main/java/com/liferay/segments/asah/connector/internal/configuration/SegmentsAsahCompanyConfiguration.java) 
* [com.liferay.sharepoint.rest.repository.internal.configuration.SharepointRepositoryConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/sharepoint-rest/sharepoint-rest-repository/src/main/java/com/liferay/sharepoint/rest/repository/internal/configuration/SharepointRepositoryConfiguration.java) 

### サイトスコープのPID：

これらのPIDは、サイトスコープの設定を可能にする。

このベアフォームでサイト設定を指定すると、仮想インスタンス内のすべてのサイトのデフォルトが設定されます。

<!--
```bash
for o in $(git -P grep -l 'scope = ExtendedObjectClassDefinition.Scope.GROUP' -- $(git grep -l '@ExtendedObjectClassDefinition' -- '*.java')); do i="${o#*src/main/java/}"; i="${i%.java}"; echo "* [\`${i//\//.}\`](https://github.com/liferay/liferay-portal/blob/HEAD/${o})"; done
```
-->

* [com.liferay.accessibility.menu.web.internal.configuration.AccessibilityMenuConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/accessibility/accessibility-menu-web/src/main/java/com/liferay/accessibility/menu/web/internal/configuration/AccessibilityMenuConfiguration.java) 
* [com.liferay.account.internal.configuration.AccountEntryGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/account/account-service/src/main/java/com/liferay/account/internal/configuration/AccountEntryGroupConfiguration.java) 
* [com.liferay.ai.creator.openai.configuration.AICreatorOpenAIGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/ai-creator/ai-creator-openai-api/src/main/java/com/liferay/ai/creator/openai/configuration/AICreatorOpenAIGroupConfiguration.java) 
* [com.liferay.asset.auto.tagger.internal.configuration.AssetAutoTaggerGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/asset/asset-auto-tagger-service/src/main/java/com/liferay/asset/auto/tagger/internal/configuration/AssetAutoTaggerGroupConfiguration.java) 
* [com.liferay.blogs.configuration.BlogsGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/blogs/blogs-api/src/main/java/com/liferay/blogs/configuration/BlogsGroupServiceConfiguration.java) 
* [com.liferay.bookmarks.configuration.BookmarksGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/bookmarks/bookmarks-api/src/main/java/com/liferay/bookmarks/configuration/BookmarksGroupServiceConfiguration.java) 
* [com.liferay.comment.configuration.CommentGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/comment/comment-api/src/main/java/com/liferay/comment/configuration/CommentGroupServiceConfiguration.java) 
* [com.liferay.commerce.configuration.CommerceAccountGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceAccountGroupServiceConfiguration.java) 
* [com.liferay.commerce.configuration.CommerceOrderCheckoutConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceOrderCheckoutConfiguration.java) 
* [com.liferay.commerce.configuration.CommerceOrderFieldsConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceOrderFieldsConfiguration.java) 
* [com.liferay.commerce.configuration.CommerceOrderImporterDateFormatConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceOrderImporterDateFormatConfiguration.java) 
* [com.liferay.commerce.configuration.CommerceShippingGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/configuration/CommerceShippingGroupServiceConfiguration.java) 
* [com.liferay.commerce.inventory.configuration.CommerceInventoryGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-inventory-api/src/main/java/com/liferay/commerce/inventory/configuration/CommerceInventoryGroupConfiguration.java) 
* [com.liferay.commerce.media.internal.configuration.CommerceMediaDefaultImageConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-media-impl/src/main/java/com/liferay/commerce/media/internal/configuration/CommerceMediaDefaultImageConfiguration.java) 
* [com.liferay.commerce.payment.method.authorize.net.internal.configuration.AuthorizeNetGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-authorize-net/src/main/java/com/liferay/commerce/payment/method/authorize/net/internal/configuration/AuthorizeNetGroupServiceConfiguration.java) 
* [`com.liferay.commerce.payment.method.mercanet.internal.configuration.MercanetGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-mercanet/src/main/java/com/liferay/commerce/payment/method/mercanet/internal/configuration/MercanetGroupServiceConfiguration.java) 
* [`com.liferay.commerce.payment.method.money.order.internal.configuration.MoneyOrderGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-money-order/src/main/java/com/liferay/commerce/payment/method/money/order/internal/configuration/MoneyOrderGroupServiceConfiguration.java) 
* [com.liferay.commerce.payment.method.paypal.internal.configuration.PayPalGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-payment-method-paypal/src/main/java/com/liferay/commerce/payment/method/paypal/internal/configuration/PayPalGroupServiceConfiguration.java) 
* [com.liferay.commerce.product.configuration.CPDisplayLayoutConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/configuration/CPDisplayLayoutConfiguration.java) 
* [com.liferay.commerce.shipping.engine.fedex.internal.configuration.FedExCommerceShippingEngineGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-shipping-engine-fedex/src/main/java/com/liferay/commerce/shipping/engine/fedex/internal/configuration/FedExCommerceShippingEngineGroupServiceConfiguration.java) 
* [com.liferay.commerce.tax.configuration.CommerceShippingTaxConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-tax-api/src/main/java/com/liferay/commerce/tax/configuration/CommerceShippingTaxConfiguration.java) 
* [com.liferay.commerce.tax.engine.fixed.configuration.CommerceTaxByAddressTypeConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-tax-engine-fixed-api/src/main/java/com/liferay/commerce/tax/engine/fixed/configuration/CommerceTaxByAddressTypeConfiguration.java) 
* [`com.liferay.commerce.tax.engine.remote.internal.configuration.RemoteCommerceTaxConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/commerce/commerce-tax-engine-remote/src/main/java/com/liferay/commerce/tax/engine/remote/internal/configuration/RemoteCommerceTaxConfiguration.java) 
* [com.liferay.cookies.configuration.CookiesPreferenceHandlingConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/cookies/cookies-api/src/main/java/com/liferay/cookies/configuration/CookiesPreferenceHandlingConfiguration.java) 
* [com.liferay.cookies.configuration.banner.CookiesBannerConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/cookies/cookies-api/src/main/java/com/liferay/cookies/configuration/banner/CookiesBannerConfiguration.java) 
* [com.liferay.cookies.configuration.consent.CookiesConsentConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/cookies/cookies-api/src/main/java/com/liferay/cookies/configuration/consent/CookiesConsentConfiguration.java) 
* [com.liferay.document.library.configuration.DLFileEntryConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java) 
* [com.liferay.document.library.internal.configuration.DLFileOrderConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/configuration/DLFileOrderConfiguration.java) 
* [com.liferay.document.library.internal.configuration.DLSizeLimitConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/configuration/DLSizeLimitConfiguration.java) 
* [com.liferay.dynamic.data.mapping.configuration.DDMGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/configuration/DDMGroupServiceConfiguration.java) 
* [`com.liferay.dynamic.data.mapping.data.provider.configuration.DDMDataProviderConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/data/provider/configuration/DDMDataProviderConfiguration.java) 
* [`com.liferay.dynamic.data.mapping.form.web.internal.configuration.DDMFormWebConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/dynamic-data-mapping/dynamic-data-mapping-form-web/src/main/java/com/liferay/dynamic/data/mapping/form/web/internal/configuration/DDMFormWebConfiguration.java) 
* [com.liferay.fragment.configuration.DefaultInputFragmentEntryConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/fragment/fragment-api/src/main/java/com/liferay/fragment/configuration/DefaultInputFragmentEntryConfiguration.java) 
* [`com.liferay.frontend.js.walkthrough.web.internal.configuration.WalkthroughConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/frontend-js/frontend-js-walkthrough-web/src/main/java/com/liferay/frontend/js/walkthrough/web/internal/configuration/WalkthroughConfiguration.java) 
* [`com.liferay.frontend.js.web.internal.session.timeout.configuration.SessionTimeoutConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/frontend-js/frontend-js-web/src/main/java/com/liferay/frontend/js/web/internal/session/timeout/configuration/SessionTimeoutConfiguration.java) 
* [com.liferay.journal.configuration.JournalGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/journal/journal-api/src/main/java/com/liferay/journal/configuration/JournalGroupServiceConfiguration.java) 
* [com.liferay.knowledge.base.configuration.KBGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/knowledge-base/knowledge-base-api/src/main/java/com/liferay/knowledge/base/configuration/KBGroupServiceConfiguration.java) 
* [com.liferay.layout.configuration.LockedLayoutsGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-api/src/main/java/com/liferay/layout/configuration/LockedLayoutsGroupConfiguration.java) 
* [com.liferay.layout.internal.configuration.LayoutCrawlerClientConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-impl/src/main/java/com/liferay/layout/internal/configuration/LayoutCrawlerClientConfiguration.java) 
* [com.liferay.layout.reports.web.internal.configuration.LayoutReportsGooglePageSpeedGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-reports-web/src/main/java/com/liferay/layout/reports/web/internal/configuration/LayoutReportsGooglePageSpeedGroupConfiguration.java) 
* [com.liferay.layout.seo.internal.configuration.LayoutSEOGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/layout/layout-seo-service/src/main/java/com/liferay/layout/seo/internal/configuration/LayoutSEOGroupConfiguration.java) 
* [com.liferay.login.web.internal.configuration.AuthLoginConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/login/login-web/src/main/java/com/liferay/login/web/internal/configuration/AuthLoginConfiguration.java) 
* [`com.liferay.message.boards.moderation.configuration.MBModerationGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/message-boards/message-boards-moderation-api/src/main/java/com/liferay/message/boards/moderation/configuration/MBModerationGroupConfiguration.java) 
* [com.liferay.object.storage.salesforce.configuration.SalesforceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/object/object-storage-salesforce-api/src/main/java/com/liferay/object/storage/salesforce/configuration/SalesforceConfiguration.java) 
* [com.liferay.portal.security.content.security.policy.internal.configuration.ContentSecurityPolicyConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/portal-security/portal-security-content-security-policy/src/main/java/com/liferay/portal/security/content/security/policy/internal/configuration/ContentSecurityPolicyConfiguration.java) 
* [com.liferay.redirect.internal.configuration.RedirectPatternConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/redirect/redirect-service/src/main/java/com/liferay/redirect/internal/configuration/RedirectPatternConfiguration.java) 
* [com.liferay.sharing.internal.configuration.SharingGroupConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/sharing/sharing-service/src/main/java/com/liferay/sharing/internal/configuration/SharingGroupConfiguration.java) 
* [com.liferay.site.configuration.MenuAccessConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/site/site-api/src/main/java/com/liferay/site/configuration/MenuAccessConfiguration.java) 
* [com.liferay.social.activity.configuration.SocialActivityGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/social/social-activity-api/src/main/java/com/liferay/social/activity/configuration/SocialActivityGroupServiceConfiguration.java) 
* [com.liferay.wiki.configuration.WikiGroupServiceConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/apps/wiki/wiki-api/src/main/java/com/liferay/wiki/configuration/WikiGroupServiceConfiguration.java) 
* [com.liferay.commerce.punchout.configuration.PunchOutConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/commerce-punchout/commerce-punchout-api/src/main/java/com/liferay/commerce/punchout/configuration/PunchOutConfiguration.java) 
* [com.liferay.portal.reports.engine.console.configuration.ReportsGroupServiceEmailConfiguration`](https://github.com/liferay/liferay-portal/blob/HEAD/modules/dxp/apps/portal-reports-engine-console/portal-reports-engine-console-api/src/main/java/com/liferay/portal/reports/engine/console/configuration/ReportsGroupServiceEmailConfiguration.java) 

## 関連トピック

* [クライアント拡張機能の操作](../working-with-client-extensions.md)
* [コンフィギュレーション CLient Extensions](../configuration-client-extensions.md)
