---
uuid: f61d7526-596d-4885-8ddc-43b5874c9e7c
---
# Adding Product Specifications

Damian, the category manager, wants to enrich the products with attributes that give more information to customers. You can use product specifications to achieve this. You'll add the following specifications to the products. 

<!-- Who is Damian? I don't see his name on the [spreadsheet](https://docs.google.com/spreadsheets/d/1VodP25SdctCb2n1Z3ZfMAroK28lk8fHX2Kj63g4EEaE/edit#gid=0). You should have a first step of logging in as Damian, and he should have a last name that begins with D. -->

* Active Ingredient
* Country of Origin
* Flavor
* Ingredients
* Suitable for Vegans

<!-- Ah, this stinks. Would've been really cool. What are we going to come up with for Clarity? You may have figured it out already, but here's some brainstorming: 

- Material (steel, bronze, titanium, plastic)
- Style (rectangle, square, round, aviator, oval, cat-eye, browline, oversized, geometric)
- Country of Origin
- Size (adult, child)
- Comes with case (yes, no)

-Rich -->

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Specifications*.

1. Click *Add* (![Add](../../images/icon-add.png)) under Specification Labels and enter these details:

   **Label:** Active Ingredient

   **Use in Faceted Navigation:** Enabled

   ![Create a new specification label for active ingredient.](./adding-product-specifications/images/01.png)

1. Click *Save*.

This creates a new specification called active ingredient. Now, create the following four specifications following the steps above:

* Country of origin
* Flavor
* Ingredients
* Suitable for vegans.

For ingredients, you must disable the *Use in Faceted Navigation* toggle. 

## Adding Specifications to Products

The next step is to add these specifications to products. You can do this through the product configuration page.

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Products*.

1. Select *Sap Infused Maple Syrup*.

1. Scroll down to the *Specifications* section.

1. Search for *Active Ingredient* and click *Select*.

   ![Search for the specification to add it to a product.](./adding-product-specifications/images/02.png)

   This adds the specification to the product. Now, you must enter the value for the specification.

1. Click on the added specification and enter *Sap Extract* as the value. 

1. Click *Save*.

1. Following the steps above, add these specifications to the same product. 

   | Specification       | Specification Value                                                                            |
   | :------------------ | :--------------------------------------------------------------------------------------------- |
   | Country of Origin   | United States                                                                                  |
   | Flavor              | Original                                                                                       |
   | Ingredients         | Water, Thickeners, Natural Flavoring, Salt, Sap Extract, Sweetener (Sucralose), Preservatives  |
   | Suitable for Vegans | Yes                                                                                            |

1. Now, add the following specifications to the other two products:

   | Product                        | Specifications                                                                                                                      |
   | :----------------------------- | :---------------------------------------------------------------------------------------------------------------------------------- |
   | Sap Infused Orange Maple Syrup | Active Ingredient: Orange Extract                                                                                                   |
   |                                | Country of Origin: United States                                                                                                    |
   |                                | Flavor: Orange                                                                                                                      |
   |                                | Ingredients: Water, Thickeners, Natural Flavoring, Salt, Sap Extract, Sweetener (Sucralose), Natural Orange Extract, Preservatives  |
   |                                | Suitable for Vegans: Yes                                                                                                            |
   | Sap Infused Honey Maple Syrup  | Active Ingredient: Honey                                                                                                            |
   |                                | Country of Origin: Mexico                                                                                                           |
   |                                | Flavor: Honey                                                                                                                       |
   |                                | Ingredients: Water, Thickeners, Natural Flavoring, Salt, Sap Extract, Sweetener (Sucralose), Natural Honey, Preservatives           |
   |                                | Suitable for Vegans: No                                                                                                             |

Next: [Adding Options](./adding-options.md)

## Related Topics

* [Specifications](https://learn.liferay.com/web/guest/w/commerce/product-management/creating-and-managing-products/products/specifications)
