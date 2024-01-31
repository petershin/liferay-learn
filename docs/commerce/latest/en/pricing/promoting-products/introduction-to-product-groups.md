---
uuid: aa12ca7c-9806-414a-9e6b-d403131e089c
taxonomy-category-names:
- Commerce
- Pricing
- Promotions and Discounts
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Introduction to Product Groups

Product groups are static groups of products you can use for targeted discounts or pricing. Product groups are ideal in two scenarios:

1. If you have products that are not part of a single category and want them to be priced differently for specific customers.

1. If you have products that are not part of a single category and want them to be discounted differently for specific customers.

```{note}
Product groups don’t change the way Products are grouped or displayed for the buyer and are used for administrative purposes. 
```

## Creating a Product Group

1. Open the Applications Menu ![Applications Menu](../../images/icon-applications-menu.png), and navigate to _Commerce_ &rarr; _Product Groups_.

1. Click _Add_ (![Add](../../images/icon-add.png)) and enter a name and description for the product group.

    ![Enter details for the product group.](./introduction-to-product-groups/images/01.png)

1. Click _Submit_.

This creates a product group. 

## Adding Products to a Product Group

Once the product group is created, you must add products to it. Below you'll select two products and add them to the product group so they can be used for targeted pricing or discounts.

1. Use the _Add Products_ search bar to find the products you want to add. The options appear automatically based on what you type.

   ![Search for products to be added to the product group.](./introduction-to-product-groups/images/02.png)

1. Click _Select_ next to the product of your choice to add it to the group.

This product group can now be linked to a Price List or Discount.

```{note}
Apart from adding products to a product group, you can also link a product group to a product. To do this, select the product of your choice from the products list, select the product groups tab, and search for the product group you created. Click *Select* next to the product group of your choice to link the product group with the product.
```

## Linking a Discount to a Product Group

1. Click the Applications Menu &rarr; _Commerce_ tab, and go to _Pricing_ &rarr; _Discounts_.

1. Click _Add_ (![Add](../../images/icon-add.png)) and enter the following information:

    __Name__: Example Product Group Discount

    __Type__: Percentage

    __Apply To__: Product Groups

    ![Enter details for a Discount.](./introduction-to-product-groups/images/03.png)

1. Click _Submit_.

    This creates a new Discount and can be applied to product groups.

    In the Details page of the Discount, you can alter the type, add an amount, and set the active status and level for your discount. Read [Introduction to Discounts](./introduction-to-discounts.md) for more information. Once the discount is created, you must link it to the product group you created earlier.

1. Scroll down to the Select Product Group section on the Discount's Details page.

    ![Search for the product group to be added to the Discount.](./introduction-to-product-groups/images/04.png)

1. Type the name of the product group you created earlier. It automatically populates the results based on what you type.

1. Click _Select_ next to the product group. Once added, click _Publish_ to activate the discount for your product group.

You can validate it by checking the Product in your catalog to view the discount.

![The discount is applied to the product in the product group.](./introduction-to-product-groups/images/05.png)

## Linking a Price List to a Product Group

To link a price list to a product group, you must first create a price list and then create a price modifier that targets the product group you created.

1. Open the Applications Menu ![Applications Menu](../../images/icon-applications-menu.png), &rarr; _Commerce_ tab and go to _Pricing_ &rarr; _Price Lists_.

1. Click _Add_ (![Add](../../images/icon-add.png)) and enter a name, catalog, and currency for your price list.

    ![Configure the price list.](./introduction-to-product-groups/images/06.png)

1. Click _Submit_ when done.

1. Click _Add_ (![Add](../../images/icon-add.png)) under the price modifiers section and enter the following information.

    __Name__: Wheels Modifier

    __Target__: Product Groups

    __Modifier__: Percentage/Replace/Fixed Amount

    ![Configure the price modifier.](./introduction-to-product-groups/images/07.png)

1. Click *Submit* when done.

    ![Detailed configuration view of the price modifier.](./introduction-to-product-groups/images/08.png)

    This creates the price modifier and opens a more detailed view to configure it.

    ```{note}
    The amount mentioned in a price modifier is not considered as a discount. For instance, if you select the Percentage modifier and set the amount to 10, it raises the price of the product by 10%. To reduce the price, use a negative percentage.
    ```

    ```{important}
    If there are two price lists that target the same product, you must create the new price list with a higher priority for the changes to take effect.
    ```

    ![Search for the product group to be added to the price modifier.](./introduction-to-product-groups/images/09.png)

1. Under the product groups section, search for the product group you created. It auto-populates the results based on what you type.

1. Click _Select_ next to the product group. Once added, click _Publish_ to activate the price list for your product group.

You can validate it by checking the product in your catalog to view the updated price.

![The price modifier is applied to the product in the product group.](./introduction-to-product-groups/images/10.png)

To view whether a discount or price list has been linked to a product group, click the _Applications Menu_ ![Applications Menu](../../images/icon-applications-menu.png), click the _Commerce_ tab, and go to _Pricing_ &rarr; _Product Groups_. Under price lists and discounts, you can see the associated entities.

## Related Topics

* [Introduction to Discounts](./introduction-to-discounts.md)
* [Introduction to Pricing](../introduction-to-pricing.md)
* [Creating a Price List](../creating-a-price-list.md)
* [Adding Products to a Price List](../adding-products-to-a-price-list.md)
