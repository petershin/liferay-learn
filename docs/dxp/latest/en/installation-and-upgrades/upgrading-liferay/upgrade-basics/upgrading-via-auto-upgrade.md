---
uuid: f027c0b1-a38f-43d1-a1d1-da973281f9b8
---
# Upgrading via Auto Upgrade

You can upgrade your database automatically by enabling *auto upgrade* via the portal property before starting up your instance.

```{important}
**Always** [back up](../../maintaining-a-liferay-installation/backing-up.md) your database and existing installation before upgrading. Testing the upgrade process on backup copies is advised.
```

## Upgrading with a Tomcat Bundle

1. Review the [preparation and planning](../upgrade-basics.md#preparation-and-planning) steps and ensure you have accounted for features such as publications, custom development, database pruning, etc.

1. [Download](../../installing-liferay/installing-a-liferay-tomcat-bundle.md#download) the latest Liferay-Tomcat bundle you plan to use for the upgrade.

1. Extract the bundle to your host location.

1. [Start the new bundle for the first time](../../installing-liferay/running-liferay-for-the-first-time.md). The Setup Wizard appears.

1. In the database section, click _Change_ and enter your Liferay installation's database settings. 

   ![Input your database settings in the database section of the setup wizard.](./upgrading-via-auto-upgrade/images/01.png)

1. Click _Finish Configuration_. Your database settings are stored in the `portal-setup-wizard.properties` file in your [Liferay home folder](../../reference/liferay-home.md).

1. In the same Liferay home folder, create a `portal-ext.properties` file. Configuration options are set in this [portal properties](../../reference/portal-properties.md) file. 

1. Open the file and set `upgrade.database.auto.run=true`.

2. (Optional) Set `upgrade.report.enabled=true` to enable [upgrade reporting](../reference/upgrade-report.md). Further, define an output directory for the upgrade report by setting the `upgrade.report.dir={your_directory}` portal property. If none is set, `Liferay_Home/reports` is the default report directory.

3. (Optional) Set `upgrade.log.context.enabled=true` to enable [upgrade log context](../reference/upgrade-log-context.md).

4. Save the property file, and [restart Liferay](../../installing-liferay/running-liferay-for-the-first-time.md#restart-the-server).

5. As Liferay restarts, the database is updated automatically, and progress appears in your console log. If you enabled upgrade reporting, the report is available in the output directory.

```{note}
Make sure to remove the `upgrade.database.auto.run` property or set the value to `false` to continue using Liferay after the upgrade.
```

## Related Topics

* [Upgrade Basics](../upgrade-basics.md)
* [Database Upgrade Options](../reference/database-upgrade-options.md)
* [Using the Database Upgrade Tool](./using-the-database-upgrade-tool.md)
* [Upgrading Custom Development](../upgrading-custom-development.md)
* [Troubleshooting Upgrades](../reference/troubleshooting-upgrades.md)
* [Monitoring Upgrades with MBeans](../reference/monitoring-upgrades-with-mbeans.md)
