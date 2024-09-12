---
uuid: 920e1423-7076-46bf-a605-4d47a70864ea
taxonomy-category-names:
- Commerce
- Storefronts
- Payment
- Client Extensions
- Liferay SaaS
---

# Adyen

{bdg-secondary}`Liferay DXP 2024.Q3+/Portal 7.4 GA125+`

Liferay provides a client extension that integrates with [Adyen](https://www.adyen.com). It uses the payment integration client extension as a base. See [Configuring Payment Methods](../configuring-payment-methods.md) to read more about the payment methods available out-of-the-box with Liferay.

!!! note
    Currently, the Adyen client extension is only compatible with Liferay SaaS.

## Install and Deploy the Adyen Client Extension

1. Go to the [Liferay Marketplace](https://marketplace.liferay.com) and search for `Liferay Commerce Connector to Adyen`.

1. Click *Get App*, select your account or create one, and accept the end user license agreement and terms of service.

1. Click *Continue*.

1. Select a project from the ones available to you.

1. Click *Get App*.

1. Note the order ID. You must use it to install the app from your Cloud dashboard.

1. Click *Go to Console*.

1. Go to Services, and click *New App*.

1. Enter the order ID from before and complete the installation.

1. Log in as an administrator and verify that the OAuth Application User Agent and two OAuth Application Headless Servers were added to Liferay. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to *Control Panel* &rarr; *OAuth2 Administration*.

   ![An OAuth Application User Agent and two OAuth Application Headless Servers are added when you deploy the client extension.](./adyen/images/01.png)

## Verifying the Addition of Adyen as a Payment Method

1. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to *Control Panel* &rarr; *Sites*.

1. Add a new Minium site.

1. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to *Commerce* &rarr; *Channels*.

1. Select *Minium Portal* and scroll down to the Payment Methods section. Verify the addition of Adyen as a new payment method here. It is inactive by default.

1. Select the new payment integration and activate it using the *Active* toggle.

1. Click *Save*. Two new tabs, *Eligibility* and *Configuration*, appear for the payment integration.

   You can go to the Eligibility tab to select specific order types or payment terms to be eligible for the payment integration. By default, it is eligible for all order types and payment terms.

   The configuration tab contains an input field that accepts key-value pairs that you can find from your [Adyen Customer Area](https://ca-test.adyen.com/).

   ![Enter the key-value pairs from your Adyen Dashboard to complete the integration.](./adyen/images/02.png)

   | Field             | Description                                                         |
   | :---------------- | :------------------------------------------------------------------ |
   | `apiKey`          | The API key from your Adyen dashboard.                              |
   | `environment`     | Choose the environment (`TEST` or `LIVE`) for your integration.     |
   | `hmacSignature`   | Generate or use an existing HMAC key while setting up your webhook. |
   | `merchantAccount` | The name associated with your Adyen Merchant account.               |
   | `themeId`         | The ID of the theme created on Adyen.                               |
   | `webhookPassword` | The password to access the Adyen webhook.                           |
   | `webhookUsername` | The username to access the Adyen webhook.                           |

   To set up the integration successfully, see Adyen's [integration checklist](https://docs.adyen.com/online-payments/integration-checklist/). You must also create a [payment link theme](https://docs.adyen.com/unified-commerce/pay-by-link/create-payment-links/customer-area/#create-a-new-theme) on Adyen and copy its ID to use in the configuration above.

1. Click *Save*.

1. Open the site and use the account selector to create a new account.

1. Add a few items to your cart.

1. Open the mini cart and click *Submit*. This starts the checkout flow.

1. Continue checking out until you reach the order summary page. Click *Continue* to redirect to Adyen. Enter the necessary details and click *Pay*. After confirming payment, you're automatically redirected back to Liferay. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and go to *Commerce* &rarr; *Payments* to verify the payment’s completion.

![Go to Adyen and enter your payment details to complete the order.](./adyen/images/03.png)

!!! note
    The above flow uses Adyen's test mode. Adyen provides numerous test card numbers to replicate different payment scenarios. See [Test card numbers](https://docs.adyen.com/development-resources/testing/test-card-numbers/) for more information.
