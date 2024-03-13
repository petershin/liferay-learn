---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: c423446a-0ecb-4cf4-b455-93be58860e71
---
# Filtering and Sorting Web Content Articles

!!! important
    Some features are currently behind release feature flags (LPS-194763 and LPS-196768). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

The web content application shows a list of all the web content articles you can access under the Web Content tab. The filtering and sorting options help you find and review items faster.

![You can filter web content articles from the web content application and order the articles to get a more precise result](./filtering-and-sorting-web-content-articles/images/01.png)

When viewing all assets, assets in a specific folder, assets resulting from a web content search, or in the Web Content view of an Asset Library, you can use four different filter and sort options. In addition, as of Liferay 7.4 2024.Q1+, you can filter web content articles through highlighted web content structures and search for keywords only in the title, comments, or all fields:

- {bdg-secondary}`Liferay 7.4 2024.Q1+` [Filter by Highlighted Web Content Structure](#filter-by-highlighted-web-content-structure)
- [Filter by Navigation](#filter-by-navigation)
- [Filter by Status](#filter-by-status)
- [Filter by Type](#filter-by-type)
- [Order by](#order-by)
- {bdg-secondary}`Liferay 7.4 2024.Q1+` [Filter Search Results](#filter-search-results)

You can combine (single or multiple) filters and order your results for an enhanced experience. For example, if you select the `Product Advertisement Blog Post` [highlighted structure](#filter-by-highlighted-web-content-structures), the [Mine](#filter-by-navigation), [Draft](#filter-by-status), [order by Title](#order-by), and the [Ascending order](#order-by) filters, you obtain a list of your articles that use the `Product Advertisement Blog Post` web content structure, are in Draft status, and are ordered by title in ascending alphabetical order.

!!! note
    (**Breaking Change**) All filtering options apply exclusively to the current folder. Web content articles located elsewhere are not included in the filtered results.

    If you initiate a new search, the filters reset, and the search extends to all assets in the folder.

<!-- folder or highlighted structure. Add this information once the feature is not under a feature flag anymore. -->

## Filter by Highlighted Web Content Structure

{bdg-secondary}`Liferay 7.4 2024.Q1+`

!!! important
    This feature is currently behind a release feature flag (LPS-194763). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

You can select web content structures and see only web content articles that belong to those selected structures. To choose which structures to highlight,

1. Open the *Site Menu* (![Site Menu](../../../images/icon-menu.png)), expand *Content & Data*, and click *Web Content*.

1. Click *Options* (![Options icon](../../../images/icon-options.png)) at the top right corner and select *Configuration*.

1. Under Settings, select *Structures* and click *Select* to choose structures to highlight.

   ![In the Configuration menu, select the structures you want to  highlight](./filtering-and-sorting-web-content-articles/images/02.png)

1. Select the structures you want to highlight and click *Add*.

With the highlighted structures selected, a menu appears on the left with the Content Library option and the selected structures under the Highlighted Structures section.

The Content Library option shows all web content articles and their folder hierarchy whereas the highlighted structure shows all articles using that specific structure regardless of folder hierarchy.

![View all web content articles within their folder structure or filter articles by selecting the highlighted structure.](./filtering-and-sorting-web-content-articles/images/03.gif)

## Filter by Navigation

When you filter by navigation, you filter the web content articles you have permission to view in the selected folder.

{bdg-secondary}`Liferay 7.4 2024.Q1+` You can apply a single filter or multiple filters. You can also select multiple categories/tags.
<!-- add the highlighted structure here in addition to the folder -->

| Filter Option                                    | Description                                                                                                                      |
|:-------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| All                                              | All web content articles and folders.                                                                                            |
| Mine                                             | Web content articles authored by the logged-in user.                                                                             |
| Recent                                           | Web content articles that have been modified recently. The [order by](#order-by) option is unavailable with this filter.         |
| Structures                                       | Filters web content articles based on [web content structure](../web-content-structures.md).                                     |
| {bdg-secondary}`Liferay 7.4 2023.Q4+` Categories | Filters web content articles based on [category](../../tags-and-categories/defining-categories-and-vocabularies-for-content.md). |
| {bdg-secondary}`Liferay 7.4 2023.Q4+` Tags       | Filters web content articles based on assigned [tags](../../tags-and-categories/tagging-content-and-managing-tags.md).           |

## Filter by Status

When you filter by status, you filter the web content articles you have permission to view in the selected folder based on their publication status.

| Filter Option                                                 | Description                                                      |
|:--------------------------------------------------------------|:-----------------------------------------------------------------|
| Any                                                           | All web content articles, regardless of publication status.      |
| Draft                                                         | All web content articles that have been saved but not published. |
| {bdg-secondary}`Liferay 7.4 2023.Q4+/Portal GA102+` Approved  | All web content articles with Approved status.          |
| {bdg-secondary}`Liferay 7.4 2023.Q4+/Portal GA102+` Expired   | All web content articles with Expired status.           |
| {bdg-secondary}`Liferay 7.4 2023.Q4+/Portal GA102+` Scheduled | All web content articles with Scheduled status.         |

With the Approved, Expired, and Scheduled filters, you can select the [*Versions* filter](#filter-by-type) to see all article's versions with the selected status.

!!! note
    (**Breaking Change**) Prior to Liferay 7.4 2024.Q1+/Portal GA112+, the Approved, Expired, and Scheduled filters were called With Approved/Expired/Scheduled Versions and returned any web content with at least one version in the selected status.

## Filter by Type

When you filter by type, you filter the web content articles you have permission to view in the selected folder and choose to view all versions or only the last versions of the web content articles.

| Filter Option                                     | Description                            |
|:--------------------------------------------------|:---------------------------------------|
| {bdg-secondary}`Liferay 7.4 2024.Q1+` Web Content | Web content articles' latest versions. |
| {bdg-secondary}`Liferay 7.4 2024.Q1+` Versions    | All web content articles' versions.    |

## Order by

These options sort the screen content based on the selected criteria. You can use these after using one of the content filters to organize the filter results.

| Filter Option                                    | Description                                               |
|:-------------------------------------------------|:----------------------------------------------------------|
| Display Date                                     | Sorts web content articles by the last display date.      |
| Modified Date                                    | Sorts web content articles by the last modification date. |
| Title                                            | Sorts web content articles alphabetically.                |
| {bdg-secondary}`Liferay 7.4 2024.Q1+` Ascending  | Sorts the applied filter's result in ascending order.     |
| {bdg-secondary}`Liferay 7.4 2024.Q1+` Descending | Sorts the applied filter's result in descending order.    |

## Filter Search Results

Once you use the search bar to search for specific keywords, use these options to further enhance your search results.

| Filter Option | Description                                                             |
|:--------------|:------------------------------------------------------------------------|
| All Fields    | Searches for the keywords in all fields of web content articles.        |
| Title Only    | Searches for the keywords only in the titles of web content articles.   |
| Comments      | Searches for the keywords only in the comments of web content articles. |

![You can search for keywords in all fields, only in the title, or in the comments of web content articles to make your search process even more accurate.](./filtering-and-sorting-web-content-articles/images/04.png)

## Related Information

- [Adding a Basic Web Content Article](./adding-a-basic-web-content-article.md)
- [Understanding Web Content Structures](../web-content-structures/understanding-web-content-structures.md)
- [Creating Web Content Templates](../web-content-templates/creating-web-content-templates.md)
