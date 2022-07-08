# Exporting/Importing Site Pages and Content

Liferay Sites include the Export/Import applications for extracting and transferring Site data as Liferay Archive (LAR) files. You can access these tools at the Site level.

```{note}
You can also access export and import functions for individual Site applications and [Page widgets](../creating-pages/using-widget-pages/configuring-widgets/exporting-importing-widget-data.md).
```

## Site LAR Properties and Requirements

LARs have these properties and requirements:

* LARs are version dependent. They can be imported into a Site on another Liferay server, as long as the Liferay versions on each server are the same.

* Some naming conflicts are handled automatically. For example, if the LAR you're importing and the Site both have a page with the same friendly URL, a number is appended to the friendly URL and incremented until the conflict no longer occurs. The same is true for category names.

* You can use LARs to restore a Site, but you must delete your Site entirely and then create a new Site with the same name to import the LAR into. This avoids potential data conflicts between content that exists both in the LAR and in the Site.

```{important}
Periodically exporting LARs is *not* a backup solution; it should only be used to migrate data between two environments. Please refer to the [Backing up a Liferay Portal Installation](../../installation-and-upgrades/maintaining-a-liferay-installation/backing-up.md) to learn about backing up your Liferay installation.
```

## Exporting Site Pages and Content

Follow these steps to export Site Pages and Content:

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Publishing*, and click *Export*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) to create a new export process.

   This opens an export template.

   ![Name and configure the export template.](./exporting-importing-site-pages-and-content/images/01.png)

1. Enter a title for the export process.

1. Configure the export process by selecting the Site Pages and content you want to export.

   Under *Pages* you can select which Pages and Page Sets are included in the export. You can also determine whether the Theme Settings, Logo, Site Page Settings, and Site Template Settings are included.

   Under *Content*, you can select which applications are included in the export. You can also determine whether to export all data for the selected applications, or filter included application data by date or time.

   Under *Permissions*, determine whether to include Page and content permissions  in the export.

1. Click *Export* to begin the export process.

Once finished, click the *Download* button (![Download Button](../../images/icon-download.png)) to download the generated LAR file. You can now import the LAR to another Liferay Site.

![Download the LAR file.](./exporting-importing-site-pages-and-content/images/02.png)

```{note}
The generated LAR includes all data selected during export configuration. If this includes private or sensitive information, ensure the LAR file is stored in a secure location.
```

## Importing Site Pages and Content

```{important}
If the exported Site uses a template, you must first export and import the Site Template to the Liferay installation before you can import the Site. See [Exporting and Importing Site Templates](./site-templates/exporting-importing-site-templates.md) for more information.
```

Follow these steps to import Site Pages and Content:

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Publishing*, and click *Import*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) to create a new import process.

1. Add the desired LAR file and click *Continue*.

   ![Add the LAR file and click Continue.](./exporting-importing-site-pages-and-content/images/03.png)

1. Review and configure the import process.

1. Click *Import* to begin importing.

   ![Configure and begin the import process.](./exporting-importing-site-pages-and-content/images/04.png)

## Creating Export Templates

Instead of manually creating an export process every time you export Site Pages content, you can create an Export Template to store and reuse your export settings. To create an Export Template, follow these steps:

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Publishing*, and click *Export*.

1. Click the *Actions* button ![Actions Button](../../images/icon-actions.png) in the Application Bar and select *Export Templates*.

   ![Click the Actions button in the Application Bar and select Export Templates.](./exporting-importing-site-pages-and-content/images/05.png)

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

1. Name and configure the export template.

1. Click *Save*.

You can now select your template when [creating a new export process](#exporting-site-pages-and-content).

## Additional Information

* [Adding a Site](./adding-a-site.md)
* [Site Templates](./site-templates.md)
* [Exporting/Importing Site Templates](./site-templates/exporting-importing-site-templates.md)
