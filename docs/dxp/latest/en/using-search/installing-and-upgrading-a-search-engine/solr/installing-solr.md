---
taxonomy-category-names:
- Search
- Search Engine Installation and Maintenance
- Liferay Self-Hosted
uuid: ffbbefb9-eab8-46b8-80c6-4589698e76e8
---
# Installing Solr

{bdg-secondary}`7.2-7.3 (CE, DXP); 7.4 DXP U60+`

Solr is a popular enterprise search platform built on Apache Lucene. It's reliable, scalable, and fault tolerant. Read more about it [here](http://lucene.apache.org/solr/).

!!! warning
    Solr is in [maintenance mode](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md#features-moved-to-maintenance-mode-in-74) in Liferay 7.4.

These instructions describe installing Solr 8 for the [compatible Liferay versions](https://help.liferay.com/hc/en-us/articles/360016511651-Search-Engine-Compatibility-Matrix). If installing Solr 7, adjust the version name as necessary.

```{important}
There are important limitations when using Solr. Read [Solr Limitations](./solr-limitations.md) before installing.
```

## Compatibility

See the [Search Engine Compatibility Matrix](https://help.liferay.com/hc/en-us/articles/360016511651) for detailed information on the compatible Solr and Liferay versions by patch level.

## Downloading the Solr Connector

```{warning}
Do not install the Solr connector into a running Liferay until the [blacklist](#disabling-elasticsearch-only-features) and [connector](#installing-and-configuring-the-solr-connector) configurations are in place and [Solr is running](#installing-and-configuring-solr).
```

If you haven't already acquired the connector to Solr,

1. In a running Liferay, go to Control Panel &rarr; Marketplace &rarr; Store. Sign in.

1. Grant access to the app.

1. Search for Solr 8 and select the app corresponding to your Liferay installation:

   | Liferay Flavor | Solr Connector Name |
   | :------------- | :------------------ |
   | Liferay Portal/Community Edition | Liferay CE Connector to Solr 8 |
   | Liferay DXP | Liferay Connector to Solr 8 |

1. Click the *Free* button in the app's landing page.

1. Choose a project if it exists, or add one.

1. Agree to the conditions and click *Purchase*.

After purchase, download the LPKG file from the Past Versions page.

1. Substitute your <https://liferay.com> `user.name` in the following URL:

   CE: <https://web.liferay.com/web/[user.name]/apps/-/marketplace_apps/225525277/versions>
   DXP: <https://web.liferay.com/web/[user.name]/apps/-/marketplace_apps/182518167/versions>

1. Click *App* to download the app's LPKG file.

Refer to the [Search Engine Compatibility Matrix](https://help.liferay.com/hc/en-us/articles/360016511651) for the compatible application versions for your Liferay version and patch level.

## Disabling Elasticsearch-Only Features

When installing the Liferay Connector to Solr, you must blacklist or otherwise disable

- the modules for certain DXP features that only work with Elasticsearch
- the Liferay Connector to Elasticsearch's modules

### Blacklisting Elasticsearch-Only Features

```{important}
Before proceeding, stop Liferay.
```

To blacklist Elasticsearch-only features,

1. On Liferay DXP 7.4, use a portal property or Docker environment variable to disable all [Liferay Enterprise Search](../../liferay-enterprise-search.md) features:

   Add this property to `portal-ext.properties`:

   ```properties
   enterprise.product.enterprise.search.enabled=false
   ```

   Set this Docker environment variable:

   ```properties
   LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_ENTEPRISE_PERIOD_SEARCH_PERIOD_ENABLED=false
   ```

   See [Activating Liferay Enterprise Search](../../liferay-enterprise-search/activating-liferay-enterprise-search.md) for more information.

1. Create a blacklist [configuration file](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md). The name depends on your Liferay version:

   For Liferay 7.4, create

   ```bash
   com.liferay.portal.bundle.blacklist.internal.configuration.BundleBlacklistConfiguration.config
   ```

   For Liferay 7.2 and 7.3, create

   ```bash
   com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
   ```

1. Enter the configuration for your version of Liferay. 

   **Liferay 7.4:** 

   ```properties
   blacklistBundleSymbolicNames=[\
      "com.liferay.portal.search.elasticsearch7.api",\
      "com.liferay.portal.search.elasticsearch7.impl",\
      "com.liferay.portal.search.elasticsearch7.spi",\
   ]
   ```

   This configuration disables the [Elasticsearch 7 search engine connector's](../elasticsearch/installing-elasticsearch.md) modules. The `enterprise.product.enterprise.search.enabled=false` property disables [Liferay Enterprise Search](../../liferay-enterprise-search.md) modules. Installing Solr automatically disables other [incompatible features](./solr-limitations.md).

   **Liferay 7.2 and 7.3:**

   ```properties
   blacklistBundleSymbolicNames=[\
      "com.liferay.portal.search.elasticsearch7.api",\
      "com.liferay.portal.search.elasticsearch7.impl",\
      "com.liferay.portal.search.elasticsearch7.spi",\
      "com.liferay.portal.search.tuning.rankings.web",\
      "com.liferay.portal.search.tuning.synonyms.web",\
      "com.liferay.portal.search.tuning.web",\
      "com.liferay.portal.search.tuning.web.api"\
   ]
   ```

1. Place the file in Liferay's `osgi/configs` folder.

## Installing and Configuring Solr

To install and configure Solr for Liferay,

1. Download a [compatible](https://help.liferay.com/hc/en-us/articles/360016511651) Solr server and unzip it.

1. Navigate to `solr-[version]/server/solr`.

1. Create a new folder called `liferay` and two subfolders: `liferay/conf` and `liferay/data`.

1. Copy the contents of `configsets/_default/conf` to the `liferay/conf` folder.

1. Open the Liferay Connector to Solr 8's LPKG file with an archive manager.

1. Open the `Liferay Connector to Solr 8 - Impl.lpkg`.

1. Open the `com.liferay.portal.search.solr8.impl.jar` file, and extract

   ```
   META-INF/resources/solrconfig.xml
   ```

   and

   ```
   META-INF/resources/schema.xml
   ```

   to

   ```
   liferay/conf
   ```

   This replaces the current `solrconfig.xml` and `schema.xml` files with ones that tell Solr how to index data coming from Liferay.

1. Create a `core.properties` file in the `liferay` folder and add this configuration:

   ```properties
   config=solrconfig.xml
   dataDir=data
   name=liferay
   schema=schema.xml
   ```

1. Checkpoint: your `liferay` folder now has this structure:

   ```bash
   liferay
   ├── conf
   │   ├── lang
   │   │   ├── contractions_ca.txt
   │   │   ├── ....txt
   │   ├── managed-schema
   │   ├── protwords.txt
   │   ├── schema.xml
   │   ├── solrconfig.xml
   │   ├── stopwords.txt
   │   └── synonyms.txt
   ├── core.properties
   └── data
   ```

1. Start the Solr server by entering the following from the top-level folder of your Solr installation (`solr-[version]`):

   ```bash
   ./bin/solr start -f
   ```

1. The Solr server listens on port `8983` by default. Navigate to <http://localhost:8983/solr/#/~cores> (assuming you're testing locally with `localhost` as your host), and confirm that the `liferay` core is available.

Solr is now installed and started. Next install and configure the Solr connector for Liferay.

## Installing and Configuring the Solr Connector

```{important}
Before proceeding, stop Liferay.
```

Once the connector to Solr is installed, the default configuration works for a test installation because the default values in the Liferay Connector to Solr match Solr's own defaults. See the [Configuration Reference](#solr-connector-configuration-reference) for the complete list of available settings. At a minimum, you must configure the read and write URLs for the connector in production environments.

It is most common to make your edits to the Solr connector's default configurations using a configuration file deployed to Liferay's `osgi/configs` folder:

1. Name the file

   ```
   com.liferay.portal.search.solr8.configuration.SolrConfiguration.config
   ```

1. Copy the Solr connector LPKG you [downloaded](#downloading-the-solr-connector) to Liferay's `osgi/marketplace` folder and place its configuration files in `osgi/configs`.

1. Start Liferay.

1. Verify the Solr connection in Liferay. Open the Global Menu and navigate to *Control Panel* &rarr; *Configuration* &rarr; *Search* and make sure the connection is active.

   ![Verify the Solr connection in the search administration console.](./installing-solr/images/01.png)

1. Reindex your Liferay data into Solr. Open the Global Menu and navigate to *Control Panel* &rarr; *Configuration* &rarr; *Search*. In the Index Actions pane, click *Execute* next to the Reindex Search Indexes option.

   Reindex the spell check indexes too.

## High Availability with SolrCloud

Use SolrCloud if you need a cluster of Solr servers. Note that to use SolrCloud in production, you should set up an [external ZooKeeper ensemble](https://cwiki.apache.org/confluence/display/solr/Setting+Up+an+External+ZooKeeper+Ensemble). [ZooKeeper](http://zookeeper.apache.org/) is a centralized coordination service for managing distributed systems like your SolrCloud cluster.

The steps included here are the bare minimum of what you must do to configure SolrCloud with Liferay. For example, these instructions cover configuring SolrCloud on a single machine. A production environment should feature multiple physical or virtual machines. These instructions also assume you've followed *Installing and Configuring Solr* above. Refer to the [SolrCloud guide for more information](https://cwiki.apache.org/confluence/display/solr/SolrCloud).

1. Stop the Solr server if it's running.

1. Navigate to the `configsets` folder in the Solr installation (`solr-[version]/server/solr/configsets`).

1. Create a folder called `liferay_configs`.

1. Copy the `conf` folder from `solr-[version]/server/solr/liferay` to the `liferay_configs` folder you just created.

   The `configset/liferay_configs` folder contains the SolrCloud Liferay collection configuration and is uploaded to ZooKeeper. When you copy the `conf` folder from the `liferay` server configured earlier, you use the `schema.xml` and `solrconfig.xml` files provided with the Liferay Solr Adapter.

1. Launch an interactive SolrCloud session to configure your SolrCloud cluster. From the Solr installation root, run

   ```bash
   ./bin/solr -e cloud
   ```

1. Complete the setup wizard. These steps demonstrate creating a two-node cluster:

    - Enter `2` for the number of nodes.
    - Specify ports `8983` and `7574` (the defaults). Both nodes are started with the start commands printed in the log:

       ```
       Starting up Solr on port 8983 using command:
       "bin/solr" start -cloud -p 8983 -s "example/cloud/node1/solr"

       Waiting up to 180 seconds to see Solr running on port 8983 [|]  [-]  
       Started Solr server on port 8983 (pid=8846). Happy searching!

           
       Starting up Solr on port 7574 using command:
       "bin/solr" start -cloud -p 7574 -s "example/cloud/node2/solr" -z localhost:9983

       Waiting up to 180 seconds to see Solr running on port 7574 [|]  [/]  
       Started Solr server on port 7574 (pid=9026). Happy searching!
       ```

    - Name the collection *liferay*.
    - Split the collection into two shards.
    - Specify two replicas per shard.
    - When prompted to choose a configuration, enter *liferay_configs*. You should see a log message that concludes like this when the cluster has been started:

    ```bash
    SolrCloud example running, please visit http://localhost:8983/solr
    ```

Now you have a new collection called *liferay* in your local SolrCloud cluster. Verify its status by running the `status` command:

```bash
./bin/solr status
```

The log output states that the nodes are found and lists information for each node:

```
Found 2 Solr nodes: 

Solr process 725273 running on port 8983
{
  "solr_home":"/home/me/_temp/solr-8.11.2/example/cloud/node1/solr",
  "version":"8.11.2 17dee71932c683e345508113523e764c3e4c80fa - mdrob - 2022-06-13 11:27:54",
  "startTime":"2023-01-05T20:29:45.779Z",
  "uptime":"0 days, 0 hours, 1 minutes, 29 seconds",
  "memory":"99.6 MB (%19.4) of 512 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}
...
```

To stop Solr while running in SolrCloud mode, use the `stop` command, like this:

```bash
./bin/solr stop -all
```

## Configure the Solr Connector for SolrCloud

To support SolrCloud in Liferay, specify the client type as *CLOUD* in Liferay's Solr connector.

1. From System Settings or your OSGi configuration file, set the *Client Type* to *CLOUD*.

   ```properties
   clientType="CLOUD"
   ```

1. Start Liferay. If this is the first time starting after installing the Solr connector LPKG, follow the instructions in the log to restart Liferay.

![From the Solr System Settings entry, set the Client Type to Cloud.](./installing-solr/images/03.png)

## Solr Connector Configuration Reference

In addition to using configuration files, you can update the Solr 8 configuration using System Settings.

![Configuring Solr from Liferay's System Settings application is most useful during development and testing.](./installing-solr/images/02.png)

Below are the default configurations along with settings that become available (in the System Settings Search category or configurable by `.config` file) when you install the Solr connector application. These settings accept a limited set of values:

**Configuration File:** `com.liferay.portal.search.solr8.configuration.SolrConfiguration.config` \

**System Settings Entry:** *Solr 8*

```properties
authenticationMode=["BASIC" or "CERT"]
clientType=["REPLICATED" or "CLOUD"]
defaultCollection="liferay"
logExceptionsOnly=B"true"
readURL="http://localhost:8983/solr/liferay"
writeURL="http://localhost:8983/solr/liferay"
zkHost="localhost:9983"
```

**Configuration File:** `com.liferay.portal.search.solr8.configuration.SolrHttpClientFactoryConfiguration.config` \

**System Settings Entry:** *Solr 8 HTTP Client Factory*

```properties
basicAuthPassword="solr"
basicAuthUserName="solr"
defaultMaxConnectionsPerRoute="20"
maxTotalConnections="20"
```

**Configuration File:** `com.liferay.portal.search.solr8.configuration.SolrSSLSocketFactoryConfiguration.config` \

**System Settings Entry:** *Solr 8 SSL Factory*

```properties
keyStorePassword="secret"
keyStorePath="classpath:/keystore.jks"
keyStoreType="JKS"
trustStorePassword="secret"
trustStorePath="classpath:/truststore.jks"
trustStoreType="JKS"
verifyServerCertificate=B"true"
verifyServerName=B"true"
```
