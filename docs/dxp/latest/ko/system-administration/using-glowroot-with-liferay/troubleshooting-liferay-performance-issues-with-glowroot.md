# Glowroot로 Liferay 성능 문제 해결

{bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA100+`

Glowroot를 사용하여 Liferay 설치의 성능 문제를 식별하고 진단하십시오. 다음 주제는 진단할 수 있는 몇 가지 일반적인 문제입니다.

## 비용이 많이 드는 SQL 쿼리

비용이 많이 드는 SQL 쿼리는 응답 시간이 느리고 데이터베이스에 과도한 로드를 초래할 수 있습니다. 시스템이 처리 중인 다양한 쿼리를 모니터링하려면 **트랜잭션** 탭을 클릭하세요. 거래 패널에서 **쿼리** 를 클릭하세요. 테이블에서 **총 시간(ms**) 을 클릭하여 가장 많은 시간이 소요되는 쿼리를 식별하세요.

![Identify the queries that take the most time.](./troubleshooting-liferay-performance-issues-with-glowroot/images/01.png)

비용이 많이 드는 SQL 쿼리로 인해 연결을 기다리는 다른 스레드가 백업될 수도 있습니다. 게이지 대시보드에 Hikari 연결 풀을 추가하려면 **Configuration** &rarr; **Gauges** 로 이동합니다. **새로 추가** 를 클릭하고 `com.zaxxer.hikari:type=Pool(HikariPool-1)`을 검색하세요. 모든 Mbean 속성을 선택하고 **Add** 를 클릭하십시오.

**JVM** 탭을 클릭한 다음 왼쪽 메뉴에서 **Gauges** 를 클릭하세요. 이제 게이지 대시보드에서 Hikari 연결 풀을 모니터링할 수 있습니다.

## 캐시 크기 문제

Liferay는 [Ehcache](https://www.ehcache.org/) 사용하여 대부분의 엔터티를 캐시합니다. Mbean 트리를 사용하여 특정 엔터티의 구성 및 활용도를 검사합니다. 예를 들어 `UserImpl`에 대한 엔터티 캐시를 검사합니다.

1. **JVM** 탭을 클릭하세요. 왼쪽 탐색 메뉴에서 **Mbean tree** 를 클릭하세요.

1. 아래로 스크롤(또는 텍스트 검색)하여 `CacheConfiguration` 섹션에서 `UserImpl`을 찾습니다. 엔터티의 현재 캐시 구성을 확인하세요.

   ![See the current configuration for the entity.](./troubleshooting-liferay-performance-issues-with-glowroot/images/02.png)

1. 아래로 스크롤(또는 텍스트 검색)하여 `CacheStatistics` 섹션에서 `UserImpl`을 찾습니다. 엔터티의 현재 캐시 활용도를 확인하세요.

   ![See the current utilization for the entity.](./troubleshooting-liferay-performance-issues-with-glowroot/images/03.png)

엔터티 검사에 따라 [캐시 구성](../../building-applications/data-frameworks/cache.md) 을 필요에 따라 변경합니다.

캐시를 지우는 것도 가능합니다. Liferay에서 **제어판 &rarr;** 서버 관리_로 이동합니다. 캐시 지우기는 리소스 탭에서 사용할 수 있습니다.

## 사용자 정의 SQL 쿼리

사용자 정의 쿼리는 캐시되지 않으므로 때때로 트랜잭션 시간이 길어질 수 있습니다. 사용자 정의 쿼리가 시스템에 미치는 영향을 보려면 위의 비용이 많이 [비용이 많이 드는 SQL 쿼리](#expensive-sql-queries) 참조하세요.

## 대형 테이블

시간이 지남에 따라 Liferay 데이터베이스 테이블이 커질 수 있습니다. 이로 인해 거래 속도가 느려질 수도 있습니다. 몇 가지 예는 다음과 같습니다

- `Audit_AuditEvent` - 로그인 등 감사 이벤트와 관련된 테이블
- `OAuth2Authorization` - 인증 관련 테이블
- `SamlSpAuthRequest`, `SamlSpMessage`, `SamlSpSession` - SAML 인증과 관련된 테이블
- `UserNotificationEvent` - 알림 관련 테이블

성능을 향상하려면 [데이터베이스 정리](../../installation-and-upgrades/upgrading-liferay/upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md) 고려하십시오.

## 동시성 문제

낮은 CPU 사용률에도 불구하고 일부 트랜잭션이 느린 것처럼 보인다면 동기화된 리소스의 동시성 문제일 수 있습니다. Glowroot의 **Transactions** 탭으로 이동합니다. 왼쪽 메뉴에서 특정 거래를 선택합니다. 대시보드를 JVM 스레드 섹션까지 아래로 스크롤하여 트랜잭션을 검사합니다.

![Scroll down the dashboard to the JVM thread section.](./troubleshooting-liferay-performance-issues-with-glowroot/images/04.png)

**CPU 시간** : 컴퓨팅에 소요된 시간입니다.

**차단된 시간** : 스레드가 차단되어 동기화 메커니즘을 기다리는 시간입니다.

**대기 시간** : 스레드가 트랜잭션을 완료하기 위해 기다린 시간입니다.

거래가 차단되었거나 오랫동안 대기하고 있는지 확인하세요.

## 백엔드 서비스 속도 저하

느린 트랜잭션은 외부 백엔드 서비스가 느리거나 응답하지 않아 발생했을 수 있습니다. 위의 [동시성 문제](#concurrency-issues) 과 마찬가지로 트랜잭션 대시보드를 사용하여 백엔드 서비스 트랜잭션을 검사합니다. 서비스의 일부 구성을 변경해야 할 수도 있습니다.

## 긴 쓰레기 수거 시간

Glowroot 게이지를 사용하여 가비지 수집을 모니터링하고 비정상적으로 오랜 시간이 걸리는지 확인하세요. **JVM** 탭으로 이동하여 왼쪽 메뉴에서 **Gauges** 를 클릭합니다. 아래로 스크롤하여 표시할 가비지 수집기 `CollectionTime` 속성을 선택합니다.

![View the CollectionTime garbage collector attribute in the gauge dashboard.](./troubleshooting-liferay-performance-issues-with-glowroot/images/05.png)

## 메타공간 메모리 부족 오류

메타공간 크기는 애플리케이션 서버를 구성할 때 설정됩니다. JVM이 구성된 것보다 더 많은 메모리를 요구하려고 하면 충돌이 발생할 수 있습니다. Glowroot 게이지를 사용하여 메타스페이스 사용량을 검사합니다. **JVM** 탭으로 이동하여 왼쪽 메뉴에서 **Gauges** 를 클릭합니다. 아래로 스크롤하여 가비지 수집기 `CollectionTime` 속성을 선택합니다. 아래로 스크롤하여 표시할 Java `Metaspace` 속성을 선택합니다.

## 느리거나 비용이 많이 드는 코드

Glowroot를 사용하여 특정 코드 섹션에 성능 문제가 있는지 분석하세요. **거래** 탭으로 이동하세요. 검사할 특정 트랜잭션을 선택하고 트랜잭션 패널에서 **스레드 프로필** 을 클릭하세요. 스레드 프로필은 트랜잭션의 스레드 스택을 보여줍니다.

이 패널에서 Flame 그래프를 렌더링할 수도 있습니다. **Flame 그래프 보기** 를 클릭하세요.

![Click view flame graph to render a flame graph.](./troubleshooting-liferay-performance-issues-with-glowroot/images/06.png)

Flame 그래프는 스택 추적의 시각화를 보여줍니다. 요소 위에 마우스를 올리면 각 방법의 세부 사항을 볼 수 있습니다.

## 계측 구성

계측을 구성하여 모든 메서드 호출을 개별 트랜잭션으로 캡처합니다. 새 계측기를 생성하려면

1. **Configuration** &rarr; **Instrumentation** 으로 이동합니다. **새로 추가** 를 클릭하세요.

1. 클래스 이름과 메소드 이름을 입력합니다. 캡처할 항목을 선택하고 특정 요구 사항에 따라 세부 정보를 입력하세요.

1. **추가** 를 클릭하세요. 새 거래가 **Transactions** 탭 아래에 나타납니다.

자세한 내용은 Glowroot 계측 [글로우루트 계측](https://glowroot.org/instrumentation.html) 참조하세요.

## 허위 경보

느린 트랜잭션은 잠재적인 시스템 오류를 나타낼 수 있습니다. 그러나 예상할 수 있는 몇 가지 시나리오가 있습니다. 예를 들어 Liferay가 처음 시작되면 시간이 오래 걸리는 대규모 SQL 쿼리가 표시될 수 있습니다. 캐시가 비어 있는 긴 유휴 기간 후에 느린 트랜잭션이 발생할 수도 있습니다. JSP 요청은 느린 트랜잭션으로 나타날 수도 있습니다. JSP는 런타임에 컴파일되며 JSP 요청이 많으면 속도가 느려질 수 있습니다.
