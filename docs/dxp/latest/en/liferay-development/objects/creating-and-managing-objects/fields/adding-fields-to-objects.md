---
uuid: c41d47fa-26bc-460b-b688-d1e3b7bcd123
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Adding Fields to Objects

{bdg-secondary}`Liferay 7.4 2023.Q4+/GA102+`

Fields are data definitions that represent database columns and store different [types of values](#field-types-ui-reference). By default, all objects include these system fields: Author, Create Date, External Reference Code, ID, Modified Date, and Status. But you can add new fields at any time.

Follow these steps:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the desired object definition.

   ```{note}
   For 7.4 U47+/GA47+, you can add fields to system objects and access them via Headless APIs. See [Extending System Objects](../extending-system-objects.md) for more information.
   ```

1. Go to the *Fields* tab and click the *Add* button (![Add Button](../../../../images/icon-add.png)).

   ![Go to the Fields tab, click the Add button, and enter the required details.](./adding-fields-to-objects/images/01.png)

1. Enter a *Label* and *Field Name*.

   **Label**: This value identifies the field in the Objects UI and can be localized after the field is created.

   **Field Name**: This value determines the field's name in the back-end and uses camel case. Once a field is published, this value cannot be changed.

   ```{note}
   Some field names are reserved by Liferay and cannot be used. See [Reserved Field Names](#reserved-field-names) for more information. 
   ```

1. Select a field *Type*. Some field types include additional configuration options (e.g., picklist, attachment). See [Field Type Reference](#field-types-ui-reference) below for an overview of each type.

   Some options appear during field creation, and others only appear after field creation.

   ```{tip}
   You can require some types to accept only unique values. For example, you can prevent users from entering an existing email address. For text or integer field types, enable *Accept Unique Values Only*.
   ```

1. Determine whether the field is mandatory.

1. Click *Save*.

After saving fields to an object draft, you can access additional configuration options. For instance, you can determine whether a field is searchable, limit the number of allowed characters for text fields, and more. Available configuration options depend on the field's type. If you publish the draft or add fields to an already published object, configuration options are restricted. You can remove custom fields from objects at any time.

```{important}
For Liferay 7.4 U85/GA85 and earlier versions, users cannot remove published fields. After publishing, you can only remove fields added to the object's side table (i.e., `[Initial_Table_Name]_x`). See [Publishing Object Drafts](../creating-objects.md#publishing-object-drafts) for more information.
```

## Field Types UI Reference

| Field Types (UI)                            | Data Type (HEADLESS) | Description                                                                                                                                                                                                                                                                                                          |
|:--------------------------------------------|:---------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Aggregation](./aggregation-fields.md)      | String               | Stores read-only values calculated using values from a relationship table. Available functions include `count`, `sum`, `average`, `min`, and `max`.                                                                                                                                                                  |
| [Attachment](./attachment-fields.md)        | Relationship > Long  | Stores files; by default, uploaded files can be no larger than 100 MB. This field supports all file types accepted by [Documents and Media](../../../../content-authoring-and-management/documents-and-media.md).                                                                                                    |
| [Auto-Increment](./auto-increment-fields.md)   | String               | Stores read-only values calculated by incrementing the last assigned value by `1`. You can configure the starting value, prefix, and suffix (e.g., `foo200bar`, `foo201bar`, `foo202bar`, ...).                                                                                                      |
| Boolean                                     | Boolean              | Stores true or false values. Mandatory boolean fields require a true value from end users.                                                                                                                                                                                                                           |
| Date                                        | Date                 | Stores date values.                                                                                                                                                                                                                                                                                                  |
| Date and Time                               | DateTime             | Stores date and time values. You can store time values as entered or convert them to UTC. <br><br> Convert to UTC: Stores the time in UTC and displays it in the user's timezone. <br><br> Use Input as Entered: Stores and displays the time as entered, regardless of timezone.                                    |
| Decimal (*previously Double*)               | Double               | Stores a decimal number value with a limit of 16 digits. <br><br> Example: `999.9999999999999` (16 digits total)                                                                                                                                                                                                     |
| [Encrypted](./encrypted-fields.md)          | String               | Stores encrypted string values.                                                                                                                                                                                                                                                                                      |
| [Formula](./formula-fields.md)              | Integer or Double    | Stores read-only values calculated using numeric fields in the object definition. During field creation, determine whether the total is stored as an integer or decimal. After creation, edit the field to set its formula. Available functions include add (`+`), subtract (`-`), multiply (`*`), and divide (`/`). |
| Integer                                     | Integer              | Stores an integer up to nine digits in length. You can choose to allow only unique values. <br><br> Maximum value: `2147483647` <br><br> Minimum value: `-2147483648`                                                                                                                                                |
| Long Integer (*previously Long*)            | Long                 | Stores a large integer up to 16 digits in length. <br><br> Maximum value: `9007199254740991` <br><br> Minimum value: `-9007199254740991`                                                                                                                                                                             |
| Long Text (*previously Clob*)               | Clob                 | Stores a text box value that supports up to 65,000 characters. After creating a long text field, you can limit the number of characters allowed.                                                                                                                                                                     |
| Multiselect Picklist                        | String               | Stores one or more string values from a [picklist](../../picklists.md).                                                                                                                                                                                                                                              |
| Picklist                                    | String               | Stores one string value from a [picklist](../../picklists.md). After adding the field, go to the Advanced tab to set a default value. You can set this value manually by selecting a specific picklist option or dynamically using the expression builder.                                                           |
| Precision Decimal (*previously BigDecimal*) | BigDecimal           | Stores a high-precision decimal number without rounding, up to 16 decimal digits. <br><br> Maximum Value: `99999999999999.9999999999999999` <br><br> Minimum value: `-99999999999999.9999999999999999`                                                                                                               |
| Relationship                                | Long                 | Stores the numeric ID for all related object entries. Objects automatically adds relationship fields to objects on the child side of a one-to-many relationship. See [Defining Object Relationships](../relationships/defining-object-relationships.md) for more information.                                        |
| Rich Text                                   | Clob                 | Stores text with advanced formatting tools and media elements (e.g., images, videos, audio).                                                                                                                                                                                                                         |
| Text (*previously String*)                  | String               | Stores simple text values up to 280 characters. You can choose to allow only unique values. After creating the field, you can limit the number of characters allowed.                                                                                                                                                |

## Reserved Field Names

The following field names are reserved by Liferay and cannot be used. If users attempt to create a field using one of these field names, Liferay displays an error message.

| Field                   | Description                                     |
|:------------------------|:------------------------------------------------|
| `companyId`             | Portal instance where the entry was created.    |
| `createDate`            | When the entry was created.                     |
| `externalReferenceCode` | External reference code for the entry.          |
| `groupId`               | Site ID where the entry was created.            |
| `lastPublishDate`       | Date when the entry was last published.         |
| `modifiedDate`          | Date when the entry was last modified.          |
| `mvccVersion`           | MVCC version of the entry.                      |
| `objectDefinitionId`    | ID of the entry's object.                       |
| `objectEntryId`         | ID for the entry.                               |
| `status`                | Workflow status for the entry.                  |
| `statusByUserId`        | ID of the assigned user in Workflow.            |
| `statusByUserName`      | Name of the assigned user in Workflow.          |
| `statusDate`            | Date when the Workflow status was last updated. |
| `userEmailAddress`      | Entry author's email address.                   |
| `userFirstName`         | Entry author's first name.                      |
| `userId`                | Entry author's user ID.                         |
| `userLastName`          | Entry author's Last name.                       |
| `userName`              | Entry author's user name.                       |
| `uuid`                  | Entry's unique universal ID.                    |

## Related Topics

* [Creating Objects](../creating-objects.md)
* [Defining Object Relationships](../relationships/defining-object-relationships.md)
* [Designing Object Layouts](../layouts/designing-object-layouts.md)
