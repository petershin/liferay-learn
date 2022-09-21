# Adding Fields to Objects

{bdg-secondary}`Available Liferay 7.4+`

Fields are data definitions that represent database columns and store different [types of values](#field-types-ui-reference). By default, all custom objects include the following system fields: Author, Create Date, External Reference Code, ID, Modified Date, and Status. But you can add custom fields to custom objects at any time.

When an object draft is [published](./creating-objects.md#publishing-object-drafts), Liferay creates an initial database table with all fields and relationships included in the draft at the time of publishing. Fields and relationships added to an object after publishing are added to a side table (i.e., `[Initial_Table_Name]_x`).

```{important}
You can remove fields from object drafts at any time. However, you cannot remove published fields. After publishing, only fields added to the object's side table can be removed.
```

Follow these steps to add a field to an object:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Objects*.

1. Begin editing the desired object definition.

1. Go to the *Fields* tab and click the *Add* button (![Add Button](../../../images/icon-add.png)).

   ![Go to the Fields tab, click the Add button and enter the required details.](./adding-fields-to-objects/images/01.png)

1. Enter a *Label* and *Field Name*.

   **Label**: This value identifies the field in the Objects UI and can be localized after the field is created.

   **Field Name**: This value determines the field's name in the back-end and uses camel case. Once a field is published, this value cannot be changed.

   ```{important}
   Some field names are reserved by Liferay and cannot be used for custom fields. See [Reserved Field Names](#reserved-field-names) for more information. 
   ```

1. Select a field *Type*. Some field types include additional configuration options (e.g., Picklist, Attachment). See [Field Type Reference](#field-types-ui-reference) below for a basic overview of each type, or see [Understanding Object Field Types](../understanding-object-field-types.md) for more detailed information.

   In some cases, these options are available during field creation (e.g., Picklist, Attachment), while others are only available after field creation (e.g., Text, Long Text). See  for more information.

1. Determine whether the field is *Mandatory*.

   ```{note}
   Mandatory boolean fields require a true value from end users.
   ```

1. Click on *Save*.

After saving fields to an object draft, you can access additional configuration options. For instance, you can determine whether a field is searchable. Other configuration options depend on the field's type. See [Understanding Object Field Types](../understanding-object-field-types.md) for more information.

```{important}
If you publish the draft or add fields to an already published object, configuration options are restricted. See [Configuration Restrictions for Published Objects](./creating-objects.md#configuration-restrictions-for-published-objects) to learn more.
```

## Field Types UI Reference

{bdg-secondary}`For 7.4 U24+/GA24+`

| Type | Description |
| :--- | :--- |
| Attachment | Stores `jpeg`, `jpg`, `pdf`, and `png` files no larger than 100 MB; see [Attachment Fields](../understanding-object-field-types.md#attachment) for more information |
| Boolean | Stores true or false values |
| Date | Stores date values |
| Decimal (*previously Double*) | Stores a decimal number value that supports fractional portions |
| Integer | Stores an integer up to 9 digits in length |
| Long Integer (*previously Long*) | Stores a large integer up to 19 digits in length |
| Long Text (*previously Clob*) | Stores a text box value that supports up to 65,000 characters; after creating a Long Text field, you can configure it to limit the number of characters allowed |
| Picklist | Stores a [Picklist](../picklists.md) string value; see [Picklist Fields](../understanding-object-field-types.md#picklist) for more information |
| Precision Decimal (*previously BigDecimal*) | Stores a high-precision decimal number without rounding |
| Relationship | Stores the numeric ID for all related object entries |
| Rich Text | Stores text with advanced formatting tools and media elements (e.g., images, videos, audio) |
| Text (*previously String*) | Stores simple text values up to 280 characters; after creating a Text field, you can configure it to limit the number of characters allowed |

## Reserved Field Names

{bdg-secondary}`For 7.4 U41+/GA41+`

The following field names are reserved by Liferay and cannot be used for custom fields. If users attempt to create a field using one of these field names, Liferay displays an error message.

| Field | Description |
| :--- | :--- |
| `companyId` | Portal instance where the entry was created |
| `createDate` | When the entry was created |
| `externalReferenceCode` | External reference code for the entry |
| `groupId` | Site ID in where the entry was created |
| `lastPublishDate` | Date when the entry was last published |
| `modifiedDate` | Date when the entry was last modified |
| `mvccVersion` | MVCC version of the entry |
| `objectDefinitionId` | ID of the entry's object |
| `objectEntryId` | ID for the entry |
| `status` | Workflow status for the entry |
| `statusByUserId` | ID of the assigned user in Workflow |
| `statusByUserName` | Name of the assigned user in Workflow |
| `statusDate` | Date when the Workflow status was last updated |
| `userEmailAddress` | Email address for the entry's author |
| `userFirstName` | First name of the entry's author |
| `userId` | ID of the entry's author |
| `userLastName` | Last name of the entry's author |
| `userName` | User name of the entry's author |
| `uuid` | Unique universal ID for the entry |

## Additional Information

* [Creating Objects](./creating-objects.md)
* [Defining Object Relationships](./defining-object-relationships.md)
* [Designing Object Layouts](./designing-object-layouts.md)
* [Managing Objects](./managing-objects.md)
