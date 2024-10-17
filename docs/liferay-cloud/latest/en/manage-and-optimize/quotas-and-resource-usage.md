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

Resource allocations for the above can be configured in each service's `lcp.json` file. See [Configuration via LCP.json](../reference/configuration-via-lcp-json.md). When [auto-scaling](./scaling-the-liferay-service.md) is enabled, reaching certain thresholds do not count against pre-determined quotas.

## Monitoring Resource Usage

You can monitor the usage of these resources in the Plan and Usage page. It offers a real-time, detailed view of your subscription plan and current resource utilization. This ensures you can effectively manage and optimize your cloud resources. The Plan tab is split into sections:

1. **Plan Data** shows your plan's quotas for the following resources:

   - Memory: Maximum amount of memory across all environments.

   - CPU: Maximum number of CPU cores across all environments.

   - Instances: Maximum number of Liferay instances that can be up at any given time across all environments.

   - Builds: Maximum number of builds you can generate per day across all environments.

   - Document Library Storage: Storage space in the document library per environment.

   - Database Storage: Storage space in the database per environment.

   - Environments: Number of environments included in your project.

1. **Plan Allocation and Consumption** shows how resources are being allocated across environments and how close they are to reaching the quota.

   - Memory: Allocation of memory across environments.

   - CPU: Allocation of CPU cores across environments.

   - Instances: Allocation of Liferay instances across environments.

   - Builds: Status of all builds generated in the present day.

1. At the bottom of Plan Allocation and Consumption is the Storage section. It contains two graphs:

   - Document Library: Storage consumption in the document library for each environment.

   - Database: Storage consumption in the database for each environment.

For information on the Scaling tab, see [Scaling the Liferay Service](./scaling-the-liferay-service.md).