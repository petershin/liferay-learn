---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 06ef4848-7a9b-4281-92e6-f145c80fd215
---
# Downloading and Uploading Backups

The Liferay Cloud backup service creates backups of an environment's database and the full contents of the Liferay instance's `LIFERAY_HOME/data` folder. This content is stored as archive files (`.gz` and `.tgz` respectively) and can be downloaded via the Liferay Cloud console.

Users can also download or upload environment backups [using the Liferay Cloud Console](#uploading-backups-via-the-console), or through [Backup APIs](#backup-service-apis).

!!! note
    The Backups page is only available in production environments for backup service versions older than 4.3.5.

## Downloading Backups via the CLI Tool

{bdg-secondary}`Requires CLI tool version 3.12.0+, backup service version 5.9.0+, and Liferay service version 5.3.0+`

You can use the [CLI tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) to download backups directly, including both the database and document library volume.

Run this command using a specific backup's ID to download its database and document library simultaneously:

```bash
lcp backup download --backupId [ID]
```

There are three optional command line switches:

`--database` specifies downloading only the database.

`--doclib` specifies downloading only the document library.

`--concurrency` defines the number of files to download in parallel (up to 10,000).

Here's an example using multiple switches:

```bash
lcp backup download --backupId [ID] --doclib --concurrency 500
```

The optimal number of files to download concurrently depends on your system and network specifications. The `--concurrency` flag only affects downloads for the document library because the database is downloaded as a single file.

## Uploading Backups via the CLI Tool

{bdg-secondary}`Requires CLI tool version 3.12.0+, backup service version 5.9.0+, and Liferay service version 5.3.0+`

!!! warning
    Database table and column names are case sensitive in Liferay Cloud. Ensure that the table names use the correct capitalization (lower case for PostgreSQL or Pascal case for MySQL). See [Ensuring Correct Table Capitalization](./creating-a-database-dump.md#ensuring-correct-table-capitalization) for more information.

Run this command to upload a backup with both a database and document library:

```bash
lcp backup upload --project [Project name] --environment [Environment] --doclib [Path to document library folder] --database [Path to database .gz file]
```

You must [create and compress a database dump](#creating-the-database-file) to a `.gz` archive to upload it.

You can also add the `--concurrency` flag with a number of streams to upload in parallel (up to 10,000).

## Preparing the Database and Document Library for Upload

To upload a backup of your environment to Liferay Cloud, you must have the database prepared in its own archive file. For backup service versions before 5.9.0, you must also compress the document library in a separate archive file.

### Creating the Database File

Creating a database dump requires different commands for PostgreSQL and MySQL databases. See [Creating a Database Dump](./creating-a-database-dump.md) for more steps specific to your type of database.

These steps dump your database and compress it into a resulting `database.gz` file.

!!! tip
    To ignore a database when creating a dump, use the `LCP_DUMP_DATABASES_TO_IGNORE` variable.

### Creating the Volume File

If you are uploading a backup with the [LCP tool](#uploading-backups-via-the-cli-tool), a volume file is not necessary because the tool automatically compresses your document library's files.

To upload a backup via the Cloud console UI or API, you must compress the document library to upload it.

!!! tip
    If permissions are not already configured for Liferay Cloud when you upload a backup, restoring the backup to your environments afterward can take longer to complete. To avoid long restore times, navigate to your `LIFERAY_HOME` folder and run this command before compressing the document library: `chown -R 1000:1000 data/document_library/`.

Run this command to compress the data volume:

```bash
cd $LIFERAY_HOME/data && tar -czvf volume.tgz document_library
```

## Downloading Backups via the Console

!!! important
    You can only download backups via the console **before backup service 5.9.0**. For versions 5.9.0+, use the [CLI tool](#downloading-backups-via-the-cli-tool) instead.

Follow these steps (as an administrator) to download a backup from the *Backups* page in your chosen environment:

1. Click *Actions* ( ⋮ ) for the backup you want to download.

1. Click *Download*.

   ![Click on the Actions button, and then click Download.](./downloading-and-uploading-backups/images/01.png)

1. Click the *Database* (`.gz`) or *Liferay* (`.tgz`) file to start downloading. Together, these zip archives comprise the environment backup.

    !!! note
        If your backup service is not yet updated to version `4.2` or above, the database volume is downloaded as a `.tgz` archive instead of `.gz`.

   ![Click to download the database and Liferay data volume files.](./downloading-and-uploading-backups/images/02.png)

## Uploading Backups via the Console

!!! warning
    If your document library store is GCS, upload the backup [using the CLI](#uploading-backups-via-the-cli-tool).

Before you can upload a backup to Liferay Cloud, you must compress the database dump and document library in separate archives. See [Preparing the Database and Document Library for Upload](#preparing-the-database-and-document-library-for-upload) for more information on preparing them for an on-premises environment.

!!! warning
    Database table and column names are case sensitive in Liferay Cloud. Ensure that the table names are in Pascal case before uploading your database. See [Ensuring Correct Table Capitalization](../../migrating-to-liferay-cloud.md#ensuring-correct-table-capitalization) for more information.

Follow these steps from the Backups page:

1. Click *Upload Backup...* near the top of the screen.

1. On the Upload Backup page, expand the appropriate environment, and then click the `+` icons for both the database and document library to upload them.

   ![Click the icons to upload both the database and document library as .gz archives.](./downloading-and-uploading-backups/images/03.png)

1. When both the database dump and document library are uploaded, click *Initiate Upload*.

Liferay Cloud begins using the files you uploaded to generate a backup and adds it to the list you can restore to your environments. While the backup is being generated, other backups cannot be generated or restored.

A success message appears on the page when the backup is generated, and the service resumes normal operation.

![When the backup is finished being added to the list in your environment, a success message appears.](./downloading-and-uploading-backups/images/04.png)

## Backup Service APIs

The backup service has APIs that you can also use to download and upload backups. You can invoke these APIs using a command line tool such as `curl`. Only use the backup APIs if uploading with the CLI isn't available in your version of the backup service or if it gives you the following error:

```
Project [projectId] does not have GCS enabled for Document Library Store.
```

### Getting the Host Name

To invoke the backup APIs, you need the backup service's host name. You can find this on the *Services* page.

![View the backup service's host name from the Services page.](./downloading-and-uploading-backups/images/05.png)

The backup service's host name is a combination of the service, project, and environment names.

Consider this example:

- Service name: `backup`
- Project name: `lfrjoebloggs`
- Environment name: `prd`
- Host name: `backup-lfrjoebloggs-prd.lfr.cloud`

### Authentication

You can authenticate your request with basic authentication or a user access token.

Note that token authentication is required if SSO is enabled. You can retrieve this token from the cookie `access_token` and use it with the `dxpcloud-authorization` header.

Here's an example that uses token authentication with the upload API:

```bash
curl -X POST \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -H 'dxpcloud-authorization: Bearer [User token]' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz'
```

!!! note
    Passing the user token in the header `dxpcloud-authorization` only works for versions `3.2.0` or greater of the backup service. Previous versions should be upgraded to at least `3.2.0`. Requests to earlier versions must use the header `Authorization: Bearer [Project master token]`. You can find the project master token by running the command `env | grep LCP_PROJECT_MASTER_TOKEN` in any shell in the Liferay Cloud console.

### Download Database API

The API for downloading a database contains an endpoint that returns a `.gz` file. The `id` parameter represents the backup ID, which you can find on the Backups page. This ID is comprised of three strings separated by two dashes (e.g., `dxpcloud-lqgqnewltbexuewymq-201910031723`).

#### Parameters

| Name | Type     | Required |
| :--- | :------- | :------- |
| `id` | `String` | Yes      |

#### curl Example

```bash
curl -X GET \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/download/database/[ID] \
  -u user@domain.com:password \
  --output database.gz
```

!!! note
    If your backup service is not yet updated to version `4.2` or above, the database volume is downloaded as a `.tgz` archive instead of `.gz`.

### Download Data Volume API

The API for downloading a data volume contains an endpoint that returns a `.tgz` file. The `id` parameter represents the backup ID, which you can find on the Backups page. This ID is comprised of three strings separated by two dashes (e.g., `dxpcloud-lqgqnewltbexuewymq-201910031723`).

#### Parameters

| Name | Type     | Required |
| :--- | :------- | :------- |
| `id` | `String` | Yes      |

#### curl Example

```bash
curl -X GET \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/download/volume/[ID] \
  -u user@domain.com:password \
  --output volume.tgz
```

### Upload Backup API

Follow these steps to upload a backup to Liferay Cloud with the upload backup API:

1. [Create the database file](#creating-the-database-file).

1. [Create the volume file](#creating-the-volume-file).

1. [Invoke the backup API](#invoking-the-backup-api) with the database and volume files.

Before you can use the upload API, you must compress the database dump and document library in separate archives. See [Preparing the Database and Document Library for Upload](#preparing-the-database-and-document-library-for-upload) for more information on preparing for the upload for an on-premises environment.

#### Invoking the Backup API

**Parameters**

| Name       | Type   | Required |
| :--------- | :----- | :------- |
| `database` | `File` | Yes      |
| `volume`   | `File` | Yes      |

**curl Example**

```bash
curl -X POST \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz' \
  -u user@domain.com:password
```

## Related Topics

- [Restoring Data from a Backup](./restoring-data-from-a-backup.md)
- [Database Service](../database-service.md)
