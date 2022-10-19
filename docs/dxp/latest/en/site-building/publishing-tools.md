---
toc:
- ./publishing-tools/comparing-publishing-tools.md
- ./publishing-tools/publications.md
- ./publishing-tools/staging.md
---
# Publishing Tools

```{toctree}
:maxdepth: 3

publishing-tools/comparing-publishing-tools.md
publishing-tools/publications.md
publishing-tools/staging.md
```

Liferay provides two publishing tools for content creation and site building: Publications and Staging. Each tool provides a way to edit sites and content in a working environment without affecting end users. However, they both achieve this using different frameworks that have varying integration with other Liferay features. Publications is recommended for all use cases except when you need to host your working and production environments on separate servers. In this case, you must use Remote Live Staging. See [Comparing Publishing Tools](./publishing-tools/comparing-publishing-tools.md) for more information.

```{important}
Presently, Liferay's publishing tools do not support [Commerce applications](https://learn.liferay.com/commerce/latest/en/index.html) or [custom Objects](../building-applications/objects.md).
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Comparing Publishing Tools
:link: ./publishing-tools/comparing-publishing-tools.md
:::

:::{grid-item-card} Publications
:link: ./publishing-tools/publications.md
:::

:::{grid-item-card} Staging
:link: ./publishing-tools/staging.md
:::
::::
