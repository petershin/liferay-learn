---
taxonomy-category-names:
- Search
- Search Engine Installation and Maintenance
- Liferay Self-Hosted
uuid: cfc79d71-ec49-4872-85ba-571fe881ed6e
---
# Upgrading to Elasticsearch 8

{bdg-secondary}`7.4 U81+, 7.3 U31+`

Elasticsearch 8 is supported and recommended for the latest Liferay 7.4 Update and GA release out of the box. For specific version compatibility details, refer to the [Search Engine Compatibility Matrix](https://help.liferay.com/hc/en-us/articles/360016511651).

```{important}
Before upgrading Elasticsearch, back up your existing data. If something goes wrong during or after the upgrade, roll back to the previous version using the uncorrupted index snapshots. Follow the steps in [Backing up Elasticsearch](./backing-up-elasticsearch.md).
```

To upgrade an existing Elasticsearch 7 server (or cluster) to Elasticsearch 8,

1. [Back up the Liferay Company and System Indexes](./backing-up-elasticsearch.md).

1. [Back up the application specific indexes for Search Tuning](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) (Synonym Sets and Result Rankings).

1. [Prepare the new Elasticsearch installation](../installing-elasticsearch.md).

1. [Upgrade Elasticsearch](#upgrading-elasticsearch)

1. If you're using X-Pack security, it's enabled by default in Elasticsearch 8. To disable it, add this property:

   ```yaml
   xpack.security.enabled: false
   ```

   See [Securing Elasticsearch](../securing-elasticsearch.md) for detailed coverage of the security configuration.

1. Configure the Connector to Elasticsearch 8 to connect to Elasticsearch.

1. Restart Liferay, then reindex all search and spell check indexes.

   ```{note}
   If you performed a rolling upgrade, reindexing is not necessary.
   ```

1. Restore Search Tuning indexes from the snapshot. If you were previously using these features, you may have data stored in these indexes.

1. Verify that Search Tuning entries have been carried over.

## Upgrading Elasticsearch

If you are using a rolling restart-eligible version, doing a [rolling upgrade](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rolling-upgrades.html) is the recommended way to upgrade your Elasticsearch cluster as it minimizes downtime and eliminates the need to reindex all your data. Otherwise, follow the [full cluster restart upgrade ](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/restart-upgrade.html) guide.

If you've installed a new Elasticsearch server and want to index your pre-upgrade data, most Liferay indexes can be restored by triggering a [reindex](#restart-liferay-and-reindex) from the UI, once the Liferay [database is upgraded](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md). However, the Search Tuning (Result Rankings and Synonyms) indexes and any custom indexes not backed by database storage must be restored from a [snapshot of the pre-upgrade indexes](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3).

## Restart Liferay and Reindex

Once Liferay is connected with the Elasticsearch cluster, restart Liferay and reindex the applicable indexes into the new Elasticsearch installation:

1. Restart Liferay.

1. If you've performed a full cluster restart upgrade, you must reindex the company, system, and spell check indexes. From the Global Menu (![Global Menu](../../../../images/icon-applications-menu.png)), navigate to *Control Panel* &rarr; *Configuration* &rarr; *Search*. Click *Execute* for the Reindex All Search Indexes entry.

1. If you've performed a full cluster restart upgrade, you must reindex the [Workflow Metrics indexes](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics): from the Global Menu (![Global Menu](../../../../images/icon-applications-menu.png)), navigate to *Applications* &rarr; *Workflow---Metrics*. Open the Settings menu (![Options](../../../../images/icon-options.png) and Click *Reindex All*. Repeat the process for each Virtual Instance.

This restores the indexes built from data stored in the Liferay database. To restore indexes used as primary storage, see [Backing Up Elasticsearch](./backing-up-elasticsearch.md).
