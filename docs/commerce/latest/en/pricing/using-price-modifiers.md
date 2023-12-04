---
uuid: 23fd9ec3-6981-429b-adf7-60f62aea992e
---
# Using Price Modifiers

Price modifiers target the prices set in a price list and modify them based on the criteria configured. Price modifiers can target catalogs, product groups, categories, and products. You can use modifiers to replace the amount, modify it by a percentage, or modify it by a fixed value. 

## Adding Price Modifiers to a Price List

1. Open the *Global Menu* (![Applications Menu icon](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Price Lists*.

1. Select the *Price List* you want to configure, and go to the *Price Modifiers* tab.

1. Click *Add* (![Add icon](../images/icon-add.png)).

1. Enter a *Name* for the modifier.

1. Determine a *Target* for the price modifier:

   * **Catalog**: Apply the modifier to all products in the current catalog.
   * **Categories**: Apply the modifier to all products within a specific category.
   * **Products**: Apply the modifier to products individually.
   * **Product Groups**: Apply the modifier to all products within specific product groups.

1. Determine the type of *modifier* used:

   * **Percentage**: Modify targeted prices by a certain percentage.
   * **Fixed Amount**: Modify targeted prices by a fixed amount.
   * **Replace**: Override targeted prices with a fixed value.

1. Click on *Submit* when finished.

Once created, you can finish configuring the modifier by clicking on it in the Price Modifiers tab.

```{note}
Available configuration options vary depending on the selected target for your modifier.
```

## Configuring a Modifier's General Information

Follow these steps to configure a Price Modifier's general details:

1. Click on the *Price Modifier* you want to edit, and go to the *Info* tab.

1. Enter an *Amount* to use for the selected type of modifier.

1. Optionally, manually enter the price modifier's Priority, which is used as a tie breaker in the case of multiple matches.

1. Slide the *Active* toggle to *YES*.

1. Optionally, you can *schedule* when the price modifier takes effect, as well as if and when it expires.

1. Click on *Save* when finished.

   ![Configure the price modifier.](./using-price-modifiers/images/01.png)

## Configuring a Modifier's Target

Once you've determined a price modifier's general details, additional configuration options are available based on the modifier's target. Each modifier can target products, product groups, or categories.

Follow these steps to configure a price modifier's target:

1. Click on the *Price List* you want to configure, and go to the *Price Modifiers* tab.

1. Click on the additional editing tab (e.g., *Categories*, *Products*, or *Product Groups*).

1. Use the provided search bar to locate the desired target for the modifier, and then click on *Select* to make them subject to the price modifier.

   ![Click on Select to add them to the price modifier.](./using-price-modifiers/images/02.png)

1. After selecting the desired targets, return to the *Info* tab, and click on *Save*.

## Related Topics

* [Introduction to Pricing](./introduction-to-pricing.md)
* [Creating a Price List](creating-a-price-list.md)
* [Adding Products to a Price List](adding-products-to-a-price-list.md)
