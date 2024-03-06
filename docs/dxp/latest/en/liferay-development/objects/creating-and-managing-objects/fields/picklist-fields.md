---
uuid: 0e3e6564-94b9-40d9-b041-a17f28877d0b
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Picklist Fields

{bdg-secondary}`Liferay 7.4 U72+/GA72+`

Picklists define lists of text values usable as single select or multi-select fields in object definitions. By default, single select fields appear as drop-down menus, while multi-select fields appear as checkboxes.

You can configure a single select field to use a default value, which can be static or dynamic. Additionally, you can use single select fields to define custom states for object entries and integrate [validations](../validations/adding-field-validations.md), [actions](../actions/defining-object-actions.md), and [workflow processes](../../enabling-workflows-for-objects.md) with the object definition to implement complex business logic.

## Setting Default Values

1. Begin editing the desired Picklist field.

1. Go to the *Advanced* tab and toggle *Use Default Value*.

   ![Toggle Use Default Value and select either Input as Value or Expression Builder.](./picklist-fields/images/01.png)

1. Determine how to set the default value.

   *Input as Value*: Select a value from the picklist.

   *Expression Builder*: Create an expression that sets the value dynamically.

1. Click *Save*.

Now when users create entries, the picklist field defaults to the set value.

```{important}
You cannot delete a list if it is used by an object field, though you can edit and remove list items at any time.

Updating or deleting a picklist item automatically updates all object entries using the item value.
```

## Using Picklist Fields with APIs

When making POST, PATCH, and PUT API calls for objects that include a picklist field, you must use the following request payload formats for Picklist and Multiselect Picklist fields, respectively.

### Picklist Field Type

```json
{ 
      "picklistExample": {
        "key": "firstOption",
        "name": "First Option"
      }
}
```

### Multiselect Picklist Field Type

```json
{ 
      "picklistExample": [
        {
          "key": "firstOption",
          "name": "First Option"
        },
        {
          "key": "secondOption",
          "name": "Second Option"
        }
      ]
}
```

## Related Topics

* [Picklists](../../picklists.md)
* [Adding and Managing Custom States](./adding-and-managing-custom-states.md)
