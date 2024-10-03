---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 0602f11c-7650-4bc4-9071-79c6d8162689
---

# Applying Styles to Fragments

When you add a fragment to a page, you can use the sidebar menu to configure the fragment, including [the *Styles* configuration tab](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md#styles).

![Use the Styles tab in the sidebar menu to configure the styles per fragment on a page.](./applying-styles-to-fragments/images/01.png)

By default, all styles (including color, spacing, etc.) are applied to the entire fragment. The elements contained in the fragment inherit these changes if their CSS allows it; otherwise, the inner elements are ignored.

## Changing How Styles are Applied

{bdg-secondary}`Liferay 7.4 U31+ and GA31+`

You must change the fragment's HTML configuration to change how styles apply to it. Add the `data-lfr-styles` attribute to an element contained in the fragment to make any styles applied to them instead apply to that specific element.

!!! note
    Only one `data-lfr-styles` attribute is allowed per fragment.

For example, if you configure a simple custom fragment with this HTML and apply a style change to it, it applies to the entire fragment (by adding an outer `<div>` tag to enclose the HTML when it is rendered):

```html
<a class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
   Editable link.
</a>
```

Changing the background color of this example fragment to black applies that change to the outer `<div>` that is created for styles on the backend normally. It looks like this in the UI:

![Without the data-lfr-styles attribute, the background color applies to the entire fragment, creating an undesirable effect.](./applying-styles-to-fragments/images/02.png)

However, if you add the `data-lfr-styles` attribute to one of the inner elements within the fragment, you can make any changes to the style apply to that specific element instead. You can use this to choose an element that makes the most sense for those changes.

In the above example, you can add the attribute to the HTML tag for the button element:

```html
<a data-lfr-styles class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
   Editable link.
</a>
```

This makes any changes to the style apply to that part of the fragment. Now if you change the background color to black, it specifically changes the color of the chosen element:

![The data-lfr-styles attribute in this example applies the background color specifically to the button in the fragment.](./applying-styles-to-fragments/images/03.png)

!!! note
    If you add the `data-lfr-styles` attribute to a fragment, it does not affect instances of the fragment already added to pages. See [Propagating Fragment Changes](../../creating-pages/page-fragments-and-widgets/using-fragments/propagating-fragment-changes.md) for more information.

!!! warning
    You cannot use the `data-lfr-styles` attribute for tags contained within editable elements (using the `data-lfr-editable` or `lfr-editable` attributes). If you add `data-lfr-styles` to part of a fragment contained in one of these editable tags, it is ignored.

You can add the `data-lfr-styles` attribute using your preferred method for editing fragments:

- **Using the [Fragments Editor](./using-the-fragments-editor.md) in the UI**: make the change in the HTML window of the editor
- **Using the [Fragments Toolkit](./using-the-fragments-toolkit.md)**: make the change in the fragment's `index.html` file

## Related Topics

- [Developing Fragments](../developing-page-fragments.md)
- [Using the Fragments Editor](./using-the-fragments-editor.md)
- [Using the Fragments Toolkit](./using-the-fragments-toolkit.md)
- [Adding Configuration Options to Fragments](./adding-configuration-options-to-fragments.md)
- [Configuring Fragments](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
