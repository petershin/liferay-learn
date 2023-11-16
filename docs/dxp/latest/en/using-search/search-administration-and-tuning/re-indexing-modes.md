---
uuid: 3d46420e-a962-45c7-bd72-ef0f209003e8
---
# Re-Indexing Modes

{bdg-secondary}`Liferay 2023.Q4+/GA102+`

*Re-indexing* is refreshing all or part of the search index that's used for searching, and in some cases displaying, Liferay's content. Execute a re-index from the [search administration panel](./search-administration.md) in Global Menu &rarr; Control Panel &rarr; Search &rarr; Index Actions. New re-indexing modes are included in the 2023.Q4/GA102 release: _Concurrent_ and _Sync_. These provide high availability re-indexing, so that the re-index process can run while your users continue to search the site's content, eliminating downtime. Choose from the 3 available re-indexing modes:

| Re-Index Mode                                              | Description                                                                                                                                                    | High Availability | Supported Actions                                                                                              |
|:-----------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------|:---------------------------------------------------------------------------------------------------------------|
| ![Full](../../images/icon-globe-meridians.png) Full        | Deletes the index first, then regenerates it.                                                                                                                  | &#10008;          | &#10004; Global: all indexes<br>&#10004; Global: spell check dictionaries<br>&#10004; Single model re-indexing |
| ![Concurrent](../../images/icon-concurrent.png) Concurrent | ![Beta](../../images/icon-beta-feature.png)<br>Creates a new index, leaving the old index in place (i.e., a blue/green re-index) until the new index is ready. | &#10004;          | &#10004; Global: all indexes<br>&#10008; Global: spell check dictionaries<br>&#10008; Single model re-indexing |
| ![Sync](../../images/icon-restore2.png) Sync               | ![Beta](../../images/icon-beta-feature.png)<br>Updates existing search index documents, and deletes stale documents when finished.                             | &#10004;          | &#10004; Global: all indexes<br>&#10008; Global: spell check dictionaries<br>&#10004; Single model re-indexing |

```{note}
Concurrent and Sync mode are only available [with Elasticsearch](../installing-and-upgrading-a-search-engine/solr/solr-limitations.md).
```

## Choosing the Re-Index Mode

A full re-index works in any scenario, whether for all content and indexes or a single model. However, it's not always the best choice. To avoid downtime due to a long running full re-index process, use concurrent or sync mode whenever possible.

| Re-Index when:                        | Full     | Concurrent (![Beta](../../images/icon-beta-feature.png)) | Sync (![Beta](../../images/icon-beta-feature.png)) |
|:--------------------------------------|:---------|:---------|:---------|
| [Installing a new Elasticsearch cluster](../installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md) | &#10004; | -        | -        |
| [Updating field mappings](../installing-and-upgrading-a-search-engine/elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md) | &#10003; | &#10004; | -        |
| [Updating index settings](../installing-and-upgrading-a-search-engine/elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md) | &#10003; | &#10004; | -        |
| [Upgrading Liferay](../../installation-and-upgrades/upgrading-liferay.md) | &#10003; | &#10004; | &#10003; |
| [Upgrading Elasticsearch](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch.md) | &#10003; | &#10004; | &#10003; |
| Re-indexing after a connection outage | &#10003; | &#10004; | &#10003; |
| Re-indexing a single model[^1]        | &#10003; | -        | &#10004; |

&#10004; The mode is recommended for the scenario

&#10003; The mode is available for the scenario

\- The mode is not available for the scenario

[^1]: Re-indexing a single model is occasionally required, and sync mode is recommended in these cases. For example, using certain elements while [creating a search blueprint](../liferay-enterprise-search/search-experiences/search-blueprints/creating-and-managing-search-blueprints.md#adding-elements-to-the-blueprint) and [enabling semantic search](../liferay-enterprise-search/search-experiences/semantic-search.md) require re-indexing individual model types.

## Understanding Re-Index Modes

In earlier Liferay versions, re-indexing always uses full mode, deleting content from the live production index before regenerating it. This can result in significant search index downtime. With concurrent and sync re-index modes, re-indexing is accomplished without deleting the index first. Sync mode updates the index in place, concurrent mode builds a new index in the background, preserving the old one until it's ready. High availability of the search index means minimal downtime, which means your site's users can browse and search your site while you re-index the site's content.

![Choose from Full, Concurrent, or Sync re-index modes, depending on your needs.](./re-indexing-modes/images/01.png)

Whenever possible, choose concurrent or sync mode to avoid downtime during a re-index. However, there are considerations to account for when deciding which mode is right in your situation.

### ![Full](../../images/icon-globe-meridians.png) Full Re-Index Mode

You must use _full_ mode to index all content when connecting to a new, empty Elasticsearch cluster. In this scenario, high availability is not a consideration. You can also use full mode for single model re-indexing when sync mode will not suffice, but sync mode is recommended. For high availability re-indexing of all indexes, use concurrent mode instead.

Conceptually, a full re-index proceeds this way:

1. The original index is deleted.
1. A new index is created with the latest index settings and field mappings.
1. Documents are regenerated in the index.

### ![Concurrent](../../images/icon-concurrent.png) Concurrent Re-Index Mode

Use _concurrent_ mode for high availability re-indexing of all content using a blue/green re-indexing strategy. Concurrent mode cannot be used for single model re-indexing: instead use sync mode. Concurrent mode serves as a replacement for full re-indexing mode when re-indexing all content.

Conceptually, a concurrent re-index proceeds this way:

1. A new index is created with the latest index settings and field mappings.
1. Documents are regenerated in the index.
1. The original index is deleted.

Because concurrent re-indexing creates a new index alongside the old one, it requires more disk space in the Elasticsearch system's infrastructure than the other modes. To avoid errors due to insufficient disk space, Liferay estimates whether the available space is sufficient and warns you if it isn't:

![You're warned if Liferay estimates insufficient disk space for a concurrent re-index.](./re-indexing-modes/images/03.png)

### ![Sync](../../images/icon-restore2.png) Sync Re-Index Mode

Use _sync_ mode for high availability re-indexing when primary disk space for Elasticsearch is a concern, or for all high availability single model re-indexing needs. There are scenarios when sync mode can't properly account for system changes, and one of the other modes must be used.

Conceptually, a sync re-index proceeds this way:

1. Index documents are updated, but not deleted.
1. Stale documents are deleted.

A sync re-index does not take into account updated index settings or mappings, and is therefore more limited than a concurrent re-index.

## Setting the Default Re-Indexing Mode

Full re-index mode is the default. To change it,

1. Go to _Global Menu_ &rarr; _Control Panel_ &rarr; _System Settings_.

1. Open the _Reindex_ entry under Platform &rarr; Search.

1. Set the _Default Reindex Execution Mode_ and click _Update_.

![The default re-indexing mode is configurable.](./re-indexing-modes/images/02.png)
