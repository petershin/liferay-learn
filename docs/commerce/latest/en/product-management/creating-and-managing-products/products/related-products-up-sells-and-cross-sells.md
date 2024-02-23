---
uuid: 6b2e1fd0-e4dd-49a6-9dda-439655ac47ae
taxonomy-category-names:
- Commerce
- Products
- Product Information
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Related Products, Up-Sells, and Cross-Sells

You can use product relations to create links between products. After doing so, one product displays other linked products. To add a product relation, you must choose from one of the available relation types. Then you can use a product publisher and choose the appropriate relation type to display linked products relative to the product featured on the page.

When placing multiple product publisher widgets on a product detail page, multiple sets of related products may appear. For instance, one widget can display alternatives while another can display accessories to the product featured on the page.

Here is a list of product relations that come with the Minium and Speedwell site initializers:

**Up-Sell**: products with a higher sale value comparable to the featured product.

**Spare**: spare parts or components of the featured product.

**Related**: a catch-all set.

**Accessories**: add-on products for use in conjunction with the featured product.

**Cross-Sell**: products complementary to the featured product.

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+` There are two more product relations used in product bundles. See [Creating Bundles Containing Product Relations](./creating-product-bundles.md#creating-bundles-containing-product-relations) for more information.

## Adding a New Product Relation Type

If you're not using a site initializer or want more product relations, you can add them as needed.

1. Open the *Global Menu* (![Global Menu icon](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings*.

1. Go to *Commerce* &rarr; *Catalog* and choose *Product Relations* from the left menu.

1. Click *Add*.

1. Enter the name of the relation in the *Type* field.

   ![Adding a new product relation.](./related-products-up-sells-and-cross-sells/images/01.png)

1. Click *Save*.

## Creating Relationships Between Products

1. Open the *Global Menu* (![Global Menu icon](../../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Products*.

1. Select a product.

1. Go to *Product Relations*.

1. Click *Add* (![Add icon](../../../images/icon-add.png)) and select *Add Related Product*.

    ![Select a product relation to add to the product.](./related-products-up-sells-and-cross-sells/images/02.png)

1. Search for products and use the checkbox to select them.

1. Click *Add*.

   ![Adding two related products to the current product.](./related-products-up-sells-and-cross-sells/images/03.png)

The two products (Brake Fluid and Brake Rotors) are now associated with the selected product (Brake Pads). This relationship is unidirectional. You can see brake fluid and brake rotors as related products when viewing brake pads. But the opposite is not true. To display product relations, you must configure a product publisher widget.

## Displaying Product Relations

You can display product relations on a product display page by configuring a product publisher widget. You must have a [product display page](../../../creating-store-content/creating-product-display-pages.md) in place first.

1. After adding the product relations to a product and creating a product display page, go to the specific product's product display page.

1. Click *Edit* (![Edit icon](../../../images/icon-edit-pencil.png)) and add a product publisher widget below the product details widget.

1. Click *Actions* (![Actions icon](../../../images/icon-actions.png)) and select *Configuration*.

1. Select *Product Relations related* from the *Data Source* dropdown menu.

    ![Choosing a data source to display related products.](./related-products-up-sells-and-cross-sells/images/04.png)

1. Click *Save* and close the dialog box.

    ![The product publisher displays related products.](./related-products-up-sells-and-cross-sells/images/05.png)

The two related products appear in the product publisher widget. This is contextual and changes when you select a different product. If the chosen product doesn't have related products, the widget appears empty.

## Commerce 2.1 and Below

### Adding a New Product Relation Type

If you're not using a site initializer or want more product relations, you can add them as needed.

1. Go to the *Control Panel* &rarr; *Configuration* &rarr; *System Settings*.

1. Click *Catalog* in the *Commerce* section.

1. Click *Product Relations* on the left menu.

1. Click the *Add* button.

1. Enter the new Product Relation in the *Type* field: Warranties.

1. Click *Save*.

    ![Creating a new product relation.](./related-products-up-sells-and-cross-sells/images/06.png)

This adds a new product relation.

### Creating Relationships Between Products

1. Go to the *Control Panel* menu &rarr; *Commerce* &rarr; *Products*.

1. Select any product; for example, *Brake Pads*.

1. Click on the *Product Relations* sub-tab.

1. Click on *Related* in the left menu.

    ![Open the Related menu to configure related products.](./related-products-up-sells-and-cross-sells/images/07.png)

1. Click *Add* (![Add icon](../../images/icon-add.png)) to add one or more relationships.

1. Click *Add*.

    ![Adding two related products to the current product.](./related-products-up-sells-and-cross-sells/images/08.png)

The two products (Brake Fluid and Brake Rotors) are now associated with the selected product (Brake Pads). This relationship is unidirectional. You can see brake fluid and brake rotors as related products when viewing brake pads. But the opposite is not true. To display product relations, you must configure a product publisher widget.

### Displaying Product Relations

You can display product relations on a product display page by configuring a product publisher widget. You must have a [product display page](../../../creating-store-content/creating-product-display-pages.md) in place first.

1. Search for a product (for example *Brake Pads*).

1. Click *Brake Pads* to view the Product Details.

1. Scroll to the bottom of the page to view the related products listed in the *Product Publisher* widget.

   ![Open the configuration menu for the product publisher widget.](./related-products-up-sells-and-cross-sells/images/09.png)

1. Click *Actions* (![Actions icon](../../../images/icon-actions.png)) and select *Configuration*.

1. Select *Product Relations related* from the *Data Source* dropdown menu.

    ![Choosing a data source to display related products.](./related-products-up-sells-and-cross-sells/images/10.png)

1. Click *Save* and close the dialog box.

    ![The product publisher displays related products.](./related-products-up-sells-and-cross-sells/images/11.png)

The example above shows how different products could be related, ensuring that customers can see the full range of products that may also be potentially useful.
