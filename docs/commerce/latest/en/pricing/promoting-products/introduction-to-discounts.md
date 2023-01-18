# Introduction to Discounts

Discounts are price reductions you can apply to products and orders to offer incentives to customers. When creating a discount, you determine whether to reduce the set price by a percentage or flat rate and set the discount's scope:

| Discount Scope  | Description                                                                                                                                                   |
| :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Categories      | Applies to all products in a [category](../../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md). |
| Products        | Applies to selected products.                                                                                                                                 |
| Product Groups  | Applies to all products in the same group.                                                                                                                    |
| Shipments       | Applies to shipping costs.                                                                                                                                    |
| SKUs            | Applies to specified SKUs.                                                                                                                                    |
| Subtotal        | Applies to order subtotals, usually before applying taxes and other fees.                                                                                     |
| Total           | Applies to order totals.                                                                                                                                      |

Once created, you can determine which channels, accounts, and order types are eligible for receiving the discount and define rules to specify requirements for qualifying. By default, Commerce applies discounts automatically, but you can make them available to customers as coupon codes. Also, when configuring discounts, you can schedule when they take effect and expire.

See [Creating Discounts](./creating-a-discount.md) to get started or [Introduction to Pricing](../introduction-to-pricing.md) to learn how discounts contribute to Commerce's pricing engine.

## Coupon Codes

Regardless of the discount type you choose, you can ask users to enter a coupon code to qualify for the discount. After enabling a coupon code, you can share it through emails, newsletters, or ads.

![Activate the Coupon Code feature and enter a coupon code for this discount type.](./introduction-to-discounts/images/01.png)

To accept coupon codes, you must add the *Coupon Code Entry* widget on a store's [Checkout](../../creating-store-content/commerce-storefront-pages/checkout.md) page. The checkout page is available out-of-the-box on the [Minium site](../../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md).

![Place the Coupon Code Entry widget on the Checkout page.](./introduction-to-discounts/images/02.png)

After applying the coupon code, you can view the updated prices in the order summary section.

![You can view the updated prices in the order summary section.](./introduction-to-discounts/images/03.png)

## Expiration Date

You can configure discounts to have expiration dates that coincide with promotional efforts.

![Configure the expiration date for a discount to coincide with a promotion.](./introduction-to-discounts/images/04.png)

## Discount Rules

You can define rules that specify requirements to qualify for a discount. There are three rules available out-of-the-box:

| Rule                      | Description                                                                                         |
| :------------------------ | :-------------------------------------------------------------------------------------------------- |
| Cart Total                | Cart subtotal must meet a minimum threshold to receive the discount.                                |
| Has all of these products | Orders must include all specified products in order to receive the discount.                        |
| Has one of these products | Orders must contain at least one product from a list of specified products to receive the discount. |

You can add discount rules in the *Rules* section. Developers can also [implement new discount rules](../../developer-guide/promotions/adding-a-new-discount-rule-type.md).

When using either *Has all of these products* or *Has one of these products* rules, select which products in the catalog are eligible for the discount.

![The available discount rule types.](./introduction-to-discounts/images/05.png)

## Discount Levels

You can create discount levels for applying multiple discounts to products and orders. Commerce applies these discounts consecutively according to their level. For instance, you can create a level 1 discount offering 20% off and then create a level 2 discount that offers an additional 5% off if the cart value exceeds 50$. To do this on a Minium site,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Discounts*.

1. Click the *Add* (![Add button](../../images/icon-add.png)) button and enter the following information.

   **Name:** U-Joint Clearance

   **Type:** Percentage

   **Apply To:** Products

1. Click *Submit*. This opens a new page with options to configure the discount.

1. Enter the *Amount* as 20 and keep the default *Level* value (L1).

1. In the *Products* section, search for *U-Joint* and click *Select*.

1. Enable the discount using the *Active* toggle.

1. Click *Publish*. This creates the base discount of 20% for the product (U-Joint)

1. Return to the Discounts application page and repeat steps 2-3 to create another discount with a different name.

1. Enter the *Amount* as 5, and set the *Level* to L2.

1. In the *Products* section, search for *U-Joint* and click *Select*.

1. In the *Rules* section, click the *Add* (![Add button](../../images/icon-add.png)) button.

1. Enter a name and set the type to *Cart Total*.

1. Click *Submit*.

1. Edit the rule and set the *Cart Total Minimum Amount* to 50$ and click *Save*.

1. Click *Publish*.

Go to your site and open the product page for u-joint. It should have a base discount of 20% applied to it. Now, add more units to your cart so that the total exceeds 50$. Check the price again to verify the additional discount applied to your cart.

## Additional Information

* [Introduction to Pricing](../introduction-to-pricing.md)
* [Creating a Discount](./creating-a-discount.md)
