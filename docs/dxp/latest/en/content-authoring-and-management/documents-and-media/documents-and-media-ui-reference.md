---
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: ef280e48-9b38-4f8d-8c33-e001c671a9c7
---
# Documents and Media UI Reference

The Documents and Media application is used to store, view, and manage files for your Liferay DXP instance. It's available in all sites and can be enabled for [asset libraries](../asset-libraries.md).

To access documents and media in a site, open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and go to *Content & Data* &rarr; *Documents and Media*.

![Click on Documents and Media under Content & Data in the Site Menu.](./documents-and-media-ui-reference/images/01.png)

To access documents and media in an asset library, navigate to any library where it's enabled, and click on *Documents and Media*.

![Click on Documents and Media in the asset library.](./documents-and-media-ui-reference/images/02.png)

The Documents and Media application has three main tabs: [Files](#files-tab), [Document Types](#document-types-tab), and [Metadata Sets](#metadata-sets-tab).

You can access additional settings by clicking on *Actions* (![Actions button](../../images/icon-actions.png)) in the [Application Bar](#application-bar-settings).

```{note}
The documents and media UI is the same for asset libraries and sites.
```

## Files Tab

![The Files tab provides access to the application's primary features.](./documents-and-media-ui-reference/images/03.png)

The Files tab provides access to the application's primary features. Here you can view, search, add, and manage all digital assets, folders, and connected repositories.

```{note}
The Home folder serves as the root folder for the documents and media application.
```

Click *Add* (![Add button](../../images/icon-add.png)) to access these actions: file upload, multiple files upload, folder, repository, shortcut, external video shortcut. See [Using Folders](./uploading-and-managing/using-folders.md) and [Uploading Files](./uploading-and-managing/uploading-files.md) for more information.

![Click Add to create a new folder or digital asset.](./documents-and-media-ui-reference/images/04.png)

If you've created custom [document types](#document-types-tab), they appear here as available options.

Click a file or folder's *Actions* (![Actions button](../../images/icon-actions.png)) to download, edit, move, or remove it. You can also check out or check files in to create file versions.

## Document Types Tab

![Create custom templates for file uploads in the Document Types tab.](./documents-and-media-ui-reference/images/05.png)

Here you can create and manage custom templates used for adding new files to Documents and Media. *Document types* are created using metadata fields and provide additional, searchable information for uploaded files.

To compose a new document type, drag and drop configurable metadata fields into the drop zone. You can also add a description, include custom [metadata sets](#metadata-sets-tab), and manage permissions.

![Create and configure custom document types.](./documents-and-media-ui-reference/images/06.png)

Once created, you can use a template to add new digital assets in the Documents and Media tab. See [Defining Document Types](./uploading-and-managing/managing-metadata/defining-document-types.md) for more information.

## Metadata Sets Tab

![Create custom groups of data fields in the Metadata Sets tab.](./documents-and-media-ui-reference/images/07.png)

Here you can define reusable groups of metadata fields that can be added to custom document types. *Metadata sets* are composed in the same way as document types, by dragging and dropping metadata fields into the designated drop zone.

![Use fields to create reusable metadata sets.](./documents-and-media-ui-reference/images/08.png)

Once created, metadata sets can be added to custom document types. See [Defining Metadata Sets](./uploading-and-managing/managing-metadata/defining-metadata-sets.md) for more information.

## Application Bar Settings

![Access these documents and media settings in the Application Bar.](./documents-and-media-ui-reference/images/09.png)

You can use the following Documents and Media settings in the Application Bar:

* [Access from Desktop](#access-from-desktop)
* [Edit](#edit) (![Edit icon](../../images/icon-edit.png))
* [Home Folder Permissions](#home-folder-permissions) (![Permissions icon](../../images/icon-permissions.png))
* [Export/Import](#exportimport) (![Export/Import icon](../../images/icon-sort.png))
* [Configuration](#configuration) (![Configuration icon](../../images/icon-cog.png))

### Access from Desktop

Generate a WebDAV URL for accessing Documents and Media resources in your file explorer.

![Generate the WebDAV URL.](./documents-and-media-ui-reference/images/10.png)

### Edit

Enable or disable a default [workflow](../../process-automation/workflow/using-workflows/activating-workflow.md) for all document types. To learn more about workflows, see [Introduction to Workflow](../../process-automation/workflow/introduction-to-workflow.md).

![Select a default workflow.](./documents-and-media-ui-reference/images/11.png)

### Home Folder Permissions

Manage permissions for the Documents and Media home folder. To learn more about permissions, see [Understanding Roles and Permissions](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md).

![Manage permissions for the documents and media home folder.](./documents-and-media-ui-reference/images/12.png)

### Export/Import

Initiate [export or import](../../site-building/sites/exporting-importing-site-pages-and-content.md) operations for documents and media content. Content is exported as an `LAR` (Liferay archive) file. You can also view current and previous exports.

![Initiate export or import operations for documents and media.](./documents-and-media-ui-reference/images/13.png)

### Configuration

Configure email notifications for documents and media. When configuring email notifications, you can use default placeholders for parsing information (e.g., `[$COMPANY_ID$]`, `[$DOCUMENT_TYPE$]`, `[$TO_NAME$]`). Available placeholders appear in each tab under Definition of Terms.

```{note}
Using email notifications requires a connected mail server. See [Configuring Mail](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) for more information.
```

**Email From**: Enter a name and email address to use as the email's sender.

![Enter the sender's name and email address.](./documents-and-media-ui-reference/images/14.png)

**Document Added Email**: Enable/Disable email notifications for when documents are added, and compose the email's subject and content body.

![Compose the email sent when a document is added.](./documents-and-media-ui-reference/images/15.png)

**Document Updated Email**: Enable/Disable email notifications for when existing documents are updated, and compose the email's subject and content body.

![Compose the email sent when existing documents are updated.](./documents-and-media-ui-reference/images/16.png)

**Document Needs Review Email**: Enable/Disable email notifications for when existing documents are submitted for review, and compose the email's subject and content body.

![Compose the email sent when existing documents are submitted for review.](./documents-and-media-ui-reference/images/17.png)

**Document Expired Email**: Enable/Disable email notifications for when existing documents have reached their expiration date, and compose the email's subject and content body.

![Compose the email sent when existing documents have expired.](./documents-and-media-ui-reference/images/18.png)

## Related Topics

* [Documents and Media](../documents-and-media.md)
* [Exporting/Importing Site Pages and Contents](../../site-building/sites/exporting-importing-site-pages-and-content.md)
