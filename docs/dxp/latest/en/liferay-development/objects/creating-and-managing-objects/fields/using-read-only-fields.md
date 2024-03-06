---
uuid: a50d28b9-ca13-4227-8480-d968dc8fc470
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using Read-Only Fields

Some use cases may require data fields to be read-only. For example, data integrity may require some field values to remain immutable, or you may need to prevent unauthorized users from updating specific fields (e.g., [state fields](./adding-and-managing-custom-states.md)). You can configure any custom field to be read-only. This prevents users from directly updating the field's value except under specified conditions. You can also use [actions](../actions.md) to update these field values.

## Adding a Read-Only Field

1. Begin editing the desired [custom field](./adding-fields-to-objects.md).

1. Go to the *Advanced* tab.

1. Select a Read Only option:

   **True**: Mark the field as read-only.

   **False**: Allow users to change the field's value.

   **Conditional**: Use expression builder to set conditions for when the field is read-only.

   ![Select a Read Only option: true, false, or conditional.](./using-read-only-fields/images/01.png)

1. Click *Save*.

## Example Use Case: Event Speaker Applications

Consider an event solution with these requirements:

* Users must submit applications to speak at a company event.

* Event managers must track each application's status during the review process.

* Event managers must track when the state field was last updated.

To achieve this, first create a picklist for defining application statuses. Then, create an object for storing submissions and use the picklist as a [state field](./adding-and-managing-custom-states.md). Set this field to read-only and add [standalone actions](../actions/using-manual-actions.md) for manually updating the field to specific values. Only assign the [action permissions](../actions/using-manual-actions.md#action-permissions) to event managers, so only they can update the state field.

For the final requirement, add a read-only date field. Then, create an [automatic action](../actions/defining-object-actions.md) that updates the field to the `modifiedDate` value whenever the state field is updated.

## Related Topics

* [Adding Fields to Objects](./adding-fields-to-objects.md)
* [Adding and Managing Custom States](./adding-and-managing-custom-states.md)
* [Defining Object Actions](../actions/defining-object-actions.md)
