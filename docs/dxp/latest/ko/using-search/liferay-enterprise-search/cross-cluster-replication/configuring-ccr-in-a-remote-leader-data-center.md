# 원격 리더 데이터 센터에서 CCR 구성

> 아래 단계를 따르기 전에 필요한 [전제 조건](./configuring-an-example-ccr-installation-replicating-between-data-centers.md) 단계를 완료했는지 확인하십시오.

이 데이터 센터는 함께 배치된 Elasticsearch 클러스터에 대한 읽기-쓰기 연결이 있는 Liferay DXP 클러스터 노드를 보유합니다.

여기에 표시된 예는 단일 Liferay DXP 노드와 단일 Elasticsearch 노드로 구성됩니다. 예제 구성은 보안 구성 설정을 포함하여 [CCR 구성 참조](./ccr-basic-use-case-config-reference.md)에서도 찾을 수 있습니다.

## 원격 리더 Elasticsearch 클러스터 구성

예제 설정에서 구성할 첫 번째 Elasticsearch 클러스터는 CCR 관련 구성이 없는 프로덕션 모드 클러스터입니다. 별도의 사이트에 있는 Liferay DXP 노드의 쓰기 요청과 함께 로컬 Liferay DXP 노드에서 읽기 및 쓰기를 수락합니다. 데이터 센터.

1. `elasticsearch.yml`을 구성합니다.

   `[Remote Elasticsearch Home]/config/elasticsearch.yml`

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

   보안 설정(`xpack.security...`)을 사용하려면 비밀번호를 설정하고 노드 인증서를 얻어야 합니다. 자세한 내용은 [Elasticsearch 보안](../../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md) 참조하십시오.

1. 서버를 시작하십시오. 서버 디렉토리의 루트에 있는 경우 다음을 실행하십시오.

      ```bash
      ./bin/elasticssearch
      ```

1. 이 작업을 시도 중이고 아직 적절한 라이선스가 없는 경우 [Elasticsearch 평가판 라이선스](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/start-trial.html) 시작하세요.

   ```
   POST /_license/start_trial?acknowledge=true
   ```

   성공적으로 설치되면 로그에 `- 유효한` 메시지가 표시됩니다.

   ```bash
   [2020-02-26T10:19:36,420][INFO ][o.e.l.LicenseService     ] [es-leader-node-1] license [lf263a315-8da3-41f7-8622-lfd7cc14cae29] mode [trial] - valid
   ```

### 원격 Liferay DXP 클러스터 노드 구성

이 설정의 Liferay DXP 노드 중 하나는 리더/원격 Elasticsearch 서버에서 읽고 씁니다.

1. `Liferay Home/osgi/configs` 폴더에 구성 파일을 제공하여 Liferay Connector를 Elasticsearch 7로 구성합니다. 이름을 붙이다

   ```bash
   com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
   ```

1. 다음 내용을 제공하십시오.


   라이프레이 DXP 7.3:

   ```properties
   productionModeEnabled="true"
   remoteClusterConnectionId="remote"
   logExceptionsOnly="false"
   ```

   라이프레이 DXP 7.2:

   ```properties
   clusterName="LiferayElasticsearchCluster_LEADER"
   operationMode="REMOTE"
   transportAddresses=["localhost:9300"]
   logExceptionsOnly="false"
   ```

   ```{tip}
   개발 및 테스트 중에 구성 파일에서 `logExceptionsOnly="false"`를 설정하는 것이 유용합니다. 
   ```

1. 원격 연결을 구성합니다.

   Liferay DXP 7.3의 경우 `Liferay Home/osgi/configs` 폴더에 `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConnectionConfiguration-remote.config`이라는 구성 파일을 제공합니다.

   ```properties
   active=B"true"
   connectionId="remote"
   username="elastic"
   password="liferay"
   authenticationEnabled=B"true"
   httpSSLEnabled=B"true"
   networkHostAddresses=["https://localhost:9200"]
   truststorePassword="liferay"
   truststorePath="/PATH/TO/elastic-nodes.p12"
   truststoreType="pkcs12"
   ```

   ```{important}
   `ElasticsearchConfiguration.config`의 `remoteClusterConnectionId` 값은 `ElasticsearchConnectionConfiguration-remote.config` 파일의 `connectionId`와 일치해야 합니다. 
   ```

   Liferay DXP 7.2의 경우 다음 콘텐츠와 함께 `com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config` 이라는 구성 파일을 제공하여 연결을 보호합니다.

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

1. 동일한 원격(쓰기) 연결을 사용하므로 이 `.config` 파일을 각 팔로워 DXP 노드에 복사합니다. 읽기 전용 팔로어 연결은 [로컬/팔로어 데이터 센터에서 CCR 구성](./configuring-ccr-in-a-local-follower-data-center.md)에서 별도로 구성됩니다.

1. Liferay DXP 서버를 시작합니다.

   ```{important}
   새 DXP 설치를 구성하는 경우 *색인 작업* 탭의 제어판 > 구성 > 검색에서 맞춤법 검사 색인을 재색인해야 합니다.
   ```

Kibana가 원격/리더 Elasticsearch 클러스터에 연결된 경우 Management &rarr; Index Management로 이동하여 사용 가능한 Liferay 인덱스를 확인합니다.

![Kibana 7에서 리더 인덱스를 검사합니다.](./configuring-ccr-in-a-remote-leader-data-center/images/01.png)

원격/리더 Elasticsearch 서버를 포함하는 데이터 센터가 가동되고 실행되면 로컬/추종 데이터 센터 [](./configuring-ccr-in-a-local-follower-data-center.md)설정할 준비가 된 것입니다.
