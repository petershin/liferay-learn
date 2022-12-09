---
toc:
- ./validations/adding-custom-validations.md
- ./validations/expression-builder-validations-reference.md
---
# Validations

```{toctree}
:maxdepth: 3

validations/adding-custom-validations.md
validations/expression-builder-validations-reference.md
```

{bdg-secondary}`Available Liferay 7.4+`

Object validations set rules for determining valid field entries and are defined using either [Groovy scripts](./validations/adding-custom-validations.md#using-groovy-validations) or [Liferay expressions](./validations/adding-custom-validations.md#using-expression-builder-validations). When triggered, the validation checks for valid field entries according to defined conditions and displays an error message for invalid entries.

![Add field validations to object definitions.](./validations/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Adding Custom Validations
:link: ./validations/adding-custom-validations.md
:::

:::{grid-item-card} Expressions Builder Validations Reference
:link: ./validations/expression-builder-validations-reference.md
:::
::::
