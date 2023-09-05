---
uuid: 35ccf513-05ef-4bb7-80ec-e12b8a494cf5
---
# Managing Structures

You can manage structures from the structures page:

1. Open the Product Menu and go to the Site Menu heading &rarr; *Content & Data* &rarr; *Web Content*.
1. Select the *Structures* tab.
1. Open the structure's *Actions Menu* ( ![Actions Menu](../../../images/icon-actions.png) ) and select one of the [available actions](#available-actions).
1. Click *Save* to apply your changes.

## Available Actions

You can perform these actions from the structure's *Actions Menu* ( ![Actions Menu](../../../images/icon-actions.png) ):

**Edit:** Opens the structure so you can update it. See [Configuring Structure Fields](./configuring-structure-fields.md) for more information.

**Edit Default Values:** Opens a form to set default values for the structure's fields. See [below](#editing-default-values) for more information.

**Manage Templates:** Opens the *Templates* tab with a filtered set of web content templates that use the structure. From here you can manage (edit, copy, delete, and set permissions for) the web content templates. See [Managing Templates](../web-content-templates/creating-web-content-templates.md) for more information.

**Copy:** Opens a form to copy the structure and set its name. See [below](#copying-an-existing-structure) for more information.

**Export as JSON:** This downloads the structure as a JSON file.

**Import and Override:** This overwrites the existing JSON structure.

**Permissions:** Opens the permissions configuration dialog for the structure. See [Assigning Permissions to Web Content Structures and Templates](./assigning-permissions-to-structures-and-templates.md) for more information.

**Delete:** Deletes the structure.

## Editing Default Values

You can set the default values for a structure's fields. For example, a structure used for confidential memos may want to include the "confidential" tag for all the articles created with that structure, or you may want to make the content of all confidential memos non-searchable. From the Structures Page, open the *Actions Menu* ( ![Actions Menu](../../../images/icon-actions.png) ) for the structure and follow these steps:

1. Choose *Edit Default Values*.
1. In the *Structure Default Values* page, configure the default values for your fields.

    ```{tip}
    You can restore the original values of the Structure at any time by clicking the *Reset Values* button at the top.
    ```

1. Click *Save* to apply the changes.

```{tip}
You can also use the *Predefined Value* setting for the structure field to set default values. For more information, see Editing and [Configuring Structures' Content](./configuring-structure-fields.md)
```

## Copying an Existing Structure

You can copy an existing structure to create a new one. From the Structures Page, open the *Actions Menu* ( ![Actions Menu](../../../images/icon-actions.png) ) for the structure and follow these steps:

1. Choose *Copy*.
1. Type a new *Name* for the structure and, optionally, a new *Description*.
1. Optionally check the *Copy Templates* box if you want to copy the web content templates associated with the structure.
1. Click *Copy*.

```{tip}
Liferay DXP generates a unique ID for the copied structure. The new copy inherits all the attributes from the original structure, including the name. To avoid confusing the copy with the original, use a different name for the copy.
```

## Related Information

* [Creating Structures](./creating-structures.md)
* [Configuring Structure Fields](./configuring-structure-fields.md)
* [Assigning Permissions to Web Content Structures and Templates](./assigning-permissions-to-structures-and-templates.md)
