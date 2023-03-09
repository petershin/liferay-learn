---
uuid: c79386c9-9344-49e3-bfd4-626b4f8750ed
---
# JavaScript YAML Configuration Reference

Here is a guide to setting up the definition for a JavaScript client extension in your `client-extension.yaml` file.

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
* [Theme JS YAML Configuration Reference](./theme-js-yaml-configuration-reference.md)
