---
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
When editing or creating content pages and templates, you can quickly view and edit any documents, web content articles, collections, or inline text added to them. To do this, select *Page Content* (![Page content icon](../../../images/icon-paperclip.png)) in the editing sidebar.

![Open the browser panel and click the page content tab.](./managing-content-in-content-pages/images/01.png)

The page content panel shows all content added using fragments and supported widgets (e.g., asset publisher and web content display). This includes content added to fragments directly and those mapped to fragment elements.

```{important}
Contents displayed in an asset publisher using dynamic or collection selection are not listed in the page content tab. Also, background images are not listed, except for Container background images.
```

From here, you can filter content by type (e.g., web content, documents, collection, or inline text) and perform the following content management actions.

* *Web Content Articles* and *Documents*: Click *Actions* (![Actions button](../../../images/icon-actions.png)) for the desired asset and select from the following options.

    * *Edit*: Edit the selected asset in its own application context (i.e., web content or documents and media).
    * *Edit Image* (for documents): Crop or rotate the selected image.
    * *Permissions*: Edit permissions for the asset by user role.
    * *View Usages*: View all uses of the asset in site pages, page templates, and display page templates.

* *Collections*: Click *Actions* (![Actions button icon](../../../images/icon-actions.png)) for the desired collection and select an option. Available options depend on whether the collection display fragment uses a manually defined collection, or one defined dynamically by a collection provider. Manually defined collections include all of the following actions. However, dynamically defined collections only include the View Items option.

    * *Edit*: Edit the collection in its native application context.
    * *View Items*: View all items included in the collection. This opens a modal window where you can choose to edit each item or view it in its display page.
    * *Add Items*: Add items to the collection.
    * *Permissions*: Edit permissions for the collection by user role.

* Inline Text: Click *Edit* (![Edit button](../../../images/icon-edit.png)) for the desired text to begin editing it directly in the page or template. This includes both simple and rich text elements from deployed fragments. While editing rich text elements, you can highlight text to access additional formatting options.

```{note}
Editing inline text requires the edit inline content permission.
```

## For Liferay DXP/Portal 7.3

For Liferay DXP/Portal 7.3, you can review web content deployed using fragments and widgets in the Contents panel (![Contents](../../../images/icon-list-ul.png)).

1. Edit or create a content page, master page template, page template, or display page template.

1. Open the *Contents* panel ( ![Contents panel](../../../images/icon-list-ul.png) ) in the sidebar.

  Content used on the page is listed here, along with how many pages it's used on.

  ```{note}
  Web content that's displayed in an asset publisher with dynamic selection isn't listed in the contents panel. You must manage this content directly from the web content admin app in the control panel.
  ```

1. Open *Actions* (![Actions icon](../../../images/icon-actions.png)) next to the listed content to manage it. These actions are available:

   * *Edit*: Edit the web content.
   * *Permissions*: Update the web content's permissions.
   * *View Usages*: See where the web content is used on the site.

## Related Topics

[Using Content Pages](../using-content-pages.md)

[Adding Elements to Content Pages](./adding-elements-to-content-pages.md)

[Configuring Fragments](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)
