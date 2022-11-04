# Publications Permissions

{bdg-secondary}`For Liferay 7.4+`

Publications is integrated with Liferay's permissions framework so you can assign [application](#application-permissions) and [resource](#resource-permissions) permissions to user roles. This way you can ensure only the desired users have the ability to access publications and perform related actions.

```{note}
Assigning users Publications permissions does not allow users to edit pages and content. To do this, they must have additional permissions for each application and its resources (e.g., web content, blogs, pages).
```

By default, Liferay provides the *Publications User* role with basic permissions for creating and accessing publications.

![Liferay provides the default Publications User role.](./publications-permissions/images/01.png)

If needed, you can create additional [regular roles](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) or configure existing roles for content creators, reviewers, and publishers. See [Creating and Managing Roles](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md) and [Defining Role Permissions](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md) for more information.

![Add additional regular roles or configure other role permissions.](./publications-permissions/images/02.png)

```{note}
Since Publications is company scoped, you can only assign its permissions to *Regular Roles*. See [Understanding Roles and Permissions](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) for more information on different types of roles.
```

## Application Permissions

Application permissions grant the ability to perform general application-related operations and do not include [resource-related permissions](#resource-permissions).

| Permission | Description |
| :--- | :--- |
| Access in Control Panel | Access the Publications application in the Global Menu ( ![Global Menu](../../../images/icon-applications-menu.png) ). |
| Add to Page | N/A |
| Configuration | [Enable or disable](./enabling-publications.md) Publications and the Sandbox Only mode. |
| Permissions | View and modify permissions for the Publications application. |
| Preferences | N/A |
| View | View the Publications application in the Global Menu ( ![Global Menu](../../../images/icon-applications-menu.png) ) and access the Publications Bar. |
| Work on Production | Access and work in production while Publications is enabled. |

At minimum, contributing to a publication requires the Access in Control Panel and View permissions.

```{important}
If you've enabled Sandbox Only for your system and don't want users to work in production, ensure they do not have the Work on Production permission.
```

## Resource Permissions

Resource permissions grant specific abilities related to application resources. Some of these permissions grant the ability to perform [actions on database entities](#publication-actions-on-database-entities) (e.g., update the publication). Others grant permission to perform [resource-related actions](#publications-resource-related-actions) in the Publications context (e.g., create a new publication).

Publications has the following resource permissions.

### Publications (Resource Related Actions)

| Permission | Description |
| :--- | :--- |
| Add Publication | Create a publication. Without this permission, users can only access and contribute to a publication when [invited](./collaborating-on-publications.md). |
| Permissions | N/A |

### Publication (Actions on Database Entities)

| Permission | Description |
| :--- | :--- |
| Delete | Delete a publication. |
| Permissions | View and modify permissions for an individual publication. This includes the ability to [invite users](./collaborating-on-publications.md) to the publication. |
| Publish | Publish a publication |
| Update | Update a publication. |
| View | View a publication. |

```{note}
Publication creators are automatically assigned the Owner role with these permissions. When you invite users to a publication and assign a role, they have more limited permissions.

* Viewer: View
* Editor: View and Update
* Publisher: View, Update, and Publish
* Admin: View, Update, Publish, and Permissions

By default, only the publication owner has the Delete permission.
```

## Default Publications Role

For 7.4+, Liferay provides the default *Publications User* role with these permissions:

* Portal: View Control Panel Menu
* Publications: Access in Control Panel
* Publications: View
* Publications > Publications: Add Publication

![Liferay provides the default Publications User role with these permissions.](./publications-permissions/images/03.png)

## Additional Information

* [Publications](../publications.md)
* [Creating and Managing Publications](./creating-and-managing-publications.md)
* [Collaborating on Publications](./collaborating-on-publications.md)
