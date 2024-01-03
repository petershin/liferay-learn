# Glowroot로 JVM 문제 해결

{bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA100+`

Glowroot는 시스템 문제를 신속하게 식별하기 위한 대시보드를 표시합니다. 추적된 오류 목록을 보려면 _오류_ 탭을 클릭하세요. 다음 주제는 발생할 수 있는 일반적인 Java 환경 문제와 문제 해결에 도움이 되는 Glowroot를 사용하는 방법에 대한 몇 가지 팁입니다.

## 자바 교착상태

교착 상태는 다른 스레드가 리소스를 사용하고 있어 여러 스레드를 처리할 수 없을 때 발생합니다. 응용 프로그램이 느려지거나 응답하지 않을 수 있습니다.

교착 상태가 의심되는 경우 Glowroot에서 _JVM_ 탭을 클릭합니다. 왼쪽 탐색 메뉴에서 _스레드 덤프_를 클릭합니다. 출력을 분석하여 교착 상태를 찾습니다.

![Click the JVM tab and select thread dump.](./troubleshooting-jvm-issues-with-glowroot/images/01.png)

## 스레드 누출

스레드 누수(Thread Leak)는 새로운 스레드가 많이 생성되었으나 해당 스레드가 더 이상 필요하지 않을 때 제대로 관리 및 종료되지 않을 때 발생합니다. 시간이 지남에 따라 이러한 스레드는 너무 많은 시스템 리소스를 소비하고 성능에 영향을 미칠 수 있습니다.

스레드 누출이 의심되는 경우 가능한 표시는 `java.lang.OutOfMemory` 오류입니다. Glowroot에서 _Errors_ 탭을 클릭하고 오류가 있는지 확인하세요. 실행 중인 모든 스레드 목록을 보려면 MBean 트리를 사용하십시오. _JVM_ 탭을 클릭하고 왼쪽 탐색에서 _Mbean tree_를 클릭합니다. `java.lang` 섹션까지 아래로 스크롤하고 _Threading_을 클릭합니다.

![Click the JVM tab and select the Mbean tree.](./troubleshooting-jvm-issues-with-glowroot/images/02.png)

## 데이터베이스 교착상태

데이터베이스 교착 상태는 두 개 이상의 프로세스 또는 트랜잭션이 서로 리소스를 해제하기를 기다리고 있을 때 발생합니다.

느린 트랜잭션에 대해서는 Glowroot에서 트랜잭션 추적을 확인하세요. _거래_ 탭을 클릭하세요. 트랜잭션 패널 아래에서 _느린 추적_을 클릭합니다. 차트를 사용하여 가능한 교착 상태를 식별하는 데 시간이 너무 오래 걸리는 트랜잭션을 찾으세요.

![Click slow traces to see transactions that take a long time.](./troubleshooting-jvm-issues-with-glowroot/images/03.png)

## 데이터베이스 연결 풀 문제

데이터베이스 연결 누수는 프로그램이나 응용 프로그램이 더 이상 필요하지 않은 데이터베이스 연결을 적절하게 해제하거나 닫지 못할 때 발생합니다. 이로 인해 사용 가능한 데이터베이스 연결이 고갈되고 시스템 속도가 저하될 수 있습니다.

Glowroot에서 _Errors_ 탭을 클릭하여 연결 풀 시간 초과 오류를 확인하거나 데이터베이스 연결 상태를 확인하세요. _JVM_ 탭을 클릭하고 왼쪽 탐색에서 _Mbean tree_를 클릭합니다. 'com.zaxxer.hikari' 섹션까지 아래로 스크롤하고 '풀(HikariPool-1)'을 클릭합니다. 활성 연결 수와 연결을 기다리는 스레드 수를 확인하세요. 사용 사례에 따라 풀 크기를 늘려야 할 수도 있습니다.

게이지 대시보드에 Hikari 연결 풀을 추가하려면 _Configuration_ &rarr; _Gauges_로 이동합니다. _새로 추가_를 클릭하고 `com.zaxxer.hikari:type=Pool(HikariPool-1)`을 검색하세요. 모든 Mbean 속성을 선택하고 _Add_를 클릭하십시오.

![Add the Hikari connection pool to the gauges dashboard.](./troubleshooting-jvm-issues-with-glowroot/images/04.png)

_JVM_ 탭을 클릭하고 왼쪽 메뉴에서 _Gauges_를 클릭합니다. 이제 게이지 대시보드에서 Hikari 연결 풀을 모니터링할 수 있습니다.
