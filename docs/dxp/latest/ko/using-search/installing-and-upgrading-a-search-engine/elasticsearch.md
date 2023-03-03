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

```{toctree}
:maxdepth: 2

elasticsearch/getting-started-with-elasticsearch.md
elasticsearch/installing-elasticsearch.md
elasticsearch/connecting-to-elasticsearch.md
elasticsearch/securing-elasticsearch.md
elasticsearch/exercise-run-liferay-and-elasticsearch-using-docker.md
elasticsearch/troubleshooting-elasticsearch-installation.md
elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md
elasticsearch/upgrading-elasticsearch.md
elasticsearch/elasticsearch-connector-configuration-reference.md
elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md
```

Elasticsearch는 Liferay가 기본적으로 사용하는 확장성이 뛰어난 전체 텍스트 검색 엔진입니다. Elasticsearch는 비생산 목적으로 Liferay와 함께 번들로 제공됩니다. 프로덕션에서 Liferay는 별도의 원격 서버에서 실행되는 Elasticsearch가 필요합니다.

```{important}
Elasticsearch 버전 및 Liferay 버전과 호환되는 서버 구성에 대한 [호환성 매트릭스](https://help.liferay.com/hc/ko/sections/360002103292-Compatibility-Matrix) 를 항상 확인하세요.
```

```{important}
Liferay 7.2 및 7.3에는 Elasticsearch 7 지원 및 인증되고 암호화된 Elasticsearch 연결 보안이 포함됩니다. Elasticsearch 6 커넥터(Liferay 7.2에서 사용 가능)를 보호하려면 [Liferay Enterprise Search 구독](../liferay-enterprise-search.md)에서만 사용할 수 있는 추가 모듈이 필요합니다.
```

## 설치 중

- [Elasticsearch 시작하기](elasticsearch/getting-started-with-elasticsearch.md)
- [Elasticsearch 설치](elasticsearch/installing-elasticsearch.md)
- [Elasticsearch에 연결](elasticsearch/connecting-to-elasticsearch.md)
- [연습: Docker를 사용하여 Liferay 및 Elasticsearch 실행](elasticsearch/exercise-run-liferay-and-elasticsearch-using-docker.md)
- [Elasticsearch 설치 문제 해결](elasticsearch/troubleshooting-elasticsearch-installation.md)
- [사이드카 또는 임베디드 Elasticsearch 사용](elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md)

- _[Liferay 클러스터링]_ [Liferay 클러스터에 검색 엔진 추가](../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md#start-a-search-engine-server)

## 업그레이드

- [Elasticsearch 업그레이드](elasticsearch/upgrading-elasticsearch.md)
- [검색 인프라 업그레이드](elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md)
- [Elasticsearch 백업](elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md)
- [Elasticsearch 7로 업그레이드](elasticsearch/upgrading-elasticsearch/upgrading-to-elasticsearch-7.md)

## 확보

- [Elasticsearch 보안](elasticsearch/securing-elasticsearch.md)

## 구성

- [Liferay Elasticsearch 커넥터의 고급 구성](elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md)
- [Elasticsearch 커넥터 구성 참조](elasticsearch/elasticsearch-connector-configuration-reference.md)
