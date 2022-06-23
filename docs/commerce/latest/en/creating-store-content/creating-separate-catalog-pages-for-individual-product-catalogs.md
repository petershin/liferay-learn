# Creating Separate Catalog Pages for Individual Product Catalogs

You may have products from multiple catalogs in your storefront and want them displayed on separate Catalog Pages. For instance, one catalog may have products on sale while the other may have consumables. By default, the Catalog Page displays all the products from all catalogs. To separate them, you need to use a Custom Filter.

## Copying an Existing Catalog Page

Assuming you have the Minium site running, to copy a Catalog Page, you must first enable Private Pages for your instance. This is only applicable for Liferay DXP 7.4 U22+ and GA22+. See Enabling Private Pages for more information. If you are on an earlier version, you can follow the steps below directly.

1. Once the Private Pages are active, open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)) and go to *Site Builder* &rarr; *Pages*.

1. Click *Private Pages*.

1. Click the *3-dot icon* (![3-dot icon](../images/icon-actions.png)) next to the Catalog Page and select *Copy Page*.

1. Enter a name for the new Catalog Page and click *Add*.

The new page appears in your storefront displaying the same contents as in the existing Catalog Page.

## Adding the Custom Filter

Before adding the custom filter, you must first retrieve the IDs of the catalogs you want to filter. To do this, open the *Global Menu* (![Applications Menu icon](../images/icon-applications-menu.png)) and go to *Commerce* &rarr; *Catalogs*. Click on the catalog, and copy the ID present next to its name.

![Copy the Catalog ID to filter products in the Catalog Page.](./creating-separate-catalog-pages-for-individual-product-catalogs/images/01.png)

Go back to the Catalog Page and follow these instructions.

1. Click the *Add* button from the top menu.

1. In the *Widgets* section, search for the *Custom Filter* widget.

   ```{important}
   If you are using a Content Page, there are two ways to add a widget.
   1. Click the *Edit* button (![Edit button](../images/icon-edit-pencil.png)) from the top menu and click *Add* (![Add icon](../images/icon-add.png)) on the right side. The rest of the steps are the same as above.

   2. Open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)) and select *Site Builder* &rarr; *Pages*. Navigate to the desired page and click the *3-dot icon* (![3-dot icon](../images/icon-actions.png)) &rarr; *Edit*. The rest of the steps are the same as above.
   ```

1. Drag and drop the widget to the desired area in your storefront.

1. Hover over the widget and click the *3-dot icon* (![3-dot icon](../images/icon-actions.png)) and select *Configuration*.

1. Enter the following information and click *Save*.

   **Filter Field:** commerceCatalogId

   **Filter Value:** 43345 (Type the catalog ID you copied)

   **Filter Type:** Match

   **Occur:** Filter

   ![Configure the Custom Filter widget.](./creating-separate-catalog-pages-for-individual-product-catalogs/images/02.png)

1. Click *Apply* on the Custom Filter to apply the changes.

You should see products from only one catalog on the page. Repeat the above steps with a different catalog on the other catalog page.

```{note}
You can also disable the Custom Filter, make it immutable and invisible using the checkboxes inside the *Configuration* menu. You can use the Custom Filter for a wide range of use cases. See Custom Filter Examples for more information.
```
