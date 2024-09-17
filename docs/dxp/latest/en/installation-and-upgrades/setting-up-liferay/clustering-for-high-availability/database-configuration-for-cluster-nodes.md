---
uuid: f1547302-f5a0-4ae5-8c99-6f7d8dd1632e
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
---
# Database Configuration for Cluster Nodes

At minimum, nodes in a DXP cluster must be [configured to share the same database](./example-creating-a-simple-dxp-cluster.md#configure-cluster-link-and-the-other-server-connections) (or database cluster) in order to function. Optimizations discussed here can further improve database performance for a DXP cluster and should be considered with consideration for your usage of DXP and expected transaction volume.

!!! warning
    Clustering will not work with the embedded HSQL database.

## Read-Writer Database Configuration

To improve database performance, you can use a read-writer database configuration. Instead of using the same data source for read and read-write operations, this strategy uses a separate data source for each operation type. DXP's Aspect Oriented Programming (AOP) transaction infrastructure directs read transactions to the read data source and read-write transactions to the write data source.

![Read-Writer Database Interaction](./database-configuration-for-cluster-nodes/images/01.png)

Connections to separate read and read-write [data sources](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) are configured using JDBC or JNDI [Portal Properties](../../reference/portal-properties.md) (e.g., in a [`portal-ext.properties` file](../../reference/portal-properties.md)), as explained in the following sections. The data sources should use separate instances of the DXP database, where the read-write database instance is replicated to the read database instance.

### JDBC

Follow these steps to edit your `portal-ext.properties` file to connect directly to separate read and write data sources using [JDBC](../../installing-liferay/configuring-a-database.md):

1. Configure JDBC connections to separate read and write data sources. See the [JDBC properties reference](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) for more information. Here's an example:


   ```properties
   jdbc.read.driverClassName=[place your driver name here]
   jdbc.read.url=[place the URL to your "read" database here]
   jdbc.read.username=[place your user name here]
   jdbc.read.password=[place your password here]

   jdbc.write.driverClassName=[place your driver name here]
   jdbc.write.url=[place the URL to your "read-write" database here]
   jdbc.write.username=[place your user name here]
   jdbc.write.password=[place your password here]
   ```

   !!! note
       Liferay uses HikariCP as the connection pool provider.

   For example JDBC connection values, please see [Database Templates](../../reference/database-templates.md).

1. Configure the read and write pool timeouts and size settings

   ```properties
   jdbc.read.connectionTimeout=30000
   jdbc.read.idleTimeout=600000
   jdbc.read.maximumPoolSize=100
   jdbc.read.maxLifetime=0
   jdbc.read.minimumIdle=10
   jdbc.read.registerMbeans=true

   jdbc.write.connectionTimeout=30000
   jdbc.write.idleTimeout=600000
   jdbc.write.maximumPoolSize=100
   jdbc.write.maxLifetime=0
   jdbc.write.minimumIdle=10
   jdbc.write.registerMbeans=true
   ```

1. **(This step is only necessary for DXP 7.4 U69 and below)** Configure DXP to use the write data source (the data source whose prefix is `jdbc.write.`) to create the [Counter](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter) data source. A separate data source is always dedicated to the counter.

   ```properties
   counter.jdbc.prefix=jdbc.write.
   ```

1. Optionally validate the data connections to make sure bad connections are handled gracefully.

1. **(This step is only necessary for DXP 7.3 U22, DXP 7.4 U65 and below)** Enable the read-writer database configuration by copying the default [`spring.infrastructure.configs` Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) to your `portal-ext.properties` file and adding the following Spring configuration file paths to them.

   Add to `spring.infrastructure.configs`:

   ```
   META-INF/dynamic-data-source-infrastructure-spring.xml
   ```

   For more information, see the [Spring configuration Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring).

### JNDI

Edit your `portal-ext.properties` file following these steps to connect to your read and write data sources on your app server using JNDI:

1. Set your read and write JNDI data source user names and passwords.

   ```properties
   jdbc.read.jndi.name=[place your "read" data source JNDI name here]

   jdbc.read.username=*[place your user name here]
   jdbc.read.password=[place your password here]

   jdbc.write.jndi.name=[place your "read-write" data source JNDI name here]

   jdbc.write.username=[place your user name here]
   jdbc.write.password=[place your password here]
   ```

1. Configure the read and write pool timeouts and size settings

   ```properties
   jdbc.read.connectionTimeout=30000
   jdbc.read.idleTimeout=600000
   jdbc.read.maximumPoolSize=100
   jdbc.read.maxLifetime=0
   jdbc.read.minimumIdle=10
   jdbc.read.registerMbeans=true

   jdbc.write.connectionTimeout=30000
   jdbc.write.idleTimeout=600000
   jdbc.write.maximumPoolSize=100
   jdbc.write.maxLifetime=0
   jdbc.write.minimumIdle=10
   jdbc.write.registerMbeans=true
   ```

1. **(This step is only necessary for DXP 7.4 U69 and below)** Configure DXP to use the write data source (the data source whose prefix is `jdbc.write.`) to create the [Counter](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter) data source. A separate data source is always dedicated to the counter.

   ```properties
   counter.jdbc.prefix=jdbc.write.
   ```

1. Optionally validate the data connections to make sure bad connections are handled gracefully.

1. **(This step is only necessary for DXP 7.4 U65 and below or DXP 7.3 U22 and below)** Enable the read-writer database configuration by copying the default [`spring.infrastructure.configs` Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) to your `portal-ext.properties` file and adding the following Spring configuration file paths to them.

   Add to `spring.infrastructure.configs`:

   ```
   META-INF/dynamic-data-source-infrastructure-spring.xml
   ```

   For more information, see the [Spring configuration Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring).

DXP uses a read data source, a write data source, and a counter data source the next time it starts.

## Database Replication

Using a database cluster improves fault tolerance and DXP performance. Database cluster instances must be stay in sync. Replication is the process of copying changed data and changed schema from one database instance to another. All [supported databases](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-Quarterly-Releases-Compatibility-) support replication. If you're using a database cluster, set up the databases for replication by following the database vendor's instructions.

## What's Next

Now that you've configured the database for your cluster, you can continue addressing the [DXP clustering requirements](../clustering-for-high-availability.md#clustering-requirements). The next requirement is to make your [File Store](../../../system-administration/file-storage.md) accessible to all nodes and configure each node with that File Store.