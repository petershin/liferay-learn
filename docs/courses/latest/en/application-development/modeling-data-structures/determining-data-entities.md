# Determining Data Entities

Your first step toward creating an application is to define its data entities. In Liferay, you do this by defining various [Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects) representing your application's entities. These can be anything from insurance claims, support tickets, or commerce products.

When you publish custom objects, Liferay creates a database table for storing data entries. It also generates headless APIs for performing CRUD operations and provides a basic front-end. Using Liferay objects, you can build a robust and flexible foundation for your solution that is able to support the specific needs of your organization.

<!-- ![](./determining-data-entities/images/01.png) -->

Your first application will help Delectable Bonsai manage submitted product distributor applications. This requires a single object definition for creating and storing applications submitted by potential distributors. You'll do this in four steps: 

1. [Add the Distributor Application object](#adding-the-distributor-application-object)
1. [Configure the object](#configuring-the-object)
1. [Add a custom field](#adding-a-custom-field)
1. [Publish the object](#publishing-the-distributor-application-object)

<!-- After publishing the object definition, you can practice [using the Distributor Application object](#using-distributor-applications) to create entries. -->

## Adding the Distributor Application Object

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Click *Add* ( ![Add Button](../../images/icon-add.png) ).

1. Enter these details:

   | Field        | Value                    |
   |:-------------|:-------------------------|
   | Label        | Distributor Application  |
   | Plural Label | Distributor Applications |
   | Object Name  | `DistributorApplication` |
   | Storage Type | Default                  |

   ![Enter a label, plural label, object name, and storage type.](./determining-data-entities/images/02.png)

1. Click *Save*.

   This creates a draft object definition with these system fields:

      * `createDate`
      * `creator`
      * `externalReferenceCode`
      * `id`
      * `modifiedDate`
      * `status`

   ![Liferay creates an object draft.](./determining-data-entities/images/03.png)

## Configuring the Object

Object definitions include configuration options for modifying their general details, behavior, and available features. For example, you can determine how each object's data is scoped, where users can access it in the UI, and whether to maintain a history of entry events.

Configure Distributor Application as follows:

1. Begin editing the object definition draft.

1. Change the definition's ERC (External Reference Code):

   * Click *Edit* (![Edit Button](../../images/icon-edit.png)).
   * Replace the UUID with `C_DISTRIBUTOR_APPLICATION`.
   * Click *Save*.

   ```{tip}
   Consistent, human-readable ERCs can help you move object definitions between instances and reference them via APIs.
   ```

   ![Update the definition's ERC to C_DISTRIBUTOR_APPLICATION.](./determining-data-entities/images/04.png)

1. In the Details tab, configure these settings:

   | Field                                          | Value                  |
   |:-----------------------------------------------|:-----------------------|
   | Entry Display > Title Field                    | ID                     |
   | Scope > Scope                                  | Company                |
   | Scope > Panel Category Key                     | Control Panel > Object |
   | Account Restriction > Active                   | False                  |
   | Account Restriction > Account Restricted Field | N/A                    |
   | Configuration > Show Widget                    | True                   |
   | Configuration > Enable Categorization          | True                   |
   | Configuration > Enable Comments                | False                  |
   | Configuration > Enable Entry History           | False                  |

   This configures the Distributor Application to store data by instance and appear in the Global Menu ( ![Global Menu](../../images/icon-applications-menu.png) ) according to its panel category key (i.e., Control Panel > Objects). Additionally, users can add the object to site pages as a widget and assign tags and categories to Distributor Application entries.

1. Click *Save*.

## Adding a Custom Field

Before you can publish an object definition, it must have at least one field.

To do this,

1. Go to the *Fields* tab.

1. Click *Add* ( ![Add Button](../../images/icon-add.png) ).

1. Enter these values:

   | Field                     | Value           |
   |:--------------------------|:----------------|
   | Label                     | Applicant Name  |
   | Field Name                | `applicantName` |
   | Type                      | Text            |
   | Mandatory                 | True            |
   | Accept Unique Values Only | False           |

   ![Add these values for the field.](./determining-data-entities/images/05.png)

1. Click *Save*.

   The new field appears in the Fields tab with the `Custom` badge.

   ![Confirm the custom field appears in the Fields tab.](./determining-data-entities/images/06.png)

## Publishing the Distributor Application Object

When you publish custom objects, Liferay creates a database table for storing data entries. Publishing also registers the object with the OSGi framework, integrates it with [Liferay's core features](https://learn.liferay.com/w/dxp/building-applications/objects/understanding-object-integrations) (e.g., permissions, workflow, headless), and provides a basic user interface.

To publish Distributor Application,

1. Go to the object's *Details* tab.

1. Click *Publish*.

   ![In the Details tab, click Publish.](./determining-data-entities/images/07.png)

This activates Distributor Application and creates a database table with the `applicantName` field along with the default system fields. See [Publishing Object Drafts](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/creating-objects#publishing-object-drafts) for more information on what happens during publishing.

## Using Distributor Applications

Now that Distributor Application is published, you can begin using it.

To access the object's application page via the Liferay UI, open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Distributor Applications*.

![Access the application in the Global Menu under Control Panel > Objects.](./determining-data-entities/images/08.png)

Here you can click *Add* ( ![Add Button](../../images/icon-add.png) ) to create distributor applications. The object's application page displays these entries in a table that includes the object's custom field alongside the `id`, `status`, and `author` system fields. Practice creating, updating, and removing entries before moving forward.

![The application page for Distributor Application uses a default table view.](./determining-data-entities/images/09.png)

You can also use the REST APIs generated for Distributor Application during publishing to create, edit, query, and remove entries. These APIs are available at the `c/distributorapplications` path. See [Headless Framework Integration](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/headless-framework-integration) for a complete list of available APIs and [Custom Object API Basics](https://learn.liferay.com/en/w/dxp/building-applications/objects/objects-tutorials/using-apis/object-api-basics) for an introductory tutorial.

![Liferay generates REST APIs for Distributor Application.](./determining-data-entities/images/10.png)

Now that the object is defined, you can add more fields to collect the necessary applicant information.

Next: [Defining Attributes](./defining-attributes.md)

## Relevant Concepts

* [Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects)
* [Creating Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/creating-objects)
* [Understanding Object Integrations](https://learn.liferay.com/w/dxp/building-applications/objects/understanding-object-integrations)
