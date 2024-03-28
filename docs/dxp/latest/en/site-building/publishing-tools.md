---
toc:
  - ./publishing-tools/comparing-publishing-tools.md
  - ./publishing-tools/publications.md
  - ./publishing-tools/staging.md
taxonomy-category-names:
- Platform
- Publishing Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: af93e7f6-acd1-48ea-b172-95b10436de00
---
# Publishing Tools

Liferay provides two publishing tools for content creation and site building: Publications and Staging. With each tool you can edit sites and content in a working environment without affecting end users. However, they achieve this using different frameworks that have varying integration with other Liferay features. Use Publications unless you need to host your working and production environments on separate servers. In this case you must use Remote Live Staging. See [Comparing Publishing Tools](./publishing-tools/comparing-publishing-tools.md) for more information.

```{important}
Presently, Liferay's publishing tools do not support [Commerce applications](https://learn.liferay.com/commerce/latest/en/index.html) or [custom objects](../liferay-development/objects.md).
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
