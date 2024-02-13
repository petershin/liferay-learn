---
toc:
  - ./sending-emails/using-notification-templates.md
  - ./sending-emails/configuring-the-commerce-notification-queue.md
  - ./sending-emails/notification-template-variables-reference-guide.md
uuid: 2c082931-7301-4909-937c-6deeaeed9367
taxonomy-category-names:
- Commerce
- Storefronts
- Platform
- Notifications and Notification Templates
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Sending Emails

You can configure Liferay to send email notifications for different events that happen in your store. For example, you may want to send updates to the order manager or another person of interest with details of the order. This can include the order ID, shipping and billing addresses, the payment method used, and more. To do this, you must create a notification template that determines the email's contents and event trigger.

```{note}
To use notifications in Commerce, you must first configure the mail settings for Liferay DXP. See [Configuring Mail](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/setting-up-liferay/configuring-mail.html) for more information.
```

## Notification Templates

A notification template defines the sender and receiver, the event trigger, and the contents of the email notification. After configuring Liferay's mail settings, navigate to *Control Panel* &rarr; *Commerce* &rarr; *Channels*. Click the *Notification Templates* tab and click *Add* to create a notification template. These notifications are configured per [channel](./channels/introduction-to-channels.md). When designing an email template, you can enter text directly or use variables to include data from the triggering event dynamically. See [Using Notification Templates](./sending-emails/using-notification-templates.md) and [Notification Template Variables Reference Guide](./sending-emails/notification-template-variables-reference-guide.md) for more information.

## Notification Queue

The *Notification Queue* tab displays all email notifications for a channel. Each email notification entry shows its sender, recipients, event type, status, and priority. By default, Liferay checks the notification queue every 15 minutes for unsent notifications. See [Configuring the Commerce Notification Queue](./sending-emails/configuring-the-commerce-notification-queue.md) to learn how to configure this behavior.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Using Notification Templates
:link: ./sending-emails/using-notification-templates.md
:::

:::{grid-item-card}  Configuring the Notification Queue
:link: ./sending-emails/configuring-the-commerce-notification-queue.md
:::

:::{grid-item-card}  Notification Template Variables Reference Guide
:link: ./sending-emails/notification-template-variables-reference-guide.md
:::
::::
