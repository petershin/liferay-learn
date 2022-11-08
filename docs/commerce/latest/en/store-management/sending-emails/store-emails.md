# Store Emails

You can configure Liferay to send email notifications for different events that happen in your store. To do this, you must use a notification template that is customizable and defines the content of an email.  When sending emails, you can use wildcards that are available out-of-the-box (OOTB) or enter email addresses.

```{note}
To use notifications in Commerce, you must first configure the mail settings for Liferay DXP. See [Configuring Mail](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/setting-up-liferay/configuring-mail.html) for more information.
```

## Notification Templates

A notification template defines the sender and receiver, the event trigger, and the contents of the email notification. After configuring Liferay's mail settings, navigate to *Control Panel* &rarr; *Commerce* &rarr; *Channels*. Select the *Notifications Template* tab and click the *Add* button to create a notification template. Email notifications are configured per [channel](../../store-management/channels/introduction-to-channels.md).

![You can create different notification templates for different event triggers.](./store-emails/images/02.png)

### Event Triggers

There are ten events that can trigger email notifications. Notification templates standardize email notifications using one of the following event triggers. Note that one notification template can only be used for one event.

| Notification Type       | Event                                                               |
| :---------------------- | :------------------------------------------------------------------ |
| Order Placed            | An order has been placed in the channel.                            |
| Order Processing        | The order is being processed.                                       |
| Order Awaiting Shipment | The order is ready to be shipped.                                   |
| Order Partially Shipped | The items in the order are being shipped separately.                |
| Order Shipped           | The order has been shipped.                                         |
| Order Completed         | The order has been delivered and marked as complete                 |
| Subscription Renewed    | Renewal of a subscription (recurring order)                         |
| Subscription Activated  | Activation of a subscription                                        |
| Subscription Suspended  | Suspension of a subscription pending review or action by the store. |
| Subscription Canceled   | Cancellation of a subscription                                      |

![Configuring a notification templates for a channel.](./store-emails/images/01.png)

### Customizing an Email Notification Template

After choosing the event trigger, you can customize the notification template with your own text and wild card values that get substituted for key values in the *Email Settings* and *Body* fields. Some of the wildcards include a customer's name, the order ID, shipping and billing addresses, and a list of items in the order.

For example, the *Email Body* field can contain:

```
Dear [%ORDER_CREATOR%],

Your [%ORDER_ID%] has been shipped to [%ORDER_SHIPPING_ADDRESS%].
```

The wild cards are then replaced with the relevant content when sending the email.

See [Notification Template Variables Reference Guide](./notification-template-variables-reference-guide.md) to learn more.

## Notification Queue

The *Notification Queue* tab displays all the email notifications of a channel. Each email notification entry shows its sender, receiver, type of event trigger, status and priority.

![The Notification Queue tab displays a list of the triggered notifications.](./store-emails/images/03.png)

By default, the system checks the Notification Queue at 15-minute intervals for unsent notifications. See [Configuring the Commerce Notification Queue](./configuring-the-commerce-notification-queue.md) to learn more about changing the defaults.

## Viewing Email Notifications of an Order

Email notifications related to an order are tracked. To view them, open the Global Menu and navigate to *Control Panel* &rarr; *Commerce* &rarr; *Orders*. Select an order and then click the *Emails* tab. See [Orders Information](../../order-management/orders/order-information.md) to learn more.

![You can view the triggered notification under the Emails tab of an Order.](./store-emails/images/04.png)

## Additional Information

* [Using Notification Templates](./using-notification-templates.md)
* [Configuring the Commerce Notification Queue](./configuring-the-commerce-notification-queue.md)
* [Notification Template Variables Reference Guide](./notification-template-variables-reference-guide.md)
