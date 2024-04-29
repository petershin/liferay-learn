---
toc:
  - ./understanding-object-integrations/permissions-framework-integration.md
  - ./understanding-object-integrations/using-custom-object-apis.md
  - ./understanding-object-integrations/managing-guest-user-entries.md
uuid: d5bab8bf-972f-49d9-98f1-f77e13ca3428
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Understanding Object Integrations

Published custom objects are integrated with Liferay's core frameworks, so you can leverage Liferay's features to build unified experiences across the platform. This chart provides an overview of how Objects leverages these integrations.

| Framework                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|:---------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Asset                      | Use the [Attachment field](./creating-and-managing-objects/fields/attachment-fields.md) to upload files to your instance's document library.                                                                                                                                                                                                                                                                                                                                  |
| Audit                      | Enable and audit entry history for custom object definitions using the [Audit application](./creating-and-managing-objects/auditing-object-events.md) or REST APIs.                                                                                                                                                                                                                                                                                                |
| Categorization             | Add categorization tools to custom object layouts so users can add [tags and categories](./creating-and-managing-objects/layouts/designing-object-layouts.md#adding-categorization) to entries.                                                                                                                                                                                                                                                                               |
| Headless                   | Liferay generates a [headless endpoint](./understanding-object-integrations/using-custom-object-apis.md) for each published object, so you can make REST calls. <!-- TASK: Add GraphQL when supported.-->                                                                                                                                                                                                                                                               |
| Info                       | Use object data with [Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md), [Fragments](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md), [Navigation Menus](../../site-building/site-navigation/using-the-navigation-menus-application.md). Liferay also creates a [Collection Provider](../../content-authoring-and-management/collections-and-collection-pages.md) for displaying its entries. |
| Localization               | Localize fields for object definitions to better serve your global users.                                                                                                                                                                                                                                                                                                                                                                                                     |
| Permissions                | Manage application and resource permissions to control access to object definitions and their data.                                                                                                                                                                                                                                                                                                                                                                           |
| User Associated Data (UAD) | Manage user-associated data in object definitions and entries. See [Managing User Data (GDPR)](../../users-and-permissions/managing-user-data.md) for more information.                                                                                                                                                                                                                                                                                                       |
| Workflow                   | Enable custom workflows for objects to direct the creation, review, and publishing of object entries.                                                                                                                                                                                                                                                                                                                                                                         |

<!-- TASK: Add the following integrations when ready -->
<!-- | Job Scheduler | Use the [Job Scheduler](../core-frameworks/job-scheduler-framework/using-job-scheduler.m) application to run Talend data integration tasks (e.g., bulk imports, data syncs). You can run them manually or schedule them to run at regular intervals. |-->
<!-- | Publications |  | -->

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: understanding-object-integrations/landing.html
```
