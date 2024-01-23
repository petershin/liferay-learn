---
toc:
  - ./data-sets/creating-data-sets.md
  - ./data-sets/creating-data-set-views.md
uuid: 314a9243-1503-437a-a275-802b8b5a571b
---
# Data Sets

Data sets are collections of related data that may be accessed individually or in combination, or managed as a whole entity.

For example, a list of suppliers, with fields like company name, email address, phone number, and address is a data set.

In Liferay, it is possible to create data sets from different resources available through RESTful APIs. This includes, but is not restricted to, object definitions, blog postings, documents, roles, user accounts, commerce-related elements, knowledge base articles, etc.

![Use resources available through RESTful APIs to create data sets.](./data-sets/images/01.png)

Create *Data Set Views* for your data set to customize and display specific information for different roles within your organization. For instance, employees in the Purchases sector can view only purchase-related details in the supplier dataset, while managers can access all fields related to suppliers.

Display your data set view by using the Data Set fragment in a content page. Combine it with [experiences](../site-building/personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) and [segments](../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) to show different content to different people and use the [simulation panel](../site-building/optimizing-sites/building-a-responsive-site/using-the-simulation-panel.md) to preview the content before publishing it.

![Create different views for each data set and show different information to different people.](./data-sets/images/02.png)

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: data-sets/landing.html
```