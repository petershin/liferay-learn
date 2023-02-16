# Theme CSS Client Extension Usage and Properties

Theme CSS client extensions are a way to introduce new CSS styling to your pages, using the same files as you would with a Liferay [theme](link). When you deploy a CSS client extension to your Liferay instance and configure a page to use it, the CSS contained in it adds to the styling present on the page, including theme and style book settings.

## Usage Details

Here is an example `client-extension.yaml` file with a theme CSS client extension definition:

```yaml
able-theme-css:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Able Theme CSS
    type: themeCSS
```

The required `mainURL` and `clayURL` properties define where the two CSS resource files are located (`main.css` and `clay.css`, respectively). These are the same CSS files that are present when you deploy a theme.

Any CSS contained included in these files is added to the styling already used in your theme. In case of a conflict, the client extension's CSS overrides the styling already on the page.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-theme-css) for a complete example of a theme CSS client extension.

## YAML Properties

These properties are specific to theme CSS client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `clayURL` | URL | A path to the CSS file that represents the `clay.css` file provided by a Liferay theme. The complete URI is prefixed by the `baseURL` value. Required for theme CSS client extensions. |
| `mainURL` | URL | A path to the CSS file that represents the `main.css` file provided by a Liferay theme. The complete URI is prefixed by the `baseURL` value. Required for theme CSS client extensions. |

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [CSS Client Extension Properties and Usage](./css-client-extension-properties-and-usage.md)
