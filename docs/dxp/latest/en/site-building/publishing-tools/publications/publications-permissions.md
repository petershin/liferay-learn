# Publications Permissions

Publications is integrated with Liferay's permissions framework so you can assign [application](#application-permissions) and [resource](#resource-permissions) permissions to user roles. This way you can ensure only the desired users have the ability to access publications and perform related actions.

By default, Liferay provides the *Publications User* role with basic permissions for creating and accessing publications.

![Liferay provides the default Publications User role.](./publications-permissions/images/01.png)

If needed, you can create additional [Regular Roles](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) or configure existing role permissions for content creators, reviewers, and publishers. See [Creating and Managing Roles](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md) and [Defining Role Permissions](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md) for more information.

![Add additional Regular Roles or configure other role permissions.](./publications-permissions/images/02.png)

```{note}
Since Publications is company scoped, you can only assign its permissions to *Regular Roles*. See [Understanding Roles and Permissions](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) for more information on different types of roles.
```

## Application Permissions

Application permissions grant the ability to perform general application-related operations and do not include [resource-related permissions](#resource-permissions).

| Permission | Description |
| :--- | :--- |
| Access in Control Panel | Access the Publications application in the Global Menu ( ![Global Menu](../../../images/icon-applications-menu.png) ) |
| Add to Page | <!--???--> |
| Configuration | View and set the application's configuration options <!--??? How does this one relate to Preferences? --> |
| Permissions | View and modify the application's permissions |
| Preferences | View and set application preferences <!--??? How does this one relate to Configuration? --> |
| View | View the Publications application |
| Work on Production | Access and work in production |

```{note}
If you've enabled Sandbox Only for your system and don't want users to work in production, ensure they do not have the Work on Production permission.
```

## Resource Permissions

Resource permissions grant specific abilities related to application resources. Some of these permissions grant the ability to perform [actions on database entities](#publication-actions-on-database-entities) (e.g., update the publication). Others grant permission to perform [resource-related actions](#publications-resource-related-actions) in the Publications context (e.g., create a new publication).

Publications has the following resource permissions.

### Publications (Resource Related Actions)

| Permission | Description |
| :--- | :--- |
| Add Publication | Create a publication |
| Permissions | View and manage permissions related to publications |

### Publication (Actions on Database Entities)

| Permission | Description |
| :--- | :--- |
| Delete | Delete a publication |
| Permissions | View and modify permissions for an individual publication |
| Update | Update a publication |
| View | View a publication |

## Additional Information

* [Publications](../publications.md)
* [Creating and Managing Publications](./creating-and-managing-publications.md)
* [Collaborating on Publications](./collaborating-on-publications.md)
