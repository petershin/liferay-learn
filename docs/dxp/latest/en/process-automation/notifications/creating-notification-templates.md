# Creating Notification Templates

{bdg-secondary}`Available Liferay 7.4 U46+/GA46+`

With Notification Templates, you can design automated email notifications for Liferay services. Each template identifies a sender, recipients, and message content. While designing the template, you can search supported entities and add field references that insert their data dynamically into emails.

Currently, notification templates only support [Object actions](../../building-applications/objects/creating-and-managing-objects/defining-object-actions.md). However, Commerce Channels include built-in notification template capabilities for channel events. See [Store Emails](https://learn.liferay.com/commerce/latest/en/store-management/sending-emails/store-emails.html) for more information.

```{important}
To use email notifications, your instance must have a configured [mail server](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md). Once configured, you can access additional [email notification settings](../../system-administration/configuring-liferay/virtual-instances/email-settings.md) at the instance level.
```

Follow these steps to create a notification template for Object actions:

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Notification Templates*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

   When designing a template, you can use Object field references to dynamically populate notification emails with entry data. To do this, go to the *Definition of Terms* section and use the *Entity* dropdown menu to select the desired Object definition. Then copy and paste the field references into the desired template fields.

   ![Search and add references to supported entity fields.](./creating-notification-templates/images/01.png)

   Keep in mind you can only reference fields for entries directly involved in the Object's notification action.

1. In the Basic Info section, enter a *name* and *description*.

   ![Under Basic info, enter a name and description.](./creating-notification-templates/images/02.png)

1. In the Settings section, enter contact information for the email *sender* and *recipients*.

   To add multiple recipients, separate email addresses with a comma (e.g., `test@liferay.com,test2@liferay.com`)

   ![Under Settings, enter details for the sender and desired recipients.](./creating-notification-templates/images/03.png)

1. In the Content section, enter a *subject* and craft the *body* of the email.

   ![Under Content, enter a subject and craft the body of the email.](./creating-notification-templates/images/04.png)

1. (Optional) Select Object attachment fields to include their assets in email notifications.

   ```{important}
   You can only attach assets from Object entries involved in the notification action.
   ```

   ![Select attachment fields to include assets in email notifications.](./creating-notification-templates/images/05.png)

1. Click *Save*.

Once created, you can use notification templates with Object actions. See [Defining Object Actions](../../building-applications/objects/creating-and-managing-objects/defining-object-actions.md) for more information.

## Additional Information

* [Configuring Mail](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [Email Settings](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [Notifications](../notifications.md)
