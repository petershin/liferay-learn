# 검색 엔진 설치

검색 엔진은 Liferay 설치의 중요한 구성 요소입니다. [예제 클러스터 만들기](./../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md#prepare -a-search-engine) 을 사용하면 설치를 시작할 수 있지만 이 가이드에서는 **프로덕션** 환경 설정을 보여줍니다.

<!-- MAKE A DIAGRAM SIMILAR TO THE CCR ONE BUT WITH JUST ONE CONNECTION -->

Liferay를 시작하면 내장된 Elasticsearch 서버(사이드카)가 동시에 시작됩니다. 이 기본 검색 엔진은 테스트 편의를 위해 검색 기능을 제공하지만 프로덕션 환경에서는 사용할 수 없습니다. [Elasticsearch 시작하기](./elasticsearch/getting-started-with-elasticsearch.md) 에서는 프로덕션 수준의 Elasticsearch 설정을 설명합니다. [Sidecar 또는 Embedded Elasticsearch 사용](./elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md) 에서는 기본 Elasticsearch 서버(7.3의 사이드카 및 7.2의 내장) 기능 및 제한 사항에 대해 설명합니다.

```{note}
Liferay의 [Solr](http://lucene.apache.org/solr) 지원은 더 이상 사용되지 않기 전에 하나 이상의 업데이트(Solr 8 지원)를 받게 됩니다. 여전히 사용할 수 있지만 Solr는 Liferay와 함께 번들로 제공되지 않으며 개발 및 테스트를 위해서라도 원격으로 연결해야 합니다. Solr를 사용하려면 [Solr 설치하기](./solr/installing-solr.md)를 참조하세요.
```

## 자바 요구 사항

* 검색 엔진에는 환경 변수 `JAVA_HOME` 또는 `ES_JAVA_HOME` ( [Elasticsearch 8](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/install-elasticsearch.html#jvm-version) )이 필요합니다. 검색 엔진 호스트에 설정하십시오.

* Liferay 7.2를 사용하는 경우 Elasticsearch와 Liferay는 동일한 Java 버전 및 배포를 사용해야 합니다. 지원되는 JDK 배포 및 버전에 대한 자세한 내용은 [Elasticsearch 호환성 매트릭스](https://www.elastic.co/support/matrix#matrix_jvm) 및 [Liferay의 검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 참조하십시오. Elasticsearch에서 다음과 같이 지정할 수 있습니다.

    ```properties
    [Elasticsearch Home]/bin/elasticsearch.in.sh`: `JAVA_HOME=/path/to/java`
    ```

Elasticsearch 7 커넥터가 HTTP를 통해 통신하기 때문에 Java 버전 및 배포 요구 사항은 Liferay 7.3+에 적용되지 않습니다. JVM 레벨 직렬화가 없습니다. 자세한 내용은 [Elastic의 상위 수준 REST 클라이언트](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-high.html) 문서를 참조하세요.

Solr 커넥터도 HTTP를 통해 통신하기 때문에 동일한 요구 사항이 Solr에도 적용되지 않습니다.

## 검색 엔진 클러스터링

프로덕션 환경의 검색 엔진은 로드 관리 및 최적의 성능을 위해 클러스터링되어야 합니다. Elasticsearch와 Solr 모두 원격 환경의 여러 노드에서 구성할 수 있습니다.

* 원격 Elasticsearch 서버 또는 클러스터를 구성하려면 [Elasticsearch 시작하기](./elasticsearch/getting-started-with-elasticsearch.md)참조하십시오.

* 원격 Solr 서버 또는 클러스터를 구성하려면 [Solr 설치](./solr/installing-solr.md)을 참조하십시오.

## 검색 엔진 공급업체 및 버전 선택

Elasticsearch는 Liferay를 사용한 검색 및 인덱싱에 권장되는 검색 엔진입니다. Solr는 더 이상 사용되지 않을 예정이며 제한이 [](./solr/solr-limitations.md).

```{important}
지원되는 정확한 버전을 찾으려면 항상 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 를 참조하십시오.
```

## 다음

[Elasticsearch](./elasticsearch/getting-started-with-elasticsearch.md) 설치를 권장합니다. Solr(더 이상 사용되지 않음)를 사용해야 하는 경우 [Solr 설치](./solr/installing-solr.md)을 참조하십시오.
