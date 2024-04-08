---
taxonomy-category-names:
- Sites
- Pages and Composition
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 8b9099c6-0666-4218-acc1-2a72b40ae63a
---

# Updating Page Permissions

By default, when users join a site, they can see all of its pages. However, you can configure permissions for individual pages to restrict access based on user [roles](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md).

!!! note
    Individual page permissions take priority over site-level configurations.

To update page permissions,

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and navigate to *Site Builder* &rarr; *Pages*.

1. Next to a page, click *Actions* (![Actions](../../../images/icon-actions.png)) &rarr; *Permissions* (1).

   Alternatively, while [editing a page](../using-content-pages/adding-elements-to-content-pages.md), click *Options* (![Options icon](../../../images/icon-options.png)) at the top right corner of the page &rarr; *Permissions* (2).

   {bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA126+` Or select the checkbox next to the page or pages (to set [permissions in bulk](#setting-page-permissions-in-bulk)) and click *Permissions* at the top options bar (3).

   ![The page permissions can be found in the Pages app or while editing a page.](./updating-page-permissions/images/01.png)

1. Update the permissions for each role. See [Page Permissions Reference](#page-permissions-reference) to learn more about each permission.

    ![The permissions offer many options for each role.](./updating-page-permissions/images/02.png)

1. Click *Save* to apply the changes.

## Copying a Page with Permissions

To copy a page with its permissions,

1. Open the *Site Menu* (![Product Menu](../../../images/icon-product-menu.png)) and select *Site Builder* &rarr; *Pages*.

1. Click *Actions* (![Actions Button](../../../images/icon-actions.png)) for the desired page and select *Copy* &rarr; *Page With Permissions*.

1. Enter a page name and click *Add*.

## Setting Page Permissions in Bulk

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA126+`

!!! important
    This feature is currently behind a release feature flag (LPS-196847). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

To select multiple pages and set their permissions at once,

1. Select the checkbox next to the pages you want to set permissions.

1. Click *Permissions* at the top options bar.

1. Update the permissions for each role. See [Page Permissions Reference](#page-permissions-reference) to learn more about each permission.

   There are four available icons when setting permissions in bulk.

   (1) (![Indeterminate permission icon](../../../images/icon-permission-indeterminate.png)) indicates that the permission is **set in some** of the selected pages, but not all of them. You can unset the permission to unset or unset and set it again to set it to all selected pages.

   (2) (![Empty permission icon](../../../images/icon-permission-empty.png)) indicates that the permission is **not set to any** of the selected pages

   (3) (![Disabled permission icon](../../../images/icon-permission-disabled.png)) indicates that you **can't set** the permission for that role.

   (4) (![Set permission icon](../../../images/icon-permission-set.png)) indicates that the permission is set in **all** of the selected pages.

   ![The permissions offer many options for each role.](./updating-page-permissions/images/03.png)

1. Click *Save* to apply the changes.

## Page Permissions Reference

Here's a list of permissions associated with pages. To learn more about DXP Roles and Permissions in general, see [Roles and Permissions](../../../users-and-permissions/roles-and-permissions.md).

| Permission | Description |
|:---|:---|
| Update Discussion | Edit another user's comment on the page. |
| Permissions | View and modify the page's permissions. |
| Update - Advanced options | Advanced options for updating the page (e.g., to configure fragment's advanced settings). |
| Update Page Content | Update the page's existing content. |
| Customize | Customize the page. |
| Page Rule Builder | Use the Page Rule Builder to define rules for the page. |
| Add Page | Add pages. |
| View | View pages. |
| Delete  | Move the page to the [Recycle Bin](../recycle-bin/recycle-bin-overview.md). |
| {bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA126+` Preview Draft | Even without the Edit permission, users can preview Draft versions of the page. |
| Update Basic | Basic options for updating the page. |
| Delete Discussion | Delete any comments on page. |
| Configure Applications | Manage Fragments and Widgets. |
| Update | Update the page. |
| Update - Limited  | Limited options for updating the page. |
| Add Discussion | Comment on the page. |

## Related Topics

- [Understanding Roles and Permissions](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)
- [Assigning Users to Roles](../../../users-and-permissions/roles-and-permissions/assigning-users-to-roles.md)
- [Configuring Page Sets](./configuring-page-sets.md)