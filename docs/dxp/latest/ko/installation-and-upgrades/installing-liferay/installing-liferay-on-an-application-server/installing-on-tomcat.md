# 톰캣에 설치하기

```{important}
[Liferay-Tomcat 번들 사용](../installing-a-liferay-tomcat-bundle.md) 또는 [Docker 이미지](../../../getting-started/starting-with-a-docker -image.md)는 Liferay DXP 사용을 시작하는 가장 빠른 방법입니다. 이 문서는 Tomcat 애플리케이션 서버의 구성을 완전히 제어하려는 사용자를 위한 것입니다.

계속하기 전에 [Liferay-Tomcat 번들 설치](../installing-a-liferay-tomcat-bundle.md) 및 [데이터베이스 구성](../configuring-a-database.md) 문서를 검토하세요.
```

Tomcat에 설치하려면 DXP WAR 설치, 종속성 설치, Tomcat 구성 및 DXP 배포가 필요합니다. 데이터베이스 및 메일 서버 연결도 구성해야 합니다.

이를 수행하는 가장 간단하고 쉬운 방법은 Liferay Liferay-Tomcat [번들을 다운로드하고 여기에서 종속성, 스크립트 및](../installing-a-liferay-tomcat-bundle.md)</code> `아래 설명된 위치로 복사하는 것입니다. 그렇지 않으면 종속성을 다운로드하고 수동으로 Tomcat을 구성할 수 있습니다.</p>

<h2 spaces-before="0">전제 조건</h2>

<p spaces-before="0">Tomcat을 구성하는 방법에 관계없이 <a href="https://customer.liferay.com/downloads">도움말 센터</a> (구독) 또는 <a href="https://www.liferay.com/downloads-community">Liferay 커뮤니티 다운로드</a>에서 이러한 파일을 다운로드하여 설치해야 합니다.</p>

<ul>
<li>DXP 전쟁 파일</li>
<li>OSGi 종속성 ZIP 파일</li>
<li>종속성 ZIP 파일(DXP 7.3 이하)</li>
</ul>

<p spaces-before="0">Java JDK 8 또는 11이 필요합니다.</p>

<pre><code class="{note}">지원되는 JDK, 데이터베이스 및 환경에 대한 정보는 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151)를 참조하십시오.  권장 JVM 설정은 [JVM 구성](../../reference/jvm-configuration.md)을 참조하십시오.
`</pre>

Tomcat 서버 상위 폴더는 [*Liferay Home*](../../reference/liferay-home.md)입니다. `$TOMCAT_HOME` 는 Tomcat 서버 폴더를 나타냅니다. 일반적으로 이름은 `tomcat-[version]` 또는 `apache-tomcat-[version]`입니다.

## DXP WAR 설치

1. 깨끗한 Tomcat 설치로 시작하는 경우 `$CATALINA_BASE/webapps/ROOT` 폴더의 내용을 삭제합니다. 이렇게 하면 기본 Tomcat 홈 페이지가 제거됩니다.
1. DXP `.war` 파일 내용을 `$CATALINA_BASE/webapps/ROOT`로 추출합니다.

## 종속성 설치

DXP는 Liferay-Tomcat 번들에 포함된 많은 JAR에 의존합니다. 번들의 일부 JAR은 반드시 필요한 것은 아니지만 여전히 유용할 수 있습니다. Tomcat 번들을 사용하지 않는 경우 아래 설명된 대로 다운로드한 *OSGi 종속성* 아카이브와 타사 JAR 종속성을 사용합니다.

1. `[Liferay Home]/osgi` 폴더에 OSGi Dependencies ZIP 파일 내용의 압축을 풉니다(이 폴더가 없으면 생성). Liferay의 OSGi 런타임은 이러한 모듈에 의존합니다.
1. DXP 7.4+ WAR 파일에는 MariaDB 및 PostgreSQL용 드라이버가 포함되어 있습니다. 이전 WAR에는 해당 기능이 없습니다. 7.4+ WAR에 사용 중인 지원 데이터베이스용 드라이버가 없는 경우 데이터베이스 공급업체의 JDBC JAR 파일을 다운로드하여 `$CATALINA_BASE/webapps/ROOT/WEB-INF/shielded-container-lib` 폴더에 넣습니다. .

    지원되는 데이터베이스 목록은 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151) 을 참조하십시오.

```{note}
Hypersonic 데이터베이스는 DXP와 함께 번들로 제공되며 테스트 목적으로 유용합니다. 프로덕션 인스턴스에 HSQL을 사용하지 마세요.
```

```{note}
DXP 7.3 및 이전 버전의 경우 종속성 ZIP 파일을 `$TOMCAT_HOME/lib/ext` 폴더에 압축 해제합니다(존재하지 않는 경우 이 폴더 생성). 데이터베이스 벤더의 JDBC JAR 파일도 해당 폴더에 배치하십시오.
```

## 톰캣 구성

DXP를 실행하도록 Tomcat을 구성하는 작업에는 다음 작업이 포함됩니다.

* JVM 옵션 설정
* DXP용 웹 애플리케이션 컨텍스트 지정
* 속성 및 설명자 설정

1. `setenv.bat`, `setenv.sh`,  `startup.bat`, `startup.sh`, `shutdown.bat`및 `shutdown.sh` 파일을 DXP 번들에서 `$CATALINA_BASE/bin` 로 복사합니다. 폴더. 그렇지 않으면  `setenv.bat` 및 `setenv.sh` 스크립트를 작성하십시오.

1. `setenv.sh` 스크립트는 Tomcat의 서블릿 컨테이너인 Catalina에 대한 JVM 옵션을 설정합니다. 이러한 옵션 중에는 Java 런타임 환경의 위치가 있습니다. 서버에서 이 환경을 전역적으로 사용할 수 없는 경우 Tomcat이 실행될 수 있도록 `setenv.sh` 스크립트에서 해당 위치를 설정합니다. `JAVA_HOME` 환경 변수를 DXP 지원 JRE로 지정하여 이를 수행하십시오.

    ```bash
    export JAVA_HOME=/usr/lib/jvm/java-8-jdk
    export PATH=$JAVA_HOME/bin:$PATH
    ```

1. 그런 다음 DXP를 지원하도록 Catalina의 JVM 옵션을 구성합니다.

    ```bash
    CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Dlog4j2.formatMsgNoLookups=true -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
    ```

**JVM 옵션 설명**

| 옵션                                        | 설명                                                                                                     |
|:----------------------------------------- |:------------------------------------------------------------------------------------------------------ |
| `-Dfile.encoding=UTF-8`                   | DXP에는 UTF-8 파일 인코딩이 필요합니다.                                                                             |
| `-Djava.locale.providers=JRE,COMPAT,CLDR` | 이것은 JDK 11에서 4자리 날짜를 표시하는 데 필요합니다.                                                                     |
| `-Djava.net.preferIPv4Stack=true`         | IPv6보다 IPv4 스택을 선호합니다.                                                                                 |
| `-Dlog4j2.formatMsgNoLookups=true`        | RCE(원격 코드 실행) 취약성을 해결합니다. 자세한 내용은 [LPS-143663](https://issues.liferay.com/browse/LPS-143663) 을 참조하십시오. |
| `-Duser.timezone=GMT`                     | DXP는 GMT 시간대를 사용하기 위해 애플리케이션 서버 JVM이 필요합니다.                                                            |

**메모리 인수 설명**

| 메모리 인수              | 설명                                                                       |
|:------------------- |:------------------------------------------------------------------------ |
| `-Xms`              | 힙의 초기 공간.                                                                |
| `-Xmx`              | 힙의 최대 공간입니다.                                                             |
| `-XX:NewSize`       | 초기 새 공간. 새 크기를 전체 힙의 절반으로 설정하면 일반적으로 더 작은 새 크기를 사용하는 것보다 더 나은 성능을 제공합니다. |
| `-XX:MaxNewSize`    | 최대 새 공간.                                                                 |
| `-XX:SurvivorRatio` | 서바이벌 공간에 대한 새 공간의 비율입니다. 생존자 공간은 구세대 공간으로 승격되기 전에 젊은 세대 개체를 보유합니다.       |

```{note}
DXP를 설치한 후 성능 향상을 위해 이러한 구성(이러한 JVM 옵션 포함)을 추가로 조정할 수 있습니다. [Tuning Liferay](../../setting-up-liferay/tuning-liferay.md) 및 [JVM 조정](../../setting-up-liferay/tuning-your-jvm. md) 자세한 내용은
```

Tomcat 구성을 계속하십시오.

1. Liferay-Tomcat 번들이 있는 경우 `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` 파일을 애플리케이션 서버의 해당 위치에 복사합니다. 파일 경로가 없으면 생성하고 `ROOT.xml` 파일을 생성합니다.

    `ROOT.xml` 파일은 DXP에 대한 웹 애플리케이션 컨텍스트를 지정합니다. 예를 들어,

    ```xml
    <Context crossContext="true">
        <JarScanner className="com.liferay.support.tomcat.util.scan.NOPJarScanner" />

        <!-- JAAS -->

        <!--<Realm
            className="org.apache.catalina.realm.JAASRealm"
            appName="PortalRealm"
            userClassNames="com.liferay.portal.kernel.security.jaas.PortalPrincipal"
            roleClassNames="com.liferay.portal.kernel.security.jaas.PortalRole"
        />-->
    </Context>
    ```

     `crossContext="true"` 로 설정하면 여러 웹 애플리케이션이 동일한 클래스 로더를 사용할 수 있습니다. 이 구성에는 JAAS 영역을 구성하기 위한 주석 처리된 지침 및 태그가 포함됩니다.

```{important}
XML 파일 이름을 변경하여 기본 Liferay Portal 웹 컨텍스트를 변경할 수 있지만(예: `localhost:8080/`에서 `localhost:8080/myportal`로) 이는 권장되지 않습니다.
```

2. UTF-8 URI 인코딩을 일관되게 사용해야 합니다. `$CATALINA_BASE/conf/server.xml` 파일을 Tomcat 번들에서 서버로 복사합니다. 그렇지 않으면 `$CATALINA_BASE/conf/server.xml` 파일을 열고 `redirectPort=8443`을 사용하는 HTTP 및 AJP 커넥터에 `URIEncoding="UTF-8"` 속성을 추가하십시오. 다음은 예입니다.

    낡은:

    ```xml
    <Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />
    ```

    새로운:

    ```xml
    <Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" URIEncoding="UTF-8" />
    ```

    낡은:

    ```xml
    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />
    ```

    새로운:

    ```xml
    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" URIEncoding="UTF-8" />
    ```

3. `$CATALINA_BASE/conf/server.xml`에서 액세스 로그 `밸브` 요소를 주석 처리하여 액세스 로그 작성을 삼가십시오(선택 사항). 여기에 주석 처리되어 있습니다.

    ```xml
    <!-- <Valve className="org.apache.catalina.valves.AccessLogValve"
           directory="logs"
           prefix="localhost_access_log" suffix=".txt"
           pattern="%h %l %u %t &quot;%r&quot; %s %b" /> -->
    ```

4. 선택적으로 `$CATALINA_HOME/conf/logging.properties` 파일에서 다음 로그 수준을 설정합니다.

    ```properties
    org.apache.catalina.startup.Catalina.level=INFO
    org.apache.catalina.startup.ClassLoaderFactory.level=SEVERE
    org.apache.catalina.startup.VersionLoggerListener.level=WARNING
    org.apache.level=WARNING
    ```

5. DXP 7.3 및 이전 버전의 경우 `$CATALINA_HOME/conf/web.xml` 파일을 열고 JSP 컴파일러를 Java 8로 설정하고 DXP의 `TagHandlerPool` 클래스를 설정하여 `jsp` 서블릿 위에 다음 요소를 추가하여 JSP 태그 풀을 관리합니다. 요소의 `<load-on-startup>` 요소.

    ```xml
    <init-param>
        <param-name>compilerSourceVM</param-name>
        <param-value>1.8</param-value>
    </init-param>
    <init-param>
        <param-name>compilerTargetVM</param-name>
        <param-value>1.8</param-value>
    </init-param>
    <init-param>
        <param-name>tagpoolClassName</param-name>
        <param-value>com.liferay.support.tomcat.jasper.runtime.TagHandlerPool</param-value>
    </init-param>
    ```

6. `$CATALINA_HOME/conf/web.xml`에서 애플리케이션 서버가 애플리케이션의 JAR 및 클래스에 있는 주석과 같은 추가 메타데이터를 찾아야 하는지 여부를 지정합니다. web-app</code> 요소의 속성 `를 <code>으로 설정하면 metadata-complete="true"` 으로 애플리케이션 서버에 추가 메타데이터가 없음을 알립니다. 애플리케이션 서버는 이 설정으로 더 빠르게 시작됩니다. 기본값은 추가 메타데이터를 확인하는 것입니다.

7. Unix, Linux 또는 Mac OS를 사용하는 경우 각 폴더에서 다음 명령을 실행하여 `$CATALINA_HOME/bin` 및 `$CATALINA_BASE/bin` 폴더의 셸 스크립트를 실행 가능하게 만듭니다.

    ```bash
    chmod a+x *.sh
    ```

Liferay의 Tomcat 지원 JAR은 DXP 웹 애플리케이션의 일부입니다. DXP는 JAR의 파일 스캐너를 사용합니다. JAR은 DXP가 사용하려면 공통 클래스 로더에 있어야 합니다. `$CATALINA_BASE/conf/catalina.properties` 파일을 열고 이 값을 `common.loader` 속성의 쉼표로 구분된 값 목록의 시작 부분에 추가하여 파일에 대한 Catalina 액세스를 제공합니다.

```properties
"${catalina.home}/webapps/ROOT/WEB-INF/lib/support-tomcat.jar",
```

DXP 7.3 및 이전 버전의 경우 다음 값을 `common.loader` 속성의 값 목록 시작 부분에 추가하여 `$CATALINA_BASE/lib/ext` 의 JAR에 대한 Catalina 액세스를 제공합니다.

```
"${catalina.home}/lib/ext","${catalina.home}/lib/ext/*.jar",
```

**검문소:**

1. 파일 인코딩, 사용자 시간대 및 기본 프로토콜 스택은 `setenv.sh` 스크립트에서 설정됩니다.
1. 사용 가능한 기본 메모리 및 메타스페이스 제한이 설정됩니다.
1. `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` 웹 애플리케이션 컨텍스트를 선언합니다.
1. `$CATALINA_BASE/conf/server.xml` UTF-8 인코딩을 설정합니다.
1. `$CATALINA_BASE/conf/server.xml` 는 호스트 액세스 로그를 쓰기 위한 값을 선언하지 않습니다. *(선택사항)*
1. `$CATALINA_HOME/conf/logging.properties` 원하는 로그 수준을 설정합니다.
1. `$CATALINA_HOME/conf/web.xml` 태그 핸들러 풀을 설정하고 Java 8을 JSP 컴파일러로 설정합니다.
1. `$CATALINA_HOME/conf/web.xml` 는 애플리케이션 서버가 추가 메타데이터를 찾지 않도록 지정합니다. *(선택사항)*
1. Tomcat의 `bin` 폴더에 있는 스크립트는 실행 가능합니다.
1. `$CATALINA_BASE/conf/catalina.properties`의 `common.loader` 속성은 필수 JAR에 대한 Catalina 액세스 권한을 부여합니다.

애플리케이션 서버는 DXP를 실행하도록 구성됩니다.

## 데이터베이스 구성

DXP에는 시연용으로 좋은 Hypersonic 데이터베이스가 내장되어 있지만 생산 **에서는 사용**안 됩니다. 프로덕션의 경우 완전한 기능을 갖춘 지원되는 RDBMS를 사용하십시오. 데이터베이스를 설정하려면 [데이터베이스 구성](../configuring-a-database.md) 을 참조하십시오.

Liferay DXP는 DXP의 내장 데이터 소스(권장)를 사용하거나 앱 서버에서 생성한 데이터 소스를 사용하여 데이터베이스에 연결할 수 있습니다.

[설정 마법사](../running-liferay-for-the-first-time.md)를 사용하여 DXP를 처음 실행할 때 데이터베이스로 DXP의 내장 데이터 소스를 구성할 수 있습니다. 또는 데이터베이스의 [데이터베이스 템플리트](../../reference/database-templates.md) 를 기반으로 [`Portal-ext.properties` 파일](../../reference/portal-properties.md) 에서 데이터 소스를 구성할 수 있습니다.

그렇지 않으면 Tomcat에서 데이터 소스를 구성할 수 있습니다.

### Tomcat 데이터 소스 구성

1. 데이터베이스 서버가 설치되어 있고 작동하는지 확인하십시오. 다른 시스템에 설치된 경우 DXP 시스템이 액세스할 수 있는지 확인하십시오.

1. DXP WAR(7.4+) 또는 데이터베이스 공급업체에서 JDBC JAR을 가져와 `$TOMCAT_HOME/lib/ext` 폴더에 복사합니다.

1. `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` 를 열고 웹 애플리케이션 `컨텍스트`에서 데이터 소스를 `리소스` 로 추가합니다.

    ```xml
    <Context...>
        ...
        <Resource
            name="jdbc/LiferayPool"
            auth="Container"
            factory="com.zaxxer.hikari.HikariJNDIFactory"
            type="javax.sql.DataSource"
            minimumIdle="10"
            maxLifetime="0"
            maximumPoolSize="85"
            driverClassName="com.mysql.jdbc.Driver"
            dataSource.user="[place your user name here]"
            dataSource.password="[place your password here]"
            jdbcUrl="jdbc:mysql://localhost/lportal?characterEncoding=UTF8&amp;dontTrackOpenResources=true&amp;holdResultsOpenOverStatementClose=true&amp;useFastDateParsing=false&amp;useUnicode=true"
        />
    </Context>
    ```

    데이터베이스 URL, 사용자 이름 및 암호를 적절한 값으로 바꾸십시오. Liferay는 기본적으로 데이터베이스 연결 풀에 [Hikari CP](https://liferay.dev/blogs/-/blogs/tomcat-hikaricp) 을 사용합니다.

1. **[Liferay_Home]**의 `portal-ext.properties` 파일에서 데이터 소스를 지정하십시오. 예를 들어,

    ```properties
    jdbc.default.jndi.name=jdbc/LiferayPool
    ```

데이터 소스가 구성되었습니다.

JNDI 연결을 사용하는 경우 [Tomcat에서 JNDI 설정을 참조하십시오.](./setting-up-jndi-on-tomcat.md)

## 메일 구성

메일을 구성하는 가장 쉬운 방법은 DXP [내장 메일 세션](../../setting-up-liferay/configuring-mail.md)을 사용하는 것입니다. 기본 제공 메일 세션을 사용하는 경우 이 섹션을 건너뛸 수 있습니다.

Tomcat을 사용하여 메일 세션을 관리하려면 다음 단계를 따르십시오.

1. `$CATALINA_BASE/conf/Catalina/localhost/ROOT.xml` 을 열고 웹 애플리케이션 `컨텍스트`에서 메일 세션을 `리소스` 로 정의합니다. 예제 메일 세션 값을 자신의 값으로 바꿉니다.

    ```xml
    <Context...>
        ...
        <Resource
            name="mail/MailSession"
            auth="Container"
            type="javax.mail.Session"
            mail.pop3.host="[place POP mail host here]"
            mail.pop3.port="110"
            mail.smtp.host="[place SMTP mail host here]"
            mail.smtp.port="465"
            mail.smtp.user="[place user name here]"
            mail.smtp.password="[place password here]"
            mail.smtp.auth="true"
            mail.smtp.starttls.enable="true"
            mail.smtp.socketFactory.class="javax.net.ssl.SSLSocketFactory"
            mail.imap.host="[place IMAP mail host here]"
            mail.imap.port="993"
            mail.transport.protocol="smtp"
            mail.store.protocol="imap"
        />
    </Context>
    ```

1. Liferay Home의 `portal-ext.properties` 파일에서 메일 세션을 지정합니다. 예를 들어,

    ```properties
    mail.session.jndi.name=mail/MailSession
    ```

메일 세션은 Tomcat에서 구성됩니다.

## DXP 배포

`$CATALINA_HOME/bin` 로 이동하고 `./startup.sh`를 실행하여 Tomcat을 시작합니다. 또는 `./catalina.sh run` 을 실행하여 DXP의 로그 파일을 추적합니다. 로그는 시작 활동을 감사하고 배포 디버깅에 유용합니다.

Liferay DXP Enterprise 구독이 있는 경우 DXP는 활성화 키를 요청합니다. 자세한 내용은 [Liferay DXP](../../setting-up-liferay/activating-liferay-dxp.md) 활성화를 참조하십시오.

축하합니다! Tomcat에서 DXP를 실행하고 있습니다.

## 다음 단계

관리자 사용자로 [로그인하고](../../../getting-started/introduction-to-the-admin-account.md) 에서 솔루션 구축을 시작할 수 있습니다. 또는 [개의 추가 Liferay DXP 설정](../../setting-up-liferay.md) 항목을 탐색할 수 있습니다.

* [마켓플레이스 플러그인 설치](../../../system-administration/installing-and-managing-apps/getting-started/using-marketplace.md#appendix-installing-the-marketplace-plugin)
* [평가판 기간 동안 플러그인 액세스](../../../system-administration/installing-and-managing-apps/installing-apps/accessing-ee-plugins-during-a-trial-period.md)
* [검색 엔진 설치](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)
* [Liferay DXP 보안](../../securing-liferay.md)
* [고가용성을 위한 클러스터링](../../setting-up-liferay/clustering-for-high-availability.md)