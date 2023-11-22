---
uuid: a592a5d7-887c-4164-8df4-fe0d46f51bfe
---
# Supplier Account

{bdg-secondary}`Liferay DXP 7.4 U84+/GA84+`

The *Supplier* account type has all the features of Liferay accounts: adding and managing addresses, users, organizations, account groups, and roles. Additionally, it clearly distinguishes suppliers from customers. When creating a new account, choose the *Supplier* option from the Type drop-down. See [Accounts](https://learn.liferay.com/w/dxp/users-and-permissions/accounts) for more information on creating a new account.

Unlike other account types, you can link a supplier account to a channel and catalog. This can be used in conjunction with the supplier role. Linking both the channel and catalog to a supplier account allows suppliers to manage their own orders and their own catalog of products.

## Linking a Channel to a Supplier Account

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Channels*.

1. Select a channel.

1. Inside the Details card, use the *Link Channel to a Supplier* drop-down to select a supplier account.

   ![Choose a supplier account from the dropdown to link to the channel.](./supplier-account/images/01.png)

1. Click *Save*.

## Linking a Catalog to a Supplier Account

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Catalogs*.

1. Select an existing catalog if you already have a supplier catalog created, or create a new one by clicking *Add* (![Add](../../images/icon-add.png)).

1. After selecting the catalog, use the *Link Channel to a Supplier* drop-down to select a supplier account.

   ![Choose a supplier account from the dropdown to link to the catalog.](./supplier-account/images/02.png)

1. Click *Save*.

```{note}
Users with the *Supplier* role can create their own catalogs. When creating a new catalog as a supplier, a drop-down to select the supplier account is available at the time of creation itself. The catalog isn't created unless the supplier links the account correctly.

Suppliers cannot change the supplier account linked to a catalog or channel or create their own channels. This is only possible for administrators.
```

## Related Topics

* [Supplier](../../users-and-accounts/roles-and-permissions/commerce-roles-reference.md#supplier)
* [Account Supplier](../../users-and-accounts/roles-and-permissions/commerce-roles-reference.md#account-supplier)
* [Supplier Role](./supplier-role.md)