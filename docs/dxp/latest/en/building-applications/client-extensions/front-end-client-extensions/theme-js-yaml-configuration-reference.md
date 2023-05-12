---
uuid: 922b13bf-d038-4f17-889f-87278aed7933
---
# Theme JS YAML Configuration Reference

You can define a theme JS client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a theme JS client extension:

```yaml
able-theme-js:
    name: Able Theme JS
    type: themeJS
    url: main.js
```

The required `url` property defines the JavaScript file's location. When enabled on a page, all JavaScript resources at the URL run each time the page loads.

<!--TODO: are any additional resources available for theme JS as opposed to normal JS? Is there any functional difference in how it runs? -->

## YAML Properties

These properties are specific to theme JS client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `url` | URL | (Required) The path to the JavaScript file that is added to the HEAD of the page. The complete URI is prefixed by the `baseURL` value. |


See [Front-end Client Extension Properties](../front-end-client-extension-properties) for properties common to all front-end client extensions.

## Related Topics

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [JavaScript YAML Configuration Reference](./javascript-yaml-configuration-reference.md)
