---
uuid: 648d34f3-b6f8-4569-93a2-92ce758dc3b4
taxonomy-category-names:
- Platform
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Creating Picklists

{bdg-secondary}`Liferay 7.4 U72+/GA72+`

Picklists are lists of name/key pairs stored as string values. Once defined, you can use the lists with object definitions to populate single or multiple selection fields. See [Picklists](../picklists.md) for more picklist use cases.

To create a picklist,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Picklists*.

1. Click *Add* (![Add Button](../../../images/icon-add.png)).

   ![Click Add to create a new picklist.](./creating-picklists/images/01.png)

1. Name the picklist to identify the list in the UI. You can localize the name after creation.

1. Click *Save* to create an empty picklist definition and generate an external reference code (ERC). You can edit the ERC after creation.

1. Click the new picklist to begin editing it.

1. Under Items, click *Add* (![Add](../../../images/icon-add.png)).

   ![Click Add to add a new item to the picklist.](./creating-picklists/images/02.png)

1. In the modal window, enter a name and key for the item.

   **Name**: Determines the item's display name and can be localized after creation.

   **Key**: Determines the standard value understood by applications in the back-end and uses camel case.

   ![Enter a name and key, and then click Save.](./creating-picklists/images/03.png)

1. Click *Save*. The picklist updates immediately with the new item and generates an external reference code (ERC) for it.

   You can click the list item to localize its name or edit its ERC, but you cannot change its key. You can remove items at any time.

1. Repeat the above steps to add additional items to the list.

   ![Add multiple items to a picklist.](./creating-picklists/images/04.png)

Once created, you can select a picklist when creating object fields. Select the *Picklist* (single select) or *Multiselect Picklist* field type and choose the list. See [Adding Fields to Objects](../creating-and-managing-objects/fields/adding-fields-to-objects.md) and [Picklist Fields](../creating-and-managing-objects/fields/picklist-fields.md) for more information. 

![Users can select the picklist when creating new object fields.](./creating-picklists/images/05.png)

## Related Topics

* [Adding Fields to Objects](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [Managing Picklist Permissions](./managing-picklist-permissions.md)
* [Picklist API Basics](./picklists-api-basics.md)
