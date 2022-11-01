# Liferay Connector to Salesforce

{bdg-primary}`Subscription`

{bdg-secondary}`Available Liferay DXP 7.4 U46+`

You can use Liferay's connector to Salesforce to import data from Salesforce to Liferay DXP. It uses Talend job designs and Liferay's Job Scheduler under the hood.

You can [download]() the Salesforce Connector to a Liferay instance as an `.lpkg` file. This file contains multiple Talend jobs that map data fields in Liferay to data fields in Salesforce. Once deployed, Job Scheduler tasks are automatically created for each Talend job. You can then configure and run them manually via the Job Scheduler UI, or schedule to run them at specific time intervals.

## Supported Entities

The following chart lists supported Salesforce entities with their Liferay counterparts. Currently, you can only import Salesforce data to Liferay.

| Salesforce       | Liferay     | From Salesforce to Liferay |
| :--------------- | :---------- | :------------------------- |
| Account          | Account     | &#10004;                   |
| Account Address  | Account     | &#10004;                   |
| Account Contact  | User        | &#10004;                   |
| Price Book       | Price List  | &#10004;                   |
| Price Book Entry | Price Entry | &#10004;                   |
| Product          | Product     | &#10004;                   |
| Order            | Order       | &#10004;                   |
| OrderItem        | Order Item  | &#10004;                   |
| OrderNote        | Order Note  | &#10004;                   |

```{note}
There is no equivalent entity for Liferay's product catalogs in Salesforce. When importing Salesforce products to Liferay, you must have a catalog with `externalReferenceCode` as `SALESFORCE`. If it does not exist, Liferay automatically creates this during the `Products` task execution. This catalog is then used to store the imported products.
```

## Deploying the Connector

Follow these steps to deploy the Salesforce connector to a Liferay DXP instance:

1. Download the *Commerce Connector to Salesforce* from the [Liferay Help Center](http://customer.liferay.com/downloads).

1. Copy the `.lpkg` file to the DXP instance's [`${liferay.home}/deploy`](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/liferay-home.html) folder.

1. Verify the following message displays in the server console:

   ```bash
   Processing Liferay Connector to Salesforce 1.0.0.lpkg
   The portal instance needs to be restarted to complete the installation of file:/Users/able/bundles/osgi/marketplace/Liferay%20Connector%20to%20Salesforce%20-%20Impl.lpkg
   ```

1. Restart your Liferay DXP instance.

1. Once the server finishes restarting, confirm the deployment was successful by going to the *Job Scheduler* page in the Control Panel.

   If successful, you should see four new Job Scheduler tasks added.

   ![Verify the addition of four new Job Scheduler tasks.](./liferay-connector-to-salesforce/images/01.png)

   Before running these tasks, you must configure their context parameters.

## Configuring the Job Scheduler Tasks

When created, the settings editor for each Talend Dispatch Task is automatically populated with default context parameters. These parameters can be used to provide necessary credentials and to modify each task's behavior in runtime.

```{warning}
Be careful when removing parameters from the settings editor. If you leave a key with a blank value, it will disappear when the settings are saved. If the keys and their values are lost, they cannot be restored, and you'll have to recreate the Talend Dispatch Task.
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

### Products Reference

| Context Parameter              | Description                                                                                          | Default Value |
| :----------------------------- | :--------------------------------------------------------------------------------------------------- | :------------ |
| `catalogName`                  | The name of the Catalog used to store Salesforce data                                                | `Salesforce`  |
| `catalogExternalReferenceCode` | The external reference code used when creating or fetching the catalog; must be `SALESFORCE`         | `SALESFORCE`  |
| `catalogDefaultCurrency`       | The default currency used for the Catalog                                                            | `USD`         |
| `catalogDefaultLanguage`       | The default language used for the Catalog                                                            | `en_US`       |
| `catalogId`                    | The ID of the Catalog used to store Salesforce data                                                  |               |
| `allowBackOrder`               | The boolean value that determines if a product supports back orders when stock is                    |               |
| `displayAvailability`          | The boolean value that determines if a product displays its availability in the Product Details page |               |
| `productType`                  | The product type used when creating all products                                                     | `simple`      |
| `freeShipping`                 | The boolean value that determines if a product supports free shipping or not                         | `false`       |
| `shippable`                    | The boolean value that determines if a product is shippable or not                                   |               |
| `shippingSeparately`           | The boolean value that determines if a product supports separate shipping or not                     |               |

### Price List Reference

| Context Parameter | Description | Default Value |
| :---------------- | :---------- | :------------ |
| `catalogId`       |             |               |
| `currencyCode`    |             |               |
| `neverExpire`     |             |               |
| `priority`        |             |               |
| `hasTierPrice`    |             |               |
| `standardPrice`   |             |               |

### Accounts Reference

| Context Parameter     | Description                                                                                                                                              | Default Value |
| :-------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------ |
| `accountType`         | The account type used when creating all accounts: 1 (personal) or 2 (business)                                                                           |               |
| `countryMapping_null` | The country mapping used for Account addresses, must use the following syntax `countryMapping_NAME=COUNTRY_ISO_CODE` (e.g., `countryMapping_Croatia=HR`) |               |
| `regionMapping_null`  | The region mapping used for Account addresses; must use the following syntax `regionMapping_NAME=REGION_ISO_CODE` (e.g., `regionMapping_Milan=MI`)       |               |

### Orders Reference

| Context Parameter            | Description | Default Value |
| :--------------------------- | :---------- | :------------ |
| `channelId`                  |             |               |
| `defaultCurrency`            |             |               |
| `statusMapping_Activated`    |             |               |
| `paymentStatusMapping_Payed` |             |               |

## Running Each Talend Dispatch Task

Once configured, you can run each task manually by clicking *Run Now*, or schedule them to run automatically. See [Using Job Scheduler]() for more information.

```{important}
Running these Talend Dispatch Tasks can be resource intensive and degrade platform performance. To reduce performance impact, avoid running them during peak use hours.
```

## Additional Information -->
