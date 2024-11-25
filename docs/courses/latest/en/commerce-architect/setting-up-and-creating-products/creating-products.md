---
uuid: ab3a83f6-1401-48a2-818b-62f3e8dc0ef7
---
# Creating Products

Clarity offers a wide range of eyeglasses, lenses, sunglasses, and more to their customers. With Liferay’s out-of-the-box product management capabilities, you can create different kinds of products through a unified interface. Liferay also supports importing products from third party systems. Damian now needs your help to create a few products in the catalog. 

Start off by creating a simple product in the product catalog. You’ll create one of Clarity’s eyeglasses, Maliyah. 

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Products*.

1. Click *Add* (![Add](../../images/icon-add.png)) and enter this product:

   **Name:** Maliyah

   **Catalog:** Clarity Product Catalog

   ![Enter the name and catalog for the product.](./creating-products/images/01.png)

1. Click *Submit*.

This creates the product in draft status. You can publish it as it is, but you should do some basic configuration first.

## Basic Product Configuration

Let's add some details for the product. 

1. Under *Details*, enter the following description:

   ```
   Introducing our Maliyah eyeglasses, the perfect blend of style and functionality. These professional eyeglasses feature a sleek design with a sturdy frame, providing a sophisticated look for any occasion. Experience enhanced clarity and comfort with Maliyah, perfect for professionals and others seeking both fashion and practicality.
   ```

1. Under Categorization, click *Select* next to Clarity. Choose the *Eyeglasses* category. You can use these categories in facets when building the storefront. 

1. Go to the *SKUs* tab and select the `default` sku. Enter `CLA-EYE-FR-0003` in the SKU text field. 

1. Click *Publish*.

1. Navigate to the *Configuration* tab and enter the values below in the *Shipping* card.

   **Width:** 2

   **Height:** 6

   **Depth:** 1.5

   **Weight:** 0.22

1. Disable *Free Shipping* and *Ship Separately*.

1. In the Inventory card, for Low Stock Action choose *Set as Unpublished*.

1. Disable *Allow Back Orders* and *Display Stock Quantity*, and enable *Display Availability*. 

1. Set the *Maximum Order Quantity* as 5.

   ![Configure the basic details of the product.](./creating-products/images/02.png)

1. Go back to the *Details* tab and click *Publish*.

This publishes the product with some basic details. Now create two more products using the information below. Enable or disable the same toggles as with the product created earlier. 

| Product Name | Catalog                 | Category   | SKU             | Dimensions                      | Weight | Maximum Order Quantity | Low Stock Action   |
| :----------- | :---------------------- | :--------- | :-------------- | :------------------------------ | :----- | ---------------------- | ------------------ |
| Fleurette    | Clarity Product Catalog | Eyeglasses | CLA-EYE-FR-0004 | Width: 2, Height: 6, Depth: 1.5 | 0.22   | 5                      | Set as Unpublished |
| Lateefah     | Clarity Product Catalog | Eyeglasses | CLA-EYE-FR-0001 | Width: 2, Height: 6, Depth: 1.5 | 0.22   | 5                      | Set as Unpublished |

Congratulations! You've completed this module. In the next module, you’ll configure the products and its SKUs, add inventory, prices, and other necessary information to enrich the storefront experience.

[Back to Course](../../commerce-architect.md)
