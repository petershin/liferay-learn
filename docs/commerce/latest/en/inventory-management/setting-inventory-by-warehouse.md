---
uuid: 5673b1a0-1aa1-444e-88ee-9f54f0c67608
taxonomy-category-names:
- Commerce
- Inventory
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Setting Inventory by Warehouse

Stores with multiple warehouses can manage product inventory on a per warehouse basis. The inventory menu is where you can manage the number of products available to buy in each warehouse.

To set inventory by warehouse,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Products*.

1. Click a product.

1. Click the *SKUs* tab and select an SKU.

1. Click the *Inventory* tab.

1. Enter a quantity for the available warehouses. 

   {bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` If you have a [unit of measure](../product-management/creating-and-managing-products/products/units-of-measure.md) configured for the SKU, you can enter a quantity for each unit per warehouse.

   ![Enter the quantity of available units for an SKU in each warehouse.](./setting-inventory-by-warehouse/images/01.png)

1. Click *Save* for each warehouse.

1. Repeat these steps for other SKUs associated with the product.

Each warehouse now has the correct quantity available for sale.

## Transferring Stock Between Warehouses

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` If you have a [unit of measure](../product-management/creating-and-managing-products/products/units-of-measure.md) configured for the SKU, inventory is tracked by the configured unit for the SKU. Otherwise, inventory is tracked at the SKU level. This information is available on the inventory page. 

If your store has multiple warehouses, you can transfer stock from one warehouse to another.

To transfer stock between warehouses,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Inventory*.

1. Select an SKU.

1. Click *Add* (![Add Button](../images/icon-add.png)), then select *Create a Transfer*.

   ![You can transfer stock from one warehouse to another.](./setting-inventory-by-warehouse/images/02.png)

1. Enter a quantity, source, and destination.

   This example transfers 40 units of the selected SKU from the United States - Southwest warehouse to the United States - Northwest warehouse:

   * **Quantity**: 40
   * **Source**: United States - Southwest
   * **Destination**: United States - Northwest

   ![Enter the quantity, source, and destination to transfer stock.](./setting-inventory-by-warehouse/images/03.png)

1. Click *Submit*.

Inventory for each warehouse is now updated.

## Commerce 2.1 and Below

To set inventory by warehouse,

1. Navigate to the *Control Panel* &rarr; *Commerce* &rarr; *Products*.

1. Click a product.

1. Click the *SKUs* tab and select an SKU.

1. Click the *Inventory* tab.

1. Enter a quantity for the available warehouse(s).

   ![Enter the number of available units for an SKU in each warehouse.](./setting-inventory-by-warehouse/images/04.png)

1. Click *Save* for each warehouse.

1. Repeat these steps for all the other product variants (SKUs) associated for a product.

Each warehouse now has the correct quantity available for sale.

### Transferring Stock Between Warehouses

If a store has more than one [warehouse](./setting-up-warehouses.md), users can transfer stock from one warehouse to another. Inventory is tracked at the SKU level and reflected on the *Inventory* page.

To transfer stock between warehouses,

1. Navigate to the *Control Panel* &rarr; *Commerce* &rarr; *Inventory*.

1. Select an SKU.

1. Click the *Add* (![Add icon](../images/icon-add.png)) button, then *Create a Transfer*.

   ![Users can transfer stock between warehouses](./setting-inventory-by-warehouse/images/05.png)

1. Enter the following information to transfer 40 units of the selected SKU from the United States - Southwest warehouse to the United States - Northwest warehouse:

   * **Quantity**: 40
   * **Source**: United States - Southwest
   * **Destination**: United States - Northwest

   ![Enter the quantity, source, and destination to transfer stock.](./setting-inventory-by-warehouse/images/03.png)

1. Click *Submit*.

You can now view the updated inventory for each warehouse.

## Related Topics

* [Setting Up Commerce Warehouses](./setting-up-warehouses.md)
* [Inventory Management Reference Guide](./inventory-management-reference-guide.md)
