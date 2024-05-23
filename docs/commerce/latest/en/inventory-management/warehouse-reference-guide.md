---
uuid: a3fa7293-cbde-44fb-8a6f-aaa94b054309
taxonomy-category-names:
- Commerce
- Inventory
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Warehouse Reference Guide

To manage warehouses, open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Warehouses*.

```{note}
If you're using Commerce 2.0 or 2.1, the warehouse settings are located in the *Control Panel*.
```

## Details

![Enter a name and description for the warehouse and activate it using the toggle.](./warehouse-reference-guide/images/01.png)

| Field       | Description                                 |
| :---------- | :------------------------------------------ |
| Name        | Name of the warehouse                       |
| Description | Description of the warehouse                |
| Active      | Toggle to activate/deactivate the warehouse |

## Channels

By default a warehouse doesn't serve any channels. To use a warehouse in a channel, click the *Eligibility* tab and select the *Specific Channels* radio button. Then, search for the channel and click *Select*.

![Set the warehouse to serve one or more channels.](./warehouse-reference-guide/images/02.png)

### Liferay DXP 7.4 U46/GA46 and Below

Under *Channels*, you can view the available channels that the warehouse can serve. Use the checkbox to select the desired channels.

![Check the channels that the warehouse must serve.](./warehouse-reference-guide/images/03.png)

| Field    | Description                                             |
| :------- | :------------------------------------------------------ |
| Channels | List of available channels that the warehouse can serve |

## Address

![Set the warehouses's address.](./warehouse-reference-guide/images/04.png)

| Field       | Description                                   |
| :---------- | :-------------------------------------------- |
| Street 1    | First line of address                         |
| Street 2    | Second line of address                        |
| Street 3    | Third line of address                         |
| Country     | Dropdown menu to select a country             |
| Region      | Drop-down menu to select the state or province |
| Postal Code | Field for postal code                         |
| City        | Field for city                                |

## Geolocation

![Set the warehouses' geolocation.](./warehouse-reference-guide/images/05.png)

| Field     | Description                           |
| :-------- | :------------------------------------ |
| Latitude  | Latitude coordinate of the warehouse  |
| Longitude | Longitude coordinate of the warehouse |

The FedEx shipping method uses the warehouse's geolocation to calculate shipping costs during checkout. When there are multiple warehouses, the Liferay instance chooses the warehouse with the lowest shipping cost.

## Related Topics

* [Introduction to Shipments](../order-management/shipments/introduction-to-shipments.md)
* [Setting Up Commerce Warehouses](./setting-up-warehouses.md)
* [Setting Inventory by Warehouse](./setting-inventory-by-warehouse.md)
