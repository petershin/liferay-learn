---
uuid: 7036db73-227b-4df6-8287-1d60ff0ef71f
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Client Extensions UI Reference

Liferay's [widget client extensions](./client-extensions-ui-reference.md#widget-client-extensions) (custom element and iframe) register applications with Liferay, adding them as widgets to site pages. Additionally, you can style your pages without deploying a new theme by creating [styling client extensions](./client-extensions-ui-reference.md#styling-client-extensions).

To add and manage these extensions,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Applications* tab &rarr; *Client Extensions*.

1. Click *Add* (![Add icon](../../../images/icon-add.png)) on the right side.

1. Choose your client extension type.

![Client extensions' user interface page for viewing, editing, and adding client extensions to the site](./client-extensions-ui-reference/images/01.png)

## Widget Client Extensions

The [custom element](./understanding-custom-element-and-iframe-client-extensions.md#using-the-custom-element-type) and [iframe](./understanding-custom-element-and-iframe-client-extensions.md#using-the-iframe-type) client extensions use Liferay’s frontend infrastructure to register JavaScript applications and render them as page widgets.

When creating or editing a widget extension, the following fields are available depending on the selected type of client extension.


| Field                                | Description                                                                                                                                                                                                                                                                                                                    |
|:-------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name                                 | The display name used for the client extension entry and its widget. Required.                                                                                                                                                                                                                                                 |
| Description                          | A description for the client extension entry.                                                                                                                                                                                                                                                                                  |
| Source Code URL                      | A URL to the external extension's source code for convenience.                                                                                                                                                                                                                                                                 |
| URL (*IFrame*)                       | Specify the URL to be rendered in the iframe. The entry's widget renders the application in an `<iframe>` element that points to the client extension's URL.                                                                                                                                                                   |
| HTML Element Name (*Custom Element*) | The name for the custom element that's declared in its `.js` file. The `.js` file that creates the custom element must associate it with a name. This name must match the HTML Element Name value. Required.
| Use ES Modules (*Custom Element*)    | Determine whether the browser sees the application's JavaScript injection as an [ES module](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules). When enabled, Liferay uses `<script src="js url" type="module">` when building the client extension so the extension is treated as an ES6 browser module. |
| JavaScript URL (*Custom Element*)    | Enter individual URLs for each of the extension's `.js` files. Click *Add* (![Add Button](../../../images/icon-plus.png)) to add more URL fields. Required.                                                                                                                                                                    |
| CSS URL (*Custom Element*)           | Enter individual URLs for each of the extension's `.css` files. Click *Add* (![Add Button](../../../images/icon-plus.png)) to add more CSS URL fields.                                                                                                                                                                         |
| Instanceable                         | Determine whether the client extension's widget is instanceable. When enabled, multiple instances of a widget can be added to the same page.                                                                                                                                                                                   |
| Portlet or Widget Category Name      | Enter the widget's category in the widget menu. The default value is *Client Extensions*.                                                                                                                                                                                                                                      |
| Friendly URL Mapping                 | Define the widget's Friendly URL Mapping, so you can refer to it using a more user readable URL.                                                                                                                                                                                                                               |
| Properties                           | Define the default properties that are included in all instances of the client extension. These properties are passed to the application as additional URL attributes so they can be accessed programmatically. If desired, you can configure individual widget instances to override these entry properties.                |

## Styling Client Extensions

The [CSS](../frontend-client-extensions.md#css-client-extensions), [JavaScript](../frontend-client-extensions.md#javascript-client-extensions), [theme CSS](../frontend-client-extensions.md#theme-css-client-extensions), and [theme favicon](../frontend-client-extensions.md#theme-favicon-client-extensions) client extensions make the design implementation experience in Liferay smooth, scalable and efficient.

These client extensions enable extending the default look and feel and behavior of your sites without the need for theme editing and redeployment. You can instead add styling and JavaScript client extensions directly to pages in a scalable way by using an external source of design for page building, without needing to modify the underlying theme for this purpose.

When creating or editing a styling extension, the following fields are available depending on the selected type of client extension.

| Field                      | Description                                                                                            |
|:---------------------------|:-------------------------------------------------------------------------------------------------------|
| Name                       | The display name used for the client extension entry. Required.                                        |
| Description                | A description for the client extension entry.                                                          |
| Source Code URL            | A URL to the external extension's source code for convenience.                                         |
| CSS URL (*CSS*)            | A URL to where the CSS application is hosted. This CSS is appended to theme.css. Required.             |
| JavaScript URL (*JS*)      | A URL to where the JavaScript application is hosted. This JavaScript is appended to main.js. Required. |
| Main CSS URL (*Theme CSS*) | A URL to where the main CSS file is hosted. This CSS replaces main.css.                                |
| Clay CSS URL (*Theme CSS*) | A URL to where the clay CSS file is hosted. This CSS replaces clay.css.                                |
| URL (*Theme Favicon*)      | A URL to where the favicon is hosted. This favicon replaces the one from the theme. Required.          |

```{tip}
Documents and Media is not recommended to host design resources to be used for Client Extensions. Permissions can be confusing, and users could eventually manipulate or delete these resources. Also, Documents and Media is not able to provide the correct MIME type for CSS resources.
```

Once the client extensions are created, they can be applied so that pages are able to read their contained styles. For more information on how to use the client extension on a page, go to [tutorials](./tutorials.md), choose the client extension type you desire, and follow the steps to apply or override it on a page.

## Related Topics

* [Frontend Client Extensions](../frontend-client-extensions.md)
* [Understanding Custom Element and IFrame Client Extensions](./understanding-custom-element-and-iframe-client-extensions.md)
* [Frontend Client Extensions Tutorials](./tutorials.md)
