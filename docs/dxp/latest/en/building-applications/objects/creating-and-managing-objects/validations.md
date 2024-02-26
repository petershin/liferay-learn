---
toc:
  - ./validations/adding-field-validations.md
  - ./validations/expression-builder-validations-reference.md
uuid: a14c4f38-68e2-411b-beb0-25890f0eac6b
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Validations

{bdg-secondary}`Liferay 7.4+`

Object validations set rules for determining valid field inputs. You can define validations with [Groovy scripts](./validations/adding-field-validations.md#using-groovy-validations), [Liferay expressions](./validations/adding-field-validations.md#using-expression-builder-validations), or a specified [Composite Key validation](./validations/adding-field-validations.md#using-composite-key-validations). When triggered, the validation checks for valid field inputs according to defined conditions and displays an error message for invalid inputs.

![Add field validations to object definitions.](./validations/images/01.png)

If out-of-the-box validations don't meet your needs, you can create custom validations using the `objectValidationRule` client extension. See [Microservice Client Extensions](../../client-extensions/microservice-client-extensions.md) for more information.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Adding Field Validations
:link: ./validations/adding-field-validations.md
:::

:::{grid-item-card} Expressions Builder Validations Reference
:link: ./validations/expression-builder-validations-reference.md
:::
::::
