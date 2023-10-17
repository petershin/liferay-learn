---
uuid: d7c73320-1a2a-4dc4-b23d-f0db867316ce
---
# Creating a Checkout Page

Before you can check out and submit an order, you must have a checkout page. This is also necessary for the mini cart fragment to work correctly. 

## Creating a New Page

1. Open the *Product Menu* (![Product Menu](../../images/icon-product-menu.png)), and navigate to *Site Builder* &rarr; *Pages*.

1. To add a child page, click *Add* (![Add](../../images/icon-plus.png)) next to the shop page and click *Add Page*.

1. Select the master page template.

1. Enter the name as `Checkout` and click *Add*. This opens the new page in edit mode.

## Applying the CSS Client Extension

You must now configure the created page to use your deployed client extension:

1. Open the Checkout page and click *Edit* (![Edit](../../images/icon-edit.png)) at the top.

1. In the sidebar, navigate to the *Page Design Options* menu (![Page Design Options icon](../../images/icon-format.png)) and click the *Configuration* (![Configuration](../../images/icon-format.png)) icon at the top of the menu.

1. In the CSS Client Extensions section toward the bottom of the page, click *Add CSS Client Extensions*.

1. Select your CSS client extension from the pop-up modal and click *Add*.

1. Click *Save*.

## Customizing the Checkout Page

1. Open the Checkout page in edit mode.

1. Drag and drop a container on the page. Change the Container Width to *Fixed Width*.

1. In the Advanced section, give it the CSS class `p-3`.

1. Drag and drop a *Heading* fragment and a *Separator* fragment below it.

1. Set the header title to `Checkout` and the Heading Level to *H3*.

1. In the Advanced section of the header fragment, add the `text-center` and `mb-1` CSS classes. 

1. Click on the separator fragment and go to the Advanced section. Add the `section-text-line` and `mb-5` CSS classes.

1. Drag and drop the *Checkout* widget inside the fixed width container.

The checkout page is now ready to use.

## Adding the Coupon Code Widget

Next, you must add the coupon code widget to the Checkout page so that customers can enter discount codes during checkout. 

1. Open the Checkout page in edit mode.

1. Drag and drop a *Coupon Code* widget below the checkout title.

1. In the Advanced section of the header fragment, add the `border`, `border-3`, `rounder`, `p-4`, `mb-5`, and `text-center` CSS classes.

1. Click *Publish*.

![Customers can enter a coupon code and checkout their orders.](./creating-a-checkout-page/images/01.png)

## Adding the Mini Cart Fragment to the Header

Once you have created the Orders page and Checkout page, you can add the mini cart fragment to the page header. The mini cart fragment requires you to have these pages to work correctly. 

1. Open the *Product Menu* (![Product Menu](../../images/icon-product-menu.png)) and navigate to *Design* &rarr; *Page Templates*.

1. Select the master page template.

1. Select the Grid in the header and change the Number of Modules to *4*.

1. Resize the grid as shown in the image below. 

   ![Resize the header to add the mini cart fragment.](./creating-a-checkout-page/images/02.png)

   The module for the logo and the nav links should be the same size as before. The search module is one size less to accommodate the mini cart fragment.

1. Drag and drop the *Mini Cart* fragment inside the last module of the grid.

1. In the Advanced section of the mini cart fragment, add the `mb-5` CSS class. 

1. Click *Publish Master*.

Next: [Creating a Discount and Enabling Guest Checkout](./creating-a-discount-and-enabling-guest-checkout.md)
