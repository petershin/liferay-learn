---
uuid: f027c0b1-a38f-43d1-a1d1-da973281f9b8
---
# Upgrading via Auto Upgrade

Liferay makes it easy to upgrade your database with the auto upgrade feature. Simply enable the feature by setting the portal property to true before starting up your instance.

```{important}
**Always** [back up](../../maintaining-a-liferay-installation/backing-up.md) your database and existing installation before upgrading. Testing the upgrade process on backup copies is advised.
```

## Upgrading with a Tomcat Bundle

Here are the steps using Tomcat as an example:

1. First review the [preparation and planning](../upgrade-basics.md#preparation-and-planning) steps and ensure you have accounted for things such as publications, custom development, database pruning, etc.

1. [Download](../../installing-liferay/installing-a-liferay-tomcat-bundle.md#download) the latest Liferay tomcat bundle you plan to use for the upgrade.

1. Extract the bundle to your host location.

1. [Start the new bundle for the first time](../../installing-liferay/running-liferay-for-the-first-time.md). You will be presented with the setup wizard.

1. In the database section, click _Change_ and input the database settings of your Liferay installation.

   ![Input your database settings in the database section of the setup wizard.](./upgrading-via-auto-upgrade/images/01.png)

1. Click _Finish Configuration_. Your database settings are stored in the `portal-setup-wizard.properties` file in your [Liferay home folder](../../reference/liferay-home.md).

1. In the same Liferay home folder, create a `porta-ext.properties` file. Configuration options are set in this [portal properties](../../reference/portal-properties.md) file. 

1. Open the file and set `upgrade.database.auto.run=true`.

1. (Optional) To enable [upgrade reporting](../reference/upgrade-report.md), set `upgrade.report.enabled=true`.

1. (Optional) To enable [upgrade log context](../reference/upgrade-log-context.md), set `upgrade.log.context.enabled=true`.

1. Save the property file and [restart Liferay](../../installing-liferay/running-liferay-for-the-first-time.md#restart-the-server).

1. As Liferay restarts, the database will automatically be updated. View the progress of the update in your console log. If you enabled upgrade reporting, when the upgrade is finished, in the `Liferay_Home/reports` folder.

## Related Topics

* [Upgrade Basics](../upgrade-basics.md)
* [Database Upgrade Options](../reference/database-upgrade-options.md)
* [Using the Database Upgrade Tool](./using-the-database-upgrade-tool.md)
* [Upgrading Custom Development](../upgrading-custom-development.md)
* [Troubleshooting Upgrades](../reference/troubleshooting-upgrades.md)
