# Restricting Access to Object Data by Account

{bdg-secondary}`Available Liferay 7.4 U34+ and GA34+`

In scenarios with multiple business [Accounts](../../../users-and-permissions/accounts.md), you may want to restrict access to object entries by Account. To do this, your custom object must have an active [relationship](./defining-object-relationships.md) with the account system object, and you must configure the custom object to use this relationship for restricting entry data. Once set up, anyone adding entries to the custom object must select an account. This account becomes the entry's owner, so only account members can access it.

![Restrict access to custom object entries by account.](./restricting-access-to-object-data-by-account/images/01.png)

Follow these steps to use accounts to restrict access to custom Object entries:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the account system object.

1. Add a *One to Many* or *Many to Many* relationship, relating the account object to the desired custom object. See [Defining Object Relationships](./defining-object-relationships.md) for more information.

   ![Relate the account system object to the desired custom object.](./restricting-access-to-object-data-by-account/images/02.png)

1. Return to the Objects page and begin editing the desired custom object.

1. In the Details tab, toggle *Account Restriction* to active and select the *Account relationship* you want to use for relating entries.

   ![Toggle Account Restriction to active and select the account relationship you want to use.](./restricting-access-to-object-data-by-account/images/03.png)

1. Click *Save*.

This adds a new mandatory account selection field to the object, so anyone adding an entry must select an account. Available options are determined by the user's account memberships. Once set, only members of the selected account can access the entry.

## Additional Information

* [Accounts](../../../users-and-permissions/accounts.md)
* [Defining Object Relationships](./defining-object-relationships.md)
