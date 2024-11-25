---
taxonomy-catagory-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 9a008a3e-9fa7-45ad-9200-d4b40bf628a2
---

# Creating a Database Dump

[Uploading a backup](./downloading-and-uploading-backups.md) to Liferay Cloud's backup service requires a snapshot comprised of two compressed files, containing the document library and database dump, respectively. To upload data from a local Liferay instance's database, you must be able to create a dump to upload. This is required for [migrating to Liferay Cloud](../../migrating-to-liferay-cloud.md) and [Liferay upgrades](../../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/upgrading-your-liferay-dxp-instance.md).

!!! note
    The backup service only supports backing up and restoring one database (the database set via the `lcp-secret-database-name` secret, usually `lportal`). Compressing and uploading multiple databases is not supported.

## Ensuring Correct Table Capitalization

Database table and column names are case sensitive in Liferay Cloud, and they must follow a convention that differs by type of database (PostgreSQL or MySQL). Errors with table name capitalization can occur with certain operating systems or conversions between database types. For example, MySQL is case-sensitive in Linux by default, but not in Windows or MacOS (where Liferay may generate tables with all lower case names).

Before you create a database dump, ensure that your database’s tables have the appropriate capitalization. If your database's tables don't have the correct capitalization pattern, you must convert them to the correct format manually or with a script. You must also ensure that any of your own code that references the table names reflects the updated capitalization. Please [submit a Support ticket](../../support-and-troubleshooting/liferay-cloud-support.md#opening-a-support-ticket) if you need assistance adjusting your table names.

### PostgreSQL Capitalization (Lower Case)

For PostgreSQL, table names must be in _lower case_ to avoid errors. If the table names were created with upper case characters (like [PascalCase](#mysql-capitalization-pascal-case)), they're unrecognizable by Liferay Cloud. If you converted your database to PostgreSQL with a tool like [pgloader](https://pgloader.io/), the names are converted to lower case by default.

For example, convert these Pascal case table names:

* _AccountEntry_ → _accountentry_

* _CPDefinition_ → _cpdefinition_

* _TrashEntry_ → _trashentry_

You can use the `ALTER TABLE` command in PostgreSQL to change a table's name.

### MySQL Capitalization (Pascal Case)

For MySQL, table names must be in _Pascal case_. If the table names were created in lower case, they're unrecognizable by Liferay Cloud.

For example, convert these lower case table names:

* _accountentry_ → _AccountEntry_

* _cpdefinition_ → _CPDefinition_

* _trashentry_ → _TrashEntry_

You can use the `RENAME TABLE` command in MySQL to change a table’s name.

## Creating and Compressing a PostgreSQL Database Dump

The commands to create and compress a database dump for PostgreSQL depend on your operating system. The commands shown here compress the database dump into a `database.gz` file, which is the required format for database uploads to Liferay PaaS.

!!! note
    If you are using Windows (OS), you must install file compression software to execute commands to pack/unpack compressed files. Install [7-zip](https://www.7-zip.org/) or similar file compression software to do this.

**For Linux/MacOS**:

Run these commands to perform the dump and compress it (replace the variable values with your own username, host, and database name):

```bash
USERNAME=dxpcloud
HOST=localhost
DATABASE=lportal

pg_dump -U ${USERNAME} --format=plain --no-owner --no-acl -h ${HOST} -d ${DATABASE} | gzip > database.gz
```

**For Windows**:

Run these commands to perform the dump and compress it (replace the variable values with your own username, host, and database name):

```bash
SET USERNAME=dxpcloud
SET HOST=localhost
SET DATABASE=lportal

pg_dump -U %USERNAME% --format=plain --no-owner --no-acl -h %HOST% -d %DATABASE% -f database.sql

7za a -tgzip database.gz database.sql
```

You can also download a database dump from the backup service to see how the backup service creates its PostgreSQL dump file.

The resulting dump file should not contain any statements to drop or create the database. Here is an example:

```{literalinclude} ./creating-a-database-dump/resources/database.sql
```

## Creating and Compressing a MySQL Database Dump

The steps shown here compress the MySQL database dump into a `database.gz` file, which is the required format for database uploads to Liferay PaaS.

!!! note
    If you are using Windows, these steps assume you have [7-Zip](https://www.7-zip.org/download.html) installed to compress the database dump. You must also have direct access to the MySQL database.

1. Perform the database dump and compress it into a `.gz` archive.

    **For Linux and MacOS**:

    ```bash
    mysqldump -uroot -ppassword --databases --add-drop-database lportal | gzip -c | cat > database.gz
    ```

    **For Windows**:

    ```bash
    mysqldump -u##### -p##### --databases --add-drop-database lportal > database.sql
    ```

    ```bash
    7za a -tgzip database.gz database.sql
    ```

    The `--databases` and `--add-drop-database` flags are necessary for backup restoration to work correctly. You can also use the `/backup/download` API to see how the backup service creates its MySQL dump file.

The resulting database dump contains the following code before the `create table` statements.

```sql
--
-- Current Database: `lportal`
--

/*!40000 DROP DATABASE IF EXISTS `lportal`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lportal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lportal`;
```

## Related Topics

- [Downloading and Uploading Backups](./downloading-and-uploading-backups.md)
