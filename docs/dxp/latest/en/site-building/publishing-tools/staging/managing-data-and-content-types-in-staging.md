---
taxonomy-category-names:
- Platform
- Staging
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: fa9b419d-3b2f-45c7-b641-b6fcbaf0f946
---

# Managing Data and Content Types in Staging

Liferay DXP's Staging tool provides ways to manage available application data and content types both during initial configuration and the publishing process. Because there can be so many relationships between applications and types of content, be sure to consider how they reference each other in your database before deciding to stage or unstage any categories.

!!! important
    Liferay Commerce does not support Staging. During the publishing process, entities from Commerce are not staged.

## Staging Data and Content Types

As part of Staging configuration, you can select which application data and content types are staged. If staged, the selected data and content is managed by your Staging environment, along with all contained entities, and it may not be possible to edit them directly in Live.

![Select which application data and content types are staged.](./managing-data-and-content-types-in-staging/images/01.png)

When working with Staging, you must think about the applications you're using on your site and whether they're appropriate to be staged:

- Unstaged data only exists in the site's Live environment. Staged data exists in both environments.

- Collaborative applications, such as Blogs, Message Boards, and Wikis should not be staged, because posts would not appear on the live site until you publish.

- You can only stage site-scoped content.

- Page-scoped data can only be staged on published pages; its data is published with the page.

- If you have disabled/removed an application from your site but it's still selected in your Staging configuration, it's still published and may appear in aggregation apps like Asset Publisher.

- Asset Publisher on the staged site cannot access data from unstaged apps, because their data exists only on the live site. If your Asset Publisher configuration shows data from both staged and unstaged apps, it doesn't look the same on both your staged and live sites.

**Content Origin for Staged and Unstaged Applications**

| Content Type                      | Staged    | Unstaged | Data Origin Staged | Data Origin Live |
|:----------------------------------|:----------|:---------|:-------------------|:-----------------|
| Collaborative                     |           | &#10004; |                    | &#10004;         |
| Site Scoped                       | &#10004;  |          | &#10004;           |                  |
| Page Scoped Apps                  | &#10004;* |          | &#10004;           |                  |
| Unselected Apps in Staging Config |           | &#10004; |                    | &#10004;         |
| Selected Apps in Staging Config   | &#10004;  |          | &#10004;           |                  |

\* *Only published when the Page is published*

!!! important
    After configuration, users can't change if an application data or content type is staged. This is because staging and unstaging this data and content could cause inconsistencies between Staging and Live environments. To change these settings, you must turn staging off and re-enable it with your new configuration.


## Publishing Data and Content Types

During the publishing process, you can also configure which application data and content types are published from Staging to Live. From the *Advanced* tab of the *Publish to Live* menu, you can view each type with any related data and content it may have.

![Configure which application data and content types are published from Staging to Live.](./managing-data-and-content-types-in-staging/images/02.png)

Here, you can exclude some data and content types during publishing or export to speed up the process.

!!! warning
    Selecting *All* or *Date Range* can make the publishing process take a long time, especially if you have many versions. Instead, publish small incremental changes to avoid large publishing processes that can take a long time to execute.

Click *Change* next to each content type to manage the items and settings included for that type, such as *version history*, *vocabularies*, *previews and thumbnails*, and the *referenced content behavior*

   Choose *Include Always* to always include the referenced content, or *Include If Modified* to include it only when it has been modified.

### Version History

Web content tends to be updated frequently, which can result in a high number of versions and lengthy publishing times. You can choose to not publish the *Version History*. If you disable this, only the last approved version of each web content article is published to Live. This can significantly speed up the publishing process.

By default, Version History is selected for publishing, so you must manually disable this setting to publish only the latest approved version of your web content. To do this, go to *Control Panel* &rarr; *Configuration* &rarr; *System Settings* &rarr; *Web Content* &rarr; *Virtual Instance Scope* &rarr; *Web Content*, and toggle the *Version History by Default Enabled* checkbox.

### Previews and Thumbnails

Previews and thumbnails are generated automatically for documents. However, if your site contains many images or documents, it may be best to disable this feature to increase your publishing speed and limit the amount of disk space used.

Whether you want to publish file previews and thumbnails depends on your environment. Publishing them is a heavy operation, and if you're using remote staging, you must also transfer the LAR file over the network. If you decide to generate previews on the live site, understand that this could take some time, since it's a CPU-intensive operation.

### Vocabularies

When working within a site, you can select vocabularies from both the current site as well as the global site. While this doesn't pose an issue when creating content, it can cause issues when publishing.

For environments that use both global and local vocabularies, note that global vocabularies must be published to the live site through global site staging. One way to avoid vocabulary confusion is to keep all vocabularies local or global. If both must be used, you can resolve the issue by ensuring that dependencies (e.g., categories and vocabularies) are published before publishing the site that depends on them, whether the dependencies are local or global.

!!! note
    Assets like tags, categories, structures, templates, widget templates, document types, and dynamic data lists can also be shared by a parent to its child sites. In this case, ensure that the parent's dependencies are published before the site in question.

### Deletions

The Staging framework gathers deletions (including trashed entities) in a site. These deletions can be published to clean up the live site. If you plan to process it later, or if it's not a problem to have lingering data on Live, this can be turned off as well to save execution time during the process.

## Related Topics

- [Staging Overview](../staging.md)
- [Understanding the Publishing Process](./understanding-the-publishing-process.md)
- [Site Staging UI Reference](./site-staging-ui-reference)
