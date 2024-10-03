---
taxonomy-category-names:
- Sites
- Site Administration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 7fe6add6-690d-4c05-be41-81a2563f9570
---

# Getting Started with Site Building

Sites are a fundamental component of Liferay DXP. A site is a collection of pages with content and applications that provide functionality.

When you start your Liferay DXP instance, a default site is included. By default, the instance's name is *Liferay*. You can change this name through the Setup Wizard or in the [Instance Settings](../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) in the Control Panel.

![You can build powerful sites with Liferay DXP.](./getting-started-with-site-building/images/01.png)

## Creating Sites

Liferay DXP provides all the tools you need to [build your site](./sites/adding-a-site.md) and [create pages](./creating-pages/adding-pages/adding-a-page-to-a-site.md). You can start with an existing [site template](./sites/site-templates.md), which includes predefined pages and applications, or create a blank site to build from scratch.

Pages are equally flexible. Create them from an existing [page type](./creating-pages/understanding-pages.md), use a default [page template](./creating-pages/adding-pages/creating-a-page-template.md), or design your own template.

Sites and pages can be organized hierarchically. You can add as many nested pages (child pages) and [nested sites](./sites/site-hierarchies.md) (child sites) as needed. It's possible to have multiple sites across your Liferay DXP instance for different purposes, such as organizations or departments. You can also share content and pages between sites using [import and export options](./sites/exporting-importing-site-pages-and-content.md).

Configuring site [navigation](./site-navigation/using-the-navigation-menus-application.md) and page behavior is intuitive and flexible. You can add pages automatically to a navigation menu or hide them as needed. Use page permissions to control user access.

Liferay DXP also provides tools to make changes to your site without disrupting the user experience. You can stage your site to test updates before publishing or use [Publications](./publishing-tools/publications.md) to develop and manage changes safely without affecting the live site.

## Displaying Content

Liferay DXP's Content Management System (CMS) offers various tools to create, manage, and display diverse content types, including blogs, images, and web content articles.

To publish a mix of content types, use [Collections](../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md) or the [Asset Publisher](./displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md). With the Asset Publisher, you can select content manually or display assets dynamically based on specific criteria, giving you significant control over the user experience.

You can also embed content from external websites with the [Iframe widget](./displaying-content/additional-content-display-options/using-the-iframe-widget.md) or by creating an [embedded page](./creating-pages/understanding-pages/other-page-types.md#embedded).

For more dynamic content creation, use [Fragments](./creating-pages/page-fragments-and-widgets/using-fragments.md). Fragments are reusable pieces of code (CSS, HTML, and JavaScript) you can combine to build a page. Liferay provides many out-of-the-box fragments, and you can modify or [create your own fragments](./developer-guide/developing-page-fragments.md) as needed.

Each piece of content has a default landing page, but you can customize its appearance by creating a [Display Page Template](./displaying-content/using-display-page-templates.md). With this template, you can map fields from a piece of content (such as title, main body, and image) to fragments, so you can create the look you want.

![Display Page Templates let you map content to page fragments to display it with the design and layout you want.](./getting-started-with-site-building/images/02.png)

You can also use widgets like the [Web Content Display widget](./displaying-content/additional-content-display-options/using-the-web-content-display-widget.md) to showcase specific content, such as selected web content articles.

## Personalizing User Experiences

With Liferay DXP's [personalization and segmentation](./personalizing-site-experience.md) framework, you can create site experiences that respond to users' interests and needs.

You can [create user segments](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) based on specific criteria, such as the organizations users belong to or their roles on the site. With this segmentation, you can display [personalized page layouts and content](./personalizing-site-experience/experience-personalization/content-page-personalization.md) tailored to different user demographics.

Additionally, you can [integrate Liferay DXP with Analytics Cloud](https://learn.liferay.com/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud) to analyze user behavior within these segments. With this integration, you can analyze how users interact with your site and recommend content based on their actions.

## Customizing and Configuring Sites

Liferay offers numerous [settings](./site-settings/site-settings-ui-reference.md) to modify the appearance, behavior, and functionality of your site.

Your site's look and feel can be [enhanced by using different themes](../getting-started/changing-your-sites-appearance.md), which can be downloaded and deployed from [Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md). Alternatively, you can [create your own theme](../liferay-development/customizing-liferays-look-and-feel/themes/setting-up-an-environment-and-creating-a-theme.md) to achieve a unique design.

Themes define the overall aesthetic of a site, including CSS, JavaScript, and HTML through FreeMarker templates. FreeMarker enhances standard HTML elements with features like variables, conditional statements, and loops. See [Developing Themes](./developer-guide.md) for more information.

You can also localize [sites and their content](./site-settings/site-localization.md) to support multiple languages as needed.

## Optimizing Sites

Liferay DXP offers a range of tools to optimize your site, including improving your site's [search engine optimization (SEO) ranking](../site-building/displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md), [building a responsive site](./optimizing-sites/building-a-responsive-site.md) tailored for any device, and honing your messaging campaigns with [A/B testing](../site-building/optimizing-sites/ab-testing/ab-testing.md).

A/B testing compares the current default variation of a page with alternative variants to determine which performs better based on specific goals, such as bounce rate or click-throughs. With this data-driven approach, you can make informed decisions and improve your site's performance to better serve users and customers.
