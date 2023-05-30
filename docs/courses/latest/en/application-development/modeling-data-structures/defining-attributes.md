# Defining Attributes

Attributes are specific pieces of information you want to store for entities, such as text and numeric values. With Liferay, this involves adding [data fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) to an object definition and creating [picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists) for use as object fields. <!--REFINE-->

<!-- Diagram? -->

Delectable Bonsai needs to collect business information for verifying each applicant's identity and credit. These details are necessary for Know Your Customer (KYC) best practice and compliance with Anti-Money Laundering (AML) laws. Additionally, they want to collect information that can help them assess the relative value of each prospective distributor. For example, if the company is working to reach a specific region, they can give applications from that region higher priority.

To do this, first [create picklists](#adding-picklists-for-the-distributor-application-object) and then [add fields](#adding-fields-to-the-distributor-application-object) to the Distributor Application object.

<!-- Separate article? -->

## Adding Picklists for the Distributor Application Object

With Liferay picklists, you can define lists of string values that you can use for single-select and multiselect fields. Delectable Bonsai needs these picklists for their Distributor Application:

* Business Types
* Distribution Regions
* Distribution Channels
* Order Types
* Product Types
* Annual Purchase Volumes
* Product Labels

![Create these picklists for use in the Distributor Application object.](./defining-attributes/images/02.png)

The following steps first cover how to create the Business Types list via the Liferay UI. Then, they cover how to create the remaining picklists using the `headless-admin-list-type` REST APIs. <!--REFINE-->

```{tip}
Using Picklist APIs, you can add lists and items with pre-configured ERCs and localized names in one step. If you're working with multiple lists, this method is far more efficient than manually creating lists through the UI.
```

### Creating Picklists via the Picklists UI

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Picklists*.

1. Click the *Add* button ( ![Add Button](../../images/icon-add.png) ).

1. For name, enter Business Types.

1. Click *Save*.

1. Begin editing the picklist.

1. Click the *Add* button ( ![Add Button](../../images/icon-add.png) ) to add these items to the picklist:

   | Name                 | Key                   |
   |:---------------------|:----------------------|
   | Independent Business | `independentBusiness` |
   | Franchise            | `franchise`           |
   | Other                | `other`               |

1. Edit each item and set their ERCs to these values:

   | External Reference Code              |
   |:-------------------------------------|
   | `BUSINESS_TYPE_INDEPENDENT_BUSINESS` |
   | `BUSINESS_TYPE_FRANCHISE`            |
   | `BUSINESS_TYPE_OTHER`                |

   ![Add three items to the picklist and update their ERCs.](./defining-attributes/images/03.png)

1. Change the Picklist's ERC to `LIST_BUSINESS_TYPES`.

   ![Update the picklist's ERC.](./defining-attributes/images/04.png)

1. Click *Save*.

You can now use the picklist to create a single-select or multi-select field in the Distributor Application object.

### Creating Picklists via REST APIs

1. Download and unzip the resources for [Defining Attributes](./liferay-p6k3.zip).

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/defining-attributes/liferay-p6k3.zip -O
   ```

   ```bash
   unzip liferay-p6k3.zip
   ```

   This ZIP file includes shell scripts for creating the remaining picklists using the `headless-admin-list-type` REST APIs.

   Each POST command uses the following schema for creating lists with their items:

   ```json
   {
     "externalReferenceCode": "[LIST_ERC]",
     "listTypeEntries": [
       {
         "externalReferenceCode": "[ITEM_ERC]",
         "key": "[itemKey]",
         "name": "[Item Name]",
         "name_i18n": {
           "en-US": "[Localized English Item Name]"
           },
         "type": ""
       }
     ],
     "name": "[List Name]",
     "name_i18n": {
       "en-US": "[Localized English List Name]"
     }
   }
   ```

1. Navigate to the `curl` folder in the `liferay-p6k3` folder.

   ```bash
   cd liferay-p6k3/curl
   ```

1. Run this script to create the Distribution Regions picklist:

   ```bash
   ./ListTypeDefinition_POST_DistributionRegions_ToInstance.sh
   ```

   **Picklist**

   | Name                 | External Reference Code     |
   |:---------------------|:----------------------------|
   | Distribution Regions | `LIST_DISTRIBUTION_REGIONS` |

   **Picklist Items**

   | Name               | Key              | External Reference Code   |
   |:-------------------|:-----------------|:--------------------------|
   | Latin America      | `latinAmerica`   | `REGION_LATIN_AMERICA`    |
   | Caribbean          | `caribbean`      | `REGION_CARIBBEAN`        |
   | Eastern Europe     | `easternEurope`  | `REGION_EASTERN_EUROPE`   |
   | Western Europe     | `westernEurope`  | `REGION_WESTERN_EUROPE`   |
   | Middle East        | `middleEast`     | `REGION_MIDDLE_EAST`      |
   | Africa             | `africa`         | `REGION_AFRICA`           |
   | Central Asia       | `centralAsia`    | `REGION_CENTRAL_ASIA`     |
   | Asia & Pacific Rim | `asiaPacificRim` | `REGION_ASIA_PACIFIC_RIM` |
   | India              | `india`          | `REGION_INDIA`            |
   | North America      | `northAmerica`   | `REGION_NORTH_AMERICA`    |

1. Run this script to create the Distribution Channels picklist:

   ```bash
   ./ListTypeDefinition_POST_DistributionChannels_ToInstance.sh
   ```

   **Picklist**

   | Name                  | External Reference Code      |
   |:----------------------|:-----------------------------|
   | Distribution Channels | `LIST_DISTRIBUTION_CHANNELS` |

   **Picklist Items**

   | Name                          | Key              | External Reference Code   |
   |:------------------------------|:-----------------|:--------------------------|
   | Distribute to Other Retailers | `otherRetailers` | `CHANNEL_OTHER_RETAILERS` |
   | Sell Through Own Retail       | `ownRetail`      | `CHANNEL_OWN_RETAIL`      |
   | E-Commerce                    | `eCommerce`      | `CHANNEL_E_COMMERCE`      |

1. Run this script to create the Order Types picklist:

   ```bash
   ./ListTypeDefinition_POST_OrderTypes_ToInstance.sh
   ```

   **Picklist**

   | Name        | External Reference Code |
   |:------------|:------------------------|
   | Order Types | `LIST_ORDER_TYPES`      |

   **Picklist Items**

   | Name             | Key               | External Reference Code       |
   |:-----------------|:------------------|:------------------------------|
   | Wholesale        | `wholesale`       | `ORDER_TYPE_WHOLESALE`        |
   | Private Labeling | `privateLabeling` | `ORDER_TYPE_PRIVATE_LABELING` |
   | Bulk Formats     | `bulkFormats`     | `ORDER_TYPE_BULK_FORMATS`     |
   | Not Sure         | `notSure`         | `ORDER_TYPE_NOT_SURE`         |

1. Run this script to create the Product Types picklist:

   ```bash
   ./ListTypeDefinition_POST_ProductTypes_ToInstance.sh
   ```

   **Picklist**

   | Name          | External Reference Code |
   |:--------------|:------------------------|
   | Product Types | `LIST_PRODUCT_TYPES`    |

   **Picklist Items**

   | Name                | Key                  | External Reference Code            |
   |:--------------------|:---------------------|:-----------------------------------|
   | Maple Syrup         | `mapleSyrup`         | `PRODUCT_TYPE_MAPLE_SYRUP`         |
   | Organic Maple Syrup | `organicMapleSyrup`  | `PRODUCT_TYPE_ORGANIC_MAPLE_SYRUP` |
   | Maple Butter        | `mapleButter`        | `PRODUCT_TYPE_MAPLE_BUTTER`        |
   | Maple Sugar         | `mapleSugar`         | `PRODUCT_TYPE_MAPLE_SUGAR`         |
   | Maple Fondant       | `mapleFondant`       | `PRODUCT_TYPE_MAPLE_FONDANT`       |
   | Maple Jelly         | `mapleJelly`         | `PRODUCT_TYPE_MAPLE_JELLY`         |
   | Trees               | `trees`              | `PRODUCT_TYPE_TREES`               |
   | Saplings            | `saplings`           | `PRODUCT_TYPE_SAPLINGS`            |
   | Educational Content | `educationalContent` | `PRODUCT_TYPE_EDUCATIONAL_CONTENT` |
   | Other               | `other`              | `PRODUCT_TYPE_OTHER`               |

1. Run this script to create the Annual Purchase Volumes picklist:

   ```bash
   ./ListTypeDefinition_POST_AnnualPurchaseVolumes_ToInstance.sh
   ```

   **Picklist**

   | Name                    | External Reference Code        |
   |:------------------------|:-------------------------------|
   | Annual Purchase Volumes | `LIST_ANNUAL_PURCHASE_VOLUMES` |

   **Picklist Items**

   | Name                   | Key          | External Reference Code |
   |:-----------------------|:-------------|:------------------------|
   | $50,000 - 100,000 USD  | `firstTier`  | `VOLUME_FIRST_TIER`     |
   | $200,000 - 500,000 USD | `secondTier` | `VOLUME_SECOND_TIER`    |
   | $500,000 - 1M USD      | `thirdTier`  | `VOLUME_THIRD_TIER`     |
   | $1M+ USD               | `fourthTier` | `VOLUME_FOURTH_TIER`    |

1. Run this script to create the Product Labels picklist:

   ```bash
   ./ListTypeDefinition_POST_ProductLabels_ToInstance.sh
   ```

   **Picklist**

   | Name           | External Reference Code |
   |:---------------|:------------------------|
   | Product Labels | `LIST_PRODUCT_LABELS`   |

   **Picklist Items**

   | Name        | Key          | External Reference Code |
   |:------------|:-------------|:------------------------|
   | Standard US | `standardUS` | `LABEL_STANDARD_US`     |
   | Localized   | `localized`  | `LABEL_LOCALIZED`       |

You can now use these picklists to create single-select and multi-select fields in the Distributor Application object.

<!-- Separate article? -->

## Adding Fields to the Distributor Application Object

With Object [data fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields), you can store and manage specific types of information in your application. <!-- Fields are data definitions that represent database columns and store different [types of values](#field-types-ui-reference). --> Delectable Bonsai needs fields for collecting applicant, contact, business, bank, and reference information.

The following steps first cover how to add fields via the Liferay UI. Then, they cover how to create the remaining fields using the `object-admin` REST APIs.

<!-- After adding a field, you can access additional configuration options. For example, by default all fields are searchable by __, but you can __ .-->

<!-- TASK: Change mandatory values to false. This will help with subsequent steps in the tutorial. Also, users can set a field to mandatory for form fragments. -->

### Adding Fields via the Objects UI

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the Distributor Application object and go to the *Fields* tab.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)), enter these details, and click *Save*:

   | Field                     | Value            |
   |:--------------------------|:-----------------|
   | Label                     | Applicant Email  |
   | Field Name                | `applicantEmail` |
   | Type                      | Text             |
   | Mandatory                 | True             |
   | Accept Unique Values Only | True             |

1. Add an Application Date field:

   | Field      | Value             |
   |:-----------|:------------------|
   | Label      | Application Date  |
   | Field Name | `applicationDate` |
   | Type       | Date              |
   | Mandatory  | True              |

1. Add a Distribution Regions field:

   | Field      | Value                 |
   |:-----------|:----------------------|
   | Label      | Distribution Regions  |
   | Field Name | `distributionRegions` |
   | Type       | Multiselect Picklist  |
   | Picklist   | Distribution Regions  |
   | Mandatory  | True                  |

1. Add a Products of Interest field:

   | Field      | Value                |
   |:-----------|:---------------------|
   | Label      | Products of Interest |
   | Field Name | `productsOfInterest` |
   | Type       | Multiselect Picklist |
   | Picklist   | Product Types        |
   | Mandatory  | True                 |

1. Add an Order Types of Interest field:

   | Field      | Value                   |
   |:-----------|:------------------------|
   | Label      | Order Types of Interest |
   | Field Name | `orderTypesOfInterest`  |
   | Type       | Multiselect Picklist    |
   | Picklist   | Order Types             |
   | Mandatory  | True                    |

1. Add a Product Labeling field:

   | Field         | Value             |
   |:--------------|:------------------|
   | Label         | Product Labeling  |
   | Field Name    | `productLabeling` |
   | Type          | Picklist          |
   | Picklist      | Product Labels    |
   | Mandatory     | False             |
   | Mark as State | False             |

1. Add an Estimated Annual Purchase Volume field:

   | Field         | Value                            |
   |:--------------|:---------------------------------|
   | Label         | Estimated Annual Purchase Volume |
   | Field Name    | `estimatedAnnualPurchaseVolume`  |
   | Type          | Picklist                         |
   | Picklist      | Annual Purchase Volumes          |
   | Mandatory     | False                            |
   | Mark as State | False                            |

1. Add a Comments field:

   | Field      | Value      |
   |:-----------|:-----------|
   | Label      | Comments   |
   | Field Name | `comments` |
   | Type       | Long Text  |
   | Mandatory  | False      |

Each saved field is immediately added to the published object. If you navigate to the Distributor Application, you can begin adding entries that include these fields. When you do, the fields are organized alphabetically.

![Add new entries that include the new fields.](./defining-attributes/images/05.png)

The default table in the object's application page also includes the new fields.

![The default table view includes all custom fields.](./defining-attributes/images/06.png)

Delectable Bonsai can use these fields to collect general details for assessing the value of each applicant. However, they need to collect additional information to follow KYC policies and comply with AML laws. To add these fields, use the `object-admin` REST APIs.

### Adding Fields via REST APIs

1. Navigate to the `liferay-p6k3/curl` folder. The provided ZIP includes shell scripts for creating the remaining fields.

   Each script includes multiple curl commands that call the `object-admin` service using the POST method. <!--TASK: See [Using REST APIs to Add Fields to Object Definitions]() for more information on the schema for each field type.-->

1. Run this script to create fields for storing contact information:

   ```bash
   ./ObjectField_POST_ContactInformation_ByExternalReferenceCode.sh
   ```

   | Field Name                  | Type    |
   |:----------------------------|:--------|
   | `primaryContactName`        | Text    |
   | `primaryContactTitle`       | Text    |
   | `primaryContactEmail`       | Text    |
   | `primaryContactPhoneNumber` | Integer |

1. Run this script to create fields for storing business information:

   ```bash
   ./ObjectField_POST_BusinessDetails_ByExternalReferenceCode.sh
   ```

   | Field Name                     | Type                 |
   |:-------------------------------|:---------------------|
   | `businessName`                 | Text                 |
   | `businessWebsite`              | Text                 |
   | `businessType`                 | Picklist             |
   | `businessEstablishedDate`      | Date                 |
   | `businessEmployeeNumber`       | Integer              |
   | `businessAnnualRevenue`        | Precision Decimal    |
   | `businessDistributionChannels` | Multiselect Picklist |
   | `businessOtherBrandsOffered`   | Long Text            |
   | `businessPhoneNumber`          | Integer              |
   | `businessAddressLineOne`       | Text                 |
   | `businessAddressLineTwo`       | Text                 |
   | `businessCity`                 | Text                 |
   | `businessStateProvinceRegion`  | Text                 |
   | `businessZipPostalCode`        | Integer              |
   | `businessCountry`              | Text                 |
   | `businessLicenseNumber`        | Integer              |
   | `businessResaleNumber`         | Integer              |
   | `businessTaxIDNumber`          | Integer              |
   | `businessLicense`              | Attachment           |
   | `businessProofOfInsurance`     | Attachment           |

1. Run this script to create fields for storing the business's bank details:

   ```bash
   ./ObjectField_POST_BankDetails_ByExternalReferenceCode.sh
   ```

   | Field Name                | Type    |
   |:--------------------------|:--------|
   | `bankName`                | Text    |
   | `bankAccountNumber`       | Text    |
   | `bankPhoneNumber`         | Integer |
   | `bankAddressLineOne`      | Text    |
   | `bankAddressLineTwo`      | Text    |
   | `bankCity`                | Text    |
   | `bankStateProvinceRegion` | Text    |
   | `bankZIPPostalCode`       | Integer |
   | `bankCountry`             | Text    |

1. Run this script to create fields for receiving business reference details:

   ```bash
   ./ObjectField_POST_BusinessReference_ByExternalReferenceCode.sh
   ```

   | Field Name                     | Type    |
   |:-------------------------------|:--------|
   | `referenceSupplierName`        | Text    |
   | `referencePhoneNumber`         | Integer |
   | `referenceAddressLineOne`      | Text    |
   | `referenceAddressLineTwo`      | Text    |
   | `referenceCity`                | Text    |
   | `referenceStateProvinceRegion` | Text    |
   | `referenceZIPPostalCode`       | Integer |
   | `referenceCountry`             | Text    |

Once finished, the Distributor Application object should have 56 fields. These fields can help Delectable Bonsai collect the data they need for evaluating and vetting each applicant in compliance with KYC policies and AML laws.

![The Distributor Application object should have 56 fields.](./defining-attributes/images/07.png)

Presently, none of the fields include validations to ensure the integrity of application data. Furthermore, with over 50 fields, the default view and layout are no longer viable UIs for creating and displaying application entries. The second and third modules of this course will address these issues. But first, we must explore the concept of relationships when modeling data structures.

Next: [Defining Relationships](./defining-relationships.md)

## Relevant Concepts

* [Picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists)
* [Fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields)
