---
taxonomy-category-names:
- Sites
- Display Page Templates
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 203429af-623b-4ad7-b5b1-0ffd147c7e06
---
# Creating and Managing Display Page Templates

{bdg-secondary}`Liferay DXP/Portal 7.3+`

Display page templates define structures for displaying content at a dedicated friendly URL. These templates currently support the following content types:

* [Blog Entries](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [Categories](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`7.4+`
* [Custom Objects](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`7.4+`
* [Documents](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [Web Content Articles](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

See [Using Display Page Templates](../using-display-page-templates.md) to learn more.

## Creating a Display Page Template

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and click *Design* &rarr; *Page Templates*.

1. Click the *Display Page Templates* tab and click *Add* (![Add Button](./../../../images/icon-add.png)).

1. Enter a *Name* for your template and select a *Content Type* and *Subtype*, if applicable. Then click *Save*.

   ![Select the content type and subtype for your new template.](./creating-and-managing-display-page-templates/images/01.png)

1. Design the template using the same interface and page elements as [content pages](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md).

1. Once you've added page elements, you can [map](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) them to content structure fields (e.g., title, description) by double-clicking on an editable field. Mapped fields are outlined in purple.

   ```{tip}
   You can use mapped fields when configuring SEO and Open Graph settings for a display page template. See [Configuring SEO and Open Graph](./configuring-seo-and-open-graph.md) for more information.
   ```

   ![Map page elements to structure fields.](./creating-and-managing-display-page-templates/images/02.png)

1. Before publishing, you can preview your editable fields mappings with existing content using the [preview function](#previewing-the-display-page-template-content-mappings) (available 7.4+).

1. When finished, click *Publish* to save your work.

You can now use the template to [display your content](./publishing-content-with-display-pages.md).

### Setting a Friendly URL for the Display Page Template

{bdg-secondary}`Liferay 2023.Q4+/GA106+`

You can set a friendly URL for your display page template. The friendly URL is used when the display page template is not marked as default or when it is manually selected for use.

For example, when you link a button in a content page to a mapped URL, you can select an object connected to a display page template as the item and select the display page template as the field. In this case, the friendly URL is used for the selected display page template.

![Set a friendly URL for your display page template](./creating-and-managing-display-page-templates/images/03.png)
![The friendly URL is used when you select a display page template specifically from a list of links](./creating-and-managing-display-page-templates/images/04.png)

To set a friendly URL for your display page template,

1. While editing your display page template, click *Options* (![Options icon](../../../images/icon-options.png)) at the top right corner of the page.

1. Select *Configure*.

1. Under the General section, define your friendly URL.

1. Click *Save*

### Mapping Links to Different Display Page Templates

```{important}
This feature is currently behind a release feature flag. Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.
```

If a content type (e.g., custom object, web content article, or blogs entry) more than one display page template, you can map links to any available template for that content type.

For example, you can create different display page templates for an object, each corresponding to a step in a mapped form (e.g., submission, editing, and approval). Then, you can choose which display page template to use for each stage, enabling the creation of multi-step forms.

![Map links to different display page templates](./creating-and-managing-display-page-templates/images/05.png)

This gives you more freedom when dealing with objects and [forms mapped from objects](../../../building-applications/objects/using-fragments-to-build-forms.md) with multiple steps.

### Previewing the Display Page Template Content Mappings

{bdg-secondary}`7.4+`

While editing, Liferay provides two ways to preview display page templates with content items.

From the Application Menu, you can click the *Preview With* drop-down menu and choose a content item. If no item appears, click *Select Other Item* and browse for the desired content. This dynamically populates the template with content data according to your field mapping.

![Choose the content you want to use to preview your display page template.](./creating-and-managing-display-page-templates/images/06.png)

Alternatively, from the display page template editor, click the *Options* menu(![Options menu](../../../images/icon-options.png)) button at the top right corner and choose *Preview in a New Tab*.

## Viewing Display Page Template Usage

{bdg-secondary}`7.4+`

You can manage the different display page templates using the *Actions* menu (![Actions](../../../images/icon-actions.png)). From here, the *View Usages* option provides a list of content that uses a specific display page template other than the default template. This option is not available for default templates.

![Managing your display page template using the Actions menu](./creating-and-managing-display-page-templates/images/07.png)

Before you delete a display page template that is in use, you have two ways to unassign the display page template from the content:

* Assign to Default: Your content is unassigned from the current display page template and assigned to the default display page template for the content type and subtype (if applicable.)
* Unassign: Your content is not assigned to any display page template.

Follow these steps to view your display page template usage and unassign your content:

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Page Templates*.

1. Click the *Display Page Templates* tab.

1. Click the display page template's *Actions* menu (![Actions](../../../images/icon-actions.png)) and select *View Usages*.

1. Select one or more elements from the list of content using the display page template.

1. Click the *Actions* menu (![Actions](../../../images/icon-actions.png)) in the top-right corner and select *Assign to Default* or *Unassign*.

1. Click *OK*.

If you assign your content to a new display page template, make sure the content appears as expected. To preview and display your content, see [Publishing Content with Display Pages](./publishing-content-with-display-pages.md).

## Related Topics

[Publishing Content with Display Pages](./publishing-content-with-display-pages.md)

[Configuring SEO and Open Graph](./configuring-seo-and-open-graph.md)

[Using Content Pages](./../../creating-pages/using-content-pages.md)

[Adding Elements to Content Pages](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
