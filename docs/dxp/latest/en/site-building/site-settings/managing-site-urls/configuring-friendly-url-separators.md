---
taxonomy-category-names:
- Sites
- SEO
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 93b7a0b6-926f-47dd-a26a-c50f40de6fb4
---

# Configuring Friendly URL Separators

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA126+`

!!! important
    This feature is currently behind a beta feature flag (LPD-11147). Read [Beta Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) for more information.

With Liferay, you can customize URL separators to improve URL readability and enhance SEO.

For example, web content articles use the default `w` separator in URLs, such as `http://your-site/w/new-article`. However, you can personalize this separator to `web-content` instead, resulting in more descriptive URLs like `http://your-site/web-content/new-article`.

Additionally, you can customize separators for other elements including asset categories, blog entries, display page templates, file entries, knowledge base articles, object entries, and web content articles.

![Customizable URL separators.](./configuring-friendly-url-separators/images/01.png)

To configure friendly URL separators,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), navigate to *Control Panel*, and open *Instance Settings* under Configuration.

1. Select *SEO* under Platform and click *Friendly URL* on the left.

1. Change the default values to set your friendly URL separators.

   Click *Reset to Default Value* (![Reset to Default Value icon](../../../images/icon-history.png)) to go back to the default value.

   !!! warning
       Each category must have a unique separator.

1. Click *Save*.

In the video below, a [web content article](../../../content-authoring-and-management/web-content.md) is shown in a [display page template](../../displaying-content/using-display-page-templates.md). The URL separator for the web content article is altered from `w` to `web-content`. If you refresh the page with the old URL, you are redirected to a 404 utility page as the page uses a new separator now. Once you change the separator to the new value, you are redirected to the display page template again.

![Configuring a friendly URL separator.](./configuring-friendly-url-separators/images/02.gif)

## Related Topics

- [Configuring Your Site's Friendly URL](./configuring-your-sites-friendly-url.md)
- [Configuring Friendly URL Redirects](./configuring-friendly-url-redirects.md)
