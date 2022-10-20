# Understanding Custom Element and IFrame Client Extensions

Custom element and IFrame client extensions are special types that integrate remote applications into pages on Liferay. They use Liferay's front-end infrastructure to register external applications and render them as page widgets. When creating an entry for them in the UI, you can select between the [custom element](#using-the-custom-element-type) and [IFrame](#using-the-iframe-type) and types. This determines how the external application is registered with Liferay DXP and rendered in site pages.

Both of these client extension types are integrated into pages as a widget during the page rendering life cycle. When you create the entry, Liferay generates and adds the widget to the OSGi service registry. If desired, you can set additional properties at the entry or widget level to configure how both custom element and IFrame applications are rendered.

However, custom element and IFrame applications are hosted and rendered differently. They also have different levels of access to Liferay services and runtime data.

```{tip}
The [custom element](#using-the-custom-element-type) type offers greater integration with the Liferay platform and supports more complex scenarios.
```

## Using the Custom Element Type

The custom element client extension type renders external application code into a separate HTML `<custom-element>` and provides full integration with the Liferay host page. The architecture for custom element applications includes three main parts: the Liferay server, the Liferay host page, and the server storing your application's code. Liferay uses these files to create the application in a browser.

![The custom element architecture includes an entry in the Liferay server, application code stored on a server, and the Liferay page with the client extension's unique widget.](./understanding-custom-element-and-iframe-client-extensions/images/02.png)

Each custom element entry includes an HTML element name, as well as URLs to any necessary JavaScript and CSS files. They can also include properties rendered with the application during runtime.

Once added to a page, Liferay inserts the client extension's JavaScript and CSS files directly into the page via `<script>` and `<link>` elements. When loaded, the JavaScript declares and instantiates the application, and the CSS files style it.

```{important}
The remote application's code must declare the custom element and provide an HTML element name matching the name in the remote app entry. For this reason, it must use an [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE) to ensure the custom element declaration runs in the browser as soon as the app code is loaded.
```

When the remote app's widget is added to a page, it renders the application markup by first generating a tag with the provided HTML element name and then executing the logic defined in the element's code. If the entry or widget instance includes properties, they are added to the generated custom element markup (`<custom-element (+props)/>`).

Once rendered, the application is fully integrated in the Liferay page so it can use Liferay's public JavaScript API and reuse style classes already available in the host page. However, you can change this by how you build the custom element and where you put its style rules. For example, if the application's markup uses [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM), the styles of the custom element and the host page can be isolated from one another.

```{note}
When multiple instances of the custom element widget are added to a page, Liferay only includes the application's URLs once.
```

## Using the IFrame Type

The IFrame client extension type renders external applications into a separate `<iframe>` element and allows for limited interaction with the host page using Liferay's client SDK API. The architecture for IFrame applications includes three main parts: the Liferay server, the Liferay host Page, and the external server hosting your application.

![The IFrame architecture includes an entry in the Liferay server, an application hosted on an external server, and the Liferay Page with the client extension's unique widget.](./understanding-custom-element-and-iframe-client-extensions/images/01.png)

Each IFrame entry stores an IFrame URL that links to an application, typically served from an external server. As a result, the application must provide an HTML document including markup, scripts, styles, and (optionally) the client SDK.

When you add the client extension's widget to a page, Liferay uses the entry's URL to render an `<iframe>` tag populated with the external application's content. If the entry or widget instance includes properties, they are passed to the application as additional URL attributes (`<iframe (+properties)/>`) so the app can access them programmatically.

```{note}
IFrame apps must be deployed to a server so they can assemble their own markup and send it to the browser to fill the widget's `<iframe>` element. By contrast, [Custom Element apps](#using-the-custom-element-type) don't require a server to produce any markup. They only require the application's code is available via URLs, since the browser is responsible for running the necessary logic via the app's widget and JS code.
```

By default, all browsers impose the 'same-origin' policy for IFrame applications to prevent information flow between a host page and its external applications. Liferay provides a client SDK script to allow limited communication between IFrame elements and a Liferay page. It works by implementing a communication protocol with the page via the `postMessage()` API. To use this script, it must be included in the application's markup.

When an IFrame app uses the client SDK, the Liferay page receives instructions to perform certain actions on behalf of the application as the current logged-in user. This includes making service calls to the DXP server and access state details (e.g., opening a toast in the host Page, calling headless APIs, running GraphQL queries, accessing style properties).

## Additional Information

* [Introduction to Client Extensions](../../client-extensions.md)
* [Creating a Basic Remote App](./remote-apps-tutorials/creating-a-basic-remote-app.md)
* [Remote Apps UI Reference](./remote-apps-ui-reference.md)
