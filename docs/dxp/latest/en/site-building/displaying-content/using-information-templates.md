---
taxonomy-category-names:
- Sites
- Information Templates
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: f8e95a71-2583-4bc4-8774-233c960c325d
---

# Using Information Templates

{bdg-secondary}`Available 7.4+`

With Information Templates, you can create [FreeMarker](https://freemarker.apache.org/) templates for any item type that implements the Info Framework. Supported item types include web contents, documents, assets, blogs, categories, and objects. Once created, you can map fragment fields to your template to determine how an item is rendered in content and display Pages. This can help you implement a consistent style for your site.

!!! important
    Information templates are only available in fragments, not in widgets. To design FreeMarker templates for web content displayed in widgets, use [web content templates](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md). Read [Choosing a Template](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md#choosing-a-template) to learn more about the differences between templates.

## Creating Information Templates

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and go to *Templates* &rarr; *Information Templates*.

1. Click *New*, enter a *name*, select an *Item Type*, and (if applicable) select an *Item Subtype*.

   ![Enter a name and select an Item Type and Item Subtype.](./using-information-templates/images/01.png)

1. Click *Save*. This redirects you to the template design page.

1. (Optional) [Import](#importing-and-exporting-scripts) an existing FreeMarker script from an `.ftl` file.

1. Design your template using FreeMarker.

   You can type `${` in the editor to use the autocomplete feature.

   In the *Elements* side panel (![Elements](../../images/icon-list-ul.png)), you can quickly access available fields from the selected item type's structure.

   ![Design your template using FreeMarker and available fields in the Elements side panel.](./using-information-templates/images/02.png)

   !!! note
       The Elements side panel does not include fields based on templates (e.g., Journal Article templates, Info templates). This is to prevent infinite loops.

1. (Optional) Add a *description* or *image* to the template in the Properties side panel (![Properties](../../images/icon-cog3.png)).

1. Click *Save* when finished.

Once created, Info templates can be used in Content Display fragments and any other fragment with [sub-elements](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) that can be mapped, such as text and rich text. When selected, they determine how an item is rendered in content pages and display page templates.

Liferay's [Headless](../../headless-delivery/using-liferay-as-a-headless-platform.md) API services are available in the template editor through the `restClient` object. See [Calling Headless APIs in the Template Editor](../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md#calling-headless-apis-in-the-template-editor) for usage details.

## Importing and Exporting Scripts

When editing an Info template, you can import and export FreeMarker scripts to reuse in other contexts:

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and go to *Templates* &rarr; *Information Templates*.

1. Select the desired Info Template.

1. Click *Actions* ![Actions Button](../../images/icon-actions.png) in the Application Bar and select *Export Script* or *Import Script*.

   ![Use the Export/Import Script actions to export/import an Info template.](./using-information-templates/images/03.png)

When exporting, the current FreeMarker script is saved as a `script.ftl` file.

When importing, the selected file replaces the template's current FreeMarker script.

## Managing Info Templates

In the Templates application, you can view and manage all existing Info templates. Each existing template appears with its type (e.g., Web Content Article) and sub-type (e.g., Basic Web Content). You can click *Actions* (![Actions Button](../../images/icon-actions.png)) for a template to access the following actions:

| Action      | Description                                                 |
|:------------|:------------------------------------------------------------|
| Edit        | Edit the template.                                          |
| Copy        | Create a new template with the selected template's content. |
| Permissions | Manage basic permissions for the template.                  |
| Delete      | Delete the template.                                        |

![Use the actions menu to access management options.](./using-information-templates/images/04.png)

Here you can also [export](#exporting-templates) and [import](#importing-templates) Info templates as LAR files to share them between sites and environments. To do this, click *Actions* in the Application Bar and select *Export/Import*.

![Export and Import templates as LAR files.](./using-information-templates/images/05.png)

!!! note
    By default, Info template exports include Widget templates. However, you can configure which templates are included in the LAR file.

## Related Topics

- [Creating a Widget Template](../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md)
- [Creating Web Content Templates](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
- [Mapping Web Content Templates to Fragments](../../content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments.md)
