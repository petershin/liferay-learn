---
uuid: dcb71149-fcc2-4d97-bd48-bedc5599bd7b
---
# Creating Site Templates

With Site Templates, you can design and configure templates for creating Sites. Each template is built using the same tools as Sites.

```{tip}
Site Templates are primarily intended for maintaining Pages across multiple Sites. If you need to create and maintain Web Content and other assets across Sites, use [Asset Libraries](../../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md). Also, if automatic propagation is not necessary for your use case, you can [export and import](./exporting-importing-site-templates.md) Site data to transfer it between environments.
```

Follow these steps to create a Site Template:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Site Templates*.

1. Click the *Add* button ![Add Button](../../../images/icon-add.png).

1. Enter a *name* and *description* for the template.

1. Determine whether the template is active or inactive.

   Only active templates are listed during [Site creation](../adding-a-site.md).

1. Determine whether users can directly modify Pages inherited from this template.

1. Toggle *Ready for Propagation* to enable or disable automatic propagation.

   See [Propagating Template Changes](./propagating-template-changes.md) to learn more about automatic propagation.

   ![Name and configure the Site Template.](./creating-site-templates/images/01.png)

1. Click *Save*.

Once saved, you can select the template to begin editing it.

The UI for designing the template is identical with the UI for designing Sites. Just open the *Site Template Menu* (![Site Menu](../../../images/icon-product-menu.png)) to access available applications and begin adding Style Books, Page Templates, Pages, and more.

```{important}
Pages inherited from a template cannot be deleted. You also cannot directly add child Pages to them on the Site level. They can only be added or removed in the Site Template.
```

## Related Topics

* [Site Templates](../site-templates.md)
* [Propagating Template Changes](./propagating-template-changes.md)
* [Configuring Site Template Propagation](./configuring-site-template-propagation.md)
