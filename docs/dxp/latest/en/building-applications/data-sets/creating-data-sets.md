---
uuid: ef053fbc-18f4-4724-a054-cb0774d02a6d
- Development and Tooling
- Data Sets
- Liferay Self-Hosted
- Liferay SaaS
---
# Creating Data Sets
{bdg-secondary}`Liferay DXP 2024.Q1 U112`
{bdg-link-primary}`[Beta Feature](../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

!!! important
   This feature is currently behind a [beta feature flag](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) (LPS-164563).

With Liferay, create data sets from different resources available through Liferay Headless APIs. Use data sets to create and manage [data set views](./data-set-views.md) and customize how you display your data set.

## Creating a Data Set

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), select the *Control Panel* tab, and click *Data Sets* under Object.

1. Click *Add* (![Add button](../../images/icon-add.png)) and name your data set.

1. Choose the REST Application from a list of available options.

   Some of these options enable a REST Schema field where you must select a schema from a list of available options.

   ![Choose a REST application, Schema, and Endpoint to create your data set.](./creating-data-sets/images/01.png)

   !!! note
      When there is only one option available for the REST Schema and Endpoint (e.g. object definitions and `/batch-planner/v1.0`), they are set automatically once you select the REST Application.

1. (When available) Choose a REST Schema from a list of available options.

   Some of these options enable a REST Endpoint field where you must select an endpoint from a list of available options.

   If there is only one Schema available, the option is automatically selected.

1. (When available) Choose a REST Endpoint from a list of available options.

   !!! important
       Some REST Application options don't have usable endpoints, and it's not possible to create data sets with those options (e.g. `/captcha/v1.0` and `/data-engine/v2.0`).

   ![A message is shown when there are no usable endpoints available.](./creating-data-sets/images/02.png)

1. Click *Save*. The data set is created, and you can see all the information about it in the data set manager.

## Data Set Manager

Once created, data sets are shown in the data set manager. Use the application to view information and edit the existing data sets.

![Information about the data sets is shown in the data set manager. Search, filter, and manage your data sets using the data set manager.](./creating-data-sets/images/03.png)

In the data set manager, you can find:
- Search Bar (1)
- Name of the data set (2)
- REST Application (3), REST Schema (4), and REST Endpoint (5) applied to the data set
- Number of data set views (6) for that specific data set
- Last time the data set was modified (7)

You can also click on the arrow down icon (8) and search for a specific table field or check/uncheck the existing fields to show/hide them in the table.

![Use the filter to show/hide fields in the table.](./creating-data-sets/images/04.png)

Edit, rename, alter the permissions, or delete your data set using the data set's Action menu (![Actions menu](../../images/icon-actions.png))(9):

- **Edit**: While editing a data set, you can [create and manage data set views](../data-sets/data-set-views.md). Alternatively, click on the name of the data set to edit it.

- **Rename**: In the modal that opens, rename your data set and click *Save*.

- **Permissions**: In the modal that opens, select the permissions you want to assign and click *Save*.

- **Delete**: In the modal that opens, click *Delete* to delete your data set.

<!-- I added this part because I thought 'Well... maybe someone will need it'. But I'm not sure. It's pretty straightforward. Eric -->

![Use the Actions menu to manage your data set.](./creating-data-sets/images/05.png)

## Related Topics

- [Data Set Views](../data-sets/data-set-views.md)