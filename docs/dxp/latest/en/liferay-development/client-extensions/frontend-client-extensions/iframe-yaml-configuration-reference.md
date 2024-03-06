---
uuid: d5930388-d026-4c77-bcc1-dd9d4b985869
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# IFrame YAML Configuration Reference

You can define an IFrame client extension with a `client-extension.yaml` file.

## Data Usage

This `client-extension.yaml` file defines an IFrame client extension:

```yaml
able-iframe:
    name: Able IFrame
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

The required `url` property points to the HTML page to embed within the IFrame widget.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-1) includes a complete IFrame client extension.

## YAML Properties

These properties are specific to IFrame client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `friendlyURLMapping` | String | | The mapping of a friendly URL prefix to the specific IFrame widget. |
| `portletCategoryName` | String | | The menu category of the IFrame widget. |
| `url` | URL | | (Required) The complete URL to the HTML page to embed within the IFrame widget. |
| `instanceable` | True/false | `false` | Whether the IFrame widget can appear multiple times on a page. |

See [Frontend Client Extension Properties](../frontend-client-extensions.md#frontend-client-extension-properties) for properties common to all frontend client extensions.

## Related Topics

* [Frontend Client Extensions](../frontend-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Custom Element YAML Configuration Reference](./custom-element-yaml-configuration-reference.md)
