---
uuid: 66945681-9614-490d-aa97-e08f9c61501f
taxonomy-category-names:
- Development and Tooling
- Reference
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Portal Developer Properties

There are [Portal Properties](../../../installation-and-upgrades/reference/portal-properties.md) that facilitate development. Liferay's [`portal-developer.properties`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-impl/src/portal-developer.properties) file includes all of them. The `portal-developer.properties` file is enabled by adding this setting to the top of your `portal-ext.properties` file:

```properties
include-and-override=portal-developer.properties
```

## Developer Settings

| Developer Setting                                                       | Description                                                                                                                                                                                                                      |
| :---------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| schema.module.build.auto.upgrade=true                                   | Automatically upgrades the database when a module's build number has been increased since the last deployment.                                                                                                                   |
| upgrade.database.auto.run=true                                          | Executes the upgrade process when the portal starts and modules are activated.                                                                                                                                                   |
| theme.css.fast.load=false                                               | Disables merging the theme's CSS files to facilitate debugging.                                                                                                                                                                  |
| theme.css.fast.load.check.request.parameter=true                        | Allows enablement and disablement of merging the theme's CSS files through a request parameter.                                                                                                                                  |
| theme.images.fast.load=false                                            | Disables merging the theme's image files to facilitate debugging.                                                                                                                                                                |
| theme.images.fast.load.check.request.parameter=true                     | Allows enablement and disablement of merging the theme's image files through a request parameter.                                                                                                                                |
| enterprise.product.notification.enabled=false                           | Disables the Enterprise Search terms of use pop-up that occurs on the first login.                                                                                                                                               |
| javascript.fast.load=true                                               | Disables loading the packed version of files listed in the properties `Liferay-JS-Resources-Top-Head` and/or `Liferay-JS-Resources-Top-Head-Authenticated` of OSGi bundles' manifest files.                                      |
| javascript.log.enabled=false                                            | Disables the display of JavaScript logging.                                                                                                                                                                                      |
| company.security.strangers.verify=false                                 | Allows creation of accounts without email verification.                                                                                                                                                                          |
| access.control.sanitize.security.exception=false                        | Disables sanitizing exceptions thrown by AccessControlAdvisorImpl to display more information when a remote access invocation is denied.                                                                                         |
| layout.template.cache.enabled=false                                     | Disables caching layout template content.                                                                                                                                                                                        |
| browser.launcher.url=                                                   | Disables launching a browser automatically when the portal is fully initialized.                                                                                                                                                 |
| combo.check.timestamp=true                                              | Facilitates debugging by disabling the combo servlet. See the [`combo.check.timestamp`](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Combo) definition for more information. |
| cors.disable.authorization.context.check=true                           | Allows CORS without a guest security context or client authorized using OAuth 2.0.                                                                                                                                               |
| direct.servlet.context.reload=true                                      | Automatically refreshes the servlet associated with a JSP when the JSP has been modified.                                                                                                                                        |
| feature.flag.ui.visible[dev]=true                                       | Enables accessing the UI for developer feature flags. See [Beta Features and Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md) for more information.                                           |
| initial.system.check.enabled=true                                       | Runs [`system:check`](https://help.liferay.com/hc/en-us/articles/360029005112-System-Check) on startup.                                                                                                                          |
| json.service.serialize.throwable=true                                   | Returns information about server errors in the JSON response.                                                                                                                                                                    |
| minifier.enabled=false                                                  | Enables minification of CSS and JavaScript resources.                                                                                                                                                                            |
| module.framework.properties.osgi.console=localhost:11311                | Enables console access for debugging modules.                                                                                                                                                                                    |
| work.dir.override.enabled=true                                          | Allows using the Liferay work directory to override JSP files within a deployed OSGi bundle.                                                                                                                                     |
| com.liferay.portal.servlet.filters.etag.ETagFilter=false                | Enables the ETag filter that generates ETag headers.                                                                                                                                                                             |
| com.liferay.portal.servlet.filters.header.HeaderFilter=false            | Enables the header filter that sets request headers.                                                                                                                                                                             |
| com.liferay.portal.servlet.filters.themepreview.ThemePreviewFilter=true | Enables the theme preview filter that generates a preview of the currently applied theme which can be used by the Dreamweaver Theming plugin.                                                                                    |

## Related Topics

- [Portal Properties](../../../installation-and-upgrades/reference/portal-properties.md)
