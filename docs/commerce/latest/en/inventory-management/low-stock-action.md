---
uuid: ed5aa0f9-5de5-46a4-90ea-b66937d43880
---
# Low Stock Action

Low stock actions trigger when SKU inventory falls below a specific threshold. By default, Liferay includes the Set as Unpublished low stock action, which removes the product from the store when its inventory falls below the threshold. You can also create custom low stock actions. See [Implementing a Custom Low Stock Activity](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md) for more information.

To set up a low stock action for a product,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)), and navigate to *Commerce* &rarr; *Products*.

1. Select a product and navigate to the *Configuration* tab.

1. Under the inventory section, select a *Low Stock Action* from the drop-down menu.

1. Enter a *Low Stock Threshold* to determine the quantity that triggers the action.

   ![Select a low stock action and set the quantity that triggers the action.](./low-stock-action/images/01.png)

1. Click *Publish*.

Once configured, the low stock action runs whenever the product inventory falls below the set threshold.

## Commerce 2.1 and Below

To configure a low stock action,

1. Navigate to the *Control Panel* &rarr; *Commerce* &rarr; *Products*.

1. Click on a product and select the *Configuration* tab.

1. Under the inventory section, select a *Low Stock Action* from the dropdown menu.

1. Enter a *Low Stock Threshold* to determine the trigger quantity for the action.

1. Click *Publish*.

Once configured, the selected low stock action is triggered whenever the product inventory falls below the set threshold.

## Related Topics

* [Product Inventory Configuration Reference](./product-inventory-configuration-reference-guide.md)
* [Implementing a Custom Low Stock Action](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)
