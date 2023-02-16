---
toc:
  - ./picklists/using-picklists.md
  - ./picklists/managing-picklist-permissions.md
  - ./picklists/picklists-api-basics.md
uuid: 15762235-5051-4cbf-82ad-ddd513651f27
---
# Picklists

```{toctree}
:maxdepth: 3

picklists/using-picklists.md
picklists/managing-picklist-permissions.md
picklists/picklists-api-basics.md
```

Liferay Picklists are predefined lists of string values that consist of a name/key pair and can include any number of items. Once a list is [created](./picklists/using-picklists.md#creating-a-picklist), you can add it to Object definitions using the [Picklist field type](./picklists/using-picklists.md#adding-picklist-fields-to-objects). You can then use this field to [filter displayed entires](./displaying-object-entries.md) or [define custom entry states](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md). If used to define states, you can also associate custom business logic with each state using [validations](./creating-and-managing-objects/validations/adding-custom-validations.md) and [actions](./creating-and-managing-objects/actions/defining-object-actions.md).

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Using Picklists
:link: ./picklists/using-picklists.md
:::

:::{grid-item-card} Managing Picklist Permissions
:link: ./picklists/managing-picklist-permissions.md
:::

:::{grid-item-card} Picklists API Basics
:link: ./picklists/picklists-api-basics.md
:::
::::
