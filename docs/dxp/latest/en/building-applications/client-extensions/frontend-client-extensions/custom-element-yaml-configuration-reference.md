---
uuid: e1442843-69dc-4818-8ee2-fe64cbb075ef
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Custom Element YAML Configuration Reference

You can define a custom element client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a custom element client extension:

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

The required `urls` property specifies one or more paths to JavaScript resources. One of these JavaScript resources must contain the custom element initialization code.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-custom-element-1) contains a complete custom element client extension.

## YAML Properties

These properties are specific to custom element client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `cssURLs` | String[] (partial URLs) | `[]` | List of CSS paths added to the HTML head when the custom element is used on a page. |
| `friendlyURLMapping` | String | | Mapping of a friendly URL prefix to the specific custom element widget. |
| `htmlElementName` | String | | The HTML element name that refers to the custom element, which is rendered in the page markup. |
| `instanceable` | True/false | `false` | Whether the custom element widget can appear multiple times on a page. |
| `portletCategoryName` | String | `category.client-extensions` | The menu category of the custom element widget. |
| `properties` | String[] | `[]` | Properties to append as attributes to the custom HTML element. They use a newline as a separator and are processed as Java properties. |
| `urls` | String[] (partial URLs) | | (Required) List of paths to JavaScript resources that are added to the HTML head when the widget is used on a page. One of these resources must contain the custom element initialization code. This combines with `baseURL` to form a complete URL. |
| `useESM` | True/false | `false` | Whether the JavaScript code uses [ESM](https://nodejs.org/api/esm.html#modules-ecmascript-modules) format. When `true`, the JavaScript is added to the page with the `type="module"` property. |

See [Frontend Client Extension Properties](../frontend-client-extensions.md#frontend-client-extension-properties) for properties common to all frontend client extensions.

## Related Topics

* [Frontend Client Extensions](../frontend-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [IFrame YAML Configuration Reference](./iframe-yaml-configuration-reference.md)
