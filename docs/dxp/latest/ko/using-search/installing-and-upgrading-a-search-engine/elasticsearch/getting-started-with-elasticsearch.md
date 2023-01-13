# Elasticsearch 시작하기

> **호환성:** 호환 가능한 Elasticsearch 버전, 사용 가능한 Liferay 커넥터 및 필수 Liferay 패치 수준에 대한 자세한 내용은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 을 참조하십시오.

일반적인 Liferay 시스템의 검색 인프라는 다음으로 구성됩니다.

* 클러스터 또는 단일 노드(온프레미스 또는 Docker 컨테이너)에 구성된 Liferay 서버
* Elasticsearch 서버(온프레미스 또는 Docker 컨테이너)
* Liferay에 배포되고 배포에 맞게 구성된 Elasticsearch 커넥터 응용 프로그램입니다.

```{tip}
[Liferay Enterprise Search](../../liferay-enterprise-search.md) 구독을 통해 추가 기능 및 통합을 사용할 수 있습니다.
```

Liferay 서버가 이미 있다고 가정하면 나머지 단계는 다음과 같습니다.

1. 사용할 Elasticsearch 서버 및 커넥터 버전 결정

1. Elasticsearch 서버 설정

1. Liferay를 Elasticsearch에 연결

## 호환 가능한 Elasticsearch 및 커넥터 버전 찾기

각 Liferay CE/DXP 버전은 특정 Elasticsearch 주 버전(예: 6.x 또는 7.x)과 호환되는 Elasticsearch에 대한 커넥터와 함께 번들로 제공됩니다. 최신 주요 Elasticsearch 버전에 대한 지원을 추가하기 위해 Liferay는 [Marketplace](https://web.liferay.com/marketplace)을 통해 추가 커넥터를 출시합니다. 기본 제공(번들) 커넥터의 드롭인 대체품으로 사용할 수 있습니다.

[검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 은 각 Liferay 버전에 대해 지원되는 최신 Elasticsearch 구성 요소 버전을 보여줍니다. Elasticsearch 서버와 Elasticsearch에 대한 커넥터는 필수 구성 요소입니다.

```{warning}
Liferay 설치에 포함된 Elasticsearch에 대한 Liferay 커넥터가 최신 커넥터가 아닐 수 있습니다. 사용 중인 Elasticsearch 버전의 최신 커넥터를 사용해야 합니다. 커넥터는 [Liferay Marketplace](https://web.liferay.com/marketplace)에서 사용할 수 있습니다.
```

## Elasticsearch 설치

Elasticsearch는 Elasticsearch 아카이브 또는 Docker 이미지를 사용하여 설치할 수 있습니다. 서버 클러스터에서도 구성할 수 있습니다. 다음은 몇 가지 다른 Elasticsearch 호스팅 예입니다.

* [아카이브에서 Elasticsearch 설치](./installing-elasticsearch.md)
* [Docker를 사용하여 Elasticsearch 설치](./exercise-run-liferay-and-elasticsearch-using-docker.md)

또한 [Liferay 클러스터링 예제](../../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md) 은 Elasticsearch와 함께 Liferay 클러스터를 사용하는 방법을 보여줍니다.

## Liferay를 Elasticsearch에 연결

Elasticsearch에 대한 커넥터는 Liferay와 함께 번들로 제공됩니다. 최신 Liferay Connector to Elasticsearch 애플리케이션은 Liferay Marketplace에서도 사용할 수 있습니다. 자세한 내용은 [Elasticsearch](./connecting-to-elasticsearch.md) 에 연결을 참조하십시오.

## Elasticsearch 보안

프로덕션에서는 Liferay와 Elasticsearch의 통신을 보호해야 합니다. [Elasticsearch 보안](./securing-elasticsearch.md) 에서는 인증 및 암호화를 구성하는 방법을 설명하고 Liferay Enterprise Search Monitoring에 필요한 PEM 인증서를 사용하는 방법을 보여줍니다.

## 무엇 향후 계획

[Elasticsearch 설치](./installing-elasticsearch.md) 에서는 각 수동 설치 및 구성 단계를 설명합니다. 이러한 단계는 Docker에서 실행하는 경우에도 이해하는 데 도움이 됩니다. Docker에서 Elasticsearch 및 Liferay를 실행하는 것으로 시작하려면 [연습: Docker를 사용하여 Liferay 및 Elasticsearch 실행](./exercise-run-liferay-and-elasticsearch-using-docker.md)을 참조하십시오.
