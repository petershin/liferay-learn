---
taxonomy-category-names:
- Search
- Search Engine Installation and Maintenance
- Liferay Self-Hosted
uuid: fd689e2a-cd82-4749-ac09-9df12cee519a
---
# Using the Sidecar or Embedded Elasticsearch

The Liferay Tomcat bundles installed via a ZIP file or Docker image include an Elasticsearch node that starts with Liferay. The node in Liferay 7.3+ and 7.4+ runs in a separate JVM as a sidecar server and the node in Liferay 7.2 is embedded in the Liferay server.

The Elasticsearch server is accessible at these URLs:

* <http://localhost:9201> on Liferay 7.3+ and 7.4+
* <http://localhost:9200> on Liferay 7.2

Here's example sidecar server output:

```json
{
  "name" : "liferay",
  "cluster_name" : "LiferayElasticsearchCluster",
  "cluster_uuid" : "aDsZ5VWTQ96-lT-7WmcoHg",
  "version" : {
    "number" : "7.17.18",
    "build_flavor" : "unknown",
    "build_type" : "unknown",
    "build_hash" : "e3b0c3d3c5c130e1dc6d567d6baef1c73eeb2059",
    "build_date" : "2023-07-20T05:33:33.690180787Z",
    "build_snapshot" : false,
    "lucene_version" : "8.11.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```

While the bundled Elasticsearch servers are convenient for development and testing, neither is suitable for production. 

```{note}
While it's not a supported production configuration, installing Kibana to monitor the bundled Elasticsearch server is useful during development and testing. 
- On Liferay 7.3, install the [OSS only Kibana build](https://www.elastic.co/downloads/kibana-oss).
- On Liferay DXP 7.4 U17+ and Liferay Portal 7.4 GA17+, install the free version of [Kibana](https://www.elastic.co/downloads/past-releases#kibana).

See [the troubleshooting section if you encounter errors with the setup](#error-connecting-to-the-sidecar-elasticsearch-from-kibana).
```

You wouldn't run an embedded database like HSQL in production, and you shouldn't run the bundled Elasticsearch server in production either. Instead, run Elasticsearch in remote mode, as a standalone server or cluster of server nodes.

```{important}
The search tuning apps [Synonym Sets](../../search-administration-and-tuning/synonym-sets.md) and [Result Rankings](../../search-administration-and-tuning/result-rankings.md) used the search index for primary data storage on Liferay 7.2 and 7.3. No data for these apps was stored in the Liferay database. Therefore, if you have Synonym Sets or Result Rankings configured while using the sidecar or embedded Elasticsearch in Liferay 7.2 and 7.3, switching to a remote Elasticsearch server and reindexing does _not_ restore those configurations. Instead you must manually bring the Synonym Sets and Result Rankings into the remote Elasticsearch cluster. See the [Upgrade Guide](../elasticsearch/upgrading-elasticsearch.md) for details on using Elastic's [Snapshot and Restore](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/snapshot-restore.html) feature to preserve these indexes.
```

## Bundled Elasticsearch Server Use cases

Here are common uses for the default Elasticsearch server (sidecar and embedded):

* Testing your custom [search and indexing code](../../developer-guide.md)
* Developing search queries by running queries directly on Elasticsearch through Kibana
* Testing the [search tuning](../../search-administration-and-tuning.md) functionality
* Exploring and configuring the [search widgets](../../search-pages-and-widgets.md)

## App Server Differences

An Elasticsearch sidecar server is included with the Tomcat bundles and Docker images in Liferay 7.4 (DXP and Portal), Liferay DXP 7.3, and Liferay Portal 7.3 GA4+. There are some key differences if you're installing the Liferay WAR onto any supported application server.

```{note}
In the table below, the notation _7.3+_ includes Liferay 7.4 (DXP and Portal).
```

| Liferay DXP Flavor       | Default Elasticsearch | Pre-Installed | Requires Manual Intervention |
| :--- | :--- | :--- | :--- |
| Tomcat bundle: 7.3+  | Sidecar             | &#10004;      | &#10008;                     |
| Tomcat: 7.3+         | Sidecar             | &#10008;      | &#10008; (auto-downloaded)   |
| Docker: 7.3+         | Sidecar             | &#10004;      | &#10008;                     |
| JBoss: 7.3+          | Sidecar             | &#10008;      | &#10008; (auto-downloaded)   |
| Wildfly: 7.3+        | Sidecar             | &#10008;      | &#10008; (auto-downloaded)   |
| WebSphere: 7.3+      | Sidecar             | &#10008;      | &#10004;                     |
| Weblogic: 7.3+       | Sidecar             | &#10008;      | &#10004;                     |
| _All flavors: 7.2/7.3 GA3-_ | _Embedded_       | &#10004;      | &#10008;                     |

If you downloaded a bundle for an application server besides Tomcat, when you start the server an Elasticsearch distribution is downloaded on-the-fly and started as a sidecar server.

Installation instructions for Liferay on the [WebSphere](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md) and [Weblogic](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md) application servers include directions for manually providing the Elasticsearch archives required for the sidecar server to be initialized.

```{important}
The bundled Elasticsearch server is useful for development and testing purposes and must not be used in production. See [Installing Elasticsearch](./getting-started-with-elasticsearch.md) to learn about installing a remote search engine.
```

## Embedded Versus Sidecar

Here's a comparison between the embedded and sidecar Elasticsearch servers.

| EMBEDDED           | SIDECAR           |
| :--- | :--- |
| Cannot configure a secure connection | Cannot configure a secure connection |
| Uses an OSS version of Elasticsearch | Liferay 7.3 uses an OSS version of Elasticsearch<br />Liferay DXP 7.4 U17+ and Liferay Portal 7.4 GA17+ no longer use the OSS Elasticsearch |
| Runs at <http://localhost:9200> | Runs at <http://localhost:9201> |
| Pre-Installed on all Liferay distributions  | Not Always Pre-Installed  |
| Not supported for production  | Not supported for production |
| No special steps required for any app server | [Some app servers](#app-server-differences) require additional steps |

## Troubleshooting the Sidecar/Embedded Elasticsearch

These errors indicate problems with the Elasticsearch Sidecar installation at startup:

```
2022-03-02 17:32:22.952 ERROR [main][ElasticsearchConnectionManager:81] Elasticsearch sidecar could not be started. Search will be unavailable. Manual installation of Elasticsearch and activation of remote mode is recommended.
```

```
2022-03-04 10:41:13.249 ERROR [com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarMainProcessCallable@3da0921a[-Xms1g -Xmx1g -XX:+AlwaysPreTouch -Des.path.conf=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763/config -Des.networkaddress.cache.ttl=60 -Des.networkaddress.cache.negative.ttl=10 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Dio.netty.allocator.type=unpooled -Dio.netty.allocator.numDirectArenas=0 -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dfile.encoding=UTF-8 -Djava.io.tmpdir=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763 -Djava.security.policy=jar:file:/home/tibusz/liferay/bundles/master/osgi/state/org.eclipse.osgi/257/0/bundleFile!/META-INF/sidecar.policy -Djna.nosys=true]-][Sidecar:198] Abort subprocess piping
java.io.InvalidClassException: org.elasticsearch.ElasticsearchException; local class incompatible: stream classdesc serialVersionUID = 4568865521165719982, local class serialVersionUID = -7656133510021522625
	at java.io.ObjectStreamClass.initNonProxy(ObjectStreamClass.java:689) ~[?:?]
```

```
2022-03-04 10:41:30.191 ERROR [main][SidecarManager:93] bundle com.liferay.portal.search.elasticsearch7.impl:6.0.34 (257)[com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarManager(973)] : The activate method has thrown an exception 
java.util.concurrent.CancellationException: null
	at java.util.concurrent.FutureTask.report(FutureTask.java:121) ~[?:?]
	at java.util.concurrent.FutureTask.get(FutureTask.java:191) ~[?:?]
	at com.liferay.portal.search.elasticsearch7.internal.sidecar.Sidecar._waitForPublishedAddress(Sidecar.java:591) ~[?:?]
```

```
2022-03-04 10:41:30.162 WARN  [com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarMainProcessCallable@3da0921a[-Xms1g -Xmx1g -XX:+AlwaysPreTouch -Des.path.conf=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763/config -Des.networkaddress.cache.ttl=60 -Des.networkaddress.cache.negative.ttl=10 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Dio.netty.allocator.type=unpooled -Dio.netty.allocator.numDirectArenas=0 -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dfile.encoding=UTF-8 -Djava.io.tmpdir=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763 -Djava.security.policy=jar:file:/home/tibusz/liferay/bundles/master/osgi/state/org.eclipse.osgi/257/0/bundleFile!/META-INF/sidecar.policy -Djna.nosys=true]-][Sidecar:632] Sidecar Elasticsearch process is aborted
java.util.concurrent.ExecutionException: com.liferay.petra.process.TerminationProcessException: Subprocess terminated with exit code 130
	at java.util.concurrent.FutureTask.report(FutureTask.java:122) ~[?:?]
	at java.util.concurrent.FutureTask.get(FutureTask.java:191) ~[?:?]
	at com.liferay.portal.search.elasticsearch7.internal.sidecar.Sidecar$RestartFutureListener.complete(Sidecar.java:628) [bundleFile:?]
	at com.liferay.petra.concurrent.DefaultNoticeableFuture$OnceFutureListener.complete(DefaultNoticeableFuture.java:111) [com.liferay.petra.concurrent.jar:?]
	at com.liferay.petra.concurrent.DefaultNoticeableFuture.done(DefaultNoticeableFuture.java:85) [com.liferay.petra.concurrent.jar:?]
	at java.util.concurrent.FutureTask.finishCompletion(FutureTask.java:381) [?:?]
	at java.util.concurrent.FutureTask.setException(FutureTask.java:250) [?:?]
	at com.liferay.petra.concurrent.DefaultNoticeableFuture.setException(DefaultNoticeableFuture.java:79) [com.liferay.petra.concurrent.jar:?]
	at java.util.concurrent.FutureTask.run(FutureTask.java:269) [?:?]
	at java.lang.Thread.run(Thread.java:834) [?:?]
Caused by: com.liferay.petra.process.TerminationProcessException: Subprocess terminated with exit code 130
	at com.liferay.petra.process.local.LocalProcessExecutor$SubprocessReactor.call(LocalProcessExecutor.java:309) ~[com.liferay.petra.process.jar:?]
	at com.liferay.petra.process.local.LocalProcessExecutor$SubprocessReactor.call(LocalProcessExecutor.java:161) ~[com.liferay.petra.process.jar:?]
	at java.util.concurrent.FutureTask.run(FutureTask.java:264) ~[?:?]
```

```
Caused by: org.elasticsearch.bootstrap.StartupException: java.lang.IllegalArgumentException: Could not load codec 'Lucene87'.  Did you forget to add lucene-backward-codecs.jar?
```

To resolve errors like these,

1. Stop Liferay.

1. Delete  `[Liferay Home]/elasticsearch-sidecar/` or `[Liferay Home]/elasticsearch7`. This folder holds the Sidecar Elasticsearch runtime.

1. Delete `[Liferay Home]/data/elasticsearch7`. This folder holds the index data.

1. Restart Liferay.

1. The Portal downloads and extracts the Elasticsearch runtime at startup [on select App Servers](./using-the-sidecar-or-embedded-elasticsearch.md#embedded-versus-sidecar) (e.g, Tomcat).

