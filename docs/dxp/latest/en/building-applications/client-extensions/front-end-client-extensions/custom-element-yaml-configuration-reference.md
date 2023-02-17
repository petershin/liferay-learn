# Custom Element YAML Configuration Reference

Here is a guide to setting up the definition for a custom element client extension in your `client-extension.yaml` file.

## Usage Details

Here is an example `client-extension.yaml` file with a custom element client extension definition:

```yaml
able-custom-element:
    cssURLs:
        - style.css
    friendlyURLMapping: vanilla-counter
    htmlElementName: vanilla-counter
    instanceable: false
    name: Able Custom Element
    portletCategoryName: category.client-extensions
    type: customElement
    urls:
        - index.js
    useESM: false
```

The required `urls` property specifies one or more paths for JavaScript resources. One of these JavaScript resources must contain the custom element initialization code.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-custom-element-1) for a complete example of a custom element client extension.

## YAML Properties

These properties are specific to custom element client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `cssURLs` | String[] (partial URLs) | `[]` | List of CSS paths that are added to the HTML head when the custom element is used on a page. |
| `friendlyURLMapping` | String | | Mapping of a friendly URL prefix to the specific custom element widget. |
| `htmlElementName` | String | | The HTML element name that referrs to the custom element, which is rendered in the page markup. |
| `instanceable` | True/false | `false` | Whether the custom element widget can appear multiple times on a page. |
| `portletCategoryName` | String | `category.client-extensions` | The category the custom element widget is placed within the menu when editing a page. |
| `properties` | String[] | `[]` | Properties that are appended as attributes to the custom HTML element. They are appended with a new line as a separator and processed as Java properties. |
| `urls` | String[] (partial URLs) | | List of paths to JavaScript resources that are added to the HTML head when the widget is used on a page. One of these resources must contain the custom element initialization code. Combined with `baseURL` to form a complete URL. *Required for custom element client extensions.* |
| `useSM` | True/false | `false` | Whether the JavaScript code uses [ESM](https://nodejs.org/api/esm.html#modules-ecmascript-modules) format. When `true`, the JavaScript is added to the page with the `type="module"` property. |

## Additional Information

* [Front-end Client Extensions](../front-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [IFrame YAML Configuration Reference](./iframe-yaml-configuration-reference.md)
