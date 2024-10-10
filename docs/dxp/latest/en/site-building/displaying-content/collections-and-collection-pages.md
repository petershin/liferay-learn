---
toc:
   - ./collections-and-collection-pages/collections-and-collection-pages-for-liferay-72-and-earlier-versions.md
   - ./collections-and-collection-pages/creating-collections.md
   - ./collections-and-collection-pages/collection-providers.md
   - ./collections-and-collection-pages/displaying-collections.md
taxonomy-category-names:
- Sites
- Collections
- Collection Pages
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 190bc17e-ee9d-48bc-8770-0ea2d100318c
---

# Collections and Collection Pages

!!! note
    This information applies to Liferay DXP 7.3+. In previous Liferay versions, collections were called content sets. For information on content sets, see [Liferay DXP 7.2](./collections-and-collection-pages/collections-and-collection-pages-for-liferay-72-and-earlier-versions.md).

Collections are sets of content items that you can use to group and filter information. Collections can include many different types of content or just one specific type of content. You can then display them on a [collection page](./collections-and-collection-pages/displaying-collections.md#displaying-collections-on-a-collection-page), which you can present in your desired format using page fragments.

![Use a collection page to quickly present a specific collection in your desired format.](./collections-and-collection-pages/images/01.png)

Consider the following example. You have a kitchenware store and you plan to create a new section in your product web page with customer success stories. You want this section to show new success stories automatically as these stories are published. In this case, you can create a collection that groups all your success stories with a collection page that shows the collection's content. In addition to collection pages, you can show this collection in other content pages using a [Collection Display fragment](./collections-and-collection-pages/displaying-collections.md#displaying-collections-on-a-collection-page).

There are two types of collections in Liferay:

- **Manual Collection**

   You select and maintain the items that are part of the collection manually. The items in a manual collection do not change automatically.

   For example, you create a manual collection named *Promotions*, which includes several promotional web content articles on your public website. After you select the items in the collection, you must add new promotional content manually to keep the collection up-to-date.

- **Dynamic Collection**

   You define the type of items in the collection, along with criteria for these items. The collection's items can change based on the criteria you define. A dynamic collection is useful when you want to make sure the content is up-to-date with new items matching the criteria.

   For example, for the kitchenware store, you create a collection including all blog posts with the *porcelain* tag (this tag represents your criteria). The dynamic collection includes all the new blog posts with the *porcelain* tag automatically.

![Use manual collections to choose the items in the collection yourself, or dynamic collections to automatically assemble the items based on your chosen criteria.](./collections-and-collection-pages/images/02.png)

For information about how to create manual or dynamic collections, see [Creating Collections](./collections-and-collection-pages/creating-collections.md).

## Displaying Collections

You can display collections using a [collection page](./collections-and-collection-pages/displaying-collections.md#displaying-collections-on-a-collection-page) or a [Collection Display fragment](./collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page).

A collection page is a type of page linked to a collection. Collection pages ease the task of showing and customizing collections. For example, you can quickly add new items to your collection using a collection page.

![You can display your collection using a collection page](./collections-and-collection-pages/images/03.png)

A Collection Display fragment is a type of fragment that shows a collection. You can use this fragment to show your collection on any content page, page template, or display page.

![You can show the collection's content using a Collection Display fragment](./collections-and-collection-pages/images/04.png)

For more information, see [Displaying Collections](./collections-and-collection-pages/displaying-collections.md).

## Customizing Collections

You can associate a Liferay segment with your collection to display different collection items based on the [segment configuration](../personalizing-site-experience/segmentation/creating-and-managing-user-segments.md).

Consider the following example. You want to increase sales in your kitchenware store by offering exclusive promotions to registered users. You create a collection including promotions for registered users and news about your products. You want everyone to see the news about your products, but you want to restrict the promotions to registered users. You can create a new segment for registered users and link the segment to a new *Personalized Variation* that filters the promotional content.

For information, read [Personalizing Collections](../personalizing-site-experience/experience-personalization/personalizing-collections.md).

## Converting Asset Publisher Configurations to Collections

You can create collections directly or from an [Asset Publisher widget](./using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md). The Asset Publisher option is useful when you want to use your customization as a collection in other pages. For more information, read [Creating Collections](./collections-and-collection-pages/creating-collections.mdd#creating-a-collection-from-an-asset-publisher).

## Related Information

- [Creating Collections](./collections-and-collection-pages/creating-collections.md)
- [Displaying Collections](./collections-and-collection-pages/displaying-collections.md)
- [Personalizing Collections](../personalizing-site-experience/experience-personalization/personalizing-collections.md)
