---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 5bd46464-470f-4431-af10-3ff5cbbe4206
---

# Mapping Repeatable Fields to Fragments

!!! important
    Currently, this feature is behind a release feature flag (LPD-11377). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

{bdg-secondary}`Liferay DXP 2024.Q3+/Portal 7.4 GA125+`

When creating fields on web content structures, you can make them [repeatable](../../../content-authoring-and-management/web-content/web-content-structures/configuring-web-content-structure-fields.md#configurable-settings). You can then map these fields to fragments and publish them on a page. This is a great way to publish structured content that follows a pattern, such as a FAQ, a job listing, or in the example below, an employee directory.

## Creating a Web Content Structure With Repeatable Fields

This example creates a structure with a repeatable fields group to store basic information about employees in a fictional software company.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Content & Data*, and go to *Web Content*.

1. Select the *Structures* tab and click *New*. Name the structure `Employee Info`.

1. Drag and drop a *Text* field to the structure. Change its label to `Name`.

1. Add a second *Text* field on top of the Name field to create a fields group. Label it `Job Title`.

   ![Create a fields group by adding a field on top of another.](./mapping-repeatable-fields-to-fragments/images/01.png)

1. Add a third *Text* field into the Fields Group to place it at the end of the group. Label it `Contact`.

   ![Add a field to the end of the fields group.](./mapping-repeatable-fields-to-fragments/images/02.png)

1. Select the Fields Group and, on the right side, toggle the *Repeatable* option on.

   The (![Add icon](../../../images/icon-add-setting.png)) icon appears at the top right corner, confirming the fields group is repeatable.

   ![Mark the fields group as repeatable.](./mapping-repeatable-fields-to-fragments/images/03.png)

1. Click *Save*.

## Creating a Web Content Article

Create a web content article based on the `Employee Info` web content structure and add information about the software engineers in the fictional company.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Content & Data*, and go to *Web Content*.

1. Select the *Web Content* tab and click *New*. Choose *Employee Info* structure. Name the article `Software Engineers`.

1. Add a name, a job title, and contact for an employee.

1. Click (![Duplicate icon](../../../images/icon-add-setting.png)) and fill in the information for a few more fields groups.

   ![Fill in the repeatable fields.](./mapping-repeatable-fields-to-fragments/images/04.png)

1. Click *Publish*.

## Mapping Repeatable Fields in Display Page Templates

Create a display page template and map the repeatable fields of the `Software Engineers` article to fragments within a Collection Display fragment to display the list of software engineers in the company.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Design*, and go to *Page Templates*.

1. Select the *Display Page Templates* tab and click *New*. Select a Master Page.

1. Name it `Software Engineers List`. Select *Web Content Article* as the Content Type and *Employee Info* as the Subtype. Click *Save*.

1. In the Fragments and Widgets sidebar, look for the *Collection Display* fragment and drag and drop it into the page.

1. Select the *Collection Display* fragment and, on the right, click *Select Collection*.

   ![Select a collection to display.](./mapping-repeatable-fields-to-fragments/images/05.png)

1. In the modal window that opens, select the *Repeatable Fields Collection Provider* tab and choose the collection you want to display. In this example, it's `Fields Group`.

   ![Choose a collection from the Repeatable Fields Collection Provider tab.](./mapping-repeatable-fields-to-fragments/images/06.png)

1. Add a *Heading* fragment into the Fields Group collection item.

   ![Add a Heading fragment into the Fields Group collection item.](./mapping-repeatable-fields-to-fragments/images/07.png)

   !!! note
       If the collection display contains more than one item, you can drag the fragment or widget to any of them. The rest of the items in your collection use the same layout settings automatically.

1. Double-click the *Heading* fragment. On the right, under the Mapping tab, select *Name* as the field.

   ![Map the Heading's content to the field inside the repeatable fields group.](./mapping-repeatable-fields-to-fragments/images/08.png)

1. Repeat the same process to add two more Heading fragments to the first Collection Item and select *Job Title* and *Contact* as their fields.

1. To help visualize the collection items, select the last *Heading* mapped to the Contact field. On the right, select the *Styles* tab. Under Spacing, add a *Spacer 4* as the Margin Bottom.

   ![Add a margin to the last Heading fragment to help visualizing the blocks.](./mapping-repeatable-fields-to-fragments/images/09.png)

1. Preview the display page template by clicking *None* &rarr; *Select Other Item* &rarr; `Software Engineers` at the top right corner.

   ![Select a web content article to preview the display page template.](./mapping-repeatable-fields-to-fragments/images/10.png)

In the end, you should see the information added to the repeatable fields groups in the `Software Engineers` article.

![All the information added to the article appears in the Collection Display fragment.](./mapping-repeatable-fields-to-fragments/images/11.png)

## Mapping Repeatable Fields to Other Fragments in Content Pages

You can also map repeatable fields to other fragments in content pages and select which iteration to display. In this example, create a simpler web content structure and article with the names of employees in a certain department. Then, map the information to fragments added to a content page.

Start by creating another web content structure and article:

1. Create a simple web content structure named `Employees` with one repeatable *Text* field labeled `Name`.

   ![Create a web content structure with a repeatable field.](./mapping-repeatable-fields-to-fragments/images/12.png)

1. Create a web content article based on the Employees structure. Name it however you want and add some names to it. In this example, it's called `Spanish Employees` and it's a list of Spanish employees.

   ![Create a web content article based on the Employees structure.](./mapping-repeatable-fields-to-fragments/images/13.png)

Create a content page, add some Heading fragments to it, and map the article's fields to the fragments:

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Site Builder*, and go to *Pages*.

1. Click *New* &rarr; *Page*. Select the *Blank* template and name it.

1. In the Fragments and Widgets sidebar, look for the *Heading* fragment and drag and drop it into the page.

1. Double-click the *Heading* fragment. On the right, select the `Spanish Employees` article as the Item and *Name (Repeatable)* as the Field.

   The repeatable fields are marked as `(Repeatable)`.

   ![Map the heading to the repeatable field.](./mapping-repeatable-fields-to-fragments/images/14.png)

1. Choose which *Iteration to Display*: First, Last, or select a Specific Number.

   The iteration numbers start at one. If the specific number doesn't exist, the field appears as empty.

   ![Choose an iteration to display.](./mapping-repeatable-fields-to-fragments/images/15.png)

This way, you can select and display specific fields from the list of repeatable fields.

![As a result, you can display specific fields from the list of repeatable fields.](./mapping-repeatable-fields-to-fragments/images/16.png)

## Related Topics

- [Mapping and Linking Fragment Elements](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/mapping-and-linking-fragment-elements.md)
- [Mapping Web Content Templates to Fragments](../web-content-templates/mapping-web-content-templates-to-fragments.md)
- [Mapping Calendar Event Fields to Display Page Templates](../../../collaboration-and-social/calendar/mapping-calendar-event-fields-to-display-page-templates.md)
