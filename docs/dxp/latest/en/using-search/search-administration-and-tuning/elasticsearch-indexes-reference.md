---
taxonomy-category-names:
- Search
- Search Administration and Tuning
- Reference
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 1d5da6cd-cdeb-4c72-836e-63462e4a86ad
---
# Elasticsearch Indexes Reference

Liferay 7.3 and 7.4 each have a set of indexes created in Elasticsearch. Understanding these indexes and what they do can help you better configure and administer Liferay's Elasticsearch installation.

!!! important
    Liferay 7.2 index names are more complex, as patches have introduced changes to the index naming pattern. See [Multi-Tenant Index Names](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names) for more information.

## Elasticsearch Indexes in Liferay 7.4

The following list approximates the default Elasticsearch indexes in Liferay DXP 7.4 (subject to change). The default global *Index Name Prefix* is `liferay-`, which you can change in the Elasticsearch 7 connector configuration. `20097` is the generated `companyId` of a given company in your database. It is displayed as Instance ID in the UI and represents a [Virtual Instance](../../system-administration/configuring-liferay/virtual-instances.md).

| Index Name                                                   | Index Type    | Index Purpose                                                                 |
| :----------------------------------------------------------- | :------------ | :---------------------------------------------------------------------------- |
| liferay-0                                                    | System Index  | Search in the System Settings application.                                    |
| liferay-20097                                                | Company Index | Search the indexed content of the Liferay DXP Virtual Instance.               |
| liferay-20097-commerce-ml-forecast                           | App Index     | Index Liferay Commerce's machine learning capabilities.                       |
| liferay-20097-frequent-pattern-commerce-ml-recommendation    | App Index     | Index Liferay Commerce's recommendation services.                             |
| liferay-20097-product-content-commerce-ml-recommendation     | App Index     | Index Liferay Commerce's recommendation services.                             |
| liferay-20097-product-interaction-commerce-ml-recommendation | App Index     | Index Liferay Commerce's recommendation services.                             |
| liferay-20097-search-tuning-rankings                         | App Index     | Index the Result Rankings application data.                                   |
| liferay-20097-search-tuning-synonyms                         | App Index     | Index the Synonym Sets application data.                                      |
| liferay-20097-user-commerce-ml-recommendation                | App Index     | Index Liferay Commerce's recommendation services.                             |
| liferay-20097-workflow-metrics-instances                     | App Index     | Index workflow instances for the Workflow Metrics application.                |
| liferay-20097-workflow-metrics-nodes                         | App Index     | Index workflow nodes for the Workflow Metrics application.                    |
| liferay-20097-workflow-metrics-processes                     | App Index     | Index workflow processes for the Workflow Metrics application.                |
| liferay-20097-workflow-metrics-sla-instance-results          | App Index     | Index SLA results per workflow instance for the Workflow Metrics application. |
| liferay-20097-workflow-metrics-sla-task-results              | App Index     | Index SLA results per workflow task for the Workflow Metrics application.     |
| liferay-20097-workflow-metrics-tasks                         | App Index     | Index workflow tasks for the Workflow Metrics application.                    |
| liferay-20097-workflow-metrics-transitions                   | App Index     | Index workflow transitions for the Workflow Metrics application.              |

## Elasticsearch Indexes in Liferay 7.3

The following list approximates the default Elasticsearch indexes in Liferay DXP 7.3 (subject to change). The default global *Index Name Prefix* is `liferay-`, which you can change in the Elasticsearch 7 connector configuration. `20101` is the generated `companyId` of a given company in your database. It is displayed as Instance ID in the UI and represents a [Virtual Instance](../../system-administration/configuring-liferay/virtual-instances.md).

| Index Name                                          | Index Type    | Index Purpose                                                                 |
| :-------------------------------------------------- | :------------ | :---------------------------------------------------------------------------- |
| liferay-0                                           | System Index  | Index searching in the System Settings application.                           |
| liferay-20101                                       | Company Index | Index searching the indexed content of the Liferay DXP Virtual Instance.      |
| liferay-20101-search-tuning-rankings                | App Index     | Index the Result Rankings application.                                        |
| liferay-20101-search-tuning-synonyms                | App Index     | Index the Synonym Sets application.                                           |
| liferay-20101-workflow-metrics-instances            | App Index     | Index workflow instances for the Workflow Metrics application.                |
| liferay-20101-workflow-metrics-nodes                | App Index     | Index workflow nodes for the Workflow Metrics application.                    |
| liferay-20101-workflow-metrics-processes            | App Index     | Index workflow processes for the Workflow Metrics application.                |
| liferay-20101-workflow-metrics-sla-instance-results | App Index     | Index SLA results per workflow instance for the Workflow Metrics application. |
| liferay-20101-workflow-metrics-sla-task-results     | App Index     | Index SLA results per workflow task for the Workflow Metrics application.     |
| liferay-20101-workflow-metrics-tokens               | App Index     | Index workflow tokens for the Workflow Metrics application.                   |
| liferay-20101-workflow-metrics-transitions          | App Index     | Index workflow transitions for the Workflow Metrics application.              |

If you have a [Liferay Commerce](https://www.liferay.com/products/commerce) subscription and it is activated in your installation, you also have these indexes:

| Index Name                                                   | Index Type | Index Purpose                                           |
| :----------------------------------------------------------- | :--------- | :------------------------------------------------------ |
| liferay-20101-commerce-ml-forecast                           | App Index  | Index Liferay Commerce's machine learning capabilities. |
| liferay-20101-product-content-commerce-ml-recommendation     | App Index  | Index Liferay Commerce's recommendation services.       |
| liferay-20101-product-interaction-commerce-ml-recommendation | App Index  | Index Liferay Commerce's recommendation services.       |

## Related Information

- [Multi-Tenant Index Names](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names)
