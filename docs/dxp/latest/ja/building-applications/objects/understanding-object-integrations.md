---
toc:
- ./understanding-object-integrations/permissions-framework-integration.md
- ./understanding-object-integrations/headless-framework-integration.md
- ./understanding-object-integrations/assets-framework-integration.md
---

# オブジェクト統合を理解する

```{toctree}
:maxdepth: 3

understanding-object-integrations/permissions-framework-integration.md
understanding-object-integrations/headless-framework-integration.md
understanding-object-integrations/assets-framework-integration.md
```

Published custom Objects are integrated with Liferay's core frameworks, so you can leverage Liferay's features to build unified experiences across the platform. This chart provides an overview of how Objects leverages these integrations.

| Framework   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|:----------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| アセット        | Use the [Attachment field](../objects/understanding-object-field-types.md#attachment) to upload files to your instance's document library.                                                                                                                                                                                                                                                                                                                                    |
| 監査          | Use the [Audit application](./creating-and-managing-objects/auditing-object-definition-events.md) to review Object events with their user and resource info.                                                                                                                                                                                                                                                                                                                  |
| カテゴリの設定     | Add categorization tools to custom Object layouts so users can add [tags and categories](./creating-and-managing-objects/designing-object-layouts.md#adding-categorization) to entries.                                                                                                                                                                                                                                                                                       |
| Headless    | Liferay generates a [headless endpoint](./understanding-object-integrations/headless-framework-integration.md) for each published Object, so you can make REST calls. <!-- TASK: Add GraphQL when supported.--> |
| Infoフレームワーク | Use Object data with [Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md), [Fragments](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md), [Navigation Menus](../../site-building/site-navigation/using-the-navigation-menus-application.md). Liferay also creates a [Collection Provider](../../content-authoring-and-management/collections-and-collection-pages.md) for displaying its entries. |
| ローカライズ      | Localize fields for Object definitions to better serve your global users.                                                                                                                                                                                                                                                                                                                                                                                                     |
| 権限設定        | Manage application and resource  permissions to control access to Object definitions and their data.                                                                                                                                                                                                                                                                                                                                                                          |
| ワークフロー      | Enable custom workflows for Objects to direct the creation, review, and publishing of Object entries.                                                                                                                                                                                                                                                                                                                                                                         |

<!-- TASK: Add the following integrations when ready -->
<!-- | Job Scheduler | Use the \[Job Scheduler\](../core-frameworks/dispatch-framework/using-job-scheduler.md) application to run Talend data integration tasks (e.g., bulk imports, data syncs). You can run them manually or schedule them to run at regular intervals. |--><!-- | Publications |  | -->

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: understanding-object-integrations/landing.html
```
