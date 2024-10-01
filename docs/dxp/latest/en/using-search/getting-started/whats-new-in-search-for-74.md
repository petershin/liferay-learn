---
taxonomy-category-names:
- Search
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: c1d207df-f471-4cc9-82d8-1ab0e2b06d86
---
# What's New in Search for 7.4?

There are several highlights and new features added to Liferay's search infrastructure for the 7.4 release. New features include those added to the product for Liferay CE 7.4 GA4 and Liferay DXP 7.4 GA1.

!!! tip
    To learn about features added in later 7.4 DXP Updates and Portal GA releases, refer to the release notes.

    Liferay DXP: the release notes are available on the [Customer Portal's Liferay DXP Release Notes page](https://customer.liferay.com/dxp-release-notes).

    Liferay Portal: release notes are provided as [release announcement blogs](https://liferay.dev/blogs/-/blogs) on the Liferay Community site. For example, see the [Liferay Portal 7.4 GA43 release announcement](https://liferay.dev/blogs/-/blogs/liferay-portal-7-4-ga43-and-liferay-commerce-4-0-ga43-release).

## Elasticsearch 7 Integration

Elasticsearch 7 is supported in Liferay 7.4. Check the [Search Engine Compatibility Matrix](https://help.liferay.com/hc/en-us/articles/360016511651) for the latest information, including the minimum supported version, the client version, and the latest supported Elasticsearch version.

![Elasticsearch 7.15 is supported to run with Liferay DXP 7.4 GA1.](./whats-new-in-search-for-74/images/03.png)

!!! important
    - Elasticsearch 6.x is not supported on Liferay DXP/Portal 7.4.
    - Solr is in [maintenance mode](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md#features-moved-to-maintenance-mode-in-74) in Liferay 7.4.

## Search Infrastructure & Administration

### Reindex Virtual Instances Independently

Beginning in Liferay 7.4, Server Administrators can limit the scope of the reindex actions to specific [Virtual Instances](../../system-administration/configuring-liferay/virtual-instances.md). To choose which instances the index actions apply to,

1. Open Global Menu &rarr; Control Panel &rarr; Search and click the Index Actions tab.

1. Use the Execution Scope tab to choose the instances to reindex.

   ![Select the instances to reindex.](./whats-new-in-search-for-74/images/01.png)

## Search Widgets

### Searching for Liferay Objects

To support searching for [Liferay Objects](../../liferay-development/objects.md), some search widgets have been enhanced:

- The Type Facet automatically includes published Objects:

  ![Published Objects are added to the Type Facet widget.](./whats-new-in-search-for-74/images/05.png)

- The Search Results widget automatically displays the Object Entry's title and a summary.

  ![A title and a content summary are displayed for Object Entries.](./whats-new-in-search-for-74/images/06.png)

<!-- * If configured in the Object, a display page can be shown when the Object Entry is clicked in Search Results. -->

To learn more about Liferay Objects and search, read [Searching for Liferay Objects](./searching-for-content.md#searching-for-liferay-objects).

## Search Tuning

> **DXP Subscribers**

### Search Tuning Data is Stored in the Database

Beginning in DXP Liferay 7.4, the Result Rankings and Synonym Sets data is stored in the Liferay database, and a reindex action from the Search Administration panel can be used to populate each application's index with the proper data. In prior versions the indexes were used as primary data storage for these applications.

To learn about how this impacts the upgrade process, read [Upgrading Search Infrastructure](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md) and [Backing Up Elasticsearch](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md).

![Reindex the Search Tunings data just like you would other Liferay DXP assets.](./whats-new-in-search-for-74/images/02.png)

## Liferay Enterprise Search (LES)

> **[LES Subscribers](https://www.liferay.com/products/dxp/enterprise-search)**

### LES Installation is Simplified

Starting with Liferay DXP 7.4, the [Liferay Enterprise Search (LES)](../liferay-enterprise-search.md) applications are included with all Liferay DXP bundles and Docker containers. LES is enabled by default and requires no additional installation steps. However, a LES add-on subscription must be purchased to receive official Liferay Support and additional benefits. Maintenance and updates to LES applications are delivered with Liferay DXP updates.

![The LES apps, like Cross-Cluster Replication, are installed with Liferay DXP 7.4.](./whats-new-in-search-for-74/images/04.png)

## Upgrading to DXP 7.4

Upgrading from a previous DXP version to 7.4 requires no special considerations for most setups. If using Liferay Enterprise Search or Search Tuning, however, make sure you consider these points:

1. The Search Tuning applications are now backed by database tables, whereas previous versions used Elasticsearch indexes for their data storage. See [Upgrading Search Infrastructure](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md) for more information.

1. The Liferay Enterprise Search applications are bundled with Liferay DXP. When upgrading to 7.4 no additional installation steps are required.

## Related Topics

- [Upgrading Search Infrastructure](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md)

- [7.4 Breaking Changes](../../liferay-development/liferay-internals/reference/7-4-breaking-changes.md)