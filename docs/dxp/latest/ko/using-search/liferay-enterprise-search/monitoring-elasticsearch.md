# Elasticsearch 모니터링

{bdg-link-primary}`LES 구독 <./activating-liferay-enterprise-search.md>`

Liferay Enterprise Search(LES) [구독](https://www.liferay.com/products/dxp/enterprise-search)이 있는 경우 Elastic의 [Kibana 모니터링 UI](https://www.elastic.co/guide/en/kibana/7.x/introduction.html) 를 Liferay DXP와 통합하여 모니터링 활동을 Liferay 자체 내에서 수행할 수 있습니다.

![LES 모니터링을 사용하면 Liferay의 UI에서 Liferay의 인덱스를 모니터링할 수 있습니다.](./monitoring-elasticsearch/images/01.png)

Liferay의 데이터가 인덱싱된 [보안](../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md) Elasticsearch 클러스터를 모니터링하는 데는 5단계만 거치면 됩니다.

1. 데이터 수집을 활성화하도록 Elasticsearch에 지시합니다.

1. Kibana를 다운로드하고 설치합니다.

1. 적절한 보안 설정으로 Kibana를 구성합니다.

1. LES 모니터링 앱을 설치합니다.

1. Elasticsearch와 통신하도록 LES 모니터링 앱을 구성합니다.

## 데이터 수집 활성화

모니터링은 기본적으로 Elasticsearch에서 활성화되지만 데이터 수집은 활성화되지 않습니다. 이 줄을 `elasticsearch.yml`에 추가하여 데이터 수집을 활성화합니다.

```yaml
xpack.monitoring.collection.enabled: true
```

Elasticsearch를 다시 시작한 다음 Kibana를 설치합니다.

## 키바나 설치

Kibana 버전이 Elasticsearch 버전과 일치하는지 확인하십시오. 자세한 내용은 [Liferay 기업 검색 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 을 확인하십시오.

```{note}
Elasticsearch 6.x가 [수명 종료](https://www.elastic.co/support/eol#elasticsearch)에 도달했습니다. 여전히 Elasticsearch 6.x를 사용하는 Liferay 7.2 시스템은 Elasticsearch 7.x로 업그레이드해야 합니다. 자세한 내용은 [Elasticsearch 7로 업그레이드](./../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-to-elasticsearch-7.md)를 참조하세요.
```

1. [Kibana](https://www.elastic.co/downloads/kibana) 을 다운로드하고 압축을 풉니다. 루트 폴더는 *Kibana Home*이라고 합니다.

1. `kibana.yml`에서 Elasticsearch의 URL을 설정하여 모니터링 데이터를 보낼 사이트를 Kibana에 알려줍니다.

   ```yaml
   elasticsearch.hosts: [ "https://localhost:9200" ]
   ```

   Elasticsearch에서 TLS/SSL이 활성화되지 않은 경우 이것은 `http` URL이고 그렇지 않으면 `https`을 사용합니다.

   보안을 구성하지 않는 경우 Kibana를 시작합니다.

1. 이제 인증을 구성하십시오. `[Kibana Home]/config/kibana.yml`에서 기본 제공 `kibana_system` 사용자의 비밀번호를 설정합니다.

   ```yaml
   elasticsearch.username: "kibana_system"
   elasticsearch.password: "liferay"
   ```

   `kibana_system` 보안 구성의 [사용자 비밀번호를 사용](../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md). Kibana가 설치되면 *관리* 사용자 인터페이스에서 내장된 사용자 비밀번호를 변경할 수 있습니다.

1. 인증서 파일을 제공하여 암호화 구성을 시작하십시오. 자세한 내용은 [Elastic의 가이드](https://www.elastic.co/guide/en/kibana/7.x/using-kibana-with-security.html#using-kibana-with-security) 을 참조하세요.

   Elasticsearch용으로 생성된 [파일을 재사용하려면](../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md#generate-node-certificates), `[Elasticsearch Home]/config/certs` 폴더를 `[Kibana Home]/config/` 폴더로 복사하십시오.

   Kibana 인스턴스에 대해 별도의 인증서를 생성하려면 Elasticsearch 노드 인증서와 동일한 CA에서 서명했는지 확인하십시오.

1. 다음 설정을 `kibana.yml`에 추가합니다.

   ```yaml
   elasticsearch.ssl.truststore.path: "config/certs/elastic-stack-ca.p12"
   elasticsearch.ssl.truststore.password: "liferay"   
   elasticsearch.ssl.keystore.path: "config/certs/elastic-nodes.p12"
   elasticsearch.ssl.keystore.password: "liferay"
   elasticsearch.ssl.verificationMode: certificate

   server.ssl.enabled: true
   server.ssl.truststore.path: "config/certs/elastic-stack-ca.p12"
   server.ssl.truststore.password: "liferay"
   server.ssl.keystore.path: "config/certs/elastic-nodes.p12"    
   server.ssl.keystore.password: "liferay"

   xpack.security.encryptionKey: "xsomethingxatxleastx32xcharactersx"
   xpack.security.session.idleTimeout: "1h"
   xpack.security.session.lifespan: "30d"

   # Below Kibana 7.6.0 (https://www.elastic.co/guide/en/kibana/7.6/release-notes-7.6.0.html)
   # only PEM format certificates and keys are supported. Comment out the trust/keystore
   # paths and passwords above and instead use:

   #elasticsearch.ssl.certificateAuthorities: [ "config/certs/ca.crt" ]
   #elasticsearch.ssl.certificate: config/certs/elastic-nodes.crt
   #elasticsearch.ssl.key: config/certs/elastic-nodes.key

   #server.ssl.certificateAuthorities: [ "config/certs/ca.crt" ]
   #server.ssl.certificate: config/certs/elastic-nodes.crt
   #server.ssl.key: config/certs/elastic-nodes.key
   ```

이 단계 후에 `https://localhost:5601` 에서 Kibana에 액세스하고 Kibana 사용자로 로그인하여 구성을 확인할 수 있습니다. 마지막 단계는 Kibana를 Liferay에 연결하는 것입니다.

계속하기 전에 Kibana를 중지하십시오.

## LES 모니터링 앱 설치 및 구성

```{note}
Liferay DXP 7.4부터 Liferay Enterprise Search(LES) 애플리케이션이 모든 Liferay DXP 번들 및 Docker 컨테이너에 포함됩니다. 따라서 Liferay DXP 7.4+에서는 모듈을 설치할 필요가 없습니다. 자세한 내용은 [LES 활성화](./activating-liferay-enterprise-search.md)를 참조하세요.
```

LES 모니터링 앱을 다운로드하고 LPKG 파일을 `[Liferay Home]/deploy` 폴더에 복사하여 설치합니다. Liferay DXP가 실행 중인 경우 서버를 다시 시작하라는 메시지가 표시될 수 있습니다. 또는 Liferay가 실행되지 않는 동안 LPKG 파일을 `[Liferay Home]/osgi/marketplace` 폴더에 넣을 수도 있습니다.

1. 커넥터가 설치되고 Kibana 및 Elasticsearch가 안전하게 구성되면 com.liferay.portal.search.elasticsearch.monitoring.web.internal.configuration.MonitoringConfiguration.config `이라는 <a href="../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md">구성 파일</a> 을 생성`.

   Liferay DXP 7.2에서 파일 이름을 `com.liferay.portal.search.elasticsearch6.xpack.monitoring.web.internal.configuration.XPackMonitoringConfiguration.config`로 지정합니다.

1. 다음 설정을 `.config` 파일에 배치합니다.

   ```properties
   kibanaPassword="liferay"
   kibanaUserName="elastic"
   kibanaURL="https://localhost:5601"
   ```

   개발 및 테스트 중에 프록시 서블릿 로깅을 활성화하면 도움이 될 수 있습니다.

   ```properties
   proxyServletLogEnable=B"true"
   ```

   정확한 구성 값은 Kibana 구성에 따라 다릅니다. 예를 들어 TLS를 활성화하지 않는 경우 `kibanaURL="http://localhost:5601"` 과 같은 URL을 사용합니다.

   또는 [시스템 설정](../../system-administration/configuring-liferay/system-settings.md)에서 모니터링 어댑터를 구성합니다. 전역 메뉴에서 *제어판* &rarr; *구성* &rarr; *시스템 설정* 로 이동하여 검색 카테고리에서 Elasticsearch 모니터링 항목을 찾습니다. 모니터링 커넥터에 대한 모든 구성 옵션이 여기에 나타납니다.

1. 구성 파일을 `Liferay Home/osgi/configs`에 배포하면 실행 중인 인스턴스가 설정을 적용합니다.

1. Kibana 자체에 설정을 두 개 더 추가합니다. 첫 번째는 Kibana가 `server.basePath`접두사가 붙은 요청을 재작성하는 것을 금지합니다. 두 번째는 모니터링 위젯이 Kibana의 모니터링 UI에 대한 프록시 역할을 하도록 Kibana의 기본 경로를 설정합니다. 이것을 `kibana.yml`에 추가하십시오.

   [라이프레이 DXP 7.3]
   ```yaml
   server.rewriteBasePath: false
   server.basePath: "/o/portal-search-elasticsearch-monitoring/monitoring-proxy"
   ```

   [라이프레이 DXP 7.2]
   ```yaml
   server.rewriteBasePath: false
   server.basePath: "/o/portal-search-elasticsearch-xpack-monitoring/xpack-monitoring-proxy"
   ```

   `server.basePath`을 설정하면 Kibana의 URL(예: `https://localhost:5601`)을 통해 Kibana UI에 액세스할 수 없습니다. Kibana UI에 대한 모든 액세스는 로그인한 Liferay 사용자만 액세스할 수 있는 모니터링 위젯을 통해 이루어집니다. URL을 사용하여 위젯으로 직접 이동

   [http://localhost:8080/o/portal-search-elasticsearch-monitoring/monitoring-proxy/app/monitoring](http://localhost:8080/o/portal-search-elasticsearch-monitoring/monitoring-proxy/app/monitoring)

1. Kibana의 UI에 대한 프록시로 Liferay의 모니터링 위젯을 사용하고 있고 자체 서명된 인증서를 사용하고 있으므로 Kibana의 인증서를 신뢰하도록 Liferay 애플리케이션 서버의 시작 JVM 매개변수를 구성해야 합니다. 여기에 Tomcat으로 시연된 두 가지 접근 방식이 있습니다.

   - 권장되는 방법은 기본 `cacerts` 파일의 복사본을 만들고 개인 키 없이 인증서를 가져온 다음 사용자 정의 truststore 파일을 사용하도록 애플리케이션 서버를 구성하는 것입니다.
      1. Liferay JVM(JDK 8의 `$JAVA_HOME/jre/lib/security` 또는 JDK 11의 `$JAVA_HOME/lib/security` 에 있음)에서 기본 `cacerts` 파일을 복사하고 이름을 `cacerts-custom.jks`로 바꿉니다. .
      1. `openssl`을 사용하여 개인 키 없이 CA의 인증서를 추출하십시오. `.p12` 하나만 있는 경우(예: `elastic-stack-ca.p12`) 다음을 사용하십시오.

         ```sh
         openssl pkcs12 -in elastic-stack-ca.p12 -out elastic-stack-ca.crt -nokeys
         ```

      1. Java의 `keytool`을 사용하여 인증서를 사용자 지정 JKS 파일로 가져옵니다.

         ```sh
         keytool -importcert -file elastic-stack-ca.crt -keystore PATH/TO/cacerts-custom.jks
         ```

      1. 사용자 지정 신뢰 저장소를 사용하도록 Tomcat을 구성합니다.

         ```
         CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/PATH/TO/cacerts-custom.jks -Djavax.net.ssl.trustStorePassword=changeit"
         ```

   - 또는 Elasticsearch 커넥터에서 보안을 구성하는 데 사용한 것과 동일한 파일을 사용하여 신뢰 저장소 경로, 비밀번호 및 유형을 애플리케이션 서버의 시작 JVM 매개변수에 추가하십시오. `setenv.sh/bat` 파일을 통해 Tomcat 서버의 `CATALINA_OPTS` 에 신뢰 저장소 및 경로 매개변수를 추가합니다.

      ```
      CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/path/to/elastic-nodes.p12 -Djavax.net.ssl.trustStorePassword=liferay -Djavax.net.ssl.trustStoreType=pkcs12"
      ```

1. 스택에 Kibana 7.11+ 및 JDK 11이 포함된 경우 TLS 버전 1.3을 비활성화해야 합니다. `--tls-max-v1.2` 을 `KIBANA_HOME/config/node.options`에 추가하여 Kibana 자체에서 TLS 1.3을 비활성화합니다. 자세한 내용 및 대체 솔루션은 [모니터링 설정 문제 해결](#troubleshooting-the-monitoring-setup) 을 참조하십시오.

Liferay와 Kibana를 다시 시작합니다.

## Liferay에서 모니터링

Kibana 및 LES 모니터링이 설치, 구성 및 실행되면 페이지에 Elasticsearch 모니터링 위젯을 추가합니다.

1. 콘텐츠 페이지에서 *단편 및 위젯* 메뉴를 열거나 위젯 페이지에서 위젯 추가 메뉴를 엽니다.

1. 위젯 검색창을 이용하여 *monitoring* 검색하고 *Elasticsearch Monitoring* 위젯을 검색 카테고리에서 페이지로 드래그합니다. Liferay DXP 7.2의 경우 위젯 이름은 *X-Pack Monitoring*입니다.

> 자세한 내용은 관련 Elasticsearch 설명서를 참조하십시오. * [클러스터 모니터링](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/es-monitoring.html) * [X-Pack 설정---클러스터 환경에서 모니터링 및 보안 모범 사례](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/setup-xpack.html)

## Kibana 구성 예

위에서 설명한 완전한 `kibana.yml` 은 다음과 같습니다.

```yaml
# X-Pack Security enabled (Basic Auth)
elasticsearch.username: "kibana_system"
elasticsearch.password: "liferay"
elasticsearch.hosts: [ "https://localhost:9200" ]

# When TLS/SSL is enabled in X-Pack Security
xpack.security.encryptionKey: "xsomethingxatxleastx32xcharactersx"
xpack.security.session.idleTimeout: "1h"
xpack.security.session.lifespan: "30d"
# Enable TLS/SSL for out-bound traffic: from Kibana to Elasticsearch
elasticsearch.ssl.truststore.path: "config/certs/elastic-stack-ca.p12"
elasticsearch.ssl.truststore.password: "liferay"   
elasticsearch.ssl.keystore.path: "config/certs/elastic-nodes.p12"
elasticsearch.ssl.keystore.password: "liferay"
elasticsearch.ssl.verificationMode: certificate

# Enable TLS/SSL for in-bound traffic: from browser or
#  DXP (Elasticsearch Monitoring widget, proxy) to Kibana
server.ssl.enabled: true
server.ssl.truststore.path: "config/certs/elastic-stack-ca.p12"
server.ssl.truststore.password: "liferay"
server.ssl.keystore.path: "config/certs/elastic-nodes.p12"    
server.ssl.keystore.password: "liferay"

# To use Kibana inside the Elasticsearch Monitoring widget
server.rewriteBasePath: false
server.basePath: "/o/portal-search-elasticsearch-monitoring/monitoring-proxy"

# Below Kibana 7.6.0 (https://www.elastic.co/guide/en/kibana/7.6/release-notes-7.6.0.html)
# only PEM format certificates and keys are supported. Comment out the trust/keystore
# paths and passwords above and instead use:

#elasticsearch.ssl.certificateAuthorities: [ "config/certs/ca.crt" ]
#elasticsearch.ssl.certificate: config/certs/elastic-nodes.crt
#elasticsearch.ssl.key: config/certs/elastic-nodes.key

#server.ssl.certificateAuthorities: [ "config/certs/ca.crt" ]
#server.ssl.certificate: config/certs/elastic-nodes.crt
#server.ssl.key: config/certs/elastic-nodes.key
```

## 모니터링 설정 문제 해결

Liferay DXP가 JDK 버전 11을 사용하고 Kibana 버전 7.11+와 통신하도록 구성된 경우 다음 오류가 발생할 수 있습니다.

```bash
SSLException: No PSK available. Unable to resume
```

이 오류는 Kibana 7.11+가 TLS 버전 1.3에 의존하기 때문에 발생합니다. 권장 솔루션은 다음 방법 중 하나를 사용하여 Liferay DXP-Kibana 스택에서 TLS 1.3을 비활성화하는 것입니다.

1. Tomcat의 아웃바운드 연결에 대해 TLS 1.3을 비활성화합니다. Tomcat의 `setenv.bat/sh` 에서 `-Dhttps.protocols=TLSv1.1,TLSv1.2` 을 설정합니다( `CATALINA_OPTS`에 추가).
1. `--tls-max-v1.2` 을 `KIBANA_HOME/config/node.options`에 추가하여 Kibana에서 TLS 1.3을 비활성화합니다.
1. 근본 문제([JDK-8213202](https://bugs.openjdk.java.net/browse/JDK-8213202))가 이미 수정된 [호환 JDK 버전](https://help.liferay.com/hc/en-us/articles/360016511651) 로 전환합니다.

## 관련 항목

* [Elasticsearch 보안](../installing-and-upgrading-a-search-engine/elasticsearch/securing-elasticsearch.md)
* [교차 클러스터 복제](./cross-cluster-replication.md)
* [튜닝 검색](../search-administration-and-tuning.md)
* [Liferay 설치 및 업그레이드](../../installation-and-upgrades.md)
