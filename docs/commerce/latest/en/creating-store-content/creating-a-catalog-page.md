---
uuid: dca021a7-5bb4-43b4-93f6-158869d9c29a
taxonomy-category-names:
- Commerce
- Storefronts
- Catalogs
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Creating a Catalog Page

The [catalog](./commerce-storefront-pages/catalog.md) page is a customer's entrypoint to your company's product portfolio. On this page, they can browse, search, and select products. The following widgets are recommended for a catalog page:

* Search Bar
* Options Facets
* Specification Facet
* Price Range Facet
* Category Facet
* Sort
* Search Results

To learn more about these widgets, see [Widget Reference](./liferay-commerce-widgets/widget-reference.md).

![The catalog page is a customer's entrypoint to your company's product portfolio](./creating-a-catalog-page/images/99.png)

## Prerequisites

Before creating a catalog page, you must understand how to [use fragments](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments), [content pages](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/using-content-pages), and the [navigation menus application](https://learn.liferay.com/w/dxp/site-building/site-navigation/using-the-navigation-menus-application).

Ensure you also have a product catalog containing products. See [Creating a new Catalog](../product-management/catalogs/creating-a-new-catalog.md) for more information.

## Add and Configure the Page

1. Go to your site, open the _Site Menu_ (![Site Menu](../images/icon-product-menu.png)) and navigate to _Site Builder_ &rarr; _Pages_.

1. Click _New_ and select _Page_.

1. Select a master page template or the Blank template and enter _Catalog_ as the name of the page.

1. Click _Add_.

This opens the page in edit mode.

## Add Widgets and Fragments

1. Drag and drop a container followed by a grid inside it.

1. Change the Number of Modules in the grid to 2 and adjust the size so that the first module is one-third the size of the second module.

1. Inside the first module, drag and drop the following widgets:

   * Search Options
   * Search Bar
   * Option Facet
   * Specification Facet
   * Category Facet
   * Price Range Facet

1. Inside the second module, drag and drop the following widgets:

   * Sort (under Commerce)
   * Search Results (under Commerce)

## Configure the _Search Options_ Widget

Using the _Search Options_ widget, you can configure the _Search Results_ widget to display all products without requiring a search query. Your customers can then easily browse through all the products available in your channel.

1. In the Search Options widget, click _Actions_ (![Actions icon](../images/icon-actions.png)) &rarr; _Configuration_.

1. Check the _Allow Empty Searches_ checkbox.

1. Click _Save_.

1. Close the _Configuration_ window.

After enabling this option, all products are visible in the _Search Results_ widget.

By default, products are visible across all channels. However, visibility can be limited to specific channels. See [Configuring Product Visibility Using Channels](../store-management/channels/configuring-product-visibility-using-channels.md) to learn more.

## Configure the _Search Bar_ Widget

The _Search Bar_ widget must be configured to display data from the global site scope. This is because products are stored at the global level and not the site level.

1. In the Search Bar widget, click _Actions_ (![Actions Button](../images/icon-actions.png)) &rarr; _Configuration_.

1. Set the Scope to _Everything_.

    ![Set the Scope to Everything.](./creating-a-catalog-page/images/04.png)

1. Click _Save_.

1. Close the _Configuration_ window.

## Configure the _Specification Facet_ Widget

You can rearrange the order of specification labels in the specification facet using its priority. 

1. In the Specification Facet widget, click _Actions_ (![Actions Button](../images/icon-actions.png)) &rarr; _Configuration_.

1. In the Order Specifications By field, choose one of the following:

   * Specification Group Priority Ascending
   * Specification Group Priority Descending

   {bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`

   * Specification Label Priority Ascending
   * Specification Label Priority Descending

1. Click _Save_.

1. Close the _Configuration_ window.

See [Specifications](../product-management/creating-and-managing-products/products/specifications.md) for more information on creating specification groups and labels.