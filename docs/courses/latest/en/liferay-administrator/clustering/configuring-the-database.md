---
toc:
uuid: 134cc9ab-cbad-40b2-b44b-b085708bf0f8
---
# Configuring the Database

Liferay supports many database software options such as MySQL or MariaDB. Note, a Liferay bundle uses an embedded HSQL database by default but it is recommended to use a full-featured database for your production environment. See [configuring a database](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database) to learn more.

## Running MariaDB in Docker

1. In your terminal, run the following,

   ```bash
   docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:10.7
   ```

1. Sign in to the database server.

   ```bash
   docker exec -it some-mariadb bash -c "/usr/bin/mysql -uroot -pmy-secret-pw"
   ```

1. Create a database that will be used by the cluster.

   ```bash
   create database dxp_db character set utf8;
   ```

1. Verify the creation of the database with the following command:

   ```bash
   show databases;
   ```

   A list of databases should be listed including the `dxp_db` database.

Next, we will [configure Elasticsearch](./configuring-search.md)

## Relevant Concepts

- [Configuring a Database](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database)
- [Database Configuration for Cluster Nodes](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/database-configuration-for-cluster-nodes)
