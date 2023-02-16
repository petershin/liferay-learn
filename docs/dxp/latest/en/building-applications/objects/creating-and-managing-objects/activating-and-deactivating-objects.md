---
uuid: 173b877c-0cd6-491d-9af3-25b8b494422f
---
# Activating and Deactivating Objects

By default, objects are *Activated* and available for use when they're first [published](./creating-objects.md#publishing-object-drafts). While active, users can access the object and its entries via the Liferay UI and Headless API calls. However, you can deactivate custom objects at any time.

Deactivating an object removes it from its Panel Category, integrated frameworks, and related objects. While inactive, you can only edit and extend an object in the Objects application. If an object's entries appear in a site or related object at the time it's deactivated, those entries are blank, and their fields no longer appear in any related object layouts.

You can reactivate any inactive object to make it and its data available for use.

```{important}
Deactivating an object does not affect its data; it only prevents users from accessing it until the object is reactivated.
```

To activate or deactivate a custom object,

1. Open the Global Menu (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the desired object. You cannot deactivate system objects.

1. Under Object Data in the Details tab, toggle the switch to *Active* or *Inactive*.

   ![Switch the object to Active or Inactive.](./activating-and-deactivating-objects/images/01.png)

1. Click *Save*.

## Additional Information

* [Creating Objects](./creating-objects.md)
* [Deleting Objects](./deleting-objects.md)
* [Exporting and Importing Object Definitions](./exporting-and-importing-object-definitions.md)
