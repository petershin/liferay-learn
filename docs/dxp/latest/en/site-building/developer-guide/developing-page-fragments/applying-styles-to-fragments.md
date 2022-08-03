# Applying Styles to Fragments

When you add a Fragment to a page, you can use the sidebar menu to configure the Fragment, including [the *Styles* configuration tab](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md#styles).

![The Styles tab in the sidebar menu allows you to configure the styles per Fragment on a page.](./applying-styles-to-fragments/images/01.png)

By default, all styles (including color, spacing, etc.) are applied to the entire Fragment (the outermost `<div>` element), ignoring what other elements or other Fragments are contained in it.

## Changing How Styles are Applied

{bdg-secondary}`Available Liferay 7.4 U31+ and GA31+`

You must change the Fragment's HTML configuration to change how styles apply to it. Add the `data-lfr-styles` attribute to an element contained in the Fragment to make any styles applied to them instead apply to that specific element. *Only one `data-lfr-styles` attribute is allowed per Fragment.*

For example, if you configure a custom Fragment with this HTML and change the background color to green, it applies to the Fragment's outermost `<div>`, and it may not correctly change the appearance in the UI:

```html
<div class="marketing-card-fragment-01">
    <div class="card">
        <div class="card-body">
            <h5 data-lfr-editable-id="02-card-title" class="card-title" data-lfr-editable-type="rich-text">
                Editable title
            </h5>
            <a class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
                Editable link.
            </a>
        </div>
    </div>
</div>
```

However, if you add the `data-lfr-styles` attribute to one of the inner elements within the Fragment, then you can make any changes to the style apply to that element. You can use this to choose an element that makes more sense for those changes to apply to.

For example, you can add the attribute to the button element in the above example's HTML:

```html
<a class="btn btn-nm btn-primary" data-lfr-styles data-lfr-editable-id="link" data-lfr-editable-type="link">
```

This makes any changes to the style apply to that part of the Fragment. Now if you change the background color to green, it changes the color of the chosen element (in this example, the button):

![The data-lfr-styles attribute in this example applies the background color specifically to the button in the Fragment.](./applying-styles-to-fragments/images/02.png)

```{note}
If you have already added a Fragment to a page before you added the `data-lfr-styles` attribute, then you may need to remove and re-add the Fragment to the page for the change to affect how styles are applied to it.
```

```{warning}
Previously deprecated HTML elements, such as `lfr-editable`, do not support the use of `data-lfr-styles` within them.
```

You can add the `data-lfr-styles` attribute using your preferred method for editing Fragments:

* **Using the [Fragments Editor](./using-the-fragments-editor.md) in the UI**: make the change in the HTML window of the editor
* **Using the [Fragments Toolkit](./using-the-fragments-toolkit.md)**: make the change in the Fragment's `index.html` file

## Additional Information

* [Developing Fragments](./developing-fragments-intro.md)
* [Using the Fragments Editor](./using-the-fragments-editor.md)
* [Using the Fragments Toolkit](./using-the-fragments-toolkit.md)
* [Adding Configuration Options to Fragments](./adding-configuration-options-to-fragments.md)
* [Configuring Fragments](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
