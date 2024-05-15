---
uuid: e97f576f-2c3b-433a-bcda-2cdbffa0ad79
taxonomy-category-names:
- Commerce
- Pricing
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Creating a Price List

You can create price lists to store SKU price entries that target specific accounts, channels, and order types. They're used when determining a product's unit price and override or modify base price list entries for eligible customers. You can also define custom [price modifiers](./using-price-modifiers.md) for each price list.

To create a new price list,

1. Open the *Global Menu* (![Applications Menu icon](../images/icon-applications-menu.png)) and navigate to *Pricing* &rarr; *Price Lists*.

1. Click *Add* (![Add icon](../images/icon-add.png)).

1. Enter a *Name*, *Catalog*, and *Currency* for the new price list. You can change the name and currency of a price list at any time, but not the linked catalog.

   ```{note}
   Creating a price list requires your Liferay instance to have at least one [catalog](../product-management/catalogs/creating-a-new-catalog.md).
   ```

1. Click on *Submit*.

Once created, you can [add price entries](./adding-products-to-a-price-list.md) for products and configure its general settings. These settings include the list's relative priority, parent price list, and price type (i.e., net or gross). You can also determine account, channel, and order type eligibility and [add price modifiers](./using-price-modifiers.md) if desired.

When finished, click *Publish* to make your changes live or *Save as Draft* to publish them later.

```{note}
When a catalog is first created, a base price list is created automatically to store the base price for each of its entries. For these price lists, only the Details and Entries tabs are available. The Eligibility and Price Modifier tabs are only available to subsequently created price lists.
```

![Configure the newly created price list.](./creating-a-price-list/images/02.png)

## Commerce 2.1 and Below

1. Navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Price Lists_.
1. Click the (![Add icon](../images/icon-add.png)) button.
1. Enter the following fields (example values shown below):
    * **Catalog**: Sahara.com
    * **Name**: VIP Customers
    * **Store Currency**: USD
    * **Priority**: 1.0
1. Under _Account Groups_, click _Select_.
1. Choose one or more Account Groups to have access to this price list (example account groups shown below):
    * _General_
    * _Auto Repair Shops_
1. Click _Add_.
1. Under _Accounts_, click _Select_.
1. Choose one or more Accounts to have access to this price list (example accounts shown below):
    * Mike’s Car Repair
    * Fountain Valley Car Wash
1. Click _Add_.
1. Choose a Schedule for the price list. (Leave the _Never Expire_ checkbox checked in this example. Alternatively, you can set a date range for when the price list is active.)

    ![Adding a price list](./creating-a-price-list/images/01.png)

1. Click _Publish_.

The price list (_VIP Customers_ in this example) has been created and applied to the chosen Account Groups and Accounts. Repeat the steps to create other price lists as necessary.

## Related Topics

* [Creating a New Account](../users-and-accounts/account-management/creating-a-new-account.md)
* [Creating a New Account Group](../users-and-accounts/account-management/creating-a-new-account-group.md)
* [Adding Products to a Price List](./adding-products-to-a-price-list.md)
* [Using Price Tiers](./using-price-tiers.md)
