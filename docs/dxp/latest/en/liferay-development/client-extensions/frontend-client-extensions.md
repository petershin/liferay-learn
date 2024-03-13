---
toc:
  - ./frontend-client-extensions/tutorials.md
  - ./frontend-client-extensions/javascript-yaml-configuration-reference.md
  - ./frontend-client-extensions/css-yaml-configuration-reference.md
  - ./frontend-client-extensions/theme-css-yaml-configuration-reference.md
  - ./frontend-client-extensions/theme-favicon-yaml-configuration-reference.md
  - ./frontend-client-extensions/theme-sprite-map-yaml-configuration-reference.md
  - ./frontend-client-extensions/custom-element-yaml-configuration-reference.md
  - ./frontend-client-extensions/iframe-yaml-configuration-reference.md
  - ./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
  - ./frontend-client-extensions/client-extensions-ui-reference.md
uuid: fcdeefe5-64f7-451c-8981-41e1a04290d6
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Frontend Client Extensions

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`
{bdg-secondary}`Liferay 7.4`

Frontend client extensions augment your pages and integrate new functionality. Available types include CSS, JavaScript, Theme CSS, Theme Favicon, Custom Element, and IFrame.

You can create and deploy these extensions from your [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md) or via UI (Global Menu (![Global Menu](../../images/icon-applications-menu.png)) &rarr; Applications tab &rarr; Client Extensions under Custom Apps).

See [Understanding Custom Element and IFrame Client Extensions](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) to learn more about creating [custom element](#custom-element-client-extensions) and [IFrame](#iframe-client-extensions) client extensions.

!!! note
    You can add JavaScript, CSS, or Theme CSS client extensions to layout sets (i.e., page sets), master templates, page templates, and individual content pages. The level at which you add the extension determines which entities inherit the extension's code. For example, if you add extensions to a master template, all page templates and content pages using the master template inherit its extensions.

## JavaScript Client Extensions

JavaScript client extensions provide global JavaScript libraries and logic throughout your Liferay instance. When you deploy a JavaScript client extension and configure a page to use it, its JavaScript runs automatically each time you visit the page (in the page's header or footer).

Specify a JavaScript client extension in your `client-extension.yaml` file:

```yaml
type: globalJS
```

See [Using a JavaScript Client Extension](./frontend-client-extensions/tutorials/using-a-javascript-client-extension.md) to get started.

## Custom Element Client Extensions

> Previously named Custom Element Remote App

Custom element client extensions use Liferay's frontend infrastructure to integrate external applications with the platform and render them as page widgets. They can integrate applications from any domain accessible outside of Liferay.

To use custom element client extensions, you create entries at the company level with the necessary URLs and details to register them with Liferay. Liferay then generates a unique widget for each entry and renders the application as a [custom HTML element](https://web.dev/custom-elements-v1/).

Specify a custom element client extension in your `client-extension.yaml` file:

```yaml
type: customElement
```

See [Understanding Custom Element and IFrame Client Extensions](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) for more information.

## IFrame Client Extensions

> Previously named IFrame Remote Apps

IFrame client extensions work like [custom element client extensions](#custom-element-client-extensions). However, they render external applications as `<iframe>` HTML elements, which allow for limited interaction from the host page. Unlike other frontend client extensions, these *do not provide a static resource*.

Specify IFrame client extensions in your `client-extension.yaml` file:

```yaml
type: iframe
```

See [Understanding Custom Element and IFrame Client Extensions](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) for more information.

## Editor Config Contributor Client Extensions

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

Editor Config Contributor client extensions override existing CKEditor configurations in a `ConfigContributor.java` file.

!!! important
    The client extension's configuration options must match the `ConfigContributor` it's overriding (i.e., portlet names, editor names, and editor config keys).

Specify an Editor Config Contributor client extension in your `client-extension.yaml` file:

```yaml
type: editorConfigContributor
```

## Frontend Client Extension Properties

Set these properties in the `client-extension.yaml` file of any frontend client extension:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `baseURL` | String | *Derived from site URL* | The base path from which all of the client extension's defined resources are served. |
| `description` | String | | The client extension's description. |
| `name` | String | | The client extension's name (as it appears in the UI). A name is required for frontend client extensions. |
| `sourceCodeURL` | URL | https://www.liferay.com | The address to the client extension's source repository. |
| `typeSettings` | String[] | [] | A list of strings that are processed with Liferay's `UnicodeProperties` syntax. Type-specific client extension properties are copied automatically into this when the client extension is built. |

See [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml) for more information.


## Export/Import Frontend Client Extensions Configured From the UI

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

!!! important
    This feature is currently behind a release feature flag (LPS-182184). Read [Release Feature Flags](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

You can Export/Import frontend client extensions that were configured from the UI while maintaining the external reference code and references created when the client extension was used in a page.

!!! note
    This export and import method is only available to client extensions configured from the UI.

To export a frontend client extension,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), navigate to the Applications tab, and select *Client Extensions* under Custom Apps.

1. Click *Actions* (![Actions icon](../../images/icon-actions.png)) next to the client extension you want to export and select *Export as JSON*.

The client extension is exported in JSON format and it's downloaded automatically onto your machine.

To import a frontend client extension,

1. In the Client Extensions application under Custom Apps, click *Options* (![Options icon](../../images/icon-options.png)) next to the Global Menu and select *Import*.

1. Select the JSON file containing the client extension and click *Import*.

The client extension is imported, and it appears in the client extensions list.

![Export/Import frontend client extensions configured from the UI.](./frontend-client-extensions/images/03.png)

## Related Topics

- [Introduction to Client Extensions](../client-extensions.md)
- [Understanding Custom Element and IFrame Client Extensions](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
- [Using a JavaScript Client Extension](./frontend-client-extensions/tutorials/using-a-javascript-client-extension.md)
- [Using a CSS Client Extension](./frontend-client-extensions/tutorials/using-a-css-client-extension.md)
