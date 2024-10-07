---
uuid: bb04dc70-eb4b-45dd-96a4-655f3a5a255b
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---

# Site Initializer YAML Configuration Reference

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4`

Use a `client-extension.yaml` file to define a site initializer client extension.

## Usage Details

This `client-extension.yaml` file defines a client extension of type `siteInitializer`:

```yaml
liferay-sample-site-initializer:
    name: Liferay Sample Site Initializer
    oAuthApplicationHeadlessServer: liferay-sample-site-initializer-oauth-application-headless-server
    siteExternalReferenceCode: liferaySample
    siteName: Liferay Sample
    type: siteInitializer

liferay-sample-site-initializer-oauth-application-headless-server:
    .serviceAddress: localhost:8080
    .serviceScheme: http
    name: Liferay Sample OAuth Application Headless Server
    scopes:
        - Liferay.Headless.Site.everything
    type: oAuthApplicationHeadlessServer
```

The required `siteName` property defines the new site's name when it's deployed. The client extension also requires an [OAuth headless server client extension](../../configuration-as-code.md#oauth-headless-server-client-extensions) to authenticate.

The [sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-site-initializer) includes a complete site initializer client extension.

## YAML Properties

These properties are specific to site initializer client extensions:

| **Name**                    | **Data Type** | **Description**                                                |
| :-------------------------- | :------------ | :------------------------------------------------------------- |
| `siteExternalReferenceCode` | String        | An external reference code used to uniquely identify the site. |
| `siteName`                  | String        | The site's name when it's deployed to a Liferay instance.      |

## Related Topics

* [Importing/Exporting Data](../../importing-exporting-data.md)