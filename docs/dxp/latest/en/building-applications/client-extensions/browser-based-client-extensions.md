---
toc:
- ./browser-based-client-extensions/developer-guide.md
- ./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
- ./browser-based-client-extensions/remote-applications-ui-reference.md
---
# Browser-Based Client Extensions

```{toctree}
:maxdepth: 3

browser-based-client-extensions/developer-guide.md
browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
browser-based-client-extensions/remote-applications-ui-reference.md
```

There is a variety of different types of browser-based client extensions that provide different ways to augment your pages in Liferay. Create and deploy these client extensions from your [Liferay workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md).

You can generate a basic version of all types of browser-based client extensions by running this command using the [Blade CLI](../tooling/blade-cli.md) in your Liferay workspace:

```bash
blade create -t client-extension <your-new-folder-name>
````

## Global JavaScript Client Extensions

Global JavaScript client extensions are some of the most straightforward and easy to create. When you deploy a global JS client extension to your Liferay instance and configure a page to use it, the JavaScript contained in it automatically runs each time you visit the page. This allows you to add special functionality to your pages without the use of an OSGi module or theme.

See [Creating Your First Global Javascript Client Extension](./browser-based-client-extensions/developer-guide/creating-your-first-global-javascript-client-extension.md) to get started working with this type.

## Theme JavaScript Client Extensions

Similarly to [Global JavaScript client extensions](#global-javascript-client-extensions), you can also 

## Global CSS Client Extensions

Global CSS client extensions are a simple way to override CSS styling on your pages. When you deploy a global CSS client extension to your Liferay instance and configure a page to use it, the global CSS contained in it overrides the styling present on the page, including theme and style book settings. This allows you to programmatically override specific styles on a page for special needs that may be cumbersome to modify your theme to accommodate.

See [Creating Your First Global CSS Client Extension](./browser-based-client-extensions/developer-guide/creating-your-first-global-css-client-extension.md) to get started working with this type.

## Theme Favicon Client Extensions

You can also use client extensions to override the favicon for your pages in Liferay. When you deploy a theme favicon client extension, the icon file included with it becomes available for any page in Liferay. You can access it in a separate *Client Extensions* tab when you configure the favicon for a page from the Page Design Options menu.

![When you configure the favicon for a page, access the favicon from your client extension from a special Client Extensions tab.](./browser-based-client-extensions/01.png)

## Custom Element Client Extensions

```{note}
The custom element and IFrame types of client extensions were previously referred to as Liferay Remote Apps.
```

Custom element client extensions Liferay's front-end infrastructure to integrate external applications with the platform and render them as page widgets. They can integrate applications from any domain accessible outside of Liferay.

To use custom element client extensions, you create entries at the company level with the necessary URLs and details to register them with Liferay. Liferay then generates a unique widget for each entry and renders the application as a [custom HTML element](https://web.dev/custom-elements-v1/).

See [Understanding Custom Element and IFrame Client Extensions](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) for more information.

## IFrame Client Extensions

```{note}
The custom element and IFrame types of client extensions were previously referred to as Liferay Remote Apps.
```

IFrame client extensions work very similarly to [custom element client extensions](#custom-element-client-extensions). However, they render external applications as `<iframe>` HTML elements, which allow for limited interaction from the host page. See [Understanding Custom Element and IFrame Client Extensions](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) for more information.

## Additional Information

* [Introduction to Client Extensions](../client-extensions.md)
* [Creating Your First Global JavaScript Client Extension](./browser-based-client-extensions/developer-guide/creating-your-first-global-javascript-client-extension.md)
* [Creating Your First Global CSS Client Extension](./browser-based-client-extensions/developer-guide/creating-your-first-global-css-client-extension.md)
* [Understanding Custom Element and IFrame Client Extensions](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
