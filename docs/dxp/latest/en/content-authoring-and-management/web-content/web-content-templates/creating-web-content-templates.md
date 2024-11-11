---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 4963c6cc-80ff-4e9e-886a-863578e3a24a
---

# Creating Web Content Templates

Web content templates use the FreeMarker Template Language (FTL) to determine how content fields are rendered on a page. Each template can be associated with a [web content structure](../web-content-structures/creating-web-content-structures.md), or even [embedded in other templates](./embedding-widgets-in-web-content-templates.md#embedding-other-templates).

!!! important
    Grant permission to Create or Edit templates in FreeMarker to trusted users only. See [Assigning Permissions to Web Content Structures and Templates](../web-content-structures/assigning-permissions-to-web-content-structures-and-templates.md#security-considerations-for-web-content-templates) for information about web content templates security.

## How to Create a Web Content Template

1. Open the *Site Menu* (![Site Menu](../../../images/icon-menu.png)), and go to *Content & Data* &rarr; *Web Content*.

1. Select the *Templates* tab, and click *New* to create a new web content template.

1. Enter a title for your new template.

1. Optionally, you can determine these configurable [template properties](#configurable-template-properties):

   ![Optionally, determine template settings in the Properties panel.](./creating-web-content-templates/images/01.png)

1. Add FreeMarker code to your template via the script window, or by clicking on *Choose File* to select an existing `.ftl` script file to import.

   When manually entering code in the script window, you can quickly access standard variables in the Template panel. If you've selected a structure for your template, you can also access variables for its specific fields, as well as the *Friendly URL* variable.

   You can then add HTML or additional FreeMarker code to your template's script.

   ![Access standard variables in the Template panel, as well as variables specific to your selected structure.](./creating-web-content-templates/images/02.png)

1. Click *Save* when finished or *Save and Continue* to save your progress and continue editing.

   !!! important
       Once your template is linked with a structure and saved, you can no longer change this template's properties.

   When saved, DXP automatically generates a DDM Template Key, URL, and WebDAV URL for your template, which you can view in its Properties panel.

   ![DXP automatically generates a DDM Template Key, URL, and WebDAV URL for your template.](./creating-web-content-templates/images/03.png)

Once you've created a template, you can [use it for web content articles](../web-content-articles/creating-web-content-articles.md) created with its linked structure or [embed it in other templates](./embedding-widgets-in-web-content-templates.md#embedding-other-templates), depending on its configuration. You can also edit your template at any time.

!!! note
    Changes in a structure may require changes in associated templates. For example, if a structure field name referenced in a template is renamed or removed, the template's reference must be updated manually.

## Configurable Template Properties

While creating a template, you can optionally determine the following template settings in the Properties panel:

- **Structure**: Use the Structure field to link your template with an existing web content structure, or leave this field blank to create a generic template that can be embedded in other web content templates.

- **Description**: Use the Description field to provide localized descriptions of your template.

- **Cacheable**: By default, new templates are cacheable. Uncheck this property if dynamic behavior is needed (e.g., [taglibs](./using-taglibs-in-web-content-templates.md), request handling, and CMS query API).

- **Featured Image**: Select a featured image for your template via URL or from your device.

## Choosing a Template

Web content templates and [information templates](../../../site-building/displaying-content/using-information-templates.md) both use FreeMarker as the templating language to structure and display content. However, they have different use cases and apply to different content types.

Consider these key differences to choose the template best suited to your content type and functionality.

### Information templates

Information templates are versatile and support multiple asset types, including web content, collections, documents, and custom assets. However, each information template is limited to a single type or subtype, so a template designed for one type/subtype cannot be applied to another.

For example, an information template created for a web content structure cannot be used with document types. However, you can apply a general information template created for assets to both web content structures and documents, as both are considered assets.

In this case, you can access only fields common to both assets, not specific fields for the types. Additionally, information templates are limited to common fields supported by the Information Framework (e.g., `checkbox` (simple and multiple), `date`, `link to layout`, `numeric`, `text`, and `rich text`).

Information templates can be used with collection items, but they apply to each item individually, so you can't style the entire collection with a single template.

### Web Content templates

Web content templates work specifically with web content items. They support custom web content structures and are tailored for displaying content with complex structures.

Unlike information templates, which are limited to common fields and fields supported by the Information Framework, web content templates provide access to all structure fields, including advanced types like `grids`, `geolocation`, and `field groups`.

Web content templates are not suitable for use with collections of assets. They are intended for individual web content structures, allowing full customization of the fields within each structure.

## Related Topics

- [Creating Web Content Structures](../web-content-structures/creating-web-content-structures.md)
- [Creating Web Content Articles](../web-content-articles/creating-web-content-articles.md)
- [Embedding Widgets in Web Content Templates](./embedding-widgets-in-web-content-templates.md)
