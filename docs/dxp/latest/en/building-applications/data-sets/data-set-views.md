---
toc:
  - ./data-set-views/data-set-view-actions.md
  - ./data-set-views/data-set-view-fields.md
  - ./data-set-views/data-set-view-filters.md
  - ./data-set-views/using-data-set-view-actions.md
uuid: a996ebe0-1f91-4867-a50d-dd81652cd9be
taxonomy-category-names:
    - Development and Tooling
    - Data Sets
    - Liferay Self-Hosted
    - Liferay SaaS
---

# Data Set Views

{bdg-secondary}`Liferay DXP 2024.Q1 U112`
{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

With the data set manager, you can create data set views and customize how users see your data set. Choose which fields are displayed, define and pre-apply filters, set default sorting rules, redirect users to a different URL where they can perform actions, and configure pagination options for your data set view.

## Creating Data Set Views

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Data Sets* under Object.

1. Click on the *Name* of the data set where you're adding the view.

   Alternatively, click *Actions* (![Actions menu](../../images/icon-actions.png)) next to the data set entry and select *Edit*.

1. Click *Add* (![Add button](../../images/icon-add.png)), name your data set, and add a description (optional).

1. Click the name of the data set view to start editing it.

   Alternatively, click *Actions* (![Actions menu](../../images/icon-actions.png)) next to the data set view entry and select *Edit*.

   You can also delete a data set view using the Actions menu.

![Add a data set view to a data set.](./data-set-views/images/01.gif)

## Managing Data Set Views

The Data Set View application is divided into tabs:

- In the Details tab, see and edit the name (1) and description (2) of your data set view. Click *Save* once the alterations are complete. 

  You can also see the information about the REST Application, Schema, and Endpoint (3) used with that data set.

  ![In the Details tab, edit the name and description of your data set view.](./data-set-views/images/02.png)

- In the [Fields tab](./data-set-views/data-set-view-fields.md), select which fields are displayed in your data set view and manage them.

  You can also edit the field, add a friendly label and localize it, choose a renderer for the field, and define it as sortable or not sortable.

  ![In the Fields tab, manage the fields displayed in the data set view.](./data-set-views/images/03.png)

- In the [Filters tab](./data-set-views/data-set-view-filters.md), define filters that users can apply to the data set fragment.

  You can apply customized filters using [Client Extensions](../client-extensions.md), use date-type fields and show entries within a given period, or configure [Picklists](../objects/picklists.md) as the source of the options for the filter.

  ![In the Filters tab, provide filters to your data set view.](./data-set-views/images/04.png)

- In the Sorting tab, set default sorting rules that are applied to the entries once the user visits a page with a Data Set fragment.

  Sort entries using a specific field as a criterion and in ascending or descending order.

  You can also select multiple fields. The first field serves as the primary criterion for sorting the entries. If there are entries with the same value in the first field, the second field is used as the secondary criterion for sorting.

  ![In the Sorting tab, set default sorting rules that are applied to the entries once the user visits a page with a Data Set fragment.](./data-set-views/images/05.png)

- In the [Actions tab](./data-set-views/data-set-view-actions.md), create actions linked to the elements in the data set.

  Link action buttons to different URLs and redirect users once they interact with them. It is also possible to show confirmation messages before executing actions. See [Using Data Set View Actions](./data-set-views/using-data-set-view-actions.md) for more information.

  ![In the Actions tab, create actions mapped to buttons and link them to different URLs.](./data-set-views/images/06.png)

<!-- Once new actions are added, update this item. Eric -->

- In the Pagination tab, configure the pagination options for the data set view. Pagination divides a large set of data into smaller, more manageable parts.

  Set a default number of items per page and provide users with a list of options from which they can select their preferred number of items to display on each page.

  Use positive numbers separated by commas to define the list of options.

  ![In the Pagination tab, set a default number of items per page and add a list of defined values from which users can select their preferred number of items to display on a page.](./data-set-views/images/07.png)

## Relevant Topics

- [Creating Data Sets](./creating-data-sets.md)
- [Data Set View Fields](./data-set-views/data-set-view-fields.md)
- [Data Set View Filters](./data-set-views/data-set-view-filters.md)
- [Data Set View Actions](./data-set-views/data-set-view-actions.md)
- [Using Data Set View Actions](./data-set-views/using-data-set-view-actions.md)

