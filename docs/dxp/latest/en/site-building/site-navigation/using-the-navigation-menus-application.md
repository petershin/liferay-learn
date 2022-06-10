# Using the Navigation Menus Application

The Navigation Menus application is used to create custom menus for Site Pages and content. With it, you can determine which elements are included in a menu, and how they're organized. Once created, you can display your custom menus using [Page Fragments](../creating-pages/page-fragments-and-widgets/using-fragments.md) or [Widgets](../creating-pages/using-widget-pages/adding-widgets-to-a-page.md).

```{note}
For Liferay 7.3 and earlier, Pages are the only entity that can be added to a Navigation Menu. As of Liferay 7.4 U1+, Navigation Menus support adding additional entity types to a Navigation Menu.
```

![Creating Custom Menus for Site Pages and content](./using-the-navigation-menus-application/images/01.png)

```{tip}
On Liferay 7.3+, you can use Custom Fields to add more information to items in Navigation Menus (under *Site Navigation Menu Item* in the *Custom Fields* menu). You can then use this information with Application Display Templates to further customize your navigation menus.
```

## Creating Navigation Menus

Follow these steps to create a Navigation Menu:

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) and go to _Site Builder_ &rarr; _Navigation Menus_.

    ![Access Navigation Menus in the Site Menu.](./using-the-navigation-menus-application/images/02.png)

1. Click the _Add_ button (![Add Button](../../images/icon-add.png)).

1. Enter a _name_ for the Navigation Menu.

    ![Create a Navigation Menu.](./using-the-navigation-menus-application/images/03.png)

1. Click _Save_.

This redirects you to the new custom menu where you can begin adding elements (e.g., Pages, Documents, Categories).

### Adding New Elements to a Navigation Menu

While editing a Navigation Menu, follow these steps to add an element to the Navigation Menu:

1. Click the _Add_ button (![Add Button](../../images/icon-add.png)).

1. Select the type of element you want to add to the menu (e.g., Page, Document, Category). This opens an item selector window.

    You can add multiple elements to the same menu.

   ![Select the type of element you want to add to the menu.](./using-the-navigation-menus-application/images/04.png)

1. Select the elements you want to add and click _Select_. 

    You can select multiple elements.

    ```{important}
    When the added element does not have an [associated display page](../displaying-content/using-display-page-templates/about-display-page-templates-and-display-pages.md), Liferay displays a warning. Items without a display page do not have links and are hidden from menus.
    ```

    ![When the added element does not have an associated display page](./using-the-navigation-menus-application/images/05.png)

1. Optionally, drag and drop menu elements to reorganize them or arrange them in a hierarchy.

    ```{tip}
    In addition to structuring menu elements into a hierarchy, you can also use the _Submenu_ type to add subsections to a menu. If you delete an element with child elements, the child elements are also removed.
    ```

    ![Adding Elements to Navigation Menus](./using-the-navigation-menus-application/images/06.png)

1. Optionally, define custom display names for each of your menu elements. You can define custom names for page elements, or for any content type elements that use Display Pages (including blog entries, web content articles, documents, Vocabularies, and Categories).

    ```{note}
    You can only define custom display names for content type elements using Display Pages on Liferay 7.4 versions U9+ or GA13+.
    ```

    To do this, select a menu element, check *Use Custom Name* in the side panel, enter a name, and click *Save*.  

    ![Customize the display of menu elements.](./using-the-navigation-menus-application/images/07.png)

All changes to the menu are saved.

### Using Dynamic Vocabulary Elements

[Vocabulary Navigation Menu elements](./navigation-menu-element-types.md#vocabularies) are dynamic: when one is displayed on a page, it adds all of the Categories and Subcategories in its current hierarchy instead of a single element. Any changes to the Vocabulary's contents are automatically reflected in the menu.

Dynamic Vocabulary elements allow you to quickly and easily update your Navigation Menus when you have changing hierarchies of items. For example, you can use Categories to represent types of products in a [Catalog](https://learn.liferay.com/commerce/latest/en/product-management/catalogs/creating-a-new-catalog.html), and then let any updates to your Categories automatically update any menus using the Vocabulary. Then, depending on the [Display Page](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) used for those Categories, any changes to the categorization may automatically reflect in the pages and the Navigation Menu.

![Dynamic Vocabulary elements automatically update to reflect their hierarchy of Categories in your Navigation Menus.](./using-the-navigation-menus-application/images/08.png)

### Previewing Navigation Menus

You can a preview a Navigation Menu while you are editing it to see how it looks when displayed on a page. Click the eye icon (![Eye icon](../../images/icon-view.png)) to open a popup window with a preview of the Navigation Menu.

![Preview a Navigation Menu to see how it looks when displayed on a page.](./using-the-navigation-menus-application/images/09.png)

You can also select different options from the drop-down menu to see different styles the menu can be displayed in, such as the *List* or *Tabs* styles.

## Using Menus During Page Creation

When Users are creating Site Pages, they are shown a list of all existing Navigation Menus. You can modify this behavior by hiding specific menus from the list of available menus.

![Select from Existing Navigation Menus](./using-the-navigation-menus-application/images/10.png)

Follow these steps to configure this behavior for a Navigation Menu:

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) and go to _Site Builder_ &rarr; _Navigation Menus_.

1. Select the desired _menu_.

1. Click the _Actions_ button (![Actions](../../images/icon-actions.png)).

1. Uncheck/Check the setting.

    ![You can select from existing Navigation Menus when creating Site Pages](./using-the-navigation-menus-application/images/11.png)

1. Click _Save_.

## Configuring Navigation Menu Type

Follow these steps to configure the Navigation Menu's type:

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) and go to _Site Builder_ &rarr; _Navigation Menus_.

1. Click on the Actions button (![Actions Button](../../images/icon-actions.png)) for the desired menu.

1. Select the desired navigation type: _Primary Navigation_, _Secondary Navigation_, or _Social Navigation_.

    ![Select the desired navigation type.](./using-the-navigation-menus-application/images/12.png)

    Once selected, each menu's configuration appears in the _Marked As_ column.

| Navigation Menu Type | Usage |
| :--- | :--- |
| **Primary Navigation** | Primary Navigation is the main navigation for a page. |
| **Secondary Navigation** | Secondary Navigation is a second level of navigation, possibly a sidebar or a separate menu within a page. |
| **Social Navigation** | Social Navigation is for menus that contain links for sharing content on social media or similar tasks. |

## Deleting a Navigation Menu

1. Click the _Actions_ button (![Actions Button](../../images/icon-actions.png)) next to the desired navigation menu (for example, _New Menu_) then _Delete_.
1. Click _OK_ in the confirmation.

The Navigation Menu has been deleted.

## Additional Information

* [Managing Site Navigation](./managing-site-navigation.md)
* [Navigation Menu Element Types](./navigation-menu-element-types.md)
* [Configuring Menu Displays](./configuring-menu-displays.md)
