---
taxonomy-category-names:
- Sites
- Site Administration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: d800b7b8-5466-48fc-9f71-a3848e99e50c
---

# Exporting/Importing Site Templates

You can export and import site templates to share them between Liferay installations.

## Exporting Individual Site Templates

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Site Templates*.

1. Click the site template you want to export.

1. Open the *Product Menu* (![Product Menu](../../../images/icon-product-menu.png)), expand *Publishing*, and click *Export*.

1. Click *Add* (![Add Button](../../../images/icon-add.png)) to create a new export process.

   This opens an export template.

   ![Name and configure the template export process.](./exporting-importing-site-templates/images/01.png)

1. Enter a title for the export process.

1. Configure the export process by selecting the template pages and content you want to export.

1. Click *Export* to begin the export process.

Once finished, click the *Download* button (![Download Button](../../../images/icon-download.png)) to download the generated LAR file.

![Download the generated LAR file.](./exporting-importing-site-templates/images/02.png)

## Importing Individual Site Templates

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Site Templates*.

1. [Create](./creating-site-templates.md) a site template.

1. Click the new site template.

1. Open the *Product Menu* (![Product Menu](../../../images/icon-product-menu.png)), expand *Publishing*, and click *Import*.

1. Click *Add* (![Add Button](../../../images/icon-add.png)) to create a new import process.

1. Add the desired LAR file and click *Continue*.

   ![Add the LAR file and click Continue.](./exporting-importing-site-templates/images/03.png)

1. Review and configure the import process.

1. Click *Import* to begin importing.

   ![Configure and begin the import process.](./exporting-importing-site-templates/images/04.png)

Once complete, you can use the imported site template to [create sites](../adding-a-site.md).

## Bulk Export/Import

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel*, and click *Site Templates*.

1. Click *Options* (![Options Icon](../../../images/icon-options.png)) in the Application Bar and select *Export/Import*.

   ![Click the *Options* icon in the Application Bar and select *Export/Import*.](./exporting-importing-site-templates/images/05.png)

1. Go to the *Export* or *Import* tab to start the desired process.

   Configuration options for bulk export are mostly the same as when [exporting individual site templates](#exporting-individual-site-templates). However, you cannot configure the pages and content included for each template. Also unlike individual exports, you can determine whether page templates are included in your export.

   ![Go to the *Export* tab to export all site templates in your instance.](./exporting-importing-site-templates/images/06.png)

   Configuration options for bulk import are mostly the same as when [importing individual site templates](#importing-individual-site-templates). However, you can determine whether page templates included in the LAR file are imported with the site templates.

   ![Go to the *Import* tab to import a LAR file with multiple site templates.](./exporting-importing-site-templates/images/07.png)

## Related Topics

- [Site Templates](../site-templates.md)
- [Creating Site Templates](./creating-site-templates.md)
- [Exporting and Importing Site Pages and Content](../exporting-importing-site-pages-and-content.md)
