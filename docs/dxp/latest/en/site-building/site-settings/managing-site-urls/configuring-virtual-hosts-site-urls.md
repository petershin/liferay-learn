---
taxonomy-category-names:
- Sites
- SEO
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 0c27b5b6-ea92-423e-8bbe-bd15918cc1e1
---

# Configuring Virtual Hosts Site URLs

A virtual host connects a domain name (e.g., `www.helloworld.com`) to a site. This can be a full domain or a subdomain (e.g. `developers.helloworld.com`). You can use this to host many websites as separate sites on one Liferay DXP server. To configure virtual hosts site URLs,

1. With your provider, set the DNS name to point to your Liferay DXP instance's IP address. You can refer to [a guide from a common provider on how to assign a domain](https://www.bluehost.com/help/article/how-to-assign-a-domain) as an example.

1. Inside Liferay DXP, open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Configuration*, and go to *Site Settings* &rarr; *Site Configuration* &rarr; *Site URL*.

   ![Under Site Configuration, go to Site URL.](./configuring-virtual-hosts-site-urls/images/01.png)

1. Enter the desired domain or subdomain in the *Virtual Host* field (e.g., `www.helloworld.com`, `http://developers.helloworld.com`).

   ![You can point virtual hosts to specific locales.](./configuring-virtual-hosts-site-urls/images/02.png)

   !!! important
       A domain can only be applied to a single site. You can't map a single domain to multiple sites.

1. (Optional) Since Liferay 7.3 GA2, click the *Plus* button (![Plus Button](../../../images/icon-plus.png)) for additional Virtual Host domains.

1. (Optional) Since Liferay 7.3 GA2, select a language for each virtual host. If you have a domain for each translation of a site, you can add a virtual host for each domain.

   !!! note
       Locales are constrained to the site's available languages, if defined. If a locale isn't specified, the default locale for the site is used. The locale applies to sites for all associated domains.

   ![You can add multiple virtual hosts to point to different domains.](./configuring-virtual-hosts-site-urls/images/03.png)

1. Click *Save*.

Your site is now accessible using the configured domain.

## Related Topics

- [Configuring Your Site's Friendly URL](./configuring-your-sites-friendly-url.md)
- [Setting Up Redirects and 404 Tracking](./setting-up-redirects-and-404-tracking.md)
