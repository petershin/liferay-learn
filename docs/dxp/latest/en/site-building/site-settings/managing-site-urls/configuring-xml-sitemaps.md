---
taxonomy-category-names:
- Sites
- SEO
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 42d221de-7c20-4e65-ba94-c7734e59e8c0
---

# Configuring XML Sitemaps

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA126+`

!!! important
    This feature is currently behind a release feature flag (LPS-187793). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

XML sitemaps are XML-formatted documents listing the URLs of a website along with additional metadata (e.g. last update, change frequency, and importance relative to other URLs in the site). They streamline the process for search engine crawlers, enhancing their ability to uncover and index website content effectively.

!!! tip
    You can view your XML sitemap by accessing `http://your-site/sitemap.xml`.

With Liferay, you can configure your XML sitemap to include/exclude sites and URLs from the sitemap.

![Configure your XML sitemap.](./configuring-xml-sitemaps/images/01.png)

To configure your XML sitemap,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), navigate to *Control Panel*, and open *Instance Settings* under Configuration.

1. Select *SEO* under Platform and click *XML Sitemap* on the left.

1. Click *Select* to include sites from your sitemap.

   To exclude a site from your sitemap, click *Remove New Site* (![Remove New Site icon](../../../images/icon-times.png)) next to the added site.

   !!! note
       The XML sitemap only includes sites that don't use virtual hosts.

1. Select whether or not to include page (e.g., widget, content, panel, collection, and embedded) URLs in the XML sitemap.

   You can add a page to the sitemap through the page's configuration. Read [Configuring SEO and Open Graph](../../displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md#sitemap) to learn more.

   <!-- This link points to an article under Using Display Page Templates. However, it also applies to different kinds of pages. Maybe I should change its location or rewrite it a little instead of rewriting the whole information? - Eric -->

1. Select whether or not to include web content URLs in the XML sitemap.

1. Select whether or not to include category URLs in the XML sitemap.

## Related Topics

- [Setting Up Redirects and 404 Tracking](./setting-up-redirects-and-404-tracking.md)
- [Configuring Your Site's Friendly URL](./configuring-your-sites-friendly-url.md)
- [Configuring Virtual Hosts Site URLs](./configuring-virtual-hosts-site-urls.md)
