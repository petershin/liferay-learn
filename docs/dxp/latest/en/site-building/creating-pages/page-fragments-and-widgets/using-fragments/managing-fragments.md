---
taxonomy-category-names:
- Sites
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: f75c3e38-f15b-495b-9384-e1ea4a767771
---

# Managing Fragments

Liferay DXP provides tools for managing fragments in the Liferay UI. With out-of-the-box tools, you can edit fragment code, export/import fragment sets between sites, and more.

!!! tip
    To share fragments and sets between sites, add them to the Global site or use the export/import actions.

    You can use the Export/Import actions within the fragment sets and individual page fragments if you have a ZIP file. Alternatively, if you have a LAR file, you can use the Export/Import options in the Options menu located at the Applications Bar.

## Managing Fragment Sets

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

1. Select the desired fragment set.

1. Click *Actions* (![Actions](../../../../images/icon-actions.png)) for the fragment set you want and select an action:

   ![Click the fragment set's Actions button to access management options.](./managing-fragments/images/01.png)

   **Edit**: Change the name or description for the fragment set.

   **Export**: Download the fragment set as a `.zip` file. This file includes the set's `.json`, fragment code, and resources.

   **Import**: Upload fragments and resources to a set as a `.zip` file. If an imported fragment has invalid rules, it is saved as a draft. This import process works similarly to the [page template import process](../../adding-pages/exporting-and-importing-page-templates.md#importing-a-page-template).

   **Delete**: Remove the current fragment set and all its contents.

!!! tip
    To export multiple sets, click *Actions* (![Actions](../../../../images/icon-actions.png)) for the fragment set you want to export and select *Export*. Then, check the sets you want to export and click *Export*. Each set is downloaded as a separate `.zip` file.

!!! important
    To export fragments in Liferay PaaS, you must be using the appropriate [JVM settings](../../../../installation-and-upgrades/setting-up-liferay/tuning-your-jvm.md#jvm-options-for-liferay-paas).

## Managing Individual Page Fragments

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

1. Select the desired fragment set.

1. Click *Actions* (![Actions](../../../../images/icon-actions.png)) for the fragment you want and select an action:

   ![Click the fragment's Actions button to access fragment management options.](./managing-fragments/images/02.png)

   **Edit**: Modify the fragment's code or configuration.

   **Change Thumbnail**: Change the fragment's thumbnail image.

   **Remove Thumbnail**: Remove the fragment's thumbnail image and use the default fragment type icon.

   **Rename**: Change the fragment's name.

   **Mark or Unmark as Cacheable**: Mark or unmark the fragment as cacheable. When a fragment is cached, it improves the performance of its pages.

   **View Usages**: View the pages where the fragment is used. You can see the page's name, type, version, and the time since the page's last propagation. You can also select a page and propagate it.

   **Export**: Download the fragment as a `.zip` file.

   **Make a Copy**: Duplicate the fragment. Duplicated fragments share the same name with *(Copy)* appended to the end.

   **Move**: Move the fragment to a different fragment set.

   **Delete**: Remove the fragment.

   !!! important
      Users cannot edit or copy [saved fragment compositions](./saving-fragment-compositions.md).

## Copying Fragments

{bdg-secondary}`For Liferay DXP 7.2 SP1+ and Liferay Portal 7.2 GA2+`

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

1. Select the desired fragment set.

1. Click *Actions* (![Actions](../../../../images/icon-actions.png)) for the fragment you want and select *Copy To*.

   ![Click the fragment's Actions button and select Copy To.](./managing-fragments/images/03.png)

1. Select the set where you want to copy the fragment.

!!! tip
    Users cannot edit [default fragments](./default-fragments-reference.md) directly. However, you can copy default fragments into a custom set and edit them there.

## Related Topics

- [Using Fragments](../using-fragments.md)
- [Configuring Fragments](./configuring-fragments.md)
- [Default Fragments Reference](./default-fragments-reference.md)
