---
uuid: d5930388-d026-4c77-bcc1-dd9d4b985869
---
# IFrame YAML Configuration Reference

Here is a guide to setting up the definition for an IFrame client extension in your `client-extension.yaml` file.

## Data Usage

Here is an example `client-extension.yaml` file with an IFrame client extension definition:

```yaml
able-iframe:
    name: Able IFrame
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

The required `url` property points to the location of an HTML page to embed within the IFrame widget.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-iframe-1) for a complete example of an IFrame client extension.

## YAML Properties

These properties are specific to IFrame client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `friendlyURLMapping` | String | | Mapping of a friendly URL prefix to the specific IFrame widget. |
| `portletCategoryName` | String | | The category the IFrame widget is placed within the menu when editing a page. |
| `url` | URL | | Complete URL to the HTML page to embed within the IFrame widget. *Required for IFrame client extensions.* |
| `instanceable` | True/false | `false` | Whether the IFrame widget can appear multiple times on a page. |

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Custom Element YAML Configuration Reference](./custom-element-yaml-configuration-reference.md)
