---
taxonomy-category-names:
- Sites
- SEO
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 90e51a81-18ae-42b7-aa08-e802b6618597
---

# Configuring Hreflang Meta Data

Hreflang tags are HTML attributes used to identify the language and geographic region targeted by alternative versions of a site page. In some cases, these attributes can help search engines serve the correct version of a page to users and contribute to SEO. By default, Liferay DXP populates page hreflang meta data with all available languages in the site.

Beginning with Liferay 7.4+ DXP/Portal, you can configure this behavior to only generate hreflang meta data for languages with translated content in a page. This can be [configured at both the instance and site levels](../../system-administration/configuring-liferay/understanding-configuration-scope.md).

When hreflangs are limited in this way, Liferay's behavior can vary depending on page type.

- **Widget Pages**: Languages used to translate a widget page's name are added to the hreflang tags.

- **Content Pages**/**Display Page Templates**: Languages used to translate a page fragment are added to the hreflang tags.

## Configuring Hreflang Behavior at the Instance Level

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Instance Settings* &rarr; *Pages* &rarr; *SEO* (Virtual Instance Scope).

1. Check/Uncheck *Enable Only Translated Hreflangs*.

   ![Enable or disable the hreflang behavior for all instance Pages.](./configuring-hreflang-meta-data/images/01.png)

1. Click *Save*.

When enabled, hreflang meta data is only generated for languages with translated content in a Page. When disabled, Page hreflang tags are populated with all available languages in a site.

## Configuring Hreflang Behavior for All Sites in an Instance

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Instance Settings* &rarr; *Pages* &rarr; *SEO* (Site Scope).

1. Check/Uncheck *Enable Only Translated Hreflangs*.

   ![Enable or disable the hreflang behavior for all sites.](./configuring-hreflang-meta-data/images/02.png)

1. Click *Save*.

When enabled, hreflang meta data is only generated for languages with translated content in a Page. When disabled, page hreflang tags are populated with all available languages in a site.

!!! note
    By default, site scope instance settings are applied to all instance sites. However, [individual site configurations](#configuring-hreflang-behavior-for-an-individual-site) override configurations in the Global Menu. To restore the default behavior and synchronize changes between both menus, you must restore the individual site's settings to default.

## Configuring Hreflang Behavior for an Individual Site

1. Navigate to the desired *Site*.

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Configuration*, and go to *Site Setting* &rarr; *Pages* &rarr; *SEO*.

1. Check/Uncheck *Enable Only Translated Hreflangs*.

   This configuration only affects Pages in the current site.

   ![Enable or disable the hreflang behavior for a site's pages.](./configuring-hreflang-meta-data/images/03.png)

1. Click *Save*.

When enabled, hreflang meta data is only generated for languages with translated content in a page. This configuration affects all pages in the current site and overrides the instance configurations settings.

!!! note
    By default, individual site settings are inherited from [site scope instance settings](#configuring-hreflang-behavior-for-all-sites-in-an-instance). However, individual site configurations override this behavior. To restore the default behavior and synchronize changes between both menus, you must restore the individual site's settings to default.

## Related Topics

- [Site Localization](./site-localization.md)
- [Exporting and Importing Translations](../../content-authoring-and-management/translating-pages-and-content.md)
