---
uuid: b688041a-0a2f-4b4f-a149-f49915433003
---
# Using the Database Upgrade Tool

The Liferay Database Upgrade Tool is a client program for upgrading Liferay DXP and Liferay Portal databases offline.

!!! important
    **Always** [back up](../../maintaining-a-liferay-installation/backing-up.md) your data and installation before upgrading. Testing the upgrade process on backup copies is advised.

!!! important
    If you're upgrading from 6.2 or earlier, update your file store configuration. See the [Updating the File Store](../reference/file-store-updates.md) for more information.

You can [tune the database for upgrade operations](../upgrade-stability-and-performance/database-tuning-for-upgrades.md), [prune unnecessary data](../upgrade-stability-and-performance/database-tuning-for-upgrades.md) (e.g., unneeded versions of Web Content, Documents, and more) to improve upgrade performance, and resolve upgrade issues by modifying the database while it's detached from your Liferay instance. These activities are especially important for upgrading DXP and any large, critical Portal environments safely and as quickly as possible. After you've accounted for tuning and pruning the database and completing relevant tasks described in [Upgrade Basics](../upgrade-basics.md), you're ready to set up the new installation and upgrade the database using the upgrade tool.

If you're [upgrading to a new Liferay Docker image](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md) and want to use the upgrade tool, use it from a [Liferay Tomcat Bundle](../../installing-liferay/installing-a-liferay-tomcat-bundle.md) of the new Liferay version. The tool is in the bundle's `tools/portal-tools-db-upgrade-client` folder.

If you installed the new Liferay release on an application server, create a `[Liferay Home]/tools/portal-tools-db-upgrade-client` folder, download the upgrade tool, and install the tool to the new folder.

| Edition                    | Download Instructions                                                                                                                                                                                                                                                         |
| :------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Liferay DXP (Subscription) | Go to the [*Downloads* page](https://customer.liferay.com/group/customer/downloads) and select the DXP version and the *Product/Service Packs* file type. In the listing that appears, click *Download* for the *Liferay DXP Upgrade Client*.                                 |
| Liferay Portal             | Go to the [*Downloads* page](https://www.liferay.com/downloads-community). In the *Liferay Portal* downloads menu, select *Other files* and click *Download*. The latest Liferay Portal release assets GitHub page appears. Click on `liferay-ce-portal-tools-[version].zip`. |

## Setting Up a New Installation

1. Replace the new Liferay installation's `[Liferay Home]/data` folder with the `[Liferay Home]/data` folder from your [backup](../../maintaining-a-liferay-installation/backing-up.md).

1. Copy your DXP activation key (Subscription) and your [OSGi configuration files](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) from your [backup](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) to the new installation.

1. If you're upgrading to 7.2, disable search indexing using a [configuration file](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) in your new installation's `[Liferay Home]/files/osgi/configs/` folder. For example,

   ```bash
   cd liferay-home
   ```

   ```bash
   mkdir -p osgi/configs
   ```

   ```bash
   echo "indexReadOnly=\"true\"" >> osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
   ```

   !!! note
       DXP/Portal 7.3+ disables/re-enables search indexing automatically.

1. If you're using [Commerce](https://learn.liferay.com/w/commerce/index), prepare to upgrade it. See [Upgrading Liferay Commerce](https://learn.liferay.com/w/commerce/installation-and-upgrades/upgrading-liferay-commerce) for details.

1. If you want to upgrade your Marketplace app data along with the Liferay database upgrade, [download](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md) the latest version of each app targeted for the new Liferay version and copy it to your `[Liferay Home]/deploy` folder. Otherwise, you can install the apps after the database upgrade and upgrade their data as described in the [Post-Upgrade Considerations](./post-upgrade-considerations.md).

1. If you're using [Advanced File System Store](../../../system-administration/file-storage.md) or [Simple File System Store](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) with a modified storage location, export your file store settings to a [`.config` file](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) and copy it to your new `[Liferay Home]/osgi/configs/` folder.

   !!! important
       If you're using [Advanced File System Store](../../../system-administration/file-storage.md), you must configure it with a `.config` file in the new installation before upgrading the database.

       Here's an example  `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config` file with the required `rootDir` parameter:

       `rootDir="data/document_library"`

1. Use your database vendor's recommended JDBC driver. If you're using MySQL, for example, set `jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver` in your [`portal-ext.properties`](../../reference/portal-properties.md) file and replace the MySQL JDBC driver JAR your app server uses. See [Database Drivers](../migrating-configurations-and-properties.md#database-drivers) for more details.

   You can configure the upgrade by answering the upgrade tool prompts or by [using upgrade properties files](../reference/database-upgrade-tool-reference.md#manual-configuration).

   !!! note
       If you're [upgrading to a new Liferay Docker image](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md), make sure to specify your database connection using [Portal Properties](../../reference/portal-properties.md) files instead of Docker env variables. The [Portal Properties reference](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) lists Portal Properties that correspond with each Liferay Env variable.

2. (Optional) To enable [upgrade reporting](../reference/upgrade-report.md), set `upgrade.report.enabled=true` in your `tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` file.

3. (Optional) To enable [upgrade log context](../reference/upgrade-log-context.md), set `upgrade.log.context.enabled=true` in your `/tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` file.

### Batch Insert Property

You can enable the batch insert property for your JDBC configuration in the `portal-upgrade-database.properties` file. This improves performance by batching insert statements for faster execution. See the table below for your vendor's property parameters. This feature is not available for DB2 and Oracle databases.

| Database Provider | Property                         |
| :---------------- | :------------------------------- |
| MariaDB           | `rewriteBatchedStatements=true`  |
| MySQL             | `rewriteBatchedStatements=true`  |
| PostgreSQL        | `reWriteBatchedInserts=true`     |
| SQL Server        | `useBulkCopyForBatchInsert=true` |

!!! note
    The batch insert property is included in the [`portal-upgrade-database.properties`](https://github.com/liferay/liferay-portal/blob/master/modules/util/portal-tools-db-upgrade-client/properties/portal-upgrade-database.properties) file for Liferay 7.4 U60+/GA60+.

## Running the Upgrade Tool

!!! important
    Before {bdg-secondary}`Liferay 7.4 U82/GA82`, the `db_upgrade_client.sh` file was named `db_upgrade.sh`.

The upgrade tool is configured via its command line interface, or by [using properties files](../reference/database-upgrade-tool-reference.md#manual-configuration).

The `db_upgrade_client.sh` script in the `[Liferay Home]/tools/portal-tools-db-upgrade-client` folder invokes the upgrade tool (`db_upgrade_client.bat` on Windows). The `--help` option describes the tool's usage.

```bash
./db_upgrade_client.sh --help
```

Here's how to upgrade your database with the upgrade tool:

1. Start the upgrade tool. Here's an example command:

   ```bash
   cd liferay-home/tools/portal-tools-db-upgrade-client
   ```

   ```bash
   ./db_upgrade_client.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx4096m"
   ```

   The command above executes the upgrade tool with the same JVM options recommended for the application server. File encoding (`UTF-8`), time zone (`GMT`), country, language, and memory settings (`-Xmx value`) should all match your application server's settings. For databases with over 10 GB of data, allocate additional memory using the `-Xmx` option.

   If you haven't configured the upgrade using the [upgrade properties files](../reference/database-upgrade-tool-reference.md#manual-configuration), the upgrade tool prompts you for some configuration values and shows default values in parentheses. Here's an example interaction:

   ```
   Please enter your application server (tomcat):
   tomcat

   Please enter your application server directory (../../tomcat-9.0.17):

   Please enter your extra library directories (../../tomcat-9.0.17/bin):

   Please enter your global library directory (../../tomcat-9.0.17/lib):

   Please enter your portal directory (../../tomcat-9.0.17/webapps/ROOT):

   [ db2 mariadb mysql oracle postgresql sqlserver sybase ]
   Please enter your database (mysql):
   mariadb

   Please enter your database host (localhost):

   (etc.)
   ```

   If you want to use the default value shown in a prompt, press enter.

   After configuration completes, the upgrade starts. The tool logs each upgrade process start and completion.

   !!! important
       The upgrade tool only prompts you for a few configurations. Many that might be important for your application must be set in the [upgrade properties file](../reference/database-upgrade-tool-reference.md#manual-configuration) (e.g. `dl.store.impl` and `module.framework.base.dir`). It's a best practice to copy all properties in `portal-ext.properties` over to `portal-upgrade-ext.properties`.

1. After the upgrade completes, check the [upgrade report](../reference/upgrade-report.md) for any database upgrade failures, errors, or warnings. You can use [Gogo Shell commands](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) to troubleshoot issues and finish the upgrade.

You have completed the database upgrade and resolved any issues.

## Test the Upgraded Database

Now that the database upgrade is complete, test it.

1. If you're upgrading to a new Liferay Docker image, point your image to the upgraded database and validate Liferay with the database. Please see [Configuring Liferay Containers](../../installing-liferay/using-liferay-docker-images/configuring-containers.md) for more information.

1. Examine the [Post-Upgrade Considerations](./post-upgrade-considerations.md).

1. Copy and merge your custom [Liferay Home files](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) and [application server files](../../maintaining-a-liferay-installation/backing-up.md#application-server) from your backup to the new installation. The files may include but are not limited to these:

   - `/license/*`: Activation keys. (Subscription)
   - `/log/*`: Log files.
   - `/osgi/configs/*.config`: OSGi configuration files. Only copy over your custom configuration files. Do not include any `*-default.config` files generated by Liferay.
   - `portal-*.properties`: Portal properties files, such as `portal-ext.properties`.
   - Application server files: Modified scripts and configuration files.
   - `web.xml`: Portal web application descriptor.

1. [Update the Portal properties](../migrating-configurations-and-properties.md#migrating-portal-properties) in your new installation.

1. Start your server and validate Liferay with its upgraded database.

   ![Here is the Liferay DXP landing screen.](./using-the-database-upgrade-tool/images/01.png)

You've upgraded your Liferay database using the Database Upgrade Tool.

If this was a trial upgrade and you want to shorten the upgrade time, tune your database for upgrade (if you haven't already) and [remove unnecessary data](../upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md) from the database. Repeat this article's steps as necessary.

If you run into issues, check the [upgrade report](../reference/upgrade-report.md) and see [Troubleshooting Upgrades](../reference/troubleshooting-upgrades.md).

## Next Steps

Revisit [Upgrade Basics](../upgrade-basics.md) to see what's left to upgrade.
