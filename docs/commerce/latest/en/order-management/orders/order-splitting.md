---
uuid: 370f3ac0-72a0-4e7a-a731-36e094f220ac
---
# Order Splitting

Sometimes an order may contain multiple product lines or products that are fulfilled by different suppliers. In such cases, you may want to split an order into sub-orders that are fulfilled independently. To do this in Liferay, you can use order splitting. Order splitting is enabled at a catalog level, so if you have an order that contains products from different catalogs, they are split into multiple sub-orders.

## Enabling Order Splitting

To enable order splitting, 

1. Open the Global Menu and navigate to *Control Panel* &rarr; *Objects*. 

1. Select the *Commerce Order* object and click *Action*. 

1. Select *Split order by catalog*.

1. Enable it using the *Active* toggle.

1. Click *Save*.

## Customer Order vs Supplier Order

### Customer Order

For simplicity, let's assume the customer places an order with 2 products, each from a different catalog. It shows up as a single entry in the Placed Orders screen. This order gets split only when you accept the order from the Orders application. 

### Supplier Order

Open the Global Menu and navigate to *Commerce* &rarr; *Orders*. You can see a single entry for the customer order. Select the order and click on *Accept Order*. This is when the object action on the commerce order object gets executed. Go back to the Orders page and now you should see three entries. One entry for the customer order and two entries for the supplier orders. If there were three products in the order from three different catalogs, there would be a total of four entries (one customer order + three supplier orders). 

## Fulfilling Split Orders

From a customer perspective, there is no change in how information appears. Only administrators can view the supplier orders from the Placed Orders screen after splitting. A buyer only sees the order they placed. 