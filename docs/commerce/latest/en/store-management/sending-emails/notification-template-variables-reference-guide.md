# Notification Template Variables Reference Guide

When creating a notification template, you can insert a variable as a substitute for key values in the *Email Settings* and *Body* fields. Key values include the customer's name, the order ID, shipping and billing addresses, and a list of items in the order.

![Use these variables in the body of the email.](./notification-template-variables-reference-guide/images/02.png)

To view the variables available, first select a Notification Template Type and enable it.

![Select a type that triggers the notification.](./notification-template-variables-reference-guide/images/01.png)

Once a template type has been selected, expand the *Definition of Terms* dropdown menu.

## Email Settings

![Use these variables in the Email Settings field.](./notification-template-variables-reference-guide/images/03.png)

The following variables are available in the *Email Settings* section:

| Variable                       | Description                     |
| :----------------------------- | :------------------------------ |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | Account Order Manager           |
| [%ORDER_CREATOR%]              | The user that created the order |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | Account Administrator           |
| [%USER_GROUP_NAME%]            | User Group Name                 |

## Orders

![Use these variables for displaying order related information in emails.](./notification-template-variables-reference-guide/images/05.png)

The following variables are available when creating a notification template with an order type event trigger:

| Variable                          | Description                                             |
| :-------------------------------- | :------------------------------------------------------ |
| [%ORDER_ITEMS%]                   | A table with all the items included in the order        |
| [%ORDER_SHIPPING_ADDRESS%]        | The order's shipping address                            |
| [%ORDER_BILLING_ADDRESS%]         | The order's billing address                             |
| [%ORDER_ID%]                      | The order ID                                            |
| [%ORDER_TOTAL%]                   | The order's total excluding tax                         |
| [%ORDER_DATE%]                    | The order date                                          |
| [%ORDER_CURRENCY_SYMBOL%]         | The currency symbol of the order (Example: $, £, etc)   |
| [%ORDER_SHIPPING_WITH_TAX_TOTAL%] | The order's total shipping cost including tax           |
| [%ORDER_EXTERNAL_REFERENCE_CODE%] | The order's external reference code                     |
| [%ORDER_URL%]                     | The order's URL                                         |
| [%PAYMENT_TERMS_DESCRIPTION%]     | Payment terms attached to the order                     |
| [%ORDER_PAYMENT_METHOD%]          | The order's payment method                              |
| [%ORDER_TAX_TOTAL%]               | The total tax for the order                             |
| [%ORDER_WITH_TAX_TOTAL%]          | The total amount for the order including tax            |
| [%ORDER_CREATOR_USER_FIRST_NAME%] | The first name of the user that created the order       |
| [%ORDER_SHIPPING_OPTION%]         | The order's shipping option                             |
| [%ORDER_CREATOR_USER_LAST_NAME%]  | The last name of the user that created the order        |
| [%DELIVERY_TERMS_DESCRIPTION%]    | Delivery terms attached to the order                    |
| [%ORDER_CREATOR%]                 | The user that created the order                         |
| [%ORDER_CURRENCY_CODE%]           | The currency code of the order (Example: USD, GBP, etc) |
| [%ORDER_CREATOR_USER_TITLE%]      | The title of the user that created the order            |
| [%ORDER_SHIPPING_TOTAL%]          | The order's total shipping cost excluding tax           |

## Subscription

![Use these variables for subscription based event triggers.](./notification-template-variables-reference-guide/images/04.png)

The following variables are available when creating a notification template with the subscription type event trigger:

| Variable          | Description                     |
| :---------------- | :------------------------------ |
| [%PRODUCT_NAME%]  | Product Name                    |
| [%ORDER_CREATOR%] | The user that created the order |
| [%ORDER_ID%]      | The order ID                    |

## Additional Information

* [Using Notification Templates](./using-notification-templates.md)
