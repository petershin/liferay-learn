---
uuid: 76e7db9a-508e-4c44-b57c-28f3c0ea718a
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- Commerce
- Liferay Self-Hosted
- Liferay PaaS
---
# Upgrading Liferay Commerce

To enhance the quality of your experience with Liferay Commerce, Liferay provides periodic product upgrades with bug fixes and new features. Users should consider regularly updating to the latest release.

## Upgrading to Commerce 4.0

Starting with Liferay Commerce 3.0, Commerce is now bundled with Liferay DXP. To upgrade to Commerce 4.0, you must first upgrade your base Liferay DXP installation to DXP 7.4 and perform a search reindex.

```{warning}
After upgrading to 7.4, do *not* deploy the Commerce `LPKG` again. The Commerce 4.0 modules are bundled with 7.4. Deploying the `LPKG` causes conflicts.
```

To learn more about the DXP upgrade process, see [Upgrade Basics](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/upgrading-liferay/upgrade-basics.html). Once DXP is upgraded to 7.4, execute a reindex.

### Prerequisite for Upgrading to Liferay Commerce 4.0

The `CommerceCountry` table is deprecated in Liferay Commerce 4.0 and is being replaced by the `Country` table. While the `CommerceCountry` table only required the name of the country, the Country table requires the name and the Alpha-2 (a2) and Alpha-3 (a3) code for each country.

The `CommerceCountry` table may be populated if you are using the Minium Accelerator or if you are using your own values. If you are not using the Minium Accelerator, the table can be empty. As a prerequisite before upgrading to Liferay DXP 7.4, you must ensure that each country in the `CommerceCountry` table has its ISO code pre-populated. See [Country Codes (ISO)](https://www.iso.org/obp/ui/#search/code) for more information.

![The CommerceCountry table has more fields than the Country table.](./upgrading-liferay-commerce/images/01.png)

### Executing a Post-Upgrade Reindex

After upgrading to DXP 7.4, execute a full search reindex.

1. Open the _Global Menu_, and go to _Control Panel_ &rarr; _Search_.

   ![Go to Search in the Control Panel tab.](./upgrading-liferay-commerce/images/02.png)

1. Under the _Index Actions_ tab, click _Reindex_ for _All search indexes_.

Once the reindex has finished, verify it was successful by going to _Commerce_ &rarr; _Products_ in the Global Menu and confirming that all products are displayed.

## Upgrading to Commerce 3.0 from 2.1 and Below

To upgrade to Commerce 3.0, you must first upgrade your base Liferay DXP installation to DXP 7.3 and then execute a search reindex.

```{warning}
After upgrading to 7.3, do *not* deploy the Commerce `LPKG` again. The Commerce 3.0 modules are bundled with 7.3. Deploying the `LPKG` causes conflicts.
```

### Executing a Post-Upgrade Reindex

After upgrading to DXP 7.3, execute a full search reindex.

1. Open the _Global Menu_ and go to _Control Panel_ &rarr; _Search_.

   ![Go to Search in the Control Panel tab.](./upgrading-liferay-commerce/images/02.png)

1. Under the _Index Actions_ tab, click on _Execute_ for _Reindex all search indexes_.

Once the reindex has finished, verify it was successful by going to _Commerce_ &rarr; _Products_ in the Global Menu and confirming that all products are displayed.

## Upgrading to Commerce 2.1.x/2.2.x

To upgrade Liferay Commerce to 2.1.x/2.2.x, you must apply the appropriate DXP fix pack.

```{note}
Upgrading from 1.1.x to 2.1.x does **not** require an incremental upgrade to 2.0.x.
```

For instance, if upgrading to Liferay Commerce 2.0.7 - upgrade Liferay DXP 7.1 to fix pack 16 or above. If you are using Liferay DXP 7.2, you must apply fix pack 2 or 3. To learn about upgrading DXP, see [Upgrade Basics](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/upgrading-liferay/upgrade-basics.html). See the table below to understand the upgrade paths. 

| Upgrading to           | Required Fix Pack Version             |
| :--------------------- | :------------------------------------ |
| Liferay Commerce 2.0.7 | Liferay DXP 7.1 FP 16+/DXP 7.2 FP 2-3 |
| Liferay Commerce 2.1.0 | Liferay DXP 7.1 FP 17+/DXP 7.2 FP 5   |
| Liferay Commerce 2.1.3 | Liferay DXP 7.1 FP 24+                |
| Liferay Commerce 2.2.0 | Liferay DXP 7.2 FP 13                 |
| Liferay Commerce 2.2.1 | Liferay DXP 7.2 FP 15                 |

When upgrading from Commerce 2.0.7 to 2.1.3, 2.2.0 or 2.2.1, you must first upgrade to Commerce 2.1.0. Commerce versions 2.1.3+ only support Liferay DXP 7.1.x and Commerce versions 2.2.0+ only support Liferay DXP 7.2.x.

```{note}
Once you upgrade to Liferay DXP 7.1 FP 17+/Commerce 2.1.0 or Liferay DXP 7.2 FP5/Commerce 2.1.0, you can upgrade to other target versions including Liferay DXP 7.4 that comes bundled with Commerce 4.0.
```

### Applying the Appropriate Fix Pack

{bdg-primary}`Subscription`

The appropriate fix packs for Liferay are available to download at the [Help Center](https://customer.liferay.com/downloads). Once downloaded, you can apply the fix pack using the [Liferay Patching Tool](https://help.liferay.com/hc/articles/360018176551-Using-the-Patching-Tool). See [Installing Patches](https://help.liferay.com/hc/en-us/articles/360028810512-Installing-Patches) for more information.

If Liferay DXP was [installed manually](https://help.liferay.com/hc/articles/360017896672-Installing-Liferay-DXP-Manually) (for example, on WebLogic), see [Installing Patches on the Liferay DXP 7.1 WAR](https://help.liferay.com/hc/articles/360018176651-Installing-patches-on-the-Liferay-DXP-7-1-WAR).

Then follow these steps to verify the fix pack was successfully installed:

1. Navigate to the `[Liferay Home]/patching-tool` folder.

1. Verify that the fix pack has been applied by executing the following:
    * Linux/Unix: `./patching-tool.sh info`
    * Windows: `patching-tool info`

    ```
    Detailed patch list:
       [ -] dxp-12-7110 :: Currently not installed; Won't be installed: dxp-14 contains the fixes included in this one :: Built for LIFERAY
       [*I] dxp-14-7110 :: Installed; Will be installed. :: Built for LIFERAY
    ```

Fix Packs are cumulative in nature and include all the fix packs previously released. After patching, remove Liferay DXP's cache of deployed code by deleting the contents of the `[Liferay Home]/work` folder. See below for how to remove other stale data.

### Downloading and Deploying

Once you're running the appropriate fix pack of DXP 7.1/7.2, follow these steps to upgrade to Commerce 2.1.x/2.2.x.

1. Download Liferay Commerce.

    * Commerce Enterprise is available from [Help Center](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001).
    * Commerce Community is available from the [Liferay Commerce Community Download Page](https://www.liferay.com/downloads-community)

1. Deploy the `LPKG` to the `[Liferay Home]/deploy` folder. To learn more about deploying applications to Liferay DXP, see [Installing Apps](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html).

1. Verify that the messages similar to those shown below appear in the application server console:

    ```
    Processing Liferay Commerce Enterprise x.x.x.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. Shut down the application server.

### Clearing Stale Data and Verifying the Upgrade Process

1. Delete the `[Liferay Home]/osgi/state` folder. To learn more about OSGi folders, see [Installing Apps](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html).

1. Start the application server.

1. Verify that the upgrade process has started by looking for messages similar to this in the logs of your application server:

    ```
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess in 24 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess in 8 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess in 12 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess
    Starting com.liferay.portal.kernel.upgrade.UpgradeProcess#alter
    Completed com.liferay.portal.kernel.upgrade.UpgradeProcess#alter in 40 ms
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess in 60 ms
    Starting com.liferay.portal.upgrade.internal.index.updater.IndexUpdaterUtil#updateIndexes#Updating database indexes for com.liferay.commerce.account.service
    Dropping stale indexes
    Adding indexes
    ```

    ```
    Verifying com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess
    Starting com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog
    Completed com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog in 2 ms
    Completed verification process com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess in 7 ms
    1 theme for admin-theme is available for use
    1 theme for classic-theme is available for use
    1 theme for minium-theme is available for use
    ```

The Liferay Commerce instance has been upgraded.

### Executing Post-Upgrade Reindex

> Liferay Commerce 2.1 and Below

After upgrading from to the latest version, execute a full search reindex:

1. Navigate to _Control Panel_ &rarr; _Configuration_ &rarr; _Search_.
1. Click _Execute_ next to _Reindex all search indexes_. and wait for it to finish.
1. Navigate to _Control Panel_ &rarr; _Commerce_ &rarr; _Products_.
1. Verify all the products are displayed again.

Once reindexing is complete, the upgraded Liferay Commerce instance is ready for use.

## Related Topics

* [Installing Apps](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html)
* [Liferay Commerce Fix Delivery Method](../get-help/commerce-enterprise-support/liferay-commerce-fix-delivery-method.md)
