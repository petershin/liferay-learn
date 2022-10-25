# Propagating Fragment Changes

By default, [changes](../../../developer-guide/developing-page-fragments/using-the-fragments-editor.md) made to a custom fragment's code are not propagated to deployed instances of the fragment. Using *Fragment Propagation*, you can propagate changes to fragment instances in one of two ways:

* [Manually for individual instances of a fragment](#manually-propagating-changes)
* [Automatically for all instances of a fragment](#automatically-propagating-changes)

```{important}
To avoid overwriting data, changes made to *editable* fields cannot be directly propagated to the fragment. However, you can force propagation by changing the fragment's field ID. When propagated, the field's content is no longer displayed, though you can retrieve its content from the database using the old field ID. To learn more, see [Fragment Specific Tags and Attributes Reference](../../../developer-guide/reference/fragments/fragment-specific-tags-reference.md) in the developer documentation.
```

## Manually Propagating Changes

Follow these steps to manually propagate changes to individual instances of a fragment:

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

1. Navigate to the *Fragment Set* for the desired fragment.

1. Click the *Actions* button (![Actions Button](../../../../images/icon-actions.png)) for the desired fragment and select *View Usages*.

   ![Click the fragment's Actions button and select View Usages.](./propagating-fragment-changes/images/01.png)

   ```{tip}
   If the *View Usages* option is unavailable, the fragment is not in use.
   ```

1. In the Usages and Propagation page, check the fragment instances you want to update to the latest version.

   In the table, you can review whether a page or template is using a *Previous Version* or the *Latest Version*.

   ![Select the fragment instances you want to update.](./propagating-fragment-changes/images/02.png)

1. Click the *Propagate* button (![Propagate](../../../../images/icon-propagate.png)) to update the selected instances of the fragment.

Changes made to non-editable fields are automatically propagated to the selected fragment instances.

## Automatically Propagating Changes

Follow these steps to automatically propagate changes to all instances of a fragment:

```{warning}
Automatic propagation can lead to unintended consequences in the production environment, such as typos or inaccurate content being published. Use Automatic propagation only for testing or development purposes.
```

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Configuration* &rarr; *System Settings*.

1. Under the *Content and Data* section, click *Page Fragments*.

1. Check the *Propagate Fragment Changes Automatically* box.

   ![Check the Propagate Fragment Changes Automatically box.](./propagating-fragment-changes/images/03.png)

1. Click *Save*.

When enabled, changes made to a fragment's non-editable fields are automatically propagated to all instances of the fragment.

## Additional Information

* [Using Fragments](../using-fragments.md)
* [Fragment Styles Reference](./configuring-fragments/styles-reference.md)
* [Using Content Pages](../../using-content-pages.md)
