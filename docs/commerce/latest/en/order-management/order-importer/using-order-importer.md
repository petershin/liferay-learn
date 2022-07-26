# Using Order Importer

You can create a new Order on a Minium site by clicking on the Account Selector from the top right and selecting *Create New Order*. You can also do this by going to the *Pending Orders* screen and clicking on *Add Order*.

## Importing Orders from a CSV File

To import Orders from a CSV file, you must first have the file containing Orders in a specific format. See the format below:

`sku, quantity, requestedDeliveryDate`

The `requestedDeliveryDate` is an optional field and is expected in the default format `yyyy-MM-dd`. See [Order Importer Configuration](#order-importer-configuration) to learn how to change the default behavior.

To import an Order from a CSV file:

1. Create a Minium site by opening the Global Menu and going to Control Panel &rarr; Sites. Click the Add button and select Minium.

1. Create a new Order. See Creating a New Order for more information.

1. This creates a new Order. Click on the 3-dot icon at the bottom right and select Import from CSV.

1. Click Select File and choose the CSV file you want to import from. You can also download a template file by clicking on Download Template.

1. Click Import once to preview the items in your Order and click Import once again to add them to your Order.

## Importing Orders from Wish lists

You can have Products in your wishlist that you want to add to an Order quickly. To do so, ensure that you have the desired Products in your wishlist first. See Using Wish Lists for more information.

1. Create a new Order and click on the 3-dot icon at the bottom right.

1. Select Import from Wish Lists and select the desired wishlist.

1. Click Select to preview the items in your Order and click Import to add them to your Order.

## Importing Orders from Past Orders

You can also import an Order from your past Orders.

1. Create a new Order and click on the 3-dot icon at the bottom right.

1. Select Import from Past Orders and select the appropriate Order.

1. Click Select to preview the items in your Order and click Import to add them to your Order.

## Order Importer Configuration

You can change the default CSV separator and the requested delivery date format for the Order Importer.

**Default CSV Separator:** Open the Global Menu and go to Control Panel &rarr; System Settings. Click on Orders and select Order Importer Types. Change the value under CSV Separator and click Save.

**Requested Delivery Date Format:** Open the Global Menu and go to Control Panel &rarr; Instance Settings. Click on Orders and select Order Importer Date Format Configuration. Change it to the desired format and click Save.
