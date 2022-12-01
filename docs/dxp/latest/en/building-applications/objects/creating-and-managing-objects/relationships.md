---
toc:
- ./relationships/defining-object-relationships.md
- ./relationships/removing-relationships.md
---
# Relationships

```{toctree}
:maxdepth: 3

relationships/defining-object-relationships.md
relationships/removing-relationships.md
```

{bdg-secondary}`For Liferay 7.4 U47+/GA47+`

Relationships add fields and tables to object definitions for relating their entries with one another. This provides access to entry data in different application contexts. You can use this data in different ways. For example, in scenarios with multiple business accounts, you can use relationships with the Account system object to [restrict access to custom object data by account](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md). Or you can use [aggregation fields](../creating-and-managing-objects/fields/aggregation-fields.md) with relationships to perform basic calculations.

![Add relationships to objects.](./relationships/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Defining Object Relationships
:link: ./relationships/defining-object-relationships.md
:::

:::{grid-item-card} Removing Relationships
:link: ./relationships/removing-relationships.md
:::
::::
