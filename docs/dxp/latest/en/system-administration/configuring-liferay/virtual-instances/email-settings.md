---
uuid: 96e2eee9-a25b-4ca1-b210-dff9c28569d4
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
---
# Email Settings

The email configuration is where you configure email notifications at the virtual instance scope.

To access these options,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Configuration* &rarr; *Instance Settings*.

1. Select *Email* under Platform.

Configuration options appear on the left:

| Configuration                                                       | Purpose                                                                                            |
|:--------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------|
| [Account Created Notification](#account-created-notification)       | Enable/Disable email notifications for account creation and determine the notification's template. |
| [Email Sender](#email-sender)                                       | Set the sender's name and address for email templates.                                             |
| [Email Verification Notification](#email-verification-notification) | Determine the email template for requesting users to verify their email address.                   |
| [Mail Host Names](#mail-host-names)                                 | Enter mail hosts associated with the instance.                                                     |
| Mail Settings                                                       | Connect a mail server to the instance.                                                             |
| [Password Changed Notification](#password-changed-notification)     | Determine the email template for password changes.                                                 |
| [Password Reset Notification](#password-reset-notification)         | Determine the email template for password reset requests.                                          |

```{note}
Your installation must have a [configured connection to a mail server](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) to send email notifications. Mail server configurations set at the instance scope override server level configurations. 

For each notification template, you can view available template variables at the bottom of the page. Use these variables to populate emails dynamically.
```

## Account Created Notification

These templates define emails sent to users after creating an account. One template includes a password setup link, while the other does not.

Use the *Enabled* checkbox at the top to enable this notification.

![Configure the account created email notification](./email-settings/images/01.png)

## Email Sender

The email sender specifies the virtual instance's administrative name and email address for email notifications. You can include these values in notification templates using the `[$FROM_NAME$]` and `[$FROM_ADDRESS$]` variables. Defaults from [portal properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Admin%20Portlet) are `admin.email.from.name` and `admin.email.from.address`. This name and email address appear in the *From* field in all email messages sent by the virtual instance.

![Configure the from name and address for system emails.](./email-settings/images/02.png)

## Email Verification Notification

This template defines emails sent to users when asked to verify their email address.

![Verify the email address of users.](./email-settings/images/03.png)

## Mail Host Names

You can specify additional mail host names here that are owned by your organization for the virtual instance. Enter one mail host name per line, but don't enter the one specified in the virtual instance configuration.

![Configure additional mail host names for the virtual instance.](./email-settings/images/04.png)

## Password Changed Notification

This template defines emails notifying users that their password has been changed.

![Notify users when their password changes.](./email-settings/images/05.png)

## Password Reset Notification

This template is for password reset requests.

![Notify users when a password reset has been made.](./email-settings/images/06.png)

## Related Topics

[Configuring Mail](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)

[Notifications](../../../process-automation/notifications.md)
