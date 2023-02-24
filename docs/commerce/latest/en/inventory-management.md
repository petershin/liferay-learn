---
toc:
  - ./inventory-management/setting-up-warehouses.md
  - ./inventory-management/setting-inventory-by-warehouse.md
  - ./inventory-management/low-stock-action.md
  - ./inventory-management/availability-estimates.md
  - ./inventory-management/managing-product-publication.md
  - ./inventory-management/using-the-inventory-management-system.md
  - ./inventory-management/inventory-management-reference-guide.md
  - ./inventory-management/warehouse-reference-guide.md
  - ./inventory-management/product-inventory-configuration-reference-guide.md
  - ./inventory-management/developer-guide.md
uuid: 0af96bfe-53b9-4ae1-bd1f-a372afb783a2
---
# Inventory Management

```{toctree}
:maxdepth: 1

inventory-management/setting-up-warehouses.md
inventory-management/setting-inventory-by-warehouse.md
inventory-management/low-stock-action.md
inventory-management/availability-estimates.md
inventory-management/managing-product-publication.md
inventory-management/using-the-inventory-management-system.md
inventory-management/inventory-management-reference-guide.md
inventory-management/warehouse-reference-guide.md
inventory-management/product-inventory-configuration-reference-guide.md
inventory-management/developer-guide.md
```

{bdg-secondary}`Available Commerce 2.1+`

Liferay's inventory management tools can support a wide range of commerce use cases, from a single storefront with one warehouse to multiple sales channels with geographically distributed warehouses.

Here are Liferay's inventory management features:

* Create and manage warehouses
* Set availability estimates
* Configure low stock actions
* Set SKU inventory by warehouse

You can use the inventory management system to track your inventory in a single place. See [Using the Inventory Management System](./inventory-management/using-the-inventory-management-system.md) for more information.

## Warehouses

Warehouses represent physical locations where you can manage product inventory and source them for order fulfillment. A single SKU may be available in more than one warehouse, and inventory is managed on a per-warehouse basis.

See [Setting Up Commerce Warehouses](./inventory-management/setting-up-warehouses.md) and [Warehouse Reference Guide](./inventory-management/warehouse-reference-guide.md) for more information on managing warehouses.

For a store to accept orders, the related channel must have a warehouse associated with it. Read [Introduction to Channels](../store-management/channels/introduction-to-channels.md) to understand how channels work.

## Setting Inventory by Warehouse

In Liferay, inventory is managed per SKU. Read [Setting Inventory by Warehouse](./inventory-management/setting-inventory-by-warehouse.md) for more information.

```{important}
Each product in the inventory must be associated to at least one SKU.
```

## Low Stock Actions

A low stock action performs an action when available product inventory reaches a specific threshold. Read [Low Stock Action](./inventory-management/low-stock-action.md) to learn how to configure the action that is executed when inventory reaches a minimum threshold.

Developers interested in creating their own custom low stock action can read [Implementing a Custom Low Stock Activity](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md).

## Availability Estimates

You can configure availability estimates for products that are out of stock. This informs customers when it becomes available again. Read [Availability Estimates](./inventory-management/availability-estimates.md) for more information.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Setting up Warehouses
:link: ./inventory-management/setting-up-warehouses.md
:::

:::{grid-item-card}  Setting Inventory by Warehouse
:link: ./inventory-management/setting-inventory-by-warehouse.md
:::

:::{grid-item-card}  Low Stock Action
:link: ./inventory-management/low-stock-action.md
:::

:::{grid-item-card}  Availability Estimates
:link: ./inventory-management/availability-estimates.md
:::

:::{grid-item-card}  Managing Product Status
:link: ./inventory-management/managing-product-status.md
:::

:::{grid-item-card}  Using the Inventory Management System
:link: ./inventory-management/using-the-inventory-management-system.md
:::

:::{grid-item-card}  Inventory Management Reference Guide
:link: ./inventory-management/inventory-management-reference-guide.md
:::

:::{grid-item-card}  Warehouse Reference Guide
:link: ./inventory-management/warehouse-reference-guide.md
:::

:::{grid-item-card}  Product Inventory Configuration Reference Guide
:link: ./inventory-management/product-inventory-configuration-reference-guide.md
:::

:::{grid-item-card}  Developer Guide
:link: ./inventory-management/developer-guide.md
:::
::::
