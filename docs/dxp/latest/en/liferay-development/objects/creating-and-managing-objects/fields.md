---
toc:
  - ./fields/adding-fields-to-objects.md
  - ./fields/using-read-only-fields.md
  - ./fields/adding-and-managing-custom-states.md
  - ./fields/aggregation-fields.md
  - ./fields/attachment-fields.md
  - ./fields/auto-increment-fields.md
  - ./fields/encrypted-fields.md
  - ./fields/formula-fields.md
  - ./fields/picklist-fields.md
uuid: 4ba9b571-6b88-4ab0-940a-b406a95caa75
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Fields

{bdg-secondary}`Liferay 7.4 2023.Q4+/GA102+`

Object fields are data definitions that represent database columns and store different types of values. All objects include default system fields, but you can [add custom fields](./fields/adding-fields-to-objects.md) to both draft and published objects.

When you [publish](./creating-objects.md#publishing-object-drafts) an object draft, Liferay creates an initial database table that includes all fields and relationships in the draft at the time of publishing. Fields and relationships added after publishing are added to a side table (i.e., `[Initial_Table_Name]_x`).

![All objects include default system fields, but you can add custom fields.](./fields/images/01.png)

Liferay provides these field types that correspond to specific data types in the backend:

| Field Types (UI)                                      | Data Type (HEADLESS) | Description                                                                                                                                                                                                                                                                                                          |
|:------------------------------------------------------|:---------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Aggregation](./fields/aggregation-fields.md)         | String               | Stores read-only values calculated using values from a relationship table. Available functions include `count`, `sum`, `average`, `min`, and `max`.                                                                                                                                                                  |
| [Attachment](./fields/attachment-fields.md)           | Relationship > Long  | Stores files; by default, uploaded files can be no larger than 100 MB; this field supports all file types accepted by [Documents and Media](../../../content-authoring-and-management/documents-and-media.md).                                                                                                       |
| [Auto-Increment](./fields/auto-increment-fields.md)   | String               | Stores read-only values calculated by incrementing the last assigned value by `1`. You can configure the starting value, prefix, and suffix (e.g., `foo200bar`, `foo201bar`, `foo202bar`, ...).                                                                                                      |
| Boolean                                               | Boolean              | Stores true or false values. Mandatory Boolean fields always require a true value.                                                                                                                                                                                                                                   |
| Date                                                  | Date                 | Stores date values.                                                                                                                                                                                                                                                                                                  |
| Date and Time                                         | DateTime             | Stores date and time values. You can store time values as entered or convert them to UTC. <br><br> Convert to UTC: Stores the time in UTC and displays it in the user's timezone. <br><br> Use Input as Entered: Stores and displays the time as entered, regardless of timezone.                                    |
| Decimal (*previously Double*)                         | Double               | Stores a decimal number value with a limit of 16 digits. <br><br> Example: `999.9999999999999` (16 digits total)                                                                                                                                                                                                     |
| [Encrypted](./fields/encrypted-fields.md)             | String               | Stores encrypted string values.                                                                                                                                                                                                                                                                                      |
| [Formula](./fields/formula-fields.md)                 | Integer or Double    | Stores read-only values calculated using numeric fields in the object definition. During field creation, determine whether the total is stored as an integer or decimal. After creation, edit the field to set its formula. Available functions include add (`+`), subtract (`-`), multiply (`*`), and divide (`/`). |
| Integer                                               | Integer              | Stores an integer up to nine digits in length. You can choose to allow only unique values. <br><br> Maximum value: `2147483647` <br><br> Minimum value: `-2147483648`                                                                                                                                                |
| Long Integer (*previously Long*)                      | Long                 | Stores a large integer up to 16 digits in length. <br><br> Maximum value: `9007199254740991` <br><br> Minimum value: `-9007199254740991`                                                                                                                                                                             |
| Long Text (*previously Clob*)                         | Clob                 | Stores a text box value that supports up to 65,000 characters; after creating a long text field, you can configure it to limit the number of characters allowed.                                                                                                                                                     |
| Multiselect Picklist                                  | String               | Stores one or more string values from a [picklist](../picklists.md).                                                                                                                                                                                                                                                 |
| Picklist                                              | String               | Stores one string value from a [picklist](../picklists.md). After adding the field, go to the Advanced tab to set a default value. You can set this value manually by selecting a specific picklist option or dynamically using the expression builder.                                                              |
| Precision Decimal (*previously BigDecimal*)           | BigDecimal           | Stores a high-precision decimal number without rounding and supports up to 16 decimal digits. <br><br> Maximum Value: `99999999999999.9999999999999999` <br><br> Minimum value: `-99999999999999.9999999999999999`                                                                                                   |
| Relationship                                          | Long                 | Stores the numeric ID for all related object entries. Objects automatically adds relationship fields to objects on the child side of a one-to-many relationship. See [Defining Object Relationships](./relationships/defining-object-relationships.md) for more information.                                         |
| Rich Text                                             | Clob                 | Stores text with advanced formatting tools and media elements (e.g., images, videos, audio).                                                                                                                                                                                                                         |
| Text (*previously String*)                            | String               | Stores simple text values up to 280 characters. You can choose to allow only unique values. After creating the field, you can limit the number of characters allowed.                                                                                                                                                |


