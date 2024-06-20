---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 0a8d12de-8c80-4954-bcc1-9f014120e043
---
# Quotas and Resource Usage

*Quotas* are the maximum number of resources available for a given Liferay Cloud project. Administrators may configure services and environments to use resources according to project need. For example, a production environment may be allocated additional CPU cores, while a development environment might have one core.

Reaching any of the resource quotas for a project doesn't affect the production environment. However, there is a temporary loss of some functionality depending on which resource has reached the pre-determined quota. For example, reaching the quota for 20 custom domains means administrators can't create new domains. Reaching the memory quota could generate out of memory errors, and deployments might fail. [Real-time Alerts](../manage-and-optimize/real-time-alerts.md) can be configured to ensure that users are notified before they reach a resource quota. To request an increase in a resource's quota, open a [Help Center ticket](https://liferay-support.zendesk.com/agent/). The resources governed by quotas are:

- CPU
- Memory
- Custom Domains
- Collaborators
- Maximum Number of Cores
- Instances
- Maximum Number of Environments
- Maximum Number of Services
- Maximum Builds per Day
- CPU per Service
- Scale per Service
- Memory per Service
- Storage per Environment

Resource allocations for the above can be configured in each service's `lcp.json` file. See [Configuration via LCP.json](../reference/configuration-via-lcp-json.md). When [Auto-scaling](./auto-scaling.md) is enabled, reaching certain thresholds do not count against pre-determined quotas.

## Monitoring Resource Usage

You can monitor the usage of these resources in the Plan and Usage page. It offers a real-time, detailed view of your subscription plan and current resource utilization across all environments. This ensures you can effectively manage and optimize your cloud resources. The Plan tab is split into two sections:

**Plan Data**: Shows your plan's quotas for memory, CPU, storage, instances, and number of environments.

**Plan Allocation and Consumption**: Shows how these resources are being allocated across all environments and how close they are to reaching the quota.

!!! note
    The Storage metric is not related to the database service. It represents the size of each environment's document library.