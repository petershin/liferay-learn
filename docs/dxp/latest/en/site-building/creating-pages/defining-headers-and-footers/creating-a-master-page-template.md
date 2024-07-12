---
taxonomy-category-names:
- Sites
- Master Page Templates
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: da11494c-c781-41b6-8b91-4e4d117851c3
---
# Creating a Master Page Template

{bdg-secondary}`Available: Liferay DXP/Portal 7.3+`

Although there are default master page templates you can use to define the look and feel of the headers and footers for your site's pages, you may want a more custom solution. You can create custom master page templates for this.

Follow these steps to create a master page templates:

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and navigate to *Design* &rarr; *Page Templates*.

1. Under the Masters tab, click *Add* (![Add](../../../images/icon-add.png))  to create a new Master Page Template.

1. Enter the *Name* of your new master page template.

1. In Fragments and Widgets (![Fragments and Widgets](../../../images/icon-add-widget.png)) on the sidebar, add fragments for the common elements that you require.

   ![Add the master page template's common elements from the footers and navigation bars sections.](./creating-a-master-page-template/images/01.png)

1. (Optional) Drag and drop the Drop Zone to a new location in the layout. For example, you can add a grid with two modules and move the drop zone to one module, so users can only add page fragments to that portion of the grid.

   ![You can move the Drop Zone to control where users can add page fragments.](./creating-a-master-page-template/images/02.gif)

1. (Optional) Specify which page fragments can be added to the Drop Zone by clicking the *Configure Allowed Fragments* button.

   Check the page fragments you want to allow in this master page template.

   Check the *Select New Fragments Automatically* box to include new fragment types in the list of allowed fragments.

   ![Check and uncheck fragments from the allowed fragments dialog to specify whether they can be added to a page that uses this master page template.](./creating-a-master-page-template/images/03.png)

   Click *Save* to close the Allowed Fragments dialog.

1. (Optional) To preview your content page, click *Options* (![Options](../../../images/icon-options.png)) at the top right corner &rarr; *Preview in a New Tab*.

1. Click *Publish Master* to create the master page template.

You can revert any action using the *Undo* (![Undo icon](../../../images/icon-undo.png)) or *Redo* (![Redo icon](../../../images/icon-redo.png)) buttons, or you can return to a previous version of your edits using the *History* (![History icon](../../../images/icon-time.png)) button.

```{note}
If a custom master page template is used for a page, the theme for the page is defined through the master page template and can't be changed through the page's settings. See [Changing a Master Page Template's Design](./managing-master-page-templates.md#changing-a-master-page-templates-design) for more information.
```

## Related Topics

[Managing Master Page Templates](./managing-master-page-templates.md)

[Master Pages Templates](./master-page-templates.md)
