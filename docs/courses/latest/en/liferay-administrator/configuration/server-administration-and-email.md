---
uuid: 453b538b-4220-43d6-9d47-05be5f8527d7
---
# Server Administration and Email

You can manage and monitor your Liferay instance from the server administration console. For example, you can view the current system or portal properties or configure logging and log levels. This is also where you can configure the email server for the whole system. See [Using the Server Administration Panel](https://learn.liferay.com/dxp/latest/en/system-administration/using-the-server-administration-panel.html) to learn more.

<!-- Please update the above link, as it has changed. -Rich --> 

Configure a mail server that is used for email notifications (e.g. user registration, password management, etc.). Follow the steps below to configure the mail server for Delectable Bonsai. 

### Configuring Mail in LXC

If this wasn't already configured for you, contact your Liferay Cloud support person.

### Configuring Mail in LXC-SM or On-Premises

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Server Administration_. Click the _Mail_ tab.

1. Set the following configuration.

<!-- Was there a step somewhere I missed where we made localhost a mail server? If we don't have an actual mail server to use, as I said, you should use a dummy one like Fake SMTP Server (https://github.com/gessnerfl/fake-smtp-server). There is a docker image for it. -->

   * Incoming POP Server: `localhost`
   * Incoming Port: `110`
   * Use a Secure Network Connection: checked
   * User Name: `support@delectablebonsai.com`
   * Password: `learn`
   * Outgoing SMTP Server: `localhost`
   * Outgoing Port: `2525`
   * Use a Secure Network Connection: checked
   * User Name: `support@delectablebonsai.com`
   * Password: `learn`

   ![Enter the settings for the mail server.](./server-administration-and-email/images/01.png)

   Click _Save_.

Your Liferay environment is now configured with a mail server. You can further customize mail to configure different email senders and messages for each instance. See [Instance Email Settings](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/email-settings.html) to learn more.

## Relevant Concepts

<!-- Please update the links below. -Rich --> 

- [Using the Server Administration Panel](https://learn.liferay.com/dxp/latest/en/system-administration/using-the-server-administration-panel.html)
- [Configuring Mail](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/setting-up-liferay/configuring-mail.html)
- [Email Settings](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/email-settings.html)
