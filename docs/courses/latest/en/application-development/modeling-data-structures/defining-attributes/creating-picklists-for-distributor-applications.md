# Creating Picklists for Distributor Applications

Liferay picklists are predefined lists of string values that you can use with objects to determine available options for single-select and multiselect fields. Delectable Bonsai needs these lists for the Distributor Application object:

* Business Types
* Distribution Regions
* Distribution Channels
* Order Types
* Product Types
* Annual Purchase Volumes
* Product Labels

![Create these picklists for use in the Distributor Application object.](./creating-picklists-for-distributor-applications/images/01.png)

To begin,

1. Open the *Global Menu* ( ![Global Menu](../../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Picklists*.

1. Click *Add* ( ![Add Button](../../../images/icon-add.png) ), enter Business Types for name, and click *Save*.

1. Begin editing the picklist.

1. Click *Add* ( ![Add Button](../../../images/icon-add.png) ) to add these items to the picklist:

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

   ![Add three items to the picklist and update their ERCs.](./creating-picklists-for-distributor-applications/images/02.png)

1. Change the Picklist's ERC to `LIST_BUSINESS_TYPES`.

   ![Update the picklist's ERC.](./creating-picklists-for-distributor-applications/images/03.png)

1. Click *Save*.

Once saved, you can use this picklist as a field in the Distributor application object.

Before you do that, Delectable Bonsai needs six more picklists. But instead of creating these lists manually, you'll create them programmatically using the `headless-admin-list-type` REST APIs.

Next: [Creating Picklists Using REST APIs](./creating-picklists-using-rest-apis.md)

## Relevant Concepts

* [Picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists)
