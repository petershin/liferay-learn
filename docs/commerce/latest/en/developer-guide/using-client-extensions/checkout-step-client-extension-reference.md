---
uuid: ca6e1fe9-e68c-46ba-a26e-9a8941edb83b
---
# Checkout Step Client Extension Reference

## Checkout Step Client Extension YAML Reference

| Field                                    | Value                                                                | Description                                                                                                                                                                                                                                                          |
| :--------------------------------------- | :------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `active`                                 | `true`                                                               | Specifies that the checkout step is active.                                                                                                                                                                                                                          |
| `checkoutStepLabel`                      | `liferay-sample-commerce-checkout-step-label`                        | Specifies the label of the checkout step. See [Changing Translations with Language Override](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/changing-translations-with-language-override) to learn more about adding localized keys and values.                       |
| `checkoutStepName`                       | `liferay-sample-commerce-checkout-step-name`                         | Specifies the name of the checkout step that appears in the UI. See [Changing Translations with Language Override](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/changing-translations-with-language-override) to learn more about adding localized keys and values. |
| `checkoutStepOrder`                      | `25`                                                                 | Specifies the order of the checkout step. The order determines the placement of the new step among other checkout steps.                                                                                                                                             |
| `name`                                   | `Liferay Sample Commerce Checkout Step`                              | Specifies the name of the client extension.                                                                                                                                                                                                                          |
| `oAuth2ApplicationExternalReferenceCode` | `liferay-sample-commerce-checkout-step-oauth-application-user-agent` | Specifies the unique reference code of the OAuth 2 agent.                                                                                                                                                                                                            |
| `order`                                  | `true`                                                               | Specifies whether the checkout step must use an order to display in between other steps.                                                                                                                                                                             |
| `sennaDisabled`                          | `true`                                                               | Specifies whether Senna.js is disabled. You must set this to true for a checkout step client extension.                                                                                                                                                              |
| `showControls`                           | `true`                                                               | Specifies whether the options to go forward and backward appear for the new checkout step.                                                                                                                                                                               |
| `type`                                   | `commerceCheckoutStep`                                               | Specifies the type of the client extension.                                                                                                                                                                                                                          |
| `visible`                                | `true`                                                               | Specifies the visibility of the new checkout step.                                                                                                                                                                                                                       |

## Out-of-the-box Checkout Step Order Values

Liferay comes with several checkout steps out-of-the-box. Given below are the order values for these checkout steps.

| Step                             | Value                  |
| :------------------------------- | :--------------------- |
| Shipping Address Checkout Step   | 10                     |
| Shipping Method Checkout Step    | 20                     |
| Delivery Term Checkout Step      | 25                     |
| Billing Address Checkout Step    | 30                     |
| Payment Method Checkout Step     | 40                     |
| Payment Term Checkout Step       | 50                     |
| Payment Process Checkout Step    | Integer.MAX_VALUE - 90 |
| Order Confirmation Checkout Step | Integer.MAX_VALUE      |