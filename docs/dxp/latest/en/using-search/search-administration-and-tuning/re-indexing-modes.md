# Re-Indexing Modes

{bdg-secondary}`Liferay 7.4 2023.Q4+/GA98+`

*Re-indexing* is regenerating all or part of the search index that's used for searching, and in some cases displaying, Liferay's content. Execute a re-index from the [search administration panel](./search-administration.md) in Global Menu &rarr; Control Panel &rarr; Search &rarr; Index Actions. Choose from the 3 available re-indexing modes:

| Re-Index Mode     | Description                                                                                                     | Avoids Downtime | Supported Actions                                                                                              |
|:------------------|:----------------------------------------------------------------------------------------------------------------|:----------------|:---------------------------------------------------------------------------------------------------------------|
| Full              | Deletes the index first, then regenerates it.                                                                   | &#10008;        | &#10004; Global: all indexes<br>&#10004; Global: spell check dictionaries<br>&#10004; Single model re-indexing |
| Concurrent (![Beta](../../images/icon-beta-feature.png)) | Creates a new index, leaving the old index in place (i.e., a blue/green re-index) until the new index is ready. | &#10004;        | &#10004; Global: all indexes<br>&#10008; Global: spell check dictionaries<br>&#10008; Single model re-indexing |
| Sync (![Beta](../../images/icon-beta-feature.png))       | Updates existing search index documents, and deletes stale documents when finished.                             | &#10004;        | &#10004; Global: all indexes<br>&#10008; Global: spell check dictionaries<br>&#10004; Single model re-indexing |

A full re-index works in any scenario, whether for all content and indexes or a single model. However, it's not always the best choice. To avoid downtime due to a long running full re-index process, use concurrent or sync mode whenever possible.

| Re-Index Scenario                     | Full     | Concurrent (![Beta](../../images/icon-beta-feature.png)) | Sync (![Beta](../../images/icon-beta-feature.png)) |
|:--------------------------------------|:---------|:---------|:---------|
| New Elasticsearch installation        | &#10004; |          |          |
| Index creation or deletion            | &#10004; | &#10004; |          |
| Field mappings update                 | &#10004; | &#10004; |          |
| Index settings update                 | &#10004; | &#10004; |          |
| Liferay upgrade: quarterly release    | &#10004; | &#10004; | &#10004; |
| Liferay upgrade: major version change | &#10004; | &#10004; | &#10004; |
| After upgrading Elasticsearch         | &#10004; | &#10004; | &#10004; |
| After other uptime issues             | &#10004; | &#10004; | &#10004; |
| Single model re-indexing[^1]          | &#10004; |          | &#10004; |
| After connection interruptions        |          | &#10004; | &#10004; |

[^1]: Re-indexing a single model is occasionally required. For example, using certain elements while [creating a search blueprint](../liferay-enterprise-search/search-experiences/search-blueprints/creating-and-managing-search-blueprints.md#adding-elements-to-the-blueprint) and [enabling semantic search](../liferay-enterprise-search/search-experiences/semantic-search.md) require re-indexing individual model types.

You must use full mode to index all content when connecting to a new, empty Elasticsearch cluster. In this scenario, high availability (i.e., avoiding downtime) is not a consideration. You must also use full mode for single model re-indexing when sync mode will not suffice. See [Additional Considerations](#additional-considerations) for more information. 
<!--Should we recommend sync mode for single model re-index more strongly? -->

Use concurrent mode for high availability re-indexing of all content using a blue/green re-indexing strategy, as long as primary disk space for Elasticsearch is not an issue. Concurrent mode cannot be used for single model re-indexing. See [Additional Considerations](#additional-considerations) for more information.

Use sync mode for high availability re-indexing when primary disk space for Elasticsearch is a concern, or for all high availability single model re-indexing needs. There are scenarios when sync mode can't properly account for system changes, and one of the other modes must be used. See [Additional Considerations](#additional-considerations) for more information.

When to re-index: change in how data is indexed, a failed staging publication, or outages in the connection between Liferay and Elasticsearch result in stale index data, requiring a re-index.

![Choose from Full, Concurrent, or Sync re-index modes, depending on your needs.](./re-indexing-modes/images/01.png)

In earlier Liferay versions, re-indexing always deleted content from the live production index before regenerating it. This could result in significant search index downtime. With concurrent and sync re-index modes, re-indexing is accomplished without deleting the index first. Sync mode updates the index in place, while with concurrent mode the old version of the index is preserved while a new index is built in the background. High availability of the search index means minimal downtime, which means your site's users can browse and search your site while you re-index the site's content.
<!-- Not sure if this paragraph is necessary or where exactly it fits. -->

## Additional Considerations

In general, choosing concurrent or sync re-indexing mode is recommended, to avoid downtime during a re-index. However, there are considerations to account for when deciding which mode is right in your situation.

### Concurrent Mode Requires More Disk Space for Elasticsearch
<!-- Add a short paragraph about this-->

### Sync Mode cannot Account for Mappings and Index Settings Changes
<!-- Verify -->

## Setting the Default Re-Indexing Mode

Full re-index mode is the default. To change it,

1. Go to _Global Menu_ &rarr; _Control Panel_ &rarr; _System Settings_.

1. Open the _Reindex_ entry under Platform &rarr; Search.

1. Set the _Default Reindex Execution Mode_ and click _Update_.

![The default re-indexing mode is configurable.](./re-indexing-modes/images/02.png)
