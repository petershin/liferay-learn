---
uuid: 23945a81-3dac-4a80-a0e3-a05b113bba7e
---
# Creating Notification Templates

{bdg-secondary}`Available Liferay 7.4 U60+/GA60+`

With Notification Templates, you can design automated email and user notifications for Liferay services. Each template identifies a sender, recipients, and message content. While designing the template, you can search supported entities and add field references that insert their data dynamically into emails.

Currently, notification templates only support [object actions](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md). However, Commerce Channels include built-in notification template capabilities for channel events. See [Store Emails](https://learn.liferay.com/commerce/latest/en/store-management/sending-emails.html) for more information.

```{important}
To use email notifications, your instance must have a configured [mail server](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md). Once configured, you can access additional [email notification settings](../../system-administration/configuring-liferay/virtual-instances/email-settings.md) at the instance level.
```

<!--TASK: include this content when client extensions documentation is updated, "If the out-of-the-box notification types don't meet your needs, you can use client extensions to create custom types. See []() for more information or []() for a tutorial." -->

## Adding Email Notification Templates

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Notification Templates*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) and select *Email*.

   ![Click the Add button and select Email.](./creating-notification-templates/images/01.png)

   You can use object field references to populate messages dynamically with entry data. In the template designer, go to the *Definition of Terms* section and use the *Entity* drop-down menu to select an object definition. Copy and paste a field reference term into the desired template field. You can only reference fields for entries directly involved in the object's action.

   ![Search entities to add references to supported fields.](./creating-notification-templates/images/02.png)

1. In the Basic Info section, enter a name and description for the template.

   ![Under Basic Info, enter a name and description.](./creating-notification-templates/images/03.png)

1. In the Settings section, enter contact information for the email sender and recipients.

   To add multiple recipients, separate email addresses with a comma (e.g., `test@liferay.com,learn@liferay.com`).

   ![Under Settings, enter details for the sender and desired recipients.](./creating-notification-templates/images/04.png)

1. In the Content section, enter a subject, select an editor type, and create the body of the email.

   For type, select Rich Text or FreeMarker Template.

   ![Under Content, enter a subject and craft the body of the email.](./creating-notification-templates/images/05.png)

1. (Optional) Select object attachment fields to include their assets in email notifications.

   ```{important}
   You can only attach assets from object entries involved in the notification action.
   ```

   ![Select attachment fields to include assets in email notifications.](./creating-notification-templates/images/06.png)

1. Click *Save*.

Once created, you can use notification templates with object actions. See [Defining Object Actions](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) for more information.

## Adding User Notification Templates

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Notification Templates*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) and select *User Notification*.

   ![Click the Add Button and select User Notification.](./creating-notification-templates/images/07.png)

   You can use object field references to populate messages dynamically with entry data. In the template designer, go to the *Definition of Terms* section and use the *Entity* drop-down menu to select an object definition. Copy and paste a field reference term into the desired template field. You can only reference fields for entries directly involved in the object's action.

   ![Search entities to add references to supported fields.](./creating-notification-templates/images/08.png)

1. In the Basic Info section, enter a name and description for the template.

   ![Under Basic Info, enter a name and description.](./creating-notification-templates/images/09.png)

1. In the Settings section, determine the notification's recipients.

   You can use defined terms, user names, or user roles. To add multiple recipients, separate values with a comma (e.g., `[%TICKET_CREATOR%]`, `[%TICKET_R_ASSIGNEE_USERID%]`).

   ![Determine recipients by entering terms, individual user names, or user roles.](./creating-notification-templates/images/10.png)

1. In the Content section, enter the notification's message.

   You can use defined terms to populate values dynamically.

   ![Enter the notification's message in the Content section.](./creating-notification-templates/images/11.png)

1. Click *Save*.

Once created, you can use notification templates with object actions. See [Defining Object Actions](../../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md) for more information.

## Additional Information

* [Configuring Mail](../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [Email Settings](../../system-administration/configuring-liferay/virtual-instances/email-settings.md)
* [Notifications](../notifications.md)
