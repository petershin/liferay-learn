---
taxonomy-category-names:
- Digital Asset Management
- Asset Libraries
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 496aabce-cd8b-4877-8319-e41aa125c812
---
# Creating and Managing Asset Libraries

{bdg-secondary}`Liferay 7.3+`

You can create and manage libraries for your assets via the Asset Libraries application. To access this application, open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Applications* tab, and click *Asset Libraries*.

![Create and manage asset libraries via the Asset Libraries application.](./creating-and-managing-asset-libraries/images/01.png)

## Creating an Asset Library

1. In the Asset Library application, click *Add* (![Add button](../../images/icon-add.png)).

1. Enter a *Name* for your new library.

1. Click *Save*.

You can now configure the asset library now or accept the default settings and begin adding content to it.

## Configuring Asset Libraries

When you create an asset library, Liferay directs you to its configuration page. Afterwards, you can configure a library by clicking its *Actions* (![Actions button](../../images/icon-actions.png)) and selecting *Edit*. Configuration options appear in three sections: *General*, *Sites*, and *Languages*.

You can also access these options from the library's dashboard page by clicking *Asset Library Settings*.

### General Settings

Here you can configure an asset library's basic information.

**Details**: View a library's unique ID and configure its name or description.

**Applications**: Activate or deactivate supported applications for the library (i.e., Documents and Media, Collections, Translation Processes, Web Content). This determines if you can use the application in the library. Deactivating an application does not delete the application's assets or remove them from connected sites.

**Sharing**: Enable or disable sharing for assets. When enabled, asset library members can share its assets with other users.

**Asset Auto Tagging**: Enable or disable [auto tagging](../tags-and-categories/auto-tagging/auto-tagging-assets.md). When enabled, assets are automatically tagged using the providers configured at the instance level.

**Documents and Media**: Enable or disable HTTP directory browsing for this library. By default, this setting is disabled. When enabled, users with view permission for an asset library can view files and folders in its document library in their browsers (e.g., `http://localhost:8080/documents/asset-library-{assetLibraryId}`). For Liferay 2024.Q1+/GA112+, also set a max file size for uploaded assets. This value cannot exceed the maximum upload request size set at the instance or system levels. Setting the value to 0 sets no limit for uploaded files.

**Recycle Bin**: Enable or disable Recycle Bin for a library, and set the maximum age for recycled assets. By default, the maximum age is set to 43200 minutes (i.e., 30 days).

### Sites

Here you can connect the asset library to Liferay sites and configure their relationship.

![Connect sites to an asset library and configure their connection.](./creating-and-managing-asset-libraries/images/02.png)

**Add**: Connect a new site to the selected library.

**Make Searchable/Unsearchable**: Determine whether the library's assets appear in search queries for the selected site. By default, all connections are searchable.

**Make Web Content Structures Available**: By default, this feature is disabled. When enabled, you can use the library's web content structures and templates in connected sites. If you later disable this feature, web content using the library's structures and templates in a site is no longer available.

**Disconnect**: Disconnect the selected site from the library. When disconnected, the library's assets are no longer accessible from the site. You cannot disconnect a library from a site while *Make Web Content Structures Available* is enabled. This is to avoid breaking site content that uses the library's structures and templates.

### Languages

Here you can choose whether to use your instance's default language configuration for the library or define your own. If you choose a custom configuration, click *Edit* to determine which languages are available in the library. Then you can drag and drop languages to set their relative priority.

![Use your instance's default language options for an asset library, or define your own](./creating-and-managing-asset-libraries/images/03.png)

To set a custom default language, click the desired language's *Actions* (![Actions button](../../images/icon-actions.png)) and select *Make Default*.

## Managing Asset Library Memberships

You can view and manage user memberships for an asset library by going to its dashboard page and clicking *Memberships*. From here, you can click *Add* (![Add button](../../images/icon-add.png)) to add new users, organizations, and user groups to the selected library. You can also assign roles or remove memberships for each existing member by clicking its *Actions* (![Actions button](../../images/icon-actions.png)).

![View an manage asset library memberships.](./creating-and-managing-asset-libraries/images/04.png)

By default, asset libraries include these roles:

* **Asset Library Member**: Grants basic permissions and is automatically assigned to users who belong to an asset library.

* **Asset Library Connected Site Member**: Automatically assigned to members of a connected site.

* **Asset Library Content Reviewer**: Grants permissions necessary for reviewing content in a workflow.

* **Asset Library Administrator**: Grants permission to manage most aspects of an asset library, including content, memberships, and settings. However, it does not grant permission to modify or assign the Owner or Administrator roles to other members.

* **Asset Library Owner**: Grants control over all aspects of an asset library and is automatically assigned to the library's creator.

!!! note
    By default, the asset library member's permissions are more restricted than those of its site counterpart. This means you must manually grant access to applications, update/delete permissions for content, and more if you want members to be responsible for managing content.

Creating or customizing an asset library role is the same process as for other kinds of roles. See [Roles and Permissions](../../users-and-permissions/roles-and-permissions.md) for how to create, customize, manage, and assign roles.

## Deleting an Asset Library

To remove an asset library and its contents from your instance, click its *Actions* (![Actions button](../../images/icon-actions.png)) and select *Delete*. You are then prompted to confirm the deletion. Once deleted, all contained assets are removed from your database and are no longer available to previously connected sites.

!!! warning
    Deleting asset libraries cannot be undone. Ensure you're removing the correct library and have backed up any assets you want to keep.

## Related Topics

- [Asset Libraries Overview](../asset-libraries.md)
- [Asset Library Content](./asset-library-content.md)
