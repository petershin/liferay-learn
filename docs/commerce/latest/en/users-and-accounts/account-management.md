---
toc:
  - ./account-management/creating-a-new-account.md
  - ./account-management/inviting-users-to-an-account.md
  - ./account-management/adding-addresses-to-an-account.md
  - ./account-management/account-roles.md
  - ./account-management/creating-a-new-account-group.md
  - ./account-management/using-organizations-to-create-a-sales-network.md
  - ./account-management/adding-organizations-to-accounts.md
uuid: 330f5754-723b-447f-af50-ba7e058e0add
taxonomy-category-names:
- Commerce
- Security
- User, Organization, and Account Management
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Account Management

{bdg-secondary}`Available Liferay 7.3 and Below`

In Liferay, accounts store customer information, such as billing and shipping addresses, order details, and VAT number. Once created, accounts can be sorted into groups based on shared criteria (e.g., geographic region). These account groups can be used to target customers with specific price lists, promotions, and discounts.

!!! important
    Starting from Liferay 7.4, accounts are a part of DXP. See [Accounts](https://learn.liferay.com/w/dxp/users-and-permissions/accounts) for more information.

## Account Types

Liferay provides three account types: Business, Personal, and Guest. Business and personal accounts are used based on the [site type](../starting-a-store/sites-and-site-types.md) (i.e., B2B, or B2C). Guest accounts are used in B2C or B2X sites.

* **Business Accounts**: Business accounts can have multiple users associated with them. You can assign these users [account roles](./account-management/account-roles.md) to delegate responsibilities on behalf of the account. In a B2B site, customers must be associated with a business account to make purchases.

* **Personal Accounts**: Personal accounts can only be associated with a single user. In a B2C site, authenticated customers are assigned a personal account automatically and can make purchases individually.

  !!! note
       The profile information on a Liferay user account is imported to the personal account at the time of creation. Any additional updates to the Liferay user account are not propagated automatically to the personal account.

* **Guest Accounts**: Customers that want to make purchases without creating an account on your site can use a guest account. This is created during guest checkout. See [Guest Checkout](../store-management/guest-checkout.md) for more information.

## Related Topics

* [Sites and Site Types](../starting-a-store/sites-and-site-types.md)
* [Account Roles](./account-management/account-roles.md)
