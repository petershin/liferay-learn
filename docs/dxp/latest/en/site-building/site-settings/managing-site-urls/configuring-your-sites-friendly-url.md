---
taxonomy-category-names:
- Sites
- SEO
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: b65d9176-d694-4e53-8c3d-973fd6942ae8
---

# Configuring Your Site's Friendly URL

Friendly URLs are readable URLs that can helps users quickly access your site. Each URL must be unique and is appended to `https://localhost:8080/web` (e.g., `https://localhost:8080/web/helloworld/`).

!!! note
    When private pages are enabled, you can set friendly URLs for them as well. Once set, they are appended to `https://localhost:8080/group`.

## Setting a Site's Friendly URL

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Configuration*, and go to *Site Settings* &rarr; *Site Configuration* &rarr; *Site URL*.

1. Enter a *Friendly URL*.

1. Click *Save*.

![You can configure a friendly URL for your site.](./configuring-your-sites-friendly-url/images/01.png)

If you want to add a friendly URL for your site's home page, follow the additional steps in the next section.

## Setting Your Instance's Home URL

The home URL refers to the default URL or path to which users are redirected when they access the base URL of the Liferay instance, such as `http://localhost:8080`.

If you add a friendly URL for your instance's home page, you should update your instance's home URL field so that page requests to the home URL redirect properly. Failing to do so may cause inconsistencies between the URL paths, redirect problems, and broken links. To set your instance's home URL,

1. Open the [Global Menu](../../../getting-started/navigating-dxp.md) (![Global Menu icon](../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Instance Settings*.

1. Select *Instance Configuration* under the *Platform* heading and click the *General* link.

1. Under *Navigation*, enter your new friendly home URL into the *Home URL* field. For example, setting the friendly URL of your default site to `/my-site` makes your site's public home page's URL `https://localhost:8080/web/my-site/home`. So, you would enter `/web/my-site/home`.

![Enter the updated home URL to redirect to your new friendly URL.](./configuring-your-sites-friendly-url/images/02.png)

Once you've entered this setting, page requests to `localhost:8080` redirect to the friendly URL of your Liferay DXP instance's new home page.

## Related Topics

- [Configuring Virtual Hosts Site URLs](./configuring-virtual-hosts-site-urls.md)
- [Setting Up Redirects and 404 Tracking](./setting-up-redirects-and-404-tracking.md)
