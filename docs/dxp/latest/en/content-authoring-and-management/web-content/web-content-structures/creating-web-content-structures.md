---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: ce4f21a1-f104-4587-aaff-2d7af1b10139
---

# Creating Web Content Structures

Create web content structures to serve as building blocks for web content articles and determine the information you can include when writing them.

To create a web content structure,

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and navigate to *Content & Data* &rarr; *Web Content*.

1. Select the *Structures* tab.

1. Click *New* to create a new structure.

1. Enter the title of your new structure.

1. Drag and drop the [available fields](#structure-fields) onto the structure and [configure their settings](./configuring-web-content-structure-fields.md#configurable-settings) to create the structure.

1. Optionally, add a *Description* for your structure.

1. Click *Save*.

![When creating a new structure, you can drag fields from the palette and drop them on the canvas.](./creating-web-contentstructures/images/01.png)

!!! warning
    Due to import/export operations, it's possible to have both a global and a site-scoped structure with the same `structureKey`. If this happens, the site-scoped structure takes precedence, and you can't access the global structure from that site.

!!! tip
    To discover additional configuration options for web content and structures (e.g., [enable setting a custom structure key](./whats-new-with-web-content-structures-in-7-4.md#setting-the-web-content-structure-key)), look in System Settings &rarr; Content and Data &rarr; Web Content &rarr; Administration.

## Structure Fields

You can place these fields on a structure:

**Boolean:** A checkbox that stores either `true` (checked) or `false` (unchecked). For example, you can use this field to set a display rule for the structure's content.

**Color:** A color picker.

**Date:** A pre-formatted text field that displays a date picker. The date format depends on the current locale.

**Date and Time:** A pre-formatted text field that displays a date and time picker. The date and time format depend on the current locale.

**Geolocation:** A map that displays a configured location. Geolocation provides both the current location and directions to another place.

**Grid:** A customized matrix with values that can be personalized for the rows and columns. The user can only select one option for each row.

**Image:** An image selector to include an image from the Documents and Media library or your computer.

!!! note
    If you upload an image from your computer, the image is only available for that particular article.

**Link to Page:** A selector to include a link to another page in the same site.

**Multiple Selection:** A list of options to choose from using a checkbox list. This field allows multiple selections.

**Numeric:** A field that accepts integer or decimal numbers based on the selected numeric type. Non-numeric input is not accepted.

**Rich Text:** A WYSIWYG editor to offer more formatting options for writing content.

**Select from List:** A selection of options to choose from using a drop-down list. This field optionally allows multiple selections.

**Separator:** A horizontal line to separate fields.

**Single Selection:** A list of options to choose from using radio buttons. This field allows one selection only.

**Text:** A text field for short entries, such as titles or headings.

**Upload:** A file selector to include a file from the documents and media library or your computer.

**Web Content:** A selector to include an existing web content article.

See [Configuring Web Content Structure Fields](./configuring-web-content-structure-fields.md) for more information on configuring and editing Structure fields.

## Translating a Structure

You can add a translation for the structure, either while creating it or later.

![Manage the translations of a Web Content Structure.](./creating-web-contentstructures/images/02.png)

1. From the Add or Edit Structure screen, open the language selector by clicking the locale (e.g.,`en-us`), and then select *Manage Translations*.

1. Click *Add* (![Add icon](../../../images/icon-add.png)) in the Manage Translations modal and choose the language.

1. Click *Done*.

1. Click the default locale again and select the new locale to begin translating.

1. Translate as much of the Structure's text as you'd like, then click *Save*.

To delete a translation, go back to the Manage Translations modal and click *Trash* (![Trash icon](../../../images/icon-trash.png)).

To edit a translation, select the translation using the language selector, make any changes, and click *Save*.

## Related Topics

- [Web Content Structures](../web-content-structures.md)
- [Configuring Web Content Structure Fields](./configuring-web-content-structure-fields.md)
- [Managing Web Content Structures](./managing-web-content-structures.md)
