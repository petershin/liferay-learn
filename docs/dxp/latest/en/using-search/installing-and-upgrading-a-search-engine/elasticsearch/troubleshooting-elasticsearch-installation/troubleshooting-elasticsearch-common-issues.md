---
taxonomy-category-names:
- Search
- Search Engine Installation and Maintenance
- Liferay Self-Hosted
uuid: 1d1a8618-5531-4c24-837e-bfecea9c1263
---
# Troubleshooting Elasticsearch: Common Issues

Listed here are some common issues you may encounter while configuring Elasticsearch and Liferay. Additional connection-specific errors are discussed in [Troubleshooting the Elasticsearch Connection](./troubleshooting-the-elasticsearch-connection.md).

## Cluster Name

The value of the `cluster.name` property in `elasticsearch.yml` must match the `clusterName` property configured in the Liferay Elasticsearch connector.

## Transport Addresses

The value of the `transportAddresses` property in the Elasticsearch connector configuration must contain at least one valid host and port where an Elasticsearch node is running. If Liferay is running in embedded mode and you start a standalone Elasticsearch node or cluster, it detects that port `9300` is taken and switches to port `9301`. If you then set Liferay's Elasticsearch connector to remote mode, it continues to look for Elasticsearch at the default port (`9300`). Make sure to list all master and data node addresses of the cluster.

[Connecting to Elasticsearch](../connecting-to-elasticsearch.md) covers the connector configuration options in more detail.

## Network Host Addresses

In Liferay 7.3+, the bundled [sidecar Elasticsearch](../using-the-sidecar-or-embedded-elasticsearch.md) server runs on port `9201` by default. This means that setting the `networkHostAddress` of your remote Elasticsearch installation using Elasticsearch's default HTTP port (`9200`) does not cause a conflict. As with the transport addresses, make sure to list all master and data node addresses of the cluster.

## Cluster Sniffing (Additional Configurations)

Elasticsearch clusters can have multiple node [types](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-node.html#modules-node). [Cluster sniffing](https://www.elastic.co/guide/en/elasticsearch/client/java-api/7.x/transport-client.html), enabled by default in the Elasticsearch connector, looks for data nodes configured in the `transportAddresses` property. If none are available, the connector may throw a `NoNodeAvailableException` in the console log. To avoid this error and continue using cluster sniffing, configure at least one data node's transport address.

To disable cluster sniffing, add `clientTransportSniff=false` to the `.config` file or un-select the Client Transport Sniff property in System Settings.

## Docker Connection Refused

The Liferay DXP container must recognize the Elasticsearch IP to establish a connection. Add `/etc/hosts/` entries that map the Elasticsearch container name to the Elasticsearch server host IP address during the `docker run` phase by passing an argument like this:

```bash
--add-host elasticsearch:[IP address]
```

To obtain the IP addresses of all running containers, run 

```bash
docker network inspect bridge
```

## Configuration File Names

When you have problems connecting Liferay to Elasticsearch (perhaps seeing `NoNodeAvailableException` messages in the Liferay log), one of the first steps to take is confirming properly named configuration files. Unrecognizable configuration files aren't processed, and resulting errors can vary.

## Disable Elasticsearch Deprecation Logging

Sometimes Elasticsearch APIs used in Liferay's Elasticsearch connectors are deprecated. Even when there's no impact to the functionality required by Liferay, warning log messages can result:

```
[2019-07-16T14:47:05,779][WARN ][o.e.d.c.j.Joda           ] [
ode_name]'y' year should be replaced with 'u'. Use 'y' for year-of-era. Prefix your date format with '8' to use the new specifier.
[2019-07-16T14:47:06,007][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.certificate] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,007][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.certificate_authorities] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,008][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.key] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,463][WARN ][o.e.d.x.c.s.SSLService   ] [
ode_name]SSL configuration [xpack.http.ssl] relies upon fallback to another configuration for [key configuration, trust configuration], which is deprecated.
[2019-07-16T14:47:06,464][WARN ][o.e.d.x.c.s.SSLService   ] [
ode_name]SSL configuration [xpack.security.transport.ssl.] relies upon fallback to another configuration for [key configuration, trust configuration], which is deprecated.
1. 07-16T14:47:05,779][WARN ][o.e.d.c.j.Joda           ] [
```

These warnings do not signal any functional issues and can be disabled (see [Deprecation Logging](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/logging.html#deprecation-logging) to learn how).

## Field Type Errors

If Elasticsearch is allowed to auto-create indexes and a full reindex is performed, in rare cases the Liferay mappings are not created in time for the index recreation. The default Elasticsearch mappings are applied instead, resulting in errors during search execution. This issue was solved for Liferay DXP 2024.Q2+/Portal 7.4 GA120+ by automatically disabling the auto-creation of Liferay's indexes in Elasticsearch.

```
org.elasticsearch.ElasticsearchStatusException: ElasticsearchStatusException[Elasticsearch exception [type=search_phase_execution_exception, reason=all shards failed]]; nested: ElasticsearchException[Elasticsearch exception [type=illegal_argument_exception, reason=Text fields are not optimised for operations that require per-document field data like aggregations and sorting, so these operations are disabled by default. Please use a keyword field instead. Alternatively, set fielddata=true on [entryClassPK] in order to load field data by uninverting the inverted index. Note that this can use significant memory.]]; nested: ElasticsearchException[Elasticsearch exception [type=illegal_argument_exception, reason=Text fields are not optimised for operations that require per-document field data like aggregations and sorting, so these operations are disabled by default. Please use a keyword field instead. Alternatively, set fielddata=true on [entryClassPK] in order to load field data by uninverting the inverted index. Note that this can use significant memory.]];
```
In earlier versions the solution is to disable index auto-creation in Elasticsearch for the `liferay-*` indexes. Set `action.auto_create_index: "-liferay-*"` in the `elasticsearch.yml` or make a PUT request to the [Index API](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/docs-index_.html#index-creation).

## Related Topics

* [Connecting to Elasticsearch](../connecting-to-elasticsearch.md)
* [Troubleshooting Elasticsearch Installation](../troubleshooting-elasticsearch-installation.md)
* [Troubleshooting the Elasticsearch Connection](./troubleshooting-the-elasticsearch-connection.md)
