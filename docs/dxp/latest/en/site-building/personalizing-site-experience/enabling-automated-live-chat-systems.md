---
taxonomy-category-names:
- Personalization
- Live Chat
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: eaf9a214-8e50-4e0e-a818-e96a21098e2e
---

# Enabling Automated Live Chat Systems

{bdg-secondary}`Liferay 7.4+`

Liferay now offers integration with many live support chat platforms. Enabling this integration adds a chat window to sites on your Liferay instance and can be used to enable improved support and site experience for your users.

## Enabling Click To Chat

1. Go to the *Global Menu* (![icon](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Instance Settings*.

   ![Go to Instance Settings under Control Panel.](./enabling-automated-live-chat-systems/images/02.png)

1. Under the *Content and Data* section, click *Click To Chat*.

   ![You can see Click To Chat's icon under Content and Data.](./enabling-automated-live-chat-systems/images/03.png)

1. To enable Click to Chat for your instance, switch the *Enable Click to Chat* toggle.

   ![Toggle the switch on to enable Click to Chat.](./enabling-automated-live-chat-systems/images/04.png)

1. Once enabled, you must select a [Site Settings](../site-settings.md) Strategy. Your Site Settings strategy determines how Click to Chat is enabled across sites that exist on a given [Liferay instance](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md).

   ![Choose your Site Settings Strategy option.](./enabling-automated-live-chat-systems/images/05.png)

  **Always Inherit**: Click To Chat is enabled for all sites on the instance and ignores configurations made in Site Settings.

  **Always Override**: Configuration for Click to Chat configured in Site Settings always takes priority over configurations made in Instance Settings.

  **Inherit or Override**: Sites inherit configuration from Instance Settings, unless configured otherwise in the site's Site Settings.

1. Select your chat provider and enter the [Account ID or token](#getting-the-chat-provider-account-id-or-token) given to you by your Chat Provider.

   ![Select the chat provider you wish to use. ](./enabling-automated-live-chat-systems/images/06.png)

1. (Optional) Click the *Guest Users Allowed* toggle to enable guest users (unauthenticated users) to have access to the Click to Chat feature for your sites.

1. Click *Save*.

Click To Chat integration with your live chat provider is now configured.

## Getting The Chat Provider Account ID or Token

Each provider requires a two step process to enable the feature:

1. Find your Account ID.

1. Copy and paste it into the Chat Provider Account ID field.

   !!! note
       Unlike *Zendesk Web Widgets Classic*, *Zendesk Web Widgets* requires an Key ID and a Secret Key.

You can grab keys from these supported providers:

- [Chatwoot](https://www.chatwoot.com/docs/product/channels/api/create-channel), under *Create a contact*.

- [Crisp](https://help.crisp.chat/en/article/where-can-i-find-my-website-id-1ylqx1s/), under *How to find the WebsiteID?*.

- [Hubspot](https://knowledge.hubspot.com/integrations/use-hubspots-integration-with-netsuite), under *Locate your NetSuite Account ID, Access Token ID and Access Token Secret*.

- [Intercom](https://www.intercom.com) shows your account ID in the URL between `/apps` and `/home`. If the URL is `https://app.intercom.com/a/apps/abcdefg1/home`, after `/apps` the sequence of letters and numbers is your ID. In this example, Intercom's Account ID is `abcdefg1`.

- [Jivochat](https://www.jivochat.com/help/installation/find-code.html), under *How to find the HTML code to install on your website*.

- [LivePerson](https://knowledge.liveperson.com/troubleshooting-find-your-account-number.html), under *Find your account number*.

- [Smartsupp](https://docs.smartsupp.com/chat-box/configuration/#sub-domains-integration), under *Configuration*.

- [Tawk.to](https://help.tawk.to/article/direct-chat-link), under *Here’s how to find the Direct Chat Link:*.

- [Tidio](https://help.tidio.com/hc/en-us/articles/5389680306844-Install-Tidio-on-Site123), under *Installation*.

- [Zendesk Web Widgets Classic](https://developer.zendesk.com/documentation/classic-web-widget-sdks/web-widget/quickstart-tutorials/web-widget-javascript-apis/), under *Adding the Web Widget (Classic) on your web page*. The Account ID is the portion of the snippet after `...snippet.js?key=`.

- Zendesk Web Widgets is the same as in the Classic version. You can find the [Key ID and Secret key](https://developer.zendesk.com/documentation/zendesk-web-widget-sdks/sdks/web/enabling_auth_visitors/#generating-a-signing-key) under *Generating a signing key*.