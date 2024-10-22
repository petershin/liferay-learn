---
toc:
  - ./managing-content-in-content-pages/managing-content-in-content-pages-for-liferay-73-and-earlier-versions.md
taxonomy-category-names:
- Sites
- Content Pages
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 26a907e5-c7ed-4110-813f-779eacd72917
---

# Managing Content in Content Pages

<!-- Alt: Managing Content in Pages and Templates... If renamed, relocate to Displaying Content.-->

When working on content pages or templates, you can easily view and manage documents, web content articles, collections, and inline text added to them. To access these options, click *Page Content* (![Page content icon](../../../images/icon-paperclip.png)) in the editing sidebar.

![Open the browser panel and click the page content tab.](./managing-content-in-content-pages/images/01.png)

The page content panel displays all content added via fragments or supported widgets (e.g., Asset Publisher and Web Content Display), including content directly added to fragments or mapped to fragment elements.

!!! important
    Content displayed in an Asset Publisher widget using dynamic or collection selections is not listed in the Page Content tab. Additionally, background images (except for Container background images) are not included.

You can filter content by type (e.g., web content, documents, collection, or inline text) and perform the following content management actions.

- Web Content Articles and Documents: Click *Actions* (![Actions button](../../../images/icon-actions.png)) for the desired asset and choose from the following options.

    - *Edit*: Edit the selected asset in its own application context (i.e., Web Content or Documents and Media).
    - *Edit Image* (for documents): Crop or rotate the image.
    - *Permissions*: Edit permissions for the asset by user role.
    - *View Usages*: View all uses of the asset in site pages, page templates, and display page templates.

- Collections: Click *Actions* (![Actions button icon](../../../images/icon-actions.png)) for the desired collection and choose an option. Available options depend on whether the collection was defined manually or dynamically by a collection provider. Manually defined collections include all options below, while dynamic collections only offer the View Items option.

    - *Edit*: Edit the collection in its native application context.
    - *View Items*: View all items included in the collection. This opens a modal window where you can choose to edit each item or view it in its display page.
    - *Add Items*: Add items to the collection.
    - *Permissions*: Edit permissions for the collection by user role.

- Inline Text: Click *Edit* (![Edit button](../../../images/icon-edit.png)) next to the desired text to begin editing it directly in the page or template. This includes both simple and rich text fragments. When editing rich text, you can highlight text to access additional formatting options.

!!! note
    Editing inline text requires the Edit Inline Content permission.

## Related Topics

- [Using Content Pages](../using-content-pages.md)
- [Adding Elements to Content Pages](./adding-elements-to-content-pages.md)
- [Configuring Fragments](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)
