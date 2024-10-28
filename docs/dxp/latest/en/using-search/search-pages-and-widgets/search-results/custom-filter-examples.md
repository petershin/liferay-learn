---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: e3852b4a-f53d-43b2-835e-e75bcd9469df
---
# Custom Filter Examples

!!! note
    This feature works [only with Elasticsearch](../../installing-and-upgrading-a-search-engine/solr/solr-limitations.md).

The Custom Filter widget is a powerful aid to your search tuning efforts. Without deploying custom code, you can exert control over the query sent to the search engine. Some common use cases are presented here to help you understand how to approach the Custom Filter widget:

- [Excluding Content from Search Results](#excluding-certain-content)
- [Boosting Content in Search Results](#boosting-fields)
- [Filtering by multiple Site IDs](#filtering-by-site-id)
- [Using Elasticsearch's Query String query](#complex-filter-with-query-string)
- [Boosting Matches to Nested Fields](#boosting-matches-to-nested-fields)

See [Using the Custom Filter Widget](./using-the-custom-filter-widget.md) for a detailed explanation of the Custom Filter widget.

## Excluding Certain Content

When used with a `must_not` Occur configuration, the Custom Filter can catch and exclude documents from the Search Results.

### Excluding Certain Documents and Media Content

Sometimes, you may want to exclude certain types of content from appearing in the Search Results. To exclude Documents and Media file entries that are only present in the system to be added to Web Content, you must first distinguish the particular files to exclude, in a way that they can be identified in the search index. You can tag them with something that declares their purpose (`wconly` perhaps), or you can put them into a dedicated [Documents and Media Folder](../../../content-authoring-and-management/documents-and-media/uploading-and-managing/using-folders.md). To configure a Custom Filter to exclude a Documents and Media Folder, use these settings:

**Filter Query Type:** `Match`

**Filter Field:** `folderId`

**Filter Value:** `41103`

**Occur:** `must_not`

This configuration ensures that search documents containing a `folderId` field with the value `41103` are not returned in the search results.

### Excluding Content with Certain Extensions

Perhaps you must exclude GIF files the search results. Configure a Custom Filter like this:

**Filter Query Type:** `Match`

**Filter Field:** `extension`

**Filter Value:** `gif`

**Occur:** `must_not`

This configuration leverages the presence of the `extension` field indexed from the Documents and Media [`DLFileEntry` model](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/search/spi/model/index/contributor/DLFileEntryModelDocumentContributor.java). It ensures that search documents containing an `extension` field with the value `gif` are not returned in the search results.

## Boosting Fields

Boosting certain documents based on specific fields is a common need, and it's readily accomplished with the Custom Filter widget. The boost value often needs tuning to meet your needs. Use the Search Insights widget with _Enable Score Explanation_ enabled to inspect how the documents are being scored and to fine-tune your boost values.

### Boosting Results by Date Range

The Date Range query option in the [Custom Filter widget's configuration form](using-the-custom-filter-widget.md#custom-filter-configuration) corresponds to the [Elasticsearch Range query](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-range-query.html). To boost results created within the last year add a Custom Filter to a page and configure it like this:

**Filter Field:** `createDate`

**Filter Value:** `[now-1y now]`

**Filter Query Type:** `Range`

**Occur:** `Should`

**Boost:** `100`

Results created in the last year are boosted as a result of this Custom Filter. To see this in action create two blogs about three minutes apart with the following title and content:

| Blog 1                 | Blog 2               |
| :--------------------- | :------------------- |
| Title: `liferay dxp`   | Title: `liferay dxp` |
| Content: `liferay dxp` | Content: `liferay`   |

When you search for `dxp` the earlier blog will be higher in the Search Results because it has the searched keyword more frequently, and both were created in the last year so they were boosted equally.

Immediately after creating the second blog post, configure the Custom Filter's Filter Value with `[now-2m now]`--this value may need to be adjusted.

Search again, and the order of the blogs in Search Results will now show the later blog first (as long as the newer blog was created within the configured time range, and the older blog was not).

See the [Elasticsearch date-math documentation](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/common-options.html#date-math) to understand more about how to specify the ranges.

### Boosting Matches to Designated Fields

To boost a document with certain fields that match the searched keywords, configure a Custom Filter like this:

**Filter Query Type:** `Multi Match`

**Filter Field:** `title_en_US, content_en_US`

**Occur:** `Should`

**Boost:** `100`

**Custom Parameter Name:** `q`

This configuration boosts matching documents if the English (United States) title and content contains the keywords entered by the user in the Search Bar widget. Entering the Custom Parameter Name with the same value as the Search Bar's Keywords Parameter Name configuration means that the value passed into the Search Bar is the value that's boosted by the Custom Filter (if it matches with documents in the search index).

The Multi Match query can match multiple fields at once. Otherwise you'd need to configure a Custom Filter for each separate field, even if the rest of the configuration values are identical.

### Boosting by a Field's Presence

To boost any content that's tagged, regardless of what the tag value is, configure a Custom Filter like this:

**Filter Query Type:** `Exists`

**Filter Field:** `assetTagNames`

**Occur:** `should`

**Boost:** `100`

If a document matching the query is tagged, it contains a `assetTagNames` field. The Exists query matches on any value for the field.

## Filtering by Site ID

There's no configuration for searching multiple Sites on one Search Page without searching all of them. To include results from the current Site and all [child Sites](../../../site-building/sites/site-hierarchies.md) you must configure the Search Bar's Scope, setting it to _Everything_. After that, you'll use one parent Custom Filter with a Bool query that can collect child query clauses, each of which is contributed by a Custom Filter widget with a term query for matching the `groupId` of a Site to include in the search results. The Site's ID is the `groupId` field in the search document.

1. Create 3 Sites:
   - Create at least one parent Site with a child Site.
   - Create at least one additional Site that won't be included in the search.

   !!! tip
       To find the Group ID of a Site, in the site menu navigate to Configuration > Settings. The displayed `Site ID` is the `groupId` you can use to filter the Site.

1. Create at least one piece of content in each Site (a Blogs Entry), and include the word _Liferay_ in each.

1. Set the Search Bar scope to *Everything*.

   > **Checkpoint:** Search and see that content from all the sites is returned

   ![These three Blogs Entries are each from a different Site.](./custom-filter-examples/images/01.png)

1. Configure a parent Custom Filter:

   **Filter Query Type:** `Bool`

   **Occur:** `Filter`

   **Query Name:** `SiteBoolQuery`

1. Configure a Custom Filter for each Site to include in the search:

   **Filter Query Type:** `Term`

   **Filter Field:** `groupId`

   **Occur:** `should`

   **Parent Query:** `SiteBoolQuery`

   **Filter Value:** `38109`

   For the example content from the above screenshot, one more Custom Filter is needed. Configure it identically to the above with one exception: the Filter Value is `38105`.

   > **Checkpoint:** Search again and confirm that content from only the designated Sites is returned. This can be further confirmed by looking at the details view if the search results are configured to *Display Results in Document Form*.

   ![Only content from the included Sites is displayed.](./custom-filter-examples/images/02.png)

Importantly, the filters by `groupId` declare the `SiteBoolQuery` as the parent query. The *should* Occur clauses in the child Term queries (for each Site) act as an OR operator, so that if any of the `groupId`s are matched, their content can be displayed in the Search Results widget.

## Complex Filter with Query String

Sometimes you can avoid the need for multiple queries (as in the [Filtering by Site ID](#filtering-by-site-id) example), by using the [Query String query](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/query-dsl-query-string-query.html). The below configuration demonstrates how you can use only one Custom Filter widget to constrain the search to

- Match Documents and Media files with `pdf` or `jpg` extensions OR
- Match Web Content Articles

Configure the Custom Filter widget like this:

**Filter Query Type:** `Query String`

**Occur:** `Filter`

**Filter Value:** `((extension:pdf OR extension:jpg) AND entryClassName:com.liferay.document.library.kernel.model.DLFileEntry) OR entryClassName:com.liferay.journal.model.JournalArticle`

Using parentheses is recommended to ensure that your intended precedence is enforced.

Simplifying the configuration of a search page (often a complex case is handled with just one Custom Filter widget) is nice, but the Query String query is not the answer to all complexity in the custom Filter widget. Some queries cannot be mimicked using the Query String type. For example, it cannot handle Nested queries to search nested documents, Term queries to avoid analysis, or Prefix queries to search based on prefixes.

!!! warning
    The Query String query should not be used if the value being passed is coming from the search bar (as demonstrated in `Boosting Matches to Designated Fields`). If the Search Bar's user enters a keyword containing invalid syntax, an error is returned.

## Boosting Matches to Nested Fields

{bdg-secondary}`Available 7.2 FP10+, 7.3 FP1+, 7.4 (all updates)`

Using a [nested field](../../../liferay-development/liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) in a Custom Filter configuration requires three Custom Filter widgets on the search page. A [Nested query](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/query-dsl-nested-query.html) that wraps the required child queries is added in one of the widgets: one child query matches the field's name, the other the value.

This example demonstrates adding a boost for matches to a certain DDM Structure field.

1. Create a [Structure](../../../content-authoring-and-management/web-content/web-content-structures/creating-web-content-structures.md):
   - In the Site menu, go to Content & Data &rarr; Web Content.

   - Click the *Structures* tab, then the Add button ![Add](../../../images/icon-add.png).

   - Give the structure a Title (e.g., *Boosted Content*) and these fields:

       - Field 1:
         - **Type:** `Boolean`
         - **Field Label:** `Boost?`

       - Field 2:
         - **Type:** `Text`
         - **Field Label:** `Content`

   - Save the Structure.

   Structure fields are indexed by default.

1. Add one Web Content that uses the new Structure.

   - **Title:** `Boosted`
   - **Boost?** `True`
   - **Content:** `Test.`

1. Add a second Web Content that uses the new Structure.

   - **Title:** `Not Boosted`
   - **Boost?** `False`
   - **Content:** `Test content.`

1. Go to the search page and search for _test content_.

   **Checkpoint:** Because of the exact match to the content field, the Not Boosted Web Content appears before the Boosted Web Content.

1. Enable _Display Results in Document Form_ in the Search Results widget's configuration.

1. Find the `ddmFieldArray` field and copy its value. For example,

   ```json
   "ddmFieldArray" : [
               {
                 "ddmFieldName" : "ddm__keyword__44012__Checkbox08350381_en_US",
                 "ddmFieldValueKeyword_en_US" : "true",
                 "ddmFieldValueKeyword_en_US_String_sortable" : "true",
                 "ddmValueFieldName" : "ddmFieldValueKeyword_en_US"
               }
            ],
   ```

1. Go to the search page and add three Custom Filters using the Elasticsearch response data:

   - Filter 1, the parent nested query:
     - **Filter Field:** `ddmFieldArray`
     - **Filter Query Type:** `Nested`
     - **Occur:** `should`
     - **Query Name:** `parent_query`
     - **Boost:** `500`

   - Filter 2, the child match query for the field name.
     - **Filter Field:** `ddmFieldArray.ddmFieldName`
     - **Filter Query Type:** `Match`
     - **Occur:** `should`
     - **Value:** `ddm__keyword__44012__Checkbox08350381_en_US`
     - **Parent Query Name:** `parent_query`
     - **Custom Parameter Name:** `cparam`

   - Filter 3, the child match query for the value of `true` in the Boost field:
     - **Filter Field:** `ddmFieldArray.ddmFieldValueKeyword_en_US`
     - **Filter Value:** `true`
     - **Filter Query Type:** `Match`
     - **Occur:** `should`
     - **Parent Query Name:** `parent_query`
     - **Custom Parameter Name:** `cparam`

     !!! important
         This example uses custom filters on just one nested field, so the custom parameter in the child queries (`cparam`) isn't actually required. To set up custom filters on multiple nested fields in the same page, you must configure custom parameter names for the child queries, as demonstrated in this example. Adding filters for a second nested field requires two child custom filters sharing a different custom parameter name (e.g., `cparam2`).

1. Now repeat the search for *test content* and verify that the Boosted Web Content appears above the Not Boosted Web Content.

The boost value often needs tuning to meet your needs. Use the Search Insights widget with *Enable Score Explanation* enabled to inspect how the documents are being scored and to fine-tune your boost values.

## Related Content

- [Using the Custom Filter Widget](./using-the-custom-filter-widget.md)
- [Result Rankings](../../search-administration-and-tuning/result-rankings.md)
- [Synonym Sets](../../search-administration-and-tuning/synonym-sets.md)
