---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 38a0b5f5-1a85-4c13-9592-14891fd631cf
---
# Using the Search Results Widget

Search results should be easy to navigate, sort, and filter. Give your users an optimal search experience by understanding the default search experience and the many configuration options at your disposal.

Multiple factors affect search results:

* How assets are indexed
* The search widgets used
* Whether results are post-processed

![The goal of search: return the perfect results to users searching for content in your site.](./search-results/images/01.png)

Developers of content types (_assets_ in Liferay DXP) control much about how the asset's information is indexed and how its information is searched and returned in the search results. For further control, an *Indexer Post Processor* can modify an asset's indexing behavior and how search queries are constructed to look up the assets.

Keep in mind though, almost everything you do when [configuring search](../../search-administration-and-tuning.md) has an impact on search results, particularly [Synonym Sets](../../search-administration-and-tuning.md) and [Result Rankings](../../search-administration-and-tuning.md).

The concepts below are essential to understand before you begin changing any settings.

## Filtering Results with Facets

Results are filtered using *facets*. Most users have encountered similar filtering capabilities in other applications, particularly during commerce activities. Users enter a search term, are presented with a list of results, and selecting search facets refines the results. You can think of a facet as a bucket of results with a shared characteristics.

![The Type facet is one of the facets provided out of the box.](./search-results/images/02.png)

Facets are configurable. Read about configuring [facets](../search-facets.md) to learn more.

## Search Results Relevance

The search engine processes and orders results by *relevance*. Relevance is a score calculated by the search engine. The score is calculated by [algorithms provided by the search engine](https://www.elastic.co/guide/en/elasticsearch/guide/master/relevance-intro.html#relevance-intro).

Results relevance is configurable:

* [Search Tuning is a brute-force way to customize rankings](../../search-administration-and-tuning.md).
* [Liferay Enterprise Search's Learning to Rank feature is a machine learning model you can train to return more relevant results.](./../../liferay-enterprise-search.md)
* [The Search Insights widget displays the relevance scoring to reveal why a result appears in a certain position.](../../search-administration-and-tuning.md)
* [Sort the results by an indexed field to override relevance scoring](./sorting-search-results.md).

## Permissions and Search Results

A search result doesn't appear for a user lacking [permission](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) to view the asset. A logged in user with the Site Administrator Role likely sees more search results than an anonymous guest.

There are two rounds of permissions checks:

* _Pre-filtering_ happens in the search engine's index. It's faster than checking database permissions information, but occasionally the search index can have stale permissions information.

* _Post-filtering_ happens on the results before display, to ensure the search engine's index has correct, up-to-date permissions information.

### Pre-filtering

Pre-filtering adds filter clauses to the search query, so searches contain results the current user can view.

You can configure pre-filtering at *Control Panel* &rarr; *Configuration* &rarr; *System Settings* &rarr; *Search* &rarr; *Permission Checker* by controlling the number of search clauses added to queries:

**Permissions Term Limit:** Limits the number of permission search clauses added to the search query before this level of permission checking is aborted. Permission checking then relies solely on the final permission filtering described below.

The only reason to limit permissions terms is performance. Users with administrative access to lots of Sites and Organizations generate many permissions terms added to the query. Too many terms in a query can make the search engine time out.

### Post-filtering

Post-filtering happens prior to presenting results in the UI. For example, if a user searches for *liferay*, the search engine returns all relevant forum posts. As the Search Results iterates through this list, it performs one last permission check of each post to ensure the user can view the post and its categories. If a user doesn't have permission to view the post, it isn't displayed in the list of search results.

Post-filtering is configurable at *Control Panel* &rarr; *Configuration* &rarr; *System Settings* &rarr; *Search* &rarr; *Default Search Result Permission Filter*. It includes two settings:

**Permission Filtered Search Result Accurate Count Threshold:** Specify the maximum number of search results to permissions-filter before results are counted. A higher threshold increases count accuracy, but decreases performance. Since results in the currently displayed page are always checked, any value below the search results pagination delta effectively disables this behavior.

**Search Query Result Window Limit:** Set the maximum batch size for each permission checking request. This is impacted by pagination. If there are 100 results per page and you jump all the way to page 200 of the search results, all results between page one and 200 must be checked to ensure you have permission. That's 20,000 results to permissions check. Doing this in one trip to and from the search engine can result in performance issues. Set the maximum batch size for each permission checking request.

## Search and Staging

With [staging](./../../../site-building/site-settings.md), content is placed first in a preview and testing environment before being published to the live Site. Indexed content is marked so the search API knows if an item is live or not. In the live version of the Site, only live indexed content is searchable.

In the staged version of the Site, all content---live or staged---is searchable.

## Result Summaries

A result summary condenses information from the original asset into an abstract. Asset developers choose what fields are included in the summary. A common summary includes a *title* and some of the *content*, with title displayed first. The asset type always appears on the second line, followed by a snippet of content matching the search term. Assets without content fields, like Documents and Media documents, display the description instead.

!!! note
    Searching for users: When you click an asset in the search results, it's displayed in an [Asset Publisher](../../../site-building/displaying-content/using-the-asset-publisher-widget.md) (unless the *View in Context* option is selected in the Search Results widget). Users are different, though. Think of them as invisible assets, not intended for display in the Asset Publisher application.  While users appear as search results with other indexed assets, when you click one you're taken to the user's profile page. If public personal pages are disabled, clicking on a user from the list of search results shows you a blank page. Only the user's full name and the asset type (User) appear in user result summaries:

![User summaries contain only the user's full name.](./search-results/images/03.png)

For assets containing other assets (Web Content and Documents & Media folders) or whose content is not amenable to display (Dynamic Data List Records and Calendar Events), it makes more sense to display the title, asset type, and description in results summaries:

![Documents and Media and Web Content folders include titles and descriptions in their summaries.](./search-results/images/04.png)

Beginning in Liferay DXP 2024.Q2/Portal 7.4 GA120, users can download Documents and Media documents directly from the search results widget. In all out-of-the-box widget templates, the results summary for Documents and Media documents includes a download link for users with the Download permission. [Custom display templates](../using-search-widget-display-templates.md) must be adjusted to add the download link. The download link is available as a pre-defined variable in the [widget display template](../using-search-widget-display-templates.md) editor.

![Users can download Documents and Media files right from the Search Results widget.](./search-results/images/07.png)

Asset developers determine which fields are summary-enabled, but logic invoked at search time determines precisely the part of the summary fields to display. For example, a `content` field can have a lot of text, but the summary only shows and highlights the relevant snippet of the field's text containing the keyword.

## Highlighting

Search terms appearing in the summary are <mark>highlighted</mark> by default. If this is undesirable, disable it in the [widget configuration screen](./configuring-the-search-results-widget.md).

![Some document summaries have lots of highlights if the search term matches text that appears in the summary.](./search-results/images/05.png)

Highlighting is a helpful visual cue that hints at why the result is returned, but beware: high scoring hits can appear at the top of results without having any highlights in the summary. That's because not all indexed fields appear in the summary. Consider a user named Arthur C. Clarke. He has a searchable email address of *acc@authors.org*. Because users result summaries only contain their full names, searching for Mr. Clarke by his email address returns the user, but no term is highlighted.

![Results that match the search term won't always have highlights.](./search-results/images/06.png)

There may be additional cases where search results don't have highlighting.
