# Liferay Cloud Version 5 Changes

Liferay Cloud version 5.x.x comes with several changes and new features. Find out about the major changes here:

* [Prepare and Swap Backup Restore Strategy](#prepare-and-swap-backup-restore-strategy)
* [Backup Upload Retry Configuration](#backup-upload-retry-configuration)
* [ModSecurity Capabilities with Nginx](#modsecurity-capabilities-with-nginx)

## Prepare and Swap Backup Restore Strategy

Restoring data from a backup causes some downtime for the database service, and any other service that depends on it (including the Liferay service). However, with Backup service version 5.x.x, you can change the restore behavior so that a separate, fresh database instance and volume start up *first*, and then switching to the new instance once they're ready. This minimizes the necessary downtime for your instance.

Set the [`LCP_BACKUP_RESTORE_STRATEGY` environment variable](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference)'s value to `PREPARE_AND_SWAP` to use this strategy.

## Backup Upload Retry Configuration

With version 5.x.x, you can fine-tune the number of retries and the delays between them for your backup uploads. See the `LCP_GCP_STORAGE_UPLOAD_*` [Backup service environemnt variables](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference) for more information.

## ModSecurity Capabilities with Nginx

ModSecurity is a Web Application Firewall available in Liferay Cloud with Web server version 5.x.x. It inspects requests sent to the web server in real time, against a predefined set of custom rules. This step prevents typical web application L7 attacks, like XSS and SQL injection.

See [Enabling ModSecurity](../infrastructure-and-operations/security/web-application-firewall.md) for more information.
