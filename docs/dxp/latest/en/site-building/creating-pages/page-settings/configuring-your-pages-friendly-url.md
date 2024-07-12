---
taxonomy-category-names:
    - Sites
    - Pages and Composition
    - Liferay Self-Hosted
    - Liferay PaaS
    - Liferay SaaS
uuid: aaa9de0f-6a67-46ae-8d09-1ea9139b8465
---

# Configuring Your Page's Friendly URL

{bdg-secondary}`Liferay 7.3+`

You can set friendly URLs for each of your site's pages. These URLs make it easy to understand and recall your page's address while providing key information for search engines and other tools crawling your site.

When you create a site page, a friendly URL is generated to match the page's name automatically, though you can change it at any time. Liferay also maintains a history of previously used URLs for a page to prevent broken links and provide an easy way to revert changes.

## Changing a Page's Friendly URL

To change a page's friendly URL, open the _Product Menu_ and go to _Site Builder_ &rarr; _Pages_. Then click _Actions_ (![Actions button](../../../images/icon-staging-bar-options.png)) for the page you want to customize and select _Configure_.

![Click on the Actions button for the page you want to customize, and select Configure](./configuring-your-pages-friendly-url/images/01.png)

Alternatively, you can access individual page settings by navigating to the page you want to customize and clicking on the _Configure Page_ button (![Configure Page Button](../../../images/icon-cog.png)) at the top right of the _Application Bar_.

In the General tab, use the _Friendly URL_ field to enter a new URL for the page. To set a localized URL, click on the _Language Flag_ and select your desired language. When finished, click _Save_.

![Use the Friendly URL field to set a page's custom URL.](./configuring-your-pages-friendly-url/images/02.png)

The value entered in this field is appended to its [site URL](../../site-settings/managing-site-urls/configuring-your-sites-friendly-url.md) and must be unique.

!!! note
When setting a custom URL, you don't have to maintain the site's page hierarchy. This means a child page does not need to include its Parent as part of its friendly URL.

## Managing a Page's URL History

Liferay DXP maintains a list of all friendly URLs used for a page. This means that when you change a friendly URL, old URLs remain associated with your page to prevent broken links, unless manually removed. For page requests using an old URL, Liferay provides a redirect to the browser (or other consumer) pointing to the active friendly URL. By default, Liferay uses temporary (302) redirects for a page's friendly URL history, but you can configure the type if needed. See [Configuring Friendly URL Redirects](../../site-settings/managing-site-urls/configuring-friendly-url-redirects.md)

To view and manage the full list of URLs associated with a page, click _History_ (![Friendly URL History icon](../../../images/icon-history.png)). This displays the page's active and old URLs for the selected language. You can also click _Language Flag_ to view set URLs for other languages.

![View a page's friendly URL History by language.](./configuring-your-pages-friendly-url/images/03.png)

From here, you can hover over an old URL to reveal the following options:

**Restore URL**: If you want to replace the active URL with an old one, click _Restore URL_ (![Restore icon](../../../images/icon-restore2.png)) for the URL you want to make active.

**Forget URL**: If you no longer want a friendly URL associated with a page, click _Forget URL_ (![Delete icon](../../../images/icon-delete.png)). When users attempt to access the page using a forgotten URL, the link breaks and Liferay renders a “Not found” message.

![Hover over an old URL to reveal the Restore and Forget options.](./configuring-your-pages-friendly-url/images/04.png)

## Related Topics

- [Configuring Your Site's Friendly URL](../../site-settings/managing-site-urls/configuring-your-sites-friendly-url.md)
- [Configuring Individual Pages](./configuring-individual-pages.md)

<!--Include Reference to SEO article when finished.-->
