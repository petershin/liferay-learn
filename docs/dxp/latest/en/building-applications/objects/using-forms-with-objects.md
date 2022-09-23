# Using Forms with Objects

{bdg-secondary}`Available Liferay DXP 7.4+`

Liferay Objects are integrated with the Forms application, so you can design forms for receiving user input and creating Object entries. To do this, first add a new form and configure it to use the Objects storage type. Then select the desired Object, design your form, and map its fields to the selected Object's fields.

```{note}
All Forms features are supported for Objects, including rules and validations. However, users cannot map Object relationships to form fields. See [Designing Object Layouts](./creating-and-managing-objects/designing-object-layouts.md) for how to create custom layouts that include Object relationships.
```

## Adding a Form for an Object

Follow these steps to add a form for creating Object entries:

1. Navigate to the desired Site, open the *Site Menu* (![Site Menu](../../images/icon-menu.png)), and go to *Content & Data* &rarr; *Forms*.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)).

1. Click the *Configuration* button (![Configuration Button](../../images/icon-cog.png)) for the new form.

1. Select both the *Object* storage type and the specific Object you want to connect with the form.

   This configures the form to store data for the selected Object.

   ![Select both the Object storage type and the desired Object.](./using-forms-with-objects/images/01.png)

   ```{note}
   Only published, active Objects appear. Also, a form can only be connected to one Object at a time, while Objects can be connected to multiple forms.
   ```

1. Click *Done*.

Once linked to the desired Object, you can add field elements to the form and map them to the Object's fields.

## Mapping Form Fields to Object Fields

Follow these steps to map a form field to an Object field.

1. Add a form field that is compatible with the desired Object field.

   See [Field Compatibility Reference](#field-compatibility-reference) for a list of which form fields are compatible with each type of Object field.

1. Click on the *Advanced* tab.

1. Select the desired *Object field*.

   ```{warning}
   When mapped to a required Object field, the form field is marked required automatically. If you're [using a form rule](../../process-automation/forms/form-rules/form-rules-overview.md) to [hide a required field conditionally](../../process-automation/forms/form-rules/example-using-hidden-fields-with-form-rules.md), you must ensure it contains appropriate data or form submission fails. Using a [predefined value](../../process-automation/forms/creating-and-managing-forms/providing-help-text-and-predefined-values.md) with an [autofill rule](../../process-automation/forms/form-rules/using-the-autofill-rule.md) can help ensure that a required hidden field is populated properly.
   ```

   ![In the Advanced tab, select the desired Object field.](./using-forms-with-objects/images/02.png)

1. Repeat the above process until all desired Object fields are mapped to a form field.

   ```{note}
   An Object field can only be mapped to one form field.
   ```

   ![Map all desired Object fields to the form fields.](./using-forms-with-objects/images/03.png)

1. Design the form layout. See [Forms](../../process-automation/forms.md) documentation to learn more about this process.

1. Once you've finished designing the form, click *Publish* to finish form creation.

   ```{important}
   Before you can publish an Object form, it must fulfill all [mapping requirements](#mapping-requirements).
   ```

After publishing, the form can be used to create Object entries for the selected Object.

![Use the published form to create Object entries.](./using-forms-with-objects/images/04.png)

## Mapping Requirements

All forms with the Objects storage type have the following requirements.

* All form fields must map to an Object field to prevent data loss.

* All required Object fields must be mapped to a form field.

Attempting to publish a form with invalid mappings displays an error message that identifies what's wrong.

![Attempting to publish a form with invalid mappings displays an error message.](./using-forms-with-objects/images/05.png)

## Field Compatibility Reference

{bdg-secondary}`For Liferay 7.4 U20+`

| Object Field Types | Compatible Form Fields |
| :--- | :--- |
| Attachment | &#10060; |
| Boolean | Boolean (checkbox) |
| Date | Date |
| Decimal (*previously Double*) | Numeric &rarr; Decimal |
| Integer | Numeric &rarr; Integer |
| Long Integer (*previously Long*) | Numeric &rarr; Integer |
| Long Text (*previously Clob*) | Text |
| Picklist | Select from List, Single Selection |
| Precision Decimal (*previously BigDecimal*) | Numeric &rarr; Decimal |
| Relationship |  &#10060; |
| Rich Text | Rich Text |
| Text (*previously String*) | Text, Multiple Selection, Grid, Color |

## Additional Information

* [Objects Overview](../objects.md)
* [Creating Objects](./creating-and-managing-objects/creating-objects.md)
* [Designing Object Layouts](./creating-and-managing-objects/designing-object-layouts.md)
