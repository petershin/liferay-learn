---
uuid: 147a9736-cb25-486e-8aa2-86547cf5852b
---
# Theme Favicon YAML Configuration Reference

You can define a theme favicon client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a theme favicon client extension:

```yaml
able-theme-favicon:
    name: Able Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

The required `url` property defines the favicon icon image's location. This image becomes a new favicon option for every page in Liferay when the client extension is deployed.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-theme-favicon) contains a complete theme favicon client extension.

## YAML Properties

These properties are specific to theme favicon client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | (Required) The path to the icon image file. The complete URI is prefixed by the `baseURL` value. |

See [Front-end Client Extension Properties](../front-end-client-extensions.md#front-end-client-extension-properties) for properties common to all front-end client extensions.

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
