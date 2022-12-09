# Adding Categorization to Fields Tabs

{bdg-secondary}`Available Liferay 7.4 U31+ and GA31+`

You can add categorization blocks to [fields tabs](./designing-object-layouts.md#fields-tabs) so end users can apply tags and categories to object entries. Follow these steps:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the desired object definition.

   ```{note}
   System objects do not support custom layouts. See [Extending System Objects](../extending-system-objects.md) for more information.
   ```

1. Go to the *Layouts* tab and select the desired layout.

   ![Go to the Layouts tab and select the desired layout.](./adding-categorization-to-fields-tabs/images/01.png)

1. Go to the *Layout* tab, click the *Actions* button (![Actions Button](../../../../images/icon-actions.png)) for the desired [Fields tab](./designing-object-layouts.md#fields-tabs), and select *Add Categorization*.

   ![Click the Actions button and select Add Categorization.](./adding-categorization-to-fields-tabs/images/02.png)

   This adds a new block to the tab for accessing categorization tools.

   ```{important}
   You can only add the categorization block to one tab per layout.
   ```

1. Determine whether the block is *collapsible*.

   ![Determine whether the block is collapsible.](./adding-categorization-to-fields-tabs/images/03.png)

1. Click *Save*.

Now when creating or editing the object's entries, users can access and apply tags and categories.

![Access and apply tags and categories to the object's entries.](./adding-categorization-to-fields-tabs/images/04.png)

```{note}
Visibility and permissions can affect how the categorization block appears.
```

## Additional Information

* [Creating Objects](../creating-objects.md)
* [Designing Object Layouts](./designing-object-layouts.md)
* [Designing Object Views](../views/designing-object-views.md)
