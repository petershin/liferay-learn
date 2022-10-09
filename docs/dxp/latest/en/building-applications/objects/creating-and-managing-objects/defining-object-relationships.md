# Defining Object Relationships

{bdg-secondary}`Available Liferay DXP/Portal 7.4+`

Relationships are connections between Object definitions that you can use to link their entries. You can add relationships to any published or unpublished Object, including both system and custom Objects.

## Relationship Types

Objects provides two types of relationships:

<!--TASK: Add One to One after it's been implemented-->

**One to Many**: You can relate one Object entry to multiple Object entries. When selected, a new field is added to entries on the child side of the relationship (i.e., the 'many' side), while a table is added to the 'parent' side (i.e., the 'one' side). On the child side, the new field can be added to a [Fields Tab](./designing-object-layouts.md#adding-fields-tabs) in the Object's custom layout and relates its entries to a single entry on the parent side of the relationship. On the parent side, the new table can be added to a [Relationships Tab](./designing-object-layouts.md#adding-relationships-tabs) in the Object's custom layout and lists all entries related to the current parent entry.

**Many to Many**: You can relate multiple Object entries with multiple Object entries. When selected, a new database table is created for both sides of the relationship. This table can be added to a [Relationships Tab](./designing-object-layouts.md#adding-relationships-tabs) in the Object's custom layout and lists all related entries.

```{important}
Displaying relationship tables requires a custom layout. However, custom layouts are not supported for system Objects, so they cannot display relationship tables. See [Designing Object Layouts](./designing-object-layouts.md) for more information. 
```

## Adding New Relationships

Follow these steps to add relationships to an Object:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Objects*.

1. Begin editing the desired object definition.

1. Go to the *Relationships* tab and click the *Add* button (![Add Button](../../../images/icon-add.png)).

   ![Click on the Add button in the Relationships tab, then enter a label and name, and select a relationship type and the desired Object.](./defining-object-relationships/images/01.png)

1. Enter a *Label* and *Name*.

   **Label**: Identifies the relationship in the Objects UI and can be localized after the relationship is created.

   **Name**: Determines the relationship's name in the back-end and uses camel case. Once the relationship is published, this value cannot be changed.

1. Select a relationship Type: *One to Many* or *Many to Many*. <!--TASK: Add One to One after it's been implemented-->

1. Select an *Object* to relate to the current Object. You can relate Objects to themselves or other Object definitions.

   ```{note}
   Beginning with 7.4 U46/GA46, you can define one-to-many and many-to-many relationships that relate an Object definition to itself. Previously, you could only use the one-to-many type to relate entries within the same Object. <!--TASK: Add One to One after it's been implemented-->
   ```

1. Click on *Save*.

   ![After clicking Save, the saved relationship is listed in the Relationships tab.](./defining-object-relationships/images/02.png)

Once saved, the new relationship can be [added to custom layouts](./designing-object-layouts.md) for the related Objects. You can then use the relationship fields and tables to relate Object entries to one another.

## Configuring Deletion Type

After a relationship is saved, you can configure its deletion type. This setting determines how entry deletion is handled when the entry is related to another entry, and it is only available after a relationship is created.

![After creating a relationship, you can configure its deletion type.](./defining-object-relationships/images/03.png)

Available options include *Prevent*, *Disassociate*, and *Cascade*.

**Prevent** (Default): Entries on the parent side cannot be deleted if they are related to any child entries.

**Disassociate**: Entries on the parent side can be freely deleted without affecting any related child entries.

**Cascade**: Entries on the parent side can be freely deleted; deleting a parent entry also deletes any related child entries, provided the user has the requisite permissions for the child Object.

## Removing Relationships

{bdg-secondary}`Available Liferay 7.4 U26+ and GA26+`

You can remove relationships from both draft and published Object definitions. Removing a relationship permanently deletes its field from the related Object definitions. For published definitions, this can affect many records.

```{important}
For versions before Liferay 7.4 U26/GA26, users cannot delete relationships included in an Object at the time it is [published](./creating-objects.md#publishing-object-drafts).
```

Follow these steps to remove relationships from a published Object definitions.

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click on *Objects*.

1. Begin editing the desired Object definition and go to the *Relationships* tab.

1. Click the *Actions* button (![Actions Button](../../../images/icon-actions.png)) for the desired relationship and select *Delete*.

1. In the dialog window, enter the name of the relationship and click *Delete* to confirm.

   ![Enter the name of the relationship and click Done.](./defining-object-relationships/images/04.png)

## Additional Information

* [Creating Objects](./creating-objects.md)
* [Adding Fields to Objects](./adding-fields-to-objects.md)
* [Designing Object Layouts](./designing-object-layouts.md)
* [Managing Objects](./managing-objects.md)
