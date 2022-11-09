# Notification Template Variables Reference Guide

When creating a notification template, you can use placeholders as a substitute for key values. For the *Email Settings* and *Email Content* sections, the key values include the customer's name, the order ID, shipping and billing addresses, a list of items in the order, and more.

![Use these variables in the body of the email.](./notification-template-variables-reference-guide/images/02.png)

To view the available placeholders, select a notification template type from the *Type* dropdown.

![Select a type that triggers the notification.](./notification-template-variables-reference-guide/images/01.png)

After selecting a template type, expand the *Definition of Terms* menu to view the available placeholders and their descriptions.

## Email Settings

![Use these variables in the Email Settings field.](./notification-template-variables-reference-guide/images/03.png)

The following variables are available in the *Email Settings* section:

| Variable                       | Description                     |
| :----------------------------- | :------------------------------ |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | Account Order Manager           |
| [%ORDER_CREATOR%]              | The user that created the order |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | Account Administrator           |
| [%USER_GROUP_NAME%]            | User Group Name                 |

## Order Based Notification Template Types

![Use these variables for displaying order related information in emails.](./notification-template-variables-reference-guide/images/05.png)

There are 6 order based notification template types.

* Order Placed
* Order Processing
* Order Awaiting Shipment
* Order Partially Shipped
* Order Shipped
* Order Completed

The following variables are available when selecting one of these types:

| Variable                          | Description                                        |
| :-------------------------------- | :------------------------------------------------- |
| [%ORDER_ITEMS%]                   | A table with all the items in the order            |
| [%ORDER_SHIPPING_ADDRESS%]        | The order's shipping address                       |
| [%ORDER_BILLING_ADDRESS%]         | The order's billing address                        |
| [%ORDER_ID%]                      | The order ID                                       |
| [%ORDER_TOTAL%]                   | The order's total excluding tax                    |
| [%ORDER_DATE%]                    | The date when the order was placed                 |
| [%ORDER_CURRENCY_SYMBOL%]         | The currency symbol of the order (Example: $, £)   |
| [%ORDER_SHIPPING_WITH_TAX_TOTAL%] | The order's total shipping cost including tax      |
| [%ORDER_EXTERNAL_REFERENCE_CODE%] | The order's external reference code                |
| [%ORDER_URL%]                     | The order's URL                                    |
| [%PAYMENT_TERMS_DESCRIPTION%]     | Payment terms attached to the order                |
| [%ORDER_PAYMENT_METHOD%]          | The order's payment method                         |
| [%ORDER_TAX_TOTAL%]               | The total tax for the order                        |
| [%ORDER_WITH_TAX_TOTAL%]          | The total amount for the order including tax       |
| [%ORDER_CREATOR_USER_FIRST_NAME%] | The first name of the user that created the order  |
| [%ORDER_SHIPPING_OPTION%]         | The order's shipping option                        |
| [%ORDER_CREATOR_USER_LAST_NAME%]  | The last name of the user that created the order   |
| [%DELIVERY_TERMS_DESCRIPTION%]    | Delivery terms attached to the order               |
| [%ORDER_CREATOR%]                 | The user that created the order                    |
| [%ORDER_CURRENCY_CODE%]           | The currency code of the order (Example: USD, GBP) |
| [%ORDER_CREATOR_USER_TITLE%]      | The title of the user that created the order       |
| [%ORDER_SHIPPING_TOTAL%]          | The order's total shipping cost excluding tax      |

## Subscription Based Notification Template Types

![Use these variables for subscription based event triggers.](./notification-template-variables-reference-guide/images/04.png)

There are 4 subscription based notification template types.

* Subscription Renewed
* Subscription Activated
* Subscription Suspended
* Subscription Canceled

The following variables are available when selecting one of these types:

| Variable          | Description                     |
| :---------------- | :------------------------------ |
| [%PRODUCT_NAME%]  | Product Name                    |
| [%ORDER_CREATOR%] | The user that created the order |
| [%ORDER_ID%]      | The order ID                    |

## Additional Information

* [Using Notification Templates](./using-notification-templates.md)
