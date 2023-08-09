---
uuid: f2e66f48-57bc-44aa-94f4-d480c93dbb5a
---
# Upgrade Log Context

{bdg-secondary}`Available Liferay DXP 7.4 U72 / Liferay Portal 7.4 GA72`

Enable the upgrade log context to display identifiers for upgrade related processes in your console logs. The possible identifiers are:

   * `{upgrade.component=portal}`: for upgrade processes related to portal
   * `{upgrade.component=framework}`: for processes related to the upgrade framework logic
   * `{upgrade.component=<bundleSymbolicName>}`: for upgrade processes related to modules

The logs can be enabled through the [upgrade tool](../upgrade-basics/using-the-database-upgrade-tool.md) or at startup with a portal property.

If using the upgrade tool, set `upgrade.log.context.enabled=true` in your `/tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` file.

If enabling upgrade at startup, set `upgrade.log.context.enabled=true` in your `{Liferay-Home}/portal-ext.properties` file. 

Next, copy the [`portal-impl/src/META-INF/portal-log4j.xml`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/META-INF/portal-log4j.xml) file into `bundles/tomcat/webapps/ROOT/WEB-INF/classes/META-INF` and rename the file to `portal-log4j-ext.xml`. Then find the appender definition:

```
<Appender name="CONSOLE" type="Console">
	<Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m%n" type="PatternLayout" />
</Appender>
```

Change the definition to include `%X`, which tells Log4j to print the thread context information:

```
<Appender name="CONSOLE" type="Console">
	<Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m %X%n" type="PatternLayout" />
</Appender>
```

Here are some example log lines that include the upgrade identifiers:

```
...
2023-05-24 23:29:31.143 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.verify.VerifyProperties#verifySystemProperties {upgrade.component=portal}
2023-05-24 23:29:31.145 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.verify.VerifyProperties#verifySystemProperties in 3 ms {upgrade.component=portal}
...
2023-05-24 23:29:34.012 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.events.StartupHelperUtil#initResourceActions {upgrade.component=framework}
2023-05-24 23:29:34.029 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.events.StartupHelperUtil#initResourceActions in 17 ms {upgrade.component=framework}
...
2023-05-24 23:30:17.046 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.db.index.IndexUpdaterUtil#lambda$updateIndexes$1#Updating database indexes for com.liferay.wiki.service {upgrade.component=com.liferay.wiki.service}
2023-05-24 23:30:17.094 INFO  [main][BaseDB:776] Dropping stale indexes {upgrade.component=com.liferay.wiki.service}
2023-05-24 23:30:17.095 INFO  [main][BaseDB:846] drop index IX_18565130 on WikiPage {upgrade.component=com.liferay.wiki.service}
...
```

## Enabling Together with the Upgrade Report

If the [upgrade report](./upgrade-report.md) is enabled together with the upgrade log context, the contents of the upgrade report will also be output in your console logs. Note, the report is displayed in a slightly different format than the `upgrade_report.info` files.

| Upgrade report key | Explanation |
| :--- | :--- |
| `upgrade.report.database.version` | Database vendor and version. |
| `upgrade.report.document.library.storage.size` | Size of the document library. |
| `upgrade.report.errors` | Array with the errors captured during the upgrade process. Grouped by origin, class, and number of occurrences of the same error. |
| `upgrade.report.execution.date` | Date and time when the report has been generated. |
| `upgrade.report.execution.time` | Total time in seconds that the upgrade took to complete. |
| `upgrade.report.longest.upgrade.processes` | Array with the 20 longest upgrade processes, indicating the name of the process and the time taken to complete each of them. |
| `upgrade.report.portal.expected.build.number` | Expected final build number after the upgrades are executed. |
| `upgrade.report.portal.expected.schema.version` | Expected schema version after the upgrades are executed. |
| `upgrade.report.portal.final.build.number` | Actual final build number after the upgrades have been executed. |
| `upgrade.report.portal.final.schema.version` | Actual final schema version after the upgrades have been executed. |
| `upgrade.report.portal.initial.build.number` | Initial build number before the upgrades are executed. |
| `upgrade.report.portal.initial.schema.version` | Initial schema version before the upgrades are executed. |
| `upgrade.report.property.dl.store.impl` | Implementation configured for the document library storage. |
| `upgrade.report.property.liferay.home` | Absolute path to the Liferay home folder. |
| `upgrade.report.property.locales` | Array with all the locales available. |
| `upgrade.report.property.locales.enabled` | Array with all the locales enabled. |
| `upgrade.report.property.rootDir` | Absolute path to the document library root folder. |
| `upgrade.report.result` | Result of the upgrade calculated after all the upgrade have been executed. |
| `upgrade.report.status` | Upgrade information status provided by OSGi. It indicates if all the upgrades have been executed or there are pending upgrades. |
| `upgrade.report.tables.initial.final.rows` | Array with the name of all the tables and the number of rows on each table before and after the upgrades. |
| `upgrade.report.type` | Type of the upgrade that has taken place (i.e. Major, minor, micro). Based on schema version. |
| `upgrade.report.warnings` | Array with the warnings captured during the upgrade process. Grouped by origin, class, and number of occurrences of the same warning. |

## Related Topics

[Using the Upgrade Database Tool](../upgrade-basics/using-the-database-upgrade-tool.md)
[Upgrade Report](./upgrade-report.md)
[Database Upgrade Tool Reference](./database-upgrade-tool-reference.md)
[Monitoring Upgrades with MBeans](./monitoring-upgrades-with-mbeans.md)
