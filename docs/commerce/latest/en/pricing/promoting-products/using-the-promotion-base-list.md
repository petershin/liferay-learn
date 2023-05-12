---
uuid: 63716171-76b7-4d2f-805c-2fb962d4a27b
---
# Using the Promotion Base List

When you create a new Catalog, a new *Promotion Base List* is automatically created. You cannot control the Eligibility or add any Price Modifiers for a Promotion Base List. You can only use it to add specific entries that you want to target with a promotional price.

To use the Promotion Base List,

1. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to *Commerce* &rarr; *Catalogs*.

   ![Click on Catalogs and create a new catalog for your products.](./using-the-promotion-base-list/images/01.png)

1. Click *Add* (![Add icon](../../images/icon-add.png)) and enter the following information.

   **Name:** Test Catalog

   **Default Catalog Language:** English (United States)

   **Currency:** US Dollar

   ![Enter a name, default catalog language, and currency for the new catalog.](./using-the-promotion-base-list/images/02.png)

1. Click *Submit*.

This creates a new Catalog and a new Promotion Base List. To view this, open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and click on *Commerce* &rarr; *Promotions*. You should see a new entry as *Test Catalog Base Promotion*.

## Adding Entries

The Promotion Base List automatically adds all products in the corresponding catalog as entries. To target a specific SKU in the Catalog,

1. Search for an SKU in the Entries section and click on it.

1. You can enter a Promotion Price, expiration date, and configure [bulk or tiered pricing](../using-price-tiers.md#bulk-pricing-vs-tier-pricing) for the SKU.

   ![You can enter a Promotion Price, expiration date, and configure bulk or tiered pricing for the SKU.](./using-the-promotion-base-list/images/03.png)

1. Click *Save*.

You can also use the Override Discount toggle to give the promotion price precedence over any active Discounts. See the comparison between a promotion overriding a 20% discount and without it.

![You can use the Override Discount toggle in the Promotion's configuration to override any active discounts.](./using-the-promotion-base-list/images/04.png)

```{note}
Another way to target an SKU with a promotion price is by opening the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and going to *Commerce* &rarr; *Products*. Find and select the product and click the *SKUs* tab. Select the SKU you want to target and set a Promotion Price for it. Click *Publish*. This sets the price of the SKU in the Base Promotion List. Prior to Liferay DXP 7.4 U42/GA42, Promotion Price was called Sale Price.
```

## Related Topics

* [Introduction to Promotions](./introduction-to-promotions.md)
* [Creating a Promotion](./creating-a-promotion.md)
* [Promotions Reference](./promotions-reference.md)
