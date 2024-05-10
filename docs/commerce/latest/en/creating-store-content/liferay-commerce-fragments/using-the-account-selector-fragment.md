---
uuid: 65b4cc84-7474-473a-a399-1fa6231051ed
taxonomy-category-names:
- Commerce
- Storefronts
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using the Account Selector Fragment

{bdg-secondary}`Liferay DXP 7.4 U72+/GA72+`

The Account Selector fragment provides an easy way for users to switch between their accounts when browsing products and creating orders.

```{tip}
The fragment works best when you have the [catalog](../commerce-storefront-pages/catalog.md), [open cart](../commerce-storefront-pages/pending-orders.md), and [checkout](../commerce-storefront-pages/checkout.md) pages.
```

## Adding the Account Selector Fragment to a Page

1. Go to the desired content page or template and click _Edit_ (![Edit icon](../../images/icon-edit-pencil.png)).

1. In the Fragments and Widgets sidebar (![Add Widget icon](../../images/icon-add-widget.png)), search _account selector_.

   ![Search for the Account Selector fragment in the Fragments and Widgets sidebar.](./using-the-account-selector-fragment/images/01.png)

1. Drag and drop the fragment onto the page. Do not mistake this fragment with the [Account Management widget](https://learn.liferay.com/w/dxp/users-and-permissions/accounts/account-management-widget).

1. Click _Publish_.

   ![Click the account icon to open the account selector.](./using-the-account-selector-fragment/images/02.png)

The account selector immediately shows the user's selected account, if any exists.

## Account Selector Details

After adding the account selector fragment to a page, you can click the account icon to open it. Here you can access the accounts you have permission to manage. You can also create a new order from the account selector by clicking the _Create New Order_ button. For this to work correctly, you must have an [Open Carts page](../commerce-storefront-pages/pending-orders.md).

When you have an active order, the account selector fragment displays the order number and its status right below the account name. If there's an active workflow, the order is created with the _Draft_ status.

![Open the account selector to create a new order or switch between accounts.](./using-the-account-selector-fragment/images/03.gif)

## Related Topics

[Catalog](../commerce-storefront-pages/catalog.md)

[Pending Orders](../commerce-storefront-pages/pending-orders.md)

[Checkout](../commerce-storefront-pages/checkout.md)
