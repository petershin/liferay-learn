# Adding Picklist Fields to the Object

Adding picklist fields to an object follows the same process as other types of fields, though they include some additional configuration options.

1. Open the *Global Menu* ( ![Global Menu](../../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the Distributor Application object and go to the *Fields* tab.

1. Click *Add* (![Add Button](../../../images/icon-add.png)), enter these details, and click *Save*:

   | Field      | Value                 |
   |:-----------|:----------------------|
   | Label      | Distribution Regions  |
   | Field Name | `distributionRegions` |
   | Type       | Multiselect Picklist  |
   | Picklist   | Distribution Regions  |
   | Mandatory  | False                 |

   ![]()

1. Add a Products of Interest field:

   | Field      | Value                |
   |:-----------|:---------------------|
   | Label      | Products of Interest |
   | Field Name | `productsOfInterest` |
   | Type       | Multiselect Picklist |
   | Picklist   | Product Types        |
   | Mandatory  | False                |

1. Add an Order Types of Interest field:

   | Field      | Value                   |
   |:-----------|:------------------------|
   | Label      | Order Types of Interest |
   | Field Name | `orderTypesOfInterest`  |
   | Type       | Multiselect Picklist    |
   | Picklist   | Order Types             |
   | Mandatory  | False                   |

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

1. Add a Business Type field:

   | Field         | Value          |
   |:--------------|:---------------|
   | Label         | Business Type  |
   | Field Name    | `businessType` |
   | Type          | Picklist       |
   | Picklist      | Business Types |
   | Mandatory     | False          |
   | Mark as State | False          |

1. Add a Business Distribution Channels field:

   | Field         | Value                          |
   |:--------------|:-------------------------------|
   | Label         | Distribution Channels          |
   | Field Name    | `businessDistributionChannels` |
   | Type          | Multiselect Picklist           |
   | Picklist      | Distribution Channels          |
   | Mandatory     | False                          |
   | Mark as State | False                          |

Now when users fill out a distributor application form, they can use these fields to select from values predefined in the selected picklists.

![]()

Next: [Adding a Basic Layout and View](./adding-a-basic-layout-and-view.md)
