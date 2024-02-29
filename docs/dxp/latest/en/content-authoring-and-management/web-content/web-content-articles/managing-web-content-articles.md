---
taxonomy-category-names:
- Content Management System
- Web Content and Structures
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: d8d93c4a-64c2-4d5a-b869-06908584f19a
---

# Managing Web Content Articles

Once you've added articles to your web content library, you can manage them via the web content UI. To access management actions for an article, click its *Actions* button (![Actions button](../../../images/icon-actions.png)).

![Click the article's actions button to access configuration options.](./managing-web-content-articles/images/01.png)

| Option                                                                | Description                                                                                                                                                                                                                                              |
|:----------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Edit (![Edit](../../../images/icon-edit.png))                         | Edit the article's content. Note that modifying the article increases its version number, but the ownership remais with the user who created it initially.                                                                                               |
| Preview (![Preview](../../../images/icon-view.png))                   | Show the rendered web content.                                                                                                                                                                                                                           |
| Translate (![Translate](../../../images/icon-translate.png))          | Translate the web content article to the desired language. See [Translating Web Content](../../translating-pages-and-content/translating-web-content.md) for more information.                                                                           |
| Expire (![Expire](../../../images/icon-time.png))                     | Deactivate the web content article.                                                                                                                                                                                                                      |
| Subscribe (![Subscribe](../../../images/icon-subscribe.png))          | Receive notifications on new and modified articles.                                                                                                                                                                                                      |
| View History (![View History](../../../images/icon-date-time.png))    | View web content version history.                                                                                                                                                                                                                        |
| View Usages (![View Usages](../../../images/icon-view-type-list.png)) | View the pages, page templates, and display page templates where the web content article is used.                                                                                                                                                        |
| Make a Copy (![Copy](../../../images/icon-copy.png))                  | Duplicate the web content article. The copy uses the same name with *Copy* appended to the end.                                                                                                                                                          |
| Export for Translation (![Export](../../../images/icon-export.png))   | Export web content for translation as `.xliff` or `.xlf` files. See [Exporting Content for Translation](../../translating-pages-and-content/translating-web-content.md#exporting-content-for-translation) for more information.                          |
| Import Translation (![Import](../../../images/icon-download.png))     | Import the translations together as a `.zip` file or individually as `.xliff` or `.xlf` files. See [Importing Content Translations](../../translating-pages-and-content/translating-web-content.md#importing-content-translations) for more information. |
| Move (![Move](../../../images/icon-move-folder.png))                  | Relocate the article to a different folder.                                                                                                                                                                                                              |
| Permissions (![Permissions](../../../images/icon-permissions.png))    | Manage article permissions for user roles.                                                                                                                                                                                                               |
| Delete (![Delete](../../../images/icon-app-trash.png))                | Move the file to the [Recycle Bin](../../recycle-bin/recycle-bin-overview.md).                                                                                                                                                                           |

!!! tip
    Using folders can provide additional organization and article management capabilities, including workflow and permissions.

In the info panel, the article's information is organized into two tabs: Details and Versions. To access an article's info panel, select the article and click *Toggle Info Panel* (![Toggle info panel](../../../images/icon-information.png)) on the Applications Menu.

![Select the article and click on the toggle info panel icon to access the info panel reference.](./managing-web-content-articles/images/02.png)

## Info Panel Details Tab

The Details tab includes the following information about web content articles.

| Field           | Description                         |
|:----------------|:------------------------------------|
| ID              | The article's id.                   |
| Title           | The article's title.                |
| Template        | The template used in the article.   |
| Original Author | The article's author.               |
| Priority        | The articles priority.              |
| Display Date    | The article's display date.         |
| Expiration Date | When the article expires.           |
| Review Date     | When the article is set for review. |


## Info Panel Versions Tab

The Versions tab displays the 10 most recent versions of the selected web content article. To view all available versions, click the *View More* button at the bottom of the versions tab or click the article's *Actions* button (![Actions button](../../../images/icon-actions.png)) and select *View History*.

![Click the article's Actions button and select View History to access configuration options for the versions.](./managing-web-content-articles/images/03.png)

| Option                                                 | Description                                                                                                                                                          |
|:-------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Preview (![Preview](../../../images/icon-view.png))    | Show the rendered web content article version.                                                                                                                       |
| Expire (![Expire](../../../images/icon-time.png))      | Deactivate the web content article version.                                                                                                                          |
| Compare to                                             | Show the difference between the selected version and another version. This opens a new page that shows additions, deletions and formatting changes between versions. |
| Make a Copy (![Copy](../../../images/icon-copy.png))   | Creates a new web content article identical to the version selected. The copy uses the same name with *Copy* appended to the end.                                                    |
| Delete (![Delete](../../../images/icon-app-trash.png)) | Deletes the selected version.                                                                                                                                        |

## Related Topics

* [Adding a Basic Web Content Article](./adding-a-basic-web-content-article.md)
* [Filtering and Sorting Web Content Articles](./filtering-and-sorting-web-content-articles.md)
* [Using Expiration and Review Dates in Web Content](./using-expiration-and-review-dates-in-web-content.md)
