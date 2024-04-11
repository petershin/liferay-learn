---
toc:
  - ./data-sets-view-actions/data-set-view-item-actions.md
  - ./data-sets-view-actions/data-set-view-creation-actions.md
uuid: f4f19cd5-1077-4541-a836-aaeeeb1eeb08
taxonomy-category-names:
    - Development and Tooling
    - Data Sets
    - Liferay Self-Hosted
    - Liferay SaaS
---

# Data Set View Actions

{bdg-secondary}`Liferay DXP 2024.Q1 U112`
{bdg-link-primary}`[Beta Feature](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

While managing data set views, define actions to be used in the data set fragment. With actions, users can delete, edit, or display the details of a single item in the data set or they can create new data or be redirected to a different location where they can create it.

## Adding Actions to the Data Set View

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Data Sets* under Object.

1. Click the *Name* of the data set you want to access.

   Alternatively, click *Actions* (![Actions menu](../../../images/icon-actions.png)) next to the data set entry and select *Edit*.

1. Click the *Name* of the data set view to start editing it.

1. Select the Actions tab, open the [*Item Actions*](./data-set-view-actions/data-set-view-item-actions.md) or the [*Creation Actions*](./data-set-view-actions/data-set-view-creation-actions.md) tab, and click *Add* (![Add button](../../../images/icon-add.png)); a page appears where you must configure your action before creating it.

Under the Display Options section, you can find general settings common to all actions.

![Fill in the Label, localize it, and select an icon for your action.](./data-set-view-actions/images/01.png)

1. Fill in the Label and, optionally, [localize](./data-set-view-fields.md#editing-and-localizing-labels) it.

1. (Optional) Choose an icon to show in your Data Set fragment.

   <!-- Choose from a list of out-of-the-box icons or type in the name of an icon registered through the SVG sprite map client extension. The custom icon requires configuring the client extension. - This is to be added once the article about this client extension is on. Eric -->

   !!! tip
       When an item has a single action, its label appears as text inside a button component if no icon is selected.

       Conversely, if multiple actions exist, an action icon (![Action icon](../../../images/icon-actions.png)) appears, revealing available actions on click.

   ![Use the action's label as text inside a button component or select an icon to show in your Data Set fragment instead.](./data-set-view-actions/images/02.png)

Under the Action Behavior section, select the action type. You can find specific configurations for each action you choose. See [Using Item Actions](./data-set-view-actions/data-set-view-item-actions.md) and [Using Creation Actions](./data-set-view-actions/data-set-view-creation-actions.md) to learn more about each action.

Once the action is configured, click *Save*.

## Related Topics

- [Data Set View Item Actions](./data-set-view-item-actions.md)
- [Data Set View Creation Actions](./data-set-view-actions/data-set-view-creation-actions.md)
- [Data Set Views](../data-set-views.md)
- [Creating Data Sets](../creating-data-sets.md)
- [Data Set View Fields](./data-set-view-fields.md)
- [Data Set View Filters](./data-set-view-filters.md)
