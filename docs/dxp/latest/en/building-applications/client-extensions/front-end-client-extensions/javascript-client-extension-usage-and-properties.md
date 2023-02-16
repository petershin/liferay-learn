# JavaScript Client Extension Usage and Properties

You can use JavaScript client extensions to provide global JavaScript libraries and logic throughout your Liferay instance (or virtual instance). When you deploy a JavaScript client extension to your Liferay instance and configure a page to use it, the JavaScript contained in it automatically runs each time you visit the page. This allows you to add special functionality to your pages without the use of an OSGi module or theme.

## Usage Details

Here is an example `client-extension.yaml` file with a JavaScript client extension definition:

```yaml
able-global-js:
    name: Able Global JS
    type: globalJS
    url: global.js
```

The required `url` property defines where the JavaScript resource file is located. When this client extension is enabled on a page, any JavaScript located here runs whenever the page is loaded.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions) for a complete example of a JavaScript client extension.

## YAML Properties

These properties are specific to JavaScript client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | A path to the JavaScript file that is added to the HEAD of the page when the client extension is enabled on a page. The complete URI is prefixed by the `baseURL` value. Required for JS client extensions. |

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Theme JS Client Extension Properties and Usage](./theme-js-client-extension-properties-and-usage.md)
