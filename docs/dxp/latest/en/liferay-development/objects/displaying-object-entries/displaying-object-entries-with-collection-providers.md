---
uuid: 3bf64181-9407-4b88-8950-c426e1a05fa4
taxonomy-category-names:
- Collections
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Displaying Object Entries with Collections

{bdg-secondary}`Liferay 7.4 U77+/GA77+`

When you publish an object definition, Liferay creates a [collection provider](../../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md) for it. For site-scoped objects, you can also [create manual or dynamic collections](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md) for the object. You can use these collections with the [Collection Display fragment](../../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) and [collection pages](../../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#displaying-collections-on-a-collection-page) to display object entries. Objects support all collection display features, including filtering, styling, and display options.

!!! important
    - Instance-scoped objects cannot be used in manual or dynamic collections. With Liferay DXP you can use Search Blueprints and its collection provider to achieve most use cases. See [Collections with Search Blueprints](../../../using-search/liferay-enterprise-search/search-experiences/search-blueprints/collections-with-search-blueprints.md) for more information.
    - Draft entries cannot be displayed in collections. Object entries must first be published.

## Using an Object Collection

1. Create a new [content page](../../../site-building/creating-pages/using-content-pages.md) or [display page template](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md). Alternatively, begin editing ( ![Edit Button](../../../images/icon-edit-pencil.png) ) an existing one.

   !!! note
       You can also create a collection page using the collection provider. See [Collections and Collection Pages](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) for more information.

1. Drag and drop the *Collection Display* fragment into the page or template from the Fragments and Widgets (![Fragments and Widgets](../../../images/icon-plus.png)) sidebar.

1. Select the *Collection Display Fragment* to access its configuration options and click *Select Collection* in the General tab.

   ![Select the fragment and click Select Collection.](./displaying-object-entries-with-collection-providers/images/01.png)

1. In the modal window, select a collection or click the *Collection Providers* tab and select the object's provider.

   ![In the Collection Providers tab, select the object's provider.](./displaying-object-entries-with-collection-providers/images/02.png)

1. (Optional) Filter the displayed object entries. You can filter by any picklist or Boolean fields in the object:

   Click *Collection Options* (![Collection Options Button](../../../images/icon-actions.png)) and select *Filter Collection*.

   ![Click the Collection Options button and select Filter Collection.](./displaying-object-entries-with-collection-providers/images/03.png)

   Then select the desired *filters* and click *Apply*.

   ![Select the Filters to apply.](./displaying-object-entries-with-collection-providers/images/04.png)

After selecting the desired collection, use additional fragment options to determine how Object entries appear, including *List Style* and *Pagination*.

When you select an object for a Collection Display fragment, the object is set as its mapping source. When you add fragments to the collection display, you can map their [sub-elements](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) to object fields to create flexible page displays for individual object entries. This is true for collection pages as well.

For example, you can embed a heading in a collection display fragment and configure it to display the name of each item in the collection. If working with an object on the child side of a one-to-many relationship, you can also map fragments to fields of the related parent object.

![Map fragment sub-elements in Collection Display fragments to object fields.](./displaying-object-entries-with-collection-providers/images/05.png)

You can display related object entries from a relationship table with the relationship collection provider that's generated for each relationship table.

## Relationship Collection Providers

You can display [related object entries from relationship tables](../creating-and-managing-objects/relationships/defining-object-relationships.md) with collection providers using nested [collection display fragments](../../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page). The top-level collection display uses the parent object's collection provider, while the nested collection display uses a special relationship collection provider for relating each parent to its child objects.

The relationship collection provider is called a [Related Items Collection Provider](../../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md#related-items-collection-providers) and is available for the parent object of one-to-many relationships and both objects in many-to-many relationships. This collection provider only appears in nested collection display fragments for objects with relationship tables.

![You can display related objects in collections.](./displaying-object-entries-with-collection-providers/images/09.gif)

For example, with a one-to-many relationship of Country to Cities, you can show countries with their child cities by mapping a fragment to the city name field in a nested collection display.

This is the general procedure for configuring nested collection display fragments:

* Configure the top level collection display to use the parent object's collection provider.
* Configure the nested collection display to use the related item collection provider generated for the relationship table data.
* In both collection display fragments, choose the grid display style and add fragments mapped to their respective object fields.

To map fragments to a related object's fields in the collection display,

1. Use the object's collection provider with a collection display fragment.

1. Embed another collection display fragment within the initial collection display, as its collection item.

   !!! tip
       Using the *Browser* tab in the page edit menu can help you position the fragment more precisely within the page hierarchy.

   ![Use the Browser tab to help properly embed the Collection Display fragment.](./displaying-object-entries-with-collection-providers/images/06.png)

1. Click *Select Collection* in the new collection display fragment's configuration options.

1. Click the *Related Items Collection Providers* tab.

1. Select the collection provider with the name of the object's relationship. The associated object type appears under the relationship's name. In this example, the relationship is called `cities in country`:

   ![Select the relationship that you created with between the displayed object and another object type.](./displaying-object-entries-with-collection-providers/images/07.png)

Now you can embed fragments in the new collection display and map them to fields in the related object.

![Map fragment sub-elements to fields in parent objects.](./displaying-object-entries-with-collection-providers/images/08.png)

## Related Topics

- [Creating Objects](../creating-and-managing-objects/creating-objects.md)
- [Displaying Object Entries](../displaying-object-entries.md)
- [About Collections and Collection Pages](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
- [Collection Providers](../../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md)
- [Defining Object Relationships](../creating-and-managing-objects/relationships/defining-object-relationships.md)
