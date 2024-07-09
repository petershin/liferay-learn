---
taxonomy-category-names:
- Platform
- Staging
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 1fe6f487-899f-4d93-b472-9e37f9597409
---

# Page Versioning

With Page Versioning enabled, you and your team can work in parallel on multiple versions of your site's widget pages. These versions are called *variations*, which are you create and manage via the Staging bar. Page versioning maintains a history, and you can revert changes made to your staged pages to earlier versions if needed.

!!! note
    Staging only supports variations and page history for widget pages. For content page versioning, use Publications. See [Comparing Publishing Tools](../comparing-publishing-tools.md) for more information.

Enable page versioning during initial page setup or anytime afterward via the Staging Configuration page. Once enabled, you can create, merge, and publish variations for individual pages or groups of pages. You can also manage variation permissions for different user roles.

!!! important
    If you use page versioning and later disable it, the history of page versions is removed and only the latest published page versions are preserved. This is true for both Local Live and Remote Live Staging.

## Types of Variations

Staging provides two types of variations:

-  **Site Pages Variation**: Group changes for multiple site pages into a single variation.

-  **Page Variations**: Create variations of an individual page. They are created within site pages variations.

   !!! note
       When you import a widget page to a site with page variations enabled, the page is imported as a new variation of the site page's main variation.

       For content pages, use [Experiences](../../../site-building/personalizing-site-experience/experience-personalization/content-page-personalization.md) to create alternative page versions.

Both variation types only affect pages and do not affect your site's content, since all variations in your staging site share the same content. That said, each variation can use and configure the same content or applications in different ways, and each site pages variation can include different pages.

Also, page metadata is not versioned (e.g., layout type, friendly URL, and page hierarchy). This means changes to metadata are applied to all variations. For example, if a page template is modified, those modifications are propagated to all pages configured to inherit changes from the template.

!!! important
    Page templates are not recognized by the Staging framework. This means that existing page templates are not viewable or editable on a staged site. If they're created on a staged site, they are lost if staging is disabled.

## Creating Variations

1. Click the *Actions* button ( ![Actions button](../../../images/icon-actions.png) ) in the Staging bar and select *Site Pages Variation* or *Page Variations*.

   ![Click the Actions button in the Staging bar and select the variation type you want to create.](./page-versioning/images/03.png)

1. Click the *Add* button at the bottom right of the modal window.

   ![Click the Add button at the bottom right of the modal window](./page-versioning/images/04.png)

1. Enter a *name* and *description* for your new variation. You can modify these fields for your variation at any time.

   ![Enter a name and description for your new variation.](./page-versioning/images/05.png)

   For site pages variations, you can select from the following options to determine if your new variation copies pages from existing variations:

   - **All Site Pages Variations**: Copy all pages from existing site pages variations.

   - **None (Empty Site Pages Variation)**: Create a new, empty site pages variation.

   - **[Existing Variations]**: Copy all pages from a single site pages variation.

   ![Determine whether your new site pages variation copies pages from existing variations](./page-versioning/images/06.png)

   !!! note
       If you decide to copy pages from an existing variation, only the latest version marked as ready for publishing is copied.

1. Click *Add* to create your new variation.

Once created, you can switch between each version of a page or group of pages via the drop-down menus in the Staging bar. For more information, see [Site Staging UI Reference](./site-staging-ui-reference.md).

![You can switch between each version of a page or group of pages via the drop-down menus in the Staging bar](./page-versioning/images/02.png)

## Merging Variations

You can merge two site pages variations. This adds all pages and page variations into a site pages variation without affecting or overwriting its content.

1. Click the *Actions* button ( ![Actions button](../../../images/icon-actions.png) ) in the Staging bar, and select *Site Pages Variation*.

   ![Select Site Pages Variation.](./page-versioning/images/07.png)

1. Click the *Actions* button ( ![Actions button](../../../images/icon-actions.png) ) for the variation you want to use as the base for merging, and select *Merge*.

   ![Click the Actions button for the variation you want to use as the base for merging, and select Merge.](./page-versioning/images/08.png)

1. Select the variation you want to merge on top of the base variation.

   ![Select the variation you want to merge on top of the base variation.](./page-versioning/images/09.png)

When two variations of site pages are merged, new pages that don't exist in the base variation are added to it. And if a page exists in both variations, and at least one version of the page is marked as ready for publishing, the latest version marked as ready is added as a new variation for its corresponding page in the base variation. Older variations not marked as ready for publishing are not copied.

## Managing Variation Permissions

You can use permissions to manage user access to variations. See [Managing Staging Permissions](./managing-staging-permissions.md) for more information.

## Related Topics

- [Staging Overview](../staging.md)
- [Configuring Local Live Staging](./configuring-local-live-staging.md)
- [Configuring Remote Live Staging](./configuring-remote-live-staging.md)
- [Site Staging UI Reference](./site-staging-ui-reference.md)
