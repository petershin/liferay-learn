# Notification Template Variables Reference Guide

When creating notification templates, you can use variables to dynamically populate email fields with data from the triggering channel event. To view available variables, first select a notification template *Type*. This determines which channel events trigger the notification.

![Select a notification template type.](./notification-template-variables-reference-guide/images/01.png)

After selecting a type, you can view available variables and their descriptions by expanding *Definition of Terms* in the *Email Settings* and *Email Content* sections. Examples include the customer's name, order ID, shipping and billing addresses, list of order items, and more.

![Use these variables in the body of the email.](./notification-template-variables-reference-guide/images/02.png)

## Email Settings

![Use these variables in the Email Settings field.](./notification-template-variables-reference-guide/images/03.png)

These variables are available in the *Email Settings* section:

| Variable                       | Description                     |
| :----------------------------- | :------------------------------ |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | Account Order Manager           |
| [%ORDER_CREATOR%]              | The user that created the order |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | Account Administrator           |
| [%USER_GROUP_NAME%]            | User Group Name                 |

## Order Based Notification Template Types

![Use these variables to include order related information in email notifications.](./notification-template-variables-reference-guide/images/04.png)

Channels have 6 types of notification templates for order events:

* Order Placed
* Order Processing
* Order Awaiting Shipment
* Order Partially Shipped
* Order Shipped
* Order Completed

These variables are available for order notifications:

| Variable                          | Description                                        |
| :-------------------------------- | :------------------------------------------------- |
| [%ORDER_ITEMS%]                   | A table listing all items in the order             |
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

![Use these variables to include subscription related information in email notifications.](./notification-template-variables-reference-guide/images/05.png)

Channels have 4 types of notification templates for subscription events:

* Subscription Renewed
* Subscription Activated
* Subscription Suspended
* Subscription Canceled

These variables are available for subscription notifications:

| Variable          | Description                     |
| :---------------- | :------------------------------ |
| [%PRODUCT_NAME%]  | Product Name                    |
| [%ORDER_CREATOR%] | The user that created the order |
| [%ORDER_ID%]      | The order ID                    |

## Additional Information

* [Using Notification Templates](./using-notification-templates.md)
