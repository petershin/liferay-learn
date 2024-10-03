---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 4daac6e1-ef15-4f09-988a-08fadc0cb841
---

# Best Practices for Using Fragment Configurations

When you are creating page fragments for your site with your own [configurations](./adding-configuration-options-to-fragments.md), it's your responsibility to use them in their HTML presentation safely and effectively. Here are some techniques that you can use to make your fragments more effective and robust.

## Escape Configuration Text Values

Malicious code can be inserted into [text field configurations](../reference/fragments/fragment-configuration-types-reference.md#text-configuration), wreaking havoc for other fragment users. You must escape fragment text values to guard against cross-site scripting (XSS) attacks.

For generic cases, an HTML `escape()` method is available. See the [`HtmlUtil`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HtmlUtil.html) class for more information.

```html
<div class="fragment_38816">
   "${htmlUtil.escape(configuration.text)}"
</div>
```

To prevent JavaScript attacks, such as setting an attribute or appending HTML children, use the `Liferay.Util.escapeHTML()` function:

```javascript
function (fragmentElement, configuration) {
   const escapedValue = Liferay.Util.escapeHTML(configuration.text)
}
```

## Use Lists for Repeated HTML Elements

Avoid repeatedly writing the same HTML elements for your fragment by using FreeMarker lists. You can use the values from the configuration options you have implemented to implement your list's logic.

For example, you can iterate over the lines defined in a configuration (like [this select configuration](../reference/fragments/fragment-configuration-types-reference.md#select-configuration) example) and use this HTML to list the specified number of lines:

```html
<div class="fragment_1">
   [#list 1..configuration.numberOfLines as index]
      <li>Line number: ${index}</li>
   [/#list]
</div>
```

If you have implemented a [collection selector configuration](../reference/fragments/fragment-configuration-types-reference.md#collection-selector), you can also list all of the titles in the configured collection, like this example:

```html
<div class="fragment_310">
   <h1>
      List of Items:
   </h1>
   <ul>
      [#if collectionObjectList??]
         [#list collectionObjectList as item]
               <li>${item.title}</li>
         [/#list]
      [/#if]
   </ul>
</div>
```

See the [official FreeMarker documentation](https://freemarker.apache.org/docs/ref_directive_list.html) for more information.

## Related Topics

- [Adding Configuration Options to Fragments](./adding-configuration-options-to-fragments.md)
- [Fragment Configuration Types](../reference/fragments/fragment-configuration-types-reference.md)
