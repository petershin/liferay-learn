---
taxonomy-category-names:
- Sites
- Content Pages
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: d09834c8-8e44-4e27-8ee6-99e5edf91350
---

# Using Widgets on a Content Page

<!--TASK: Reconsider-->

The widgets section functions just like the [add menu on a widget page](../using-widget-pages/adding-widgets-to-a-page.md). You can access the full list of available widgets and add them to the page. The main difference is that only the main configuration options for widgets are available on content pages.

!!! note
    While widgets are rendered according to [render-weight](https://resources.learn.liferay.com/reference/latest/en/dxp/definitions/liferay-portlet-app_7_4_0.dtd.html#render-weight) on widget pages, this is not true for content pages. Instead, they are rendered in the order they appear on the page (i.e. left to right, top to bottom).

## Adding Widgets on Content Pages

1. While [adding elements to the content page](./adding-elements-to-content-pages.md), open the [Widgets panel](./content-page-editor-ui-reference.md) to browse or search for available widgets by name.

1. Drag the desired widget to the column and row of the layout where you want to place it.

Widgets can include display options like a wiki display or dynamic publishing tools such as the Asset Publisher. You can showcase various types of content, from long-form text to image galleries.

## Configuring Widgets on Content Pages

1. Hover over the widget.

1. Click *Actions* (![Actions menu icon](../../../images/icon-actions.png)) and select *Configuration*. From here you have several options, depending on the widget.

   ![You can configure widgets on content pages through their options menu.](./using-widgets-on-a-content-page/images/01.png)

1. Click *Save* to apply the changes.

## Configuring Widget Permissions on Content Pages

Since Liferay Portal 7.3 GA2, you can configure permissions for widgets from a content page:

1. Hover over the widget.

1. Click *Actions* (![Actions menu icon](../../../images/icon-actions.png)) and select *Permissions*.

1. Check/uncheck the permissions for the roles in the new window that appears.

1. Click *Save* to apply the changes.

!!! note
    When you create a page based on a [page template](../adding-pages/creating-a-page-template.md), permissions are copied too. Permissions for a master page are set in the [master page](../defining-headers-and-footers/managing-master-page-templates.md), not in individual pages.

## Export/Import Widgets on Content Pages

1. Hover over the widget.

1. Click *Actions* (![Actions menu icon](../../../images/icon-actions.png)) and select *Export/Import*.

1. Select the *Export/Import* tab to configure the respective process.

## Configuring Widget Configuration Templates on Content Pages

1. Hover over the widget.

1. Click *Actions* (![Actions menu icon](../../../images/icon-actions.png)) and select *Configuration Templates*.

1. Click *Save Current Configuration as Template* to save the widget’s current settings.

1. Enter a name for your template and click *Save*.

## Content Page Limitations for Widgets

Although you can access basic configuration options and permissions for widgets on content pages, some features are only available on widget pages:

- *Nested applications*: Widgets within widgets are only supported on widget pages.

- *Look and Feel Configuration*: On widget pages you can access the Look and Feel configuration menu through the widget's actions (![Actions icon](../../../images/icon-actions.png)), offering fine-grained control over its CSS. This option is not available for widgets on content pages, since the look and feel is defined in the theme or through fragments.

## Related Topics

- [Using Content Pages](../using-content-pages.md)
- [Adding Elements to Content Pages](./adding-elements-to-content-pages.md)
- [Content Page Editor UI Reference](./content-page-editor-ui-reference.md)
