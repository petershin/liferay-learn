# Determining Data Entities

Developing applications begins with identifying the data entities you need to create and handle within your custom solution/use case<!--w/c-->. Whether insurance claims, support tickets, or commerce products, each type of entity is modeled/represented<!--w/c--> as a database table that determines the entity's fundamental schema/structure<!--w/c-->, including its data fields and relationships. After defining your entities, you can start incorporating the business logic/functionality<!--w/c--> necessary for bringing your application to life (e.g., workflows, validations, notifications).

Liferay provides the [Objects application](https://learn.liferay.com/en/w/dxp/building-applications/objects) for creating custom data models and extend supported system applications. When you publish the object, Liferay creates a database table for storing distributor applications, generates headless APIs for CRUD operations, and provides a basic front-end for creating distributor applications. <!--Custom objects in Liferay are essentially data models/entities/etc. With them, you can extend the Liferay platform by adding database tables and functionality.-->

<!--You can use Liferay objects to ___, building a foundation that is robust, flexible, and able to support the specific business processes and needs of your organization.-->

```{note}
<!-- PARADIGM SHIFT:  -->
```

```{tip}
<!-- When determining the objects you want to create, identify the specific business processes or data elements required by your use case. Consider creating a data model or entity-relationship diagram (ERD) to identify entities and __ their relationships. This may include both system and custom objects. -->
```

## Exercise: Creating the Distributor Application Object Definition

As mentioned previously, Delectable Bonsai needs an application for receiving and approving requests to become product distributors. At its most basic implementation, this solution requires a single object definition for creating and storing applications submitted by potential distributors.  <!---This model should include all ___. Later in this course, ...-->

### Adding a Definition Draft

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Add* button ( ![Add Button](../../images/icon-add.png) ).

1. Enter these details:

   | Field        | Value                    |
   |:-------------|:-------------------------|
   | Label        | Distributor Application  |
   | Plural Label | Distributor Applications |
   | Object Name  | DistributorApplication   |

1. Click *Save*.

   ![]()

This creates a draft object definition with these standard data fields: `createDate`, `creator`, `externalReferenceCode`, `id`, `modifiedDate`, and `status`.

Next, you can configure the definition's general details and publish it.

### Configuring the Definition

1. While editing the definition, configure these settings in the Details:

   | Field                 | Value                     |
   |:----------------------|:--------------------------|
   | Scope                 | Company                   |
   | Panel Category Key    | Control Panel > Objects   |
   | Show Widget           | Enabled/True <!--w/c-->   |
   | Enable Categorization | Enabled/True <!--w/c-->   |
   | Enable Comments       | Disabled/False <!--w/c--> |
   | Enable Entry History  | Disabled/False <!--w/c--> |

### Publishing the Definition

Since Liferay places some limitations on configuration options after publishing, we'll publish our definition early in the development process to maintain maximal freedom while iterating on the application.

For example, fields included in a definition at the time of publishing cannot be removed.

To finish the creation process, you must add a basic field and publish the object definition:

1. While editing the definition, go to the *Fields* tab.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

1. Enter these values:

   | Field                     | Value                     |
   |:--------------------------|:--------------------------|
   | Label                     | Applicant Name            |
   | Field Name                | applicantName             |
   | Type                      | Text                      |
   | Mandatory                 | Enabled/True <!--w/c-->   |
   | Accept Unique Values Only | Disabled/False <!--w/c--> |

1. Click *Save*.

   ![]()

1. Go to the *Details* tab.

1. Click *Publish*.

## Relevant Concepts

* [Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects)
* [Creating Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/creating-objects)
