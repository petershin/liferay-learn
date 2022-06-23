# Creating Separate Catalog Pages for Individual Product Catalogs

You may have products from multiple catalogs in your storefront and want them displayed on separate Catalog Pages. For instance, one catalog may have products on sale while the other may have consumables. By default, the Catalog Page displays all the products from all catalogs. To separate them, you need to use a Custom Filter.

## Copying an Existing Catalog Page

Assuming you have the Minium site running, to copy a Catalog page, you must first enable Private Pages for your instance. This is only applicable for Liferay 7.4 U22+ and GA22+. See Enabling Private Pages for more information. If you are on an earlier version, you can follow the steps below directly.

1. Once the Private Pages are active, open the Site Menu and go to Site Builder → Pages.

1. Click Private Pages.

1. Click the 3-dot icon next to the Catalog Page and select Copy Page.

1. Enter a name for the new Catalog Page and click Add.

The new page appears in your storefront displaying the same contents as in the existing Catalog Page.

## Adding the Custom Filter

Before adding the custom filter, you must first retrieve the IDs of the catalogs you want to filter. To do this, open the Global Menu and go to Commerce -> Catalogs. Click on the catalog, and copy the ID present next to its name.

Go back to the Catalog Page and follow these instructions.

1. Click the Add button from the top menu.

1. In the Widgets section, search for the Custom Filter widget.

```{important}
If you are using a Content Page, there are two ways to add a widget.
Click the Edit () button from the top menu and click the Add () button on the right side. The rest of the steps are the same as above.
Open the Site Menu () and select Site Builder → Pages. Navigate to the desired page and click Actions () → Edit. The rest of the steps are the same as above.
```

1. Drag and drop the widget to the desired area in your storefront.

1. Hover over the widget and click the 3-dot icon and select Configuration.

1. Enter the following information and click Save.

Filter Field: commerceCatalogId

Filter Value: 43343 (Type the catalog ID you copied)

Filter Type: Match

Occur: Filter

1. Click Apply on the Custom Filter to apply the changes.

You should see products from only one catalog on the page. Repeat the above steps with a different catalog on the other catalog page.

```{note}
You can also disable the Custom Filter, make it immutable and invisible using the checkboxes inside the Configuration menu. You can use the Custom Filter for a wide range of use cases. See Custom Filter Examples for more information.
```
