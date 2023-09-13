---
uuid: b2f71d60-7c6b-4be7-94fd-d8ea048c6dbf
---
# Exporting and Importing Page Templates

Sometimes it's easier to edit templates in a code editor. Once you've [created a page template](./creating-a-page-template.md), you can [export](../../sites/exporting-importing-site-pages-and-content.md) it, edit it locally in the editor of your choice, and then import the template back into Liferay. You can import the template into any site on the system.

For more general information about the export/import framework, see [Exporting/Importing Site Pages and Content](../../sites/exporting-importing-site-pages-and-content.md).

```{note}
For Liferay DXP 7.4+, Page Template Collections are called Page Template Sets in the Liferay UI.
```

## Exporting a Page Template

Follow these steps to export a page template:

1. Click the *Site Menu* ( ![Site Menu](../../../images/icon-product-menu.png) ) and go to *Design* &rarr; *Page Templates*.

1. Click the *Page Templates* tab.

1. Select the Page Template Set that contains the desired template.

1. Click *Actions* ( ![Actions Button](../../../images/icon-actions.png) ) for the desired content page template and select *Export*.

   ![Click Export to export your page template as a zip.](./exporting-and-importing-page-templates/images/01.png)

The content page template downloads as a ZIP file to your local machine.

```{tip}
You can export more than one content page template at once.
```

The last published version of the page template is always exported. If the page template has never been published, it cannot be exported.

The exported ZIP file contains these files:

* `page-template-collection.json`: Includes the name of the set where the page template is saved and any other metadata.
* An optional thumbnail file.
* `page-template.json`: Contains the page template name and any other metadata.
* `page-definition.json`: specifies the structure and content of the Page Template.

The ZIP file may contain different types of page templates as well, like `display-page-template.json`, `master-page.json`, `page-template-collection.json` and `page-template.json`.

## Importing a Page Template

Follow these steps to import a page template:

1. Click the *Site Menu* ( ![Site Menu](../../../images/icon-product-menu.png) ) and go to *Design* &rarr; *Page Templates*.

1. Click *Actions* ( ![Actions Button](../../../images/icon-actions.png) ) in the Application Bar and select *Import*.

   ![The import function is located at the top right options menu.](./exporting-and-importing-page-templates/images/02.png)

1. Select the desired page template file.

1. Click *Import*.

   ![Page templates are imported as ZIP files.](./exporting-and-importing-page-templates/images/03.png)

1. Close the *Import* window.

The page template has been imported into the site.

## Related Topics

* [Creating a Page Template](./creating-a-page-template.md)
* [Exporting/Importing Site Pages and Content](../../sites/exporting-importing-site-pages-and-content.md)
* [Creating Collections](../../../content-authoring-and-management/collections-and-collection-pages/creating-collections.md)
