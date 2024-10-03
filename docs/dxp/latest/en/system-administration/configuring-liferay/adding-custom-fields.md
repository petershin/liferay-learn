---
uuid: 7624c5b4-f26a-48bd-a496-fedabde8452e
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Adding Custom Fields

Many of Liferay's assets and resources can be extended with custom fields. Adding custom fields can give you greater control and flexibility over your site. You can use custom fields with the following entities:

- Account Entry
- Account Group
- Blogs Entry
- Bookmarks Entry
- Bookmarks Folder
- Calendar Event
- Discount (Commerce)
- Document
- Documents Folder
- Knowledge Base Article
- Knowledge Base Folder
- Message Boards Category
- Message Boards Message
- Order (Commerce)
- Order Item (Commerce)
- Organization
- Page
- Price List (Commerce)
- Price Modifier (Commerce)
- Product (Commerce)
- Product Attachment (Commerce)
- Product Group (Commerce)
- Product Link (Commerce)
- Product Option (Commerce)
- Product Option Relation (Commerce)
- Product Option Value (Commerce)
- Product Option Value Relation (Commerce)
- Product SKU (Commerce)
- Product Specification (Commerce)
- Product Specification Value (Commerce)
- Role
- Shipment (Commerce)
- Site
- Site Navigation Menu Item
- User
- User Group
- Warehouse (Commerce)
- Web Content Article
- Web Content Folder
- Wiki Page

There are many reasons for using custom fields. Here's one example.

**Max Role Use Case**: Suppose you want to limit the number of users that can be assigned to a particular role on your site. To accomplish this, you could create a *max-users* custom field for the role. Then, create logic to keep track and prevent more users from being added once the set limit was reached.

## Adding a Custom Field

1. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Custom Fields*.

1. Click *Role*.

   ![You can choose an asset or resource to add a custom field to.](adding-custom-fields/images/01.png)

1. Click *New* to add a custom field.

1. For the above use case, select *Input Field* as the field type. Enter a *Field Name* and select Integer as the Data Type.

   ![Give your custom field a name you can remember, because developers must access it using this name.](adding-custom-fields/images/02.png)

1. Click *Save*

!!! note
    The Field Name is the identifier stored in your database and the name that is used by the developer to access the custom field.

After creating a custom field, you can find it in the UI of the resource you created it for. In this case, the *max-users* custom field is now visible for all roles.

1. Open the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Roles*.

1. Select a role or click *Actions* (![Actions icon](../../images/icon-actions.png)) &rarr; *Edit*.

   ![The custom field is visible in the resource UI.](adding-custom-fields/images/03.png)

   Notice the Max Users field at the bottom.

## Editing Custom Fields

To edit a custom field, click *Actions* (![Actions icon](../../images/icon-actions.png)) next to a custom field and click *Edit*. These options appear:

![Click Actions to edit a custom role.](adding-custom-fields/images/04.png)

- Edit: You can change different aspects of the custom field except its name and type. The configuration options you have depend on the field type you choose.

- Permissions: You can modify the permissions to allow other users to edit or view a custom field.

- Delete: You can delete the custom field.

## Field Types

There are several different field types you can choose.

![There are different field types you can choose from.](adding-custom-fields/images/05.png)

- **Text and Numbers**
  - **Text Area**: This field type can collect longer lines of text.
  - **Input Field**: This field type can collect a string of text, a decimal number, or an integer.

  - **Selection**
  - **Dropdown**: This field type can provide a drop-down list of items to select. The list can be text, decimal numbers, or integers.
  - **Checkbox**: This field type shows a checkbox.
  - **Radio**: This field type shows a selection of two or more radio buttons.

  - **Others**
  - **Geolocation**: This field type collects geolocation information.
  - **Date**: This field type collects date and time information.
  - **True/False**: This field type shows a true or false choice.

## Related Topics

- [Creating and Managing Roles](../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md)
