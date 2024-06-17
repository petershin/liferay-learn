---
taxonomy-category-names:
- Sites
- Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: bb97bf36-80c8-4194-a570-3af8075cc697
---

# Configuring Asset Publisher Subscriptions

The Asset Publisher supports two kinds of subscriptions: [email subscriptions](#email-subscriptions) and [RSS feed subscriptions](#rss-feed-subscriptions).

## Email Subscriptions

Users can subscribe to the Asset Publisher to receive email notifications when new assets are published. To enable the notifications:

1. Hover over the Asset Publisher, click *Options* (![Options](../../../images/icon-app-options.png)) in the widget's menu, and select *Configuration*.

1. Toggle the *Enable Email Subscription* selector to Yes.

1. Fill in the form and click *Save* to apply the changes.

    ![An email subscription notifies users when new assets are published.](./configuring-asset-publisher-subscriptions/images/01.png)

1. Enable the *Subscribe* feature under the Display Settings tab if it's not enabled. Users can click the *Subscribe* button to receive email notifications of newly published assets.

![Enabling Email Subscription adds a Subscribe link to the Asset Publisher.](./configuring-asset-publisher-subscriptions/images/02.png)

### Configuring the Asset Check Interval

Liferay Portal periodically checks for new assets and sends emails to subscribed users informing them about the new assets. By default, assets are checked every 24 hours. To change the check interval:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *System Settings* under Configuration.

1. Select *Assets* under the *Content and Data* heading.

1. Go to *System Scope* &rarr; *Asset Publisher*.

1. Change the *Check Cron Expression* or *Check Interval* setting to the interval (in hours) that you want to check for new assets and notify subscribed users, and click *Save* to apply the changes.

![The Check Interval settings specifies how often assets are checked for updates.](./configuring-asset-publisher-subscriptions/images/03.png)

!!! warning
    To disable this feature, [blacklist](../../../system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) the component. Do not enter zero or a negative number for the interval.

## RSS Feed Subscriptions

!!! note
    RSS feeds are deprecated for Liferay Portal 7.2+ and are disabled by default. To leverage RSS feeds, you must enable this feature.

Enable RSS feed subscriptions for the Asset Publisher:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *System Settings* under Configuration.

1. Select *Web Content* under the *Content and Data* heading.

1. Open the *Administration* tab under System Scope, check the *Show Feeds* box. For more information on deprecated apps, see [Maintenance Mode and Deprecations in 7.4](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md).

    ![Enable RSS feeds through System Settings.](./configuring-asset-publisher-subscriptions/images/04.png)

1. Navigate back to the Asset Publisher widget, hover over it, click *Options* (![Options](../../../images/icon-app-options.png)) in the widget's menu, and select *Configuration*.

1. Toggle the *Enable RSS Subscription* selector to Yes.

1. Fill in the form and click *Save* to apply the changes.

    ![An RSS subscription sends RSS feeds to subscribers' RSS readers.](./configuring-asset-publisher-subscriptions/images/05.png)

1. Enable the *Subscribe* feature under the Display Settings tab if it's not enabled. Users can click the *RSS* link to subscribe to the RSS feed.

![Enabling RSS Subscription adds a RSS link to the Asset Publisher.](./configuring-asset-publisher-subscriptions/images/06.png)

## Related Information

- [Configuring Mail](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
- [Displaying Assets Using the Asset Publisher Widget](./displaying-assets-using-the-asset-publisher-widget.md)
- [Configuring the Asset Publisher Display Settings](./configuring-asset-publisher-display-settings.md)
