---
uuid: 3cc6f0a9-a820-42f1-94ca-9227c53c98ed
---
# Modeling Data Structures

<!--TASK: Fix image numbering-->

The first step in building an application is to model its data structures. This requires some brainstorming about the types of data entities you want to store, as well as their attributes and relationships. This is accomplished using [Liferay Objects](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects), which is the foundation of Liferay's low-code application development. With it, you can define database tables, implement business logic, integrate with external services, and more, all without writing code.

When created, each object is fully integrated with Liferay's core frameworks, providing a unified experience across the platform and enabling you to leverage Liferay's out-of-the-box capabilities. This means developers can leverage Liferay's built-in functionalities like workflows, notifications, permissions, Headless APIs, and data mapping without the need for additional coding. This significantly reduces development time and effort, allowing them to focus on building unique application features and functionalities.

<!--[TODO: Update with Design ticket] IMAGE: Diagram showing how Objects fit into the Liferay ecosystem and integrate with the various core frameworks -- headless APIs, Job Scheduler, Workflows, Forms, etc. -->

Now let's see how Clarity can leverage these capabilities in their distributor onboarding solution. The first step is to identify the types of data entities required for their solution.

## Identifying Data Entities

Clarity must store and manage two types of data entities for their distributor onboarding flow:

* Applications submitted by prospective distributors (Distributor Applications)
* Internal evaluations of these applications (Application Evaluations)

You can model each of these data entities as *object definitions*. An object definition is essentially a blueprint. It defines the structure and properties of the data stored by your solution. Each definition includes a standard set of system fields along with configuration options for modifying their general details, behavior, data scope, and available features. When published, Liferay creates a database table for storing the definition's *entries*.

!!! note "Object Definition vs. Object Entry"
    Object definitions specify types of data entities, while object entries are instances of those data entities.

![Object entries are individual instances of an object definition.](./modeling-data-structures/images/01.png)

After determining the types of entities required for their solution, Clarity can start adding their attributes.

## Adding Attributes

Attributes represent database columns storing specific data types for object definitions (e.g., text, numbers, and files). You define attributes by adding [fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) to an object. Additionally, you can create [picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists) and use them with objects to provide users with predefined single-select and multi-select fields.

<!--TASK: Introduce picklists.-->

![An object definition can have multiple fields to store information according to its type.](./modeling-data-structures/images/02.png)

For Clarity's use case, each Distributor Application entry should store the necessary business information for verifying each applicant's identity and credit for Know Your Customer (KYC) best practices and compliance with Anti-Money Laundering (AML) laws. As such, the Distributor Application object contains fields for the applicant's name, title, email, and phone number, along with a *Comments* field for the applicant to write a message. <!--TASK: ^ This list doesn't satisfy the AML/KYC comment.--> Additionally, Clarity wants to collect information for assessing the relative value of each prospective distributor. So they've added picklist fields for collecting this information:

* Business Type
* Distribution Regions
* Distribution Channels
* Order Types
* Product Types
* Annual Purchase Volume
* Product Labels

The second object needed for this use case is the Application Evaluation. Clarity employees would use this object to evaluate incoming distributor applications, so it should store notes and recommendations made during the review process. The Application Evaluation object definition contains the following custom fields:

* Business Name (text)
* Assessment Score (picklist)
* Attachment (file)
* Decision (picklist)
* Interview Notes (text)
* Recommendations (picklist)
* Recommendation Comments (text)

<!--TASK: Maybe reevaluate how this information is presented. It feels strange to list only the picklists for distributor application while listing all of the fields for the application evaluation object.-->

![Both the Distributor Application and Application Evaluation objects store data related to the applicant.](./modeling-data-structures/images/03.png)

## Defining Relationships

Defining relationships is key to creating data models that accurately represent real-world entities. They determine how data is connected in your application and capture entity interactions and dependencies. You can define one-to-many and many-to-many relationships between definitions. These relationships add fields or tables to each object for relating their entries, enabling you to access entry data in different object contexts.

One-to-many relationships enable users to relate a single entity of type A to multiple entities of type B. For example, if you were to model a university organization, the University object definition would have a one-to-many relationship with the Student object definition. Each university has multiple students, while each student only has one university.

On the other hand, many-to-many relationships enable users to relate multiple entities of type A to multiples entities of type B, and vice versa. In the university example, you could implement a many-to-many relationship between the Student object and the Professor object, because each student can have multiple professors and each professor can have multiple students.

For Clarity's solution, a single distributor application can have multiple evaluations related to it. But each evaluation can only relate to one application. So they have added a one-to-many relationship between the Distributor Application (one) and Application Evaluation (many) objects.

![A single Distributor Application entry is related to many Application Evaluation entities.](./modeling-data-structures/images/08.png)

<!--TODO: Image above should probably have multiple Application Evaluations to better visualize the one-to-many relationship-->

With the relationship between the object definitions, you can relate individual entries to one another through the Liferay UI or relationship REST APIs.

## Exercise One: Adding Fields to the Distributor Applications Object

<!--TASK: Update steps to use the model builder view.-->

The Distributor Applications object contains a number of custom fields, but Clarity needs one that can be used by the applicant to describe other brands that they offer.

To add this field,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Select the *Distributor Application* and go to the *Fields* tab.

1. Click *Add* (![Add Button](../../images/icon-add.png)) to create a new custom field, enter these values, and click *Save*:

   | Field                    | Value                        |
   |:-------------------------|:-----------------------------|
   | Label                    | Other Brands Offered         |
   | Field Name               | `businessOtherBrandsOffered` |
   | Type                     | Long Text                    |
   | Enable Entry Translation | False                        |
   | Mandatory                | False                        |

   ![Clicking Add opens a panel to create a new custom field.](./modeling-data-structures/images/04.png)

Each saved field is added immediately to the object and automatically appears in its default layout when creating entries. However, the Distributor Application object has a custom layout that must be modified to include the new field.

To add the field to the object's layout,

1. Go to the *Layouts* tab and click *Main Layout*.

1. Go to the *Layout* tab.

1. Find the Business Details block under the Application tab, then click *Add Field*.

   ![The Business Details can be found under the Application tab.](./modeling-data-structures/images/05.png)

1. Select *Other Brands Offered* as an option, choose the single column box for the field size, and click *Save*.

   ![Clicking Add Field opens a panel to include a field to the block.](./modeling-data-structures/images/06.png)

1. Click *Save*.

Now the new field appears in the layout when creating entries.

## Exercise Two: Adding Picklist Items

As mentioned previously, Clarity uses picklists to create predefined options for the applicants to choose from. Currently, the Product Types picklist is empty and does not include any options.

To fix this,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Picklists*

1. Select *Product Types*.

1. Click *Add* (![Add Button](../../images/icon-add.png)) and create these items:

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

Once saved, the Distributor Application's `Products of Interest` custom field is automatically updated with the values, since it's related to this picklist. Applicants are now able to select their desired products.

<!--TASK: Improve; this is the first time we've mentioned Products of Interest.-->

## Conclusion

Congratulations! You've helped to finish modeling Clarity's data structures. Next, let's begin implementing business logic.

Next Up: [Implementing Business Logic](./implementing-business-logic.md).

## Additional Resources

* [Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects)
* [Picklists](https://learn.liferay.com/w/dxp/building-applications/objects/picklists)
* [Creating and Managing Objects](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects)
* [Object Fields](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/fields)
* [Object Relationships](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/relationships)
