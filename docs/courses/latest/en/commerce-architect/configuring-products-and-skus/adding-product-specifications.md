---
uuid: f61d7526-596d-4885-8ddc-43b5874c9e7c
---
# Adding Product Specifications

Damian wants to enrich the products with attributes that give more information to customers. In Liferay, you can use product specifications to achieve this. Damian wants your help to add the following specifications to the products. 

* Active Ingredient
* Country of Origin
* Flavor
* Ingredients
* Suitable for Vegans

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Specifications*.

1. Click the *Add* (![Add](../../images/icon-add.png)) button under *Specification Labels* and enter the following details:

   **Label:** Active Ingredient

   **Use in Faceted Navigation:** Enabled

   ![Create a new specification label for active ingredient.](./adding-product-specifications/images/01.png)

1. Click *Save*.

This creates a new specification called active ingredient. Now, create four more specifications for country of origin, flavor, ingredients, and suitable for vegans. For ingredients, you must disable the *Use in Faceted Navigation* toggle. 

## Adding Specifications to Products

You must now add these specifications to products after creating them. You can do this through the product configuration page.

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Products*.

1. Select *Sap Infused Maple Syrup* created earlier.

1. Scroll down to the *Specifications* section.

1. Search for *Active Ingredient* and click *Select*.

   ![Search for the specification to add it to a product.](./adding-product-specifications/images/02.png)

   This adds the specification to the product. Now, you must enter the value for the specification.

1. Click on the added specification.

1. Enter value as Sap Extract. 

1. Click *Save*.

1. Following the steps above, add these specifications to the same product. 

   | Specification       | Specification Value                                                                            |
   | :------------------ | :--------------------------------------------------------------------------------------------- |
   | Country of Origin   | United States                                                                                  |
   | Flavor              | Original                                                                                       |
   | Ingredients         | Water, Thickeners, Natural Flavouring, Salt, Sap Extract, Sweetener (Sucralose), Preservatives |
   | Suitable for Vegans | Yes                                                                                            |

1. Now, add the following specifications to the other two products:

   | Product                        | Specifications                                                                                                                      |
   | :----------------------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
   | Sap Infused Orange Maple Syrup | Active Ingredient: Orange Extract                                                                                                   |
   |                                | Country of Origin: United States                                                                                                    |
   |                                | Flavor: Orange                                                                                                                      |
   |                                | Ingredients: Water, Thickeners, Natural Flavouring, Salt, Sap Extract, Sweetener (Sucralose), Natural Orange Extract, Preservatives |
   |                                | Suitable for Vegans: Yes                                                                                                            |
   | Sap Infused Honey Maple Syrup  | Active Ingredient: Honey                                                                                                            |
   |                                | Country of Origin: Mexico                                                                                                           |
   |                                | Flavor: Honey                                                                                                                       |
   |                                | Ingredients: Water, Thickeners, Natural Flavouring, Salt, Sap Extract, Sweetener (Sucralose), Natural Honey, Preservatives          |
   |                                | Suitable for Vegans: No                                                                                                             |

Next: [Adding Options](./adding-options.md)

## Related Topics

* [Specifications](https://learn.liferay.com/web/guest/w/commerce/product-management/creating-and-managing-products/products/specifications)
