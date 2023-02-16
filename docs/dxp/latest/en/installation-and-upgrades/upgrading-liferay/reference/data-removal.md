---
uuid: 9b0b0453-53f8-49ce-8169-c8a25cedf7bf
---
# Data Removal

{bdg-secondary}`Available 7.4+`

Current Liferay features may have known unnecessary data. The Data Removal tool removes this data.

Here's how to remove the obsolete data:

1. In the *Control Panel*, navigate to *System Settings* &rarr; *Upgrades* (in the *Platform* category) &rarr; *Data Removal*. The Data Removal screen appears.

    ![Here is the Data Removal screen.](./data-removal/images/01.png)

1. Select the data types you want to remove and click *Save*.

The obsolete data is removed.

Note, to save the settings to a [configuration file](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md), click the *Actions* menu and select *Export*.

Use this `com.liferay.data.cleanup.internal.configuration.DataRemovalConfiguration.config` configuration file upon server startup to remove obsolete data. Set the `removeExpiredJournalArticles` key to `true` in the file. After data removal, remove the configuration file from the `osgi/configs` folder to prevent the file from running upon subsequent server startups.

## Additional Information

* [Data Cleanup](./data-cleanup.md)
* [Upgrading Via Docker](../upgrade-basics/upgrading-via-docker.md)
* [Using the Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)
