---
uuid: 2e138188-c1a0-49a4-b707-28286aec0461
---
# Adding a Relationship Between the Object Definitions

Delectable Bonsai must relate an application to multiple evaluations. This involves adding a one-to-many relationship in the Distributor Application object.

1. Begin editing the Distributor Application object.

1. Go to the *Relationships* tab.

1. Click *Add* (![Add Button](../../images/icon-add.png)) and enter these details:

   | Field  | Value                      |
   |:-------|:---------------------------|
   | Label  | Application to Evaluations |
   | Name   | `applicationToEvaluations` |
   | Type   | One to Many                |
   | Object | Application Evaluation     |

1. Click *Save*.

   This adds a relationship table to Distributor Application, which you can add to a separate tab in the definition's layout.

   ![Add the applicationToEvaluations relationship to the Distributor Application object.](./adding-a-relationship-between-the-object-definitions/images/01.png)

   The relationship also adds a field to Application Evaluation object definition.

   ![For the Application Evaluation object, the relationship appears in the Fields tab.](./adding-a-relationship-between-the-object-definitions/images/02.png)

   Liferay also adds dedicated relationship REST endpoints to both object definitions for relating and disassociating entries using REST APIs.

   ![Liferay adds dedicated relationship REST endpoints to both object definitions.](./adding-a-relationship-between-the-object-definitions/images/03.png)

Before you practice relating object entries, you must add the relationship to each object's custom layout.

Next: [Adding the Relationship to Custom Layouts](./adding-the-relationship-to-custom-layouts.md)

## Relevant Concepts

* [Relationships](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/relationships)
* [Relationship REST APIs](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/headless-framework-integration#relationship-rest-apis)
