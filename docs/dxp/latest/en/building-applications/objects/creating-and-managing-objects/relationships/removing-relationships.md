---
uuid: f5b4dd39-457e-4cca-b99f-9dd99a0fff8c
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Removing Relationships

{bdg-secondary}`Liferay 7.4 U26+/GA26+`

You can remove relationships from both draft and published object definitions. Removing a relationship permanently deletes its field from the related object definitions. For published definitions, this can affect many records.

```{important}
For versions before Liferay 7.4 U26/GA26, users cannot delete relationships included in an object at the time of [publishing](../creating-objects.md#publishing-object-drafts).
```

Follow these steps to remove relationships from published object definitions:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the desired object definition and go to the *Relationships* tab.

1. Click the *Actions* button (![Actions Button](../../../../images/icon-actions.png)) for the desired relationship and select *Delete*.

1. In the dialog window, enter the name of the relationship and click *Delete* to confirm.

   ![Enter the name of the relationship and click Done.](./removing-relationships/images/01.png)

## Related Topics

* [Creating Objects](../creating-objects.md)
* [Defining Object Relationships](./defining-object-relationships.md)
