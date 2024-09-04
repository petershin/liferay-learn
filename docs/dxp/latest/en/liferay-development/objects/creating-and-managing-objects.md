---
toc:
  - ./creating-and-managing-objects/creating-objects.md
  - ./creating-and-managing-objects/extending-system-objects.md
  - ./creating-and-managing-objects/using-the-objects-model-builder.md
  - ./creating-and-managing-objects/organizing-objects-with-folders.md
  - ./creating-and-managing-objects/fields.md
  - ./creating-and-managing-objects/relationships.md
  - ./creating-and-managing-objects/actions.md
  - ./creating-and-managing-objects/layouts.md
  - ./creating-and-managing-objects/views.md
  - ./creating-and-managing-objects/validations.md
  - ./creating-and-managing-objects/localizing-object-definitions-and-entries.md
  - ./creating-and-managing-objects/using-system-objects-with-custom-objects.md
  - ./creating-and-managing-objects/activating-and-deactivating-objects.md
  - ./creating-and-managing-objects/exporting-and-importing-object-definitions.md
  - ./creating-and-managing-objects/auditing-object-events.md
  - ./creating-and-managing-objects/deleting-objects.md
  - ./creating-and-managing-objects/managing-objects-with-headless-apis.md
uuid: d42bd20c-4087-4203-9aee-d254c5bc2346
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Creating and Managing Objects

{bdg-secondary}`Liferay 7.4+`

Liferay Objects provides a convenient UI for [creating](./creating-and-managing-objects/creating-objects.md) custom applications that meet your business needs without writing code. You can also use Objects to manage and extend both system and custom objects. This includes adding [fields](./creating-and-managing-objects/fields.md), [relationships](./creating-and-managing-objects/relationships.md), [actions](./creating-and-managing-objects/actions.md), [layouts](./creating-and-managing-objects/layouts.md), [views](./creating-and-managing-objects/views.md), [validations](./creating-and-managing-objects/validations.md), and [custom states](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md). You can also use the Model Builder GUI to design complex object structures. This graphical tool shows object definitions as cards and visualizes relationships between definitions. See [Using the Objects Model Builder](./creating-and-managing-objects/using-the-objects-model-builder.md) for more information.

!!! note 
    System objects are default Liferay applications integrated with the objects framework, while custom objects are definitions created and published by a user.

## Searching for Objects

You can use two configurations in the Objects application to exert control over searching for object entries: 

1. Enable or disable search for an object definition's entries using the Enable Indexed Search configuration in its Details tab.

1. If the object is indexed for searching, configure the [each field's](./creating-and-managing-objects/fields/adding-fields-to-objects.md) search behavior.

See [Searching for Liferay Objects](../../using-search/getting-started/searching-for-content.md#searching-for-liferay-objects) for more information.
