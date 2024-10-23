---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 35ccf513-05ef-4bb7-80ec-e12b8a494cf5
---

# Managing Web Content Structures

You can manage structures from the structures page:

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Content & Data* &rarr; *Web Content*.

1. Select the *Structures* tab.

1. Open the structure's *Actions Menu* (![Actions Menu](../../../images/icon-actions.png)) and select one of the [available actions](#available-actions).

1. Click *Save* to apply your changes.

## Available Actions

You can perform these actions from the structure's Actions Menu (![Actions Menu](../../../images/icon-actions.png)):

**Edit:** Opens the structure so you can update it. See [Configuring Web Content Structure Fields](./configuring-web-content-structure-fields.md) for more information.

**Edit Default Values:** Opens a form to set default values for the structure's fields. See [Editing Default Values](#editing-default-values) for more information.

**Manage Templates:** Opens the Templates tab with a filtered set of web content templates that use the structure. From here you can manage (edit, copy, delete, and set permissions for) the web content templates. See [Managing Templates](../web-content-templates/creating-web-content-templates.md) for more information.

**Make a Copy:** Opens a form to copy the structure and set its name. See [Copying an Existing Structure](#copying-an-existing-structure) for more information.

**Export as JSON:** Exports the structure as a JSON file.

**Import and Override:** Opens an import structure modal. Select and import a JSON file to override the selected structure.

**Permissions:** Opens the permissions configuration dialog for the structure. See [Assigning Permissions to Web Content Structures and Templates](./assigning-permissions-to-web-content-structures-and-templates.md) for more information.

**Delete:** Deletes the structure.

## Editing Default Values

You can set the default values for a structure's fields. For example, a structure used for confidential memos may want to include the *confidential* tag for all the articles created with that structure, or you may want to make the content of all confidential memos non-searchable. From the Structures page, open the *Actions Menu* (![Actions Menu](../../../images/icon-actions.png)) for the structure and follow these steps:

1. Choose *Edit Default Values*.

1. In the Structure Default Values page, configure the default values for your fields.

   !!! tip
       You can restore the original values of the structure at any time by clicking the *Reset Values* button at the top.

1. Click *Save* to apply the changes.

## Copying an Existing Structure

You can copy an existing structure to create a new one. From the structures page, open the *Actions Menu* (![Actions Menu](../../../images/icon-actions.png)) for the structure and follow these steps:

1. Choose *Copy*.

1. Type a new name for the structure and, optionally, a new description.

1. Optionally check the *Copy Templates* box if you want to copy the web content templates associated with the structure.

1. Click *Copy*.

!!! tip
    Liferay DXP generates a unique ID for the copied structure. The new copy inherits all the attributes from the original structure, including the name. To avoid confusing the copy with the original, use a different name for the copy.

## Related Topics

- [Creating Web Content Structures](./creating-web-content-structures.md)
- [Configuring Web Content Structure Fields](./configuring-web-content-structure-fields.md)
- [Assigning Permissions to Web Content Structures and Templates](./assigning-permissions-to-web-content-structures-and-templates.md)
