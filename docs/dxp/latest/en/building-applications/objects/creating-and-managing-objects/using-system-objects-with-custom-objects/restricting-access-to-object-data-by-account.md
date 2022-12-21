# Restricting Access to Object Data by Account

{bdg-secondary}`Available Liferay 7.4 U34+/GA34+`

In scenarios with multiple business [accounts](../../../../users-and-permissions/accounts.md), you may want to restrict access to object entries by account. To do this, your custom object must have an active [relationship](../defining-object-relationships.md) with the Account system object, and you must configure the custom object to use this relationship for restricting entry data. Once set up, anyone adding entries to the custom object must select an account. This account becomes the entry's owner. See [Account Restriction and User Roles](#account-restriction-and-user-roles) for an overview of how different types of roles relate to account restriction.

![Restrict access to custom object entries by account.](./restricting-access-to-object-data-by-account/images/01.png)

Follow these steps to use accounts to restrict access to custom Object entries:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the Account system object.

1. Add a *One to Many* or *Many to Many* relationship, relating the Account object to the desired custom object. See [Defining Object Relationships](../relationships/defining-object-relationships.md) for more information.

   ![Relate the Account system object to the desired custom object.](./restricting-access-to-object-data-by-account/images/02.png)

1. Return to the Objects page and begin editing the desired custom object.

1. In the Details tab, toggle *Account Restriction* to active and select the *Account relationship* you want to use for relating entries.

   ![Toggle Account Restriction to active and select the account relationship you want to use.](./restricting-access-to-object-data-by-account/images/03.png)

1. Click *Save*.

This adds a new mandatory account selection field to the object, so anyone adding an entry must select an account. Available options are determined by the user's account memberships. After entry creation, this relationship field value cannot be changed. The selected account becomes the entry's owner, and access to the data is determined by [user's roles](#account-restriction-and-user-roles).

## Account Restriction and User Roles

After restricting object data by account, data appears according to the user's roles. Users with regular roles can access all object data, while users with organization and account roles can only access data for their respective accounts.

| Role Type | Description of Relationship |
| :--- | :--- |
| Regular Roles | Grant access to all object data. Access is not restricted by the user's account or organization roles. <!--ALT: Access is not restricted by the user's account or organization roles. Users with regular role permissions can access all of the object's data.-->  |
| Organization Roles | Grant access to data for all accounts that belong to the organization. Access is restricted by an organization's accounts. <!--ALT: Access is restricted by an organization's accounts. Users with organization role permissions can access object data for all accounts belonging to the organization.--> |
| Account Roles | Grant access to object data for an individual account. Access is limited by account. <!--ALT: Access is limited by account. Users with account role permissions can only access object data belonging to their specific accounts.--> |

```{important}
Account restriction does not support the Account Member and Organization User roles. These roles do not automatically grant access to related object data.
```

## Additional Information

* [Accounts](../../../../users-and-permissions/accounts.md)
* [Extending System Objects](../extending-system-objects.md)
* [Defining Object Relationships](../relationships/defining-object-relationships.md)
* [Accessing Accounts Data from Custom Objects](./accessing-accounts-data-from-custom-objects.md)
* [Understanding Roles and Permissions](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)
