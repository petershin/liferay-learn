---
toc:
- ./publishing-tools/staging.md
- ./publishing-tools/publications.md
---
# Publishing Tools

```{toctree}
:maxdepth: 3

publishing-tools/staging.md
publishing-tools/publications.md
```

Liferay provides two publishing tools for content creation and site building: Publications and Staging. Each tool provides a way to edit sites and content in a working environment without affecting end users. While Publications is recommended for most use cases, selecting the right publishing tool can depend on your needs.

```{important}
Presently, [Commerce](https://learn.liferay.com/commerce/latest/en/index.html) and [Objects](../building-applications/objects.md) are not supported by Liferay's publishing tools.
```

## Publications

With the Publications tool, contributors can create multiple *publications* for tracking and publishing changes to *production*. Each publication is instance scoped and can include changes across multiple sites and asset libraries. When working on your publications, you can seamlessly switch between edit and production modes.

<!--Publications creates a database column for determining which version of your content is displayed in production. It also maintains a detailed history, so you can quickly review and revert changes to your instance.-->

You can create as many publications as you need, each with its own contributors and roles. Also, since publications are independent, contributors can make and publish changes without affecting one another, freeing them up to work on their own timelines. Together, these features provide a superior collaboration experience over Staging.

```{important}
Beginning with Liferay 7.4 U44/GA44, Publications is fully integrated with [Workflow](../process-automation/workflow.md), so you can enable custom workflows for entities tracked by Publications.
```

## Staging

With the Staging tool, contributors work in a shared *staging* environment before publishing their changes to a *live* environment. Staging is enabled for sites and asset libraries individually. When enabled, Liferay creates a separate copy of the original site or library and either hosts them on the same server (i.e., [Local Live Staging](./publishing-tools/staging/configuring-local-live-staging.md)) or on separate servers (i.e., [Remote Live Staging](./publishing-tools/staging/configuring-remote-live-staging.md)).

All changes are site or asset library scoped, and during setup you can determine the pages and application data you want to stage. Only changes to *staged* data is tracked. You can then publish your changes when ready, either individually or all together, while the Live environment handles incoming user traffic.

In general, Publications is recommended over Staging. However, Remote Live Staging is recommended in scenarios that require content to be created in a different environment than where it's consumed. This is because Publications does not currently offer a remote option.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Staging
:link: ./publishing-tools/staging.md
:::

:::{grid-item-card} Publications
:link: ./publishing-tools/publications.md
:::
::::
