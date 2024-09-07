---
uuid: 7600c13a-c687-4637-97ca-abac89b05107
---
# Modeling and Managing Data Structures

<!--TASK: improve intro-->

Objects are the foundation of building low-code solutions with Liferay. With objects, you can model data structures and implement business logic for those structures without writing a single line of code. When created, each object is fully integrated with Liferay's core frameworks to create a unified experience across the platform. This means you can leverage Liferay's out-of-the-box capabilities like workflows, notifications, permissions, Headless APIs, and data mapping with objects, so that your custom solutions feel native to the Liferay experience.

Objects not only reduce development time and effort significantly, but also empower non-technical business users to actively participate in the development process. Furthermore, because objects also work hand-in-hand with client extensions, you don't sacrifice any of the flexibility that you expect in modern developer tools.

<!--TASK: Add diagram for modeling 'data structures'-->

Here we'll discuss best practices for working with Liferay Objects in the context of Clarity's custom solution for onboarding distributors. Then you'll apply these concepts in subsequent lessons as you set up Clarity's distributor solution.

The first step in building a custom solution is to model its data structure. This requires some brainstorming about the types of data entities you want to store, as well as their attributes and relationships.

## Identifying Data Entities

Clarity must store and manage two types of data entities for their distributor onboarding flow:

* Applications submitted by prospective distributors (Distributor Applications)
* Internal evaluations of these applications (Application Evaluations)

You can model each of these data entities as *object definitions*. An object definition is a blueprint that defines the structure and properties of the data stored by your solution. Each object definition includes a standard set of system fields along with configuration options for modifying general details, behavior, data scope, and available actions. Once you publish an object definition, Liferay creates a database table for storing the definition's *entries*.

!!! note "Object Definition vs. Object Entry"
    Object definitions specify types of data entities, while object entries are instances of those data entities.

![Object entries are individual instances of an object definition.](./modeling-and-managing-data-structures/images/01.png)

After determining the types of entities required for their solution, Clarity can start adding attributes to the object definitions.

## Adding Attributes

Attributes represent database columns storing specific data types for object definitions (e.g., text, numbers, and files). You define attributes by adding [fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) to an object. Additionally, you can create [picklists](https://learn.liferay.com/w/dxp/liferay-development/objects/picklists) and use them with objects to provide users with predefined single-select and multi-select fields.

<!--TASK: Introduce picklists.-->

![An object definition can have multiple fields to store information according to its type.](./modeling-and-managing-data-structures/images/02.png)

For Clarity's use case, each Distributor Application entry should store the necessary business information for verifying each applicant's identity and credit for Know Your Customer (KYC) best practices and compliance with Anti-Money Laundering (AML) laws. As such, the Distributor Application object contains fields for collecting both applicant information (e.g., name and phone number) and business details (e.g., license and proof of insurance). Additionally, Clarity wants to assess the relative value of each prospective distributor. So they've added picklist fields to collect the following information:

* Annual Purchase Volume
* Business Type
* Distribution Channels
* Distribution Regions
* Order Types
* Product Labels
* Product Types

The second object needed for this use case is the Application Evaluation. Clarity employees would use this object to evaluate incoming distributor applications, so it should store notes and recommendations made during the review process. The Application Evaluation object definition contains the following custom fields:

* Assessment Score (picklist)
* Attachment (file)
* Business Name (text)
* Decision (picklist)
* Interview Notes (text)
* Recommendations (picklist)
* Recommendation Comments (text)

<!--TASK: Maybe reevaluate how this information is presented. It feels strange to list only the picklists for distributor application while listing all of the fields for the application evaluation object.-->

![Both the Distributor Application and Application Evaluation objects store data related to the applicant.](./modeling-and-managing-data-structures/images/03.png)

## Defining Relationships

Defining relationships between your data models ensures that they represent real-world entities accurately. Relationships determine how data is connected in your solution and capture entity interactions and dependencies. You can define one-to-many and many-to-many relationships between object definitions in Liferay. These relationships add fields or tables to each object so that you can access entry data in different object contexts.

One-to-many relationships enable users to relate a single entity of type A to multiple entities of type B. For example, if you were to model a university organization, the University object definition would have a one-to-many relationship with the Student object definition. Each university has multiple students, while each student only has one university.

On the other hand, many-to-many relationships enable users to relate multiple entities of type A to multiples entities of type B, and vice versa. In the university example, you could implement a many-to-many relationship between the Student object and the Professor object, because each student can have multiple professors and each professor can have multiple students.

For Clarity's solution, a single distributor application can have multiple evaluations related to it, but each evaluation can only relate to a single application. So they have added a one-to-many relationship between the Distributor Application (one) and Application Evaluation (many) objects.

![A single Distributor Application entry is related to many Application Evaluation entities.](./modeling-and-managing-data-structures/images/04.png)

Once you've defined the relationship between object definitions, you can relate individual entries to one another through the Liferay UI or relationship REST APIs.

## Managing Data Access

Managing access to data with account membership and role permissions is critical for data privacy and security. Since Liferay Objects are integrated with the permissions framework, you can use roles and permissions to manage access to Distributor Applications and Application Evaluations. This helps Clarity ensure that only authenticated users can submit applications and a limited number of employees can review submissions.

<!--TASK: ![]() -->

User roles do not come with objects permissions by default, so you must manually grant access to objects and their entries. When you deploy Clarity's distributor onboarding solution in a later exercise, you will also assign the appropriate permissions to the business role for reviewing applications.

<!-- TODO: Uncomment out when the Data Migration Center is out of beta.

## Moving Data Structures between Environments

If you want to migrate custom data structures between environments, you can export and import object definitions as JSON files. These files include the definition’s complete schema such as its configurations, fields, actions, and relationships. You can then use these files to create batch client extensions for importing the structure into Liferay instances.

!!! note
    To use the batch client extension for object definitions, you must export the definition using Liferay's Data Migration Center as a JSONT file. This feature is currently in beta.
-->

## Exploring the Model Builder UI

Liferay provides the model builder UI for designing complex object structures. This graphical tool displays each object definition as a card and visualizes relationships between object definitions. With it, you can create, manage, and extend data models in the Objects application and quickly configure definitions, fields, and relationships.

![Use the model builder UI to design complex object structures.](./modeling-and-managing-data-structures/images/05.png)

To access the Model Builder view, open the Objects application and click *View in Model Builder*.

![Go to the desired object folder and click View in Model Builder.](./modeling-and-managing-data-structures/images/06.png)

Streamline your object management with this visual editor. Create, edit, and organize object definitions with ease. It is especially helpful for visualizing and managing intricate object relationships.

<!--TASK: Adapt into a UI reference/demo similar to the Page Builder UI overview.-->

## Conclusion

Congratulations! You've learned about best practices for modeling and managing data structures with Liferay Objects. Now you can apply this knowledge by completing some exercises for Clarity's custom distributor solution.

Up Next: [Setting Up Clarity's Distributor Solution](./setting-up-claritys-distributor-solution.md)

## Additional Resources

See our documentation to learn more about Liferay Objects' capabilities for modeling data structures:

* [Creating and Managing Objects](https://learn.liferay.com/w/dxp/liferay-development/objects/creating-and-managing-objects)
* [Picklists](https://learn.liferay.com/w/dxp/liferay-development/objects/picklists)
* [Object Relationships](https://learn.liferay.com/w/dxp/liferay-development/objects/creating-and-managing-objects/relationships)
* [Objects Application Permissions](https://learn.liferay.com/w/dxp/liferay-development/objects/objects-application-permissions)
* [Using the Objects Model Builder](https://learn.liferay.com/w/dxp/liferay-development/objects/creating-and-managing-objects/using-the-objects-model-builder)
