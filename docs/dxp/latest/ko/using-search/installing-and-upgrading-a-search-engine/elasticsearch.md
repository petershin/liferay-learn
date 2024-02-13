---
toc:
  - ./elasticsearch/getting-started-with-elasticsearch.md
  - ./elasticsearch/installing-elasticsearch.md
  - ./elasticsearch/connecting-to-elasticsearch.md
  - ./elasticsearch/securing-elasticsearch.md
  - ./elasticsearch/exercise-run-liferay-and-elasticsearch-using-docker.md
  - ./elasticsearch/troubleshooting-elasticsearch-installation.md
  - ./elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md
  - ./elasticsearch/upgrading-elasticsearch.md
  - ./elasticsearch/elasticsearch-connector-configuration-reference.md
  - ./elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md
---
# Elasticsearch

Elasticsearch는 Liferay가 기본적으로 사용하는 확장성이 뛰어난 전체 텍스트 검색 엔진입니다. Elasticsearch는 비프로덕션 목적으로 Liferay와 함께 번들로 제공됩니다. 프로덕션 환경에서 Liferay를 사용하려면 별도의 원격 서버에서 실행되는 Elasticsearch가 필요합니다.

```{important}
Liferay 버전과 호환되는 Elasticsearch 버전 및 서버 구성에 대해서는 항상 [호환성 매트릭스](https://help.liferay.com/hc/ko/sections/360002103292-Compatibility-Matrix) 를 확인하세요.
```

```{important}
Elasticsearch 6 커넥터(Liferay 7.2에서 사용 가능)를 보호하려면 [Liferay Enterprise Search 구독](../liferay-enterprise-search.md)에서만 사용할 수 있는 추가 모듈이 필요합니다. Elasticsearch 7+용 커넥터에는 인증되고 암호화된 Elasticsearch 연결 구성에 대한 지원이 포함되어 있습니다.
```

## 설치 중

* [Elasticsearch 시작하기](elasticsearch/getting-started-with-elasticsearch.md)

* [Elasticsearch 설치](elasticsearch/installing-elasticsearch.md)

* [Elasticsearch에 연결](elasticsearch/connecting-to-elasticsearch.md)

* [연습: Docker를 사용하여 Liferay 및 Elasticsearch 실행](elasticsearch/exercise-run-liferay-and-elasticsearch-using-docker.md)

* [Elasticsearch 설치 문제 해결](elasticsearch/troubleshooting-elasticsearch-installation.md)

* [사이드카 또는 Embedded Elasticsearch 사용](elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md)

* [**클러스터링 Liferay**] [Liferay 클러스터에 검색 엔진 추가](../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md#start-a-search-engine-server)

## 업그레이드 중

* [Elasticsearch 업그레이드](elasticsearch/upgrading-elasticsearch.md)
* [검색 인프라 업그레이드](elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md)
* [Elasticsearch 백업](elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md)
* [Elasticsearch 8로 업그레이드](elasticsearch/upgrading-elasticsearch/upgrading-to-elasticsearch-8.md)
* [Elasticsearch 7로 업그레이드](elasticsearch/upgrading-elasticsearch/upgrading-to-elasticsearch-7.md)

## 보안

* [Elasticsearch 보안](elasticsearch/secure-elasticsearch.md)

## 구성

* [Liferay Elasticsearch 커넥터의 고급 구성](elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md)
* [Elasticsearch 커넥터 구성 참조](elasticsearch/elasticsearch-connector-configuration-reference.md)
