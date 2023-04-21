---
uuid: 7db077d3-aec1-400b-8475-62390f01bd47
---
# Using the Mini Cart Fragment

{bdg-secondary}`Available Liferay DXP 7.4 U69+/GA69+`

Liferay's mini cart fragment provides a detailed overview of your cart. You can use it to increase or decrease an product's quantity, delete products, submit the cart for checkout or use the quick add to cart functionality. 

<!-- Add link to Quick Add to Cart when ready -->

## Adding the Mini Cart Fragment to a Page

For the fragment to work correctly, you must at least have a catalog page, checkout page and an open carts page. After creating these pages, you can drag and drop the fragment on any page to reflect the status of the cart. Assuming you already have these 3 pages, 

1. Go to a page, then click _Edit_ (![Edit icon](../../images/icon-edit-pencil.png)) at the top. 

1. In the sidebar, navigate to the Fragments and Widgets menu (![Add Widget icon](../../images/icon-add-widget.png)) and type _mini cart_. 

   ![Search for the mini cart fragment from the Fragments and Widgets menu.](./using-the-mini-cart-fragment/images/01.png)

1. Drag and drop the mini cart fragment to the page. Do not mistake this fragment with the [Mini Cart](../liferay-commerce-widgets/using-the-mini-cart-widget.md) widget. 

1. Click _Publish_. 

   ![You can click the cart icon to open the mini cart.](./using-the-mini-cart-fragment/images/02.png)

The mini cart widget shows the status of the cart immediately. 

## Mini Cart Details

Once you've added the mini cart fragment on a page, 

1. Click _Add to Cart_ on a product. 

   ![Click Add to Cart on a product to add it to your mini cart.](./using-the-mini-cart-fragment/images/03.png)

1. Now, click the cart icon at the top right corner to open the mini cart. You can see the following details: 

   * Product Name
   * SKU
   * Quantity
   * Price
   * Subtotal
   * Subtotal Discount
   * Order Discount
   * Total

   ![The mini cart fragment gives a detailed overview of the current cart status.](./using-the-mini-cart-fragment/images/04.png)

The header area contains two buttons: 

* View Details - Click this to go to the Open Carts page containing more details about the open order. 
* Remove All Items - Click this, and click _Yes_ to clear your cart. 

The Product List area lists each product in the cart along with its quantity and price. You can click the Delete (![Delete](../../images/icon-delete.png)) button next to a product to delete it. You can increase or decrease the quantity of the product and the Cart Summary section updates automatically. Click _Submit_ to continue to check out. None of these buttons are available when the cart is empty. 

<!-- Add info and link to Quick Add to Cart when ready -->
