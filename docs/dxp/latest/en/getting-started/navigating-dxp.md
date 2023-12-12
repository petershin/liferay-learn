---
uuid: 5e95a054-5432-4645-aafe-b57d6d9c0220
---
# Navigating DXP

Liferay DXP's out-of-the-box navigation is organized into three major areas: [*Site Menu*](#site-menu), [*Personal Menu*](#personal-menu), and [*Global Menu*](#global-menu).

## Site Menu

The DXP *Site Menu* on the left side of the screen contains actions, content, and configurations that are scoped to the specific site currently being viewed. You can click on the Site Menu (![Site Menu](../images/icon-menu.png)) in the Application Bar to expand or hide it.

![Expand the Site Menu so that all options are visible.](./navigating-dxp/images/01.png)

The Site Menu indicates the selected site. In the above example, the site is `Liferay DXP`. You can change what site you are working with by clicking the *Compass* (![Compass Icon](../images/icon-compass.png)) in the Site Menu.

These are some common site building and management activities that can be done in the Site Menu:

* [Adding Pages](../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md)
* [Creating Content](../content-authoring-and-management.md)
* [Managing Site Memberships](../site-building/sites/site-membership/adding-members-to-sites.md)
* [Configuring and Optimizing Site Behavior and Functionality](../site-building.html)

## Applications Bar

The *Application Bar* appears at the top of each page and [Site Menu](#site-menu) application. The Application Bar shows an Actions menu (![Actions](../images/icon-actions.png)) with different options depending on the application that is currently open.

![The actions available in the Application Bar depend on the application open at the moment.](./navigating-dxp/images/02.png)

When you open a page in view mode, the available tools in the Applications Bar change depending on the page type.

![Content pages and widget pages show a different set of tools in the Application Bar.](./navigating-dxp/images/03.png)

For [content pages](../site-building/creating-pages/using-content-pages.md) (A), the available tools are:

| Tools                                                              | Description                                                                                                                                                                                                        |
|:-------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Edit (![Edit](../images/icon-edit.png))                            | Access the page's editor.                                                                                                                                                                                              |
| Configure Page (![Configure Page](../images/icon-settings.png))    | Access the page's configuration.                                                                                                                                                                                       |
| Simulation (![Simulation](../images/icon-simulation.png))          | Access preview for different screen sizes and contents that users can have on a page.                                                                                                                              |
| Content Performance (![Performance](../images/icon-analytics.png)) | Opens the [Content Performance tool](./../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md), which helps analyze your content performance quantitatively. |
| A/B Test (![A/B Test](../images/icon-ab-testing.png))              | Opens the [A/B Testing tool](./../site-building/optimizing-sites/ab-testing/ab-testing.md), which evaluates the effectiveness of content pages by testing a variant design against the current design.             |
| Page Audit (![Page Audit](../images/icon-information.png))         | Opens the [Page Audit tool](./../content-authoring-and-management/page-performance-and-accessibility/about-the-page-audit-tool.md), which helps users identify performance-related issues.                         |

For [widget pages](../site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.md) (B), the available options are:

| Tools                                                              | Description                                                                                                                                                                                                        |
|:-------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Configure Page (![Configure Page](../images/icon-settings.png))    | Access the page's configuration.                                                                                                                                                                                       |
| Toggle Controls (![Toggle Controls](../images/icon-preview.png))   | Enable/Disable widget's controls pop up when you hover your cursor over them.                                                                                                                                      |
| Add (![Add](../images/icon-plus.png))                              | Access the page's editor.                                                                                                                                                                                              |
| Simulation (![Simulation](../images/icon-simulation.png))          | Access preview for different screen sizes and contents that users can have on a page.                                                                                                                              |
| Content Performance (![Performance](../images/icon-analytics.png)) | Opens the [Content Performance tool](./../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md), which helps analyze your content performance quantitatively. |
| Page Audit (![Page Audit](../images/icon-information.png))         | Opens the [Page Audit tool](./../content-authoring-and-management/page-performance-and-accessibility/about-the-page-audit-tool.md), which helps users identify performance-related issues.                         |

```{note}
The Application Bar options for content and widget pages depend on your Liferay DXP version. [Content Performance](../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) is available for content pages starting with Liferay DXP 7.3 and for widget pages starting with Liferay DXP 7.4. Page Audit is available starting with Liferay DXP 7.4, and the Toggle Controls option is available starting with Liferay DXP 7.3.
```

## Personal Menu

The *Personal Menu* is the hub for information and activities for a user that is logged in.

![The Liferay DXP Personal Menu is available by clicking the avatar icon in the top right.](./navigating-dxp/images/04.png)

These are several common actions that users can perform from the personal menu:

* [Change account information](./introduction-to-the-admin-account.md#changing-account-information)
* [See what sites they are members of](../site-building/sites/site-membership/adding-members-to-sites.md)
* [Review site notifications](../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)
* [Sign out](./introduction-to-the-admin-account.md#signing-out)

## Global Menu

The DXP *Global Menu* contains the [Applications](#applications-menu), [Commerce](#commerce-menu), and [Control Panel](#control-panel) menus. Click the *Global Menu* (![Global Menu icon](../images/icon-applications-menu.png)) at the top right corner of the screen to access it.

```{note}
By default, users with the *Guest* or *User* roles are not able to access the Global Menu.
```

You can also navigate to other sites available to you from either the Applications, Commerce, or Control Panel tabs in the Global Menu, on the right side of the interface.

### Applications Menu

The *Applications Menu* contains a variety of links to manage many different applications within your Liferay DXP server.

![The Applications Menu contains many global settings and important functions applicable to all sites.](./navigating-dxp/images/05.png)

Here are some of the applications that can be managed from the Applications Menu:

* [Content Dashboard](../content-authoring-and-management/content-dashboard.md)
* [Workflow](../process-automation/workflow/introduction-to-workflow.md)
* [Remote Apps](../building-applications/client-extensions/front-end-client-extensions.md#custom-element-client-extensions)

### Commerce Menu

Beginning in Liferay 7.3 CE GA6 and Liferay DXP 7.3 GA1, Liferay Commerce 3.0 is now bundled with Liferay Portal 7.3 CE GA6 and Liferay DXP 7.3 GA1.

![The Commerce Menu contains all store functions.](./navigating-dxp/images/06.png)

Here are some functions that can be managed from Liferay Commerce:

* [Creating a New Catalog](https://learn.liferay.com/commerce/latest/en/product-management/catalogs/creating-a-new-catalog.html)
* [Creating a New Channel](https://learn.liferay.com/commerce/latest/en/starting-a-store/channels/managing-channels.html)
* [Manage Inventory](https://learn.liferay.com/commerce/latest/en/inventory-management.html)
* [Process Orders](https://learn.liferay.com/commerce/latest/en/order-management/orders/processing-an-order.html)

To learn more about Liferay Commerce, see [Introduction to Liferay Commerce](https://learn.liferay.com/commerce/latest/en/starting-a-store/introduction-to-liferay-commerce.html).

### Control Panel

The *Control Panel* contains general administrative actions and configurations that can be scoped globally to the Liferay DXP installation or to a particular instance.

![The Control Panel is now part of the global menu.](./navigating-dxp/images/07.png)

Here are some common administrative activities that can be done in the Control Panel:

* [Manage users, permissions, and roles](../users-and-permissions/users/adding-and-managing-users.md)
* [Change how users login](../installation-and-upgrades/securing-liferay/authentication-basics.md)
* [Create new Sites](../site-building/sites/adding-a-site.md)
* [Add new Custom Fields to applications on the site](./../system-administration/configuring-liferay/adding-custom-fields.md)

## DXP 7.1 and 7.2

In Liferay DXP versions prior to 7.3, the contents of the global menu are found within the Control Panel, which is located above the Site Menu on the left side of the screen.

![The Control Panel in DXP 7.1 and 7.2 is located above the Site Menu.](./navigating-dxp/images/08.png)

## What's Next

Continue our Getting Started walkthrough and learn about [Creating Your First Site](./creating-your-first-site.md).

## Related Information

* [Creating Your First Site](./creating-your-first-site.md)
* [Changing Your Site's Appearance](./changing-your-sites-appearance.md)
