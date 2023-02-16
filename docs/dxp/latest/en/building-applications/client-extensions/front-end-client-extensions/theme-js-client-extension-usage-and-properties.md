# Theme JS Client Extension Usage and Properties

You can use theme JS client extensions to provide global JavaScript libraries and logic throughout your Liferay instance (or virtual instance), in the same way you would add them with a [theme](link). When you deploy a JavaScript client extension to your Liferay instance and configure a page to use it, the JavaScript contained in it automatically runs each time you visit the page.

## Usage Details

Here is an example `client-extension.yaml` file with a theme JS client extension definition:

```yaml
able-theme-js:
    name: Able Theme JS
    type: themeJS
    url: main.js
```

The required `url` property defines where the JavaScript resource file is located. When this client extension is enabled on a page, any JavaScript located here runs each time you load the page.

<!--TODO: are any additional resources available for theme JS as opposed to normal JS? Is there any functional difference in how it runs? -->

## YAML Properties

These properties are specific to theme JS client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | A path to the JavaScript file that is added to the HEAD of the page when the client extension is enabled on a page. The complete URI is prefixed by the `baseURL` value. Required for theme JS client extensions. |


See [Front-end Client Extension Properties](../front-end-client-extension-properties) for more properties that are not specific to theme JS client extensions.

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [JavaScript Client Extension Properties and Usage](./javascript-client-extension-properties-and-usage.md)
