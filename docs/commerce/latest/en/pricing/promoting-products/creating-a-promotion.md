---
uuid: 3caf47dd-49d5-477c-8334-7a985adc57b2
taxonomy-category-names:
- Commerce
- Pricing
- Promotions and Discounts
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Creating a Promotion

The example below creates a promotion that reduces the price of all products in the catalog by 20% on the 4th of July. All accounts, account groups, channels, and order types are eligible for this promotion.

1. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Promotions*.

   ![Click on promotions from the Global Menu and create a new promotion.](./creating-a-promotion/images/01.png)

1. Click *Add* (![Add icon](../../images/icon-add.png)) and enter the following information.

   **Name:** 4th of July Promotion

   **Catalog:** Minium

   **Currency:** USD

   ![Enter a name, catalog, and currency for the new promotion.](./creating-a-promotion/images/02.png)

1. Click *Submit*.

This creates a new promotion on the selected catalog. Notice how there is a *Base Promotion List* for the catalog already available. Read [Using the Promotion Base List](./using-the-promotion-base-list.md) for more information.

![You can change the name of the promotion, assign a priority, and select the Parent Price List and the Price Type.](./creating-a-promotion/images/03.png)

In the Details section, you can change the name of the promotion, assign a priority, and select the Parent Price List and the Price Type. Since the promotion is for the 4th of July, you can set a schedule by selecting a *Publish Date* and *Expiration Date* from the Schedule section. Click *Publish* to activate the promotion. If there are multiple promotions applicable for an account, the promotion with higher priority has precedence over the others. See [Promotions Reference](./promotions-reference.md) for more information on specific fields.

## Adding a Price Modifier

In this example, the promotion reduces the price of all products in the catalog by 20%. To do this, you must add a price modifier.

1. Click the *Price Modifiers* tab.

1. Click *Add* (![Add icon](../../images/icon-add.png)) and enter the following information.

   **Name:** 20% Off

   **Target:** Catalog

   **Modifier:** Percentage

   ![Enter a name, target, and modifier for the new price modifier.](./creating-a-promotion/images/04.png)

1. Click *Submit*.

```{note}
You need not set an expiration date for the price modifier if you have already set an expiration date for the promotion itself.
```

You must now configure the new price modifier. Click the entry from the list and enter the percentage amount as -20. Then activate it using the *Active* toggle. After that, click *Save* and click *Publish*. See [Price Modifiers Reference](./promotions-reference.md#price-modifiers-reference) for more information.

![Configure the price modifier and activate it.](./creating-a-promotion/images/05.png)

This activates the promotion, and the prices of all products in the catalog are reduced by 20% on the scheduled date. If there are any active discounts available, they are calculated on the reduced price. If you are targeting a promotion at a specific product, use the Entries tab to add an entry and configure its price. You can also configure [Tiered Pricing or Bulk Pricing](../using-price-tiers.md#bulk-pricing-vs-tier-pricing) for it here. See [Adding Entries](./using-the-promotion-base-list.md#adding-entries) for more information.

![The prices of all products in the catalog are reduced by 20% on the scheduled date](./creating-a-promotion/images/06.png)

## Related Topics

* [Introduction to Promotions](./introduction-to-promotions.md)
* [Using the Promotion Base List](./using-the-promotion-base-list.md)
* [Promotions Reference](./promotions-reference.md)
