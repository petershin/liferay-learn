# Personalizing Custom Forms Using Form Fragments

Among the out-of-the-box solutions provided with fragments, Liferay includes form fragments for building forms based on custom objects. To learn more about creating form fragments, see [Creating Form Fragments](../../../developer-guide/developing-page-fragments/creating-form-fragments.md)

```{important}
Form fragments can only be used with custom objects. Therefore, Liferay hides the Form Components fragment set until you have at least one published object. Once published, users with access to the object can view and use the Form Components fragments. See [Creating Objects](../../../../building-applications/objects/creating-and-managing-objects/creating-objects.md) for more information.
```

Using form fragments, users can not only map their forms automatically, but they can also customize the forms using the existing form fragments, alter the order of the fields, delete fields, add other fragments into the form, etc.

## Using Custom Form Fragments Mapped to Field Types

If Liferay's form fragments don't satisfy your use case, you can create custom form fragments and use them to alter the style of your form by mapping your custom form fragment to an object field type. This way, you can customize your forms using an existing design system and components library.

There are four steps to build forms based on custom objects and map custom form fragments to field types:

1. [Create and publish a custom object.](#create-and-publish-a-custom-object)
1. [Create custom form fragments related to the object fields.](#create-custom-form-fragments-related-to-the-object-fields)
1. [Map the custom form fragments to the form fields.](#map-the-custom-form-fragments-to-the-form-fields)
1. [Create the form based on the object using form fragments.](#create-the-form-based-on-the-object-using-form-fragments)

### Create and Publish a Custom Object.

Create a custom object. See [Creating Objects](../../../../building-applications/objects/creating-and-managing-objects/creating-objects.md) for more information on how to create objects. 

Add fields to your object and publish it.

![Choose a label and the type of the field](./personalizing-custom-forms-using-form-fragments/01.png)

The fields you add to the custom object are the ones mapped to the form. In this example, the fields are Name, Age, E-mail Address, and Telephone Number (text and integer fields).

![Four custom fields were added to the object: Name, Age, E-mail Address, and Telephone Number.](./personalizing-custom-forms-using-form-fragments/02.png)

### Create custom form fragments related to the object fields

The custom form fragments use HTML, CSS, and JavaScript code to create an element with customized style and functionalities. If you have an existing design system and/or a components library, you can apply them to your fragment. See [Creating Form Fragments](../../../developer-guide/developing-page-fragments/creating-form-fragments.md) for more information. 
   
In this example, Custom Text Input and Custom Numeric Input were created to alter the text and integer fields.

![You can create new form fragments and organize them in fragment sets](./personalizing-custom-forms-using-form-fragments/03.png)

#### Copying and Editing a Form Fragment

##### Copying a Form Fragment

The custom form fragments used in the example are altered copies of the form component's Text Input and Numeric Input. To copy a form component to your fragment set,

1. Open the *Product Menu*(![Product Menu](../../../../images/icon-product-menu.png)), click *Design*, and select the *Fragments* app.
   
1. From the default fragment sets, choose the component you want to copy, click on the *Actions* icon (![Actions Icon](../../../../images/icon-actions.png)), and select *Copy To*.

   ![You can't edit an out-of-the-box fragment, but you can make a copy and edit it](./personalizing-custom-forms-using-form-fragments/04.png)
   
1. Select the *Fragment Set* where you want to place the copy or click on *Save In New Set* to open a dialog box to create a new fragment set.

   ![If you don't have a fragment set, you can create a new one while making a copy of an out-of-the-box fragment](./personalizing-custom-forms-using-form-fragments/05.png)  
   
1. Click on *Save*

##### Editing a Form Fragment

You can now edit the copied fragment. Navigate to your fragment set, click on the *Actions* icon(![Actions Icon](../../../../images/icon-actions.png)), and choose *Edit*.

![The copy you made is located under the fragment set you chose](./personalizing-custom-forms-using-form-fragments/06.png)

In this example, the CSS is altered to change the style of the component.

![The CSS code was altered to make the Numeric Input look a little different from the out-of-the-box style](./personalizing-custom-forms-using-form-fragments/07.png)


```css
.input-container {
   display: flex;
   flex-direction: column;
   margin-bottom: 10px;
}

.label {
   color: #0053f0;
   font-weight: bold;
   border: none;
   font: 1.25rem sans-serif;
}

.input{
   padding: 5px;
   border: 1px solid #0053f0;
   border-radius: 5px;
   max-width: 300px;
   width: 100%;
   font: 1.25rem sans-serif;
   color: #0053f0;
}
```

### Map the custom form fragments to the form fields.

1. In your Fragments app, click on the *Options* icon (![Options Icon](../../../../images/icon-options.png)) in the applications bar &rarr; select *Configuration*.

   ![It's possible to map fragments to fields through the Configuration menu in fragments](./personalizing-custom-forms-using-form-fragments/08.png)

1. Select the *Form Fragment* (on the right column) to be applied to the Field Type (on the left column).

   ![Apply a custom form fragment to a field type](./personalizing-custom-forms-using-form-fragments/09.png) 

1. Choose the fragment set under your site's tab &rarr; the options with a compatible type of field appear. 

1. Select the custom form fragment you want to apply.

   ![The options that are compatible with the field can be selected](./personalizing-custom-forms-using-form-fragments/10.png)


### Create the form based on the object using form fragments.
      
1. While editing your content page or page template where you want to add the form. See [Adding Elements to Content Pages](../../using-content-pages/adding-elements-to-content-pages.md) for more information on how to edit a content page.

```{warning}
Display page templates do not support form fragments. You must use a content page or a page template.
```

1. (Optional) Design a layout using fragments. See [Building Responsive Layouts with Fragments](../../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) for more information.

1. Add the *Form Container* fragment to the page and map it to the custom object.

   The container automatically generates a Submit button and fragments for all object fields. They appear in alphabetical order. Mandatory fields are marked accordingly.

   ![Add the form container and map it to an object.](./personalizing-custom-forms-using-form-fragments/11.png)

1. The style of the custom form fragments should be different from the default style of an out-of-the-box form fragment. In this example,

   * the colors on the label and the custom input field are different.

   * the input field has a `max-width` while the default input field occupies the width of its parent completely.

   * As a `margin-bottom` was added, the overall height of the form is superior to the one in the default component.

   ![The fields mapped to the custom form fragments (on the left) look different from the ones created with out-of-the-box fragments (on the right).](./personalizing-custom-forms-using-form-fragments/12.png)

## Related Topics

* [Form Components](./default-fragments-reference.md#form-components)
* [Configuring Fragments](./configuring-fragments.md)
* [Form Fragment Options](./configuring-fragments/general-settings-reference.md#form-fragment-options)
* [Developing Page Fragments](../../../developer-guide/developing-page-fragments.md)
* [Creating Form Fragments](../../../developer-guide/developing-page-fragments/creating-form-fragments.md)
* [Using Fragments to Build Forms](../../../../building-applications/objects/using-fragments-to-build-forms.md)
