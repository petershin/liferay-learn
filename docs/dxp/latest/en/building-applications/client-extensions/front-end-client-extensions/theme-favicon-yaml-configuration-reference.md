# Theme Favicon YAML Configuration Reference

Here is a guide to setting up the definition for a theme favicon client extension in your `client-extension.yaml` file.

## Usage Details

Here is an example `client-extension.yaml` file with a theme favicon client extension definition:

```yaml
able-theme-favicon:
    name: Able Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

The required `url` property defines where the favicon icon image file is located. This image becomes a new favicon option for every page in Liferay when the client extension is deployed.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-theme-favicon) for a complete example of a theme favicon client extension.

## YAML Properties

These properties are specific to theme favicon client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | A path to the icon image file that can be used to replace any page's favicon. The complete URI is prefixed by the `baseURL` value. Required for JS client extensions. |

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
