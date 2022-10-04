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

Liferay provides two publishing tools for content creation and site building: Publications and Staging. Each tool provides a way to edit sites and content in a working environment without affecting end users. However, they both achieve this using different frameworks that have varying integration with other Liferay features. While Publications is recommended for most use cases, selecting the right publishing tool can depend on your needs.

```{important}
Presently, Liferay's publishing tools do not support [Commerce applications](https://learn.liferay.com/commerce/latest/en/index.html) and [custom Objects](../building-applications/objects.md).
```

## Publications

Publications is a change tracking tool for editing sites and content. With it, contributors can create working environments called *publications* where they can work without affecting end users (i.e., *production*). These publications are instance scoped and can group changes across multiple sites and asset libraries. Each instance can have as many publications as needed.

By default, access to a publication is limited to its creator. However, creators can invite other members and assign them roles specific to their publications. Since each publication is independent, contributors can make and publish their changes without affecting one another. This frees them up to work on their own timelines and publish their changes when ready.

During the publishing process, Liferay checks for any conflicts with production and prompts the user to review and resolve them. Some conflicts can be automatically resolved, while others require manual resolution. Once published, these changes are automatically populated to other publications if there are no conflicts. Publications also maintains a detailed history of published changes, which you can use to quickly review and revert changes if needed.

Together, these features provide a superior editing and collaboration experience. See [Enabling Publications](./publishing-tools/publications/enabling-publications.md) for how to set up Publications for your instance.

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
