# Elasticsearch Indexes Reference

Liferay 7.3 and Liferay 7.4 each have a set of indexes created in Elasticsearch. Understanding what's there and what it does can help you better configure and administer Liferay's Elasticsearch installation.

```{important}
Liferay 7.2 index names are more complex, as patches have introduced changes to the index naming pattern. See [Multi-Tenant Index Names](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names) for more information.
```

## Elasticsearch Indexes in Liferay 7.4

The default Liferay DXP 7.4 indexes in your installation approximate the list below (subject to change). The default global *Index Name Prefix* is `liferay-`: it can be changed in the Elasticsearch 7 connector configuration. `20097` is the generated `companyId` of a given Company in your database. It is displayed as Instance ID in the UI and represents a [Virtual Instance](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md).

| Index Name                                                | Index Type    | Index Purpose |
| :--- | :--- | :--- |
| liferay-0                                                 | System Index  | Search in the System Settings application. |
| liferay-20097                                             | Company Index | Search the indexed content of the Liferay DXP Virtual Instance. |
| liferay-20097-commerce-ml-forecast                        | App Index     | Store data about Liferay Commerce's machine learning capabilities. |
| liferay-20097-frequent-pattern-commerce-ml-recommendation | App Index     | Store data about Liferay Commerce's recommendation services. |
| liferay-20097-product-content-commerce-ml-recommendation  | App Index     | Store data about Liferay Commerce's recommendation services. |
| liferay-20097-product-interaction-commerce-ml-recommendation | App Index  | Store data about Liferay Commerce's recommendation services. |
| liferay-20097-search-tuning-rankings                      | App Index     | Store the Result Rankings application data. |
| liferay-20097-search-tuning-synonyms                      | App Index     | Store the Synonym Sets application data. |
| liferay-20097-user-commerce-ml-recommendation             | App Index     | Store data about Liferay Commerce's recommendation services. |
| liferay-20097-workflow-metrics-instances                  | App Index     | Store data about workflow instances for the Workflow Metrics application. |
| liferay-20097-workflow-metrics-nodes                      | App Index     | Store data about workflow nodes for the Workflow Metrics application. |
| liferay-20097-workflow-metrics-processes                  | App Index     | Store data about workflow processes for the Workflow Metrics application. |
| liferay-20097-workflow-metrics-sla-instance-results       | App Index     | Store data about SLA results per workflow instance for the Workflow Metrics application. |
| liferay-20097-workflow-metrics-sla-task-results           | App Index     | Store data about SLA results per workflow task for the Workflow Metrics application. |
| liferay-20097-workflow-metrics-tasks                      | App Index     | Store data about workflow tasks for the Workflow Metrics application. |
| liferay-20097-workflow-metrics-transitions                | App Index     | Store data about workflow transitions for the Workflow Metrics application. |

## Elasticsearch Indexes in Liferay 7.3

The default Liferay DXP 7.3 indexes in your installation approximate the list below (subject to change). The default global *Index Name Prefix* is `liferay-`: it can be changed in the Elasticsearch 7 connector configuration. `20101` is the generated `companyId` of a given Company in your database. It is displayed as Instance ID in the UI and represents a [Virtual Instance](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md).

| Index Name                                          | Index Type    | Index Purpose |
| :--- | :--- | :--- |
| liferay-0                                           | System Index  | Store data for searching in the System Settings application. |
| liferay-20101                                       | Company Index | Store data for searching the indexed content of the Liferay DXP Virtual Instance. |
| liferay-20101-search-tuning-rankings                | App Index     | Store data for the Result Rankings application. |
| liferay-20101-search-tuning-synonyms                | App Index     | Store data for the Synonym Sets application. |
| liferay-20101-workflow-metrics-instances            | App Index     | Store data about workflow instances for the Workflow Metrics application. |
| liferay-20101-workflow-metrics-nodes                | App Index     | Store data about workflow nodes for the Workflow Metrics application. |
| liferay-20101-workflow-metrics-processes            | App Index     | Store data about workflow processes for the Workflow Metrics application. |
| liferay-20101-workflow-metrics-sla-instance-results | App Index     | Store data about SLA results per workflow instance for the Workflow Metrics application. |
| liferay-20101-workflow-metrics-sla-task-results     | App Index     | Store data about SLA results per workflow task for the Workflow Metrics application. |
| liferay-20101-workflow-metrics-tokens               | App Index     | Store data about workflow tokens for the Workflow Metrics application. |
| liferay-20101-workflow-metrics-transitions          | App Index     | Store data about workflow transitions for the Workflow Metrics application. |

If you have a [Liferay Commerce](https://www.liferay.com/products/commerce) subscription and it is activated in your installation, you also have these indexes:

| Index ID                                                     | Index Type | Index Purpose |
| :--- | :--- | :--- |
| liferay-20101-commerce-ml-forecast                           | App Index  | Store data about Liferay Commerce's machine learning capabilities. |
| liferay-20101-product-content-commerce-ml-recommendation     | App Index  | Store data about Liferay Commerce's recommendation services. |
| liferay-20101-product-interaction-commerce-ml-recommendation | App Index  | Store data about Liferay Commerce's recommendation services. |

## Related Information

- [Multi-Tenant Index Names](../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names)
