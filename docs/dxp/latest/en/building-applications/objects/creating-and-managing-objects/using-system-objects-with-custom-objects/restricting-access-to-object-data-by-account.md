# Restricting Access to Object Data by Account

{bdg-secondary}`Available Liferay 7.4 U58+/GA58+`

In scenarios with multiple business [accounts](../../../../users-and-permissions/accounts.md), you may want to restrict access to object entries by account. To do this, your custom object must have an active [relationship](../defining-object-relationships.md) with the Account system object, and you must configure the custom object to use this relationship for restricting entry data. Once set up, anyone adding entries to the custom object must select an account. This account becomes the entry's owner. See [Account Restriction and User Roles](#account-restriction-and-user-roles) for an overview of how role types determine access to entries.

![Restrict access to custom object entries by account.](./restricting-access-to-object-data-by-account/images/01.png)

Follow these steps to restrict access to entries by account:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the Account system object.

1. Add a *One to Many* or *Many to Many* relationship, relating the Account object to the desired custom object. See [Defining Object Relationships](../relationships/defining-object-relationships.md) for more information.

   ![Relate the Account system object to the desired custom object.](./restricting-access-to-object-data-by-account/images/02.png)

1. Return to the Objects page and begin editing the desired custom object.

1. In the Details tab, toggle *Account Restriction* to active and select the *Account relationship* you want to use.

   ![Toggle Account Restriction to active and select the account relationship you want to use.](./restricting-access-to-object-data-by-account/images/03.png)

1. Click *Save*.

This adds a new mandatory account selection field to the object, so anyone adding an entry must select an account. Available accounts are determined by each user's permissions. After entry creation, the selected account becomes the entry's owner and cannot be changed.

## Account Restriction and User Roles

After restricting object data by account, entries appear according to the user's permissions. Users with regular roles can access all object data, while users with organization and account roles can only access data for their respective accounts.

| Role Type | Access |
| :--- | :--- |
| Regular Roles | Access all object data. Access is not restricted by the user's account or organization roles. |
| Organization Roles | Access object data for accounts that belong to the organization and sub-organizations. Access is restricted by an organization's accounts. |
| Account Roles | Access object data for an account. Access is limited by account. |

When setting up roles for account restriction, consider these factors:

* Regular roles must have the `Accounts > Account Entry: View` permission to create object entries. This is because regular roles are not associated with accounts or organizations. Without this permission, users with the regular role cannot select an account during entry creation.

* Organization roles must have these permissions to create object entries: `User and Organizations > Organization: Manage Accounts` and `User and Organizations > Organization: Manage Suborganizations Accounts`. Without these permissions, users with the organization role cannot select an account during entry creation.

* To use organization and account roles to access a custom object, users must have a separate regular role that grants access to the application in either the Global Menu (if company-scoped) or Site Menu (if site-scoped). See [Object Application Permissions](../../understanding-object-integrations/permissions-framework-integration.md#application-permissions) for more information.

```{important}
Account and organization roles are only supported in objects with account restriction enabled. However, account restriction does not support the Account Member and Organization User roles. These roles do not automatically grant access to related object data.
```

## Example Use Case: Insurance Claims

Consider an insurance scenario where you need a way for business account users to open claims without seeing claims made by other accounts. Customer success managers must be able to review claims made by the accounts they service, whether based on region, industry, or policy type. Finally, your claims manager must be able to oversee all claims.

To achieve this, you can create a Claims custom object with account restriction enabled. Then create organizations for grouping your CSMs and associate each organization with the appropriate business accounts. Finally, you can create the following [account](#account-role), [organization](#organization-role), and [regular](#regular-role) roles and assign them to the appropriate users. Since the Claims object is company-scoped, account and organization users must also have a separate regular role that grants the `Portal: View Control Panel Menu` and `Claims: Access in Control Panel` permissions.

```{note}
In this scenario, each role can create claim entries, but granting that permission is not necessary for the organization and regular roles.
```

### Account Role

| Permission | Description |
| :--- | :--- |
| Claims: View | View the object's application page. |
| Claims > Claim: Delete | Delete object entries. |
| Claims > Claim: Permissions | View and modify permissions for individual object entries. |
| Claims > Claim: Update | Update object entries. |
| Claims > Claim: View | View object entries. |
| Claims > Claims: Add Object Entry | Create an object entry. |

### Organization Role

| Permission | Description |
| :--- | :--- |
| Claims: View | View the object's application page. |
| Claims > Claim: Delete | Delete object entries. |
| Claims > Claim: Permissions | View and modify permissions for individual object entries. |
| Claims > Claim: Update | Update object entries. |
| Claims > Claim: View | View object entries. |
| Claims > Claims: Add Object Entry | Create an object entry. |
| User and Organizations > Organization: Manage Accounts | View an organization's accounts. |
| User and Organizations > Organization: Manage Suborganizations Accounts | View accounts associated with suborganizations. |

### Regular Role

| Permission | Description |
| :--- | :--- |
| Accounts > Account Entry: View | View access to account entries. |
| Portal: View Control Panel Menu | Access to the Global Menu ( ![Global Menu](../../../../images/icon-applications-menu.png) ). |
| Claims: Access in Control Panel | Access the object in the Global Menu. |
| Claims: View | View the object's application page. |
| Claims > Claim: Delete | Delete object entries. |
| Claims > Claim: Permissions | View and modify permissions for individual object entries. |
| Claims > Claim: Update | Update object entries. |
| Claims > Claim: View | View object entries. |
| Claims > Claims: Add Object Entry | Create an object entry. |

## Additional Information

* [Accounts](../../../../users-and-permissions/accounts.md)
* [Extending System Objects](../extending-system-objects.md)
* [Defining Object Relationships](../relationships/defining-object-relationships.md)
* [Accessing Accounts Data from Custom Objects](./accessing-accounts-data-from-custom-objects.md)
* [Understanding Roles and Permissions](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)
