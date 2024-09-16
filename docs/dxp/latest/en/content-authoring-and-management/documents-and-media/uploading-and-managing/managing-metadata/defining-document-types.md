---
toc:
  - ./defining-document-types/defining-document-types-for-liferay-73-and-earlier-versions.md
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 4e674e72-10be-403f-a38d-3fb01d5bd7d3
---

# Defining Document Types

In Liferay, Document Types are templates used for uploading files and categorizing them in Documents and Media. These templates are created using metadata fields and provide additional, searchable information for uploaded files.

## Default Document Types

Default document types are generated when you first start a virtual instance or create a new company. To prevent their creation in future instances or companies,

1. Open the *Product Menu* (![Product Menu](../../../../images/icon-applications-menu.png)), navigate to *Control Panel*, and click *System Settings*.

1. Click *Documents and Media* under Content and Data.

1. Under Service, uncheck *Add Default Structures* and click *Save*.

This setting only applies to new instances or companies created thereafter. 

You can also use a configuration file to configure this setting: 

1. Create a config file named `com.liferay.document.library.configuration.DLConfiguration.config`.

1. Add `addDefaultStructures=B"false"` to the file and save it.

1. Place the file in the `osgi/configs` directory in your Liferay bundle before starting the server.

When set, the *Add Default Structures* option is unchecked on startup, and no default document types are created.

## Defining a Custom Document Type

1. Navigate to the Documents and Media application in a site or asset library.

   To access Documents and Media in a site, open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Content & Data* &rarr; *Documents and Media*.

   ![Click on Documents and Media under Content & Data in the Site Menu.](./defining-document-types/images/01.png)

   To access Documents and Media in an asset library, navigate to any library where it's enabled and click on *Documents and Media*.

   ![Click on Documents and Media in the asset library.](./defining-document-types/images/02.png)

1. Open the *Document Types* tab.

1. Click *New* to access the New Document Type form.

1. Enter a *name* for the Document Type.

1. In the Builder tab, drag and drop the desired fields into the designated drop zone.

   ![Add fields in the Builder tab.](./defining-document-types/images/03.png)

   Each field is highly configurable, with basic and advanced options.

   If desired, you can create field groups by dragging and dropping fields on top of one another. Each group can also be configured as a unit.

   ![Configure each field and create and configure field groups.](./defining-document-types/images/04.png)

   !!! note
       All custom Document Types have the following fields: Upload File, Title, File Name, and Description. Fields added to a custom Document Type appear in addition to these default fields.

1. (Optional) Click on the *Details* tab, and enter a *description*.

1. (Optional) Click on the *Additional Metadata Fields* tab and select any existing [Metadata Sets](./defining-metadata-sets.md) you want to add to the new Document Type.

1. (Optional) Click on the *Permissions* tab, and configure who can view, edit, and manage the new Document Type.

   ![Enter a description in the Details tab, add metadata sets in the Additional Metadata Fields tab, and configure permission for the Document Type in the Permissions tab.](./defining-document-types/images/05.png)

1. Click on *Save*.

Once saved, the new Document Type can now be accessed in the Documents and Media tab, where you can use it to start a new upload.

![Use the Document Type to start a new upload.](./defining-document-types/images/06.png)

When the Document Type is selected, users see your configured metadata fields. See [Uploading Files](../uploading-files.md) for more information.

## Related Topics

- [Documents and Media](../../../documents-and-media.md)
- [Defining Metadata Sets](./defining-metadata-sets.md)
