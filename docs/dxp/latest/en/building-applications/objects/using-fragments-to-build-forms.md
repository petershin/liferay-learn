# Using Fragments to Build Forms

{bdg-secondary}`Available Liferay 7.4 U45+/GA45+`

Liferay provides form fragments for building forms in content pages. To build a form, you must first add a form container to a content page or page template and map it to a published object. This automatically populates the form container with fragments mapped to each object field. If desired, you can manually organize, remove, or add fragments. Once published, end users can use them to create object entries.

Building forms in content pages has the following requirements:

* Form fragments can only be placed in a mapped form container.
* Every form fragment in the form container must map to an object field to prevent data loss.
* Form containers must include fragments for all mandatory object fields.
* Mandatory form fragments must be visible.
* Form containers must include a visible submit button.

By default, Liferay includes the [form components](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components) fragment set, but you can create your own. See [Creating Form Fragments](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md) for more information.

```{important}
Form fragments only support custom objects. To avoid clutter, Liferay hides the default form components set in the UI until you have at least one published object. Once published, users with access to the object can view and use the form components set. See [Creating Objects](../objects/creating-and-managing-objects/creating-objects.md) for more information.
```

## Creating a Form

1. Begin editing a content page or page template.

   Display page templates do not support form fragments.

1. (Optional) Design a layout using fragments. See [Building Responsive Layouts with Fragments](../../site-building/optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) for more information.

1. Add the *form container* fragment to the page and map it to an object.

   This automatically populates the container with fragments for all object fields and lists them in alphabetical order. All mandatory object fields are marked as required automatically.

   The form container also includes a *Submit* button.

   ![Add the form container and map it to an object.](./using-fragments-to-build-forms/images/01.png)

1. Remove non-mandatory fields that you don't want in the form.

1. Drag and drop form fragments to reorganize them.

1. (Optional) Add basic fragments to the form container. You can use basic components (e.g., grids, separators, paragraphs, images) to provide structure and style to your form container.

   ![Add basic fragments to the form container and reorganize your page elements to create the desired structure.](./using-fragments-to-build-forms/images/02.png)

1. Configure the fragments. Form fragments include both [standard](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) and [unique](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options) configuration options.

   ```{note}
   Form fragment configuration options are only available after mapping the fragment to an object field.
   ```

   ![Configure the form fragments.](./using-fragments-to-build-forms/images/03.png)

1. Click *Publish* when finished.

## Supported Field Types for Fragment Components

Each form fragment can support one or more form field types, which correspond to object field types.

The default form components support these fields.

| Fragment | Form Field Types | Object Field Types |
| :--- | :--- | :--- |
| CAPTCHA | N/A | N/A |
| Checkbox | Boolean | Boolean |
| Date | Date | Date |
| File Upload | File | Attachment |
| Numeric Input | Number | Integer, Long Integer, Decimal, Precision Decimal |
| Select from List | Relationship, Select | Relationship, Picklist |
| Submit Button | N/A | N/A |
| Text Input | Text | Text, Long Text, Rich Text |

## Additional Information

* [Form Components](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components)
* [Configuring Fragments](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
* [Form Fragment Options](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options)
* [Creating Form Fragments](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md)
