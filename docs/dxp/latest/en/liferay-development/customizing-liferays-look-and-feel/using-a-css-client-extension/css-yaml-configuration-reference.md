---
uuid: 5689e9cb-ea33-47b6-9586-df785fab2b62
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# CSS YAML Configuration Reference

You can define a CSS client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a CSS client extension definition:

```yaml
able-global-css:
    name: Able Global CSS
    type: globalCSS
    url: global.css
```

The required `url` property defines the CSS resource file's location. CSS included here is added to the styling already used in the theme. In case of a conflict, the client extension's CSS overrides the styling already on the page.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-css) includes a complete CSS client extension.

## YAML Properties

These properties are specific to CSS client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | (Required) The path to the CSS file added to the page's CSS when enabled on a page. The complete URI is prefixed by the `baseURL` value. |

See [Frontend Client Extension Properties](../frontend-client-extensions.md#frontend-client-extension-properties) for properties common to all frontend client extensions.

## Related Topics

* [Frontend Client Extensions](../frontend-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Theme CSS YAML Configuration Reference](./theme-css-yaml-configuration-reference.md)
