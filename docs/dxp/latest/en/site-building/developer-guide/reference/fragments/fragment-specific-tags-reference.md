---
uuid: ba3f3663-f72e-4f18-b220-d9b2e127ef5e
---
# Fragment Specific Tags and Attributes Reference

Along with standard HTML, CSS, and JavaScript, you can use Liferay-specific tags and, since Liferay Portal 7.3 GA3 and Liferay DXP 7.3, attributes, to make editable sections or embed widgets in your fragment. Editable elements can be modified before publication, which means that you can create simple, reusable fragments that have identical formatting, but contain elements that are adaptable to the specific context.

```{warning}
Nesting editable elements inside of other editable elements in a fragment is not supported.
```

Page fragments have access to these types of liferay-specific tags and attributes that add these features:

- [Editable Text](#making-text-editable)
- [Editable Images](#making-images-editable)
- [Editable Links](#creating-editable-links)
- [Editable HTML (Liferay Portal 7.3 GA3+ and DXP 7.3+)](#creating-editable-html)
- [Embedded Widgets](#including-widgets-within-a-fragment)
- [Localizable Fragment Fields](#localizing-fragment-configurations)

```{tip}
When you start typing the name of a tag, the [HTML editor](../../developing-page-fragments/using-the-fragments-editor.md) provides auto-completion for `lfr` tags like editable elements and embeddable widgets.
```

The text or images you provide here are the default values for the fields. You may want to display them in the final version of the page, or you may want filler text that should be replaced before publishing the page.

All of these work together to help you create dynamic, reusable elements for building a site. For example, if you need a small text box with an image and link to provide a product description, you can create a fragment containing editable filler text, space for an editable image, the appropriate formatting, and an editable link. You can then add the fragment to multiple pages and define the image, text, and link for each product you need to describe.

```{warning}
IDs of editable elements must be unique. Do not change the ID after the page fragment has been added to a page. Changing the ID of an editable fragment after it's been modified can cause the changes to be lost.
```

You can make a fragment even more dynamic by including a widget. Currently, portlets are the only embeddable types of widgets, but other options are planned.

![The fragment editor provides autocomplete for fragment-specific tags.](./fragment-specific-tags-reference/images/01.png)

This reference list the available editable tags and attributes along with examples of how to use them in your fragments.

```{note}
Since Liferay Portal 7.3 GA3 and Liferay DXP 7.3, you can use `data-lfr-editable*` attributes to define elements as editable, rather than wrapping editable elements with `lfr-editable` tags. The old tags still work for backwards compatibility, but we recommend that you use the newer data attributes if you're running Portal 7.3 GA3+ or Liferay DXP 7.3, as they are easier to write.
```

## Making Text Editable

You can make fragment text editable by including the `data-lfr-editable-type="text"` attribute in the image element. The `data-lfr-editable-id` must be a unique ID, like this example:

```html
<p data-lfr-editable-id="text1" data-lfr-editable-type="text">
  Placeholder
</p>
```

```{note}
All block elements and inline elements are supported for editable text.
```

For Liferay Portal 7.3 GA2 and below, use the syntax below. A unique ID is required to render the element properly:

```html
<lfr-editable id="unique-id" type="text">
   This is editable text!
</lfr-editable>
```

If you need formatting options like text or color styles, use `rich-text`:

```html
<p data-lfr-editable-id="text1" data-lfr-editable-type="rich-text">
  Placeholder
</p>
```

```{note}
All block element tags are supported for editable Rich text.
```

For Liferay Portal 7.3 GA2 and below, use the syntax below:

```html
<lfr-editable id="unique-id" type="rich-text">
   This is editable text that I can make bold or italic!
</lfr-editable>
```

```{note}
If you want to make text inside an HTML element editable, you must use the `rich-text` type. The `text` type strips HTML formatting out of the text before rendering.
```

## Making Images Editable

Images use the same `data-lfr-editable-type` attribute as text, but with the `image` type, like this:

```html
<img
  src="placeholder.jpg"
  alt="Placeholder"
  data-lfr-editable-id="img1"
  data-lfr-editable-type="image"
>
```

For Liferay Portal 7.3 GA2 and below, use this syntax:

```html
<lfr-editable id="unique-id" type="image">
   <img src="...">
</lfr-editable>
```

After you add the `lfr-editable` tag with the type `image` to a fragment, when you add that fragment to a page, you can then click on the editable image and configure the image source and other properties from the content page editor sidebar.

![You have several options for defining an image on a content page.](./fragment-specific-tags-reference/images/02.png)

Most images can be handled like this, but to add an editable background image you must add an additional property to set the background image ID, `data-lfr-background-image-id`. The background image ID is set in the main `div` for the fragment and is the same as your editable image ID.

```html
<div data-lfr-background-image-id="unique-id">
   <lfr-editable id="unique-id" type="image">
      <img src="...">
   </lfr-editable>
</div>
```

Content mapping connects editable fields in your fragment with fields from an asset type like web content or blogs. For example, you can map an image field to display a preview image for a web content article. For more information on mapping fields, see [Fragment Mapping Settings](../../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings).

## Creating Editable Links

There is also a specific syntax for creating editable link elements:

```html
<a
  href="#placeholder"
  target="_blank"
  data-lfr-editable-id="link1"
  data-lfr-editable-type="link"
>
  Go to placeholder
</a>
```

For Liferay Portal 7.3 GA2 and below, use this syntax:

```html
<lfr-editable id="unique-id" type="link">
    <a href="default-target-url-goes-here">Link text goes here</a>
</lfr-editable>
```

You can edit the type of link, target URL, and link mapping from the content page editor sidebar.

![You have several options for defining a link's appearance and behavior.](./fragment-specific-tags-reference/images/03.png)

For more information on editable links, see [Editable Links](../../../creating-pages/page-fragments-and-widgets/configuring-fragments/fragment-sub-elements-reference.md#link-settings).

## Creating Editable HTML

You can make general HTML elements editable as well by setting the `data-lfr-editable-type` attribute to `html`:

```html
<article data-lfr-editable-id="text1" data-lfr-editable-type="html">
  <h1>Placeholder</h1>
</article>
```

For Liferay Portal 7.3 GA2 and below, use this syntax:

```html
<lfr-editable type="html" id="text1">
  <h1>Placeholder</h1>
</lfr-editable>
```

## Including Widgets Within A Fragment

Each widget has a registered name and corresponding `lfr-widget-[name]` tag, which you must use to embed it in a fragment. For example, the Menu Display widget is registered as `nav`, so its tag is `<lfr-widget-nav />`. You can embed it in a block like this:

```html
<div class="nav-widget">
    <lfr-widget-nav>
    </lfr-widget-nav>
</div>
```

These are the widgets that can be embedded and their accompanying tags:

| Widget Name                | Tag                              |
|----------------------------|----------------------------------|
| DDL Display                | `<lfr-widget-dynamic-data-list>` |
| Form                       | `<lfr-widget-form>`              |
| Asset Publisher            | `<lfr-widget-asset-list>`        |
| Breadcrumb                 | `<lfr-widget-breadcrumb>`        |
| Category Filter            | `<lfr-widget-categories-nav>`    |
| Flash                      | `<lfr-widget-flash>`             |
| Media Gallery              | `<lfr-widget-media-gallery>`     |
| Menu Display               | `<lfr-widget-nav>`               |
| Polls Display              | `<lfr-widget-polls>`             |
| Related Assets             | `<lfr-widget-related-assets>`    |
| Site Map                   | `<lfr-widget-site-map>`          |
| Tag Cloud                  | `<lfr-widget-tag-cloud>`         |
| Tag Filter                 | `<lfr-widget-tags-nav>`          |
| Web Content Display        | `<lfr-widget-web-content>`       |
| RSS Publisher (Deprecated) | `<lfr-widget-rss>`               |
| Iframe                     | `<lfr-widget-iframe>`            |

### Enabling Embedding for Your Widget

If you have a custom widget that you want to embed in a fragment, you can configure that widget to be embeddable. To embed your widget, it must be an OSGi Component. Inside the `@Component` annotation for the portlet class you want to embed, add this property:

```properties
com.liferay.fragment.entry.processor.portlet.alias=app-name
```

When you deploy your widget, it's available to add. The name you specify in the property must be appended to the `lfr-widget` tag like this:

```markup
<lfr-widget-app-name>
</lfr-widget-app-name>
```

```{note}
According to the W3C HTML standards, custom elements can't be self-closing. Therefore, even though you can't add anything between the opening and closing `<lfr-widget...>` tags, you can't use the self-closing notation for the tag.
```

## Localizing Fragment Configurations

> Available: Liferay DXP/Portal 7.4+

You can localize fragment configuration for a page's target language. For example, on a button fragment you can define one button type when the page language is en-US, and a different button type when the page language is es-ES. To localize a fragment configuration field, use the `localizable` attribute.

```{note}
The `localizable` attribute is not available for fragment configuration fields where the `configurationRole` property is set to `style`. 
```

In the following code excerpt, the button fragment configuration sets the `localizable` attribute to `true` for the `fields` section under `fieldSets`. The `localizable` attribute is set at the field level. In the example, there is only one `buttonType` field. If you have a fragment with multiple fields, you can set the `localizable` attribute for each one:

```markup
"fieldSets": [
  {
    "fields": [
      {
        "dataType": "string",
        "defaultValue": "primary",
        "label": "type",
        "name": "buttonType",
        "type": "select",
        "localizable": true,
        "typeOptions": {
          "validValues": [
            {
              "value": "primary"
            },
            {
              "value": "secondary"
            },
            {
              "value": "link"
            },
            {
              "value": "outline-primary"
            },
            {
              "value": "outline-secondary"
            }
          ]
        }
      }
    ]
  }
```

You can use this sample code to change the button type depending on the page's target language. In the following example, the _Contact Us_/_Contacto_ button fragment sets the `localizable` attribute to `true` for the `buttonType` field. The example uses this attribute to configure the _Primary_ button type when the page uses the en-US language (A) and the _Outline Primary_ type when the page uses es-ES (B).

![Localizable elements in the fragment show the flag icon under the General tab and support different configurations for different languages.](./fragment-specific-tags-reference/images/04.png)

```{tip}
The flag icon under the fragment's General settings indicates the configuration field as localizable. 
```

Fragments with the `localizable` attribute that do not specify a custom configuration for a language use the default page language's configuration.

## Additional Information

- [Fragments Toolkit Command Reference](./fragments-toolkit-command-reference.md)
- [Page Fragment Editor Interface Reference](./page-fragment-editor-interface-reference.md)
- [Fragment Configuration Types Reference](./fragment-configuration-types-reference.md)
