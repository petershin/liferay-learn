---
uuid: 17dfab4d-3c5f-4001-8a65-38a34170aa61
---
# Permissions Framework Integration

{bdg-secondary}`Available Liferay 7.4+`

Published objects are integrated automatically with Liferay's permissions framework. You can manage user access to an object and its entries with [application](#application-permissions) and [resource](#resource-permissions) permissions. With role-based access control, you can ensure only appropriate users view and use your application's data.

When defining role permissions, active objects appear according to their scope and panel category key.

```{note}
For site-scoped objects, you can determine whether permissions are granted for all sites or only specific sites.
```

```{important}
Account and organization roles are only supported in objects with account restriction enabled. Otherwise, you can only use regular and site roles for assigning object permissions. See [Account Restriction and User Roles](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md#account-restriction-and-user-roles) for more information.
```

## Application Permissions

Application permissions grant access to the published object itself and do not include [resource-related permissions](#resource-permissions). Each object includes these standard application permissions according to their defined scope:

| Permission | Description |
| :--- | :--- |
| Access in Control Panel (*Company Scope Only*) | Access the object in the Global Menu ( ![Global Menu](../../../images/icon-applications-menu.png) ). |
| Access in Site and Asset Library Administration (*Site Scope Only*) | Access the object in the Site Menu ( ![Site Menu](../../../images/icon-product-menu.png) ) or Asset Library. |
| Configuration | N/A |
| Permissions | View and modify application permissions for the object. |
| Preferences | N/A |
| View | View the object's application page. |

## Resource Permissions

Resource permissions grant access to view and act on resources in the object application. Some of these permissions [relate to creating object entries](#creating-entries), while others are for [performing actions on existing entries](#acting-on-existing-entries) (e.g., edit, delete).

### Creating Entries

| Permission | Description |
| :--- | :--- |
| Add Object Entry | Create an entry. |
| Permissions | View and manage permissions related to creating entries. |

### Acting on Existing Entries

| Permission | Description |
| :--- | :--- |
| Delete | Delete entries. |
| Permissions | View and modify permissions for individual entries. |
| Update | Update entries. |
| View | View entries. |

```{note}
When users create object entries, they are assigned the owner role for their entries automatically, which includes the above permissions.
```

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

## Additional Information

* [Understanding Object Integrations](../understanding-object-integrations.md)
* [Objects Overview](../../objects.md)
* [Creating Objects](../creating-and-managing-objects/creating-objects.md)
* [Restricting Access to Object Data by Account](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md)
