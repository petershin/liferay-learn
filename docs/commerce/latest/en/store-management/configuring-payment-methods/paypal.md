---
uuid: 20cb9df9-03c9-4d4c-9e47-9c92abef6d6a
taxonomy-category-names:
- Commerce
- Storefronts
- Payment
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# PayPal

To use PayPal as a payment method in your store, you must have a merchant ID and also generate a PayPal client ID and client secret. Visit the [PayPal Developer Dashboard](https://developer.paypal.com/developer/applications/create) for more information. Once you have the required details,

1. Open the _Global Menu_ (![Applications Menu icon](../../images/icon-applications-menu.png)) and navigate to _Commerce_ &rarr; _Channels_.

1. Select the channel and scroll down to the Payment Methods section.

1. Click _PayPal_.

1. Use the _Active_ toggle to activate the payment method and click _Save_. Two new tabs for Eligibility and Configuration appear.

1. Go to _Configuration_.

1. Enter the details from your PayPal Developer Dashboard for the Client ID, Client Secret, and Merchant ID fields.

1. In the Mode drop-down, select _Live_ if it's a live site or _Sandbox_ if it's a test environment.

!!! note
    The [Merchant ID](https://www.paypal.com/us/cshelp/article/how-do-i-find-my-secure-merchant-id-on-my-paypal-account-help538) field is only available for business accounts in PayPal. 

1. Click _Save_.

PayPal is now enabled for your store.

## PayPal Subscriptions

To use [subscriptions](../../order-management/subscriptions/managing-subscriptions.md) with PayPal, you must activate the PayPal Subscriptions payment method.

1. Open the _Global Menu_ (![Applications Menu icon](../../images/icon-applications-menu.png)) and navigate to _Commerce_ &rarr; _Channels_.

1. Select the channel and scroll down to the Payment Methods section.

1. Click _PayPal Subscriptions_.

1. Use the _Active_ toggle to activate the payment method and click _Save_. Two new tabs for Eligibility and Configuration appear.

1. Go to _Configuration_.

1. In the Mode drop-down, select _Live_ if it's a live site or _Sandbox_ if it's a test environment.

1. {bdg-secondary}`Liferay DXP 7.4 U3+/GA7+` In the Request Details drop-down, select _Request Details Full_ or _Request Details Minimal_ (see below).

1. In the _Payment Attempts Max Count_ field, enter the number of attempts to make payment on a subscription before canceling the subscription.

1. Click _Save_.

**Request Details Full:** Sends a complete request required for the payment contract mapped to PayPal's [`PurchaseUnitRequest`](https://github.com/paypal/Checkout-Java-SDK/blob/develop/checkout-sdk/src/main/java/com/paypal/orders/PurchaseUnitRequest.java).

**Request Details Minimal:** Sends a minimal request required for the payment contract mapped to PayPal's [`PurchaseUnitRequest`](https://github.com/paypal/Checkout-Java-SDK/blob/develop/checkout-sdk/src/main/java/com/paypal/orders/PurchaseUnitRequest.java).

* For more information, read PayPal's [Reattempt failed recurring payments with Subscribe buttons](https://developer.paypal.com/docs/paypal-payments-standard/integration-guide/reattempt-failed-payment/) article.

## Related Topics

* [Adding a New Currency](../currencies/adding-a-new-currency.md)
* [Authorize.net](./authorize-net.md)
* [Mercanet](./mercanet.md)
