# 로컬 팔로어 데이터 센터에서 CCR 구성

> 먼저 [은 아래 단계를 따르기 전에 원격/리더 데이터 센터](./configuring-ccr-in-a-remote-leader-data-center.md) 에서 CCR을 구성합니다.

로컬/팔로어 데이터 센터는 함께 배치된 Elasticsearch 클러스터에 대한 읽기 전용 연결과 원격/리더 데이터 센터의 Elasticsearch 클러스터에 대한 쓰기 전용 연결이 있는 Liferay DXP 클러스터 노드를 보유합니다.

예제 구성은 [CCR 구성 참조 가이드](./ccr-basic-use-case-config-reference.md)에서도 전체적으로 제공됩니다.

## 추종자 Elasticsearch 클러스터 구성

로컬 Elasticsearch 클러스터는 팔로워(복제된, 읽기 전용) 인덱스를 보유해야 하며 Liferay DXP 노드가 읽을 수 있는 로컬 검색 엔진으로 작동합니다.

```{important}
**CCR 설치 보안:** [앞서 언급한 바와 같이](./configuring-an-example-ccr-installation-replicating-between-data-centers.md#prerequisite-for-security-configure-authentication-and-encryption ) Elasticsearch 클러스터는 동일한 CA에서 서명한 노드 인증서를 사용해야 하며 각 클러스터의 보안 설정이 일치해야 합니다. 다른 접근 방식과 세부 정보는 [Elastic 설명서 참조](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cross-cluster-configuring.html)를 참조하세요.
```

1. `elasticsearch.yml`을 구성합니다.

   `[Follower Elasticsearch Home]/config/elasticsearch.yml`

   ```yaml
   cluster.name: LiferayElasticsearchCluster_FOLLOWER
   node.name: es-follower-node-1

   http.port: 9201
   transport.port: 9301

   xpack.security.enabled: true

   ### TLS/SSL settings for Transport layer
   xpack.security.transport.ssl.enabled: true
   xpack.security.transport.ssl.keystore.path: certs/elastic-nodes.p12
   xpack.security.transport.ssl.keystore.password: liferay
   xpack.security.transport.ssl.truststore.path: certs/elastic-nodes.p12
   xpack.security.transport.ssl.truststore.password: liferay
   xpack.security.transport.ssl.verification_mode: certificate

   ## TLS/SSL settings for HTTP layer
   xpack.security.http.ssl.enabled: true
   xpack.security.http.ssl.keystore.path: certs/elastic-nodes.p12
   xpack.security.http.ssl.keystore.password: liferay
   xpack.security.http.ssl.truststore.path: certs/elastic-nodes.p12
   xpack.security.http.ssl.truststore.password: liferay

   # For Kibana
   xpack.monitoring.collection.enabled: true
   ```

   보안 설정(`xpack.security...`)을 사용하려면 비밀번호를 설정하고 노드 인증서를 얻어야 합니다.

1. 서버를 시작하십시오. 서버 디렉토리의 루트에 있는 경우 다음을 실행하십시오.

   ```bash
   ./bin/elasticssearch
   ```

1. 이 기능을 사용해 보고 아직 적절한 라이선스가 없다면 Elasticsearch 평가판을 시작하세요.

   ```
   POST /_license/start_trial?acknowledge=true
   ```

## 로컬 Liferay DXP 클러스터 노드 구성

```{tip}
로컬로 테스트하는 경우 원격 DXP 노드와 다른 포트를 사용하도록 Tomcat을 구성합니다. HTTP 포트로 '9080', 리디렉션 포트로 '9443', 종료 포트로 '9005'를 사용하여 이 예제 설정을 따릅니다('[Liferay Home][version]에서 서버 포트 변경). xml`).
```

1. 원격 DXP 클러스터 노드의 `osgi/configs` 폴더에서 [Elasticsearch 연결 구성 파일](./configuring-ccr-in-a-remote-leader-data-center.md#configure-the-remote-liferay-dxp-cluster-node) 을 로컬 DXP 클러스터 노드의 해당 폴더로 복사합니다.

   Liferay DXP 7.3의 경우 여기에는 `*ElasticsearchConnectionConfiguration-remote.config` 및 `*ElasticsearchConfiguration.config`이 포함됩니다.

   ```{important}
   `ElasticsearchConfiguration.config`의 `remoteClusterConnectionId` 값은 `ElasticsearchConnectionConfiguration-remote.config` 파일의 `connectionId`와 일치해야 합니다. 
   ```

   Liferay DXP 7.1 및 7.2의 경우 여기에는 `*ElasticsearchConfiguration.config` 및 `*XPackSecurityConfiguration.config`이 포함됩니다.

   이러한 파일이 제공되면 로컬 DXP 클러스터 노드에 대한 쓰기 연결이 구성됩니다.

1. 이제 팔로어 인덱스를 사용하여 로컬 Elasticsearch 서버에 대한 읽기 전용 연결을 구성합니다.

   Liferay DXP 7.3의 경우 `Liferay Home/osgi/configs` `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConnectionConfiguration-ccr.config`에 구성 파일을 제공합니다.

   다음 내용을 제공하십시오.

   ```properties
   active=B"true"
   connectionId="ccr"
   username="elastic"
   password="liferay"
   authenticationEnabled=B"true"
   httpSSLEnabled=B"true"
   networkHostAddresses=["https://localhost:9201"]
   truststorePassword="liferay"
   truststorePath="/PATH/TO/elastic-nodes.p12"
   truststoreType="pkcs12"
   ```

   Liferay DXP 7.1 및 7.2의 경우 `Liferay Home/osgi/configs` `com.liferay.portal.search.elasticsearch.cross.cluster.replication.internal.configuration.ElasticsearchConnectionConfiguration-ccr.config`에 구성 파일을 제공합니다.

   ```{warning}
   Liferay 7.2에서 LES 클러스터 간 복제 LPKG의 초기 배포와 동시에 CCR 연결에 대한 구성 파일(예: `ElasticsearchConnectionConfiguration-ccr.config`)을 배포하지 마십시오. 모듈이 완전히 시작되기 전에 구성 파일이 배포되는 경우 Liferay의 검색 기능을 손상시키는 알려진 버그([LPS-127821](https://issues.liferay.com/browse/LPS-127821))가 있습니다. 이 문제가 이미 발생한 경우 [클러스터 간 복제 문제 해결](./troubleshooting-cross-cluster-replication.md#liferay-7-2-after-deploying-the-ccr-lpkg-and-the-elasticsearchconnectionconfiguration을 참조하십시오. -file-search-is-broken) 해결 방법입니다.
   ```

   ```properties
   clusterName="LiferayElasticsearchCluster_FOLLOWER"
   connectionId="ccr"
   username="elastic"
   password="liferay"
   authenticationEnabled=B"true"
   transportSSLEnabled=B"true"
   networkHostAddress="https://localhost:9201"
   transportAddresses=["localhost:9301"]
   sslTruststorePassword="liferay"
   sslTruststorePath="/PATH/TO/elastic-nodes.p12"
   certificateFormat="pkcs12"
   sslKeystorePassword="liferay"
   sslKeystorePath="/PATH/TO/elastic-nodes.p12"
   ```

   [구성 파일 이름](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-factory-configuration.md)에 대해 모든 접미사(이 예에서는`-ccr` )를 사용할 수 있지만 일관성을 위해 구성의 `connectionId` 속성과 동일하게 만들어야 합니다.

1. Liferay DXP 클러스터 노드를 시작합니다.

이제 연결이 구성되었습니다.

![CCR(READ) 연결이 구성되어 사용할 준비가 되었습니다.](./configuring-ccr-in-a-local-follower-data-center/images/03.png)

남은 것은 CCR 자체를 활성화하고 구성하는 것입니다.

## 클러스터 간 복제 모듈 구성

LES 클러스터 간 복제 모듈은 리더 클러스터의 다음과 리더 클러스터에서 팔로워 클러스터로 모든 인덱스의 초기 복제를 트리거합니다. 추적 및 복제 트리거는 구성 파일(`.config`)을 통하지 않고 시스템 설정 UI에서 CCR 기능을 활성화하는 데 의존합니다. 데이터 센터의 Liferay DXP 노드에서 CCR을 구성합니다.

1. 전역 메뉴를 열고 _제어판_ &rarr; _시스템 설정_로 이동합니다. _검색_ 범주를 엽니다.

1. Open _클러스터 간 복제_.

1. _로컬 클러스터에서 읽기_상자를 선택합니다.

1. _로컬 클러스터 구성_에서 하나의 값 설정 `localhost:9080,ccr`.

   ```{important}
   여기서 값을 원격 데이터 센터로 설정하지 마십시오(이 예에서는 `localhost:8080,remote`). 이를 설정하면 동일한 이름의 리더 인덱스가 이미 상주하는 원격 클러스터에 팔로워 인덱스가 생성됩니다.
   ```

   이는 읽기 전용이어야 하는 연결을 정의합니다. 인간 언어로 여기에 있는 각 항목은 "이 주소(`localhost:9080`)의 Liferay 서버가 이 이름(이 예에서는`ccr` )을 사용하여 Elasticsearch 연결에서 읽습니다."라고 말합니다.

1. _업데이트_을 클릭합니다.

프로덕션 설정에서 원격 Elasticsearch 클러스터에 대해 다른 전송 주소를 설정하거나(이 예에서는 기본값 사용) 일부 인덱스가 팔로워 Elasticsearch 클러스터에 복제되지 않도록 제외할 수 있습니다. 이러한 목적을 위한 구성 필드가 있습니다.

**원격 클러스터 시드 노드 전송 주소**: 원격 클러스터와 로컬 클러스터 간의 연결을 설정하는 데 사용할 원격 클러스터 노드의 전송 주소입니다. 기본값은 `localhost:9300`입니다.

**제외된 인덱스**: 클러스터 간 복제에서 제외할 인덱스 이름을 입력합니다. 마침표(.)로 시작하는 인덱스는 항상 제외됩니다. 기본적으로 원격 클러스터의 모든 인덱스는 로컬 클러스터에 복제됩니다. 자동 복제가 활성화되지 않은 경우 이 설정은 무시됩니다.

**자동 복제 활성화됨**: 로컬 클러스터에서 읽기가 활성화된 경우 로컬 Elasticsearch 클러스터에서 팔로워 인덱스 자동 생성을 활성화 또는 비활성화합니다. 복제가 Elasticsearch를 통해 수동으로 관리되는 경우 이 설정을 비활성화합니다. 기본값은 _활성화_입니다.

![시스템 설정에서 CCR을 구성합니다.](./configuring-ccr-in-a-local-follower-data-center/images/02.png)

성공적인 인덱스 복제 및 읽기 연결이 활성화되었음을 나타내는 로그 메시지가 나타납니다.

```
2021-01-22 02:15:11.112 INFO  [liferay/configuration-1][CrossClusterReplicationConfigurationModelListener:163] Creating follower indexes
2021-01-22 02:15:12.864 INFO  [liferay/configuration-1][CrossClusterReplicationConfigurationModelListener:70] Read operations from local clusters are enabled
```

연결이 구성되고 인덱스가 복제되면 시스템이 제대로 작동하는지 확인합니다.

## 설정 확인

팔로워 DXP 클러스터 노드에서 제어판 &rarr; 구성 &rarr; 검색으로 이동합니다. Liferay DXP 7.2에서는 _연결_ 탭도 클릭해야 합니다. 연결은 다음과 같습니다.

![검색 관리 패널에서 Elasticsearch 7 연결을 확인합니다.](./configuring-ccr-in-a-local-follower-data-center/images/01.png)

이제 CCR이 구성되었습니다. 구성에 문제가 있는 경우 [문제 해결 가이드](./troubleshooting-cross-cluster-replication.md)을 확인하십시오.
