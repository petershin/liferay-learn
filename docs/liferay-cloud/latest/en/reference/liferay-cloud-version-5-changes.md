---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Reference
- Liferay PaaS
uuid: e56c7a54-cf20-4aab-b425-967b296ac03a
---
# Liferay Cloud Version 5 Changes

Liferay Cloud version 5 comes with several changes and new features:

* [ModSecurity Capabilities with Nginx](#modsecurity-capabilities-with-nginx)
* [Improved Regional Persistence](#improved-regional-persistence)
* [Prepare and Swap Backup Restore Strategy](#prepare-and-swap-backup-restore-strategy)
* [Backup Upload Retry Configuration](#backup-upload-retry-configuration)

## ModSecurity Capabilities with Nginx

ModSecurity is a Web Application Firewall available in Liferay Cloud with web server version 5.x.x. It inspects requests sent to the web server in real time, against a predefined set of custom rules. This step prevents typical web application L7 attacks, like XSS and SQL injection.

See [Enabling ModSecurity](..//tuning-security-settings/web-application-firewall.md) for more information.

## Improved Regional Persistence

Liferay Cloud's database and backup services have improved reliability with version 5.x.x. When you upgrade, your services are updated to benefit from improved regional persistence. This improves their performance for workloads and minimizes failover latency.

## Prepare and Swap Backup Restore Strategy

Restoring data from a backup results in downtime for the database service and any dependent services (including Liferay). However, with backup service version 5.x.x, the restore behavior can first start a separate, fresh database instance and volume, and then switch to the new instance once ready. This minimizes the downtime for your instance.

Set the [`LCP_BACKUP_RESTORE_STRATEGY` environment variable](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference)'s value to `PREPARE_AND_SWAP` to use this strategy.

## Backup Upload Retry Configuration

With version 5.x.x, you can fine-tune the number of retries and the delays between them for your backup uploads. See the `LCP_GCP_STORAGE_UPLOAD_*` [Backup service environemnt variables](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference) for more information.
