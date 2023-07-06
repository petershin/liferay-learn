---
uuid: 370f3ac0-72a0-4e7a-a731-36e094f220ac
---
# Order Splitting

Sometimes an order may contain multiple product lines or products that are fulfilled by different suppliers. In such cases, you may want to split an order into sub-orders that are fulfilled independently. To do this in Liferay, you can use order splitting. Order splitting is enabled at a catalog level, so if you have an order that contains products from different catalogs, they are split into multiple sub-orders. 

## Enabling the Order Splitting Object Action

You have to run a health check to create the object action associated with the commerce order system object. 

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Health Check*. 

1. Find the *Order Split by Catalog Action* health check. 

1. Click *Fix Issue*.

This creates the object action on the commerce order system object. 

## Activating Order Splitting

After creating the object action, 

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Objects*. 

1. Select the *Commerce Order* object and click *Action*. 

1. Select *Split order by catalog*.

1. Enable it using the *Active* toggle.

1. Click *Save*.

This enables order splitting for all orders that contain products from different catalogs. 

## Order Splitting Concepts

### Customer Order

Assume that a customer places an order with 2 products, each from a different catalog. It shows up as a single entry in the *Placed Orders* page. This is the original customer order. This order gets split only when you accept the order from the *Orders* application. 

### Supplier Order

Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Orders*. You can see a single entry for the customer order. Select the order and click on *Accept Order*. This is when the object action on the commerce order object gets executed. Go back to the Orders page and there are three entries now. One entry denoting the customer order and two entries denoting the supplier orders. If there were three products in the original order from three different catalogs, there would be a total of four entries (one customer order + three supplier orders). The customer does not see the supplier orders.

### Splitting Discounts

To be fair to all suppliers fulfilling a split order, discounts are split between suppliers using the percentage value of the supplier order in comparison to the original order. This applies to discounts on the order total and subtotal. See the illustration below:

![Discount is split using the percentage value of the supplier order in comparison to the original order.](./order-splitting/images/01.png)

The original order's total value is $100 and has a fixed order discount of $10. It is split into between two suppliers, A and B, with values $25 and $75 respectively. The discount is split among these two suppliers based on the percentage value of the supplier order with respect to the original order. Here, supplier A's order value of $25 makes up 25% of the original order value. Therefore, supplier A's order gets a discount that is 25% of the original discount. 

```{note}
The above illustration is valid only for fixed discounts. For percentage discounts, the percentage amounts are deducted from each supplier order. 
```

## Fulfilling Split Orders

From a customer perspective, there is no change in how information appears. Only administrators can view the supplier orders from the *Placed Orders* screen after splitting. The customer only sees the orders they placed. 

When the supplier makes changes to the supplier order, it is directed back to the customer order as well. For example, if one supplier ships their order and updates the tracking number for one of the shipments, this is visible to the customer for that product. The order status moves from processing to partially shipped. 