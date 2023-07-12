# Elasticsearch에 연결

[Elasticsearch](./installing-elasticsearch.md)설정 후 Liferay Connector to Elasticsearch를 사용하여 Liferay에 연결합니다. 연결 단계는 구성 중인 커넥터에 따라 다릅니다. 참조를 위해 [사용 가능한 Liferay Elasticsearch 커넥터](#available-liferay-elasticsearch-connectors) 을 참조하십시오.

주목할만한 설치 및 구성 절차 차이점이 여기에 나와 있습니다.

```{important}
연결을 구성하기 전에 각 Liferay 서버 노드를 중지하십시오.
```

Liferay 7.2를 사용 중인 경우 [Liferay 7.2: Elasticsearch 7 커넥터 설치](#liferay-72-installing-elasticsearch-7-connector)로 건너뜁니다.

## 커넥터 구성

구성 파일을 사용하여 Liferay 7.3+용 Elasticsearch 커넥터를 구성할 수 있습니다.

```
com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
```

이 동일한 파일을 사용하여 Liferay 7.3 및 7.4를 Elasticsearch 7 또는 8과 연결할 수 있습니다. 사용 가능한 Elasticsearch 버전을 찾으려면 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 참조하십시오.

배포하려면 `[Liferay Home]/osgi/configs/`에 배치합니다.

도커의 경우

```bash
docker cp ~/path/to/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config [container]:/mnt/liferay/files
```

또는 사용자 인터페이스에서 커넥터를 구성할 수 있습니다. 글로벌 메뉴(![Global Menu](../../../images/icon-applications-menu.png))에서 제어판 &rarr; 시스템 설정으로 이동하여 _검색_ 카테고리를 엽니다. 항목 이름은 Elasticsearch 7입니다.

간단한 Liferay 7.3+ 커넥터 구성은 프로덕션 모드(`productionModeEnabled="true"`)를 활성화하고 URL을 각 Elasticsearch 노드(`networkHostAddresses=["http://es-node:9200"]`)로 설정합니다.

1. 다음 구성 파일을 만듭니다.

    ```
    com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
    ```

1. `.config` 파일에서 구성 속성을 지정합니다. 다음은 [보안 속성](./securing-elasticsearch.md) 주석 처리된 예입니다(암호화가 활성화된 경우 `https` 네트워크 호스트 주소를 사용해야 함).

    ```properties
    # In CE/DXP 7.3+, productionModeEnabled replaces operationMode (deprecated):
    productionModeEnabled=B"true"
    networkHostAddresses=["http://es-node1:9200","http://es-node3:9201","http://es-node3:9202"]
    # In CE/DXP 7.3+ the security settings are included in the ElasticsearchConfiguration
    # In CE/DXP 7.2 the security settings go in com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config
    # Authentication
    #authenticationEnabled=B"true"
    #username="elastic"
    #password="liferay"

    # TLS/SSL
    #networkHostAddresses=["https://es-node1:9200","https://es-node3:9201","https://es-node3:9202"]
    #httpSSLEnabled=B"true"
    #truststoreType="pkcs12"
    #trustStorePath="/PATH/TO/elastic-nodes.p12"
    #trustStorePassword="liferay"

    # Highly recommended for all non-prodcution usage (e.g., practice, tests, diagnostics):
    #logExceptionsOnly="false"
    ```

1. `.config` 파일을 `[Liferay Home]/osgi/configs` 폴더에 넣습니다.

```{tip}
커넥터에는 많은 구성 설정이 포함되어 있습니다. 해당 정의는 [Elasticsearch 커넥터 설정](./elasticsearch-connector-configuration-reference.md)을 참조하십시오. 대부분의 구성은 [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/index.html)에서 사용 가능한 설정에 해당합니다.
```

Elasticsearch 서버를 이름으로 참조하려면 각 Elasticsearch 서버 이름을 DNS 또는 Liferay 서버의 `/etc/hosts` 파일에 있는 해당 IP 주소에 매핑하십시오.

```{tip}
네트워크 호스트 주소 형식은 `http[s]://[호스트 이름]:[port]입니다. Liferay Docker 컨테이너를 사용하는 경우 `docker run` 명령과 함께 `--add-host [호스트 이름]:[IP 주소]` 옵션을 사용하여 호스트 이름을 각 Elasticsearch 서버 IP 주소에 매핑할 수 있습니다. 포트는 Elasticsearch 컨테이너의 docker run 명령에서 `-p 1234:5678` 옵션의 첫 번째 값(이 경우 `1234`)으로 정의됩니다. HTTPS를 사용하지 않고 로컬 테스트 환경을 실행하는 경우 모든 주소는 `http://localhost:port`일 수 있습니다. 자세한 내용은 [Docker 설명서](https://docs.docker.com/engine/reference/run/#managing-etchosts)를 참조하세요.
```

## Liferay 7.2: Elasticsearch 7 커넥터 설치

### Elasticsearch 6 커넥터 중지

Liferay 7.2에서 번들 커넥터 애플리케이션 및 API는 Elasticsearch 6용입니다. Elasticsearch 7 커넥터를 설치하기 전에 비활성화해야 합니다.

1. 라는 파일을 만듭니다.

    ```
    com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
    ```

1. 이 콘텐츠를 파일에 추가합니다.

    ```properties
    blacklistBundleSymbolicNames=[ \
        "com.liferay.portal.search.elasticsearch6.api", \
        "com.liferay.portal.search.elasticsearch6.impl", \
        "com.liferay.portal.search.elasticsearch6.spi", \
        "com.liferay.portal.search.elasticsearch6.xpack.security.impl", \
        "Liferay Connector to X-Pack Security [Elastic Stack 6.x] - Impl", \
        "Liferay Enterprise Search Security - Impl.lpkg" \
    ]
    ```

1. 파일을 `[Liferay Home]/osgi/configs` 폴더에 넣습니다.

    Liferay 서버를 시작하면(아직 아님) Liferay는 이 파일을 읽고 선언된 번들이 시작되지 않도록 차단합니다.

    ```{tip}
    **Docker:** `Liferay Home` 및 기타 Liferay 설치의 중요한 폴더는 설명된 [here](../../../installation-and-upgrades/)과 같이 `/mnt/liferay`의 Docker 컨테이너에서 액세스할 수 있습니다. 설치-liferay/using-liferay-docker-images/container-lifecycle-and-api.md#api). `docker cp /path/to/local/file [container_name]:/mnt/liferay/files/osgi/configs`를 사용하여 구성 파일을 컨테이너에 배치할 수 있습니다. 나중에 `docker cp`를 사용하여 Liferay Connector를 Elasticsearch 7 LPKG 파일에 배포할 수 있습니다.
    ```

### Elasticsearch 7 커넥터 설치

1. Elasticsearch 7에 Liferay 커넥터를 다운로드합니다.

   커넥터가 Elasticsearch 버전과 일치하는지 확인하십시오. 커넥터 애플리케이션이 최신 버전(예: 7.18.0)을 지원하더라도 커넥터의 클라이언트 라이브러리는 이전 버전의 Elasticsearch(예: 7.17.1)용일 수 있습니다. Liferay는 모든 마이너 Elasticsearch 버전으로 커넥터를 테스트하고 필요할 때 새 업데이트 커넥터 버전을 생성합니다. 항상 그렇듯이 커넥터 호환성에 대해서는 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 참조하십시오.

   * CE: [Elasticsearch에 대한 Liferay CE 커넥터 7](https://web.liferay.com/en/marketplace/-/mp/application/170642090)
   * DXP: [Elasticsearch에 대한 Liferay 커넥터 7](https://web.liferay.com/en/marketplace/-/mp/application/170390307)

1. [LPKG](../../../system-administration/installing-and-managing-apps/installing-apps.md) 폴더에 넣어 설치합니다.

   ```bash
   [Liferay Home]/deploy
   ```

   도커의 경우

   ```bash
   docker cp ~/path/to/Liferay\ Connector\ to\ Elasticsearch.lpkg [container]:/mnt/liferay/deploy
   ```

   Liferay 서버를 시작하면(아직 아님) Liferay가 LPKG를 배포합니다.

커넥터를 구성할 준비가 되었습니다.

### Liferay 7.2용 커넥터 구성

1. 다음 Elasticsearch 구성 파일을 만듭니다.

    ```bash
    com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
    ```

1. `.config` 파일에서 구성 속성을 지정합니다. 다음은 원격 작동 모드를 활성화하고, 각 Elasticsearch 노드에 대한 전송 주소를 설정하고, 구성 중인 연결을 식별하는 예입니다.

    ```properties
    # com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
    operationMode="REMOTE"
    transportAddresses="ip.of.elasticsearch.node:9300"
    # Highly recommended for all non-production usage (e.g., practice, tests, diagnostics):
    #logExceptionsOnly="false"
    ```

1. `.config` 파일을 `[Liferay Home]/osgi/configs` 폴더에 배치하여 구성을 배포합니다.

Liferay를 시작할 준비가 되었습니다.

## Liferay 시작 및 재인덱싱

Elasticsearch가 [설치되어 있고](./installing-elasticsearch.md)실행 중인 경우 Liferay를 시작합니다. 제어판에서 구성 &rarr; 검색으로 이동하여 Elasticsearch 연결이 활성화되어 있는지 확인합니다.

![검색 관리 패널에 활성 연결이 표시됩니다.](./getting-started-with-elasticsearch/images/01.png)

검색 인덱스 및 맞춤법 검사 인덱스를 다시 인덱싱합니다. 제어판 &rarr; 구성 &rarr; 검색의 색인 작업 탭에서 이 작업을 모두 호출합니다.

Liferay 7.3+에서 Workflow Metrics Settings 창에서 [Workflow Metrics](../../../process-automation/workflow/using-workflows/using-workflow-metrics.md) 인덱스를 다시 인덱싱합니다.

1. 전역 메뉴(![Applications Menu](../../../images/icon-applications-menu.png))에서 애플리케이션 &rarr; 워크플로 메트릭으로 이동합니다.

1. 앱 옵션 메뉴(![App Options](../../../images/icon-app-options.png))에서 _설정_ 창을 엽니다.

1. _모두 재색인_클릭합니다. 시스템의 각 가상 인스턴스에 대해 이 작업을 반복합니다.

```{note}
기본 데이터 스토리지(데이터베이스에서 지원하지 않는 데이터 저장)에 Elasticsearch 인덱스를 사용하는 경우 [스냅샷 및 복원 접근 방식](./upgrading-elasticsearch/backing-up-elasticsearch.md를 사용하여 해당 데이터를 새 Elasticsearch 클러스터로 가져올 수 있습니다. ). 7.2 및 7.3에서 결과 순위 및 동의어에 대한 Liferay의 자체 검색 튜닝 인덱스는 기본 스토리지 인덱스입니다. 7.4에서 이러한 인덱스는 데이터베이스 테이블에 의해 지원됩니다.
```

Liferay 7.4 U45+/GA45+ 및 Liferay DXP 7.3 U14+에서는 향상된 로깅이 활성화되어 시스템 및 회사 색인에 대한 재색인 시작 및 완료 시점을 알 수 있습니다. 예를 들어,

```log
2023-01-09 20:44:17.730 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 20097
2023-01-09 20:45:00.986 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 20097
```

이제 Liferay는 콘텐츠를 원격 Elasticsearch 설치로 인덱싱합니다.

## 사용 가능한 Liferay Elasticsearch 커넥터

Elasticsearch에 대한 번들 커넥터가 설치에 항상 최선의 선택은 아닙니다. Elasticsearch와 통신하는 데 사용할 수 있는 커넥터 간의 차이점을 이해하는 것이 중요합니다.

| 라이프레이 CE/DXP 버전           | 이름                                       | 가용도                                                                                                                                             | 통신 프로토콜                                                                                            | 보안 연결 지원                                                                            | 작동 모드             |
|:------------------------- |:---------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------------------- |:----------------------------------------------------------------------------------- |:----------------- |
| Liferay 7.4, 모든 종류        | Elasticsearch 7에 대한 Liferay 커넥터          | 번들                                                                                                                                              | [HTTP](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-overview.html) | &#10004;                                                                            | 사이드카/원격(프로덕션)\* |
| CE 7.3 GA4+, DXP 7.3 GA1+ | Elasticsearch 7에 대한 Liferay(CE) 커넥터      | 번들                                                                                                                                              | [HTTP](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-overview.html) | &#10004;                                                                            | 사이드카/원격(프로덕션)\* |
| CE 7.2, DXP 7.2           | Elasticsearch 6에 대한 Liferay 커넥터(CE)      | 번들                                                                                                                                              | [수송](https://www.elastic.co/guide/en/elasticsearch/client/java-api/6.x/transport-client.html)      | &#10004;\*\* ( [LES](https://www.liferay.com/products/dxp/enterprise-search)필요) | 임베디드 / 원격         |
| CE 7.2, DXP 7.2           | Liferay 커넥터(CE)에서 Elasticsearch 7(v3.x)로 | 시장: [CE](https://web.liferay.com/marketplace/-/mp/application/170642090), [DXP](https://web.liferay.com/marketplace/-/mp/application/170390307) | [수송](https://www.elastic.co/guide/en/elasticsearch/client/java-api/7.x/transport-client.html)      | &#10004;                                                                            | 임베디드 / 원격         |

\* 커넥터 구성의 _Operation Mode_ (`operationMode`) 설정은 더 이상 사용되지 않으며 _Production Mode Enabled_ (`productionModeEnabled`)로 대체됩니다.

\*\* [Liferay Enterprise Search Security](https://web.liferay.com/marketplace/-/mp/application/106163963) 애플리케이션을 통해.

호환 가능한 Elasticsearch 버전 및 필요한 패치 수준을 포함한 자세한 호환성 정보는 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651)을 참조하십시오.

## 다음

이제 Liferay가 Elasticsearch에 연결되었으므로 Elasticsearch를 사용할 수 있습니다. 프로덕션의 경우 Liferay와 Elasticsearch 서버 간의 통신을 보호해야 합니다. 자세한 내용은 [Elasticsearch 보안](./securing-elasticsearch.md) 참조하십시오.

## 관련 항목

* [Elasticsearch 보안](./securing-elasticsearch.md)
* [Elasticsearch 커넥터 설정](./elasticsearch-connector-configuration-reference.md)
* [사이드카 또는 임베디드 Elasticsearch 사용](./using-the-sidecar-or-embedded-elasticsearch.md)
* [Liferay Enterprise Search](../../liferay-enterprise-search.md)
* [수색 페이지](../../search-pages-and-widgets/working-with-search-pages/search-pages.md)
* [검색 관리 및 조정](../../search-administration-and-tuning.md)
