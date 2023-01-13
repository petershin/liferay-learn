# CCR 구성: 설정 참조

CCR 구성 프로세스를 돕기 위해 이 가이드의 단계별 지침에 있는 예제 구성이 여기에 수집됩니다. 이러한 구성은 가능한 한 일반적으로 이루어지지만 환경에 맞게 경로, 포트 등을 조정해야 합니다. 또한 특정 단계를 수동으로 수행하여 설치를 완료해야 하므로 단계별 지침을 대체할 수 없습니다.

아래 구성은 설치 시 X-Pack Security를 통해 암호화된 통신(TLS/SSL) 및 사용자 인증을 활성화한다고 가정합니다. 자세한 내용은 [Elasticsearch 보안](../../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md) 을 참조하십시오.

```{tip}
[.config 파일에서 제공하는 구성 값](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)은 다음과 같이 DXP 클러스터 전체에 전파됩니다. 파일이 단일 노드에 배포되는 즉시. 그러나 각 클러스터 노드에 대해 동일한 구성을 제공하는 것이 가장 좋습니다. 
```

## 원격 DXP 클러스터 노드 구성

이러한 구성 파일은 `[Remote Liferay Home]/osgi/configs`에 배포됩니다.

### Elasticsearch 구성

원격 DXP 클러스터에는 `ElasticsearchConfiguration.config` 파일이 필요합니다.

파일 이름: `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config`

Liferay DXP 7.3 파일 내용:

```properties
productionModeEnabled="true"
remoteClusterConnectionId="remote"
logExceptionsOnly="false"
```

Liferay DXP 7.1/7.2 파일 내용:

```properties
clusterName="LiferayElasticsearchCluster_LEADER"
operationMode="REMOTE"
transportAddresses=["localhost:9300"]
logExceptionsOnly="false"
```

Liferay DXP 7.1/7.2에는 별도의 `XPackSecurityConfiguration.config` 파일이 필요합니다.

파일 이름: `com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config`

Liferay DXP 7.1/7.2 파일 내용:


```properties
certificateFormat="PKCS#12"
sslKeystorePath="/PATH/TO/elastic-nodes.p12"
sslKeystorePassword="liferay"
sslTruststorePath="/PATH/TO/elastic-nodes.p12"
sslTruststorePassword="liferay"
requiresAuthentication=B"true"
username="elastic"
password="liferay"
transportSSLVerificationMode="certificate"
transportSSLEnabled=B"true"
```

```{tip}
Liferay DXP 7.3에서는 X-Pack 보안 구성 파일이 필요하지 않습니다. 보안은 각 연결의 `.config` 파일에서 구성됩니다. 값은 모든 Liferay 노드에서 동일해야 합니다.
```

### Elasticsearch 연결 구성

[DXP 7.3만 해당] 원격 연결 파일 이름: `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConnectionConfiguration-remote.config`

파일 내용:

```properties
active="true"
connectionId="remote"
networkHostAddresses=["https://localhost:9200"]
username="elastic"
password="liferay"
authenticationEnabled=B"true"
httpSSLEnabled=B"true"
truststorePassword="liferay"
truststorePath="/PATH/to/elastic-nodes.p12"
truststoreType="pkcs12"
```

```{tip}
Liferay DXP 7.1/7.2의 경우 `ElasticsearchConfiguration.config` 및 `XPackSecurityConfiguration.config` 파일을 사용하여 원격 연결을 구성했습니다.
```

[DXP 7.3 전용] 읽기 전용 연결 파일 이름: `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConnectionConfiguration-ccr.config`

Liferay DXP 7.3용 파일 내용:

```properties
active="true"
connectionId="ccr"
networkHostAddresses=["https://localhost:9201"]
username="elastic"
password="liferay"
authenticationEnabled=B"true"
httpSSLEnabled=B"true"
truststorePassword="liferay"
truststorePath="/PATH/to/elastic-nodes.p12"
truststoreType="pkcs12"
```

[DXP 7.1/7.2 전용] 읽기 전용 연결 파일 이름: `com.liferay.portal.search.elasticsearch.cross.cluster.replication.internal.configuration.ElasticsearchConnectionConfiguration-ccr.config`

Liferay DXP 7.1/7.2용 파일 내용:

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
## 로컬 DXP 클러스터 노드 구성

이러한 구성 파일은 `[Local Liferay Home]/osgi/configs`에 배포됩니다.

원격 DXP 노드에 제공한 것과 동일한 Elasticsearch 7 구성(연결 구성 파일 포함)을 로컬 DXP 노드에 제공합니다.

### 로컬 DXP 클러스터 노드 CCR 모듈 구성

모든 노드(원격 데이터 센터에 있는 노드 포함)의 시스템 설정 UI에서 LES 클러스터 간 구성 애플리케이션을 구성합니다. LPKG가 배포된 경우 구성 항목은 시스템 설정 &rarr; 검색 &rarr; 클러스터 간 복제에 있습니다.

다음 값을 설정합니다.

* _로컬 클러스터에서 읽기_ 확인란이 선택되었습니다.
* _로컬 클러스터 구성_ 속성의 값은 _localhost:9080,ccr_입니다.

![시스템 설정에서 CCR을 구성합니다.](./ccr-basic-use-case-config-reference/images/01.png)

```{important}
여기서 값을 원격 데이터 센터로 설정하지 마십시오(이 예에서는 `localhost:8080,remote`). 이를 설정하면 동일한 이름의 리더 인덱스가 이미 상주하는 원격 클러스터에 팔로워 인덱스가 생성됩니다.
```

## 리더 Elasticsearch 클러스터 노드 구성

위치: `ES_LEADER_HOME/config`

파일 이름: `elasticsearch.yml`

파일 내용:
```yaml
cluster.name: LiferayElasticsearchCluster_LEADER
node.name: es-leader-node-1

http.port: 9200
transport.port: 9300

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

## 추종자 Elasticsearch 클러스터 노드 구성

위치: `ES_FOLLOWER_HOME/config`

파일 이름: `elasticsearch.yml`

파일 내용:

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
