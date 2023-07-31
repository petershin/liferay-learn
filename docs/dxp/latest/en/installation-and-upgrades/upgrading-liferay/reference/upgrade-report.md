---
uuid: f1cec033-e3ec-4ead-b0ea-948c3039e704
---
# Upgrade Report

{bdg-secondary}`Available 7.4+`

When you upgrade data, it's important to know the changes made and any issues that occurred. The upgrade report captures this information in a report that include these details:

* Execution date and time
* Total execution time of the upgrade
* Initial, expected, and final DXP/Portal schema versions and build numbers
* Database vendor and version
* Upgrade-related Portal property settings
* Document Library Store and `rootDir` configuration settings
* Document Library size (for [File System Store](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) and [Advanced File System Store](../../../system-administration/file-storage.md))
* List of database tables with their initial size in rows and their final size in rows
* 20 longest-running upgrade processes
* Errors and each type's frequency
* Warnings and each type's frequency

The tool reports this information to a file called `upgrade_report.info` in the `tools/portal-tools-db-upgrade-client/reports` folder. On subsequent upgrades, the tool appends a time stamp to the file name (e.g., `upgrade_report.info.1631029824000`) and then reports new upgrade details to a new `upgrade_report.info` file.

The upgrade report is available through the [upgrade tool](../upgrade-basics/using-the-database-upgrade-tool.md) or at startup with a portal property.

### Upgrade Report through the Upgrade Tool

Upgrade reporting is enabled by setting the `upgrade.report.enabled=true` property in the `tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` file. For example,

```bash
cd liferay-home
```

```bash
echo "upgrade.report.enabled=\"true\"" << tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties
```

The upgrade report is generated in this `/tools/portal-tools-db-upgrade-client/` folder.

### Upgrade Report at Startup with Portal Properties

To enable the upgrade report upon startup, set the following two [portal properties](../../reference/portal-properties.md):

```properties
upgrade.database.auto.run=true
upgrade.report.enabled=true
```

The upgrade report is generated in the `{liferay-home}/reports` folder. 

Note, calculating the document library size may require long wait times. Therefore, the timeout period is set to ten seconds by default. To change this duration, modify the `upgrade.report.dl.storage.size.timeout` property in your `portal-ext.properties` file. Increase the time or set the value to `0` to disable the timeout.

Here is an example upgrade report:

```
...
Date: Tue, Jul 26, 2022 09:02:44 UTC

Upgrade completed in 388 seconds

Initial portal build number: 7310
Initial portal schema version: 8.18.4
Final portal build number: 7413
Final portal schema version: 16.0.0
Expected portal build number: 7413
Expected portal schema version: 16.0.0

Using mariadb version 10.7

liferay.home=/Users/liferay/tomcat/liferay-dxp-7.4.13.u34
...
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
rootDir=/Users/liferay/tomcat/liferay-dxp-7.4.13.u34/data/document_library

The document library storage size is 689.01 KB

Tables in database sorted by initial number of rows:
Table name                           Rows (initial)         Rows (final)
--------------                       --------------       --------------
ResourceAction                                 1822                 2043
ResourcePermission                             1440                 1488
Marketplace_Module                             1195                 2538
...
SegmentsExperience                                0                    1

Top 20 longest running upgrade processes:
	com.liferay.client.extension.internal.upgrade.v3_1_0.ClientExtensionEntryUpgradeProcess took 6866 ms to complete
	com.liferay.client.extension.internal.upgrade.v2_0_0.RemoteAppEntryUpgradeProcess took 4938 ms to complete
	com.liferay.portal.upgrade.v7_4_x.UpgradeCountry took 4429 ms to complete
   ...
	com.liferay.batch.engine.internal.upgrade.v4_4_0.BatchEngineExportTaskUpgradeProcess took 1228 ms to complete

No errors thrown during upgrade

Warnings thrown during upgrade process

...
```

## Related Topics

* [Upgrade Basics](../upgrade-basics.md)
* [Running the Database Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)
* [Database Upgrade Tool Reference](../reference/database-upgrade-tool-reference.md#manual-configuration)
* [Troubleshooting Upgrades](../reference/troubleshooting-upgrades.md)
