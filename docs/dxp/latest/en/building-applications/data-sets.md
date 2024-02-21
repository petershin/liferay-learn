---
toc:
  - ./data-sets/creating-data-sets.md
  - ./data-sets/creating-data-set-views.md
  - ./data-sets/data-set-view-fields.md
  - ./data-sets/data-set-view-filters.md
  - ./data-sets/data-set-view-actions.md
  - ./data-sets/using-data-set-view-actions.md
uuid: 314a9243-1503-437a-a275-802b8b5a571b
- Development and Tooling
- Data Sets
- Liferay Self-Hosted
- Liferay SaaS
---
# Data Sets
{bdg-secondary}`Liferay DXP 2024.Q1 U112`
{bdg-link-primary}`[Beta Feature](../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

Data sets are collections of related data that can be accessed individually or in combination or managed as a single entity.

For example, a list of suppliers, with fields like company name, email address, phone number, and address is a data set.

In Liferay, use the Data Set Manager application to [create and manage data sets](./data-sets/creating-data-sets.md) from different resources available through RESTful APIs. This includes, but is not restricted to, object definitions, blog postings, documents, roles, user accounts, commerce-related elements, knowledge base articles, etc.

![Use resources available through RESTful APIs to create data sets.](./data-sets/images/01.png)

Using the data set manager, you can also [create *data set views*](./data-sets/creating-data-set-views.md) for your data set to customize and display specific information for different roles within your organization. For instance, employees in the Purchases sector can view only purchase-related details in the supplier dataset, while managers can view all fields related to suppliers.

While creating or editing your data set view, select [fields](./data-sets/data-set-view-fields.md) to show in your view, apply [filters](./data-sets/data-set-view-filters.md) to pre-filter the data, set default sorting rules, add [actions] that can redirect the user to a different URL, and configure pagination options for your data set view.

See actual use cases to learn more about using data set view actions in [Using Data Set View Actions](./data-sets/using-data-set-view-actions.md).

[Display your data set view](./data-sets/using-data-set-view-actions.md#using-a-data-set-fragment-in-a-content-page) by using the Data Set fragment in a content page. Combine it with [experiences](../site-building/personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) and [segments](../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) to show different content to different people. You can use the [simulation panel](../site-building/optimizing-sites/building-a-responsive-site/using-the-simulation-panel.md) to preview the content before publishing it.

![Create different views for each data set and show different information to different people.](./data-sets/images/02.png)

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: data-sets/landing.html
```