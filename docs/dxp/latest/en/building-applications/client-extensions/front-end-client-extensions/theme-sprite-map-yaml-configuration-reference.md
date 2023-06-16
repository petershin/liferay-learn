---
uuid: 03821b5e-c0a1-4dc8-a900-eb1e36c1ead5
---
# Theme Sprite Map YAML Configuration Reference

You can define a theme sprite map client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` defines a theme sprite map client extension:

```yaml
able-theme-spritemap:
    name: Able Theme Spritemap
    type: themeSpritemap
    url: spritemap.svg
```

The required `url` property defines the `.svg` sprite map file's location.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-spritemap-1) contains a complete theme sprite map client extension.

## YAML Properties

These properties are specific to theme sprite map client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | (Required) A path to the `.svg` sprite map that replaces the one for your existing Liferay theme. The complete URI is prefixed by the `baseURL` value. |

See [Front-end Client Extension Properties](../front-end-client-extensions.md#front-end-client-extension-properties) for properties common to all front-end client extensions.

## Related Topics

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
