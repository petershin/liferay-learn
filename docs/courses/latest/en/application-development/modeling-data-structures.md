---
toc: 
  - ./modeling-data-structures/determining-data-entities.md
  - ./modeling-data-structures/adding-fields-to-the-distributor-application-object.md
  - ./modeling-data-structures/adding-fields-using-rest-apis.md
  - ./modeling-data-structures/creating-picklists-for-distributor-applications.md
  - ./modeling-data-structures/creating-picklists-using-rest-apis.md
  - ./modeling-data-structures/adding-picklist-fields-to-the-object.md
  - ./modeling-data-structures/adding-a-custom-layout-and-view-to-distributor-application.md
  - ./modeling-data-structures/setting-up-the-application-evaluation-object.md
  - ./modeling-data-structures/adding-a-relationship-between-the-object-definitions.md
  - ./modeling-data-structures/adding-the-relationship-to-custom-layouts.md
  - ./modeling-data-structures/relating-object-entries.md
uuid: 34f7d1c1-19eb-43cf-8884-86662c70a342
---

# Modeling Data Structures

Your first step in writing an application is to model its data structures. This requires some brainstorming about the application you want to write: 

* Identifying the types of data entities you want to store and manipulate

* Adding attributes to each type of entity

* Defining relationships between entity types

## Identifying Data Entities

You can create [object definitions](https://learn.liferay.com/en/w/dxp/building-applications/objects) that represent the data entities for your application. These can be anything from insurance claims, support tickets, or commerce products. When you publish custom objects, Liferay creates a database table for storing data entries. It also generates headless APIs for performing CRUD operations and provides a basic frontend. Using Liferay objects, you can build a robust and flexible foundation for your solution that can support the specific needs of your organization.

## Adding Attributes

Attributes represent database columns that store specific types of information for an application, such as text and numeric values. Defining attributes for data models involves adding [fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) to object definitions for receiving user input. Additionally, you can create [picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists) and use them with objects to provide users with predefined single-select and multi-select fields.

## Defining Relationships

Defining relationships is key to creating data models that accurately represent real-world entities and their interactions. Using relationships, developers can determine how data is organized and connected within a system to better capture entity associations and dependencies. You can define one-to-many and many-to-many relationships between object definitions. These relationships add fields or tables to each object for relating their entries, enabling you to access entry data in different object contexts.

## Modeling Objects for the Distributor Application Flow

Delectable Bonsai must store and manage two types of data entities for their onboarding flow:

* Distributor Applications
* Application Evaluations

<!--FINISH: ![](./modeling-data-structures/images/01.png) -->

Each distributor application should store the necessary business information for verifying each applicant's identity and credit for Know Your Customer (KYC) best practice and compliance with Anti-Money Laundering (AML) laws. Additionally, they must collect information that can help them assess the relative value of each prospective distributor.

Application evaluations should store notes and recommendations made during the review process. Also, users must be able to relate each evaluation to an application and each application to multiple evaluations.

The first step to implementing this solution is to create a Distributor Application object for receiving and managing applications from potential distributors.

Ready?

[Let's Go!](./modeling-data-structures/determining-data-entities.md)
