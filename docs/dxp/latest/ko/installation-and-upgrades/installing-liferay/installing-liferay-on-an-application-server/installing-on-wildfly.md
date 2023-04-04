---
uuid: b9b38050-9b86-42e1-862b-11ddbeae8c04
---

# WildFly에 설치

WildFly에 설치하려면 DXP WAR 설치, 종속성 설치, WildFly 구성 및 WildFly에 DXP 배포가 필요합니다. 데이터베이스 및 메일 서버 연결도 구성해야 합니다.

## 전제 조건

Liferay DXP에는 Java JDK 8 또는 11이 필요합니다. 자세한 내용은 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151) 참조하십시오.

[도움말 센터](https://customer.liferay.com/downloads) (구독) 또는 [Liferay 커뮤니티 다운로드](https://www.liferay.com/downloads-community)에서 이 파일을 다운로드하십시오. 관리자는 다음을 다운로드해야 합니다.

* DXP 전쟁 파일
* OSGi 종속성 ZIP 파일
* 종속성 ZIP 파일(DXP 7.3 이하)

설치 단계에서는 다음 용어를 사용합니다.

[`[Liferay Home]`](../../reference/liferay-home.md): WildFly 서버 폴더가 포함된 폴더( `$WILDFLY_HOME`이라고 함). DXP 설치 및 배포 후 `data`, `deploy`, `logs` 폴더를 생성합니다.

`$WILDFLY_HOME`: WildFly 서버 폴더. 일반적으로 `wildfly-[version]`로 명명됩니다.

## DXP WAR 설치

1. 깨끗한 Wildfly 설치로 시작하고 `$WILDFLY_HOME/standalone/deployments/ROOT.war` 폴더가 존재하는 경우 해당 하위 폴더와 파일을 모두 삭제합니다.
1. DXP WAR 파일을 `$WILDFLY_HOME/standalone/deployments/ROOT.war` 폴더에 압축 해제합니다(폴더가 없으면 생성).

## 종속성 설치

1. OSGi 종속성 ZIP 파일을 `[Liferay Home]/osgi` 폴더에 압축 해제합니다(이 폴더가 없으면 생성). Liferay의 OSGi 런타임은 이러한 모듈에 의존합니다.
1. DXP 7.4+ WAR 파일에는 MariaDB 및 PostgreSQL용 드라이버가 포함되어 있습니다. 이전 WAR에는 해당 드라이버가 없습니다. 7.4+ WAR에 사용 중인 지원 데이터베이스에 대한 드라이버가 없는 경우 데이터베이스 공급업체의 JDBC JAR 파일을 다운로드하여 `$WILDFLY_HOME/standalone/deployments/ROOT.war/WEB-INF/shielded-container-lib` 폴더에 넣으세요.

    지원되는 데이터베이스 목록은 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151) 참조하십시오.

```{note}
Hypersonic 데이터베이스는 DXP와 함께 번들로 제공되며 테스트 목적으로 유용합니다. 프로덕션 DXP 인스턴스에 HSQL을 사용하지 마십시오.
```

### 이전 버전에 대한 종속성 설치

DXP 7.3 및 이전 버전의 경우 다음 추가 단계를 따르십시오.

1. 종속성 ZIP 파일을 `$WILDFLY_HOME/modules/com/liferay/portal/main` 폴더에 압축 해제합니다(이 폴더가 없으면 생성).
1. `$WILDFLY_HOME/modules/com/liferay/portal/main` 폴더에 `module.xml` 이라는 파일을 만듭니다. 파일에서 데이터베이스 공급업체의 JAR 파일인 포털 모듈로 설정된 경로를 사용하여 리소스 루트 요소를 선언하고 필요한 리소스와 종속성을 모두 포함합니다.

    ```xml
    <?xml version="1.0"?>

    <module xmlns="urn:jboss:module:1.0" name="com.liferay.portal">
        <resources>
            <resource-root path="[place your database vendor's JAR file name here]" />
            <resource-root path="[place a Liferay dependencies ZIP JAR file name here]" />
            <!-- Add a resource-root element for each Liferay dependencies ZIP JAR -->
        </resources>
        <dependencies>
            <module name="javax.api" />
            <module name="javax.mail.api" />
            <module name="javax.servlet.api" />
            <module name="javax.servlet.jsp.api" />
            <module name="javax.transaction.api" />
        </dependencies>
    </module>
    ```

    `[여기에 데이터베이스 공급업체의 JAR 파일 이름 입력]` 데이터베이스용 드라이버 JAR로 바꿉니다.

    종속성 ZIP의 각 JAR에 대해 `경로` 특성이 JAR 이름으로 설정된 `리소스 루트` 요소를 추가합니다. 예를 들어 `com.liferay.petra.concurrent.jar` 파일에 대해 다음과 같이 `resource-root` 요소를 추가합니다.

    ```xml
    <resource-root path="com.liferay.petra.concurrent.jar" />
    ```

**검문소:**

1. OSGi 종속성은 `[Liferay Home]/osgi` 폴더에 압축 해제되었습니다.
1. 데이터베이스 공급업체의 JDBC 드라이버가 설치되어 있습니다.
1. `module.xml` `<resource-root>` 요소의 모든 JAR을 나열했습니다.

## 독립 실행형 모드와 도메인 모드의 WildFly에서 DXP 실행

WildFly는 *독립형* 모드 또는 *도메인* 모드에서 시작할 수 있습니다. 도메인 모드를 사용하면 단일 제어 지점에서 여러 애플리케이션 서버 인스턴스를 관리할 수 있습니다. 이러한 애플리케이션 서버의 콜렉션을 *도메인*이라고 합니다. 독립 실행형 모드와 도메인 모드에 대한 자세한 내용은 [WildFly 관리 가이드](https://docs.wildfly.org/23/Admin_Guide.html)에서 이 주제에 대한 섹션을 참조하십시오. DXP는 독립 실행형 모드에서 WildFly를 완벽하게 지원하지만 도메인 모드에서는 지원하지 않습니다.

DXP는 WildFly가 독립 실행형 모드에서 실행될 때 지원하지만 도메인 모드에서 실행될 때는 지원하지 않습니다. DXP의 자동 배포는 관리형 배포에서 작동하지 않습니다. WildFly가 파일(폭발 또는 비폭발)을 복사하여 관리형 배포의 콘텐츠를 관리하기 때문입니다. 이렇게 하면 JSP 후크 및 Ext 플러그인이 의도한 대로 작동하지 않습니다. 예를 들어 JSP 후크는 DXP의 JSP 재정의 메커니즘이 애플리케이션 서버에 의존하기 때문에 관리되는 도메인 모드에서 실행되는 WildFly에서 작동하지 않습니다. 그러나 JSP 후크 및 Ext 플러그인은 더 이상 사용되지 않으므로 사용하지 않을 수 있습니다.

도메인 모드 배포를 사용하는 경우 명령줄 인터페이스를 사용합니다.

```{note}
이것은 DXP가 여러 WildFly 서버의 클러스터 환경에서 실행되는 것을 막지 않습니다. 독립 실행형 모드에서 실행되는 WildFly 서버에서 실행되는 DXP 인스턴스의 클러스터를 설정할 수 있습니다. 자세한 내용은 [클러스터링 문서](../../setting-up-liferay/clustering-for-high-availability.md)를 참조하십시오.
```

## WildFly 구성

DXP를 실행하도록 WildFly를 구성하면 다음이 포함됩니다.

* 환경 변수 설정
* 속성 및 설명자 설정
* 불필요한 구성 제거

`$WILDFLY_HOME/standalone/configuration/standalone.xml`를 다음과 같이 수정합니다.

1. JSP와 Java 8 VM 호환성을 사용하도록 서블릿 컨테이너를 구성합니다. `<하위 시스템 xmlns="urn:jboss:domain:undertow:12.0" ...` 요소에서 기본 서블릿 컨테이너 `<servlet-container name="default">` 를 찾습니다. 서블릿 컨테이너의 `<jsp-config>` 요소에서 다음과 같이 `development`, `source-vm`및 `target-vm` 속성을 설정합니다.

    ```xml
    <jsp-config development="true" source-vm="1.8" target-vm="1.8" />
    ```

1. `<server>`초에서 닫는 `</extensions>` 태그를 찾습니다. 닫는 태그 바로 아래에 다음 시스템 속성이 아직 없으면 삽입합니다.

    ```xml
    <system-properties>
        <property name="org.apache.catalina.connector.URI_ENCODING" value="UTF-8" />
        <property name="org.apache.catalina.connector.USE_BODY_ENCODING_FOR_QUERY_STRING" value="true" />
    </system-properties>
    ```

1. 로그에서 `WFLYSRV0059` 및 `WFLYEE0007` 메시지를 필터링합니다. `<subsystem xmlns="urn:jboss:domain:logging:8.0">` 요소의 `<console-handler>` 태그에서 `<level name="INFO"/>` 태그 바로 아래에 다음 `<filter-spec>` 태그를 추가합니다.

    ```xml
    <filter-spec value="not(any(match(&quot;WFLYSRV0059&quot;),match(&quot;WFLYEE0007&quot;)))" />
    ```

1. `<subsystem xmlns="urn:jboss:domain:deployment-scanner:2.0">` 요소의 `<deployment-scanner>` 태그에 `deployment-timeout="600"` 설정을 추가하여 배치 스캐너 제한시간을 추가하십시오. 예를 들어,

    ```xml
    <deployment-scanner deployment-timeout="600" path="deployments" relative-to="jboss.server.base.dir" scan-interval="5000" runtime-failure-causes-rollback="${jboss.deployment.scanner.rollback.on.failure:false}"/>
    ```

1. Liferay의 JAAS 보안 도메인을 `<subsystem xmlns="urn:jboss:domain:security:2.0">`의 `<security-domains>` 요소에 추가합니다. 추가할 도메인 코드는 다음과 같습니다.

    ```xml
    <security-domain name="PortalRealm">
        <authentication>
            <login-module code="com.liferay.portal.security.jaas.PortalLoginModule" flag="required" />
        </authentication>
    </security-domain>
    ```

1. `<subsystem xmlns="urn:jboss:domain:undertow:12.0" ...>` 요소에서 시작 콘텐츠 요소를 주석 처리합니다. 예를 들어,

    ```xml
    <!--<location name="/" handler="welcome-content"/>-->
    ```

    그리고

    ```xml
    <handlers>
        <!--<file name="welcome-content" path="${jboss.home.dir}/welcome-content"/>-->
    </handlers>
    ```

**검문소:**

계속하기 전에 다음 속성이 `standalone.xml` 파일에 설정되었는지 확인하십시오.

1. 새로운 `<system-property>` 가 추가됩니다.
1. 새로운 `<filter-spec>` 가 추가됩니다.
1. `<deployment-timeout>` `600`로 설정됩니다.
1. 새로운 `<security-domain>` 가 생성됩니다.
1. 시작 콘텐츠가 비활성화되었습니다.

다음으로 JVM 및 시작 스크립트를 구성합니다.

`$WILDFLY_HOME/bin/` 폴더에서 독립 실행형 도메인의 구성 스크립트 파일 `standalone.conf`를 엽니다.

* 파일 인코딩을 `UTF-8로 설정`
* 사용자 시간대를 `GMT`로 설정
* 선호하는 프로토콜 스택 설정
* 사용 가능한 기본 메모리 양을 늘립니다.

```{important}
DXP는 애플리케이션 서버 JVM이 'GMT' 시간대와 'UTF-8' 파일 인코딩을 사용하도록 요구합니다.
```

`standalone.conf` 스크립트를 다음과 같이 편집합니다.

1. `미만 if [ "x$JAVA_OPTS" = "x" ];` 문, `JAVA_OPTS` 할당에서 JVM 크기 조정 옵션을 제거합니다. 예를 들어 다음을 교체합니다.

    ```bash
    JAVA_OPTS="-Xms64m -Xmx512m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true"
    ```

    이것으로:

    ```bash
    JAVA_OPTS="-Djava.net.preferIPv4Stack=true"
    ```

1. 파일 끝에 이 Java 옵션 설정을 추가합니다.

    ```bash
    JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Dlog4j2.formatMsgNoLookups=true -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
    ```

Java 옵션 및 메모리 인수는 아래에 설명되어 있습니다.

**JVM 옵션 설명**

| 옵션                                        | 설명                                                                                                   |
|:----------------------------------------- |:---------------------------------------------------------------------------------------------------- |
| `-Dfile.encoding=UTF-8`                   | DXP에는 UTF-8 파일 인코딩이 필요합니다.                                                                           |
| `-Djava.locale.providers=JRE,COMPAT,CLDR` | 이것은 JDK 11에서 4자리 날짜를 표시하는 데 필요합니다.                                                                   |
| `-Djava.net.preferIPv4Stack=true`         | IPv6보다 IPv4 스택을 선호합니다.                                                                               |
| `-Dlog4j2.formatMsgNoLookups=true`        | RCE(원격 코드 실행) 취약성을 해결합니다. 자세한 내용은 [LPS-143663](https://issues.liferay.com/browse/LPS-143663) 참조하십시오. |
| `-Duser.timezone=GMT`                     | DXP는 GMT 시간대를 사용하기 위해 애플리케이션 서버 JVM이 필요합니다.                                                          |

**메모리 인수 설명**

| 메모리 인수                 | 설명                                                                       |
|:---------------------- |:------------------------------------------------------------------------ |
| `-Xms`                 | 힙의 초기 공간.                                                                |
| `-Xmx`                 | 힙의 최대 공간입니다.                                                             |
| `-XX:NewSize`          | 초기 새 공간. 새 크기를 전체 힙의 절반으로 설정하면 일반적으로 더 작은 새 크기를 사용하는 것보다 더 나은 성능을 제공합니다. |
| `-XX:MaxNewSize`       | 최대 새 공간.                                                                 |
| `-XX:MetaspaceSize`    | 정적 콘텐츠를 위한 초기 공간입니다.                                                     |
| `-XX:MaxMetaspaceSize` | 정적 콘텐츠를 위한 최대 공간.                                                        |
| `-XX:SurvivorRatio`    | 서바이벌 공간에 대한 새 공간의 비율입니다. 생존자 공간은 구세대 공간으로 승격되기 전에 젊은 세대 개체를 보유합니다.       |

```{note}
DXP를 설치한 후 성능 향상을 위해 이러한 구성(이러한 JVM 옵션 포함)을 추가로 조정할 수 있습니다. [Tuning Liferay](../../setting-up-liferay/tuning-liferay.md) 및 [JVM 조정](../../setting-up-liferay/tuning-your-jvm. md) 자세한 내용은
```

**검문소:**

1. 파일 인코딩, 사용자 시간대 및 기본 프로토콜 스택은 `standalone.conf.sh` 스크립트의 `JAVA_OPTS` 에 설정되었습니다.
1. 사용 가능한 기본 메모리 양이 증가했습니다.

이제 WildFly에 DXP를 설치하기 위해 규정된 스크립트 수정이 완료되었습니다.

### IBM JDK 사용

WildFly 서버와 함께 IBM JDK를 사용하는 경우 다음 추가 단계를 완료하십시오.

1. DXP 7.3 및 이전 버전의 경우 `$WILDFLY_HOME/modules/com/liferay/portal/main/module.xml` 파일로 이동하여 `<dependencies>` 요소 내에 이 종속성을 삽입합니다.

    `<module name="ibm.jdk" />`

1. `$WILDFLY_HOME/modules/system/layers/base/sun/jdk/main/module.xml` 파일로 이동하여 `<paths>...</paths>` 요소 내부에 다음 경로를 삽입합니다.

    ```xml
    <path name="com/sun/crypto" />
    <path name="com/sun/crypto/provider" />
    <path name="com/sun/image/codec/jpeg" />
    <path name="com/sun/org/apache/xml/internal/resolver" />
    <path name="com/sun/org/apache/xml/internal/resolver/tools" />
    ```

추가된 경로는 배포 예외 및 이미지 업로드 문제와 관련된 문제를 해결합니다.

## Liferay의 데이터 소스 구성

DXP에는 데모 용도로는 좋지만 **프로덕션 환경에서는 사용해서는 안 되는** Hypersonic 데이터베이스가 내장되어 있습니다. 프로덕션 환경에서는 모든 기능이 지원되는 RDBMS를 사용하세요. 데이터베이스를 설정하려면 [데이터베이스 구성](../configuring-a-database.md)을 참조하세요.

Liferay DXP는 DXP의 내장 데이터 소스(권장)를 사용하거나 앱 서버에서 생성한 데이터 소스를 사용하여 데이터베이스에 연결할 수 있습니다.

[설정 마법사](../running-liferay-for-the-first-time.md)를 사용하여 DXP를 처음 실행할 때 데이터베이스로 DXP의 내장 데이터 소스를 구성할 수 있습니다. 또는 데이터베이스의 [데이터베이스 템플리트](../../reference/database-templates.md) 를 기반으로 [`Portal-ext.properties` 파일](../../reference/portal-properties.md) 에서 데이터 소스를 구성할 수 있습니다.

## Wildfly의 데이터 소스 구성

WildFly를 사용하여 데이터 소스를 관리하는 경우 다음 단계를 따르십시오.

1. DXP WAR(7.4+) 또는 데이터베이스 공급업체에서 JDBC JAR을 가져와 `$WILDFLY_HOME/modules/com/liferay/portal/main` 폴더에 복사합니다.

1. `$WILDFLY_HOME/modules/com/liferay/portal/main` 폴더에 `module.xml` 이라는 파일을 만듭니다. 파일에서 포털 모듈 및 JDBC JAR을 선언합니다.

    ```xml
    <?xml version="1.0"?>

    <module xmlns="urn:jboss:module:1.0" name="com.liferay.portal">
        <resources>
            <resource-root path="[place your database vendor's JAR file name here]" />
        </resources>
        <dependencies>
            <module name="javax.api" />
            <module name="javax.mail.api" />
            <module name="javax.servlet.api" />
            <module name="javax.servlet.jsp.api" />
            <module name="javax.transaction.api" />
        </dependencies>
    </module>
    ```

1. `$WILDFLY_HOME/standalone/configuration/standalone.xml` 파일의 `<datasources>` 요소 내에 데이터 소스를 추가합니다.

    ```xml
    <datasource jndi-name="java:jboss/datasources/ExampleDS" pool-name="ExampleDS" enabled="true" jta="true" use-java-context="true" use-ccm="true">
        <connection-url>[place the URL to your database here]</connection-url>
        <driver>[place your driver name here]</driver>
        <security>
            <user-name>[place your user name here]</user-name>
            <password>[place your password here]</password>
        </security>
    </datasource>
    ```

    데이터베이스 URL, 사용자 이름 및 암호를 적절한 값으로 바꾸십시오.

    ```{note}
    데이터 소스 `jndi-name`을 변경해야 하는 경우 `<default-bindings>` 태그에서 `datasource` 요소를 편집하십시오.
    ```

1. 드라이버 클래스 이름을 `standalone.xml` 파일의 `<datasources>` 요소에도 있는 `<drivers>` 요소에 추가합니다.

    ```xml
    <drivers>
        <driver name="[name of database driver]" module="com.liferay.portal">
            <driver-class>[JDBC driver class]</driver-class>
        </driver>
    </drivers>
    ```

    MySQL을 사용하는 최종 데이터 소스 하위 시스템은 다음과 같아야 합니다.

    ```xml
    <subsystem xmlns="urn:jboss:domain:datasources:1.0">
        <datasources>
            <datasource jndi-name="java:jboss/datasources/ExampleDS" pool-name="ExampleDS" enabled="true" jta="true" use-java-context="true" use-ccm="true">
                <connection-url>jdbc:mysql://localhost/lportal</connection-url>
                <driver>mysql</driver>
                <security>
                    <user-name>root</user-name>
                    <password>root</password>
                </security>
            </datasource>
            <drivers>
                <driver name="mysql" module="com.liferay.portal">
                    <driver-class>com.mysql.cj.jdbc.Driver</driver-class>
                </driver>
            </drivers>
        </datasources>
    </subsystem>
    ```

1. Liferay Home 폴더의 [`portal-ext.properties`](../../reference/portal-properties.md) 파일에서 JNDi 데이터 소스를 지정하십시오. 예를 들어,

    ```properties
    jdbc.default.jndi.name=java:jboss/datasources/ExampleDS
    ```

이제 데이터 소스가 구성되어 사용할 준비가 되었습니다.

## 메일 서버에 연결

데이터베이스 구성과 마찬가지로 메일을 구성하는 가장 쉬운 방법은 DXP가 메일 세션을 처리하도록 하는 것입니다. DXP의 내장 메일 세션을 사용하려면 이 섹션을 건너뛰고 제어판에서 [메일 세션을 구성](../../setting-up-liferay/configuring-mail.md)하십시오.

WildFly로 메일 세션을 관리하려면 다음 단계를 따르세요.

1. 다음과 같이 `$WILDFLY_HOME/standalone/configuration/standalone.xml` 파일에서 메일 하위 시스템을 지정합니다. 

    ```xml
    <subsystem xmlns="urn:jboss:domain:mail:3.0">
        <mail-session jndi-name="java:jboss/mail/MailSession" name="mail-smtp">
            <smtp-server ssl="true" outbound-socket-binding-ref="mail-smtp" username="USERNAME" password="PASSWORD"/>
       </mail-session>
    </subsystem>
    ...
    <socket-binding-group name="standard-sockets" default-interface="public" port-offset="${jboss.socket.binding.port-offset:0}">
    ...
    <outbound-socket-binding name="mail-smtp">
            <remote-destination host="[place SMTP host here]" port="[place SMTP port here]"/>
        </outbound-socket-binding>
    </socket-binding-group>
    ```


1. Liferay Home의 [`portal-ext.properties`](../../reference/portal-properties.md) 파일에서 메일 세션을 참조하십시오. 예를 들어, 

    ```properties
    mail.session.jndi.name=java:jboss/mail/MailSession
    ```

## DXP 배포

1. `ROOT.war`배포를 트리거하려면 `$WILDFLY_HOME/standalone/deployments/` 폴더에 `ROOT.war.dodeploy` 이라는 빈 파일을 만듭니다.
1. `$WILDFLY_HOME/bin` 로 이동하고 `standalone.sh`를 실행하여 WildFly 애플리케이션 서버를 시작합니다. WildFly는 `ROOT.war.dodeploy` 파일을 감지하고 파일 접두사(즉, `ROOT.war`)와 일치하는 웹 애플리케이션을 배포합니다.

DXP를 배포한 후 `PhaseOptimizer`과 관련된 아래와 같은 과도한 경고 및 로그 메시지가 표시될 수 있습니다. 이들은 양성이며 무시할 수 있습니다. 앱 서버의 로깅 수준 또는 로그 필터를 조정하여 이러한 메시지를 끌 수 있습니다.

```
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
WARNING: Skipping pass gatherExternProperties
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
WARNING: Skipping pass checkControlFlow
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
INFO: pass supports: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, modules, exponent operator (**), async function, trailing comma in param list]
current AST contains: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, exponent operator (**), async function, trailing comma in param list, object literals with spread, object pattern rest
```

Liferay DXP Enterprise 구독이 있는 경우 DXP는 활성화 키를 요청합니다. 자세한 내용은 [Liferay DXP](../../setting-up-liferay/activating-liferay-dxp.md) 활성화를 참조하십시오.

축하해요! WildFly에서 DXP를 실행하고 있습니다.

## 다음 단계

[관리자 사용자](../../../getting-started/introduction-to-the-admin-account.md) 로 로그인하고 DXP에서 솔루션 구축을 시작할 수 있습니다. 또는 [추가 Liferay DXP 설정](../../setting-up-liferay.md) 항목을 탐색할 수 있습니다.

* [마켓플레이스 플러그인 설치](../../../system-administration/installing-and-managing-apps/using-marketplace.md#appendix-installing-the-marketplace-plugin)
* [평가판 기간 동안 플러그인 액세스](../../../system-administration/installing-and-managing-apps/installing-apps/accessing-ee-plugins-during-a-trial-period.md)
* [검색 엔진 설치](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)
* [Liferay DXP 보안](../../securing-liferay.md)
* [고가용성을 위한 클러스터링](../../setting-up-liferay/clustering-for-high-availability.md)
