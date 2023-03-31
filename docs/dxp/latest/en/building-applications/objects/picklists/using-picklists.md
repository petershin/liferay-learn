---
uuid: 648d34f3-b6f8-4569-93a2-92ce758dc3b4
---
# Using Picklists

{bdg-secondary}`Available Liferay 7.4+`

Picklists are predefined lists of string values that consist of name/key pairs. Once defined, you can use these lists with object definitions.

## Creating a Picklist

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Picklists*.

1. Click *Add* (![Add Button](../../../images/icon-add.png)).

   ![Click the Add button to create a new picklist.](./using-picklists/images/01.png)

1. Name the picklist. This identifies the list in the Liferay UI and can be localized after creation.

1. Click *Save* to create an empty picklist definition and generate an external reference code (ERC) for it, which you can edit.

1. Click the new picklist to begin editing it.

1. Under Items, click the *Add* button (![Add Button](../../../images/icon-add.png)).

   ![Click the Add button to add a new item to the picklist.](./using-picklists/images/02.png)

1. In the modal window, enter a name and key for the item.

   **Name**: Determines the item's display name and can be localized after creation.

   **Key**: Determines the standard value understood by applications in the back-end and uses camel case.

   ![Enter a name and key, and then click Save.](./using-picklists/images/03.png)

1. Click *Save*. This immediately updates the picklist with the new item and generates an external reference code (ERC) for it.

   If desired, you can click the list item to localize its name or edit its ERC, but you cannot change its key value. You can remove items at any time.

1. Repeat the above steps to add additional items to the list.

   ![Add multiple items to a picklist.](./using-picklists/images/04.png)

## Adding Picklist Fields to Objects

{bdg-secondary}`For 7.4 U56+/GA56+`

After creating a list, you can select it when creating object fields. Select the *Picklist* or *Multiselect Picklist* field type and choose the list. See [Adding Fields to Objects](../creating-and-managing-objects/fields/adding-fields-to-objects.md) and [Adding and Managing Custom States](../creating-and-managing-objects/fields/adding-and-managing-custom-states.md) for more information.

![Users can select the picklist when creating new object fields.](./using-picklists/images/05.png)

When users access this field in an object's layout, it appears as a drop-down menu that lists the picklist's items.

![Picklists appear as drop-down menus in an object's layout.](./using-picklists/images/06.png)

```{important}
You cannot delete a list if it is used by an object field, though you can edit and remove list items at any time.

Updating or deleting a picklist item automatically updates all object entries using the item value.
```

## Picklist Fields in Object API Calls

{bdg-secondary}`For 7.4 U56+/GA56+`

When making POST, PATCH, and PUT API calls for objects that include a picklist field, you must use the following request payload formats for Picklist and Multiselect Picklist fields, respectively.

### Picklist Field Type

```json
{ 
      "picklistExample": {
        "key": "firstOption",
        "name": "First Option"
      }
}
```

### Multiselect Picklist Field Type

```json
{ 
      "picklistExample": [
        {
          "key": "firstOption",
          "name": "First Option"
        },
        {
          "key": "secondOption",
          "name": "Second Option"
        }
      ]
}
```

## Additional Information

* [Adding Fields to Objects](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [Managing Picklist Permissions](./managing-picklist-permissions.md)
* [Picklist API Basics](./picklists-api-basics.md)
