---
toc: 
  - ./customizing-liferays-look-and-feel/using-a-theme-favicon-client-extension.md
  - ./customizing-liferays-look-and-feel/using-a-css-client-extension.md
  - ./customizing-liferays-look-and-feel/using-a-theme-css-client-extension.md
  - ./customizing-liferays-look-and-feel/using-a-javascript-client-extension.md
  - ./customizing-liferays-look-and-feel/using-a-theme-spritemap-client-extension.md
  - ./customizing-liferays-look-and-feel/using-an-editor-config-contributor-client-extension.md
  - ./customizing-liferays-look-and-feel/client-extensions-ui-reference.md
  - ./customizing-liferays-look-and-feel/themes.md
taxonomy-category-names:
  - Development and Tooling
  - Client Extensions
  - Liferay Self-Hosted
  - Liferay SaaS
  - Liferay PaaS
uuid: 83d07d42-e42d-4e19-acf4-9856f00441e0
---

# Customizing Liferay's Look and Feel

One of the easiest ways to get started developing on Liferay's platform is to modify its look and feel. You can change everything from its favicon to its entire design to match your branding. As you determine your requirements for your look and feel, the best approach for customizing Liferay is to determine the minimum effort needed to achieve the desired result. The most compatible way to do this is to use [client extensions](./client-extensions.md). This gives you the most freedom, because you can use any of Liferay's deployment approaches: SaaS, PaaS, or self-hosted. You should be able to achieve what you want with client extensions for all but the most extreme cases. 

Customizations presented here go from simplest to the most complex. 

## Theme Favicon Client Extensions

Override the favicon for your pages in Liferay. When deployed, the provided icon file becomes available for any page in Liferay. You can access it in a separate *Client Extensions* tab when you configure the favicon for a page from the Page Design Options menu.

![When you configure the favicon for a page, access the favicon from your client extension from a special Client Extensions tab.](./customizing-liferays-look-and-feel/images/02.png)

## CSS Client Extensions

CSS client extensions introduce new CSS styling to pages. A deployed CSS client extension on a page adds to the page's existing styling, including theme and style book settings.

Specify a CSS client extension in your `client-extension.yaml` file :

```yaml
type: globalCSS
```

See [Using a CSS Client Extension](./customizing-liferays-look-and-feel/using-a-css-client-extension.md) to get started.

## Theme CSS Client Extensions

While [CSS client extensions](#css-client-extensions) add styling to pages, theme CSS client extensions override styling on the page, including from the site's [theme](./customizing-liferays-look-and-feel/themes.md). The client extension uses a `clay.css` file and a `main.css` file to replace the identically named files normally used in your site's theme.

You can add this type of client extension as an option from *Client Extensions* in the Liferay Applications menu.

![Add a theme CSS client extension to replace CSS provided by your site's theme.](./customizing-liferays-look-and-feel/images/01.png)

!!! note
    The `clay.css` and `main.css` files must be hosted remotely to use this type of client extension.

    As this client extension fully replaces the default CSS contained in the theme, make sure to provide [Clay styling](https://clayui.com/docs/css/index.html) for any out-of-the-box widgets that are used by Liferay. Alternatively, to fix the styling of a particular Liferay widget, wrap the widget in a container that includes the `cadmin` CSS class under the container element's Advanced tab.

Specify a Theme CSS client extension in your `client-extension.yaml` file:

```yaml
type: themeCSS
```

## JavaScript Client Extensions

The JavaScript client extension adds a JavaScript file you specify to whatever page you want. Your script has access to the DOM and can perform customized actions. 

## Theme Sprite Map Client Extensions

Theme sprite map client extensions override the sprite map for site pages. Define the sprite map as an `.svg` image, and it replaces the one used by your site's current theme.

Specify a theme sprite map client extension in your `client-extension.yaml` file:

```yaml
type: themeSpritemap
```

## Editor Config Contributor Client Extensions

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

Editor Config Contributor client extensions override existing CKEditor configurations in a `ConfigContributor.java` file.

!!! important
    The client extension's configuration options must match the `ConfigContributor` it's overriding (i.e., portlet names, editor names, and editor config keys).

Specify an Editor Config Contributor client extension in your `client-extension.yaml` file:

```yaml
type: editorConfigContributor
```

## Custom Filter Client Extensions

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`

[Custom filter client extensions](./customizing-liferays-look-and-feel/using-a-custom-filter-client-extension.md) define JavaScript functions for creating and integrating customizable filter interfaces. These extensions can enhance the user experience by providing tailored filtering capabilities based on OData queries.

## Themes (PaaS or self-hosted only)

Finally, themes are a traditionally deployed asset to Liferay, which is why they are only available via PaaS or self-hosted platforms. You can define your own complete look and feel with themes. 

Read on to learn how to customize Liferay to match your design! 


