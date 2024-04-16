---
taxonomy-category-names:
- Sites
- Site Administration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 418acf83-334e-48a2-95a2-473e6974ddb1
---
# Personal Sites

By default, Liferay generates a personal site for every user. Each site includes two [page sets](../creating-pages/understanding-pages.md#page-sets): My Profile (public) and My Dashboard (private). Each user is the sole member of their personal site and can use it to display and manage their content.

If desired, you can [disable or customize](#customizing-personal-sites-with-portal-properties) personal sites using portal properties.

!!! important
    For Liferay 7.4 U22+ and GA22+, new Liferay installations include a release feature flag that disables the creation of private pages, including dashboard pages. To manually create custom dashboard pages for a personal site, private pages must be enabled for your Liferay system. See [Enabling Private Pages](../creating-pages/understanding-pages.md#enabling-private-pages) for more information.

!!! tip
With user group sites, you can dynamically add pages to the personal sites of all group members. See [User Group Sites](../../users-and-permissions/user-groups/user-group-sites.md) for more information.

## Profile Pages and Dashboard Pages

In profile pages, users can share content (e.g., blogs, activities) publicly. By default, each profile page displays the user's basic information and provides a download link to the user's vCard (virtual business card).

![The profile page displays public info for other users to view.](./personal-sites/images/01.png)

In dashboard pages, users can access private files, create personalized RSS feeds, manage site memberships, and more. By default, each dashboard page includes the My Sites widget.

![The dashboard page displays private information that's just for you to view.](./personal-sites/images/02.png)

## Managing Personal Site Pages

To access your personal site pages, follow these steps:

1. Open the *User Profile Menu* icon and select either *My Profile* or *My Dashboard*.

    ![You access your personal site pages from the User Profile Menu.](./personal-sites/images/03.png)

1. Open the *Product Menu* (![Product Menu](../../images/icon-product-menu.png)), expand *Site Builder*, and click *Pages*.

1. Manage them as you would any other [site page](../creating-pages/understanding-pages.md).

You can also add and define pages for a user's personal site via a user group. See [User Group Sites](../../users-and-permissions/user-groups/user-group-sites.md) for more information.

## Personal Site Permissions and Roles

Permissions and roles for personal sites follow the behavior shown below:

- Administrators can customize the modifiable portions of personal sites through Liferay portal's permissions system by removing permissions from roles (disallow all users from modifying something by removing the relevant permission from the user role).
- Users can administer their personal sites and modify the pages and applications when they are members of the [power user role](../../users-and-permissions/roles-and-permissions/default-roles-reference.md#regular-roles).

## Customizing Personal Sites with Portal Properties

There are several portal properties you can add to [`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) to customize the default pages of personal sites. You can customize the names of the pages, the applications that appear on the pages, the themes and layout templates of pages, and more. Please refer to the [Default User Public Layouts](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Public%20Layouts) and [Default User Private Layouts](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Private%20Layouts) sections of the `portal.properties` file for details. Some of these properties are listed in the table below:

| Functionality                                                 | Property                                        |
|:--------------------------------------------------------------|:------------------------------------------------|
| Disable personal sites                                        | `layout.user.public.layouts.enabled=false`      |
| Disable private pages on personal sites                       | `layout.user.private.layouts.enabled=false`     |
| Disable automatic creation of personal sites                  | `layout.user.public.layouts.auto.create=false`  |
| Disable automatic creation of private pages on personal sites | `layout.user.private.layouts.auto.create=false` |

The public and private page sets of personal sites are handled separately. You can leave one page set enabled while disabling the other. If you initially had user personal sites enabled for your instance but then disabled them, existing personal sites remain on your instance until the next time users sign in, at which point they're removed.

## Related Topics

- [Adding a Site](./adding-a-site.md)
- [Sites Templates](./site-templates.md)
- [User Group Sites](../../users-and-permissions/user-groups/user-group-sites.md)
