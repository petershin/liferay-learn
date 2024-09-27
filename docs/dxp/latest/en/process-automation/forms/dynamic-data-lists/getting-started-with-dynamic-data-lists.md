---
taxonomy-category-names:
- Platform
- Forms
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: f44d003b-839e-421a-bc22-ed2e0cff88b5
---
# Getting Started with Dynamic Data Lists

!!! important
    Dynamic Data Lists is deprecated as of Liferay DXP 7.3, and is planned for removal in 2024. It is replaced by [Objects](../../../liferay-development/objects.md). Please [migrate](./migrating-to-liferay-objects.md) your Dynamic Data Lists to Objects as soon as possible.

Dynamic data lists display forms created from field sets called data definitions. Data definitions consist of a form's field types (e.g., text, boolean, date, radio buttons, selector menus, etc.) and those fields' labels and settings. Data definitions effectively serve as data models for a dynamic data list. For example, you could create a data definition with three fields for conference registration: one for users' names, one for their email addresses, and a drop-down list for t-shirt size. This data definition could then be used for every conference registration form you create.

![Example of conference registration forms with data lists](./getting-started-with-dynamic-data-lists/images/01.png)

**Data Definitions:** Define a form's fields.

**Dynamic Data Lists:** Display a form based on a data definition.

You can create one or multiple dynamic data lists from a single data definition. The user data entered for each dynamic data list is kept separate, even if the data definition is shared. For instance, you could use the example data definition above to create several dynamic data lists, and then place them anywhere you need to get feedback from users. Because each dynamic data list's form data is separate, you don't need to try to figure out which dynamic data list the user input came from.

Dynamic data lists are flexible. You don't have to restrict dynamic data lists to simple input. You could create something as complex as an entire data entry system for real estate listings, or any other simple list-based application you can dream up.

You create data definitions and dynamic data lists from the Site Menu's Content &rarr; Dynamic Data Lists application. Creating data definitions and lists doesn't require any coding. However, additional formatting can be added with [FreeMarker templates](https://freemarker.apache.org/).

The following articles describe how to create and use data definitions and dynamic data lists:

* [Creating data definitions](./creating-data-definitions.md)
* [Creating dynamic data lists](./creating-data-lists.md)
* [Creating form templates](./creating-form-templates.md)
* [Creating display templates](./creating-display-templates.md)

## System Configuration

There are two settings you can configure in *Control Panel* &rarr; *System Settings* &rarr; *Content and Data* &rarr; *Dynamic Data Lists*: Dynamic Data Lists Service and Dynamic Data Lists.

Under the Dynamic Data Lists Service setting: 

**Add Default Structures:** This is enabled by default and pre-loads several embedded data definitions to base data lists on. Once loaded on portal startup, these definitions must be deleted manually from the Site Menu → Dynamic Data Lists application. This setting applies to the first start of a virtual instance.

Under the Dynamic Data Lists setting:

**Changeable Default Language:** If enabled, the default language of a data definition becomes changeable.

**CSV Export:** Choose whether Dynamic Data List records can be exported in CSV format with or without a warning, or disable this option. Here's what the warning says:

```{warning}
This CSV file contains user supplied inputs. Opening a CSV file in a spreadsheet program may be dangerous.
```

**Default Display View:** Choose whether to use a table based default view or a list based default view.
