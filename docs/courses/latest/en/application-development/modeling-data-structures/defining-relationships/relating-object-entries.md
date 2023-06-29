# Relating Object Entries

After defining an object relationship, you can relate entries in two ways: the Liferay UI or relationship REST APIs. Here you'll practice relating evaluations and applications via the UI.

## Adding Test Data

1. Download and unzip the resources for [this exercise](./liferay-g2n9.zip):

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/defining-relationships/relating-object-entries/liferay-g2n9.zip -O
   ```

   ```bash
   unzip liferay-g2n9.zip
   ```

   This includes two scripts for creating application and evaluation entries.

1. Navigate to the `curl` folder in the `liferay-g2n9` folder:

   ```bash
   cd liferay-g2n9/curl
   ```

1. Run this command to create three entries for the Distributor Application object:

   ```bash
   
   ```

1. Verify the entries appear in the Distributor Application application page:

   ![]()

1. Create three entries for the Application Evaluation object:

   ```bash
   
   ```

1. Verify the entries appear in the Application Evaluation application page:

   ![]()

Now, practice relating these entries.

## Relating Entries

<!--
1. Open __.

1. Begin editing __ and _ the relationship field.

   Options are identified using the object's title field. By default, objects identify entires using the ID field. 

1. Set the Distributor Application's title field to Business Name.

1. Return to Application Evaluation, 

1. 
-->

Congratulations! You have successfully modeled the necessary data structures for Delectable Bonsai's distributor onboarding flow. Now you can start incorporating the business logic necessary for bringing your application to life, such as workflows, validations, notifications. You'll do this in the next module.

Module Two: [Implementing Business Logic](../../implementing-business-logic.md)

## Relevant Concepts

* [Relationship REST APIs](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/headless-framework-integration#relationship-rest-apis)
* [Using Relationship REST APIs](https://learn.liferay.com/en/w/dxp/building-applications/objects/objects-tutorials/using-apis/using-relationship-rest-apis)
