---
uuid: 1b15f720-c5bd-4b3e-81cc-5dce130a4156
taxonomy-category-names:
- Platform
- Forms
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using Forms with Objects

{bdg-secondary}`Liferay 7.4+`

Liferay objects are integrated with the Forms application, so you can design forms for receiving user input and creating object entries. To do this, first add a new form and configure it to use the objects storage type. Then select the desired object, design your form, and map its fields to the selected object's fields.

!!! important
    * You can use the Forms application's rules and validations with objects.
    * You cannot use the Forms application's data providers with objects. 
    * You cannot map object relationships to form fields. See [Designing Object Layouts](./creating-and-managing-objects/layouts/designing-object-layouts.md) for how to create custom layouts that include object relationships.

## Adding a Form for an Object

Follow these steps to add a form for creating object entries:

1. Navigate to the desired Site, open the *Site Menu* (![Site Menu](../../images/icon-menu.png)), and go to *Content & Data* &rarr; *Forms*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

1. Click the *Configuration* button (![Configuration Button](../../images/icon-cog.png)) for the new form.

1. Select the *Object* storage type and the object you want to use with the form.

   This configures the form to store data for the selected object.

   ![Select the Object storage type and the desired object.](./using-forms-with-objects/images/01.png)

   ```{note}
   Only published, active objects appear. You can only connect a form to one object at a time, though you can connect objects to multiple forms.
   ```

1. Click *Done*.

Once linked to the desired object, you can add field elements to the form and map them to the object's fields.

## Mapping Form Fields to Object Fields

Follow these steps to map a form field to an object field.

1. Add a form field that is compatible with the desired object field.

   See [Field Compatibility Reference](#field-compatibility-reference) for a list of which form fields are compatible with each type of object field.

1. Click the *Advanced* tab.

1. Select the desired *object field*.

   ```{warning}
   When mapped to a required object field, the form field is marked required automatically. If you're [using a form rule](../../process-automation/forms/form-rules/form-rules-overview.md) to [hide a required field conditionally](../../process-automation/forms/form-rules/example-using-hidden-fields-with-form-rules.md), you must ensure it contains appropriate data or form submission fails. Using a [predefined value](../../process-automation/forms/creating-and-managing-forms/providing-help-text-and-predefined-values.md) with an [autofill rule](../../process-automation/forms/form-rules/using-the-autofill-rule.md) can help ensure that a required hidden field is populated properly.
   ```

   ![In the Advanced tab, select the desired object field.](./using-forms-with-objects/images/02.png)

1. Repeat the above process until all desired object fields are mapped to a form field.

   ```{note}
   An object field can only be mapped to one form field.
   ```

   ![Map all desired object fields to the form fields.](./using-forms-with-objects/images/03.png)

1. Design the form layout. See [Forms](../../process-automation/forms.md) documentation to learn more about this process.

1. Once you've finished designing the form, click *Publish* to finish form creation.

   ```{important}
   Before you can publish an object form, it must fulfill all [mapping requirements](#mapping-requirements).
   ```

After publishing, the form can be used to create object entries for the selected object.

![Use the published form to create object entries.](./using-forms-with-objects/images/04.png)

## Mapping Requirements

All forms with the Objects storage type have the following requirements.

* All form fields must map to an object field to prevent data loss.

* All required object fields must be mapped to a form field.

Attempting to publish a form with invalid mappings displays an error message that identifies what's wrong.

![Attempting to publish a form with invalid mappings displays an error message.](./using-forms-with-objects/images/05.png)

## Field Compatibility Reference

| Object Field Types | Compatible Form Fields |
| :--- | :--- |
| Attachment | &#10060; |
| Boolean | Boolean (checkbox) |
| Date | Date |
| Decimal (*previously Double*) | Numeric &rarr; Decimal |
| Integer | Numeric &rarr; Integer |
| Long Integer (*previously Long*) | Numeric &rarr; Integer |
| Long Text (*previously Clob*) | Text |
| Picklist | Select from List (manual list only)<br />Single Selection |
| Precision Decimal (*previously BigDecimal*) | Numeric &rarr; Decimal |
| Relationship |  &#10060; |
| Rich Text | Rich Text |
| Text (*previously String*) | Text, Multiple Selection, Grid, Color |

## Related Topics

* [Objects Overview](../objects.md)
* [Creating Objects](./creating-and-managing-objects/creating-objects.md)
* [Designing Object Layouts](./creating-and-managing-objects/layouts/designing-object-layouts.md)
