---
uuid: 453b538b-4220-43d6-9d47-05be5f8527d7
---
# Server Administration and Email

You can manage and monitor your Liferay instance from the server administration console. For example, you can view the current system or portal properties or configure logging and log levels. This is also where you can configure the email server for the whole system. See [Using the Server Administration Panel](https://learn.liferay.com/dxp/latest/en/system-administration/using-the-server-administration-panel.html) to learn more.

Configure a mail server that is used for email notifications (e.g. user registration, password management, etc.). Delectable Bonsai uses Google for their email service. Follow the steps below for configuration.

<!-- I think I said we can't use Google for this. Maybe use something like FakeSMTP? http://nilhcem.com/FakeSMTP/ -Rich -->

### Configuring Mail in LXC

If this wasn't already configured for you, contact your Liferay Cloud support person.

### Configuring Mail in LXC-SM or On-Premises

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Server Administration_. Click the _Mail_ tab.

1. Set the following configuration.

   * Incoming POP Server: `pop.gmail.com`.
   * Incoming Port: `110`.
   * Use a Secure Network Connection: checked.
   * User Name: `support@delectablebonsai.com`.
   * Password: `learn`.
   * Outgoing SMTP Server: smtp.gmail.com
   * Outgoing Port: 465
   * Use a Secure Network Connection: checked
   * User Name: `support@delectablebonsai.com`.
   * Password: `learn`.

   ![Input the settings for the mail server.](./server-administration-and-email/images/01.png)

   Click _Save_.

```{note}
The settings above are for demonstration purposes only. For your business, input your relevant email provider values and credentials.
```

Your Liferay environment is now configured with a mail server. You can further customize mail to configure different email senders and messages for each instance. See [Instance Email Settings](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/email-settings.html) to learn more.

## Relevant Concepts

- [Using the Server Administration Panel](https://learn.liferay.com/dxp/latest/en/system-administration/using-the-server-administration-panel.html)
- [Configuring Mail](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/setting-up-liferay/configuring-mail.html)
- [Email Settings](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/email-settings.html)
