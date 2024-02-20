---
toc:
  - ./upgrading-elasticsearch/upgrading-search-infrastructure.md
  - ./upgrading-elasticsearch/upgrading-to-elasticsearch-8.md
  - ./upgrading-elasticsearch/upgrading-to-elasticsearch-7.md
  - ./upgrading-elasticsearch/backing-up-elasticsearch.md
taxonomy-category-names:
- Search
- Search Engine Installation and Maintenance
- Liferay Self-Hosted
uuid: 74ea186e-bea7-4e10-aecc-67069682aeac
---
# Upgrading Elasticsearch

```{toctree}
:maxdepth: 1

upgrading-elasticsearch/upgrading-search-infrastructure.md
upgrading-elasticsearch/upgrading-to-elasticsearch-8.md
upgrading-elasticsearch/upgrading-to-elasticsearch-7.md
upgrading-elasticsearch/backing-up-elasticsearch.md
```

Liferay supports Elasticsearch 8. The [compatibility matrix](https://help.liferay.com/hc/en-us/sections/360002103292-Compatibility-Matrix) provides the latest support details.

!!! warning 
    Solr is in [maintenance mode](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md#features-moved-to-maintenance-mode-in-74) in Liferay 7.4.

```{important}
Elasticsearch 6.x is not supported on Liferay 7.3+.
```

Before planning your upgrade, read [Upgrading Search Infrastructure](./upgrading-elasticsearch/upgrading-search-infrastructure.md). It provides an overview of the steps required to upgrade older Liferay/Elasticsearch systems to the latest supported search stack. Always [back up your search indexes](./upgrading-elasticsearch/backing-up-elasticsearch.md) before [upgrading Elasticsearch](./upgrading-elasticsearch/upgrading-to-elasticsearch-8.md).

- [Upgrading Search Infrastructure](upgrading-elasticsearch/upgrading-search-infrastructure.md)
- [Upgrading to Elasticsearch 8](upgrading-elasticsearch/upgrading-to-elasticsearch-8.md)
- [Upgrading to Elasticsearch 7](upgrading-elasticsearch/upgrading-to-elasticsearch-7.md)
- [Backing Up Elasticsearch](upgrading-elasticsearch/backing-up-elasticsearch.md)
