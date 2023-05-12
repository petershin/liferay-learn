---
uuid: f75c3e38-f15b-495b-9384-e1ea4a767771
---
# Managing Fragments

Liferay DXP provides tools for managing fragments in the Liferay UI. With out-of-the-box tools, you can quickly edit fragment code, export/import fragment sets between sites, and more.

```{tip}
To share fragments and sets between sites, add them to the Global site or use the export/import actions.
```

## Managing Fragment Sets

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

1. Select the desired fragment set.

1. Click the set's *Actions* button (![Actions](../../../../images/icon-actions.png)).

   ![Click the fragment set's Actions button to access management options.](./managing-fragments/images/01.png)

1. Select an action:

   **Edit**: Change the name or description for the fragment set.

   **Export**: Download the fragment set as a `.zip` file. This file includes the set's `.json`, fragment code, and resources.

   **Import**: Upload fragments and resources to a set as a `.zip` file. During import, check *Overwrite Existing Files* to overwrite existing fragments with the same fragment name. If an imported fragment has invalid rules, it is saved as a draft.

   **Delete**: Remove the current fragment set and all its contents.

```{tip}
To export multiple sets, click the Fragment Sets *Actions* button (![Actions](../../../../images/icon-actions.png)) and select *Export*. Then, check the sets you want to export and click *Export*. Each set is downloaded as a separate `.zip` file.
```

## Managing Individual Page Fragments

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

1. Select the desired fragment set.

1. Click the fragment's *Actions* button (![Actions](../../../../images/icon-actions.png)).

   ![Click the fragment's Actions button to access fragment management options.](./managing-fragments/images/02.png)

1. Select an action:

    **Edit**: Modify the fragment's code or configuration.

    **Change Thumbnail**: Change the fragment's thumbnail image.

    **Remove Thumbnail**: Remove the fragment's thumbnail image and use the default fragment type icon.

    **Rename**: Change the fragment's name.

    **Export**: Download the fragment as a `.zip` file.

    **Make a Copy**: Duplicate the fragment. Duplicated fragments share the same name with *(Copy)* appended to the end.

    **Move**: Move the fragment to a different fragment set.

    **Delete**: Remove the fragment.

```{important}
Users cannot edit or copy [saved fragment compositions](./saving-fragment-compositions.md).
```

## Copying Fragments

{bdg-secondary}`For Liferay DXP 7.2 SP1+ and Liferay Portal 7.2 GA2+`

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

1. Select the desired fragment set.

1. Click the fragment's *Actions* button (![Actions](../../../../images/icon-actions.png)) and select *Copy To*.

   ![Click the fragment's Actions button and select Copy To.](./managing-fragments/images/03.png)

1. Select the set where you want to copy the fragment.

```{tip}
Users cannot edit [default fragments](./default-fragments-reference.md) directly. However, you can copy default fragments into a custom set and edit them there.
```

## Related Topics

* [Using Fragments](../using-fragments.md)
* [Configuring Fragments](./configuring-fragments.md)
* [Default Fragments Reference](./default-fragments-reference.md)
