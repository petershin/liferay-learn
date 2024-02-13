---
toc:
  - >-
    ./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md
  - >-
    ./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md
---
# Elasticsearch 설치 문제 해결

Liferay와 Elasticsearch는 구성으로 가득 찬 복잡한 시스템입니다. [연결할 때](./getting-started-with-elasticsearch.md), 도중에 어려움에 부딪힐 수 있습니다. 아래에는 문제 해결을 위한 기술이 포함되어 있습니다.

몇 가지 일반적인 문제와 해결 방법에 대해 알아보려면 다음을 참조하세요.

* [Elasticsearch 연결 문제 해결](./troubleshooting-elasticsearch-installation/troubleshooting-the-elasticsearch-connection.md)
* [Elasticsearch 문제 해결: 일반적인 문제](./troubleshooting-elasticsearch-installation/troubleshooting-elasticsearch-common-issues.md)

Liferay와 함께 번들로 제공되는 사이드카 Elasticsearch 서버의 문제를 해결하려면 [사이드카/임베디드 Elasticsearch 문제 해결](./using-the-sidecar-or-embedded-elasticsearch.md#troubleshooting-the-sidecar-embedded-elasticsearch) 을 참조하세요.

## 검색창의 Elasticsearch 쿼리 검사하기

Liferay의 검색 인프라는 사용자가 검색 창 위젯에서 검색할 때마다 대규모 Elasticsearch 요청을 생성합니다. Elasticsearch로 전송된 쿼리를 검사하려면 검색 인사이트 위젯을 사용하세요. 자세한 내용은 [검색 인사이트](../../search-pages-and-widgets/search-insights.md)를 참조하세요.

## Liferay에서 생성된 모든 Elasticsearch 쿼리 검사하기

Liferay에서 생성된 모든 Elasticsearch 쿼리를 검사하려면 [서버 관리 로그 수준 UI](../../../system-administration/using-the-server-administration-panel/configuring-logging.md)를 사용하여 `com.liferay.portal.search.elasticsearch7.internal.ElasticsearchIndexSearcher` 의 로그 수준을 `INFO` 수준으로 설정합니다.

```{tip}
Liferay 7.1-7.2를 사용 중이고 기본 번들 커넥터를 Elasticsearch 6에 사용하는 경우, 패키지 이름의 버전 번호를 '7'에서 '6'으로 변경하세요.
```

## 자세한 SSL 로깅 사용

암호화 관련 문제를 해결하려면 자세한 SSL 로깅을 사용 설정하세요.

Liferay의 경우, 애플리케이션 서버의 JVM에서 `-Djavax.net.debug=ssl:handshake:verbose` 을 설정합니다. Tomcat에서 이 옵션은 `setenv.sh`의 `CATALINA_OPTS` 에 추가됩니다:

```properties
CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.debug=ssl:handshake:verbose"
```

Elasticsearch의 경우, `[Elasticsearch Home]/config/jvm.options`의 끝에 `-Djavax.net.debug=ssl:handshake:verbose` 를 추가합니다.
