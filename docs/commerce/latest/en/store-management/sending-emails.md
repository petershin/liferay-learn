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

!!! note
    To use notifications in Commerce, you must first configure Liferay's mail settings. See [Configuring Mail](https://learn.liferay.com/w/dxp/installation-and-upgrades/setting-up-liferay/configuring-mail) for more information.

There are two ways to set up these notifications.

* Creating a notification template to be executed as an Object Action (preferred)
* Creating a notification template at the channel level

## Notification Templates (Object Action)

To create a notification template,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Templates*.

1. Click *Add* (![Add](../images/icon-add.png)) to create a notification template. See [Notification Template](https://learn.liferay.com/w/dxp/process-automation/notifications/creating-notification-templates) for more information on configuring a template.

After creating a notification template, you must assign it as an object action on the Commerce Order object. See [Defining Object Actions](https://learn.liferay.com/w/dxp/liferay-development/objects/creating-and-managing-objects/actions/defining-object-actions) for more information.

### Notification Queue

Liferay provides the Notification Queue application for reviewing email notifications triggered by an Object action. You can verify the status of notifications and resend them if needed. See [Notification Queue](https://learn.liferay.com/w/dxp/process-automation/notifications/using-the-notification-queue) for more information.

## Notification Templates (Channel)

To create notification templates at the channel-level,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Channels*.

1. Select the appropriate channel and go to *Notification Templates*.

1. Click *Add* (![Add](../images/icon-add.png)) to create a notification template. 

These notifications are configured per [channel](./channels.md). When designing an email template, you can enter text directly or use variables to include data from the triggering event dynamically. See [Using Notification Templates](./sending-emails/using-notification-templates.md) and [Notification Template Variables Reference Guide](./sending-emails/notification-template-variables-reference-guide.md) for more information.

### Notification Queue - Channel

There's also a *Notification Queue* tab under a channel that displays all the email notifications. Each email notification entry shows its sender, recipients, event type, status, and priority. By default, Liferay checks the notification queue every 15 minutes for unsent notifications. See [Configuring the Commerce Notification Queue](./sending-emails/configuring-the-commerce-notification-queue.md) to learn how to configure this behavior.
