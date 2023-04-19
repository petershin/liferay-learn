---
uuid: c94a253c-fa97-4098-90c0-d43a16534131
---
# Configuring MFA

Add an additional later of security for your Liferay environment with multi-factor authentication (i.e. MFA). Liferay supports both one-time codes through email or through third-party services that support SMS or authenticator apps. See [using multi-factor-authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication) to learn more.

## Setting Up MFA

In real life, you'd already have a mail server for Liferay to use. Here, you'll simulate one. 

1. Download [FakeSMTP](http://nilhcem.com/FakeSMTP/). 

1. Unzip the file. Start the FakeSMTP mail server with the following command:

   `java -jar fakeSMTP-2.0.jar`

1. Set the listening port to `2525` and click _Start server_.

   Note, if using a docker container for Liferay, the following env variables must be included in the your run command.

   ```properties
   --env LIFERAY_MAIL_PERIOD_SESSION_PERIOD_MAIL_PERIOD_SMTP_PERIOD_PORT=2525 \
   --env LIFERAY_MAIL_PERIOD_SESSION_PERIOD_MAIL_PERIOD_SMTP_PERIOD_HOST=172.17.0.1 \
   ```

1. Log into Liferay as the administrator (i.e. [Kyle Klein](../users-accounts-organizations/managing-users.md#creating-users)).

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Server Administration_. Click the _Mail_ tab.   

1. Set the outgoing port to `2525`. Click _Save_.

1. Next, navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. Click _Email_ under the platform section.

1. Click _Email Sender_ in the left navigation. Set the name as `Support` and address as `support@delectablebonsai.com`. Click _Save_.

1. Navigate back to the instance settings. Under the security section, click _Multi-Factor Authentication_. 

1. Tick the enabled box and click _Save_. See [Enabling Multi-Factor Authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication#enabling-multi-factor-authentication) to learn more about the configuration options.
   
   Note, ensure you can successfully receive email through FakeSMTP before proceeding to prevent locking yourself out of the system.

## Testing the MFA

1. Click the user profile image in the top right and click _Sign Out_.

1. Sign back into Liferay as the administrator (i.e. Kyle Klein). 

1. On the next page, click _Send_ for Liferay to send the one-time password to kyle@delectablebonsai.com. 

1. Get the one-time password from the sent email.

   ![Get the one-time password from the email.](./configuring-mfa/images/01.png)

1. Copy and paste the one-time password onto the login page. Click _Submit. You successfully logged into Liferay.

Next: [Securing Web Services](./securing-web-services.md)

## Relevant Concepts

- [Using Multi-Factor Authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication)
- [Multi-Factor Authentication Checkers](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/multi-factor-authentication-checkers)