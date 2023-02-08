# Notification Template Variables Reference Guide

When creating notification templates, you can use variables to populate email fields dynamically with data from the triggering channel event. Select a notification template *Type* to view its variables. This determines which channel events trigger the notification.

![Select a notification template type.](./notification-template-variables-reference-guide/images/01.png)

After selecting a type, you can view its variables and their descriptions by expanding *Definition of Terms* in the *Email Settings* and *Email Content* sections. Examples include the customer's name, order ID, shipping and billing addresses, list of order items, and more.

![Use these variables in the body of the email.](./notification-template-variables-reference-guide/images/02.png)

## Email Settings

![Use these variables in the Email Settings field.](./notification-template-variables-reference-guide/images/03.png)

| Variable                       | Description                                                                                                                                      |
| :----------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | Order manager(s) for the account that placed the order                                                                                           |
| [%ORDER_CREATOR%]              | User that created the order                                                                                                                      |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | Account administrator(s) for the account that placed the order                                                                                   |
| [%USER_GROUP_NAME%]            | Name of a user group. Replace `NAME` with the user group name (e.g., for user group Sales Consultants, enter `[%USER_GROUP_Sales Consultants%]`) |

## Order Based Notification Template Types

![Use these variables to include order-related information in email notifications.](./notification-template-variables-reference-guide/images/04.png)

Channels have six types of notification templates for order events:

1. Order Placed

1. Order Processing

1. Order Awaiting Shipment

1. Order Partially Shipped

1. Order Shipped

1. Order Completed

| Variable                          | Description                                    |
| :-------------------------------- | :--------------------------------------------- |
| [%ORDER_ITEMS%]                   | A table listing all items in the order         |
| [%ORDER_SHIPPING_ADDRESS%]        | Order's shipping address                       |
| [%ORDER_BILLING_ADDRESS%]         | Order's billing address                        |
| [%ORDER_ID%]                      | Order ID                                       |
| [%ORDER_TOTAL%]                   | Order's total excluding tax                    |
| [%ORDER_DATE%]                    | Date when the order was placed                 |
| [%ORDER_CURRENCY_SYMBOL%]         | Currency symbol of the order (Example: $, £)   |
| [%ORDER_SHIPPING_WITH_TAX_TOTAL%] | Order's total shipping cost including tax      |
| [%ORDER_EXTERNAL_REFERENCE_CODE%] | Order's external reference code                |
| [%ORDER_URL%]                     | Order's URL                                    |
| [%PAYMENT_TERMS_DESCRIPTION%]     | Payment terms attached to the order            |
| [%ORDER_PAYMENT_METHOD%]          | Order's payment method                         |
| [%ORDER_TAX_TOTAL%]               | Total tax for the order                        |
| [%ORDER_WITH_TAX_TOTAL%]          | Total amount for the order including tax       |
| [%ORDER_CREATOR_USER_FIRST_NAME%] | First name of the user that created the order  |
| [%ORDER_SHIPPING_OPTION%]         | Order's shipping option                        |
| [%ORDER_CREATOR_USER_LAST_NAME%]  | Last name of the user that created the order   |
| [%DELIVERY_TERMS_DESCRIPTION%]    | Delivery terms attached to the order           |
| [%ORDER_CREATOR%]                 | User that created the order                    |
| [%ORDER_CURRENCY_CODE%]           | Currency code of the order (Example: USD, GBP) |
| [%ORDER_CREATOR_USER_TITLE%]      | Title of the user that created the order       |
| [%ORDER_SHIPPING_TOTAL%]          | Order's total shipping cost excluding tax      |

## Subscription Based Notification Template Types

![Use these variables to include subscription related information in email notifications.](./notification-template-variables-reference-guide/images/05.png)

Channels have four types of notification templates for subscription events:

1. Subscription Renewed

1. Subscription Activated

1. Subscription Suspended

1. Subscription Canceled

| Variable          | Description                 |
| :---------------- | :-------------------------- |
| [%PRODUCT_NAME%]  | Product Name                |
| [%ORDER_CREATOR%] | User that created the order |
| [%ORDER_ID%]      | Order ID                    |

## Additional Information

* [Using Notification Templates](./using-notification-templates.md)
