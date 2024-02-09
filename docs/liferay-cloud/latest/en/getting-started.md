---
toc:
  - ./getting-started/initial-setup-overview.md
  - ./getting-started/development-requirements.md
  - ./getting-started/configuring-your-github-repository.md
  - ./getting-started/configuring-your-bitbucket-repository.md
  - ./getting-started/configuring-your-gitlab-repository.md
  - ./getting-started/logging-into-your-liferay-cloud-services.md
  - ./getting-started/understanding-liferay-cloud-environments.md
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 7197d494-7d76-48f5-ab9b-a8efa9441400
---
# Getting Started

```{toctree}
:maxdepth: 1

getting-started/initial-setup-overview.md
getting-started/development-requirements.md
getting-started/configuring-your-github-repository.md
getting-started/configuring-your-bitbucket-repository.md
getting-started/configuring-your-gitlab-repository.md
getting-started/logging-into-your-liferay-cloud-services.md
getting-started/understanding-liferay-cloud-environments.md
```

Liferay Cloud is a secure and reliable enterprise cloud platform that provides the infrastructure and tooling necessary to simplify, secure, and deliver amazing applications on Liferay DXP.

Worry less and build more with a platform that provides:

* [Standards Compliant Security, Automated Backups, and Flexible Governance](#standards-compliant-security-automated-backups-and-flexible-governance)
* [High Availability, Scalability, and Performance](#high-availability-scalability-and-performance)
* [Real Time Alerts](#real-time-alerts)

All of which is designed, built, and supported by a dedicated team of Liferay professionals with over a decade of experience running business-critical solutions on Liferay DXP.

Liferay Cloud accelerates application development and deployment by providing a complete DevOps CI/CD strategy, tools, and workflow.

Every Liferay Cloud project comes with:

* [Accelerated Development with Built-in CI/CD](#accelerated-development-with-built-in-cicd)
* [Application Development Tools](#application-development-tools)
* [Insightful Monitoring](#insightful-monitoring)

## Standards Compliant Security, Automated Backups, and Flexible Governance

Liferay Cloud is designed with security in mind. Build and deploy mission-critical sites with confidence knowing that Liferay Cloud is **ISO 27001** and **AICPA SOC2** certified.

All customer data is encrypted at rest by default. Encryption at rest ensures that sensitive data saved on disks isn't readable by any user or application without a valid key. See our [security policy](https://www.liferay.com/documents/10182/3292406/Liferay+DXP+Cloud+Data+Security+and+Protection.pdf/78ce7065-9787-1fb2-9c7b-6d7c13f4a3e6?t=1564674972483) for more information.

[Automated backups](./platform-services/backup-service/backup-service-overview.md) ensure that data and documents are protected and ready for restoration in case of data corruption or failure.

![Liferay Cloud's backup service preserves and protects your data.](./getting-started/images/01.png)

Out-of-the-box [role and team administration](./manage-and-optimize/environment-teams-and-roles.md) allows administrators to deliver maximum productivity and security by adding or removing people from teams and managing permissions per project environment.

![Manage your project's team members, including their permissions.](./getting-started/images/02.png)

## High Availability, Scalability, and Performance

[Clustering](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md) and [load-balancing](./configuring-the-cloud-network/load-balancer.md) deliver highly available, zero-downtime deployments to ensure that mission-critical sites stay online. Liferay Cloud delivers data through a multi-region architecture to ensure high availability.

[Auto-scaling](./manage-and-optimize/auto-scaling.md) ensures that bandwidth and compute capacity is dynamically added to maintain steady performance through unexpected traffic spikes. Similarly, unneeded resources can be scaled down during periods of lower activity. Teams receive automatic notifications and email alerts regarding instance usage so they can manage resources with confidence.

![Auto-scale your servers to meet demand.](./getting-started/images/03.png)

## Real Time Alerts

Administrators can configure [alerts](./manage-and-optimize/real-time-alerts.md) per user to receive resource utilization updates in real-time.

![Administrators can configure real-time alerts.](./getting-started/images/04.png)

## Accelerated Development with Built-in CI/CD

Deliver your application faster with a fully-realized CI/CD strategy available out-of-the-box. [Github and Jenkins](./platform-services/continuous-integration.md) integrations allow each new commit or pull request to trigger a build that can be deployed to your [production or non-production environments](./getting-started/understanding-liferay-cloud-environments.md).

These robust systems enable the creation of fault tolerant processes to meet organizations' unique needs and detect and repair common server problems as they occur. This helps prevent small programming errors from accumulating and causing a server crash.

![View, manage, and deploy your builds from a central location.](./getting-started/images/05.png)

## Application Development Tools

Keep track of application deployments and performance with real-time build and [deployment logs](./support-and-troubleshooting/troubleshooting/reading-liferay-cloud-service-logs.md). Teams can analyze stack traces and troubleshoot bugs by [accessing the shell](./support-and-troubleshooting/troubleshooting/shell-access.md) via the web console or terminal, and/or by downloading the logs.

![Real-time build and deployment logs help you solve problems with your applications.](./getting-started/images/06.png)

## Insightful Monitoring

Liferay Cloud delivers [application metrics](./manage-and-optimize/application-metrics.md) so IT teams can understand the health and compute requirements of their sites over time. Administrators can also use out-of-the-box [Dynatrace integration](./manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) to quickly understand CPU and memory usage, data transfer rates, and more.

![Use a variety of metrics to keep tabs on your Liferay Cloud services, including your Liferay DXP instances.](./getting-started/images/07.png)

## Related Topics

* [Development Requirements](./getting-started/development-requirements.md)
* [Configuring Your Github Repository](./getting-started/configuring-your-github-repository.md)
* [Overview of the Liferay Cloud Deployment Workflow](./updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [Deploying Changes via the Liferay Cloud Console](./updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)
