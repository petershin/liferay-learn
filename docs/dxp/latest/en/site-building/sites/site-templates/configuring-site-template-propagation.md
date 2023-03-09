---
uuid: 630e4176-d453-436c-978a-0f1fad059614
---
# Configuring Site Template Propagation

{bdg-secondary}`Available for Liferay 7.4 U23+/GA23+`

You can configure the trigger for automatic site template propagation. By default, Liferay triggers propagation for sites individually when they're first visited by a user after changes are made to the template. If desired, you can configure your system to trigger propagation simultaneously to connected sites whenever users [enable propagation](./propagating-template-changes.md#enabling-and-disabling-propagation) for their template.

```{important}
Automatic propagation can be resource intensive, depending the scope of changes made to a template.
```

To configure Site Template propagation,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *System Settings*.

1. Go to *Infrastructure* settings and click *Site Templates* under Virtual Instance Scope in the side menu.

1. Check *Trigger Propagation*.

   If unchecked, changes are propagated to sites individually when they’re first visited by a user.

   If checked, enabling automatic propagation in a template also triggers propagation for all connected sites simultaneously.

   ![Check Trigger Propagation.](./configuring-site-template-propagation/images/01.png)

1. Click *Save*.

If propagation is disabled for a Site Template, enabling propagation immediately begins propagating changes to connected Sites simultaneously. While propagation remains enabled for the template, subsequent changes are propagated to sites individually when they’re first visited by a user.

## Additional Information

* [Site Templates](../site-templates.md)
* [Propagating Template Changes](./propagating-template-changes.md)
