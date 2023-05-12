---
uuid: bf0d7ce5-eba6-44af-b58c-48c0c80bfcfb
---
# Channel Defaults Permissions Reference

{bdg-secondary}`Available Liferay DXP 7.4 U75+/GA75+`

Setting channel defaults for an account ensures that addresses, shipping options, terms and conditions, and payment methods are pre-selected during checkout. This ensures a smooth checkout experience and results in faster creation of orders. Only users with specific permissions can change these during checkout. Users without permissions won't see the associated checkout steps. 

## Checkout Flow Permissions

The following permissions determine which users can add or modify addresses and change the payment methods and shipping options during checkout. 

### Permission to View and Manage Addresses

| Permissions                                                            | Description                                                                                                                    |
| :--------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------- |
| Commerce > Order Management > Commerce Orders > View Billing Address   | Ability to view the billing address.                                                                                           |
| Control Panel > Accounts > Accounts > Account Entry > Manage Addresses | A user with this permission can view addresses during checkout. They can also add new addresses and edit the pre-selected one. |

If you don't have the first permission, you cannot view the billing address during checkout and in the following pages:

* Order Summary
* Placed Orders
* Pending Orders

If you have the view permission, you can view the billing address in the pages above but cannot edit or create new addresses during checkout. To do that, you need the second permission. 

### Permission to Manage Payment Methods

| Permissions                                                                           | Description                                                                                   |
| :------------------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------- |
| Commerce > Order Management > Commerce Orders > Manage Commerce Order Payment Methods | Ability to change the payment methods based on the available payment methods for the channel. |

When you have one or more active payment methods available for the channel, the highest priority eligible payment method is pre-selected. If you have the permission, you can change between the available payment methods, if not, the checkout step isn't shown. 

### Permission to Manage Shipping Options

| Permissions                                                                            | Description                                                                                     |
| :------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------- |
| Commerce > Order Management > Commerce Orders > Manage Commerce Order Shipping Options | Ability to change the shipping options based on the available shipping options for the channel. |

When you have one or more active shipping options available for the channel, the highest priority eligible option is pre-selected. If you have the permission, you can change between the available shipping options, if not, the checkout step isn't shown. 

## Related Topics

* [Channel Defaults](../channel-defaults.md)
* [Channel Defaults Permissions Reference](./channel-defaults-permissions-reference.md)
* [Introduction to Channels](https://learn.liferay.com/web/guest/w/commerce/store-management/channels/introduction-to-channels)