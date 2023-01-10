# Search Administration

In *Control Panel* &rarr; *Configuration* &rarr; *Search* there are three administrative UIs: Connections, Index Actions, and Field Mappings. Connections shows you the search engines your installation is connected to, Index Actions is an interface for re-indexing, and Field Mappings display fields mapped from Liferay to your search index. 

![The Search Administration panel contains three management screens.](./search-administration/images/02.png)

## Connections

Information about the search engine connection(s) is displayed here. For example,

* Search Engine Vendor: Elasticsearch
* Client Version: 7.17.1
* Active Connections: 1
* Health: Green
* Connection ID: \_REMOTE\_
* Connection Type: Read/Write
* Cluster Name: LiferayElasticsearchCluster
* Nodes: 1
* Node Name: lr-es
* Node Version: 7.15.1

## Index Actions

In Index Actions, re-index at one of these levels:

   * All indexable assets
   * An individual indexable assets
   * All spell check dictionaries

Beginning in Liferay 7.4, Server Administrators can also limit the scope of the re-index actions to specific [Virtual Instances](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md). To choose which instances the index actions apply to,

1. Open Global Menu &rarr; Control Panel &rarr; Search and click the Index Actions tab.
1. Use the Execution Scope tab to choose the instances to re-index.

   ![Select the instances to re-index.](./search-administration/images/03.png)

```{note}
[Workflow Metrics](../../process-automation/workflow/using-workflows/using-workflow-metrics.md) are re-indexed via the application's dedicated settings menu. In the Global Menu, click _Metrics_ in the Applications &rarr; Workflow section, then open the Settings window (![Options](../../images/icon-actions.png)). See [Re-Indexing Workflow Metrics](../../process-automation/workflow/using-workflows/using-workflow-metrics.md#re-indexing-workflow-metrics) for more information.
```

### Re-Indexing All Content

When you perform a full re-index, all search engine documents in the [system and company indexes](./elasticsearch-indexes-reference.md) are dropped and recreated from the database. Elasticsearch's log prints `update_mapping` messages:

```json
{"type": "server", "timestamp": "2023-01-10T14:33:04,513Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

In Liferay 7.4 U45+/GA45+ and Liferay DXP 7.3 U14+, Liferay's log displays when the re-index started and finished on the system and company indexes. For example,

```bash
2023-01-09 20:44:17.730 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 20097
2023-01-09 20:45:00.986 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 20097
```

On earlier updates (Liferay 7.4 U44/GA44 and below; DXP 7.3 U13 and below) and Liferay Portal 7.3, enable these [logging configurations](../../system-administration/using-the-server-administration-panel/configuring-logging.md) to see similar information:

| Logger Category | Level |
| :-------------- | :---- |
| com.liferay.portal.search.internal.background.task.ReindexStatusMessageSenderImpl | DEBUG |
| com.liferay.portal.search.internal.SearchEngineInitializer | INFO |

### Re-Indexing Individual Types

When you re-index an individual type (e.g., `com.liferay.account.model.AccountEntry`), the index documents representing the entities are dropped and recreated from the database. Elasticsearch's log prints an `update_mapping` message:

```json
{"type": "server", "timestamp": "2023-01-10T14:38:12,302Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

In Liferay 7.4 U45+/GA45+ and Liferay DXP 7.3 U14+, Liferay's log displays when the re-index started and finished. For example,

```bash
2023-01-10 14:14:00.840 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:122] Start reindexing company 20097 for class name com.liferay.account.model.AccountEntry
2023-01-10 14:14:00.907 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:145] Finished reindexing company 20097 for class name com.liferay.account.model.AccountEntry
```

### Re-Indexing Spell Check Dictionaries

When you re-index the spell check dictionaries, the content of Liferay's dictionary file for each language (e.g., `com/liferay/portal/search/dependencies/spellchecker/en_US.txt`) is re-indexed for the [system and company index](./elasticsearch-indexes-reference.md). Elasticsearch's log prints an `update_mapping` message:

```json
{"type": "server", "timestamp": "2023-01-10T14:33:14,991Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-0/9ZIx-bT6TyiekzarKELQkA] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"  }
```

In Liferay 7.4 U45+/GA45+ and Liferay DXP 7.3 U14+, Liferay's log displays when the re-index started and finished. For example,

```bash
2023-01-10 14:16:34.170 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 0
2023-01-10 14:16:41.592 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 0
2023-01-10 14:16:41.593 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 0
2023-01-10 14:16:44.570 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 0
2023-01-10 14:16:44.571 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 20097
2023-01-10 14:16:49.547 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 20097
2023-01-10 14:16:49.548 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 20097
2023-01-10 14:16:52.235 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 20097
```

## Field Mappings

The Field Mappings tab shows you all field mappings that are effective in the system, by index. Currently, you can view the mappings, copy them, zoom in or out, and view them with a dark theme.

![Inspect the field mappings for any index in the Elasticsearch cluster.](./search-administration/images/01.png)

## Related Content

* [Search Configuration Reference](../search-configuration-reference.md)
* [Portal Properties](../../installation-and-upgrades/reference/portal-properties.md)
* [Elasticsearch Connector Configuration Reference](../installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
