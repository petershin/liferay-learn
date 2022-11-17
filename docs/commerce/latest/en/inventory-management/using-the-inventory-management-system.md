# Using the Inventory Management System

{bdg-secondary} `Available Commerce 2.1+`

You can manage the entire inventory for your Liferay instance using the inventory management system.

Here are the features of the inventory management system that you can use for an SKU:

* Add inventory
* View orders
* Add a safety stock
* View historical changes

Inventory management is closely tied to the warehouses, from where you can view the available stock in each warehouse.

You can access the inventory page by opening the *Global Menu* and navigating to  *Commerce* &rarr; *Inventory*.

```{note}
If you're using Commerce 2.0 or 2.1, the *Inventory Management* option is located in the *Control Panel*.
```

## Adding an Inventory Item

Inventory is tracked at the SKU level. You can add multiple SKUs to the inventory and ensure that there is enough quantity available for each SKU.

To add an inventory item:

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Inventory*.

1. Click the Add(![Add Icon](../images/icon-add.png)) button and enter the following information:

   * **SKU**: CHINAWARE-GRAY
   * **Warehouse**: United States - Southwest
   * **Quantity**: 120

   ![Enter the SKU, warehouse and quantity for the new inventory item.](./using-the-inventory-management-system/images/01.png)

1. Click *Submit*.

This adds inventory for the SKU in the selected warehouse. Ensure that you enter a valid SKU in the SKU field.

```{important}
Each product in the inventory must be associated to at least one SKU.
```

## Setting a Safety Stock

Safety stock is product inventory that is physically located in a warehouse but is set aside and made unavailable for sale. This could be for situations like shipping delays, supply chain interruptions, selling in a different channel, or a number of other reasons. Safety stock quantity reduces the available inventory for the selected warehouse.

To set a safety stock quantity:

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Inventory*.

1. Click on an SKU.

1. Click the *Actions* (![Actions](../images/icon-actions.png)) icon next to the warehouse and select *Edit*.

1. Enter a value in the *Safety Stock Quantity* field.

   ![Set a safety stock quantity for the selected SKU.](./using-the-inventory-management-system/images/02.png)

1. Click *Save* when finished.

The number of units that are available gets reduced once a safety stock is set. You can verify this in the *Available* column.

![Setting a safety stock quantity reduces the available stock in that warehouse.](./using-the-inventory-management-system/images/03.png)

## Viewing a SKU on Order

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Inventory*.

1. Click on an SKU.

1. Click on the *On Order* tab.

   ![View all orders that include the selected SKU.](./using-the-inventory-management-system/images/04.png)

This page lists all orders that include the selected SKU. You can view the account that placed the order, the order ID, quantity and expiration date.

## Adding Incoming Stock

Incoming stock refers to stock that gets added to the inventory at a future date. You can add incoming stock quantities and its expected delivery date for an SKU.

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Inventory*.

1. Click on an SKU.

1. Click the *Incoming* tab.

1. Click the (![Add Icon](../images/icon-add.png)) icon and enter the following information:

    * **Quantity**: 20
    * **Destination**: United States - Northeast
    * **Expected Delivery Date**: 11/20/2022 (this is a future date)

   ![Add incoming stock for the selected SKU.](./using-the-inventory-management-system/images/05.png)

1. Click *Submit*.

After adding the incoming stock, it appears under the *Incoming* column in the *Overview* page.

![The incoming stock quantity appears on the SKU's Overview page.](./using-the-inventory-management-system/images/06.png)

## Viewing Inventory Changes

You can view changes in inventory for an SKU in the *Changelog* page. To view this:

1. Open the Global Menu and navigate to *Commerce* &rarr; *Inventory*.

1. Click on an SKU.

1. Click the *Changelog* tab.

You can view the following information in the changelog.

* The units of an SKU booked to fulfil an order after placing it.
* The units of an SKU removed from inventory after creating a shipment and committing the amount booked previously.
* The units of an SKU added to the inventory of a warehouse.
* The units of an SKU moved between warehouses.
* The units of an SKU returned after cancelling a shipment.
* Any updates to an SKU in the inventory.

![View different events associated to the inventory of the selected SKU.](./using-the-inventory-management-system/images/07.png)

## Additional Information

* [Inventory Management Reference Guide](./inventory-management-reference-guide.md)
* [Warehouse Reference Guide](./warehouse-reference-guide.md)
* [Setting Inventory by Warehouse](./setting-inventory-by-warehouse.md)
