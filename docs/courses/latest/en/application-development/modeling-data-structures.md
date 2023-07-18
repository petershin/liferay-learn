---
toc: 
  - ./modeling-data-structures/determining-data-entities.md
  - ./modeling-data-structures/defining-attributes.md
  - ./modeling-data-structures/defining-relationships.md
uuid: 34f7d1c1-19eb-43cf-8884-86662c70a342
---

# Modeling Data Structures

Your first step in writing an application is to model its data structures. This requires some brainstorming about the application you want to write: 

* Identifying the types of data entities you want to store and manipulate

* Adding attributes to each type of entity

* Defining relationships between entity types

## Identifying Data Entities

In Liferay, you can create [object definitions](https://learn.liferay.com/en/w/dxp/building-applications/objects) that represent the data entities for your application. These can be anything from insurance claims, support tickets, or commerce products. When you publish custom objects, Liferay creates a database table for storing data entries. It also generates headless APIs for performing CRUD operations and provides a basic front-end. Using Liferay objects, you can build a robust and flexible foundation for your solution that is able to support the specific needs of your organization.

## Adding Attributes

Attributes represent database columns that store specific types of information for an application, such as text and numeric values. In Liferay, defining attributes for data models involves adding [fields](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) to object definitions for receiving user input. Additionally, you can create [picklists](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists) and use them with objects to provide users with predefined single-select and multi-select fields.

## Defining Relationships

Defining relationships is key to creating data models that accurately represent real-world entities and their interactions. Using relationships, developers can determine how data is organized and connected within a system to better capture entity associations and dependencies. In Liferay, you can define one-to-many and many-to-many relationships between object definitions. These relationships add fields or tables to each object that you can use to relate their entries, enabling you to access entry data in different object contexts.

## Modeling Objects for the Distributor Application Flow

Delectable Bonsai needs to store and manage two types of data entities for their onboarding flow:

* Distributor Applications
* Application Evaluations

<!--![](./modeling-data-structures/images/01.png) -->

Each distributor application should store the necessary information for verifying each applicant's business identity and credit for Know Your Customer (KYC) best practice and compliance with Anti-Money Laundering (AML) laws. Additionally, they need to collect information that can help them assess the relative value of each prospective distributor.

The application evaluations should store notes and recommendations on each applicant during the review process. Finally, users must be able to relate each evaluation to an application, and each application to multiple evaluations.

The first step to implementing this solution is to create a Distributor Application object for creating and managing applications submitted by potential distributors.<!--REFINE-->

Ready?

[Let's Go!](./modeling-data-structures/determining-data-entities.md)
