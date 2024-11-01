---
uuid: f1cec033-e3ec-4ead-b0ea-948c3039e704
---
# Upgrade Report

{bdg-secondary}`Available 7.4+`

When you perform upgrades, it is important to know the changes made and any issues that occurred.

!!! note
    The upgrade status returns combined results for core upgrades, module upgrades, verify process exceptions, and unsatisfied components. A `Success` is when all four have passed. A `Failure` is when one of the first three fails. And `Unresolved` is when unsatisfied components status fails.

The upgrade report is available through the [upgrade tool](../upgrade-basics/using-the-database-upgrade-tool.md) or at startup with a portal property.

Note, the upgrade report information can also be output in your console logs by enabling the [upgrade log context](./upgrade-log-context.md).

## Upgrade Report Structure

As of {bdg-secondary}`Liferay DXP 2024.Q4+`, upgrade information is reported in two files:

- `upgrade_report.txt`
  - Execution date and time
  - Total execution time of the upgrade
  - Result of the release manager OSGi check command. This lists any pending upgrades that have not been applied.
  - Upgrade status (Success, Failure, or Unresolved)
  - Upgrade type (`major`, `minor`, `micro`, or `no upgrade`)
  - Initial, expected, and final DXP/Portal schema versions and build numbers
  - Database vendor and version
  - Document library root directory, storage implementation, and storage size
  - Path to Liferay home
  - The JVM arguments used by the Liferay bundle
  - Overridden portal properties
  - Properties files where portal properties are set
  - Portal configurations
  - `*.config` files where configurations are set
  - Database table names with their initial and final size in rows

- `upgrade_report_diagnostics.txt`
  - Execution date and time
  - JVM errors and each type's frequency
  - Failed SQL queries
  - 20 longest-running upgrade processes
  - 20 longest-running SQL queries
  - Warnings and each type's frequency

!!! tip
    If you have a large document library, you can speed up the upgrade report by disabling it from reporting the document library storage size. To do this, set the `upgrade.report.dl.storage.size.timeout` property to `0` or to an empty string:

	```properties
	upgrade.report.dl.storage.size.timeout=0
  upgrade.report.dl.storage.size.timeout=
	```

!!! note
    In earlier versions, the upgrade information is reported in an `upgrade_report.info` file. Different Liferay versions might not include the same information.

## Upgrade Report through the Upgrade Tool

Upgrade reporting is enabled by default. You can disable it by setting the `upgrade.report.enabled=false` property in the `tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` file. For example,

```bash
cd liferay-home
```

```bash
echo "upgrade.report.enabled=\"false\"" << tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties
```

Optionally, define an output directory for the upgrade report by setting the `upgrade.report.dir={your_directory}` property. If none is set, the report is generated in the `/tools/portal-tools-db-upgrade-client/reports` folder.

## Upgrade Report at Startup with Portal Properties

To enable the upgrade report upon startup, set the following two [portal properties](../../reference/portal-properties.md) in your `portal-ext.properties` file:

```properties
upgrade.database.auto.run=true
upgrade.report.enabled=true
```

Optionally, define an output directory for the upgrade report by setting the `upgrade.report.dir={your_directory}` property. If none is set, the report is generated in the `{liferay-home}/reports` folder.

## Additional Information

On subsequent upgrades, the tool appends a time stamp to the file name (e.g., `upgrade_report.txt.1631029824000`) and then reports new upgrade details to a new `upgrade_report.txt` file.

Note, calculating the document library size may require long wait times. Therefore, the timeout period is set to ten seconds by default. To change this duration, modify the `upgrade.report.dl.storage.size.timeout` property in your `portal-ext.properties` file. Increase the time or set the value to `0` to disable the timeout.

## Related Topics

- [Running the Database Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)
- [Database Upgrade Tool Reference](../reference/database-upgrade-tool-reference.md)
- [Troubleshooting Upgrades](../reference/troubleshooting-upgrades.md)