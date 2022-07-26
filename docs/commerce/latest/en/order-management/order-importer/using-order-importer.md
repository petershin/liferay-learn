# Using Order Importer

You can create a new Order on a Minium site by clicking on the Account Selector from the top right and selecting *Create New Order*. You can also do this by going to the *Pending Orders* screen and clicking on *Add Order*.

![Create a new Order by clicking on the Create New Order button or the Add Order button.](./using-order-importer/images/01.png)

## Importing Orders from a CSV File

To import Orders from a CSV file, you must first have the file containing Orders in a specific format. See the format below:

`sku,quantity,requestedDeliveryDate`

The `requestedDeliveryDate` is an optional field and is expected in the default format `yyyy-MM-dd`. See [Order Importer Configuration](#order-importer-configuration) to change the default behavior.

To import an Order from a CSV file:

1. Create a Minium site by opening the Global Menu (![Applications Menu icon](../../images/icon-applications-menu.png)) and going to Control Panel &rarr; Sites. Click the Add button and select Minium.

1. Create a new Order and click on the 3-dot icon (![3-dot icon](../../images/icon-actions.png)) at the bottom right and select *Import from CSV*.

   ![Click on Import from CSV to import Orders from a CSV file.](./using-order-importer/images/02.png)

1. Click *Select File* and choose the CSV file you want to import. You can also download a template file by clicking on *Download Template*.

   ![You can download a template or select the CSV file to import Orders from.](./using-order-importer/images/03.png)

1. Click *Import* once to preview the items in your Order and click *Import* once again to add them to your Order.

   ![Click Import to preview and import the Orders to your new Order.](./using-order-importer/images/04.gif)

## Importing Orders from Wish lists

You can have Products in your wishlist that you want to add to an Order quickly. To do so, ensure that you have the desired Products in your wishlist first. See [Using Wish Lists](../../creating-store-content/using-wish-lists.md) for more information.

1. Create a new Order and click on the 3-dot icon (![3-dot icon](../../images/icon-actions.png)) at the bottom right.

1. Select *Import from Wish Lists* and select the desired wishlist.

   ![Click on Import from Wish Lists to import Orders from a wishlist.](./using-order-importer/images/05.png)

1. Click *Select* to preview the items in your Order and click *Import* to add them to your Order.

   ![You can preview the items in your Order and click Import to add them to your Order.](./using-order-importer/images/07.gif)

## Importing Orders from Past Orders

You can also import an Order from your past Orders.

1. Create a new Order and click on the 3-dot icon (![3-dot icon](../../images/icon-actions.png)) at the bottom right.

1. Select *Import from Past Orders* and select the appropriate Order.

   ![Click on Import from Past Orders to import Orders from a past Order.](./using-order-importer/images/06.png)

1. Click *Select* to preview the items in your Order and click *Import* to add them to your Order.

   ![You can preview the items in your Order and click Import to add them to your Order.](./using-order-importer/images/08.gif)

## Order Importer Configuration

You can change the default CSV separator and the requested delivery date format for the Order Importer.

**Default CSV Separator:** Open the Global Menu (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to *Control Panel* &rarr; *System Settings*. Click on *Orders* and select *Order Importer Types*. Change the value under *CSV Separator* and click *Save*.

![Use the Default CSV Separator configuration to change the default CSV separator.](./using-order-importer/images/09.png)

**Requested Delivery Date Format:** Open the Global Menu (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to *Control Panel* &rarr; *Instance Settings*. Click on *Orders* and select *Order Importer Date Format Configuration*. Change it to the desired format and click *Save*.

![Use the Requested Delivery Date Format configuration to change the default Requested Delivery Date format.](./using-order-importer/images/10.png)
