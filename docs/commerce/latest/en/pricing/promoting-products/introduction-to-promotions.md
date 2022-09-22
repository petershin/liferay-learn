# Introduction to Promotions

You can create *Promotions* in Liferay to offer promotional pricing to all customers or a set of customers. A Promotion visually shows the difference between a product's list price and its promotion price. This is useful to highlight the discount a customer is receiving and to support multiple prices for individuals or groups of customers.

![A Promotion showing difference between a product's list price and its promotion price](./introduction-to-promotions/images/01.png)

```{note}
Prior to Liferay DXP 7.4 U42/GA42, Promotion Price was called Sale Price.
```

## Eligibility

You can define a promotional price for all or a specific set of customers by clicking the *Eligibility* tab and selecting the appropriate option. You can narrow down the Promotion based on the *Account*, *Account Group*, *Channel* or *Order Type*.

![Use the Eligibility tab to narrow down your promotion to specific Accounts, Account Groups, Channels, or Order Types.](./introduction-to-promotions/images/02.png)

## Entries

You can use the *Entries* tab to define Promotions for specific SKUs. Click the *Entries* tab, search for an SKU and click Select. Once selected, click on the SKU from the Entries section and add a Promotion Price. See [Adding Entries](./using-the-promotion-base-list.md#adding-entries) for more information.

## Price Modifiers

*Price Modifiers* can adjust the price of a range of products by a fixed amount or percentage. Price Modifiers makes it easy to maintain a Promotion by calculating the promotional price using the Product’s base price. If you have an entry as well as a Price Modifier that targets the same SKU, the price in the entry has precedence over the Price Modifier.

You can use Price Modifiers to target a *Catalog*, *Category*, *Product Group* or *Product*. The Price Modifier is applied to all Products in the Target group. This is unlike in the Entries section where you must target each SKU specifically. See [Adding a Price Modifier](./creating-a-promotion.md#adding-a-price-modifier) for more information.

## Promotions and Price Lists

Promotions are similar to Price Lists in functionality but they are used together to determine the discount price. See the diagram below to understand the calculation.

![Calculation of a product's active price.](./introduction-to-promotions/images/03.png)

Once the active price of a Product is determined, Discounts are then applied on the active price. See [Introduction to Discounts](./introduction-to-discounts.md) for more information.

If you want to offer special pricing to a customer that is lower than the usual price for other customers, you can use both Price Lists and Promotions but a Price List does not show the reduction in price. See the image below.

![Comparison of a product's price with a Promotion and a Price List.](./introduction-to-promotions/images/04.png)

## Additional Information

* [Creating a Promotion](./creating-a-promotion.md)
* [Using the Promotion Base List](./using-the-promotion-base-list.md)
* [Promotions Reference](./promotions-reference.md)
