---
taxonomy-category-names:
- Search
- Search Engine Installation and Maintenance
- Liferay Self-Hosted
uuid: c8e15e41-e367-4693-8f17-27c68c35343d
---
# Installing Elasticsearch

Here's how to install, configure, and start Elasticsearch on-premises.

```{note}
If you have Elasticsearch indexes used for primary data storage (storing data not backed by a database) you can bring that data into your new Elasticsearch cluster using the [snapshot and restore approach](./upgrading-elasticsearch/backing-up-elasticsearch.md). Liferay's own Search Tuning indexes (for Result Rankings and Synyonyms) are primary storage indexes on Liferay DXP 7.2 and 7.3.
```

## Environment Setup for Production-Like Installation

### Adding Hosts

You can skip this if you'll set up a testing environment using localhost or Docker containers. For a production-like setup on your local machine, add the hosts for Liferay and the Elasticsearch cluster. Add this information to your operating system's `path/to/etc/hosts` file:

```properties
<your IP> es-node1
<your IP> es-node2
<your IP> es-node3
<your IP> dxp.liferay.com
```

Use the real IP address of your system, not the loopback address `127.0.0.1`.

### Adjusting mmap

Elasticsearch requires a higher _mmap count_ (for mapping the directory holding its indexes into memory) than the default for most operating systems. On Linux and as the root user, run

```bash
sysctl -w vm.max_map_count=262144
```

### Compatibility Headers

For Elasticsearch 8, if there is a firewall or proxy between Liferay and Elasticsearch, make sure the compatibility HTTP headers Liferay sets on each request are allowed and preserved in the network traffic. See [Elasticsearch's Requesting REST API Compatibility](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-api-compatibility.html#request-rest-api-compatibility) for more information.

## Install Elasticsearch

1. Download an Elasticsearch archive from [Elastic's website](https://www.elastic.co).

    ```{important}
    Download the latest Elasticsearch archive [compatible with your Liferay version](./connecting-to-elasticsearch.md#available-liferay-elasticsearch-connectors).
    ```

1. Extract the archive contents to a local folder where you want to run Elasticsearch. This folder is your *Elasticsearch Home*.

1. Install the required Elasticsearch plugins by running these commands in your `[Elasticsearch Home]/bin` folder:

   ```bash
   ./elasticsearch-plugin install analysis-icu
   ```

   ```bash
   ./elasticsearch-plugin install analysis-kuromoji
   ```

   ```bash
   ./elasticsearch-plugin install analysis-smartcn
   ```

   ```bash
   ./elasticsearch-plugin install analysis-stempel
   ```

## Configure Elasticsearch

Each Elasticsearch server is configured by its `[Elasticsearch Home]/config/elasticsearch.yml` file.

Here are example single-node and multi-node Elasticsearch cluster configurations.

See [Securing Elasticsearch](./securing-elasticsearch.md) to learn about authenticating and encrypting communication with the Elasticsearch server(s).

### Example: Single-Node Production Elasticsearch Cluster

Here's an `elasticsearch.yml` configuration for a single-node cluster:

```yaml
cluster.name: LiferayElasticsearchCluster

discovery.type: single-node
http.port: 9200
network.host: es-node1
node.name: es-node1
transport.port: 9300

# Add security settings below
xpack.security.enabled: false
```

This cluster called `LiferayElasticsearchCluster` has one node called `es-node1`.

```{tip}
If you are not configuring hosts for a production mode setup, use `localhost` as the host value. Elasticsearch can bind to loopback addresses for HTTP and Transport communication. Along with single node discovery, this means the Elasticsearch server is running in `development mode`.
```

### Example: Multi-Node Production Elasticsearch Cluster

Here is an `elasticsearch.yml` for a node called `es-node3` of a three-node cluster:

```yaml
cluster.name: LiferayElasticsearchCluster

# Example production mode settings - 3-node cluster
cluster.initial_master_nodes:
  - es-node1
  - es-node2
  - es-node3
discovery.seed_hosts:
  - es-node1:9300
  - es-node2:9301
  - es-node3:9302
http.port: 9202
network.host: es-node3
node.name: es-node3
transport.port: 9302

# Add security settings below
xpack.security.enabled: false
```

```{tip}
If you are not configuring hosts for a production mode setup, use `localhost` as the host value. Elasticsearch can bind to loopback addresses for HTTP and Transport communication. This is referred to as `development mode`.

Related Elasticsearch Documentation:

- [Important Elasticsearch configuration](https://www.elastic.co/guide/en/elasticsearch/reference/8.12/important-settings.html)

- [Security settings in Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/8.12/security-settings.html)

- [Bootstrap Checks, Development vs. production mode](https://www.elastic.co/guide/en/elasticsearch/reference/8.12/bootstrap-checks.html)
```

```{important}
Each Elasticsearch node's `elasticsearch.yml` file must use unique values for the following properties.

- `node.name`

- `http.port`

- `network.host`

- `transport.port`
```

### Enforce Bootstrap Checks for Single Server in Production Mode

Elasticsearch [bootstrap checks](https://www.elastic.co/guide/en/elasticsearch/reference/8.12/bootstrap-checks.html) inspect configurations on startup and logs warnings for missing or suspicious configurations. In production, you should configure bootstrap checks to halt startup on misconfiguration. 

To enforce the bootstrap checks in a single-node cluster, add this property to the end of your node's `[Elasticsearch Home]/config/jvm.options` file:

```properties
-Des.enforce.bootstrap.checks=true
```

## Start Elasticsearch

Start Elasticsearch from the `bin` folder:

```bash
./elasticsearch
```

```{tip}
If Elasticsearch fails to start with the ERROR message `Elasticsearch exited unexpectedly` in the log, increase the heap size. During testing you can open the `config/jvm.options` file and uncomment the example settings for `-Xms4g` and `-Xmx4g`. In production, follow the instructions in that file to set these parameters properly.

See [Troubleshooting Elasticsearch Installation](./troubleshooting-elasticsearch-installation.md) for more information.
```

Elasticsearch starts, and one of its status messages includes a transport address: 

```log
[2019-04-01T16:55:50,127][INFO ][o.e.t.TransportService   ] [HfkqdKv] publish_address {127.0.0.1:9300}, bound_addresses {[::1]:9300}, {127.0.0.1:9300}
```

If you're running Liferay 7.2, note the `publish_address` address in the `TransportService` status message; you must configure the Liferay servers to connect to Elasticsearch at this address. 

Elasticsearch is ready for [connections from Liferay](./connecting-to-elasticsearch.md).

If you're running in production, [secure communication between Liferay and Elasticsearch](./securing-elasticsearch.md).

## Related Topics

* [Securing Elasticsearch](./securing-elasticsearch.md)
* [Liferay Enterprise Search](../../liferay-enterprise-search.md)
* [Search Pages](../../search-pages-and-widgets/working-with-search-pages/search-pages.md)
* [Administering and Tuning Search](../../search-administration-and-tuning.md)
* [Elasticsearch Connector Settings](./elasticsearch-connector-configuration-reference.md)
