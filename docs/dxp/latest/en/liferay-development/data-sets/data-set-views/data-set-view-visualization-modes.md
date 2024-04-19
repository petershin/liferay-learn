---
uuid: 8d92cb6f-d38f-4144-98ae-d69af473178b
taxonomy-category-names:
    - Development and Tooling
    - Data Sets
    - Liferay Self-Hosted
    - Liferay SaaS
---

# Data Set View Visualization Modes

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`
{bdg-link-primary}`[Beta Feature](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

Use the data set manager to select fields and manage visualization modes to customize how you display the data in your data set view. There are three visualization modes: [table](#displaying-data-as-a-table), [list, and cards](#displaying-data-as-a-list-or-in-cards).

With the table visualization mode, you can add and customize any number of fields and select how to render them. With lists and cards, you have a restricted number of elements that can be mapped to fields.

After setting up the visualization modes, access a page with a [data set fragment](./using-data-set-view-actions.md#using-a-data-set-fragment-in-a-content-page) and choose your preferred mode using the *Show View Options*

![Drag and drop fields to reorder them.](./data-set-view-visualization-modes/images/01.png)

## Displaying Data as a Table

Use the table visualization mode to add, delete, order, edit, and map fields to columns and display data as a table in a [data set fragment](./using-data-set-view-actions.md#using-a-data-set-fragment-in-a-content-page).

To configure a table visualization mode,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Data Sets* under Object.

1. Click the *Name* of the data set you want to access.

   Alternatively, you can click *Actions* (![Actions menu](../../../images/icon-actions.png)) next to the data set entry and select *Edit*.

1. Click the *Name* of the data set view to start editing it.

1. Select the *Visualization Modes* tab.

1. Select the *Table* tab.

1. Click *Add* (![Add button](../../../images/icon-add.png)) to add fields to the table.

1. Select the fields to be displayed.

   Select one or more fields. You can also use the search bar to find specific fields or leave the search bar empty to see all available fields.

1. Click *Save*.

With the fields in place, you can reorder them by using the drag icon on the left to drag and drop the field into the desired position.

![Drag and drop fields to reorder them.](./data-set-view-visualization-modes/images/02.gif)

### Editing Fields in a Table

Now you can edit your fields to alter and localize their labels, select a renderer, and define if they are sortable.

To edit a field, click *Actions* (![Actions menu](../../../images/icon-actions.png)) next to the field and select *Edit*.

   ![In the Fields tab, you can change its label and localize it, choose a renderer and mark it as sortable.](./data-set-view-visualization-modes/images/03.png)

### Editing and Localizing Labels

Once you start editing a field, you can change the label and localize it (1).

To localize the label,

1. Click the flag icon next to the Label field and choose a Language.

1. Enter the translated text in the Label field (2).

   The translated text is saved automatically.

   The localization status label next to the flag changes to `Translated` to indicate that the localization was successful.

   ![The localization status label next to the flag changes to `Translated` to indicate that the localization was successful.](./data-set-view-visualization-modes/images/04.png)

!!! note
    The localized text appears if users have the respective language applied to their portal.

### Selecting a Renderer for the Field

A renderer (3) is a structured way to customize how a component appears. They are built to be convenient. You enter a raw value and the renderer assumes the most typical format and UI for it.

!!! important
    To ensure your data is displayed correctly, the field type must be compatible with the selected renderer.

Below on the left, the status, date, and date and time fields have the default renderer applied. On the right, the status, date, and date and time renderers are applied to the respective fields.

![Status, date, and date and time fields without and with renderers applied.](./data-set-view-visualization-modes/images/05.png)

<!-- once I have more information about renderers, I'll add a link to another section where I'll explain the types of renderers and what they do or what kind of structure/data/data type they need to work. -->

### Defining the Field as Sortable

When a field is marked as sortable, users can sort the elements while using the data set fragment in a content page.

Users can sort entries based on the integer field initially. However, when the sortable checkbox is unchecked, sorting entries using the integer field as a filter becomes impossible (see below).

![Define the fields as sortable, so users can sort elements when using the data set fragment.](./data-set-view-visualization-modes/images/06.gif)

## Displaying Data as a List or in Cards

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`

!!! note
    The List and Cards visualization modes are hidden until you map at least one field to an element in these modes.

Use the list and cards visualization modes to map fields to the visualization mode elements (i.e., title, description, image, and symbol) and display data as a list or in cards in a [data set fragment](./using-data-set-view-actions.md#using-a-data-set-fragment-in-a-content-page).

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Data Sets* under Object.

1. Click the *Name* of the data set you want to access.

   Alternatively, you can click *Actions* (![Actions menu](../../../images/icon-actions.png)) next to the data set entry and select *Edit*.

1. Click the *Name* of the data set view to start editing it.

1. Select the *Visualization Modes* tab.

1. Open the *List* or *Cards* tab.

   Both visualization modes are configured similarly; The only difference is how the data is displayed.

1. To assign a field to an element, click *Add* (![Add icon](../../../images/icon-plus.png)) and select a field.

   The available elements are Title, Description, Image, and Symbol. Note that the image element overrides the symbol element; Therefore, you only need to assign one of them.

   !!! tip
       To use the Symbol element, you must create [a text-type object field](../../objects/creating-and-managing-objects/fields.md) with values that match icon names from the [Clay Icon Reference](https://clayui.com/docs/components/icon.html).

       For example, if you want to use a shopping cart symbol, create the object definition, add a text field, name it however you want, and enter `shopping-cart` in the field when creating the object entry. Once you assign the field to the Symbol element, the shopping-cart symbol will show.

Below, you can see the same data shown in cards using images and as a list using clay icons as symbols.

![The same data is using the cards visualization mode with images and the list visualization mode with clay icons as symbols.](./data-set-view-visualization-modes/images/07.png)

## Defining a Default Visualization Mode

You can define a default visualization mode to be shown first once a data set fragment is used in a page.

To set a default visualization mode,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Data Sets* under Object.

1. Click the *Name* of the data set you want to access.

   Alternatively, you can click *Actions* (![Actions menu](../../../images/icon-actions.png)) next to the data set entry and select *Edit*.

1. Click the *Name* of the data set view to start editing it.

1. Select the *Settings* tab.

1. Choose the *Default Visualization Mode*.

!!! note
    You can only set a visualization mode as default if it's visible. If you have a default mode and it becomes hidden, the first mode in alphabetical order is selected automatically as the default.

![Set a default visualization mode in the settings tab.](./data-set-view-visualization-modes/images/08.png)

## Related Topics

- [Creating Data Sets](../creating-data-sets.md)
- [Data Set Views](../data-set-views.md)
- [Data Set View Actions](./data-set-view-actions.md)
- [Data Set View Filters](./data-set-view-filters.md)