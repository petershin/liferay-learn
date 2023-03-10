---
uuid: 64a5a655-0a6a-4d41-866a-7be3e5a513bf
---
# Configuring Instance Settings

<!-- This is a cool idea; it's just that it's not universally applicable. Surely there's some instance setting you can set that people can actually do and test that it's working? For example, you could go into Instance Settings &rarr; User Accounts and de-select _Allow Strangers to Create Accounts_ for the B2B side, but leave it selected for the public facing website. -Rich -->

Liferay instances share the same installation but are configured to serve up different digital experiences from different domain names. Each instance has its own settings. 

Here, you'll configure a live Zendesk chat service that's integrated across the entire instance. Each site has access to the live chat. See the steps below to integrate it.

## Configuring Click to Chat

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. Under _Content & Data_, select _Click to Chat_.

2. Set the chat service.

   * Toggle on the enable click to chat.
   * Select _Always Inherit_ under site settings strategy. Note, you can choose one of the other settings if you want a site setting to take priority. 
   * Select _Zendesk_ under chat provider.
   * Under chat provider account ID, paste in your account ID. See [Zendesk Chat Integration](https://learn.liferay.com/dxp/latest/en/site-building/personalizing-site-experience/enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/zendesk.html) to learn more.
   * Toggle on the guest users allowed.

   Note, you must retrieve the account ID from your Zendesk Account.

3. Click _Save_. Now the chat service is enabled across the instance. Customers and guests can reach you by chat from any webpage.

   ![Zendesk chat is enabled for the instance.](./configuring-instance-settings/images/01.png)

The next step is [configuring virtual instances](./configuring-virtual-instances.md).

## Relevant Concepts

- [Instance Configuration](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/instance-configuration.html)
- [Enabling Automated Live Chat Systems](https://learn.liferay.com/dxp/latest/en/site-building/personalizing-site-experience/enabling-automated-live-chat-systems.html)
