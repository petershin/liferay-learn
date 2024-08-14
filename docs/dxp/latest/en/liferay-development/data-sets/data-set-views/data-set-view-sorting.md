---
uuid: 0a123c29-b41c-472b-a77d-3f7639fe6104
taxonomy-category-names:
    - Development and Tooling
    - Data Sets
    - Liferay Self-Hosted
    - Liferay SaaS
---

# Data Set View Sorting

{bdg-secondary}`Liferay DXP 2024.Q1 U112`
{bdg-link-primary}`[Beta Feature](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

While managing data set views, you can set default sorting rules that are applied to the entries once the user visits a page with a Data Set fragment.

## Adding Sorting Options to the Data Set View

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Data Sets* under Object.

1. Click on the *Name* of the data set you want to access.

   Alternatively, click *Actions* (![Actions menu](../../../images/icon-actions.png)) next to the data set entry and select *Edit*.

1. Click on the *Name* of the data set view to start editing it.

1. Select the *Sorting* tab.

1. Click *Add* (![Add button](../../../images/icon-add.png)) and fill in the information in the modal window that opens.

   ![Add a sorting option to the data set view.](./data-set-view-sorting/images/01.png)

1. Enter the *Label* for the sorting option and, optionally, [localize](./data-set-view-visualization-modes.md#editing-and-localizing-labels) it.

1. Choose a field to be used for sorting.

1. Check "Use as Default Sorting" to set it as the default sorting option.

   !!! note
       When multiple sorting options are marked as default, only the most recently marked option is used as the default.

1. (Optional) Use the *drag icon* (![Drag icon](../../../images/icon-drag.png)) to reorder the sorting options.

   ![Use the drag icon to reorder the sorting options.](./data-set-view-sorting/images/02.png)

Once the sorting options are configured, you can see them in a Data Set fragment.

The default sorting option appears at the top, and the data set is sorted automatically using this option.

Open *the Order dropdown* to choose other sorting options and specify whether the items are ordered in ascending or descending order.

![The Order dropdown appears at the top of your Data Set fragment.](./data-set-view-sorting/images/03.png)

Alternatively, you can use the arrows next to the fields to sort. The upwards arrow indicates ascending order, while the downwards arrow indicates descending order.

![Use the arrows next to the fields to sort entries.](./data-set-view-sorting/images/04.png)


## Related Topics

- [Creating Data Sets](../creating-data-sets.md)
- [Data Set Views](../data-set-views.md)
- [Data Set View Visualization Modes](./data-set-view-visualization-modes.md)
- [Data Set View Filters](./data-set-view-filters.md)