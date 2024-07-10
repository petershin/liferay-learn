---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 0d83f307-076c-4253-ad57-71ae68865a93
---

# Configuring Structure Fields

You can edit structure fields and their properties:

1. Open the Site Menu ( ![Site Menu](../../../images/icon-product-menu.png) ) and go to *Content & Data* &rarr; *Web Content*.

1. Select the *Structures* tab.

1. Click the name of the structure you want to modify.

   You can also open the *Actions* Menu ( ![Actions icon](../../../images/icon-actions.png) ) next to the structure and select *Edit*.

1. Add, [remove](#structure-field-options), or reorganize the fields in the structure.

1. Select the field you want to configure. You can also perform [other actions](#structure-field-options) in the context menu.

1. Once the sidebar expands, [configure your desired settings](#configurable-settings) for the selected field and *Save* the changes.

## Configurable Settings

!!! important
    Field settings depend on the type of field. A setting listed below may not apply for a field.

**Type:** The type of field placed in the definition. This is not editable but is available to reference from a web content template.

**Field Label:** The text to display above the field.

**Show Label:** Whether to show the Field label. The default value is Yes.

**Required:** Whether the user must fill the field to submit content using the web content structure. The default value is No.

**Field Reference:** The variable name used in web content templates for this field. You should enter a descriptive name. A default name is generated automatically.

!!! tip
    Liferay DXP assigns a random field reference for each new field in the structure. Replace the default value with something more descriptive, so template developers can identify the field to place its data in a web content template or display page.

**Help Text:** Add a comment to help users understand the field label. The help text works as a subheading for your field to provide additional guidance.

**Searchable:** Whether to index the field for search. Index the whole Text or just Keywords.

**Localizable:** Whether the field can be localized in the user's language. The default value is Yes.

**Repeatable:** Whether the user can duplicate the field while creating the web content. For example, you can have a repeatable author field so the user can duplicate the field to enter a second author for an article. The default value is No. If set to Yes, users can click a `+` icon on the field to duplicate it while creating the web content.

**Allow Multiple Selections:** Whether the user can select multiple options. The default value is No.

**Order Options Alphabetically:** Whether the field's options are ordered alphabetically. The default value is No.

**Inline:** Whether a select field has inline or block options displayed. The default value is Yes.

**Options:** The available options for a Select field or Radio field. You can add and remove options as well as edit each individual option's display name (the name the user sees when creating the web content) and value (the value stored for the option, which can be retrieved in the web content template) pair.

**Style:** Optional CSS styles for the Separator field.

## Structure Field Options

When you hover over a structure field and click *Actions* ( ![Actions button](../../../images/icon-app-options.png) ), these options appear in its context menu:

* **Duplicate:** Duplicates the field and all its settings and iterates the Name to avoid conflicts.
* **Delete:** Removes the field from the structure.

## Related Information

- [Creating Structures](./creating-structures.md)
- [Managing Structures](./managing-structures.md)
- [Web Content Structures](../web-content-structures.md)
