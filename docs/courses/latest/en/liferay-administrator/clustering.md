---
toc:
uuid: 1dc9419e-caaa-4805-8289-bb7629674882
---
# Clustering

```{toctree}
:maxdepth: 3

```

For increased reliability and performance, Liferay can be set up in a clustered environment. Even if one server fails, another server will still seamlessly serve data. And JVM processes running in parallel can take advantage of a server's processing power.

Liferay can be configured in both a horizontal clustering or vertical clustering approach. In a horizontal cluster, each node is running on a separate machine. In a vertical cluster, multiple virtual Java machines are running on a single machine.

Here you'll learn how to

* Configure a database for a clustered environment
* Configure Elasticsearch for a clustered environment
* Run two Liferay nodes in a cluster

The first step is [configuring a database](./clustering/configuring-the-database.md).
