---
uuid: 17dfab4d-3c5f-4001-8a65-38a34170aa61
taxonomy-category-names:
- Integration
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Permissions Framework Integration

{bdg-secondary}`Liferay 7.4+`

Published objects are integrated automatically with Liferay's permissions framework. You can manage user access to an object and its entries with [application](#application-permissions) and [resource](#resource-permissions) permissions. With role-based access control, you can ensure only appropriate users view and use your application's data.

By default, custom object permissions are not assigned to user roles automatically. This is to prevent the accidental exposure of object data. To grant access, manually assign object permissions to the desired roles.

When defining role permissions, active objects appear according to their scope and panel link. Without a set panel link, custom objects do not appear in the Roles UI. [Account restricted objects](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md) must also have Show Widget enabled.

```{tip}
For site-scoped objects, you can determine whether permissions are granted for all sites or only specific sites.
```

```{important}
Account and organization roles are only supported in objects with account restriction enabled. Otherwise, you can only use regular and site roles for assigning object permissions. See [Account Restriction and User Roles](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md#account-restriction-and-user-roles) for more information.
```

## Application Permissions

Application permissions grant access to the published object itself and do not include [resource-related permissions](#resource-permissions). Each object includes these standard application permissions according to their defined scope:

| Permission | Description |
|:---|:---|
| Access in Control Panel (*Company Scope Only*) | Access the object in the Global Menu ( ![Global Menu](../../../images/icon-applications-menu.png) ). |
| Access in Site and Asset Library Administration (*Site Scope Only*) | Access the object in the Site Menu ( ![Site Menu](../../../images/icon-product-menu.png) ) or Asset Library. |
| Configuration | N/A |
| Permissions | View and modify application permissions for the object. |
| Preferences | N/A |
| View* | View the object's application page. |

\* The view permission is also required to view mapped content, add/modify a form container mapped to the object definition while editing a page, and perform other actions provided users have additional required permissions (e.g., creating display page templates, information templates, and site navigation menus). Without it, collection and content displays are not displayed in View and Preview modes.

## Resource Permissions

Resource permissions grant access to view, create, and act on entries for custom object definitions. Some of these permissions [relate to creating object entries](#creating-entries), while others are for [performing actions on existing entries](#acting-on-existing-entries) (e.g., edit, delete).

### Creating Entries

| Permission       | Description                                                                                                                                                           |
|:-----------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Add Object Entry | Create an entry. This permission is required to view the associated object's form container. Without it, form containers are not displayed in View and Preview modes. |
| Permissions      | View and manage permissions related to creating entries.                                                                                                              |

To learn about managing an unauthenticated guest user's ability to add object entries, see [Managing Guest User Permissions](./managing-guest-user-entries.md).

### Acting on Existing Entries

| Permission           | Description                                                                                                                                                                                                                                                                                                        |
|:---------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Delete               | Delete entries.                                                                                                                                                                                                                                                                                                    |
| Object Entry History | Use REST APIs to [query entry history](./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md). This permission is only available while [Entry History is enabled](../creating-and-managing-objects/auditing-object-events.md#enabling-entry-history) for the object definition. |
| Permissions          | View and modify permissions for individual entries.                                                                                                                                                                                                                                                                |
| Update               | Update entries.                                                                                                                                                                                                                                                                                                    |
| View                 | View entries.                                                                                                                                                                                                                                                                                                      |

```{note}
The creator of an object entry is assigned the owner role automatically and granted the above permissions.
```

Resource permissions are generated for each [standalone action](../creating-and-managing-objects/actions/using-manual-actions.md) added to an object. They're useful for managing which roles can trigger the action, and are named using the `action.[actionName]` pattern.

## Managing Permissions for Individual Object Entities

{bdg-secondary}`For 7.4 U10+/GA14+`

With custom objects, you can manage permissions for individual database entities to control access to object data.

Follow these steps:

1. Navigate to the desired custom object.

1. Click the *Actions* button (![Actions Button](../../../images/icon-actions.png)) for the desired entity and select *Permissions*.

   ![Click the Actions button for the desired entity and select Permissions.](./permissions-framework-integration/images/01.png)

1. Use the checkboxes to grant permissions to [act on the entry](#acting-on-existing-entries) permissions to the desired roles.

   ```{note}
   Permissions defined in the Roles administrative application override permissions defined at the entity level.
   ```

   ![Use the checkboxes to assign permissions to the desired roles.](./permissions-framework-integration/images/02.png)

1. Click *Save*.

## Related Topics

* [Understanding Object Integrations](../understanding-object-integrations.md)
* [Objects Overview](../../objects.md)
* [Creating Objects](../creating-and-managing-objects/creating-objects.md)
* [Restricting Access to Object Data by Account](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md)
