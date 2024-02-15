---
uuid: 8d7aa25e-a7ee-4cce-91c8-fe111e98dc3c
taxonomy-category-names:
- Security
- User, Organization, and Account Management
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Account Addresses

{bdg-secondary}`Available 7.4+`

Account addresses are the billing or shipping addresses associated with a Business account or a Person account.

## Adding an Account Address

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Accounts*.

1. Select an account by clicking its name, or click _Options_ (![Options icon](../../images/icon-actions.png)) on the account and click _Edit_.

1. Click the _Addresses_ tab. Click the _Add_ icon (![Add icon](../../images/icon-add.png)) to add a new address.

1. Fill out the add address form. Select whether the address is a billing address, shipping address, or both. Note that Name, Type, Country, Street 1, City, and Postal Code are required fields.

   ![Fill out the add address from.](./account-addresses/images/01.png)

   Click *Save* to save the address.

## Editing an Account Address

1. Under the _Addresses_ tab, click the _Options_ icon (![Options icon](../../images/icon-actions.png)) of the address and click _Edit_. Use the filter tool to filter addresses by billing addresses or shipping addresses. Use the search bar to locate a specific address quickly.

   ![Click the address's Options icon and click edit.](./account-addresses/images/02.png)

1. Make your changes and click *Save*.

## Setting Default Account Addresses

1. Under the _Details_ tab, click *Set Default Address* either under Billing or Shipping.

   ![Click Set Default Address under Billing or Shipping.](./account-addresses/images/03.png)

1. A new window opens. Select an address from the list and click *Save*. Your default address is now set for the account.

## Address Eligibility

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

By default, an account's address is eligible for all channels. You can control address eligibility in the _Eligibility_ tab.

1. Select _Specific Channels_.
1. Search for a channel and click _Select_.
1. Click _Save_.

![Choose the eligible channels for the selected address.](./channels-reference-guide/images/04.png)

If an address is only eligible for a specific channel, it can't be selected during checkout in ineligible channels. The address cannot be selected on all orders coming from ineligible channels for the selected account.
