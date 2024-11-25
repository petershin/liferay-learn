---
uuid: 10d9a3f9-79ee-42b1-9051-569123559108
taxonomy-category-names:
- Commerce
- Orders and Fulfillment
- Shipments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Canceling a Shipment

If a buyer cancels [an order](../orders/processing-an-order.md) before it is [shipped](./introduction-to-shipments.md), the seller may cancel the shipment in Liferay Commerce. Note that cancelling a shipment does **not** close an order. Managing an order's status is done on the _Orders_ menu in the Control Panel.

To cancel a shipment:

1. Navigate to the _Control Panel_ → _Commerce_ → _Shipments_.
2. Click the _3-dot icon_ next to the shipment to be canceled (for example, _42498_).

    ![Delete Button](./canceling-a-shipment/images/01.png)

3. Click _Delete_.
4. Click _OK_ in the confirmation window.

The shipment has been canceled.

![Shipment has been deleted](./canceling-a-shipment/images/02.png)

Canceling a shipment changes the status in the _Transmitted_ tab in the [_Orders_ menu](../orders/orders-menu-reference-guide.md).

![Updated Transmitted Tab](./canceling-a-shipment/images/03.png)

Note that if a new shipment is [created](./creating-a-shipment.md) from the same order, a new shipment number is generated (for example, _42888_).

## Related Topics

* [Shipments](../shipments.md)
* [Processing an Order](../orders/processing-an-order.md)
* [Creating a Shipment](./creating-a-shipment.md)
* [Orders Menu Reference Guide](../orders/orders-menu-reference-guide.md)
* [Order Information](../orders/order-information.md)
