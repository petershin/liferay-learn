---
toc:
  - ./upgrade-basics/upgrading-via-auto-upgrade.md
  - ./upgrade-basics/upgrading-via-docker.md
  - ./upgrade-basics/using-the-database-upgrade-tool.md
  - ./upgrade-basics/post-upgrade-considerations.md
uuid: 67e60fbe-5272-44a6-b65e-a0a22e034bef
---
# Upgrade Basics

Liferay's tools and instructions facilitate upgrading DXP and Portal environments safely and quickly. Non-clustered environments that have small data sets, for example can be upgraded using a [Docker image](./upgrade-basics/upgrading-via-docker.md). DXP environments and Portal environments that are complex, have larger data sets, or have many customizations are upgraded using the [Database Upgrade Tool](./upgrade-basics/using-the-database-upgrade-tool.md). [Auto upgrade](./upgrade-basics/upgrading-via-auto-upgrade.md) can also be enabled during startup.

!!! important
    **Always** [back up](../maintaining-a-liferay-installation/backing-up.md) your database and installation before upgrading. Testing the upgrade process on backup copies is advised.

!!! note
    [Upgrading via Docker](./upgrade-basics/upgrading-via-docker.md) is the easiest way to upgrade a database for a small, casual Portal environment.

Before starting your upgrade, consider what may be involved. The upgrade topics fall into these categories:

- [Preparation and Planning](#preparation-and-planning)
- [Upgrading Custom Development](#upgrading-custom-development)
- [Migrating Configurations and Infrastructure](#migrating-and-updating-configurations-and-infrastructure)
- [Improving Upgrade Performance](#improving-upgrade-performance)
- [Executing the Database Upgrade](#executing-the-database-upgrade)

## Preparation and Planning

Preparation and planning may be of little consequence for small, casual installations but is *mandatory* for large enterprise-level installations.

### Review Available Upgrade Paths

Use the table below to determine your upgrade path, based on your version of Liferay.

| Upgrade Path                                                                  | Description                                                  |
| :---------------------------------------------------------------------------- | :----------------------------------------------------------- |
| Liferay Portal 6.1+ &rarr; DXP 7.4                                            |                                                              |
| Liferay Portal 5.x and 6.0.x &rarr; Liferay Portal 6.2 &rarr; Liferay DXP 7.4 | Support life ended for Liferay Portal 5.0, 5.1, 5.2, and 6.0 |

If you're upgrading Liferay Portal to a new GA for the same minor version (for example, upgrading from 7.3 GA1 to GA2) and there are no data schema changes, you can start using the new GA immediately. If the schema changed, a startup message reports the new data schema version that you must [upgrade your database to](#executing-the-database-upgrade)---invoking an upgrade with a [Docker image](./upgrade-basics/upgrading-via-docker.md) is easiest.

If your path includes upgrading to Liferay Portal 6.2, follow the [Liferay Portal 6.2 upgrade instructions](https://help.liferay.com/hc/en-us/articles/360017903232-Upgrading-Liferay) first.

!!! note
    Some new Liferay versions rename table columns. Any [virtual columns](https://en.wikipedia.org/wiki/Virtual_column) associated with these columns inhibit database upgrade and must be removed before the upgrade. After the upgrade, you can add equivalent virtual columns. See [Troubleshooting Upgrades](./reference/troubleshooting-upgrades.md) for details.

### Review Deprecations and Changes to Default Settings

Features and configuration defaults may change in new versions of Liferay. See the reference section or the following articles for the most recent deprecations and changes to features and to settings:

- [Maintenance Mode and Deprecations](./reference/maintenance-mode-and-deprecations-in-7-4.md)
- [Default Setting Changes](./reference/default-setting-changes-in-7-4.md)

### Request an Upgrade Patch (Subscription)

{bdg-primary}`Subscription`

If you have a Liferay DXP subscription, update to the latest fix pack and/or request an upgrade patch to prepare for the database upgrade. File a ticket in the [Help Center](https://help.liferay.com/hc/requests/new) to start this process.

### Preparing Publications

If [Publications](../../site-building/publishing-tools/publications.md) is enabled for your instance, ensure you've published all active publications before upgrading. After upgrading, active publications are marked as out of date and cannot be published or changed.

!!! note
    Keep in mind that any publication you published before upgrading cannot be reverted after the upgrade process. The *Revert* option is removed for all publications made on your previous Liferay version.

### Prepare for Upgrading Commerce

If you're using [Commerce](https://learn.liferay.com/w/commerce/index), prepare to upgrade it before upgrading the Liferay database. See [Upgrading Liferay Commerce](https://learn.liferay.com/w/commerce/installation-and-upgrades/upgrading-liferay-commerce) for details.

### Update Marketplace Apps

Before upgrading the Liferay database, update your Marketplace apps for the Liferay version you're currently on and test the updated apps. Skipping app updates can be problematic and can prevent the apps from enabling on the new Liferay version.

!!! important
    Do this on your current installation before database upgrade.

Your app's latest version for your new Liferay version may have database schema changes that require data upgrades. You can upgrade the app data *during* or *after* your Liferay database upgrade.

**Option 1:** Install the latest apps *before* database upgrade and upgrade the app data automatically, as part of your database upgrade. Each database upgrade path describes app setup details.

**Option 2:** Install the latest apps *after* database upgrade and then use [Gogo shell commands](./upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) to upgrade the app data. The [Post Upgrade Considerations](./upgrade-basics/post-upgrade-considerations.md) describes app setup details.

## Upgrading Custom Development

Plugins (e.g., themes, apps, and customizations) you've developed must be adapted to the new Liferay version. This can be as simple as updating dependencies or involve updating code to API changes. If you forgo updating your custom plugins, they may be disabled on the new Liferay version. [Upgrading Custom Development](./upgrading-custom-development.md) walks through the code upgrade process.

## Migrating and Updating Configurations and Infrastructure

Configurations and supporting infrastructure must be migrated and updated from your previous installation to your new one.

!!! important
    If you're upgrading from 6.2 or earlier, update your file store configuration. See the [Updating the File Store](./reference/file-store-updates.md) for more information.

!!! important
    If you've overridden the `locales` [Portal Property](../../installation-and-upgrades/reference/portal-properties.md), override it in the new installation before upgrading. This assures upgrading data for all of your locales.

You can wait until after database upgrade to update your other settings. See these [Migrating Configurations and Properties](./migrating-configurations-and-properties.md) for more information.

## Improving Upgrade Performance

Upgrading large data sets can take a prohibitively long time, if you leave unnecessary data intact or forgo performance tuning. There are several ways to quicken database upgrades.

### Prune Data

If your Liferay server has instances, sites, pages, or versioned content items (e.g., Web Content articles, Documents and Media files, and more) that are unnecessary, removing them can cut down upgrade time considerably. See [Database Pruning for Faster Upgrades](./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md) on ways to prune your database of unnecessary data.

### Tune Database Performance

Adjusting your database for upgrade operations (more data writes than in production) improves database upgrade performance. See [Database Tuning for Upgrades](./upgrade-stability-and-performance/database-tuning-for-upgrades.md) for details.

### Enable Batch Insert

[Enable batch insert](./upgrade-basics/using-the-database-upgrade-tool.md#batch-insert-property) for faster execution.

## Executing the Database Upgrade

Here are two ways to upgrade your Liferay database:

- [Upgrade via Auto Upgrade](./upgrade-basics/upgrading-via-auto-upgrade.md) can be enabled with a portal property for the upgrade to take place during startup. See [Upgrade via Docker](./upgrade-basics/upgrading-via-docker.md) for an example of this using a Docker image. The image updates the database and then starts up using the upgraded database.

- [Using the Database Upgrade Tool](./upgrade-basics/using-the-database-upgrade-tool.md). The Upgrade Tool is a client program for updating the Liferay database while it's detached from any Liferay instance. It facilitates focusing on the upgrade process, [tuning the database](./upgrade-stability-and-performance/database-tuning-for-upgrades.md) for upgrade operations, and [pruning unnecessary data](./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md) to quicken the database upgrade.

!!! note
    [Database Upgrade Options](./reference/database-upgrade-options.md) describes upgrading the database in the above ways (and upgrading modules using Gogo Shell) with various DXP/Portal installation types.

## Additional Tools

See these additional tools to assist you:

- [Upgrade Report](./reference/upgrade-report.md)
- [Upgrade Log Context](./reference/upgrade-log-context.md)
- [Monitoring Upgrades with MBeans](./reference/monitoring-upgrades-with-mbeans.md)

## Conclusion

Once you complete the tasks outlined above, your upgrade is complete. But before using Liferay, you must re-establish desired runtime settings and undo any upgrade-specific tuning. Plus there may be applications that weren't available on your previous Liferay version that are recommended for new Liferay production instances. See the [Post-Upgrade Considerations](./upgrade-basics/post-upgrade-considerations.md) for more information.

Now that you're familiar with the upgrade components, you can upgrade your Liferay instance. Make sure to do preliminary tasks on your current installation, before upgrading the database. It's common to upgrade custom plugin code and execute the database upgrade in parallel. Since, database upgrade is a popular task to start first, here are links to the two methods:

- [Upgrading via Auto Upgrade](./upgrade-basics/upgrading-via-auto-upgrade.md)
- [Using the Database Upgrade Tool](./upgrade-basics/using-the-database-upgrade-tool.md)

Additionally, refer to these other upgrade scenarios if they relate to your upgrade:

- [Upgrading a Sharded Environment](./other-upgrade-scenarios/upgrading-a-sharded-environment.md)
- [Maintaining Clustered Installations](../maintaining-a-liferay-installation/maintaining-clustered-installations.md)
