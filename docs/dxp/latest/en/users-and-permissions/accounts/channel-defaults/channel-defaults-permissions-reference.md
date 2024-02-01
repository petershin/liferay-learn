---
uuid: bf0d7ce5-eba6-44af-b58c-48c0c80bfcfb
taxonomy-category-names:
- Security
- User, Organization, and Account Management
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Channel Defaults Permissions Reference

{bdg-secondary}`Liferay DXP 7.4 U75+/GA75+`

Setting channel defaults for an account ensures that addresses, shipping options, terms and conditions, and payment methods are pre-selected for checkout. This can provide a smoother checkout experiences and faster order creation.

Only users with specific permissions can change these defaults at checkout. Users without these permissions do not see the associated checkout steps.

## Checkout Flow Permissions

Users with the following permissions can change an account's billing address, payment methods, and shipping options during checkout.

### Billing Addresses

| Permissions                                                            | Description                                                                                                                        |
|:-----------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------|
| Commerce > Order Management > Commerce Orders > View Billing Address   | View an account's billing address during checkout and in these pages: Order Summary, Placed Orders, and Pending Orders. |
| Control Panel > Accounts > Accounts > Account Entry > Manage Addresses | View, add, and edit an account's addresses during checkout.                                                             |

### Payment Methods

| Permissions                                                                           | Description                                                                                      |
| :------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------------------- |
| Commerce > Order Management > Commerce Orders > Manage Commerce Order Payment Methods | Change an account's payment methods based on the channel's available payment methods. |

When one or more payment methods are active for the channel, the highest priority eligible payment method is pre-selected. With this permission, you can choose an alternative payment method. Otherwise, this checkout step does not appear.

### Shipping Options

| Permissions                                                                            | Description                                                                                        |
| :------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------- |
| Commerce > Order Management > Commerce Orders > Manage Commerce Order Shipping Options | Change an account's shipping options based on the channel's available shipping options. |

When one or more shipping options are active for the channel, the highest priority eligible option is pre-selected. With this permission, you can choose an alternative shipping option. Otherwise, this checkout step does not appear.

## Related Topics

[Channel Defaults](../channel-defaults.md)

[Setting Channel Defaults](./setting-channel-defaults.md)

[Channels](https://learn.liferay.com/web/guest/w/commerce/store-management/channels)