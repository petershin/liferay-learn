# Remote Applications UI Reference
<!-- TASK: Rename article and add reference material for the other four client extensions; also, maybe reconsider the use of "remote" and "external"-->
The [custom element](./understanding-custom-element-and-iframe-client-extensions.md#using-the-custom-element-type) and [IFrame](./understanding-custom-element-and-iframe-client-extensions.md#using-the-iframe-type) client extensions use Liferay's front-end infrastructure to register JavaScript applications and render them as page widgets. To add and manage these extensions, open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click the *Applications* tab, and go to *Remote Apps*.

When creating or editing an extension, the following fields are available depending on the selected type of client extension (i.e., custom element or IFrame).

| Field | Description |
| --- | --- |
| Name | The display name used for the remote application entry and its widget. |
| Description | A description for the remote application entry. |
| Source Code URL | A URL to the external application's source code for convenience. |
| Type | Currently, Liferay supports two types: custom element and IFrame. These types determine the contract between the Liferay platform and the external application. |
| URL (*IFrame*) | A URL to where the external application is hosted. The entry's widget renders the application in an `<iframe>` element that points to the remote application's URL. |
| HTML Element Name (*Custom Element*) | The name for the custom element that's declared in its `.js` file. The `.js` file that creates the custom element must associate it with a name. This name must match the HTML Element Name value. |
| Use ES Modules (*Custom Element*) | Determine whether the browser sees the application's JS injection as an [ES module](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules). When enabled, Liferay uses `<script src="js url" type="module">` when building the remote application so the application is treated as an ES6 browser module. |
| URL (*Custom Element*) | Enter individual URLs for each of the application's `.js` files. Click the *Add* button (![Add Button](../../../images/icon-plus.png)) to add more URL fields. |
| CSS URL (*Custom Element*) | Enter individual URLs for each of the application's `.css` files. Click the *Add* button (![Add Button](../../../images/icon-plus.png)) to add more CSS URL fields. |
| Instanceable | Determine whether the remote application's widget is instanceable. When enabled, multiple instances of a widget can be added to the same page. |
| Portlet Category Name | Enter the widget's category in the Widget menu. The default value is *Remote Apps*. |
| Friendly URL Mapping | Define the widget's Friendly URL Mapping, so you can refer to it using a more user readable URL. |
| Properties | Define default properties that are included in all instances of the application's widget. These properties are passed to the remote application by the widget as additional URL attributes so they be accessed programmatically. If desired, you can configure individual widget instances to override these entry properties. |

## Additional Information

* [Browser-Based Client Extensions](../browser-based-client-extensions.md)
* [Understanding Custom Element and IFrame Client Extensions](./understanding-custom-element-and-iframe-client-extensions.md)
* [Creating a Basic Custom Element](./tutorials/creating-a-basic-custom-element.md)
