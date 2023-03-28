---
uuid: 9b0b0453-53f8-49ce-8169-c8a25cedf7bf
---
# Data Removal

{bdg-secondary}`Available 7.4+`

Use the Data Removal tool to erase unnecessary application data that may accumulate over time, such as expired journal articles and publication previews.

To remove data,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and go to *Control Panel* &rarr; *System Settings* &rarr; *Upgrades* &rarr; *Data Removal*.

   ![Go to the Data Removal tab.](./data-removal/images/01.png)

1. Select the data to remove:

   * Expired Journal Articles

   * Document Library Preview Change Tracking Store Content Data (Publications)

   * Published Change Tracking Store Content Data (Publications)

   ```{important}
   You should only need to run Published Change Tracking Store Content Data if you're using a Liferay version before 7.3 U10 or 7.4 U37. It's recommended you upgrade your version after running this task to prevent the accumulation of this unnecessary data.
   ```

1. Click *Save*.

Liferay immediately removes the selected data.

## Additional Information

* [Data Cleanup](./data-cleanup.md)
* [Upgrading Via Docker](../upgrade-basics/upgrading-via-docker.md)
* [Using the Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)
