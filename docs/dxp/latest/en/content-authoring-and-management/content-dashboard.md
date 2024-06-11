---
toc:
  - ./content-dashboard/content-dashboard-interface.md
  - ./content-dashboard/exporting-the-assets-list-to-a-spreadsheet.md
taxonomy-category-names:
- Content Management System
- Content Dashboard
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 3973639d-af75-493d-9fbd-2b9ff4cd2854
---

# Content Dashboard

{bdg-secondary}`Available 7.3+`

!!! note
    This feature works only with [Elasticsearch](../using-search/installing-and-upgrading-a-search-engine/solr/solr-limitations.md).

The *Content Dashboard* is a global application for managing your content. From the Content Dashboard page, content authors and marketers can access and audit all content generated across sites and asset libraries.

!!! note
    For analyzing performance metrics of your content, use the [Content Performance tool](../page-performance-and-accessibility/about-the-content-performance-tool.md).

Using the Content Dashboard, content authors and marketers can analyze their content in different ways:

- Find and filter content across sites and asset libraries using built-in or custom filters.
- Analyze existing content by audience or phase in a customer journey.
- Audit content areas with enough content or content gaps to improve your content strategy.

The Content Dashboard shows information based on the categories you assign to content assets. Liferay provides the *Audience* and *Stage* global vocabularies to work along with the Content Dashboard. To learn about vocabularies and categories, see [Organizing Content with Categories and Tags](../tags-and-categories/organizing-content-with-categories-and-tags.md). To categorize your content, see [Defining Categories and Vocabularies for Content](../tags-and-categories/defining-categories-and-vocabularies-for-content.md).

## Content Dashboard Components

To access the Content Dashboard, open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Applications* &rarr; *Content Dashboard*.

![Open the Content Dashboard from the Global Menu.](./content-dashboard/images/01.png)

You can see different areas on the Content Dashboard page.

![The Content Dashboard contains several components to put lots of information at your fingertips.](./content-dashboard/images/02.png)

The [Content Audit Tool](./content-dashboard-interface.md#content-audit-tool) (1) is the graphical area at the top of the page. It shows metrics for the vocabularies and categories you define in Liferay. You can include and combine your global vocabularies here, and filter the categories to analyze your data in different ways. You can also [export and download asset lists](./content-dashboard/exporting-the-assets-list-to-a-spreadsheet.md) for further analysis.

The [Contents List](./content-dashboard-interface.md#contents-list) (2) shows content across all sites and asset libraries. From here, you can sort and filter your information using built-in or custom filters. The Content Audit Tool chart changes dynamically based on the filters that you set.

From the Contents List, you can access the [Content info](./content-dashboard-interface.md#content-info-sidebar) sidebar (3) and the [Content Performance tool](../page-performance-and-accessibility/about-the-content-performance-tool.md). The Information sidebar shows different metadata for each asset, while the Content Performance tool gathers statistics for your content, like the number of views or the traffic acquisition channels.

To learn more about the Content Dashboard interface and how to customize the information for your needs, see the [Content Dashboard Interface](./content-dashboard-interface.md) topic.
