---
uuid: 8976db69-45ce-47b6-b13f-90820a7599e4
taxonomy-category-names:
- Commerce
- Products
- Product Information
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Managing BOMs

> Subscription Required

Bill of Materials (BOM) diagrams identify component parts belonging to a product. Users can create and annotate BOM diagrams in Liferay Commerce that reference products in the store. BOM diagrams can then be displayed on a Site page.

BOM diagrams are comprised of two parts: the Diagram and Mapped Products.

```{important}
BOMs are no longer available starting from Liferay Commerce 4.0. They are replaced by a more robust Shop by Diagram feature. Read [Shop by Diagram](../product-types/shop-by-diagram.md) for more information. 
```

## Adding a New BOM Diagram

To add a new BOM diagram:

1. Go to the _Global Applications_ menu &rarr; _Commerce_ &rarr; _Bill of Materials_.
1. Click Add (![Add Icon](../../../images/icon-add.png)) then _Add Definition_.
1. Click _Select File_ or drag and drop the product image.
1. Enter a name for the product (Generic Diesel Engine).
1. Click _Save_.

## Mapping Products to a BOM Diagram

Once the image has been uploaded, map the parts to the products in the catalog.

1. Click the _Entries_ tab.

    ![Click the Entries tab to view and map entries to the image.](./managing-boms/images/02.png)

2. The _Mapped Products_ pane on the right lists all subparts. When users hover the mouse over the diagram, a plus sign appears.

    ![A new Product can be mapped to the BOM by clicking on the plus sign.](./managing-boms/images/03.png)

3. Click on the part of the diagram that is associated with product (for example, _Fuel Injector 1_).

4. Enter this information:

    * **Number**: 1 (numeric ordering of the mapped product list)
    * **Product**: MIN59999 (the product name or SKU)

      ```{tip}
      Text auto-complete shows suggestions as you type in the name of a product.
      ```

    ![Begin associating products in the BOM diagram.](./managing-boms/images/04.png)

5. Click _Save_.

Continue adding the rest of the products. Each entry must have a unique numeric identifier in the list of Mapped Products, even if there is more than one of the same product. In this example, there are two fuel injectors and both have a distinct product mapping number.

![Continue to associating products in the BOM diagram.](./managing-boms/images/05.png)

## Displaying a BOM on a Site Page

The Commerce BOM widget is used to display BOM diagrams.

1. Navigate to the desired store site page and add the BOM widget. The BOM widget displays all created BOMs and folders.

    ![Deploy the BOM widget on site page.](./managing-boms/images/06.png)

1. In the BOM Widget, select a BOM definition by clicking a BOM thumbnail.

    ![The Commerce BOM widget displays the diagram.](./managing-boms/images/07.png)

The BOM widget displays the diagram.

## Adding BOM Folders

You can create folders to group and organize your store's BOMs.

To add a folder:

1. Click Add (![Add Icon](../../../images/icon-add.png)) then _Add Folder_.
1. Enter the following:
    * **Name**: Folder name (Car parts)
1. Click _Save_.

## Commerce 2.1 and Below

### Adding a New BOM Diagram

To add a new BOM diagram:

1. Navigate to the _Control Panel_ &rarr; _Commerce_ &rarr; _Products_.
1. Click _BOM_.

    ![BOM Admin menu](./managing-boms/images/01.png)

1. Click Add (![Add Icon](../../../images/icon-add.png)) then _Add Definition_.
1. Click _Select File_ or drag and drop the product image.
1. Enter a name for the product (Generic Diesel Engine).
1. Click _Save_.

### Mapping Products to a BOM Diagram

1. Click the _Entries_ tab.

    ![BOM Entries tab](./managing-boms/images/02.png)

1. The _Mapped Products_ pane on the right lists all subparts. When users hover the mouse over the diagram, a plus sign appears.

    ![BOM Entries tab](./managing-boms/images/03.png)

1. Click on the part of the diagram that is associated with product (for example, _Fuel Injector 1_).

1. Enter the following:

    * **Number**: 1 (numeric ordering of the mapped product list)
    * **Product**: MIN59999 (the product name or SKU)

      ```{tip}
      Text auto-complete will show suggestions as you type in the name of a product.
      ```

    ![Begin associating products in the BOM diagram.](./managing-boms/images/04.png)

1. Click _Save_.

Continue adding the rest of the products. Each entry must have a unique numeric identifier in the list of Mapped Products, even if there is more than one of the same product. In this example, there are two fuel injectors and both have a distinct product mapping number.

![Continue to associating products in the BOM diagram.](./managing-boms/images/05.png)

### Displaying a BOM

The Commerce BOM widget is used to display BOM diagrams.

1. Navigate to the desired store site page and add the BOM widget. The BOM widget displays all created BOMs and folders.

    ![Deploy the BOM widget on site page.](./managing-boms/images/06.png)

1. In the BOM Widget, select a BOM definition by clicking a BOM thumbnail.

    ![The Commerce BOM widget displays the diagram.](./managing-boms/images/07.png)

The BOM widget displays the diagram.

### Adding a BOM Folder

You can create folders to group and organize your store's BOMs.

To add a folder:

1. Click Add (![Add Icon](../../../images/icon-add.png)) then _Add Folder_.
1. Enter the following:
    * **Name**: Folder name (Car parts)
1. Click _Save_.

## Related Topics

* [Creating SKUs for Product Variants](./creating-skus-for-product-variants.md)
* [Adding a Page to a Site](https://learn.liferay.com/w/dxp/site-building/creating-pages/adding-pages/adding-a-page-to-a-site)
* [Adding Widgets to a Page](https://learn.liferay.com/w/dxp/site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page)
