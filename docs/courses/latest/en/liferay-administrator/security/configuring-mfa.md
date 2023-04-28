---
uuid: c94a253c-fa97-4098-90c0-d43a16534131
---
# Configuring MFA

Add an additional layer of security for your Liferay environment with multi-factor authentication (i.e. MFA). Liferay supports both one-time codes through email and third-party services that support SMS or authenticator apps. See [using multi-factor-authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication) to learn more.

Delectable Bonsai has come a long way from its days at the farmer's market. Now with many employees and customers, the IT department is now requiring MFA as part of its effort to enhance security.

## Setting Up MFA

1. Follow the steps in [Configuring Mail in Liferay](../configuration/server-administration-and-email.md#configuring-mail-in-lxc-sm-or-self-hosted) to simulate an SMTP mail server.

1. Log into Liferay as the administrator (i.e. [Kyle Klein](../users-accounts-organizations/managing-users.md#creating-users)).

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Server Administration_. Click the _Mail_ tab.

1. Set the outgoing port to `2525`. Click _Save_.

1. Next, navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. Click _Email_ under the platform section.

1. Click _Email Sender_ in the left navigation. Set the name as `Support` and address as `support@delectablebonsai.com`. Click _Save_.

1. Navigate back to the instance settings. Under Security, click _Multi-Factor Authentication_. 

1. Tick the _enabled_ box and click _Save_. See [Enabling Multi-Factor Authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication#enabling-multi-factor-authentication) to learn more about the configuration options.

   Note, ensure you can successfully receive email through FakeSMTP before proceeding to prevent locking yourself out of the system.

## Testing the MFA

1. Click the user profile image in the top right and click _Sign Out_.

1. Sign back into Liferay as the administrator (i.e. Kyle Klein). 

1. On the next page, click _Send_ for Liferay to send the one-time password to kyle@delectablebonsai.com. 

1. Get the one-time password from the sent email.

   ![Get the one-time password from the email.](./configuring-mfa/images/01.png)

1. Copy and paste the one-time password onto the login page. Click _Submit_. You successfully logged into Liferay.

Next: [Securing Web Services](./securing-web-services.md)

## Relevant Concepts

- [Using Multi-Factor Authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication)
- [Multi-Factor Authentication Checkers](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/multi-factor-authentication-checkers)
