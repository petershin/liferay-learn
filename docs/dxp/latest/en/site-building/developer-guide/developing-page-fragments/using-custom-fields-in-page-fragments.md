# Using Custom Fields in Page Fragments

Custom fields allow you to expand your pages' configuration options. You can then use your page custom fields to alter the content or functionality of your fragments.

After you have [added a custom field to pages](../../../system-administration/configuring-liferay/adding-custom-fields.md), [add or edit a page fragment](./using-the-fragments-editor.md) (via the fragments editor, from *Site Menu* &rarr; *Fragments*) to use the custom field within it. Access the custom field in your fragment's HTML with `layout.getExpandoBridge().getAttribute("ATTRIBUTE_NAME")`.

For example, you can use HTML like this to leverage a true/false value, `showFooter`:

```html
[#assign showFooter = layout.getExpandoBridge().getAttribute("showFooter")]

[#if showFooter]
    <footer class="bg-dark pb-8 pt-6 section-footer text-white">
        Placeholder footer content...
    </footer>
[/#if]
```

This uses the true/false value to determine whether to show the placeholder `footer` element on a page. Toggling a page's value to true or false will show or hide the footer, respectively.

![You can use custom field values to affect whether your own HTML footer content displays on the page or not.](./using-custom-fields-in-page-fragments/images/01.png)

You can also access custom fields for users in your fragments. Instead of retrieving a value for a `layout`, use `user.getExpandoBridge().getAttribute("ATTRIBUTE_NAME")` to get the corresponding custom field.

```{warning}
Attempting to retrieve a custom field value for a guest user may cause an error when viewing it on a page. If you use a `user` custom field, make sure to consider what happens if a guest without an account tries to view the fragment.
```

## Additional Information

* [Adding Custom Fields to Users](../../../system-administration/configuring-liferay/adding-custom-fields.md)

* [Using the Fragments Editor](./using-the-fragments-editor.md)
