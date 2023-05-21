# Defining Relationships

Defining relationships is essential to creating data models that accurately represent real-world entities and their interactions. Using relationships, developers can determine how data is organized and connected within your system to better capture entity associations and dependencies. This is integral for implementing robust business logic and efficient data management strategies.

<!-- Diagram? -->

For example, consider an e-commerce scenario with Customer and Order entities. You can use a one-to-many relationship to associate individual customers with multiple orders to better track and retrieve a customer's order information. Similarly, in a scenario with Book and Author entities, you can use a many-to-many relationship to associate individual books with multiple authors and vice versa.

With Liferay, you can define one-to-many and many-to-many relationships directly within the Objects application. These relationships add fields or tables to object definitions for relating their entries with one another. This way you can access entry data in different application contexts.

Delectable Bonsai needs a way to store evaluation notes for each application they receive. To do this, they need to create an Application Evaluation object and relate the Distributor Application to it in a one-to-many relationship. This way, reviewers can document their comments and feedback throughout the application process.

## Adding the Application Evaluation Object

1. Download and unzip the resources for [Defining Relationships](./liferay-w1m9.zip).

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/defining-relationships/liferay-w1m9.zip -O
   ```

   ```bash
   unzip liferay-w1m9.zip
   ```

   This ZIP file includes two shell scripts that execute make cURL commands using `headless-admin-list-type` and `object-admin` APIs.

1. Run this command to create three picklists for the Application Evaluation object:

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

1. Verify the new picklists were added.

1. Run this command to create the Application Evaluation object definition with six custom fields.

   ```bash
   ./ObjectDefinition_POST_ToInstance.sh
   ```

1. Verify the

## Relating the Distributor Application Object to the Application Evaluation Object

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the Distributor Application object and go to the *Relationships* tab.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) and enter these details:

   | Field                     | Value            |
   |:--------------------------|:-----------------|
   | Label | Application to Evaluations |
   | Name | `applicationToEvaluations` |
   | Type | One to Many |
   | Object | Application Evaluation |

1. Click *Save*.

## Relevant Concepts

* [Relationships](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/relationships)
