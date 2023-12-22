---
uuid: edc2986a-e270-4064-ac4a-2b7109745b74
---
# Data Migration Center

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+`
{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

```{important}
The data migration center is a beta feature that currently only supports the import and export of object definitions and object entries.
```

The data migration center makes it easy for you to move your object definitions and object entries between Liferay installations. 

To enable the data migration center, 

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. 

1. Click _Feature Flags_ under _Platform_.

1. Select _Beta_ in the left navigation. Enable the _Data Migration Center_ toggle on.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Applications_ &rarr; _Data Migration Center_.

   ![The data migration center is found under applications.](./data-migration-center/images/01.png)

1. Click the _Import and Export_ tab to see a list of import and export tasks and their status. Click the _options_ (![Options icon](../../images/icon-options.png)) icon to download files from previous tasks.

1. Click the _Templates_ tab to see a list of import and export templates.

## Exporting Object Definitions 

To export object definitions,

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and select _Export File_.

1. (Optional) In the next page, select an export template if using a previously saved template.

1. Select _ObjectDefinition (v1_0 - Liferay Object Admin REST)_ as the entity type.

1. Select one of the export file formats. 

   ```{note}
   The data migration center only supports the JSON and JSONL file format for importing.

   If exporting to use in conjunction with batch client extensions, select the JSONT file format. JSONT is required for `*.batch-engine-dat.json` files.
   ```

1. Under the fields section, select the object definition fields you wanted included in the export.

   ![Select the object definition fields you wish to export.](./data-migration-center/images/02.png)

1. Click _Save as Template_ to save the export settings for future use. Give the template a name and click _Save_.

1. Finally, click _Export_ to export the object definitions.

1. A window appears to display the export process. When the job is completed, click _Download_ to download a zip file.

   ![Click download to download a zip file.](./data-migration-center/images/03.png)

   The zip file is downloaded to your local machine.

## Exporting Object Entries

To export object entries,

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and select _Export File_.

1. (Optional) In the next page, select an export template if using a previously saved template.

1. Under entity type, select the object you wish to work with. See [creating and managing objects](../../building-applications/objects/creating-and-managing-objects.md) to learn more about objects.

1. Select one of the export file formats. 

1. Under the fields section, select the object definition fields you wanted included in the export.

1. Click _Save as Template_ to save the export settings for future use. Give the template a name and click _Save_.

1. Finally, click _Export_ to export the object entries.

1. A window appears to display the export process. When the job is completed, click _Download_ to download a zip file. The zip file is downloaded to your local machine.

## Importing Object Definitions

To import object definitions,

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and select _Import File_.

1. In the next page, enter a name for the new import task.

1. (Optional) Select an import template if using a previously saved template.

1. Select _ObjectDefinition (v1_0 - Liferay Object Admin REST)_ as the entity type.

1. Use the checkbox to select whether to have the import task stop or continue upon error.

1. Under import strategy, select an option to _Add or Update Records_ or _Only Add New Records_. Note, when _Only Add New Records_ is selected, if an entity already exists, the import task fails with an error. Select _Add or Update Records_ instead to have the data migration center overwrite the existing entity.

1. Under update strategy, select an option to _Update Changed Record Fields_ or _Overwrite Records_. Note, when _Overwrite Records_ is selected, the whole entity is updated. When _Update Changed Record Fields_ is selected, only the fields defined in the import file are updated, and the rest of the existing values are left alone.

1. Under file settings, click _Choose File_ and locate the JSON file that contains the object definitions to import.

   ![Select the JSON file that contains the object definitions to import.](./data-migration-center/images/04.png)

1. Under import mappings, make any mapping changes you wish by selecting the drop-down list under source file field. 

   ![Make any mapping changes under the import mappings section.](./data-migration-center/images/05.png)

1. Click _Save as Template_ to save the export settings for future use. Give the template a name and click _Save_.

1. Click _Next_ to continue the import. In the pop up window, click _Start Import_.

1. The pop up window shows the progress of the import. Click _Close_ when completed. Note, if an error occurs in the import process, return to the main data migration page and click _Options_ (![Options icon](../../images/icon-options.png)) to download an error report.

1.  Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Objects_ to verify the imported object definition.

## Importing Object Entries

To import object entries,

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and select _Import File_.

```{note}
Make sure your object exists before attempting to import its entries.
```

1. In the next page, enter a name for the new import task.

1. (Optional) Select an import template if using a previously saved template.

1. Under entity type, select the object you wish to work with.

1. Use the checkbox to select whether to have the import task stop or continue upon error.

1. Under import strategy, select an option to _Add or Update Records_ or _Only Add New Records_. Note, when _Only Add New Records_ is selected, if the entity already exists, the import task fails with an error. Select _Add or Update Records_ instead to have the data migration center overwrite the existing entity.

1. Under update strategy, select an option to _Update Changed Record Fields_ or _Overwrite Records_. Note, when _Overwrite Records_ is selected, the whole entity is updated. When _Update Changed Record Fields_ is selected, only the fields defined in the import file are updated, and the rest of the existing values are left alone.

1. Under file settings, click _Choose File_ and locate the JSON file that contains the object entries to import.

1. Under import mappings, make any mapping changes you wish by selecting the drop-down list under source file field. 

1. Click _Save as Template_ to save the export settings for future use. Give the template a name and click _Save_.

1. Click _Next_ to continue the import. In the pop up window, click _Start Import_.

1. The pop up window shows the progress of the import. Click _Close_ when completed. Note, if an error occurs in the import process, return to the main data migration page and click _Options_ (![Options icon](../../images/icon-options.png)) to download an error report.

1. If your [published object](../../building-applications/objects/creating-and-managing-objects/creating-objects.md#publishing-object-drafts) has a panel link, navigate to the object to verify the imported object entries.

## Related Topics

* [Creating and Managing Objects](../../building-applications/objects/creating-and-managing-objects.md)
* [Batch Client Extensions](../../building-applications/client-extensions/batch-client-extensions.md)
* [Batch Engine API Basics - Importing Data](./batch-engine-api-basics-importing-data.md)
* [Batch Engine API Basics - Exporting Data](./batch-engine-api-basics-exporting-data.md)
