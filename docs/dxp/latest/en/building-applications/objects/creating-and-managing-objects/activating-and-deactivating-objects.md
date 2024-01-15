---
uuid: 173b877c-0cd6-491d-9af3-25b8b494422f
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Activating and Deactivating Objects

Custom objects are *activated* when [published](./creating-objects.md#publishing-object-drafts). While active, you can use the object to create entries via the Liferay UI or dedicated REST APIs. If needed, you can deactivate custom objects at any time.

This prevents users from creating or accessing its entries. While inactive, its data is unavailable, and you can only edit the object's definition. If the object has relationships, it no longer appears in its related objects' layouts. Additionally, the object does not appear in any [integrated frameworks](../understanding-object-integrations.md) (e.g., permissions, workflow). This means that site elements referencing the object's entries become blank.

Deactivating an object does not affect its data; it only prevents users from accessing it until the object is reactivated.

To deactivate or reactivate a custom object,

1. Open the Global Menu (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the desired object. You cannot deactivate system objects.

1. Under Object Data in the Details tab, toggle the switch to *Active* or *Inactive*.

   ![Switch the object to Active or Inactive.](./activating-and-deactivating-objects/images/01.png)

1. Click *Save*.

## Related Topics

* [Creating Objects](./creating-objects.md)
* [Deleting Objects](./deleting-objects.md)
* [Exporting and Importing Object Definitions](./exporting-and-importing-object-definitions.md)
