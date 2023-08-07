# 사이드카 또는 임베디드 Elasticsearch 사용

ZIP 파일 또는 Docker 이미지를 통해 설치된 Liferay Tomcat 번들은 Liferay로 시작하는 Elasticsearch 노드를 포함합니다. Liferay 7.3+ 및 7.4+의 노드는 별도의 JVM에서 사이드카 서버로 실행되며 Liferay 7.2의 노드는 Liferay 서버에 내장되어 있습니다.

Elasticsearch 서버는 다음 URL에서 액세스할 수 있습니다.

* <http://localhost:9201> Liferay 7.3+ 및 7.4+
* [라이프레이 7.2에서 http://localhost:9200](http://localhost:9200)

다음은 사이드카 서버 출력의 예입니다.

```json
{
  "name" : "liferay",
  "cluster_name" : "LiferayElasticsearchCluster",
  "cluster_uuid" : "aDsZ5VWTQ96-lT-7WmcoHg",
  "version" : {
    "number" : "7.17.12",
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

번들로 제공되는 Elasticsearch 서버는 개발 및 테스트에 편리하지만 프로덕션에는 적합하지 않습니다.

```{note}
지원되는 프로덕션 구성은 아니지만 번들 Elasticsearch 서버를 모니터링하기 위해 Kibana를 설치하면 개발 및 테스트 중에 유용합니다. 
- Liferay 7.3에서 [OSS 전용 Kibana 빌드](https://www.elastic.co/downloads/kibana-oss) 를 설치합니다.
- Liferay DXP 7.4 U17+ 및 Liferay Portal 7.4 GA17+에서 무료 버전 [Kibana](https://www.elastic.co/downloads/past-releases#kibana) 을 설치합니다.

[설정 시 오류가 발생하는 경우 문제 해결 섹션](#error-connecting-to-the-sidecar-elasticsearch-from-kibana) 을 참조하세요.
```

프로덕션 환경에서 HSQL과 같은 임베디드 데이터베이스를 실행하지 않을 것이며 번들로 제공되는 Elasticsearch 서버도 프로덕션 환경에서 실행해서는 안 됩니다. 대신 원격 모드에서 독립 실행형 서버 또는 서버 노드의 클러스터로 Elasticsearch를 실행하십시오.

```{important}
검색 튜닝 앱 [동의어 세트](../../search-administration-and-tuning/synonym-sets.md) 및 [결과 순위](../../search-administration-and-tuning/result-rankings.md) 는 Liferay 7.2 및 7.3에서 기본 데이터 저장을 위한 검색 색인을 사용했습니다. 이러한 앱에 대한 데이터는 Liferay 데이터베이스에 저장되지 않았습니다. 따라서 Liferay 7.2 및 7.3에서 사이드카 또는 내장된 Elasticsearch를 사용하는 동안 구성된 동의어 집합 또는 결과 순위가 있는 경우 원격 Elasticsearch 서버로 전환하고 재인덱싱해도 해당 구성이 복원되지 _않습니다_. 대신 수동으로 동의어 집합 및 결과 순위를 원격 Elasticsearch 클러스터로 가져와야 합니다. 이러한 인덱스를 보존하기 위해 Elastic의 [스냅샷 및 복원](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html) 기능을 사용하는 방법에 대한 자세한 내용은 [업그레이드 가이드](../elasticsearch/upgrading-elasticsearch.md)를 참조하세요.
```

## 번들로 제공되는 Elasticsearch Server 사용 사례

기본 Elasticsearch 서버(사이드카 및 임베디드)의 일반적인 용도는 다음과 같습니다.

* 사용자 지정 [검색 및 인덱싱 코드 테스트](../../developer-guide.html)
* Kibana를 통해 Elasticsearch에서 직접 쿼리를 실행하여 검색 쿼리 개발
* [검색 튜닝](../../search-administration-and-tuning.md) 기능 테스트
* [검색 위젯 탐색 및 구성](../../search-pages-and-widgets.md)

## 앱 서버 차이점

Elasticsearch 사이드카 서버는 Liferay 7.4(DXP 및 Portal), Liferay DXP 7.3 및 Liferay Portal 7.3 GA4+의 Tomcat 번들 및 Docker 이미지에 포함되어 있습니다. 지원되는 응용 프로그램 서버에 Liferay WAR을 설치하는 경우 몇 가지 주요 차이점이 있습니다.

```{note}
아래 표에서 표기법 _7.3+_에는 Liferay 7.4(DXP 및 Portal)가 포함됩니다.
```

| 라이프레이 DXP 맛          | 기본 Elasticsearch | 사전 설치됨   | 수동 개입 필요           |
|:-------------------- |:---------------- |:-------- |:------------------ |
| Tomcat 번들: 7.3+      | Sidecar          | &#10004; | &#10008;           |
| 톰캣: 7.3+             | Sidecar          | &#10008; | &#10008; (자동 다운로드) |
| 도커: 7.3+             | Sidecar          | &#10004; | &#10008;           |
| 제이보스: 7.3+           | Sidecar          | &#10008; | &#10008; (자동 다운로드) |
| 야생화: 7.3+            | Sidecar          | &#10008; | &#10008; (자동 다운로드) |
| 웹스피어: 7.3+           | Sidecar          | &#10008; | &#10004;           |
| 웹로직: 7.3+            | Sidecar          | &#10008; | &#10004;           |
| **모든 맛: 7.2/7.3 GA3-** | **Embedded** | &#10004; | &#10008;           |

Tomcat 이외의 애플리케이션 서버용 번들을 다운로드한 경우 서버를 시작하면 Elasticsearch 배포가 즉시 다운로드되고 사이드카 서버로 시작됩니다.

[WebSphere](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md) 및 [Weblogic](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md) 애플리케이션 서버의 Liferay 설치 지침에는 초기화할 사이드카 서버에 필요한 Elasticsearch 아카이브를 수동으로 제공하는 지침이 포함되어 있습니다.

```{important}
번들로 제공되는 Elasticsearch 서버는 개발 및 테스트 목적에 유용하며 프로덕션에서 사용해서는 안 됩니다. 원격 검색 엔진 설치에 대한 자세한 내용은 [Elasticsearch 설치](./getting-started-with-elasticsearch.md)를 참조하세요.
```

## 임베디드 대 사이드카

다음은 임베디드 및 사이드카 Elasticsearch 서버 간의 비교입니다.

| 임베디드                                                 | 사이드카                                                                                                                                       |
|:---------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------ |
| 보안 연결을 구성할 수 없음                                      | 보안 연결을 구성할 수 없음                                                                                                                            |
| Elasticsearch의 OSS 버전 사용                             | Liferay 7.3은 Elasticsearch<br />의 OSS 버전을 사용합니다. Liferay DXP 7.4 U17+ 및 Liferay Portal 7.4 GA17+는 더 이상 OSS Elasticsearch를 사용하지 않습니다. |
| [에서 실행 http://localhost:9200](http://localhost:9200) | [에서 실행 http://localhost:9201](http://localhost:9201)                                                                                       |
| 모든 Liferay 배포판에 사전 설치됨                               | 항상 사전 설치되지 않음                                                                                                                              |
| 생산에 지원되지 않음                                          | 생산에 지원되지 않음                                                                                                                                |
| 모든 앱 서버에 특별한 단계가 필요하지 않습니다.                          | [일부 앱 서버](#app-server-differences) 에는 추가 단계가 필요합니다.                                                                                        |

## 사이드카/임베디드 Elasticsearch 문제 해결

이러한 오류는 시작 시 Elasticsearch 사이드카 설치 문제를 나타냅니다.

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

이와 같은 오류를 해결하려면

1. 라이프레이를 중지합니다.

1. `[Liferay Home]/elasticsearch-sidecar/` 또는 `[Liferay Home]/elasticsearch7`삭제합니다. 이 폴더에는 Sidecar Elasticsearch 런타임이 있습니다.

1. `삭제 [Liferay Home]/data/elasticsearch7`. 이 폴더에는 색인 데이터가 있습니다.

1. 라이프레이를 다시 시작합니다.

1. 포털은 시작 시 [일부 앱 서버에서](./using-the-sidecar-or-embedded-elasticsearch.md#embedded-versus-sidecar) (예: Tomcat) Elasticsearch 런타임을 다운로드하고 추출합니다.
