# Adding a Relationship Between the Object Definitions

Delectable Bonsai needs the ability to relate an application to multiple evaluations and each evaluation to only one application. In Liferay, this involves adding a one-to-many relationship in the Distributor Application object.

1. Begin editing the Distributor Application object.

1. Go to the *Relationships* tab.

1. Click *Add* (![Add Button](../../../images/icon-add.png)) and enter these details:

   | Field  | Value                      |
   |:-------|:---------------------------|
   | Label  | Application to Evaluations |
   | Name   | `applicationToEvaluations` |
   | Type   | One to Many                |
   | Object | Application Evaluation     |

1. Click *Save*.

   ![Add the applicationToEvaluations relationship to the Distributor Application object.](./adding-a-relationship-between-the-object-definitions/images/01.png)

   <!-- ![For the Application Evaluation object, the relationship appears in the Fields tab.](./adding-a-relationship-between-the-object-definitions/images/02.png) -->

This adds a relationship table to Distributor Application and a relationship field to Application Evaluation. Liferay also adds dedicated relationship REST endpoints to both object definitions for relating and disassociating entries using REST APIs.

Before you practice relating object entries, add the relationship to each object's custom layout.

Next: [Adding the Relationship to Custom Layouts](./adding-the-relationship-to-custom-layouts.md)

## Relevant Concepts

* [Relationships](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/relationships)
* [Relationship REST APIs](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/headless-framework-integration#relationship-rest-apis)
