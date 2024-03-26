---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 89efcf46-c68b-42f1-b33e-f41ba46002f2
---
# Adding a Basic Web Content Article

When you have a lot of content to publish on your site, Liferay's content management system helps you with practical and essential ways to manage it. Web content articles can be displayed through [widgets](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md), [fragments](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md), or [display pages](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md).

Each web content article is based on a structure that defines its available fields. Liferay includes the Basic Web Content structure out-of-the-box, but you can create your own. See [Understanding Web Content Structures](../web-content-structures/understanding-web-content-structures.md) for more information.

## Creating a Basic Web Content Article

1. Open the Site Menu (![Site Menu](../../../images/icon-menu.png)) and navigate to *Content & Data* &rarr; *Web Content*.

1. Under the Web Content tab, click *New* and select *Basic Web Content*.

   ![The web content administration page.](./adding-a-basic-web-content-article/images/01.png).

1. Enter a *title* (required) for the new article and add the desired *content* to their respective fields.

   ![The edit screen for a new web content article.](./adding-a-basic-web-content-article/images/02.png)

1. Click *Publish*.

   {bdg-secondary}`Liferay DXP 2024.Q2+` Using the LPD-15596 developer feature flag, two more options show up: Publish with Permissions and Schedule Publications. See [Publish With Permissions and Schedule Publications](#publish-with-permissions-and-schedule-publications) to learn more.

   <!-- I'll adjust this section once the feature is off the feature flag to keep all the information in just one place. For now, I'm dividing it into these sections. -->

Now your new article is created! If it's inside a folder, an interactive path appears for easier navigation.

![An interactive path enables easy file navigation.](./adding-a-basic-web-content-article/images/06.png)

You can now display your web content article on a page using the [Web Content Display widget](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md), for example.

!!! note
    The user who creates the first version of a web content article becomes its owner. If another user edits the content (which creates a new version), ownership isn't transferred.

### Publish With Permissions and Schedule Publications

{bdg-secondary}`Liferay DXP 2024.Q2+`

!!! important
    This feature is currently behind a developer feature flag (LPD-15596). Read [Developer Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) for more information.

While creating the web content, if you click *Publish*, these two options show up: Publish with Permissions and Schedule Publications.

You can confirm the web content article's visibility before publishing it. You can also assign permissions that can be assigned for the item.

1. Click *Publish* and select *Publish with Permissions*.

1. Choose who can view the web content by selecting an option under Viewable by.

   The web content can be viewable by Anyone (Guest Role), Site Members, or the Owner of the content.

1. (Optional) Click *More Options* to view more permissions for the web content. Assign the permissions to Guest users or Site Members.

   Update Discussion, Delete, Permissions, Expire, Delete Discussion, Update, Subscribe, View, and Add Discussion.

1. Click *Publish*.

You can also schedule your web content's publication to a future date.

1. Click *Publish* and select *Schedule Publication*.

1. Select the Date and Time when your content will be published. Notice that the UTC standard is used as a reference.

1. While setting up a future time, you can also choose who can view the web content and define permissions for users.

## Previewing Web Content Articles

You can preview your content using the selected default template or display page template before publishing, so you can make adjustments to ensure your content appears as intended to users.

### Previewing a Web Content Article Using a Template

1. In the properties tab, select a template to preview the web content article.

1. Click *Preview* ( ![Preview](../../../images/icon-preview.png) ).

   ![The default template has a preview button that looks like an eye.](./adding-a-basic-web-content-article/images/04.png)

!!! note
    Only web content articles that have been published or saved as a draft can be previewed.

### Previewing a Web Content Articles Using a Display Page

You can preview web content using a display page template from any site or asset library.

1. In the properties tab, select a site and display page to preview the web content article.

1. Click*Preview* ( ![Preview](../../../images/icon-preview.png) ).

   ![When you've selected a display page template, use the preview button in the properties tab.](./adding-a-basic-web-content-article/images/05.png)

!!! note
    Selecting the Preview button saves a draft of the web content article before displaying the preview.

## Properties Tab

When creating or editing a Basic Web Content article, the following options appear in the sidebar menu's Properties tab:

| **Property** | **Purpose** | **Additional Notes** |
| :--- | :--- | :--- |
| **Basic Information** | See basic information about the article including the web content structure it is based on, version and status, ID, and a short editable description. | The structure cannot be edited once the article is created. See [Web Content Structures](../web-content-structures/understanding-web-content-structures.md) for more information. |
| **Default Template** | Select a default template to display this web content. | See [Creating Web Content Templates](../web-content-templates/creating-web-content-templates.md) for more information. |
| **Display Page Template** | Select a Display Page Template for this article, if one is desired. | See [Creating and Managing Display Page Templates](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) for more information. |
| **Featured Image** | Select a small image to use as the article's thumbnail. | The image can come from a URL, uploaded from your system, or from files located in Documents and Media. |
| **Categorization** | Set any public or private categories, tags, or priority for the article. | See [Tagging Content](../../tags-and-categories/tagging-content-and-managing-tags.md) and [Organizing Content with Categories and Tags](../../tags-and-categories/organizing-content-with-categories-and-tags.md) for more information. |
| **Friendly URL** | Set a custom friendly URL for this article. | |
| **Schedule** | Schedule a date to display or expire the article, if desired. | See [Scheduling Web Content](./using-expiration-and-review-dates-in-web-content.md) for more information. |
| **Search** | Set whether this article will be indexed for search. | |
| **Related Assets** | Select any related assets, if desired. | |

## Related Topics

- [Creating and Managing Display Page Templates](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)
- [Introduction to Web Content Structures](../web-content-structures/understanding-web-content-structures.md)
- [Filtering and Sorting Web Content Articles](./filtering-and-sorting-web-content-articles.md)
