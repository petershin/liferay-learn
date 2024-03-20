---
taxonomy-category-names:
- Search
- Search Administration and Tuning
- Liferay Self-Hosted
- Liferay PaaS
uuid: 3d46420e-a962-45c7-bd72-ef0f209003e8
---
# Reindexing Modes

{bdg-secondary}`Liferay 2023.Q4+/GA102+`

*Reindexing* is refreshing all or part of the search index that's used for searching, and in some cases displaying, Liferay's content. Execute a reindex from the [search administration panel](./search-administration.md) in Global Menu &rarr; Control Panel &rarr; Search &rarr; Index Actions. New reindexing modes are included in the 2023.Q4/GA102 release: _Concurrent_ and _Sync_. These provide high availability reindexing, so that the reindex process can run while your users continue to search the site's content, eliminating downtime. Choose from the 3 available reindexing modes:

| Reindex Mode                                              | Description                                                                                                                                                    | High Availability | Supported Actions                                                                                              |
|:-----------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------|:---------------------------------------------------------------------------------------------------------------|
| ![Full](../../images/icon-globe-meridians.png) Full        | Deletes the index first, then regenerates it.                                                                                                                  | &#10008;          | &#10004; Global: all indexes<br>&#10004; Global: spell check dictionaries<br>&#10004; Single model reindexing |
| ![Concurrent](../../images/icon-concurrent.png) Concurrent | ![Beta](../../images/icon-beta-feature.png)<br>Creates a new index, leaving the old index in place (i.e., a blue/green reindex) until the new index is ready. | &#10004;          | &#10004; Global: all indexes<br>&#10008; Global: spell check dictionaries<br>&#10008; Single model reindexing |
| ![Sync](../../images/icon-restore2.png) Sync               | ![Beta](../../images/icon-beta-feature.png)<br>Updates existing search index documents, and deletes stale documents when finished.                             | &#10004;          | &#10004; Global: all indexes<br>&#10008; Global: spell check dictionaries<br>&#10004; Single model reindexing |

```{note}
Concurrent and Sync mode are only available [with Elasticsearch](../installing-and-upgrading-a-search-engine/solr/solr-limitations.md).
```

## Choosing the Reindex Mode

A full reindex works in any scenario, whether for all content and indexes or a single model. However, it's not always the best choice. To avoid downtime due to a long running full reindex process, use concurrent or sync mode whenever possible.

| Reindex when:                        | Full     | Concurrent (![Beta](../../images/icon-beta-feature.png)) | Sync (![Beta](../../images/icon-beta-feature.png)) |
|:--------------------------------------|:---------|:---------|:---------|
| [Installing a new Elasticsearch cluster](../installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md) | &#10004; | -        | -        |
| [Updating field mappings](../installing-and-upgrading-a-search-engine/elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md) | &#10003; | &#10004; | -        |
| [Updating index settings](../installing-and-upgrading-a-search-engine/elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md) | &#10003; | &#10004; | -        |
| [Upgrading Liferay](../../installation-and-upgrades/upgrading-liferay.md) | &#10003; | &#10004; | &#10003; |
| [Upgrading Elasticsearch](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch.md) | &#10003; | &#10004; | &#10003; |
| Reindexing after a connection outage | &#10003; | &#10004; | &#10003; |
| Reindexing a single model[^1]        | &#10003; | -        | &#10004; |

&#10004; The mode is recommended for the scenario

&#10003; The mode is available for the scenario

\- The mode is not available for the scenario

[^1]: Reindexing a single model is occasionally required, and sync mode is recommended in these cases. For example, using certain elements while [creating a search blueprint](../liferay-enterprise-search/search-experiences/search-blueprints/creating-and-managing-search-blueprints.md#adding-elements-to-the-blueprint) and [enabling semantic search](../liferay-enterprise-search/search-experiences/semantic-search.md) require reindexing individual model types.

In earlier Liferay versions, reindexing always uses full mode, deleting content from the live production index before regenerating it. This can result in significant search index downtime. With concurrent and sync reindex modes, reindexing is accomplished without deleting the index first. Sync mode updates the index in place, while concurrent mode builds a new index in the background, preserving the old one until it's ready. High availability of the search index means minimal downtime, which means your site's users can browse and search your site while you reindex the site's content.

![Choose from Full, Concurrent, or Sync reindex modes, depending on your needs.](./reindexing-modes/images/01.png)

Whenever possible, choose concurrent or sync mode to avoid downtime during a reindex. However, there are considerations to account for when deciding which mode is right in your situation.

## ![Full](../../images/icon-globe-meridians.png) Full Reindex Mode

You must use _full_ mode to index all content when connecting to a new, empty Elasticsearch cluster. In this scenario, high availability is not a consideration. You can also use full mode for single model reindexing when sync mode will not suffice, but sync mode is recommended. For high availability reindexing of all indexes, use concurrent mode instead.

A full reindex proceeds this way:

1. The original index is deleted.
1. A new index is created with the latest index settings and field mappings.
1. Documents are regenerated in the index.

## ![Concurrent](../../images/icon-concurrent.png) Concurrent Reindex Mode

Use _concurrent_ mode for high availability reindexing of all content using a blue/green reindexing strategy. Concurrent mode cannot be used for single model reindexing: instead use sync mode. Concurrent mode serves as a replacement for full reindexing mode when reindexing all content.

A concurrent reindex proceeds this way:

1. A new index is created with the latest index settings and field mappings.
1. Documents are regenerated in the index.
1. The original index is deleted.

Because concurrent reindexing creates a new index alongside the old one, it requires more disk space in the Elasticsearch system's infrastructure than the other modes. To avoid errors due to insufficient disk space, Liferay estimates whether the available space is sufficient and warns you if it isn't:

![You're warned if Liferay estimates insufficient disk space for a concurrent reindex.](./reindexing-modes/images/03.png)

## ![Sync](../../images/icon-restore2.png) Sync Reindex Mode

Use _sync_ mode for high availability reindexing when primary disk space for Elasticsearch is a concern, or for all high availability single model reindexing needs. There are scenarios when sync mode can't properly account for system changes, and one of the other modes must be used.

A sync reindex proceeds this way:

1. Index documents are updated, but not deleted.
1. Stale documents are deleted.

A sync reindex does not take into account updated index settings or mappings, and is therefore more limited than a concurrent reindex.

## Setting the Default Reindexing Mode

Full reindex mode is the default. To change it,

1. Go to _Global Menu_ &rarr; _Control Panel_ &rarr; _System Settings_.

1. Open the _Reindex_ entry under Platform &rarr; Search.

1. Set the _Default Reindex Execution Mode_ and click _Update_.

![The default reindexing mode is configurable.](./reindexing-modes/images/02.png)
