---
uuid: 33c781c1-c24e-44fe-8efc-90c0327abc3f
---
# Adding a Site

Sites are customizable spaces for building personalized digital experiences. Follow these steps to create a basic Site in your Liferay instance:

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Sites*.

    ![Open the Sites application.](./adding-a-site/images/01.png)

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

1. Select a *Site Template*.

    You can select *Blank* to create a new Site without any Pages or content. Alternatively, you can select a custom or default [Site Template](./site-templates.md) to populate your new Site with Pages, content, and configurations.

1. Enter a *name* for the Site.

   ```{note}
   If [Private Pages](../creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages) are enabled for your system, you, you can determine whether all Pages inherited from a Site Template are private.
   ```

1. Click *Save* to begin creating your Site.

Once finished, you are redirected to your new [Site's settings](../site-settings/site-settings-ui-reference.md). You can begin configuring your Site, or see [Default Site Applications](./default-site-applications.md) for a full list of applications you can use to build your Site.

## Creating Organization Sites

Liferay [Organizations](../../users-and-permissions/organizations/understanding-organizations.md) enable distributed User management, providing a convenient way to organize and manage instance users and roles to reflect your organizational hierarchy. Once an organization is created, you can also enable a dedicated Site for your Organization to facilitate distributed portal administration. This feature is available for both parent and child Organizations, so you can quickly create a hierarchy of Sites with content created, administered, and tailored specifically to each group's needs. See [Organization Sites](../../users-and-permissions/organizations/organization-sites.md) for more information.

```{note}
You can only use the blank template or custom templates when creating an Organization Site. You cannot use other default templates.
```

## Creating Group Sites

Liferay [User Groups](../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) are lists of users that can span multiple Organizations and Sites. If desired, you can create dedicated Sites for User Groups to add Pages to the [personal Site](./personal-sites.md) of each group member. See [User Group Sites](../../users-and-permissions/user-groups/user-group-sites.md) for more information.

## Related Topics

* [Introduction to Site Building](../introduction-to-site-building.md)
* [Site Templates](./site-templates.md)
* [Adding Members to Sites](./site-membership/adding-members-to-sites.md)
