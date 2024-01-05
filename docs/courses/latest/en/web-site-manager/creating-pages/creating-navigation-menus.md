---
uuid: 9d40c268-3ab6-4358-bcac-a43d706d8a3b
---
# Creating Navigation Menus

Clarity's navigation menu is getting cluttered, as it shows all the pages by default. The Menu Display fragment's default configuration shows the site's page hierarchy. Remember that you excluded Careers, Sign In, and Search from the default menu display, so those pages don't appear.

![The default navigation menu displays the site's pages.](./creating-navigation-menus/images/01.png)

To simplify the header navigation menu, Clarity wants just three items to appear in the navigation menu: Shop (page), Blog (page), and More (sub-menu with additional page links).

In addition, navigation menus can add dynamic items to the footer. Clarity's footer has these menus to define: Shop, Clarity, and Resources.

![The footer menus are defined by the Navigation Menus application.](./creating-navigation-menus/images/06.png)

The Shop menu is blank for now, as it's configured in [Commerce Architect](../../commerce-architect.md).

First create the navigation menu:

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and go to _Site Builder_ &rarr; _Navigation Menus_.

1. Click *Add* (![Add Button](../../images/icon-add.png)).

1. Enter _Clarity Navigation_ as the name, then click _Save_.

1. Click _New_ &rarr; _Page_.

1. In the Select Pages selector, expand the Clarity hierarchy and click _Shop_, then click _Blog_.

   ![Add the Shop and Blog pages to the navigation menu.](./creating-navigation-menus/images/02.png)

1. Click _Select_.

The main pages are in place. Next you need a sub-menu called More, with links to the remaining pages.

1. Click _Add_ &rarr; _Sub-menu_.

1. Enter the name _More_, then click _Add_.

1. Open the More item's *Actions* menu (![Actions](../../images/icon-actions.png)).

1. Click _Add Child_ &rarr; _Page_.

1. Add About Us and Contact Us to the sub-menu.

   ![About Us and Contact Us are in the sub-menu.](./creating-navigation-menus/images/03.png)

   The menu is ready to use.

1. The pages you want to show are in place. To make sure new pages are not added to the menu unless the navigation menu is updated intentionally, click *Configuration* (![Cog](../../images/icon-cog3.png)).

   Disable the configuration for adding new pages to the menu during page creation, then click _Save_.

   ![Don't let users add pages to the menu during page creation.](./creating-navigation-menus/images/05.png)

The menu display fragment showing the current navigation is added to the master page. Configure it to use the new navigation menu:

1. Open the _Site Menu_ (![Product Menu](../../images/icon-product-menu.png)), then click _Design_ &rarr; _Page Templates_.

1. Click the text _Clarity MP_ and you're taken to the page editor.

1. Click the area on the page with the current navigation. The Menu Display Options configuration appears in the right sidebar.

   ![Configure the menu display fragment's options.](./creating-navigation-menus/images/04.png)

1. Click the _Source_ field, then choose the _Clarity Navigation_ menu.

1. Click _Select this Level_. 

   For a hierarchical structure, you can choose a different level to display in the widget, if it suits your needs. Click _More_ and see that its sub-menu items are shown.

   In addition to these site menus defined in the Navigation Menus application, you can click Contextual Menus to see some additional dynamic menu options. See [Configuring Menu Displays](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/configuring-menu-displays) for more information.

   Before this exercise, Clarity had three pages hidden from the menu display fragment's page hierarchy menu: Careers, Sign In, and Search. That menu is no longer in use, but those pages were not explicitly added to the new header navigation menu, so they continue to remain outside of the navigation.

In addition to the header navigation, Clarity needs the menus for the footer: *Shop*, *Clarity*, and *Resources*.

1. Following the same basic procedure used to create the header menu, create the *Clarity* menu, adding the *About Us* and *Careers* pages.

1. Add an external URL to the Clarity menu: 

   **Name:** *Retail Customer Portal*
   **URL:** *http://clarityb2b.com:8080*

   ![Navigation menus can link to external URLs.](./creating-navigation-menus/images/10.png)

   Once finished the Clarity menu contains pages and a URL:

   ![The Clarity menu links to pages and an external URL.](./creating-navigation-menus/images/08.png)

1. Create the *Resources* menu, adding the *Blog* and *Search* pages.

   ![The Resources menu links to the Blog and Search pages.](./creating-navigation-menus/images/09.png)

The Shop menu displays links to product categories. Leave it blank now, as it's created in [Commerce Architect](../../commerce-architect.md).

Now that the menus are created, add them to the footer.

1. Open the Clarity MP master page by opening the _Site Menu_ (![Product Menu](../../images/icon-product-menu.png)) and clicking _Design_ &rarr; _Page Templates_.

1. In the page editor, find the Menu Display widget in the first three grid columns of the footer, under the SHOP, CLARITY, and RESOURCES headings. 

   ![The first three grid columns have Menu display widgets.](./creating-navigation-menus/images/13.png)

1. Open each Menu Display widget's configuration and choose the appropriate menu to display.

   ![Display each menu in a Menu Display widget in the footer.](./creating-navigation-menus/images/11.png)

Now Clarity's header and footer uses navigation menus to show its lists. The SHOP menu is populated in the [Commerce Architect](../../commerce-architect.md) course.

![Clarity's master page uses navigation menus heavily.](./creating-navigation-menus/images/12.png)

Next: Clarity's design team has requested a [re-design of the Home page](./designing-the-home-page.md), with new fragments and compositions.

## Relevant Concepts

* [Managing Site Navigation](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/managing-site-navigation)
* [Configuring Menu Displays](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/configuring-menu-displays)
* [Using the Navigation Menus Application](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/using-the-navigation-menus-application)
