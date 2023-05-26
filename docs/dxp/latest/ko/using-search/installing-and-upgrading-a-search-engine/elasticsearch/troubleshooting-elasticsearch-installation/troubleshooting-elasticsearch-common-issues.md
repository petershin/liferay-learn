# Elasticsearch 문제 해결: 일반적인 문제

다음은 Elasticsearch 및 Liferay를 구성하는 동안 발생할 수 있는 몇 가지 일반적인 문제입니다. 추가 연결 관련 오류는 [Elasticsearch 연결 문제 해결](./troubleshooting-the-elasticsearch-connection.md)에서 설명합니다.

## 클러스터 이름

`elasticsearch.yml` 의 `cluster.name` 속성 값은 Liferay Elasticsearch 커넥터에 구성된 `clusterName` 속성과 일치해야 합니다.

## 운송 주소

Elasticsearch 커넥터 구성의 `transportAddresses` 속성 값에는 Elasticsearch 노드가 실행 중인 하나 이상의 유효한 호스트 및 포트가 포함되어야 합니다. Liferay가 임베디드 모드에서 실행 중이고 독립형 Elasticsearch 노드 또는 클러스터를 시작하면 포트 `9300` 이 사용되었음을 감지하고 포트 `9301`으로 전환합니다. 그런 다음 Liferay의 Elasticsearch 커넥터를 원격 모드로 설정하면 기본 포트(`9300`)에서 Elasticsearch를 계속 찾습니다. 클러스터의 모든 마스터 및 데이터 노드 주소를 나열해야 합니다.

[Elasticsearch에 연결하기](../connecting-to-elasticsearch.md) 에서는 커넥터 구성 옵션에 대해 자세히 다룹니다.

## 네트워크 호스트 주소

Liferay 7.3+에서 번들로 제공되는 [사이드카 Elasticsearch](../using-the-sidecar-or-embedded-elasticsearch.md) 서버는 기본적으로 포트 `9201` 에서 실행됩니다. 즉, Elasticsearch의 기본 HTTP 포트(`9200`)를 사용하여 원격 Elasticsearch 설치의 `networkHostAddress` 을 설정해도 충돌이 발생하지 않습니다. 전송 주소와 마찬가지로 클러스터의 모든 마스터 및 데이터 노드 주소를 나열해야 합니다.

## 클러스터 스니핑(추가 구성)

Elasticsearch 클러스터는 여러 노드 [유형](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-node.html#modules-node) 을 가질 수 있습니다. [Elasticsearch 커넥터에서 기본적으로 활성화된 클러스터 스니핑](https://www.elastic.co/guide/en/elasticsearch/client/java-api/7.x/transport-client.html) 은 `transportAddresses` 속성에 구성된 데이터 노드를 찾습니다. 사용할 수 없는 경우 커넥터는 콘솔 로그에서 `NoNodeAvailableException` 을 발생시킬 수 있습니다. 이 오류를 방지하고 클러스터 스니핑을 계속 사용하려면 하나 이상의 데이터 노드의 전송 주소를 구성하십시오.

클러스터 스니핑을 비활성화하려면 `clientTransportSniff=false` 을 `.config` 파일에 추가하거나 시스템 설정에서 클라이언트 전송 스니핑 속성을 선택 취소합니다.

## 도커 연결 거부됨

연결을 설정하려면 Liferay DXP 컨테이너가 Elasticsearch IP를 인식해야 합니다. 다음과 같은 인수를 전달하여 `docker run` 단계 중에 Elasticsearch 컨테이너 이름을 Elasticsearch 서버 호스트 IP 주소에 매핑하는 `/etc/hosts/` 항목을 추가합니다.

```bash
--add-host elasticsearch:[IP address]
```

실행 중인 모든 컨테이너의 IP 주소를 얻으려면 다음을 실행하십시오.

```bash
docker network inspect bridge
```

## 구성 파일 이름

Liferay를 Elasticsearch에 연결하는 데 문제가 있는 경우(아마도 Liferay 로그에 `NoNodeAvailableException` 메시지가 표시될 수 있음) 취해야 할 첫 번째 단계 중 하나는 올바르게 이름이 지정된 구성 파일을 확인하는 것입니다. 인식할 수 없는 구성 파일은 처리되지 않으며 결과 오류는 다양할 수 있습니다.

## Elasticsearch 지원 중단 로깅 비활성화

때때로 Liferay의 Elasticsearch 커넥터에서 사용되는 Elasticsearch API는 더 이상 사용되지 않습니다. Liferay에 필요한 기능에 영향이 없는 경우에도 다음과 같은 경고 로그 메시지가 나타날 수 있습니다.

```
[2019-07-16T14:47:05,779][WARN ][o.e.d.c.j.Joda           ] [
ode_name]'y' year should be replaced with 'u'. Use 'y' for year-of-era. Prefix your date format with '8' to use the new specifier.
[2019-07-16T14:47:06,007][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.certificate] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,007][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.certificate_authorities] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,008][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.key] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,463][WARN ][o.e.d.x.c.s.SSLService   ] [
ode_name]SSL configuration [xpack.http.ssl] relies upon fallback to another configuration for [key configuration, trust configuration], which is deprecated.
[2019-07-16T14:47:06,464][WARN ][o.e.d.x.c.s.SSLService   ] [
ode_name]SSL configuration [xpack.security.transport.ssl.] relies upon fallback to another configuration for [key configuration, trust configuration], which is deprecated.
1. 07-16T14:47:05,779][WARN ][o.e.d.c.j.Joda           ] [
```

이러한 경고는 기능적 문제를 나타내지 않으며 비활성화할 수 있습니다(방법을 알아보려면 [Deprecation Logging](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/logging.html#deprecation-logging) 참조).

## 관련 주제

* [Elasticsearch에 연결](../connecting-to-elasticsearch.md)
* [Elasticsearch 설치 문제 해결](../troubleshooting-elasticsearch-installation.md)
* [Elasticsearch 연결 문제 해결](./troubleshooting-the-elasticsearch-connection.md)
