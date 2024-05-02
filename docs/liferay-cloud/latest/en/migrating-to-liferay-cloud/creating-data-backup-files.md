---
taxonomy-category-names:
- Cloud
- Cloud Migration
- Liferay PaaS
uuid: ee3a8169-8408-4c36-afbc-9976f0ef3866
---
# Stage 2: Creating Data Backup Files

Now that the Liferay versions match between your on-premises and Liferay Cloud environments, you must prepare the data from your installation for migration. This stage of migration involves creating a database dump, migrating the document library store, and compressing the document library into an archive.

!!! warning
    The combined size of your database dump and (compressed) document library archive must not exceed 2 TB for you to upload in the next step without contacting Liferay Cloud Support.

## Freeze the Data

Before you create your data backup files, you must arrange a window to freeze the data in your Liferay instance. This prevents data from being lost while the backup is being taken. Coordinate with your database administrator to reserve a window to freeze the database and document library for migration.

## Convert the Database to PostgreSQL

Make sure your database is compatible with PostgreSQL 15. You can use a tool like [pgloader](https://pgloader.io/) to convert other database formats to PostgreSQL. However, you must take care to ensure the created database includes the correct data types and all relevant database objects (tables, indexes, and rules).

You should generally run Liferay with all your custom modules against an empty PostgreSQL 15 database to create the initial schema, and use that as the basis for your database conversion. Then you can move your data into the new database tables with a tool like `pgloader`.

Here are some important considerations when converting your database:

* Liferay tables must all be created in the `public` schema.

* Database columns storing boolean (true/false) data should be created with the `boolean` data type, not using `tinyint` or `smallint`.

* If your application uses custom object tables, these tables are not created automatically if you initialize an empty PostgreSQL database. Instead, you must export and import these objects to ensure they're included in the new schema.

* Some object tables for system objects are created using a company ID field in the name. Check these object tables and adjust all of them with a company ID in the name to match your source database's company ID.

* Liferay uses PostgreSQL rules to properly handle large objects in the database. Make sure you include the same rules defined [here](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/dao/db/PostgreSQLDB.java#L44-L59).

* If you rely on any custom tables not part of Liferay's schema, you must devise a solution to migrate each of those tables specifically.

* Check your application for any custom logic that leverages proprietary database features (e.g., functions or stored procedures). For example, MySQL database functions like `DAY` or `GROUP_CONCAT` don't work in PostgreSQL, so you must use alternatives.

Coordinate with your database administrator before and after the conversion to ensure data integrity. Test the converted database by [connecting it to a local Liferay installation](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database) before proceeding.

### Ensuring Correct Table Capitalization

Database table and column names are case sensitive in Liferay Cloud, and table names must be in Pascal case. If the table names were created in lower case, they're unrecognizable by Liferay Cloud. This can happen with certain operating system and database combinations. For example, MySQL is case-sensitive in Linux by default, but not in Windows or MacOS (where Liferay may generate tables with all lower case names).

Before you create a database dump, ensure that your database's tables have Pascal case capitalization. If not (i.e., they're all in lower case), you must convert them to Pascal case manually or with a script. You must also ensure that any of your own code that references the table names reflects the updated capitalization.

For example, convert these lower case table names:

* *accountentry* &rarr; *AccountEntry*

* *cpdefinition* &rarr; *CPDefinition*

* *trashentry* &rarr; *TrashEntry*

You can use the [`RENAME TABLE`](https://dev.mysql.com/doc/refman/5.7/en/rename-table.html) command in MySQL to change a table's name. Please [submit a Support ticket](https://help.liferay.com) if you need assistance adjusting your table names.

## Create a Database Dump

```{note}
If you are using Windows (OS), then you need file compression software to execute commands to pack/unpack compressed files. Install [7-zip](https://www.7-zip.org/) or similar file compression software to do this.
```

Now that the database is in MySQL format, run the following commands on your database server. Replace `#` with the database user and password, respectively, and `lportal` with your database name if necessary.

**For Linux and MacOS** (one command):

```bash
mysqldump -u##### -p##### --databases --add-drop-database lportal | gzip -c | cat > database.gz
```

**For Windows** (two commands):

```
mysqldump -u##### -p##### --databases --add-drop-database lportal > database.sql
```

```
7za a -tgzip database.gz database.sql
```

The server creates a compressed database dump file named `database.gz`. 

## Migrate the Document Library to a File System Store

If your document library is using an file storage method that is not a file system store (such as Amazon S3Store or DBStore), then you must migrate to a file system store before proceeding. You can either use the Simple File System Store or Advanced File System Store.

```{important}
The [Advanced File System Store](https://learn.liferay.com/w/dxp/system-administration/file-storage/configuring-file-storage) uses a folder structure that more easily scales to large data sets. Migrating to the Advanced File System Store is recommended to accommodate more files in the document library in the long term and is **required** for any production environment.
```

See [File Store Migration](https://learn.liferay.com/w/dxp/system-administration/file-storage/file-store-migration) for steps on how to migrate the document library.

### Create a Jenkins Build with the Change

After your local installation of Liferay is migrated, you must also create and deploy a build to your Liferay Cloud environments with the change to `portal-ext.properties`. You do not need to deploy any changes to your environments if you did not need to migrate your document library store.

Run Git commands to submit your changes using any terminal with Git installed.

1. Add the changed files to Git:

    ```bash
    git add .
    ```

1. Make a commit with your changes and a message:

    ```bash
    git commit -m "Liferay Cloud Migration Stage 2"
    ```

1. Push the changes to GitHub:

    ```bash
    git push origin master
    ```

Since your project is linked to the GitHub repository, pushing the changes automatically creates a build. Wait for the build to complete before proceeding.

### Deploy the Build to Your Chosen Environment

Finally, use the [Liferay Cloud Console](https://console.liferay.cloud/) to deploy the completed build to your chosen environment.

1. In the Liferay Cloud Console, go to the Builds page (using the link at the top of the page).

1. Find the build you created previously in the list, and from the Actions menu, click *Deploy build to*.

    ![Use the build's Actions menu to deploy it.](./creating-data-backup-files/images/01.png)

1. Select the environment to deploy the build to (e.g., `acme-dev`).

1. Read the information below and select the confirmation boxes to confirm the results of the deployment.

    ![Check the checkboxes and deploy the build when ready.](./creating-data-backup-files/images/02.png)

1. Click *Deploy Build*.

The build is deployed to your chosen environment, and the change to `portal-ext.properties` is applied when the `liferay` service restarts.

```{important}
All of your environments on Liferay Cloud must use the same implementation for the document library to allow backups from one environment to work if [restored to the others](../platform-services/backup-service/restoring-data-from-a-backup.md). You should deploy the build to all of your environments to make sure they all correctly use the migrated document library store.
```

## Compress the Document Library

On the server with your document library, run the following commands to compress the document library for upload.

**For Linux and MacOS** (two commands):

```bash
cd $LIFERAY_HOME/data
```

```bash
tar -czvf volume.tgz document_library
```

**For Windows** (three commands):

```
cd $LIFERAY_HOME\data
```

```
7za a volume.tar document_library
```

```
7za a volume.tgz volume.tar
```

You now have a compressed document library archive called `volume.tgz`.

## Next Steps

Now you have two files (`database.gz` and `volume.tgz`) ready to apply to a Liferay Cloud environment. Next, you will [upload and restore a data backup](./uploading-and-restoring-the-data-backup.md) using these files.
