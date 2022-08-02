# Troubleshooting Elasticsearch Sidecar and Embedded
<!-- Could possibly just add this to the sidecar/embedded article. I see at least on duplicated piece of info (monitor sidecar with kibana) -->
<!-- The main content can be distilled: if you have problems with portal startup that are related to the Sidecar server, [follow the steps included in this article]. -->

## Elasticsearch Sidecar Could Not Be Started

The following errors may indicate problems with the Elasticsearch Sidecar installation at startup:

```
2022-03-02 17:32:22.952 ERROR [main][ElasticsearchConnectionManager:81] Elasticsearch sidecar could not be started. Search will be unavailable. Manual installation of Elasticsearch and activation of remote mode is recommended.
```

or

```
2022-03-04 10:41:13.249 ERROR [com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarMainProcessCallable@3da0921a[-Xms1g -Xmx1g -XX:+AlwaysPreTouch -Des.path.conf=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763/config -Des.networkaddress.cache.ttl=60 -Des.networkaddress.cache.negative.ttl=10 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Dio.netty.allocator.type=unpooled -Dio.netty.allocator.numDirectArenas=0 -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dfile.encoding=UTF-8 -Djava.io.tmpdir=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763 -Djava.security.policy=jar:file:/home/tibusz/liferay/bundles/master/osgi/state/org.eclipse.osgi/257/0/bundleFile!/META-INF/sidecar.policy -Djna.nosys=true]-][Sidecar:198] Abort subprocess piping
java.io.InvalidClassException: org.elasticsearch.ElasticsearchException; local class incompatible: stream classdesc serialVersionUID = 4568865521165719982, local class serialVersionUID = -7656133510021522625
	at java.io.ObjectStreamClass.initNonProxy(ObjectStreamClass.java:689) ~[?:?]
```

or

```
2022-03-04 10:41:30.191 ERROR [main][SidecarManager:93] bundle com.liferay.portal.search.elasticsearch7.impl:6.0.34 (257)[com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarManager(973)] : The activate method has thrown an exception 
java.util.concurrent.CancellationException: null
	at java.util.concurrent.FutureTask.report(FutureTask.java:121) ~[?:?]
	at java.util.concurrent.FutureTask.get(FutureTask.java:191) ~[?:?]
	at com.liferay.portal.search.elasticsearch7.internal.sidecar.Sidecar._waitForPublishedAddress(Sidecar.java:591) ~[?:?]
```

or

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

or

```
Caused by: org.elasticsearch.bootstrap.StartupException: java.lang.IllegalArgumentException: Could not load codec 'Lucene87'.  Did you forget to add lucene-backward-codecs.jar?
```

Resolution,
1.    Stop the Portal

1.    Delete  `[Liferay Home]/elasticsearch-sidecar/` or `[Liferay Home]/elasticsearch7` → this holds the Sidecar Elasticsearch runtime

1.    Delete [Liferay Home]/data/elasticsearch7 → this holds the index data of Sidecar Elasticsearch

1.    Restart Liferay
 
1.    The Portal will download and extract the Elasticsearch runtime at startup [on select App Servers](../using-the-sidecar-or-embedded-elasticsearch.html#embedded-versus-sidecar)) (like Tomcat).


## Starting Elasticsearch Sidecar Manually Does Not Work

The Elasticsearch Sidecar installation is using Elasticsearch's `*-no-jdk-linux-x86_64 ` distribution. This means that starting the Sidecar runtime manually on Windows and macOS operating systems may not work! In general, it is recommended to let Liferay Portal/Liferay DXP manage the Sidecar environment.

## Error when trying to connect to Sidecar Elasticsearch server from Kibana

> Applies to versions DXP 7.4 GA1 - U17 and DXP 7.3 GA1 - U4.  

While it’s not a supported production configuration, installing Kibana to monitor the bundled Elasticsearch server is useful during development and testing. Just be aware that you must install the [OSS only Kibana](https://www.elastic.co/downloads/kibana-oss) build.

Starting with DXP 7.4 U17 and DXP 7.3 U5, you can use the standard distribution of Kibana.
