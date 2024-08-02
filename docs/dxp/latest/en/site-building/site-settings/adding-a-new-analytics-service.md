---
taxonomy-category-names:
- Sites
- Site Administration
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 69f3fd6d-cc4a-4e49-a547-a629debd09dd
---

# Adding a New Analytics Service

Liferay DXP includes support for Google Analytics and Piwik for analyzing traffic on your site. If you require a different analytics service, you can add it for your site.

## Adding the New Analytics Service

1. Open the [Global Menu](../../getting-started/navigating-dxp.md) (![Global Menu icon](../../images/icon-applications-menu.png)) and go to *Control Panel* &rarr; *Instance Settings*.

1. Select *Analytics* under the *Platform* heading.

1. Enter the name of any additional service you want to add in the *Analytics* field provided.

   ![You can enter additional analytics services through Instance Settings.](./adding-a-new-analytics-service/images/01.png)

## Adding the Tracking Code for your Analytics Service

1. Once you have entered the name, open the Site Menu and go to *Configuration* &rarr; *Settings* &rarr; *Advanced* &rarr; *Analytics* page for the site where you wish to add analytics.

   !!! note
       In Liferay DXP 7.1 and 7.2, navigate to *Configuration* &rarr; *Site Settings* &rarr; *Advanced* &rarr; *Analytics* in the Site Menu.

1. Copy the JavaScript tracking code provided by your analytics platform into the corresponding field for your service.

   ![The new analytics service appears under the site's advanced configuration settings.](./adding-a-new-analytics-service/images/02.png)

Now all pages on the selected site contain the tracking script and send analytics data to your analytics platform.

## Related Topics

- [Site Settings](../../../../../courses/latest/en/web-site-manager/site-settings.md)
- [Site Settings UI Reference](./site-settings-ui-reference.md)
