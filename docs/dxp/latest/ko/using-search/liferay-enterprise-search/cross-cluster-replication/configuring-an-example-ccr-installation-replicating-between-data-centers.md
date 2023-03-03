# 예제 CCR 설치 구성: 데이터 센터 간 복제

> **Liferay 엔터프라이즈 검색(LES) 가입자**

이 예에서는 Liferay DXP의 클러스터 간 복제 모듈과 Elasticsearch를 구성하여 두 개의 연결, 즉 하나의 Elasticsearch 클러스터에서 하나의 Liferay DXP 클러스터 노드로의 읽기-쓰기 연결과 다른 Elasticsearch 클러스터에서 두 번째 Liferay DXP 클러스터 노드로의 읽기 연결을 설정합니다.

![클러스터 간 복제를 사용하면 서로 다른 데이터 센터가 Liferay DXP 인덱스와 동기화된 Elasticsearch 클러스터를 보유할 수 있습니다.](./configuring-an-example-ccr-installation-replicating-between-data-centers/images/01.png)

```{important}
Liferay DXP 7.1, 7.2 및 7.3 간의 구성 및 절차의 차이점은 이 지침 전체에 인라인으로 표시되어 있습니다.
```

각각 동일한 인덱스의 복사본이 있는 `localhost`에서 두 개의 단일 노드 Elasticsearch 클러스터를 사용합니다. 이것은 클러스터 간 복제의 데이터 지역성과 재해 복구 이점을 얻기 위해 구성할 수 있는 가장 간단한 시나리오입니다.

바닐라 Liferay DXP 설치에는 [Cross Cluster Replication](./cross-cluster-replication.md#liferay-dxp-decide-which-indexes-to-replicate-from-the-remote-cluster) 에 제시된 인덱스가 포함되어 있습니다. Liferay DXP에서 사용하는 모든 Elasticsearch 클러스터(이 예에서는 두 개의 클러스터)에는 이러한 인덱스가 필요합니다.

여기에서 제공되는 Elasticsearch API 호출은 별도의 Kibana 설치 또는 [LES 모니터링 위젯](../monitoring-elasticsearch.md)을 통해 액세스할 수 있는 Kibana의 Dev Tools 콘솔에 복사 및 붙여넣기할 수 있습니다.

```{note}
Kibana를 사용하려면 여러 Elasticsearch 클러스터(이 예에서는 2개의 단일 노드 클러스터)가 실행 중임을 기억하십시오. Kibana의 `kibana.yml` 파일에 있는 `elasticsearch.hosts: [ "http://localhost:<port>" ]` 설정은 인덱스와 아래에 설명된 기타 구성을 관리할 때 올바른 포트를 가리켜 리더와 팔로워가 혼합되지 않도록 해야 합니다. 클러스터. 여기에서는 리더 Elasticsearch 클러스터 노드가 포트 '9200'을 사용하고 팔로워가 포트 '9202'를 사용한다고 가정합니다. 
```

## 클러스터 라이프레이 DXP

각 Liferay DXP 노드에는 다음 속성이 있는 `Liferay Home/portal-ext.properties` 파일이 필요합니다.

```properties
cluster.link.enabled=true
```

이것은 단순한 클러스터링 구성입니다. 전체 구성은 [클러스터링](../../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md) 을 참조하십시오.

## 필수 Elasticsearch 플러그인 설치

필요한 Elasticsearch [플러그인](../../installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md#install-elasticsearch) 을 설치했는지 확인하십시오.

- `analysis-icu`
- `analysis-stempel`
- `analysis-kuromoji`
- `analysis-smartcn`

## 보안을 위한 전제 조건: 인증 및 암호화 구성

통신(TLS/SSL)을 암호화하고 Liferay DXP와 [노드 간의 사용자 인증을 활성화하려면 보안을 구성해야](../../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md).

1. Elasticsearch 클러스터에서 X-Pack Security를 구성합니다. 노드 인증서가 동일한 CA에 의해 서명되고 리더 및 팔로워 클러스터의 보안 설정이 일치하는지 확인하십시오.

   ```{note}
   팔로워 Elasticsearch 클러스터 노드의 HTTP 및 전송 계층에 대해 TLS/SSL을 활성화해야 합니다. Liferay DXP는 HTTP를 통해 팔로워 클러스터에 연결하여 전체 재색인이 수행된 후 회사 색인을 다시 따릅니다.
   ```

1. DXP 노드를 구성합니다.

   Liferay DXP 7.3의 경우 `ElasticsearchConfiguration.config` 파일에서 Elasticsearch에 대한 프로덕션 모드 설정을 구성한 다음 `ElasticsearchConnectionConfiguration-[ccr/remote].config` 파일에서 별도로 연결을 구성합니다.


   Liferay DXP 7.1 및 7.2의 경우 `ElasticsearchConfiguration.config` 에서 원격 연결을 구성하고 `ElasticsearchConnectionConfiguration-ccr.config` 파일에서 읽기 전용 연결을 구성합니다.

   각 연결에 보안 설정을 포함합니다. 자세한 내용은 [Elasticsearch 보안](../../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md) 을 참조하십시오. [Local Follower Data Center에서 CCR 구성](./configuring-ccr-in-a-local-follower-data-center.md) 에서는 로컬 DXP 노드에서 읽기 전용 CCR 연결에 대한 보안 구성을 다룹니다.

예제 구성은 전체 [여기](./ccr-basic-use-case-config-reference.md)에서 제공됩니다.

## 클러스터 간 복제 모듈 설치

Liferay DXP 7.4부터 Liferay Enterprise Search(LES) 애플리케이션이 모든 Liferay DXP 번들 및 Docker 컨테이너에 포함됩니다. 따라서 Liferay DXP 7.4+에서는 LPKG를 설치할 필요가 없습니다. 자세한 내용은 [LES](./activating-liferay-enterprise-search.md) 활성화를 참조하십시오.

1. [LES 다운로드 페이지](https://customer.liferay.com/downloads) 에서 Elasticsearch LPKG용 Liferay DXP 클러스터 간 복제를 다운로드합니다.

1. [모든 DXP 노드에 LPKG](../../../system-administration/installing-and-managing-apps/installing-apps.md) 을 설치합니다.

```{tip}
클러스터 간 복제와 함께 Liferay DXP 7.1 및 7.2에서 여러 Elasticsearch 연결만 사용하기 때문에 연결 UI는 클러스터 간 복제가 있는 경우 검색 관리 패널(제어판 > 구성 > 검색---연결 탭 아래)에만 표시됩니다. 복제 LPKG가 배포됩니다. Liferay DXP 7.3에는 연결 UI가 항상 있습니다.
```

모든 전제 조건 작업이 완료되고 클러스터 간 복제 모듈이 설치된 경우 원격 데이터 센터 [에서 서버를 구성하여 계속](./configuring-ccr-in-a-remote-leader-data-center.md).
