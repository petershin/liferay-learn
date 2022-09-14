# Connecting Liferay DXP to Analytics Cloud

Now that you've learned about some of the great features in the [Getting Started](../getting-started.md) article, it's time to connect Liferay DXP to Analytics Cloud.

<!-- We don't write meta information about articles (see here: https://liferay.atlassian.net/wiki/spaces/EKM/pages/2071462940/Documentation+Writing+Guidelines#Meta-Information). I think it's fine to start immediately with what you have below (sans the "Setup Requirements" heading). -->

## Setup Requirements

To begin the setup process, there are a few requirements:

1. You need a [liferay.com](https://www.liferay.com) account. If you don't have a Liferay account, you can go here to [Create an account](https://login.liferay.com/signin/register).

1. When you visit [analytics.liferay.com](https://analytics.liferay.com/) for the first time, you are prompted to set up multi-factor authentication for the account. If you need help, see [Multi-Factor Authentication](./multi-factor-authentication.md).

1. Your Liferay DXP installation must meet one of the following minimum versions:

    * 7.4 (Any version)
    * 7.3 Fix Pack 1
    * 7.2 Fix Pack 11
    * 7.1 Fix Pack 22
    * 7.0 Fix Pack 98

1. You must have access to at least one Analytics Cloud workspace. Note, as a paid Analytics Cloud user, you should see your workspace upon login. Please contact us at <analytics-cloud@liferay.com> for any troubleshooting.

<!-- Is that really correct? There's no ticketing system to point people to? It's just an email address? Sounds rather archaic... -->

## Connection Token

Next, get your Analytics Cloud token and use it to connect your Liferay instance. 

<!-- The above paragraph should describe what an Analytics Cloud token is, what it's used for, and why it's necessary. -->

1. Log into Analytics Cloud. Select your workspace. If it's your first time logging in, you see an onboarding guide. Click _Next_ and you're shown the Analytics Cloud token in the next screen. Click the Copy icon (![copy icon](../images/icon-copy.png)) to copy the token to your clipboard.

   ![You see an onboarding guide upon first login.](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   If you canceled out of the onboarding guide, navigate to _Settings_ &rarr; _Data Sources_. Click _Add Data Source_. Select _Liferay DXP_ and the Analytics Cloud token appears. Click the Copy icon (![copy icon](../images/icon-copy.png)) to copy the token to your clipboard.

1. Log into your Liferay DXP instance. Open the Global Menu (![Global Menu](../images/icon-applications-menu.png)). Navigate to _Configuration_ &rarr; _Instance Settings_. Under _Platform_, click _Analytics Cloud_. Paste the Analytics Cloud token in the field and click _Connect_.

    ![Copy the token and click the connect button.](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

    ```{note}
    For Liferay DXP 7.0, Analytics Cloud Admin is found under *Configuration* &rarr *Analytics Cloud*.
    ```

1. Upon successful connection, the following message appears at the bottom left of your screen:

    `Success: Your request completed successfully`

Congratulations, your Liferay instance is now connected to Analytics Cloud!

The next step is syncing your Liferay site and your contacts. See [Syncing Sites and Contacts](./syncing-sites-and-contacts.md) and follow the steps.

The contents of this article are also covered in these video tutorials [Access a Workspace in Analytics Cloud](https://youtu.be/mixPk1uuAAQ) and [Connect Liferay DXP to Analytics Cloud](https://youtu.be/WXHBo4gAmhA).

<!-- Again, get rid of the above paragraph. If there's a video, it should be embedded in the appropriate place. -->
