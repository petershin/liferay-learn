---
uuid: 203429af-623b-4ad7-b5b1-0ffd147c7e06
---
# Creating and Managing Display Page Templates

{bdg-secondary}`Available Liferay DXP/Portal 7.3+`

Display page templates define structures for displaying content at a dedicated friendly URL. These templates currently support the following content types:

* [Blog Entries](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [Categories](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`Available 7.4+`
* [Custom Objects](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`Available 7.4+`
* [Documents](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [Web Content Articles](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

See [Using Display Page Templates](../using-display-page-templates.md) to learn more.

## Creating a Display Page Template

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and click *Design* &rarr; *Page Templates*.

1. Click the *Display Page Templates* tab.

   ![Go to Page Templates, and click on the display page templates tab.](./creating-and-managing-display-page-templates/images/02.png)

1. Click the *Add* button (![Add Button](./../../../images/icon-add.png)).

1. Enter a *Name* for your template and select a *Content Type* and *Subtype*, if applicable. Then click *Save*.

   ![Select the content type and subtype for your new template.](./creating-and-managing-display-page-templates/images/03.png)

1. Design the template using the same interface and page elements as [content pages](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md).

   ```{important}
   Display page templates inherit the design and theme of public pages. This remains true even if there is no public page created for that particular site.
   ```

   ![Build your template using fragments and widgets.](./creating-and-managing-display-page-templates/images/04.png) 

1. Once you've added page elements, you can [map](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) them to content structure fields (e.g., title, description) by double-clicking on an editable field. Mapped fields are outlined in purple.

   ```{tip}
   You can use mapped fields when configuring SEO and Open Graph settings for a display page template. See [Configuring SEO and Open Graph](./configuring-seo-and-open-graph.md) for more information.
   ```

   ![Map page elements to structure fields.](./creating-and-managing-display-page-templates/images/05.png) 

1. Before publishing, you can preview your editable fields mappings with existing content using the [preview function](#preview-the-display-page-template-content-mappings) (available 7.4+).

1. When finished, click *Publish* to save your work.

You can now use the template to [display your content](./publishing-content-with-display-pages.md).

### Preview the Display Page Template Content Mappings

{bdg-secondary}`Available 7.4+`

While editing, Liferay provides two ways to preview display page templates with content items.

From the Application Menu, you can click the *Preview With* drop-down menu and choose a content item. If no item appears, click *Select Other Item* and browse for the desired content. This dynamically populates the template with content data according to your field mapping.

![Choose the content you want to use to preview your display page template.](./creating-and-managing-display-page-templates/images/07.png) 

Alternatively, from the display page template editor, click the *Actions* menu(![Actions menu](../../../images/icon-actions.png)) button and choose *Preview in a New Tab*.

![Click the Preview button to preview your display page template mappings.](./creating-and-managing-display-page-templates/images/08.png) 

## Viewing Display Page Template Usage

{bdg-secondary}`Available 7.4+`

You can manage the different display page templates using the *Actions* menu (![Actions](../../../images/icon-actions.png)). From here, the *View Usages* option provides a list of content that uses a specific display page template other than the default template. This option is not available for default templates.

![Managing your display page template using the Actions menu](./creating-and-managing-display-page-templates/images/06.png)

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

* [Publishing Content with Display Pages](./publishing-content-with-display-pages.md)
* [Configuring SEO and Open Graph](./configuring-seo-and-open-graph.md)
* [Using Content Pages](./../../creating-pages/using-content-pages.md)
* [Adding Elements to Content Pages](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
