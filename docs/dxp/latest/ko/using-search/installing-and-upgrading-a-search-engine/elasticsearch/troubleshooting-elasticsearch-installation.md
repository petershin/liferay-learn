---
toc:
  - >-
    ./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md
  - >-
    ./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md
---
# Elasticsearch 설치 문제 해결

```{toctree}
:maxdepth: 1

troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md
troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md
```

Liferay 및 Elasticsearch는 구성으로 가득 찬 복잡한 시스템입니다. [그들을 연결](./getting-started-with-elasticsearch.md)할 때 도중에 어려움에 처할 수 있습니다. 아래에는 문제 해결을 위한 기술이 포함되어 있습니다.

몇 가지 일반적인 문제와 해결 방법에 대해 알아보려면 다음을 참조하십시오.

- [Elasticsearch 연결 문제 해결](./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md)
- [Elasticsearch 문제 해결: 일반적인 문제](./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md)

Liferay와 함께 번들로 제공되는 사이드카 Elasticsearch 서버 문제를 해결하려면 [Sidecar/Embedded Elasticsearch 문제 해결](./using-the-sidecar-or-embedded-elasticsearch.md#troubleshooting-the-sidecar-embedded-elasticsearch) 을 참조하십시오.

## 검색 표시줄의 Elasticsearch 쿼리 검사

Liferay의 검색 인프라는 사용자가 검색 표시줄 위젯에서 검색할 때마다 대규모 Elasticsearch 요청을 생성합니다. Elasticsearch로 전송된 쿼리를 검사하려면 검색 인사이트 위젯을 사용하세요. 자세한 내용은 [검색 인사이트](../../search-pages-and-widgets/search-insights.md)을 참조하십시오.

## Liferay 생성 Elasticsearch 쿼리 검사

Liferay에서 생성한 Elasticsearch 쿼리를 검사하려면 [서버 관리 로그 수준 UI](../../../system-administration/using-the-server-administration-panel/configuring-logging.md)를 사용하여 `com.liferay.portal.search.elasticsearch7.internal.ElasticsearchIndexSearcher` 에서 `INFO` 수준의 로그 수준을 설정합니다.

```{tip}
Liferay 7.1-7.2를 사용 중이고 Elasticsearch 6에 대한 기본 번들 커넥터를 사용하는 경우 패키지 이름의 버전 번호를 '7'에서 '6'으로 변경합니다.
```

## Verbose SSL 로깅 활성화

암호화 관련 문제를 해결하려면 상세 SSL 로깅을 활성화하십시오.

Liferay의 경우 Application Server의 JVM에서 `-Djavax.net.debug=ssl:handshake:verbose` 설정합니다. Tomcat에서는 옵션이 `CATALINA_OPTS` in `setenv.sh`에 추가됩니다.

```properties
CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.debug=ssl:handshake:verbose"
```

Elasticsearch의 경우 `[Elasticsearch Home]/config/jvm.options`끝에 `-Djavax.net.debug=ssl:handshake:verbose` 을 추가합니다.
