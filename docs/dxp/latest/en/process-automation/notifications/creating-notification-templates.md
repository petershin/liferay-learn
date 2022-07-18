# Creating Notification Templates

{bdg-secondary}`Available Liferay 7.4 U33+ and GA33+`

Liferay provides the Notification Templates application so you can design automated email notifications for Liferay services. Each template identifies a sender, recipient, and message content. While designing the template, you can search supported entities and add field references that dynamically insert their data into emails.

Currently, the Notification Templates application only supports Objects. However, Commerce Channels include built-in notification template capabilities for Channel events. See [Store Emails](https://learn.liferay.com/commerce/latest/en/store-management/sending-emails/store-emails.html) for more information.

```{note}
To use email notifications, your instance must have a configured [mail server](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md). Once configured, you can access additional [email notification settings](../../system-administration/configuring-liferay/virtual-instances/email-settings.md) at the instance level.
```

Follow these steps to create a notification template:

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Notification Templates*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

1. In the Basic Info section, enter a *name* and *description*.

   ![Under Basic info, enter a name and description.](./creating-notification-templates/images/01.png)

1. In the Settings section, enter details for the *sender* and desired *recipients*.

   ![Under Settings, enter details for the sender and desired recipients.](./creating-notification-templates/images/02.png)

1. In the Content section, enter a *subject* and craft the *body* of the email.

   ![Under Content, enter a subject and craft the body of the email.](./creating-notification-templates/images/03.png)

   During this process you can search supported entities and add field references to the email body. This dynamically populates the email with data from the entity.

   ![Search and add references to supported entity fields.](./creating-notification-templates/images/04.png)

   If desired, you can also select attachment fields from the entity to include their assets in email notifications (e.g., invoices).

   ![Select attachment fields to include their assets in email notifications.](./creating-notification-templates/images/05.png)

1. Click *Save*.

Once created, you can use notification templates with Object actions. See [Defining Object Actions](../../building-applications/objects/creating-and-managing-objects/defining-object-actions.md) for more information.

<!--Q: Can I use values set in the template, like $FROM_NAME$, $TO_NAME$, $TO_ADDRESS$ (cf. with email settings at the instance level)? -->

## Additional Information

* [Configuring Mail](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [Email Settings](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [Notifications](../notifications.md)
