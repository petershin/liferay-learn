# Liferay 튜닝

Liferay의 성능을 조정하는 방법에는 여러 가지가 있습니다. 여기에는 Liferay 애플리케이션을 지원하는 JVM(Java Virtual Machine) 및 프레임워크 구성, 성능 및 리소스 모니터링, 필요에 맞게 설정 조정이 포함됩니다. 다음은 튜닝 항목에 대한 개요입니다.

## 개발자 설정 비활성화

일부 개발자 기능은 프로덕션용이 아니므로 성능을 최적화하려면 비활성화해야 합니다. 여기에는 다음과 같은 기능이 포함됩니다.

* 디버거 수용
* 시스템 점검 수행
* 시작 시 자동으로 데이터 업그레이드
* 자동으로 적용할 코드 변경 사항에 대한 설문 조사

모든 개발자 포털 속성을 비활성화하는 것으로 시작하십시오.

### 포털 개발자 속성

Liferay의 [포털 속성](../reference/portal-properties.md) 에는 개발을 용이하게 하는 여러 속성이 포함되어 있습니다. Liferay 설치에 포함된 [`Portal-developer.properties`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-impl/src/portal-developer.properties) 은 모든 속성을 선언하지만 기본적으로 비활성화되어 있습니다. 이 파일은 다음 설정을 사용하여 `portal-ext.properties` 파일에서 참조한 경우에만 활성화됩니다.

```properties 
include-and-override=portal-developer.properties
```

Liferay의 `portal-developer.properties` 파일을 포함했거나 자체 개발자 속성 파일(예: `[Liferay Home]/portal-developer.properties`)을 포함한 경우 `Portal-ext.properties에서 주석 처리하여 비활성화합니다.` 파일:

```properties 
#include-and-override=portal-developer.properties
#include-and-override=${liferay.home}/portal-developer.properties
```

마찬가지로 개발자 속성을 개별적으로 활성화한 경우 해당 속성도 주석 처리합니다.

다음으로 JSP 엔진에서 개발자 설정을 비활성화합니다.

### JSP 엔진 설정

많은 애플리케이션 서버의 JSP 엔진은 기본적으로 개발용으로 설정됩니다. 생산에 들어가기 전에 다음 설정을 비활성화하십시오.

**개발 모드:** 이렇게 하면 JSP 컨테이너가 JSP 파일의 변경 사항에 대해 파일 시스템을 폴링합니다. 프로덕션에서 이와 같이 JSP를 즉석에서 변경하지 않으므로 이 모드를 끕니다.

**매핑된 파일:** 개발 시 JSP 텍스트 라인당 하나의 명령문이 아니라 하나의 인쇄 명령문으로 정적 컨텐츠를 생성하는 것이 일반적입니다. 프로덕션에서는 후자를 선택하십시오.

예를 들어 Tomcat에서 개발 모드와 매핑된 파일을 비활성화하려면 `$CATALINA_HOME/conf/web.xml` 파일의 JSP 서블릿 구성을 다음과 같이 업데이트합니다.

```xml
<servlet>
    <servlet-name>jsp</servlet-name>
    <servlet-class>org.apache.jasper.servlet.JspServlet</servlet-class>   
    <init-param>
        <param-name>development</param-name>
        <param-value>false</param-value>
    </init-param>
    <init-param>
        <param-name>mappedFile</param-name>
        <param-value>false</param-value>
    </init-param>
    <load-on-startup>3</load-on-startup>
</servlet>
```

개발 모드 및 매핑된 파일이 비활성화됩니다.

비프로덕션 개발자 기능을 비활성화했으므로 이제 애플리케이션 서버의 스레드 풀을 구성합니다.

## 스레드 풀 구성

애플리케이션 서버에 대한 각 요청은 요청 기간 동안 작업자 스레드를 사용합니다. 요청을 처리하는 데 사용할 수 있는 스레드가 없으면 요청은 사용 가능한 다음 작업자 스레드를 기다리기 위해 대기합니다. 미세하게 조정된 시스템에서 스레드 풀의 스레드 수는 총 동시 요청 수와 균형을 이룹니다. 서비스 요청을 위해 유휴 상태로 남아 있는 스레드의 양이 많지 않아야 합니다.

50개 스레드의 초기 스레드 풀 설정을 사용한 다음 애플리케이션 서버의 모니터링 콘솔 내에서 모니터링하십시오. 평균 페이지 시간이 2-3초 범위인 경우 더 높은 숫자(예: 250)를 사용할 수 있습니다. 스레드 풀의 스레드 수가 너무 적으면 과도한 요청을 대기열에 넣을 수 있습니다. 스레드가 너무 많으면 과도한 컨텍스트 전환이 발생할 수 있습니다.

Tomcat에서 스레드 풀은 `$CATALINA_HOME/conf/server.xml` 파일의 `Connector` 요소에 구성됩니다. [Apache Tomcat 설명서](https://tomcat.apache.org/tomcat-9.0-doc/config/http.html) 에 자세한 내용이 나와 있습니다. 다음은 스레드 풀 구성의 예입니다.

```xml
<Connector
    address="xxx.xxx.xxx.xxx"
    connectionTimeout="600000"
    maxConnections="16384"
    maxKeepAliveRequests="-1"
    maxThreads="75"
    minSpareThreads="50"
    port="8080"
    redirectPort="8443"
    socketBuffer="-1"
    URIEncoding="UTF-8"
/>
```

CPU 기반 로드를 테스트하거나 CPU 용량이 우려되는 경우 사용 가능한 모든 하드웨어 스레드에 대해 약 75개의 스레드를 사용하여 테스트합니다. 예를 들어 시스템에 4개의 하드웨어 스레드가 있는 경우 `maxThreads=300`로 설정합니다. I/O 기반 로드를 테스트 중이거나 I/O 용량이 우려되는 경우 더 많은 스레드를 사용하거나 비I/O 차단 커넥터를 사용하도록 전환하십시오. 시스템을 테스트하고 필요에 맞게 연결 풀 설정을 조정하십시오.

커넥터 유형, 연결 시간 초과 및 TCP 대기열을 포함하여 `커넥터` 주변의 추가 조정 매개변수를 사용할 수 있습니다. 자세한 내용은 응용 프로그램 서버 설명서를 참조하십시오.

## 데이터베이스 연결 풀 구성

데이터베이스 연결 풀은 재사용을 위해 데이터베이스 연결을 관리하므로 새로운 요청이 있을 때마다 새 연결을 여는 수고를 덜 수 있습니다. 풀은 Liferay가 데이터베이스에서 데이터를 검색해야 할 때마다 연결을 제공합니다. 풀 크기가 너무 작으면 데이터베이스 연결을 기다리는 서버에서 대기열을 요청합니다. 그러나 크기가 너무 크면 유휴 데이터베이스 연결이 리소스를 낭비합니다.

스레드 풀 크기가 크지 않은 경우(예: 200+) 풀 크기를 스레드 풀 크기보다 약간 크게 구성하십시오. 정상적인 사용에서 대부분의 작업자 스레드는 한 번에 최대 하나의 JDBC 연결을 사용합니다. 그러나 중첩된 트랜잭션이 있는 스레드와 같은 일부 스레드는 여러 데이터베이스 연결을 사용합니다. 연결 풀 크기를 스레드 풀 크기보다 약간 크게 만들면 이러한 스레드가 설명됩니다.

```{note}
스레드 풀 크기가 큰 경우 연결 풀을 비슷한 크기로 만드는 것은 성능에 도움이 되지 않습니다.
```

연결 수가 데이터베이스 연결 제한을 초과하는 경우 카운터 데이터 소스의 풀 크기를 줄이십시오. 카운터 데이터베이스 트랜잭션은 작고 빠르며 중첩되지 않으므로 카운터 연결 풀은 줄이기에 좋은 후보입니다. 카운터 데이터 소스에 대한 자세한 내용은 [클러스터 노드용 데이터베이스 구성](./clustering-for-high-availability/database-configuration-for-cluster-nodes.md)을 참조하십시오.

Liferay는 연결 풀링에 HikariCP를 사용합니다. 데이터베이스 연결은 [JDBC 섹션](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 아래의 [문맥 재산](../reference/portal-properties.md) 로 구성됩니다.

```properties
jdbc.default.connectionTimeout=30000
jdbc.default.idleTimeout=600000
jdbc.default.maximumPoolSize=100
jdbc.default.maxLifetime=0
jdbc.default.minimumIdle=10
jdbc.default.registerMbeans=true
```

추가 설정 세부 사항은 [HikariCP 설정](https://github.com/brettwooldridge/HikariCP/wiki) 을 참조하십시오.

```{note}
Liferay 7.4부터는 HikariCP가 유일하게 지원되는 연결 풀입니다. C3P0, DBCP 및 Tomcat과 같은 다른 연결 풀에 대한 지원이 종료되었습니다.
```

스레드 풀과 마찬가지로 연결 풀을 모니터링하고 성능 테스트에 따라 조정하십시오.

## Java 가상 머신 구성

애플리케이션 서버는 JVM(Java Virtual Machine)에서 실행됩니다. 메모리 관리 및 가비지 수집은 Liferay가 사용자 요청에 응답하는 속도에 영향을 미칩니다. 다음 지침은 [JVM](./tuning-your-jvm.md) 튜닝을 참조하십시오.
