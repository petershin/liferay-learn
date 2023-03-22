---
uuid: cf248511-7a5d-4e66-8352-2b7e1566dcf9
---

# Collection Provider

Collection providers can be used to sort items into collections and display collections that are selected either manually or dynamically. Collection providers can also display custom providers, that can be created using the Information Framework, or providers created and made available out-of-the-box by Liferay.

```{note}
Items can refer to entities beyond the scope of content, such as products and categories, and located outside of the current site or Liferay instance.
```

## Default Collection Providers

The following collection providers are available out-of-the-box and function the same way as the widgets with the same name:

* Most Viewed Assets: displays the most viewed assets on the current site from most to least.
* Highest Rated Assets: displays rated assets from highest to lowest.
* Recent Content: displays recently modified assets from the most recent to least recent.

![Configuration of a collection display fragment with Most Viewed Assets, Highest Rated Assets, and Recent Content collection providers displayed.](./collection-providers/01.png)

## Related Items Collection Providers

Related items collection providers display lists of items related to the main items being displayed. You can access these collection providers in two ways:

* By adding a collection display fragment to a display page.
* By nesting collections within a collection display fragment on a content page.

![Configuration of a collection display fragment with Related Items Collection Providers displayed.](./collection-providers/02.png)

### Related Assets

Items that are related to the main item on the display page will also be displayed.

### Categories for This Item

This related item collection provider will display the categories of the item or asset that that is displayed.

### Items with Categories in the Same Vocabularies

The "Related Item Collection Provider" displays items that are part of the same vocabulary as the main asset being viewed. For example, if the main asset has the category *football*, and *football* is part of the *sports* vocabulary, all other categories under the *sports* vocabulary will be displayed.

### Items with the Same Categories

The "Items with the Same Categories" display provider shows items that have the same category as the main item being viewed on the display page. For example, if the main item has a category of *football*, items with the same category are displayed. Additionally, there are two configurations that can further refine the results: "Any Category of the Same Vocabulary" and "A Specific Category."

![Configuration of the "Items with the Same Categories" provider with the expanded Advanced Rule dropdown displayed.](./collection-providers/03.png)

### Advanced Rules for Items with the Same Categories

Advanced rules can be used to further refine what items are displayed and also filter items based on a item types.
![Configuration of the "Items with the Same Categories" with the expanded "Item Type" dropdown displaying item types.](./collection-providers/04.png)

#### Any Category of the Same Vocabulary

Using "Any Category of the Same Vocabulary," the provider displays all items with categories in the same vocabulary, *sports*, as the main asset. For example, if the main asset has the category *football* all other items in the *sports* vocabulary will be displayed.

#### A Specific Category

Using *A Specific Category* a category can be selected to further refine the results. For example, you can add an additional category, *breaking news*, to display assets with the category *football* and *breaking news*, showing assets related to breaking news for football.

```{tip}
By default, categories are configured where selecting a parent category automatically selects its child categories. This setting can be configured in the Control Panel under *Instance Settings* .
```
