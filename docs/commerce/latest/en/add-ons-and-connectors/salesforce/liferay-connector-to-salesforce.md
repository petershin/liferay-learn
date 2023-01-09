# Liferay Connector to Salesforce

{bdg-primary}`Subscription`

{bdg-secondary}`Available Liferay DXP 7.4 U46+`

You can use Liferay's connector to Salesforce to import data from Salesforce to Liferay DXP. It uses Talend job designs and Liferay's Job Scheduler under the hood.

You can [download](https://marketplace.liferay.com/p/liferay-connector-to-salesforce) the Salesforce Connector to a Liferay instance as an `.lpkg` file. This file contains multiple Talend jobs that map data fields in Liferay to data fields in Salesforce. Once deployed, job scheduler tasks are automatically created for each Talend job. You can then configure and run them manually via the job scheduler UI, or schedule to run them at specific time intervals.

## Supported Entities

The following chart lists supported Salesforce entities with their Liferay counterparts. Currently, you can only import Salesforce data to Liferay.

| Salesforce       | Liferay     |
| :--------------- | :---------- |
| Account          | Account     |
| Account Address  | Account     |
| Account Contact  | User        |
| Price Book       | Price List  |
| Price Book Entry | Price Entry |
| Product          | Product     |
| Order            | Order       |
| OrderItem        | Order Item  |

```{note}
There is no equivalent entity for Liferay's product catalogs in Salesforce. When importing Salesforce products to Liferay, you must have a catalog with externalReferenceCode as `SALESFORCE`. If it does not exist, Liferay automatically creates it and uses it to store the imported products. 
```

## Deploying the Connector

Follow these steps to deploy the connector to a Liferay DXP instance:

1. Download the Liferay connector to Salesforce from the [Liferay Marketplace](https://marketplace.liferay.com/p/liferay-connector-to-salesforce).

1. Copy the `.lpkg` file to the DXP instance's [`${liferay.home}/deploy`](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/liferay-home.html) folder.

1. Verify that the messages shown below appear in the application server console:

   ```bash
   Processing Liferay Connector to Salesforce 1.0.0.lpkg
   The portal instance needs to be restarted to complete the installation of file:/Users/able/bundles/osgi/marketplace/Liferay%20Connector%20to%20Salesforce%20-%20Impl.lpkg
   ```

1. Restart your Liferay DXP instance.

1. After restarting, confirm if the deployment was successful by opening the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigating to *Control Panel* &rarr; *Job Scheduler*.

   If successful, you should see four new job scheduler tasks added.

   ![Verify the addition of four new job scheduler tasks.](./liferay-connector-to-salesforce/images/01.png)

   Before running these tasks, you must configure their context parameters.

## Configuring the Job Scheduler Tasks

Upon creation, the settings editor for each Talend job scheduler task is automatically populated with default context parameters. You can use these parameters to provide necessary credentials and to modify each task's behavior in runtime.

```{warning}
Be careful when removing parameters from the settings editor. If you leave a key with a blank value, it disappears when saving the settings. If you lose the key-value pairs, they can't be restored, and you'll have to recreate the Talend dispatch task.
```

### Credentials Reference

Each task includes the following fields for entering Liferay and Salesforce credentials.

| Context Parameter    | Description                 |
| :------------------- | :-------------------------- |
| `LiferayServerURL`   | URL for the Liferay server  |
| `LiferayUser`        | Liferay account username    |
| `LiferayPassword`    | Liferay account password    |
| `SalesForceURL`      | Salesforce SOAP API Url     |
| `SalesForceUser`     | Salesforce account username |
| `SalesForcePassword` | Salesforce account password |
| `SalesForceToken`    | Salesforce OAuth API token  |

```{note}
You can filter data from Salesforce so that only the newly modified or created records are imported. To do this, you must set the deltamins parameter in your job configuration. The deltamins parameter specifies how many minutes before the last run newly created or modified records are queried and imported.

For instance, if `deltamins = 20` and `lastRunDate = 01/12/2022 12:00:00`, then records that are modified after `01/12/2022 11:40:00` or above only are retrieved from Salesforce. Even if there are records retrieved already, Liferay’s import strategy updates them if needed and inserts only new records. 
```

### Products Reference

| Context Parameter              | Description                                                                                      | Default Value               |
| :----------------------------- | :----------------------------------------------------------------------------------------------- | :-------------------------- |
| `catalogName`                  | Name of the catalog used to store Salesforce data                                                | `Salesforce`                |
| `catalogExternalReferenceCode` | External reference code used when creating or fetching the catalog; must be `SALESFORCE`         | `SALESFORCE`                |
| `catalogDefaultCurrency`       | Default currency used for the catalog                                                            | `USD`                       |
| `catalogDefaultLanguage`       | Default language used for the catalog                                                            | `en_US`                     |
| `catalogId`                    | ID of the catalog used to store Salesforce data                                                  | Determined during execution |
| `allowBackOrder`               | Boolean value that determines if a product supports back orders when stock runs out              | `true`                      |
| `displayAvailability`          | Boolean value that determines if a product displays its availability on the product details page | `false`                     |
| `productType`                  | Product type used when creating all products                                                     | `simple`                    |
| `freeShipping`                 | Boolean value that determines if a product supports free shipping or not                         | `false`                     |
| `shippable`                    | Boolean value that determines if a product is shippable or not                                   | `true`                      |
| `shippingSeparately`           | Boolean value that determines if a product supports separate shipping or not                     | `true`                      |

### Price List Reference

| Context Parameter | Description                                                                              | Default Value |
| :---------------- | :--------------------------------------------------------------------------------------- | :------------ |
| `catalogId`       | ID of the catalog to associate the price list with                                       | `0`           |
| `currencyCode`    | Default currency code used for the price list                                            | `USD`         |
| `neverExpire`     | Boolean to determine if the price list expires or not                                    | `true`        |
| `priority`        | Determines the priority of the price list when there are multiple applicable price lists | `0`           |
| `hasTierPrice`    | Boolean to determine if the price list contains tiered prices                            | `false`       |
| `standardPrice`   | Boolean to determine if the price list contains standard prices                          | `false`       |

### Accounts Reference

| Context Parameter     | Description                                                                                                                                                 | Default Value |
| :-------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------ |
| `accountType`         | The account type used when creating all accounts: 1 (personal) or 2 (business)                                                                              | `2`           |
| `countryMapping_null` | The country mapping used for account addresses. It must use the following syntax `countryMapping_NAME=COUNTRY_ISO_CODE` (e.g., `countryMapping_Croatia=HR`) |               |
| `regionMapping_null`  | The region mapping used for account addresses. It must use the following syntax `regionMapping_NAME=REGION_ISO_CODE` (e.g., `regionMapping_Milan=MI`)       |               |

### Orders Reference

| Context Parameter           | Description                                                                                                                                                                              | Default Value                                                                                                                                                                                                                  |
| :-------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `channelId`                 | ID of the channel to import orders to                                                                                                                                                    | Copy the channel ID from the UI. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and go to *Commerce* &rarr; *Channels*. Select the desired channel and copy the ID present next to the name. |
| `defaultCurrency`           | Default currency used for the order                                                                                                                                                      | `USD`                                                                                                                                                                                                                          |
| `statusMapping_null`        | The status mapping used for order statuses. It must use the following syntax: `statusMapping_SalesforceStatusName=LiferayStatusCode (e.g., statusMapping_Activated=5)`                   | `5`                                                                                                                                                                                                                            |
| `paymentStatusMapping_null` | The status mapping used for order payment statuses. It must use the following syntax: `paymentStatusMapping_SalesforceStatusName=LiferayStatusCode (e.g., paymentStatusMapping_Payed=2)` | `2`                                                                                                                                                                                                                            |

```{warning}
Note that some of the default values act as placeholders. Running the job with these defaults may lead to failure. Please use the correct values to ensure successful import.
```

## Running Each Talend Dispatch Task

Once configured, you can run each task manually by clicking *Run Now*, or schedule them to run automatically. See [Using Job Scheduler](https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler.html) for more information.

```{important}
Running these Talend Dispatch Tasks can be resource intensive and degrade platform performance. To reduce performance impact, avoid running them during peak use hours.
```