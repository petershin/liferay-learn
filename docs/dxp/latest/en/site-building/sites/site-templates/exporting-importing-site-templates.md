---
uuid: d800b7b8-5466-48fc-9f71-a3848e99e50c
---
# Exporting/Importing Site Templates

You can export and import Site Templates to share them between Liferay installations.

## Exporting Individual Site Templates

Follow these steps to export a Site Template:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Site Templates*.

1. Click the Site Template you want to export.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Publishing*, and click *Export*.

1. Click the *Add* button (![Add Button](../../../images/icon-add.png)) to create a new export process.

   This opens an export template.

   ![Name and configure the template export process.](./exporting-importing-site-templates/images/01.png)

1. Enter a title for the export process.

1. Configure the export process by selecting the template Pages and content you want to export.

1. Click *Export* to begin the export process.

Once finished, click the *Download* button (![Download Button](../../../images/icon-download.png)) to download the generated LAR file.

![Download the generated LAR file.](./exporting-importing-site-templates/images/02.png)

## Importing Individual Site Templates

Follow these steps to import a Site Template:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Site Templates*.

1. [Create](./creating-site-templates.md) a Site Template.

1. Click the new Site Template.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), expand *Publishing*, and click *Import*.

1. Click the *Add* button (![Add Button](../../../images/icon-add.png)) to create a new import process.

1. Add the desired LAR file and click *Continue*.

   ![Add the LAR file and click Continue.](./exporting-importing-site-templates/images/03.png)

1. Review and configure the import process.

1. Click *Import* to begin importing.

   ![Configure and begin the import process.](./exporting-importing-site-templates/images/04.png)

Once complete, you can use the imported Site Template to [create Sites](../adding-a-site.md).

## Bulk Export/Import

If needed, follow these steps to perform bulk export/import operations for Site Templates:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Site Templates*.

1. Click the *Actions* button (![Actions Button](../../../images/icon-actions.png)) in the Application Bar and select *Export/Import*.

   ![Click and Actions button in the Application Bar and select Export/Import.](./exporting-importing-site-templates/images/05.png)

1. Go to the *Export* or *Import* tab to start the desired process.

   Configuration options for bulk export are mostly the same as when [exporting individual Site Templates](#exporting-individual-site-templates). However, you cannot configure the Pages and content included for each template. Also unlike individual exports, you can determine whether Page Templates are included in your export.

   ![Go to the Export tab to export all Site Templates in your instance.](./exporting-importing-site-templates/images/06.png)

   Configuration options for bulk import are mostly the same as when [importing individual Site Templates](#importing-individual-site-templates). However, you can determine whether Page Templates included in the LAR file are imported with the Site Templates.

   ![Go to the Import tab to import an LAR file with multiple Site Templates.](./exporting-importing-site-templates/images/07.png)

## Additional Information

* [Site Templates](../site-templates.md)
* [Creating Site Templates](./creating-site-templates.md)
* [Exporting and Importing Site Pages and Content](../exporting-importing-site-pages-and-content.md)
