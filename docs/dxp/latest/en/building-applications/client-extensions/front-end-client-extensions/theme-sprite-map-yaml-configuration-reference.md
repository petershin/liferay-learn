---
uuid: 03821b5e-c0a1-4dc8-a900-eb1e36c1ead5
---
# Theme Sprite Map YAML Configuration Reference

Here is a guide to setting up the definition for a theme sprite map client extension in your `client-extension.yaml` file.

## Usage Details

Here is an example `client-extension.yaml` file with a theme sprite map client extension definition:

```yaml
able-theme-spritemap:
    name: Able Theme Spritemap
    type: themeSpritemap
    url: spritemap.svg
```

The required `url` property defines where the `.svg` sprite map file is located.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-theme-spritemap) for a complete example of a theme sprite map client extension.

## YAML Properties

These properties are specific to theme sprite map client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | A path to the `.svg` sprite map that replaces the one for your existing Liferay theme. The complete URI is prefixed by the `baseURL` value. Required for JS client extensions. |

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)