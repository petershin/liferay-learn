---
uuid: 3cc6f0a9-a820-42f1-94ca-9227c53c98ed
---
# Modeling Data Structures

Your first step in building an application is to model its data structures by considering the types of data entities you want to store and manipulate, the attributes of each entity type, and the relationships between different entity types. All of this functionality is captured by Liferay Objects, which are the foundation of low code applications in Liferay.

From the time of creation, all objects are fully integrated with Liferay's core frameworks to provide a unified experience across the platform and leverage all of its capabilities. This article discusses the features of Liferay objects in the context of Clarity's distributor application solution. 

<!--IMAGE: Diagram showing how Objects fit into the Liferay ecosystem and integrate with the various core frameworks -- headless APIs, Job Scheduler, Workflows, Forms, etc. -->

## Identifying Data Entities

You can create *object definitions* that represent types of data entities. Object definitions include a standard set of system fields along with configuration options for modifying their general details, behavior, scope/permissions, and available features. When an object definition is published, Liferay creates a database table for storing entries of that object.

!!! note "Object Definition vs. Object Entry"
    An object definition specifies a type of data entity, while an object entry is an individual instance of that data entity. A single object definition can (and often does) have multiple object entries in its corresponding database table.

<!--IMAGE: Use UML-style diagrams to emphasize object definitions as a "class" and object entries as instances of that "class". -->

Liferay also generates headless REST APIs for CRUD operations and provides a basic user interface for objects upon publication.

Clarity must store and manage two types of data entities for the distributor application flow:

* Distributor Applications
* Application Evaluations

Once you determine the types of entities required in your application, you can add relevant attributes to them.

## Adding Attributes

Attributes represent database columns that store specific types of information for an application, such as text, numeric values, or file attachments. You can define attributes for the data structures in your application by adding fields to the corresponding object definitions. Fields are populated by user input when an object entry is created. In addition to standard fields, you can also add picklists as object attributes to provide users with predefined single-select and multi-select fields. Fields and picklists can be added via the UI or REST APIs. 

<!--IMAGE: Example database diagram to demonstrate the different types of fields. Maybe show picklist column with a dropdown selection. -->

For Clarity's use case, each distributor application should store the necessary business information for verifying each applicant's identity and credit for Know Your Customer (KYC) best practice and compliance with Anti-Money Laundering (AML) laws. As such, the Distributor Application object contains fields for the applicant's name, title, email, and phone number, along with a *Comments* field for the applicant to write a message. 

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

<!--IMAGE: Object definition diagrams for both Distributor Application and Application Evaluation, also in UML style or similar-->

## Defining Relationships

Defining relationships is key to creating data models that accurately represent real-world entities. Object relationships determine how data is connected in your application and capture entity interactions and dependencies. You can define one-to-many and many-to-many relationships between object definitions. These relationships add fields or tables to each object for relating their entries, enabling you to access entry data in different object contexts.

For Clarity's distributor application flow, users must be able to relate each evaluation to an application and each application to multiple evaluations. To do this, they have added a one-to-many relationship to the Distributor Application object definition and specified Application Evaluation as the relatable object.

<!--IMAGE: Relationship diagram between Distributor Application and Application Evaluation. Would also be useful to show how relationships map to database fields/tables -->

Once the relationship has been added between the object definitions, you can relate individual object entries to one another through either the Liferay UI or relationship REST APIs.

Now that you've learned about the process of modeling data structures with Liferay Objects, you can move on to [Implementing Business Logic](./implementing-business-logic.md)

## Additional Resources

[Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects)
