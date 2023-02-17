# CSS YAML Configuration Reference

Here is a guide to setting up the definition for a CSS client extension in your `client-extension.yaml` file.

## Usage Details

Here is an example `client-extension.yaml` file with a CSS client extension definition:

```yaml
able-global-css:
    name: Able Global CSS
    type: globalCSS
    url: global.css
```

The required `url` property defines where the CSS resource file is located. Any CSS contained included here is added to the styling already used in your theme. In case of a conflict, the client extension's CSS overrides the styling already on the page.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-global-css) for a complete example of a CSS client extension.

## YAML Properties

These properties are specific to CSS client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | A path to the CSS file that is added to the page's CSS when the client extension is enabled on a page. The complete URI is prefixed by the `baseURL` value. Required for CSS client extensions. |

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Theme CSS YAML Configuration Reference](./theme-css-yaml-configuration-reference.md)
