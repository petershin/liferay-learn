# Elasticsearch 보안

Elasticsearch를 보호하기 위해 가장 먼저 해야 할 일은 [enable X-Pack Security](#enable-x-pack-security)입니다. 그런 다음 인증 및 암호화된 통신 구성을 시작할 수 있습니다.

```{note}
**Elasticsearch 6.x:** Elasticsearch 6을 사용하는 경우 Elastic의 X-Pack Security를 사용하려면 Liferay Enterprise Search(LES) 구독 및 Liferay Enterprise Search Security 애플리케이션이 필요합니다. Elasticsearch 7에 대한 Liferay 커넥터([고객 다운로드 포털](https://customer.liferay.com/downloads)에서 사용 가능하고 Liferay 7.3+에 번들로 제공됨)부터 기본적으로 Elastic의 X-Pack 보안 지원이 포함됩니다. Elastic의 X-Pack 모니터링과 통합하려면 LES가 필요합니다.
```

## X-Pack 보안 활성화

보안을 활성화하려면 각 Elasticsearch 노드의 `[Elasticsearch Home]/config/elasticsearch.yml` 파일에 이 설정을 추가합니다.

```yaml
xpack.security.enabled: true
```

이제 X-Pack 사용자를 설정할 수 있습니다.

## X-Pack 사용자 설정

X-Pack을 사용하는 시스템에서 다음과 같은 [내장 X-Pack 사용자](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/built-in-users.html) 중요합니다.

* `kibana_system`
* `elastic`

Elasticsearch 서버에서 [`setup-passwords` 명령](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/setup-passwords.html) 사용하여 암호를 설정합니다.

```bash
./bin/elasticsearch-setup-passwords interactive
```

```{note}
아래에 표시된 구성은 모든 암호가 *liferay*로 설정되어 있다고 가정합니다. 설치에 자신의 암호를 사용하십시오.
```

```{note}
빌트인 사용자 비밀번호를 업데이트하려면 Kibana의 UI 또는 [비밀번호 변경 API](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/security-api-change-password.html)를 사용하세요.
```

## Elasticsearch 통신 암호화

TLS(전송 계층 보안)를 활성화하려면 노드 인증서 및 키를 생성하고 이를 Elasticsearch 서버 및 Liferay 서버에 적용해야 합니다.

### 노드 인증서 생성

[각 노드에 대해 인증서](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/configuring-tls.html#node-certificates) 생성하거나 Liferay와 같이 모든 노드와 클라이언트에서 사용할 인증서를 생성합니다. 또는 인증 기관을 사용하여 노드 인증서를 얻으십시오.

1. X-Pack의 [`certutil`](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/certutil.html) 명령을 사용하여 X-Pack 인증 기관을 생성합니다.

    ```bash
    ./bin/elasticsearch-certutil ca --ca-dn CN=elastic-ca
    ```

   이것은 `elastic-stack-ca.p12`이라는 파일을 생성합니다.

   PEM 형식의 인증 기관 인증서 및 개인 키를 생성하려면,

   ```bash
   ./bin/elasticsearch-certutil ca --pem --ca-dn CN=elastic-ca
   ```

1. 인증 기관 파일을 `[Elasticsearch Home]/config/certs` 폴더로 이동합니다.

1. 생성한 CA를 사용하여 X.509 인증서 및 개인 키를 생성합니다.

   `PKCS#12` 형식으로 인증서 및 키를 생성하려면 다음을 실행하십시오.

   ```bash
   ./bin/elasticsearch-certutil cert --ca config/certs/elastic-stack-ca.p12 --ca-pass liferay --dns localhost --ip 127.0.0.1 --name elastic-nodes
   ```

   `PEM` 형식으로 인증서 및 키를 생성하려면 다음을 실행하십시오.

   ```bash
   ./bin/elasticsearch-certutil cert --pem --ca-cert config/certs/ca.crt --ca-key config/certs/ca.key --dns localhost --ip 127.0.0.1 --name elastic-nodes
   ```

   `PKSC#12` 인증 기관에서 `PEM` 형식 노드 인증서 및 키를 생성하려면 다음을 실행하십시오.

   ```bash
   ./bin/elasticsearch-certutil cert --pem --ca config/certs/elastic-stack-ca.p12 --ca-pass liferay --dns localhost --ip 127.0.0.1 --name elastic-nodes
   ```

   ```{note}
   Liferay 7.3 이상에서는 [Elasticsearch 커넥터 구성](https://docs.oracle.com/en/java/javase/11/docs/specs/security/standard-names.html# 키 저장소 유형).
   ```

   여러 호스트에서 작동하는 인증서를 생성하려면(예: 모든 Elasticsearch 및 Liferay 서버에서 동일한 인증서 사용) DNS 이름과 IP 주소를 나열할 때 쉼표로 구분된 목록을 사용하십시오.

   ```bash
   ./bin/elasticsearch-certutil cert --ca config/certs/elastic-stack-ca.p12 --ca-pass liferay --dns localhost,example.com,es-node1,es-node2,es-node3 --ip 127.0.0.1,<IPv4-address-2>,<IPv4-address-3>,<IPv4-address-4>
   ```

   `elasticsearch-certutil cert` 명령은 `elastic-nodes.p12` 이라는 또 다른 파일을 생성합니다(이름을 다르게 지정할 수 있음).

   ```{note}
   `certutil` 명령은 Elastic Stack 7.x에서 작동하는 인증서 생성을 위해 기본적으로 *PKCS#12* 형식을 사용합니다. Kibana 6.x는 PKCS#12 인증서와 함께 작동하지 않으므로 *Liferay Enterprise Search와 함께 Liferay 7.2 및 Kibana 6.x를 사용하는 경우 `--pem` 옵션(*PEM* 형식으로 인증서 생성)이 중요합니다. 모니터링*. 각 사례에 대한 PEM 명령은 `ca.crt` 및 `ca.key`, `elastic-nodes.crt` 및 `elastic-nodes.key`라는 두 개의 ZIP 파일을 생성합니다. *[Elasticsearch Home]/config/certs* 폴더에 아카이브 콘텐츠의 압축을 풉니다.
   ```

1. `elastic-nodes.p12` `[Elasticsearch Home]/config/certs` 폴더로 이동합니다.

    **체크포인트:** 이제 다음 파일이 `[Elasticsearch Home]/config/certs` 폴더에 있습니다.

    ```bash
    elastic-nodes.p12
    elastic-stack-ca.p12
    ```

    또는

    ```bash
    ca.crt
    ca.key
    elastic-nodes.crt
    elastic-nodes.key
    ```

1. 파일을 각 Elasticsearch 노드의 동일한 폴더와 각 Liferay 서버 노드의 적절한 사이트에 복사합니다.

인증서와 키는 Elasticsearch 구성에서 사용할 준비가 되었습니다.

### Elasticsearch용 TLS 구성

[ `[Elasticsearch Home]/config/elasticsearch.yml` 파일을 통해 각 노드에서 TLS](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/configuring-tls.html) 활성화합니다.

1. 노드 간 통신을 위해 `elasticsearch.yml` 에서 다음 설정으로 전송 계층 TLS를 활성화합니다.

    ```yaml
    xpack.security.transport.ssl.enabled: true
    ```

1. 전송 계층 TLS를 구성합니다. 각 노드의 `elasticsearch.yml`에 인증서, 키 및 인증 기관 경로를 추가합니다.

    ```yaml
    # PKCS#12
    xpack.security.transport.ssl.keystore.path: certs/elastic-nodes.p12
    xpack.security.transport.ssl.keystore.password: liferay
    xpack.security.transport.ssl.truststore.path: certs/elastic-nodes.p12
    xpack.security.transport.ssl.truststore.password: liferay
    # PEM
    #xpack.security.transport.ssl.certificate_authorities: [ "certs/ca.crt" ]
    #xpack.security.transport.ssl.certificate: certs/elastic-nodes.crt
    #xpack.security.transport.ssl.key: certs/elastic-nodes.key

    xpack.security.transport.ssl.verification_mode: certificate
    ```

    위의 예제 경로는 인증서를 `[Elasticsearch Home]/config/certs`에 추가했다고 가정합니다.

1. HTTP 계층에서 TLS를 활성화하여 클라이언트 통신을 암호화합니다.

    ```yaml
    xpack.security.http.ssl.enabled: true
    ```

1. HTTP 계층 TLS를 구성합니다. 각 노드의 `elasticsearch.yml`에 인증서, 키 및 인증 기관 경로를 추가합니다.

    ```yaml
    # PKCS#12
    xpack.security.http.ssl.keystore.path: certs/elastic-nodes.p12
    xpack.security.http.ssl.keystore.password: liferay
    xpack.security.http.ssl.truststore.path: certs/elastic-nodes.p12
    xpack.security.http.ssl.truststore.password: liferay
    # PEM
    #xpack.security.http.ssl.certificate_authorities: [ "certs/ca.crt" ]
    #xpack.security.http.ssl.certificate: certs/elastic-nodes.crt
    #xpack.security.http.ssl.key: certs/elastic-nodes.key
    ```

### Elasticsearch 보안 구성 예

다음은 전체 Elasticsearch 구성(`elasticsearch.yml`, Elasticsearch 6.5.x+에 동일하게 적용됨)입니다.

```yaml
cluster.name: LiferayElasticsearchCluster

# X-Pack Security
xpack.security.enabled: true

## TLS/SSL settings for Transport layer (PKCS#12)
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.keystore.path: certs/elastic-nodes.p12
xpack.security.transport.ssl.keystore.password: liferay
xpack.security.transport.ssl.truststore.path: certs/elastic-nodes.p12
xpack.security.transport.ssl.truststore.password: liferay
xpack.security.transport.ssl.verification_mode: certificate

# TLS/SSL settings for HTTP layer (PKCS#12)
xpack.security.http.ssl.enabled: true
xpack.security.http.ssl.keystore.path: certs/elastic-nodes.p12
xpack.security.http.ssl.keystore.password: liferay
xpack.security.http.ssl.truststore.path: certs/elastic-nodes.p12
xpack.security.http.ssl.truststore.password: liferay

# Comment out when Kibana and Liferay's X-Pack Monitoring are also configured
#xpack.monitoring.collection.enabled: true
```

## Liferay에서 Elasticsearch에 대한 보안 연결 구성

Liferay에서는 제어판에서 또는 구성 파일을 사용하여 보안을 구성할 수 있습니다. *제어판* &rarr; *구성* &rarr; *시스템 설정*으로 이동합니다. *검색* 카테고리를 찾아 Liferay 7.3+의 *Elasticsearch 7* 항목 또는 Liferay 7.2의 *X-Pack Security* 항목을 클릭합니다. 여기에 속성 값을 입력할 수 있지만 `[Liferay Home]/osgi/configs`에 배포된 구성 파일을 사용하는 것이 더 일반적입니다.

파일의 정확한 내용은 X-Pack 설정에 따라 다릅니다. `암호` 위의 X-Pack 사용자 암호 설정 중에 설정한 암호와 일치해야 합니다.

여기에서 참조하는 인증서 및 키 파일은 Elasticsearch 서버 노드에서 사용되는 것과 동일합니다. Liferay 서버에 복사하고 그에 따라 구성에서 경로를 업데이트합니다.

TLS를 구성하는 것 외에도 `authenticationEnabled`/`requireAuthentication` `true` 로 설정하고 Liferay가 Elasticsearch에 인증하는 데 사용하는 Elasticsearch 사용자의 자격 증명을 제공하여 아래 설정에서 인증을 활성화할 수도 있습니다.

보안 구성을 마쳤으면 Elasticsearch를 다시 시작합니다. 이 단계를 수행하려면 전체 Elasticsearch 클러스터를 다시 시작해야 합니다.

### Liferay 7.3 및 7.4에서 Elasticsearch에 대한 보안 연결 구성

```{tip}
[Installing Elasticsearch](./installing-elasticsearch.md) 및 [Connecting to Elasticsearch](./connecting-to-elasticsearch.md)는 보안 활성화 및 구성을 보여줍니다. 7.3+ 적용 가능한 보안 구성에 대해서는 해당 항목을 참조하십시오.
```

Liferay 7.3+와 함께 번들로 제공되는 Elasticsearch 커넥터에는 X-Pack Security 지원이 포함됩니다. Elasticsearch 커넥터 구성에서 사용할 수 있는 지원되는 키 저장소 유형 목록은 [Java 11 보안 설명서](https://docs.oracle.com/en/java/javase/11/docs/specs/security/standard-names.html#keystore-types) 참조하십시오.

라는 파일을 만듭니다.

```bash
com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
```

다음과 같이 파일을 채웁니다.

```properties
operationMode="REMOTE"
productionModeEnabled=B"true"
username="elastic"
password="liferay"
authenticationEnabled=B"true"
httpSSLEnabled=B"true"
networkHostAddresses=["https://localhost:9200"]
truststorePassword="liferay"
truststorePath="/PATH/TO/elastic-nodes.p12"
truststoreType="pkcs12"
```

### Liferay 7.2에서 Elasticsearch에 대한 보안 연결 구성

Elasticsearch 7 이상에 대한 모든 Liferay 커넥터에는 X-Pack Security 지원이 포함됩니다.

```{note}
Liferay 7.2 및 Elasticsearch 6.x를 사용 중이고 Liferay Enterprise Search 구독이 있는 경우 [download](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7 -2) "Liferay 기업 검색 보안" 애플리케이션. LPKG 파일을 `[Liferay Home]/deploy` 폴더에 복사하여 설치합니다.
```

라는 파일을 만듭니다.

```bash
com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config
```

(또는 Elastic Stack 6.x 및 `Liferay Enterprise Search Security` 애플리케이션을 사용하는 경우 `com.liferay.portal.search.elasticsearch6.configuration.XPackSecurityConfiguration.config`)

다음과 같이 파일을 채웁니다(`PKCS#12`).

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

`PEM` 형식 인증서를 사용하는 경우 다음과 같은 설정을 사용하십시오.

```properties
certificateFormat="PEM"
sslKeyPath="/PATH/TO/elastic-nodes.key"
sslCertificatePath="/PATH/TO/elastic-nodes.crt"
requiresAuthentication=B"true"
username="elastic"
password="liferay"
sslCertificateAuthoritiesPaths="/PATH/TO/ca.crt"
transportSSLVerificationMode="certificate"
transportSSLEnabled="true"
```

### Liferay 7.3 및 7.4의 Elasticsearch 커넥터 보안 설정

다음은 7.3+의 Elasticsearch 커넥터에 대한 전체 보안 설정 목록입니다(괄호 안의 기본값).

`authenticationEnabled` (_true_): 사용자 이름과 암호를 사용하여 Elasticsearch에 대한 인증을 활성화하거나 비활성화합니다.

`username` (_elastic_): Authentication Enabled 체크 시 Elasticsearch 인증을 위한 사용자 이름을 설정합니다.

`password`: Authentication Enabled 체크 시 Elasticsearch 인증을 위한 비밀번호를 설정합니다.

`httpSSLEnabled` (_false_): TLS/SSL을 활성화 또는 비활성화합니다.

`truststoreType` (_pkcs12_): HTTP SSL 사용이 선택된 경우 truststore 유형을 설정합니다.

`truststorePath` (_/path/ro/localhost.p12_): HTTP SSL 사용이 선택된 경우 truststore 파일의 경로를 설정합니다.

`truststorePassword`: HTTP SSL Enabled가 체크된 경우 truststore에 대한 암호를 설정합니다.

### Liferay 7.2의 Enterprise Search Security / X-Pack 보안 설정

다음은 Liferay 7.2의 X-Pack 보안 구성에 대한 전체 설정 목록입니다.

`sslKeyPath` (_/path/to/instance.key_): 개인 키가 포함된 PEM 인코딩 파일의 경로를 설정합니다.

`sslCertificatePath` (_/path/to/instance.crt_): 클라이언트가 연결할 때 제공되는 인증서(또는 인증서 체인)를 포함하는 PEM 인코딩 파일의 경로를 설정합니다. 기본값은 `/path/to/instance.crt`입니다.

`sslCertificateAuthoritiesPaths` (_["/path/to/ca.crt"]_): 신뢰할 수 있는 PEM 인코딩 인증서 파일의 경로 목록을 제공합니다.

`certificateFormat` (_PKCS#12_): 인증서 형식을 지정합니다(`PEM` 또는 `PKCS#12`).

`requiredAuthentication` (_false_): 활성화된 경우 Elasticsearch/X-Pack과의 연결은 구성된 사용자 이름과 암호로 인증됩니다.

`username` (_elastic_): Requires Authentication이 활성화된 경우 Elasticsearch에 대한 인증을 위한 사용자 이름을 설정해야 합니다.

`비밀번호`: 인증 필요가 활성화된 경우 비밀번호가 필요합니다.

`transportSSLVerificationMode` (_인증서_): 중간자 공격 및 인증서 위조로부터 보호하기 위해 LDAP를 사용할 때 확인 유형(`없음`, `인증서`또는 `전체`)을 지정합니다.

`transportSSLEnabled` (_false_): TLS/SSL을 설정하거나 비활성화합니다.

`sslKeystorePath` (_/path/to/elastic-certificates.p12_): 개인 키와 인증서를 보관하는 키 저장소의 경로를 설정합니다.

`sslKeystorePassword`: PKCS#12 파일에 비밀번호를 설정합니다.

`sslTruststorePath` (_/path/to/elastic-certificates.p12_): 신뢰 저장소 파일의 경로를 설정합니다.

`sslTruststorePassword`: truststore에 대한 암호를 설정합니다.

## TLS 프로토콜 및 암호 제품군 구성

Liferay의 JVM에서 TLS 속성을 구성하여 Elasticsearch-Liferay 연결을 암호화하는 데 사용되는 TLS 프로토콜 버전 및 암호 제품군을 제어할 수 있습니다. Tomcat 서버의 `setenv.sh`에서 이러한 속성을 설정할 수 있습니다.

```properties
CATALINA_OPTS="$CATALINA_OPTS -Djdk.tls.client.protocols=TLSv1.2
CATALINA_OPTS="$CATALINA_OPTS -Djdk.tls.client.cipherSuites=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256"
```

이는 예제 값입니다.

이러한 설정은 해당 XPack 설정과 함께 작동합니다.

Liferay 7.3 또는 7.4에서 REST 클라이언트 연결을 구성하는 경우 `elasticsearch.yml`에서 다음과 같이 [HTTP 계층 설정](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/security-settings.html#http-tls-ssl-settings) 을 사용합니다.

```yaml
xpack.security.http.ssl.supported_protocols: [ "TLSv1.2" ]
xpack.security.http.ssl.cipher_suites : TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
```

Liferay 7.1 및 7.2에서 전송 클라이언트를 구성하는 경우 `elaticsearch.yml`에서 다음과 같이 [전송 설정](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/security-settings.html#transport-tls-ssl-settings) 을 사용합니다.

```yaml
xpack.security.transport.ssl.supported_protocols: [ "TLSv1.2" ]
xpack.security.transport.ssl.cipher_suites : TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
```

## 관련 항목

* [Elasticsearch 모니터링](../../liferay-enterprise-search/monitoring-elasticsearch.md)
* [교차 클러스터 복제](./../../liferay-enterprise-search/cross-cluster-replication.md)
* [튜닝 검색](../../search-administration-and-tuning.md)
* [Liferay 설치 및 업그레이드](../../installing-and-upgrading-a-search-engine.md)
