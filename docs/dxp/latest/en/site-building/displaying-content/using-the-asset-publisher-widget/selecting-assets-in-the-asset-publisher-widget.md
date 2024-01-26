---
taxonomy-category-names:
- Sites
- Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 8aba958f-0074-4664-bacd-fb45d164632e
---
# Selecting Assets in the Asset Publisher Widget

You can configure the Asset Publisher widget to select assets dynamically based on specific criteria, or manually, specifying exactly what assets to display. You can also display assets from [collections](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md).

!!! note
    On Liferay 7.2 and below, collections are referred to as [content sets](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md#liferay-dxp-7-2).


1. Create a [new page](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) or [edit an existing one](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)

1. While editing the page, look at the Fragments and Widgets tab on the left of the page editor and search for the *Asset Publisher* widget.

1. Drag and drop the *Asset Publisher* widget into the editing area.

1. Click *Actions* (![Actions icon.](../../../images/icon-actions.png)) at the top-right corner of the Asset Publisher widget.

   ![Click Actions to access the Asset Publisher configuration options.](./selecting-assets-in-the-asset-publisher-widget/images/01.png)

1. Select *Configuration* to display the Configuration dialog.

   Under [Asset Selection](#asset-selection-options), select the assets you want to show in your widget.

   Under [Display Settings](./configuring-asset-publisher-display-settings.md), configure how to display your content.

   Under [Subscriptions](./configuring-asset-publisher-subscriptions.md), configure email subscriptions and RSS feed subscriptions.

   ![The configuration window has different Asset Selection options under the Setup tab.](selecting-assets-in-the-asset-publisher-widget/images/02.png)

1. Once you select your assets and configure the widget, click *Save*.

## Asset Selection Options

Assets are selected for display in the Asset Publisher widget using one of these selection methods:

-  [Collection](#collection)
-  [Dynamic](#dynamic)
-  [Manual](#manual)

### Collection

Select this option to choose from your previously saved collections or collection providers. To learn more about collections, see [About Collections and Collection Pages](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md).

1. Under Select Collection, click *Select*.

1. Select either the *Collections* or *Collections Providers* tab

1. Choose one of your existing collections or collection providers.

1. Click *Save*.

![Click Select and choose from your saved collections.](selecting-assets-in-the-asset-publisher-widget/images/03.png)

!!! note
Developers can use collection providers to create specific collections with more advanced criteria. To learn more, read the information about [Creating an Information List Provider](https://help.liferay.com/hc/en-us/articles/360029067271-Creating-an-Information-List-Provider) in the [Info Framework](https://help.liferay.com/hc/en-us/articles/360029067251-Introduction-to-The-Info-Framework) developer documentation.

### Dynamic

Using the Dynamic asset selection, you can include assets in the Asset Publisher widget automatically, based on different criteria.

![Define the options for the dynamic asset collection, including Source, Scope, Filter, Custom User Attribute, and Ordering.](selecting-assets-in-the-asset-publisher-widget/images/04.png)

1. In the Scope section, choose to display assets from an individual site or other sites.

1. In the Source section, use the Asset Type drop-down menu to select your assets. Select a specific asset type or *Select More Than One* to choose from different types.

   With some options (e.g. Web Content Article and Document) you may need to select a subtype (e.g. Web Content Article Structures and Document Type). You can also choose any subtype or select more than one subtype.

1. In the Filter section, define the rules for the assets in your Asset Publisher widget. You can define rules based on [categories](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md), [tags](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md), or keywords.

   You can filter items that Contain or Do Not Contain All or Any of the following Categories, Keywords, or Tags and specify the categories, keywords, or tags.

1. Include a Custom User Attribute if you have defined one.

   The assets are only displayed if they match the included custom user profile attributes.

1. In the Ordering section, choose the presentation order of assets in the Asset Publisher widget.

   Select a primary and a secondary field to order the assets by. You can also choose to order the assets in ascending or descending order.

   !!! warning
       When selecting web content articles as the asset type and ordering by a localized web content structure field, all assets' field values should be localized when other languages are applied to the site. Only translated assets are ordered when another language is applied.

1. (Optional) Click *Create a collection from this configuration*, enter a title, and click *Save* to save the configuration as a new [collection](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md).

### Manual

Here you can set parameters and manually filter specific assets:

1. In the Scope section, choose to display assets from an individual site or other sites.

1. In the Asset Entries section, use the Select button to filter for specific types of assets.

1. For the type of asset you select, check the assets you want to include.

1. Click *Add*.

   ![Here is an example of filtering for basic web content and manually selecting items](selecting-assets-in-the-asset-publisher-widget/images/05.png)

1. (Optional) Click *Create a collection from this configuration*, enter a title, and click *Save* to save the configuration as a new [collection](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md).

## Related Topics

- [Displaying Assets Using the Asset Publisher Widget](./displaying-assets-using-the-asset-publisher-widget.md)
- [Configuring the Asset Publisher Display Settings](./configuring-asset-publisher-display-settings.md)
- [About Collections and Collection Pages](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
