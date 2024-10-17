---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
uuid: d9770501-7a33-41c2-98b0-c76c95efd662
---

# Adding Configuration Options to Fragments

{bdg-secondary}`Liferay DXP 7.2 SP1`

Configurable options make your fragments flexible, reducing the need to maintain many similar fragments. For example, instead of creating separate fragments for a heading with style A and another for style B, you can create a fragment with configurable heading styles. Learn how to add configuration options to a fragment:

- [Deploy a Configurable Fragment](#deploy-a-configurable-fragment)
- [Examine the Configuration](#examine-the-configuration)
- [Modify the Configuration](#modify-the-configuration)
- [Propagate the Changes and Test](#propagate-the-changes-and-test)
- [Related Information](#related-information)

!!! note
    For Liferay DXP 7.4+, fragment collections are called fragment sets in the Liferay UI.

## Deploy a Configurable Fragment

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to deploy an example to see how fragment configuration options work:

1. Download and unzip the [example fragment set](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-c7f8.zip):

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-c7f8.zip -O
   ```

   ```bash
   unzip liferay-c7f8.zip
   ```

<!-- The fragments toolkit was deprecated. I decided to remove the instructions that used it. Eric -->

1. [Import the fragment manually](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md).

1. Verify the fragment set is available. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*. The set should appear in the list.

   ![Verify the set is available.](./adding-configuration-options-to-fragments/images/01.png)

   !!! note
       For Liferay DXP 7.1 and 7.2, navigate to *Site* &rarr; *Site Builder* &rarr; *Page Fragments* under the Product Menu to get to the fragments page.

1. Go to a content page and click *Edit* (![Edit icon](../../../images/icon-edit-pencil.png)) to begin editing.

1. Expand the *C7F8 Set* heading in the [Fragments and Widgets panel](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md#fragments-and-widgets) and drag the *C7F8 Card* fragment onto the page.

1. Select the *C7F8 Card* on the page to open the *Fragment Configuration Menu*. In the General tab, set the component's text style to dark or light.

   ![Configurable fragments provide options to modify the fragment's look and feel.](./adding-configuration-options-to-fragments/images/02.png)

Great! You successfully imported and configured a configurable Fragment.

## Examine the Configuration

You can edit a fragment's configuration options in Liferay's built-in [Fragments Editor](./using-the-fragments-editor.md) or in a text file.

**Using the Fragments Editor:** In the UI, edit the fragment with the [Fragments Editor](./using-the-fragments-editor.md) and select the *Configuration* tab. The fragment's configuration appears in the editor.

**Editing a Fragment Configuration File:** If you don't have the fragment files, export them from the fragment by opening the fragment's actions menu and clicking *Export*. The `configurationPath` field (optional) in a fragment's `fragment.json` file specifies the configuration `.json` file. If it doesn't have a configuration file, create one and set the `configurationPath` field to the configuration file name.

Open the example's `fragment.json` file to determine the fragment's configuration file.

```json
{
   "configurationPath": "index.json",
   "cssPath": "index.css",
   "htmlPath": "index.html",
   "jsPath": "index.js",
   "name": "C7F8 Card",
   "type": "component"
}
```

The `"configurationPath": "index.json"` property indicates this fragment's configuration file is `index.json`.

Open the configuration file.

```json
{
   "fieldSets": [
      {
         "fields": [
               {
                  "dataType": "string",
                  "defaultValue": "dark",
                  "label": "Text Style",
                  "name": "c7f8TextStyle",
                  "type": "select",
                  "typeOptions": {
                     "validValues": [
                           {
                              "value": "dark"
                           },
                           {
                              "value": "light"
                           }
                     ]
                  }
               }
         ],
         "label": "C7F8"
      }
   ]
}
```

The configuration file above, specifies a selector for applying a *dark* or *light* text style to the fragment. The configuration has a field named `c7f8TextStyle`. The field's `type` is `select`, which makes it a selector component. See [Fragment Configuration Types](../reference/fragments/fragment-configuration-types-reference.md) for details.

The selector's valid values are `dark` or `light`. The `"dataType": "string"` property means that the selector operates on string data. This selector is a part of a field set labeled *C7F8* (the label is optional).

In the UI, this selector is found in the fragment's configuration section labeled *C7F8*. The selector is labeled `Text Style` per the field's `label` property. The figure below shows the selector.

![Here is the selector for the C7F8 card fragment](./adding-configuration-options-to-fragments/images/03.png)

!!! warning
    The Fragments Editor doesn't save the configuration until it's valid. Make sure your JSON configuration is valid before previewing it.

The configuration values selected by the user are made available to the HTML through the FreeMarker context. They are referenced in the HTML with the notation `${configuration.fieldName}`. The example (`${configuration.textAppliedStyle}`) returns `dark` or `light` depending on the configuration value selected by the user, setting the CSS class to `text-light` or `text-dark`:

```html
<div class="component-c7f8-card">
   <div class="card">
      <img
         class="card-img-top"
         data-lfr-editable-id="01-image"
         data-lfr-editable-type="image"
         src="https://clayui.com/images/home/lexicon_symbol.svg"
      />

      <div class="card-body">
         <h5
               class="card-title text-${configuration.c7f8TextStyle}"
               data-lfr-editable-id="02-title"
               data-lfr-editable-type="rich-text"
         >
               Editable Card Title
         </h5>

         <p
               class="card-text text-${configuration.c7f8TextStyle}"
               data-lfr-editable-id="03-text"
               data-lfr-editable-type="rich-text"
         >
               Here is some editable text.
         </p>

         <a
               class="btn btn-primary"
               data-lfr-editable-id="04-label"
               data-lfr-editable-type="link"
               href="#"
         >
               Editable Link
         </a>
      </div>
   </div>
</div>
```

The example demonstrates a select configuration. See the [Configuration Types Reference](../reference/fragments/fragment-configuration-types-reference.md) for a complete list of the available fragment configuration types.

## Modify the Configuration

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*.

   !!! note
       For Liferay DXP 7.1 and 7.2, instead navigate to *Site* &rarr; *Site Builder* &rarr; *Page Fragments* under the Product Menu to get to the fragments page.

1. Select the *C7F8 Set*, click *Actions* (![Actions Icon](../../../images/icon-actions.png)) for the C7F8 Card and select *Edit*. This opens the Fragments Editor.

1. Select the *Configuration* tab and update the configuration with a checkbox field to hide/show the card's description. Insert this code on a new line after the `c7f8TextStyle` field's closing brace and comma (`},`)

   ```json
   {
      "name": "showDescription",
      "label": "Show Description",
      "description": "show-description",
      "type": "checkbox",
      "defaultValue": true
   }
   ```

   !!! tip
       You can add a `configurationRole` value to the field set (alongside the `fields` object in the JSON) to specify which tab the associated fields appear in. Set the value as `styles` to make the fields appear in the Styles tab, or set it to `advanced` to make them appear in the Advanced tab (*only in Liferay DXP versions U23+ or GA23+*). If no `configurationRole` is set, then they appear in the General tab by default.

1. Go back to the *HTML* pane in the *Code* tab and wrap the paragraph element with a conditional statement to check for the checkbox's value. Click *Publish* to apply the changes.

   ```html
   [#if configuration.showDescription]
   <p data-lfr-editable-id="03-card-text" data-lfr-editable-type="rich-text"
   class="card-text text-${configuration.textAppliedStyle}">
      Here is some editable text.
   </p>
   [/#if]
   ```

!!! note
    You can also access the configuration's value through the JavaScript with the syntax `const configurationValue = configuration.textAppliedStyle;`.

## Propagate the Changes and Test

Now you can test the updates.

1. Propagate the changes so they're reflected on the Content Page. Click *Actions* (![Action Icon](../../../images/icon-actions.png)) for the C7F8 Card and select  *View Usages*.

1. Check the box for the Content Page and click the (![propagate button](../../../images/icon-propagate.png)) button.

   ![Configurable fragments provide options to modify the fragment's look and feel.](./adding-configuration-options-to-fragments/images/04.png)

1. Go back to the Content Page and once again click the (![Edit icon](../../../images/icon-edit-pencil.png)) icon to edit the Content Page.

1. Select the *C7F8 Card* again to show the Selection panel on the right.

1. In the *General* tab, check/uncheck the *Show Description* checkbox to show/hide the card's text.

   ![You can have as many configuration options as you want for your fragments.](./adding-configuration-options-to-fragments/images/05.png)

Great! Now you know how to add configuration options to your fragments. For more configuration examples, please see Please see [Fragment Configuration Types](../reference/fragments/fragment-configuration-types-reference.md).

## Related Information

- [Auto-deploying Fragments](./auto-deploying-fragments.md)
- [Best Practices for Using Fragment Configurations](./best-practices-for-using-fragment-configurations.md)
- [Including Default Resources with Fragments](./including-default-resources-with-fragments.md)
- [Fragment Configuration Types Reference](../reference/fragments/fragment-configuration-types-reference.md)
