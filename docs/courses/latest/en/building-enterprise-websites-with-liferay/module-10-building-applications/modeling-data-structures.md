---
uuid: 3cc6f0a9-a820-42f1-94ca-9227c53c98ed
---
# Modeling Data Structures

Your first step in building an application is to model its data structures by considering the types of data entities you want to store and manipulate, the attributes of each entity type, and the relationships between different entity types. All of this functionality is captured by [Liferay Objects](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects), which are the foundation of low code applications in Liferay.

From the time of creation, all objects are fully integrated with Liferay's core frameworks to provide a unified experience across the platform and leverage all of its capabilities. This article discusses the features of Liferay objects in the context of Clarity's distributor application solution.

<!--IMAGE: Diagram showing how Objects fit into the Liferay ecosystem and integrate with the various core frameworks -- headless APIs, Job Scheduler, Workflows, Forms, etc. -->

## Identifying Data Entities

You can create *object definitions* that represent types of data entities. Object definitions include a standard set of system fields along with configuration options for modifying their general details, behavior, scope/permissions, and available features. When an object definition is published, Liferay creates a database table for storing entries of that object.

!!! note "Object Definition vs. Object Entry"
    An object definition specifies a type of data entity, while an object entry is an individual instance of that data entity. A single object definition can (and often does) have multiple object entries in its corresponding database table.

![Object entries are individual instances of an object definition.](./modeling-data-structures/images/01.png)

Liferay also generates headless REST APIs for CRUD operations and provides a basic user interface for objects upon publication.

Clarity must store and manage two types of data entities for the distributor application flow:

* Distributor Applications
* Application Evaluations

Once you determine the types of entities required in your application, you can add relevant attributes to them.

## Adding Attributes

Attributes represent database columns that store specific types of information for an application, such as text, numeric values, or file attachments. You can define attributes for the data structures in your application by adding fields to the corresponding object definitions. Fields are populated by user input when an object entry is created. In addition to standard fields, you can also add picklists as object attributes to provide users with predefined single-select and multi-select fields. Fields and picklists can be added via the UI or REST APIs.

![An object definition can have multiple fields to store information according to its type.](./modeling-data-structures/images/02.png)

For Clarity's use case, each distributor application should store the necessary business information for verifying each applicant's identity and credit for Know Your Customer (KYC) best practices and compliance with Anti-Money Laundering (AML) laws. As such, the Distributor Application object contains fields for the applicant's name, title, email, and phone number, along with a *Comments* field for the applicant to write a message.

Additionally, Clarity must collect information that can help them assess the relative value of each prospective distributor. In this case, they want applicants to select from predefined options, so they have added the following picklists to the Distributor Application object definition:

* Business Types
* Distribution Regions
* Distribution Channels
* Order Types
* Product Types
* Annual Purchase Volumes
* Product Labels

The second object Clarity needs for this use case is the Application Evaluation. This object should store notes and recommendations made during the distributor application review process. The Application Evaluation object definition contains the following custom fields:

* Business Name (text)
* Assessment Score (picklist)
* Attachment (file)
* Decision (picklist)
* Interview Notes (text)
* Recommendations (picklist)
* Recommendation Comments (text)

![Both the Distributor Application and Application Evaluation objects store data related to the applicant.](./modeling-data-structures/images/03.png)

### Exercise 1

The Distributor Application object contains a great number of custom fields for collecting business information in compliance with KYC and AML policies, but Clarity still needs one that can be used by the applicant to describe other brands that they offer. Let's add that field to the object.

1. Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Objects*, then select *Distributor Application*.

1. Go to the *Fields* tab.

1. Click *Add* (![Add Button](../../images/icon-add.png)) to create a new custom field, enter these values, and click Save:

   | Field                    | Value                        |
   |:-------------------------|:-----------------------------|
   | Label                    | Other Brands Offered         |
   | Field Name               | `businessOtherBrandsOffered` |
   | Type                     | Long Text                    |
   | Enable Entry Translation | False                        |
   | Mandatory                | False                        |

   ![Clicking Add opens a panel to create a new custom field.](./modeling-data-structures/images/04.png)

Each saved field is added immediately to the object and automatically appears in its default layout when creating entries. However, the Distributor Application object has a custom layout and will need to be modified to include the new custom field.

1. Navigate to the *Layouts* tab and click on *Main Layout*.

1. Go to *Layout*.

1. Find the Business Details block under the Application tab, then click *Add Field*.

   ![The Business Details can be found under the Application tab.](./modeling-data-structures/images/05.png)

1. Select *Other Brands Offered* as an option, choose the single column box for the field size, and click *Save*.

   ![Clicking Add Field opens a panel to include a field to the block.](./modeling-data-structures/images/06.png)

Now the new field will display in the form layout when you create an entry.

### Exercise 2

As mentioned previously, Clarity uses picklists to create predefined options for the applicants to choose from. The Product Types picklist, which should offer a selection of different categories for eyewear, is currently missing its configurations. Let's jump in and fix the picklist.

1. Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Picklists*, then select *Product Types*.

1. Click *Add* (![Add Button](../../images/icon-add.png)) and create these items in the picklist:

   | Name       | Key        |
   |:-----------|:-----------|
   | Eyeglasses | eyeglasses |
   | Sunglasses | sunglasses |
   | Lenses     | lenses     |
   | Contacts   | contacts   |
   | Other      | other      |

1. Edit each item and set their ERCs to these values:

   | Name       | External Reference Code |
   |:-----------|:------------------------|
   | Eyeglasses | PRODUCT_TYPE_EYEGLASSES |
   | Sunglasses | PRODUCT_TYPE_SUNGLASSES |
   | Lenses     | PRODUCT_TYPE_LENSES     |
   | Contacts   | PRODUCT_TYPE_CONTACTS   |
   | Other      | PRODUCT_TYPE_OTHER      |

   ![All picklists should appear after adding them.](./modeling-data-structures/images/07.png)

1. Click *Save*.

Once saved, the Distributor Application's `Products of Interest` custom field is automatically updated with the new values, since it's related to this picklist. Applicants are now able to select their desired products.

## Defining Relationships

Defining relationships is key to creating data models that accurately represent real-world entities. Object relationships determine how data is connected in your application and capture entity interactions and dependencies. You can define one-to-many and many-to-many relationships between object definitions. These relationships add fields or tables to each object for relating their entries, enabling you to access entry data in different object contexts.

For Clarity's distributor application flow, users must be able to relate each evaluation to an application and each application to multiple evaluations. To do this, they have added a one-to-many relationship to the Distributor Application object definition and specified Application Evaluation as the relatable object.

![A single Distributor Application entry is related to many Application Evaluation entities.](./modeling-data-structures/images/08.png)

Once the relationship has been added between the object definitions, you can relate individual object entries to one another through either the Liferay UI or relationship REST APIs. See the previous article's [bonus exercise](./deploying-the-application.md#bonus-exercise) for a hands-on example.

Now that you've learned about the process of modeling data structures with Liferay Objects, let's move on to [Implementing Business Logic](./implementing-business-logic.md).

## Additional Resources

* [Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects)
* [Picklists](https://learn.liferay.com/w/dxp/building-applications/objects/picklists)
* [Creating and Managing Objects](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects)
* [Object Fields](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/fields)
* [Object Relationships](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/relationships)