---
taxonomy-category-names:
- Sites
- Pages and Composition
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 05b26b7e-47e6-4d5e-9814-5bc02a7691f7
---

# Configuring Page Sets

!!! important
    For Liferay 7.4 U22+ and GA22+, private pages are disabled for new installations. However, you can enable them if desired. See [Enabling Private Pages](../understanding-pages.md#enabling-private-pages) for more information.

When private pages are enabled, site pages are divided into public and private [page sets](../understanding-pages.md#page-sets). These sets group pages so you can apply bulk configurations to each type of page. Settings configured for a page set apply to all grouped pages and override configurations at the site level. Page set configurations are overridden by [customizations to individual pages](./configuring-individual-pages.md).

If private pages are disabled for your Liferay system, follow these steps to access bulk configuration options for your pages:

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Site Builder*, and click *Pages*.

1. Click the *Actions* button (![Actions Button](../../../images/icon-actions.png)) in the Application Bar and select *Configuration*.

![Click the Actions button in the Application Bar and select Configuration](./configuring-page-sets/images/01.png)

If Private Pages are enabled for your Liferay system, follow these steps to access Page Set configuration options:

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Site Builder*, and click *Pages*.

1. Click the *Gear* icon (![Gear Button](../../../images/icon-cog3.png)) for either *Public Pages* or *Private Pages*.

![Click the Gear icon to access the Page Set's configuration Options.](./configuring-page-sets/images/02.png)

## Configuring the Page Set's Look and Feel

In the *Look and Feel* tab, you can customize the Page Set's theme and logo settings.

### Look and Feel

Themes create the overall feel for the Site and can transform the look entirely. The *Current Theme* section displays the Theme currently applied to the Page Set, along with any configurable theme settings and color schemes that the Theme has. Many Themes include more than one color scheme, which keeps the existing look and feel while giving the Site a different flavor.

![The Look and Feel interface allows you to choose a theme for the current site.](./configuring-page-sets/images/03.png)

To change the current theme,

1. Click the *Change Current Theme* button and select the Theme from the window that appears.

1. Select your desired theme.

    ![Choose from one of the available themes.](./configuring-page-sets/images/04.png)

1. Click *Save* to apply the new Theme to the Page Set.

You can enter custom CSS in the *CSS* section for modifying your theme. You can apply Themes to the entire Site (described here) or to individual pages (described in [Configuring Pages](./configuring-individual-pages.md#look-and-feel)).

### Logo

By default, the Liferay logo is used for your Site's pages. To use your own logo for a Site,

1. Expand the *Logo* section.

1. Click the *Change* button.

1. Browse to the location of your logo. Make sure your logo fits the space in the top left corner of the Theme you're using for your Site. If you don't, your other page elements are pushed aside to make way for the logo.

1. Choose whether to display the Site name on the Site. When *Show Site Name* is enabled, the Site name appears next to the logo.

    ```{note}
    This option is enabled by default and can't be disabled if the *Allow Site Administrators to set their own logo* option is disabled in *Instance Settings*. Removing the Site name is not available for the default Liferay Site---you can configure this only for new Sites and User pages.
    ```

1. Click *Save*.

The Site's logo settings are now configured.

## Configuring the Page Set's Advanced Settings

The *Advanced* tab contains several options that can impact the Site and overall performance. Administrators should proceed with caution.

![The Advanced tab contains multiple options that enhances your Site.](./configuring-page-sets/images/05.png)

### JavaScript

In the *JavaScript* tab, you can paste JavaScript in the JavaScript editor. Code entered here is executed at the bottom of every page in the Site. Your Site's JavaScript is most likely (and should be) included with the Theme. However, this may be a good place to quickly test JavaScript code while not in production.

### Advanced Settings

If you have multiple Sites, one Site is marked as the *Default Site* that visitors see when they visit your domain name. By default, only the default Site's Public Pages are displayed in the navigation.

You can display another Site's Public Pages in the default Site's navigation by enabling the *Merge public pages* option for that Site.

```{warning}
Adding too many pages to the main navigation can make it become unwieldy very quickly.
```

1. Check the *Merge Liferay DXP public pages* box.

    ![You can merge your Site's top level with the DXP Guest site.](./configuring-page-sets/images/06.png)

1. Click *Save* when finished.

### Mobile Device Rules

You can add *Mobile Device Rules* to configure behaviors for specific mobile devices or types for the Page Set. Mobile device rules are inherited from your Public Pages, but you can define specific rules per page. You can edit the Look and Feel of specific pages for mobile devices, including the theme. See [Mobile Device Rules](../../optimizing-sites/building-a-responsive-site/creating-mobile-device-rules.md) for more information.

### Robots

Here you can configure search and indexing rules in the `robots.txt` rules for the domain's public and private pages. The `robots.txt` file provides instructions to search engines and other tools that are automatically crawling and indexing your Site. For example, you can specify not to index certain pages.

### Sitemap

This generates a sitemap you can send to some search engines so they can crawl your Site. It uses the industry standard sitemap protocol. Select a search engine link to send the sitemap to it (only required once per Site), or select the *preview* link to see the generated XML that is sent to search engines.

## Using the Page Tree Menu

In Liferay DXP 7.3, you can access the same settings from the *Page Tree* menu:

1. Open the *Site Menu* (![Site Menu](../../../images/icon-menu.png)) and click *Page Tree* (![Page Tree](../../../images/icon-page-tree.png)).

1. Select *Public Pages* or *Private Pages* from the dropdown menu.

1. Click the Gear icon.

    ![You can access the same Page Sets options from the Page Tree menu.](./configuring-page-sets/images/07.png)

## Related Topics

* [Configuring Individual Pages](./configuring-individual-pages.md)
