# Site Templates

```{toctree}
:maxdepth: 4

site-templates/creating-site-templates.md
site-templates/propagating-template-changes.md
site-templates/configuring-site-template-propagation.md
site-templates/exporting-importing-site-templates.md
```

Liferay provides Site Templates for designing structures and content that you can use during Site creation. Each template includes most standard Site applications for adding Pages, Stylebooks, Web Content, and more. Sites created with a template inherit all of its data. See [Creating Site Templates](./site-templates/creating-site-templates.md) for more information.

```{note}
Site Templates support all Site applications except Staging, Workflow, Memberships, Teams, and Segments.
```

Once you've created a Site using a template, you can make changes to the template's Pages and automatically propagate those changes to connected Sites. See [Propagating Template Changes](./site-templates/propagating-template-changes.md) for more information.

```{important}
Site Templates are primarily intended for maintaining Pages across multiple Sites. If you need to create and maintain Web Content and other assets across Sites, use [Asset Libraries](../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md).
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Creating Site Templates
:link: ./site-templates/creating-site-templates.md
:::

:::{grid-item-card} Propagating Template Changes
:link: ./site-templates/propagating-template-changes.md
:::

:::{grid-item-card} Configuring Site Template Propagation
:link: ./site-templates/configuring-site-template-propagation.md
:::

:::{grid-item-card} Exporting and Importing Site Templates
:link: ./site-templates/exporting-importing-site-templates.md
:::
::::
