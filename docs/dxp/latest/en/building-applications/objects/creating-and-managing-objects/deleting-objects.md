---
uuid: 5ac040c5-195f-48d2-812e-0e024637d1c5
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Deleting Objects

{bdg-secondary}`Liferay 7.4 U26+/GA26+`

You can delete draft and published object definitions. Deleting a definition removes its associated data, including the stored entries for published definitions.

```{important}
For versions before Liferay 7.4 U26/GA26, users cannot delete [published object definitions](./creating-objects.md#publishing-object-drafts).
```

If a definition has active relationships, you must remove them before you can delete the definition. See [Removing Relationships](./relationships/removing-relationships.md) for more information.

![You must remove all active relationships before deleting an object definition.](./deleting-objects/images/01.png)

To delete the definition,

1. Open the Global Menu (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Actions* button (![Actions Button](../../../images/icon-actions.png)) for the desired definition and select *Delete*.

1. In the dialog window, enter the name of the definition and click *Done* to confirm.

   ![Enter the name of the object definition and click Done.](./deleting-objects/images/02.png)

## Related Topics

* [Creating Objects](./creating-objects.md)
* [Activating and Deactivating Objects](./activating-and-deactivating-objects.md)
* [Exporting and Importing Object Definitions](./exporting-and-importing-object-definitions.md)
