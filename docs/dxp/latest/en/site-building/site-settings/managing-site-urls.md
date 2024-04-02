---
toc:
  - ./managing-site-urls/configuring-your-sites-friendly-url.md
  - ./managing-site-urls/configuring-virtual-hosts-site-urls.md
  - ./managing-site-urls/setting-up-redirects-and-404-tracking.md
  - ./managing-site-urls/configuring-friendly-url-redirects.md
  - ./managing-site-urls/configuring-xml-sitemaps.md
taxonomy-category-names:
- Sites
- SEO
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: e4e2e951-db91-4d5e-982c-049b5e03be42
---
# Managing Site URLs

Liferay DXP provides multiple out-of-the-box features for configuring and managing site URLs.

## Virtual Hosts Site URLs

Configure virtual hosts for your Liferay server to connect domain names (e.g., `www.helloworld.com`) and subdomain names (e.g. `developers.helloworld.com`) to your sites. In this way you can host multiple, separate sites on one Liferay DXP server. See [Configuring Virtual Hosts Site URLs](./managing-site-urls/configuring-virtual-hosts-site-urls.md) for more information.

## Friendly URLs

Define friendly URLs to help users quickly access your sites. Each friendly URL on your Liferay server must be unique and is appended to `https://[server:port]/web` (e.g., `https://localhost:8080/web/hello-world/`). See [Configuring Your Site's Friendly URL](./managing-site-urls/configuring-your-sites-friendly-url.md) for more information.

```{note}
You can also configure friendly URLs for pages and documents. See [Configuring Your Page's Friendly URL](../creating-pages/page-settings/configuring-your-pages-friendly-url.md) and [Configuring Document URLs](../../content-authoring-and-management/documents-and-media/uploading-and-managing/configuring-document-urls.md) for more information.
```

## Site Redirects

Set up URL redirects for your sites to avoid 404s and improve user experience. With Liferay DXP, you can define two types of redirects: alias redirects and pattern redirects.

**Alias Redirects**: These redirects explicitly define an absolute source URL and an absolute destination URL. For this reason, they are more predictable and recommended in most use cases. See [Using Alias Redirects](./managing-site-urls/setting-up-redirects-and-404-tracking/using-alias-redirects.md) for instructions on setting up alias redirects for your site.

**Pattern Redirects** {bdg-secondary}`7.4 U42+/GA42+`: These redirects use regular expressions to define patterns for source URLs and their replacements. For this reason, they are best used to match families of URLs quickly. However, depending on the regular expression, they can be slower than alias redirects and result in more URL matches than intended. See [Using Pattern Redirects](./managing-site-urls/setting-up-redirects-and-404-tracking/using-pattern-redirects.md) for more information on setting them up for your site.

## 404 URLs

Use the Redirection tool to track and manage Site requests leading to 404 errors. When enabled, Liferay DXP catalogs each 404 error, so you can assess and quickly resolve any issues. See [Tracking 404 URLs](./managing-site-urls/setting-up-redirects-and-404-tracking/tracking-404-urls.md) for more information and available configuration options.

## XML Sitemaps

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA126+`

Configure the XML sitemap to notify search engines of the website's structure, indicating which URLs are available for crawling. With this configuration, you can include or exclude sites, page URLs (e.g., widget, content, panel, collection, and embedded pages), web content URLs, and category URLs from your sitemap.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Configuring Your Site's Friendly URL
:link: ./managing-site-urls/configuring-your-sites-friendly-url.md
:::

:::{grid-item-card} Configuring Virtual Hosts Site URLs
:link: ./managing-site-urls/configuring-virtual-hosts-site-urls.md
:::

:::{grid-item-card} Setting Up Redirects and 404 Tracking
:link: ./managing-site-urls/setting-up-redirects-and-404-tracking.md
:::

:::{grid-item-card} Configuring Friendly URL Redirects
:link: ./managing-site-urls/configuring-friendly-url-redirects.md
:::

:::{grid-item-card} Configuring XML Sitemaps
:link: ./managing-site-urls/configuring-xml-sitemaps.md
:::
::::
