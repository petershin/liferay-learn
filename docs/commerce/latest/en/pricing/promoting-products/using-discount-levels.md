# Using Discount Levels

You can create discount levels for applying multiple discounts to products and orders. Commerce applies these discounts consecutively according to their level. For instance, you can create a level 1 discount offering 20% off and then create a level 2 discount that offers an additional 5% off if the cart value exceeds 50$. To do this on a Minium site,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Discounts*.

   ![Open the Global Menu and navigate to the Discounts application.](./using-discount-levels/images/01.png)

1. Click the *Add* (![Add button](../../images/icon-add.png)) button and enter the following information.

   **Name:** U-Joint Clearance

   **Type:** Percentage

   **Apply To:** Products

1. Click *Submit*. This opens a new page with options to configure the discount.

1. Enter the *Amount* as 20 and keep the default *Level* value (L1).

   ![Enter the Amount as 20 and keep the default Level value (L1)](./using-discount-levels/images/02.png)

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

   ![Enter 50 as the Cart Total Minimum Amount value and click Save.](./using-discount-levels/images/03.png)

1. Click *Publish*.

Go to your site and open the product page for u-joint. It should have a base discount of 20% applied to it. Now, add more units to your cart so that the total exceeds 50$. Check the price again to verify the additional discount applied to your cart.

![The product has a level 1 discount and the level 2 discount gets applied when the cart total exceeds 50$.](./using-discount-levels/images/04.gif)

```{note}
The discount levels present when overriding a price list or promotion list entry is not the same as the discount levels shown above. If enabled, they override discounts without considering any of the rules configured in the *Discounts* page. You can provide up to four percentage values when overriding a discount and they are applied in sequence. 
```
