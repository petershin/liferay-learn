---
uuid: bcaaeab9-3b46-4a48-8e84-64d84d2c6015
---
# Maintenance Mode and Deprecations in 7.4

With each new Liferay DXP and Liferay Portal release, a feature may not warrant continued enhancements or may become obsolete. Stopping enhancements for a feature puts it in *Maintenance Mode*.

**Maintenance Mode:** Supported features with no further enhancements planned

Obsolete features are eventually removed or replaced with newer, improved features. Before dropping support for an obsolete feature, Liferay marks it as *Deprecated*.

**Deprecated:** Unsupported from the next minor version release

!!! important
    You should plan to stop using deprecated features because their support may cease as early as the next minor release. See [Maintenance Mode and Deprecation Policies](https://help.liferay.com/hc/en-us/articles/360015767952-Maintenance-Mode-and-Deprecation) for details.

## Deprecated Feature Availability

Deprecated features have different availability:

**Bundled:** Liferay includes the feature.

**Marketplace:** The feature is included in a Marketplace app's final version.

**Final:** The final version of the Marketplace app is released for this Liferay version.

**Archived:** The feature is unavailable, but its code is available in a sources artifact on Liferay's repository at <https://repository.liferay.com/nexus/index.html#welcome>.

**Removed:** The feature and its code are unavailable.

## Features Deprecated in 7.4

Here are the features deprecated in 7.4:

| Feature | Availability | Notes |
| :------ | :----------- | :---- |
| App Builder, App Builder Workflow | Removed | Replaced by [Liferay Objects](../../../liferay-development/objects.md). |
| Bootstrap 3 & Bootstrap 4 compatibility layer | Removed | Opt in to adding a compatibility layer during [Theme upgrade](../../../liferay-development/customizing-liferays-look-and-feel/themes/upgrading-a-theme.md) or manually add the layer.  |
| Commerce Account Widget | Removed | Replaced by the DXP/Portal Accounts Widget |
| Central Authentication Service (CAS) | Archived | Deprecated in 7.2. Replaced by other solutions, including SAML, OpenID Connect, and Token-based SSO. |
| Commerce Categories Navigation widget | Bundled | Replaced by [Display Page Templates](../../../site-building/displaying-content/using-display-page-templates.md) [Menu Display](../../../site-building/site-navigation/configuring-menu-displays.md) support. |
| Commerce Bill of Materials (BOM) | Removed | Replaced by [Shop By Diagram](https://learn.liferay.com/w/commerce/product-management/creating-and-managing-products/product-types/shop-by-diagram). |
| Commerce Category Content widget | Bundled | Replaced by [Display Page Templates](../../../site-building/displaying-content/using-display-page-templates.md). |
| Digest Authentication | Bundled | Digest Authentication  requires weak password hash storage, which is a vulnerability. |
| Dynamic Data Lists | Bundled | Deprecated in 7.3. Replaced by [Liferay Objects](../../../process-automation/forms/dynamic-data-lists/migrating-to-liferay-objects.md). |
| Export/Import Resource Importer | Removed | This importer was originally created to allow themes to provide additional Liferay assets during deployment. It was deprecated in earlier versions of 7.4 and was removed in 7.4 U74 / 7.4 GA74. We recommend leveraging our new approaches such as site initializers or [client extensions](../../../liferay-development/client-extensions.md). |
| EXT Plugins support | Removed | Replaced by configuration settings and standard extension points. |
| Google Login/SSO | Archived | Deprecated in 7.2. Replaced by other solutions, including SAML, OpenID Connect, and Token-based SSO. |
| Image Editor (Soy-based) | Removed | Replaced by a React-based image editor. |
| JAAS support code | Bundled | No replacement. |
| Kaleo Forms     | Bundled | Deprecated in 2023.Q3. Replaced by business processes for [Liferay Objects](../../../liferay-development/objects.md) (i.e., objects, workflow, and form container fragments). |
| Liferay Mobile Device Detection Enterprise | Archived | Deprecated in 7.2. Contact 51Degrees for up-to-date definitions. |
| Liferay Screens | Removed. Final version released in 7.3. | No direct replacement; however, the mobile SDK and headless APIs support mobile application development. |
| Liferay Sync Connector and Sync Client | Archived | Deprecated in 7.3. No direct replacement. |
| Live Users | Bundled | Deprecated in 7.2. Replaced by [Analytics Cloud](https://learn.liferay.com/w/analytics-cloud/index) |
| Mobile SDK | Removed | Replaced by [Headless Delivery](../../../headless-delivery/using-liferay-as-a-headless-platform.md). |
| NTLM | Archived | Deprecated in 7.2. Replaced by [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md). If you're using NTLM to authenticate Microsoft Windows™ accounts with, switch to using [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md). |
| OAuth 1.0a | Archived | Deprecated in 7.2. Replaced by Liferay Connector to OAuth 2.0 |
| Polls | Removed | Replaced by [Forms/Forms Reports](../../../process-automation/forms/sharing-forms-and-managing-submissions/form-reports.md). |
| Search widget (classic) | Bundled | Deprecated in 7.1. Replaced by the [Search widgets](../../../using-search/search-pages-and-widgets/search-results/search-results.md). |
| SOAP Web Services | Bundled (disabled by default) | Replaced by JSON web services, REST services, and GraphQL services. |
| Staging Relationship Modules | Bundled | These modules are obsolete and are no longer being used. They were deprecated in the 2023.Q3 release. |
| Theme: Hello World | Archived | Deprecated in 7.3. No direct replacement. |
| Web Content Search widget | Archived |  |

Features deprecated in earlier Liferay versions may also need to be considered if you are upgrading from an earlier version.

- [7.3 Deprecations and Features Moved to Maintenance Mode](./maintenance-mode-and-deprecations-in-7-3.md)
- [7.2 Deprecations and Features Moved to Maintenance Mode](./maintenance-mode-and-deprecations-in-7-2.md)
- [7.1 Deprecations](https://help.liferay.com/hc/en-us/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
- [7.0 Deprecations](https://help.liferay.com/hc/en-us/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

## Features Moved to Maintenance Mode in 7.4

Here are the features moved to Maintenance Mode in 7.4:

| Feature         | Notes                                                                                                                                      |
|:----------------|:-------------------------------------------------------------------------------------------------------------------------------------------|
| Contacts Module | Moved 4 portlets in the Contacts module (Contacts Center, Members, My Contacts, Profile) to maintenance mode. No replacement currently.    |
| Solr Connector  | [Use Elasticsearch](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md) if possible. |

!!! note
    Liferay continues to improve import/export and staging, particularly for remote live staging in scenarios that require content to be created in one environment and consumed in another. See [Publishing Tools](../../../site-building/publishing-tools.md) for more information.

## Related Topics

- [7.4 Breaking Changes](../../../liferay-internals/reference/7-4-breaking-changes.md)
- [7.4 Default Setting Changes](./default-setting-changes-in-7-4.md)
