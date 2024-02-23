---
taxonomy-category-names:
    - Digital Asset Management
    - Documents and Media
    - Liferay Self-Hosted
    - Liferay PaaS
    - Liferay SaaS
uuid: 91bdb111-e5f0-4ac1-a1cf-5e3dd020a7e6
---

# Configuring Limits for File Previews

{bdg-secondary}`Liferay DXP 2024.Q1 U112`

Users can preview certain documents (e.g. PDF or text files) in the Documents and Media application; however, previews can take a large amount of storage, if you have many or large documents. In some cases, you might want to limit the number of pages a user can preview. You can save a significant amount of storage by applying a limit to the number of previewed pages.

!!! note
    When you change the file preview limit, it affects only new files.

To configure the file preview and limit the number of previewed pages,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and select the *Control Panel* tab.

1. Select *System Settings* or *Instance Settings*.

   You can apply global rules at the system level and apply more restrictive configurations at an instance level.

   For example, you can limit the maximum number of previewed pages to 10 at the system level, but you can set a value of 10 or fewer pages at an instance level.

1. Click *Documents and Media* under Content and Data.

![Configure the file preview limits through system or instance settings.](./configuring-limits-for-file-previews/images/01.png)

1. On the left menu, select *File Preview Limits* (1).

1. Set the maximum file size for generating previews. No preview is generated for files larger than the specified value. 

   The size value is in bytes, and the default maximum size is 20 megabytes.

   Use `-1` to enable previews to all files.

   Use `0` to disable previews to all files.

1. Set the number of pages shown in your preview.

   Use `0` to show all pages.

When file preview limits are set, a message appears during document preview indicating that the preview may not show all pages.

![While previewing a file, users will see a message indicating that the preview may not show all pages.](./configuring-limits-for-file-previews/images/02.png)

## Related Topics

- [Documents and Media](../../documents-and-media.md)
- [Uploading and Managing](../uploading-and-managing.md)
