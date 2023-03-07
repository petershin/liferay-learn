---
uuid: 64a5a655-0a6a-4d41-866a-7be3e5a513bf
---
# Configuring Instance Settings

Liferay instances share the same server but can be configured to serve up different digital experiences from different domain names. Various settings can be configured for each instance you have.

For example, configure a live chat service to be integrated across the entire instance. Each site will have access to the live chat. Delectable Bonsai uses Zendesk for their live chat functionality. See the steps below to integrate it.

## Configuring Click to Chat

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. Under _Content & Data_, click _Email_. Click _Click to Chat_.

1. Set the chat service.

   * Toggle on the enable click to chat.
   * Select _Always Inherit_ under Site Settings Strategy. Note, you can choose one of the other settings if you want a site setting to take priority. 
   * Select _Zendesk_ under Chat Provider.
   * Under Chat Provider Account ID, paste in your account ID. See [Zendesk Chat Integration](https://learn.liferay.com/dxp/latest/en/site-building/personalizing-site-experience/enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/zendesk.html) to learn more.
   * Toggle on the guest users allowed.

   Note, you must retrieve the account ID from your Zendesk Account.

1. Click _Save_. Now the chat service is enabled across the instance.

   ![Zendesk chat is enabled for the instance.](./configuring-instance-settings/images/01.png)

The next step is [configuring virtual instances](./configuring-virtual-instances.md).

## Relevant Concepts

- [Instance Configuration](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/instance-configuration.html)
- [Enabling Automated Live Chat Systems](https://learn.liferay.com/dxp/latest/en/site-building/personalizing-site-experience/enabling-automated-live-chat-systems.html)
