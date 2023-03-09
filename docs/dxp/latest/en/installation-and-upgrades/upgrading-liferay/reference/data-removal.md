---
uuid: 9b0b0453-53f8-49ce-8169-c8a25cedf7bf
---
# Data Removal

{bdg-secondary}`Available 7.4+`

Current Liferay features may have known unnecessary data. The Data Removal tool removes this data.

Here's how to remove the obsolete data:

1. In the *Control Panel*, navigate to *System Settings* &rarr; *Upgrades* (in the *Platform* category) &rarr; *Data Removal*. The Data Removal screen appears.

   ![Go to the Data Removal tab.](./data-removal/images/01.png)

1. Select the data types you want to remove

1. Click *Save*.

The obsolete data is removed.

Note, to save the settings to a [configuration file](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md), click the *Actions* menu and select *Export*.

## Using a Configuration File

If desired, you can use a configuration file to remove unnecessary data.

To do this,

1. Create a configuration file named `com.liferay.data.cleanup.internal.configuration.DataRemovalConfiguration.config`

1. Set the desired keys to `true` in the file:

   ```
   configuration.override.com.liferay.data.cleanup.internal.configuration.DataRemovalConfiguration_removeExpiredJournalArticles=true

   configuration.override.com.liferay.data.cleanup.internal.configuration.DataRemovalConfiguration_removeDLPreviewCTSContentData=true

   configuration.override.com.liferay.data.cleanup.internal.configuration.DataRemovalConfiguration_removePublishedCTSContentData=true
   ```

1. Add the configuration file to `${LIFERAY_HOME}/osgi/configs`. After server startup, Liferay removes the unnecessary data.

1. After data removal, remove the configuration file from the `configs` folder to prevent it from running upon subsequent server startups.

## Additional Information

* [Data Cleanup](./data-cleanup.md)
* [Upgrading Via Docker](../upgrade-basics/upgrading-via-docker.md)
* [Using the Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)
