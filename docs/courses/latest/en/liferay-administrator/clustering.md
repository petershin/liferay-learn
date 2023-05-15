---
toc:
- ./clustering/configuring-the-database.md
- ./clustering/configuring-search.md
- ./clustering/configuring-the-dxp-cluster.md
uuid: 1dc9419e-caaa-4805-8289-bb7629674882
---
# Clustering

For increased reliability and performance, Liferay can be clustered. This way, if one server fails, another server continues serving data. 

Liferay can be configured in both a horizontal clustering or vertical clustering approach. In a horizontal cluster, each node runs on a separate machine. In a vertical cluster, multiple virtual Java machines run on a single machine.

Here you'll learn how to

* Configure a database for a clustered environment
* Configure Elasticsearch for a clustered environment
* Run two Liferay nodes in a horizontal cluster

The first step is configuring a database.

[Let's Go!](./clustering/configuring-the-database.md)
