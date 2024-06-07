---
uuid: 51abbad2-5447-4e53-accb-e62dbe327762
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Theme CSS YAML Configuration Reference

You can define a theme CSS client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a theme CSS client extension:

```yaml
able-theme-css:
    clayURL: css/clay.css
    frontendTokenDefinitionJSON: src/frontend-token-definition.json
    mainURL: css/main.css
    name: Able Theme CSS
    type: themeCSS
```

The required `mainURL` and `clayURL` properties set the path to the two CSS resource files (`main.css` and `clay.css`, respectively). These CSS files correspond to those deployed with a theme module project.

The CSS in these files is added to the styling already used in your theme. In case of a conflict, the client extension's CSS overrides the styling already on the page.

The `frontendTokenDefinitionJSON` property was added in Liferay DXP 2024.Q2/Portal 7.4 GA120 to enable providing the [frontend token definition](../../../site-building/site-appearance/style-books/developer-guide/frontend-token-definitions.md) file.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-css-1) includes a complete theme CSS client extension.

## YAML Properties

These properties are specific to theme CSS client extensions:

| Name | Data Type | Description |
|:-|:-|:-|
| `clayURL`                     | URL | (Required) The path to the CSS file representing the `clay.css` file of a Liferay theme. The complete URI is prefixed by the `baseURL` value. |
| `mainURL`                     | URL | (Required) The path to the CSS file representing the `main.css` file of a Liferay theme. The complete URI is prefixed by the `baseURL` value. |
| `frontendTokenDefinitionJSON` | String | The path to the `frontend-token-definition.json` file. At build time, its JSON is injected into the client extension's configuration file. |

See [Frontend Client Extension Properties](../../customizing-liferays-look-and-feel.md#frontend-client-extension-properties) for properties common to all frontend client extensions.

## Related Topics

* [Frontend Client Extensions](../../customizing-liferays-look-and-feel.md)
* [Working with Client Extensions](../../client-extensions/working-with-client-extensions.md)
* [CSS YAML Configuration Reference](../using-a-css-client-extension/css-yaml-configuration-reference.md)
