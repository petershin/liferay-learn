# 웹스피어에 설치하기

WebSphere에 Liferay DXP를 설치하려면 DXP WAR 설치, 종속성 설치, WebSphere 구성 및 DXP 시작이 필요합니다. 데이터베이스 및 메일 서버 연결도 구성해야 합니다.

> IBM&reg; WebSphere&reg; 전 세계 여러 관할 지역에 등록된 International Business Machines Corporation의 상표입니다.

```{tip}
이 설치 및 구성 프로세스 전체에서 WebSphere는 마스터 구성에 변경 사항을 적용하려면 *저장*을 클릭하라는 메시지를 표시합니다. 변경 사항을 저장하려면 이렇게 해야 합니다.
```

## 전제 조건

Liferay DXP가 제대로 작동하려면 WebSphere 9(Fix Pack 11 이상)를 설치해야 합니다. 이 수정팩에 대한 자세한 정보를 보려면 [IBM 지원 센터](http://www-01.ibm.com/support/docview.wss?uid=swg24043005) 로 이동하십시오. Liferay DXP는 현재 WebSphere Application Liberty Profile을 지원하지 않습니다.

```{important}
DXP를 설치하기 전에 [Liferay-Tomcat 번들 설치](../installing-a-liferay-tomcat-bundle.md) 및 [데이터베이스 구성](../configuring-a-database.md) 기사를 검토하십시오. .
```

다음 파일은 WebSphere 응용 프로그램 서버에 Liferay DXP를 설치하는 데 필요하며 [도움말 센터](https://customer.liferay.com/downloads) (구독) 또는 [Liferay 커뮤니티 다운로드](https://www.liferay.com/downloads-community)에서 사용할 수 있습니다.

* DXP 전쟁 파일
* OSGi 종속성 ZIP 파일
* 종속성 ZIP 파일(DXP 7.3 이하)

Liferay DXP에는 Java JDK 8 또는 11이 필요합니다. JDK를 선택하려면 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151) 참조하십시오. 권장 설정은 [JVM 구성](../../reference/jvm-configuration.md) 참조하십시오.

[`[Liferay Home]`](../../reference/liferay-home.md) 폴더는 Liferay DXP가 작동하는 데 필요한 파일과 폴더를 저장하고 관리하는 곳입니다. WebSphere에서 `[Liferay Home]` 폴더는 일반적으로 `[Install Location]/WebSphere/AppServer/profiles/[your-profile]/liferay`입니다.

## 웹스피어 구성

### 웹스피어 프로필 생성

응용 프로그램 서버 바이너리가 설치되면 *프로필 관리 도구* 시작하여 DXP에 적합한 프로필을 만듭니다.

1. *생성...*클릭하고 *응용 프로그램 서버*선택한 다음 *다음*클릭합니다.
1. *고급* 프로필 생성 옵션을 클릭한 후 *다음*클릭합니다. 고급 프로필을 사용하여 프로필의 위치와 프로필, 노드 및 호스트의 이름과 같은 설정 값을 지정하고 특정 포트를 할당하거나 선택적으로 관리 콘솔 및 샘플 애플리케이션을 배포할지 여부를 선택하고 웹을 추가할지 여부를 선택합니다. IBM HTTP Server에 대한 서버 정의. 이러한 옵션에 대한 자세한 내용은 WebSphere 설명서를 참조하십시오.

    ![그림 1: 고유한 설정을 지정하려면 고급 프로필 옵션을 선택합니다.](./installing-on-websphere/images/01.png)

1. *관리 콘솔 배치*상자를 선택하십시오. 이를 통해 애플리케이션 서버 작업을 위한 웹 기반 UI를 사용할 수 있습니다. 기본 응용 프로그램을 건너뜁니다. (개발 머신에만 설치하십시오.) *다음*클릭합니다.
1. 프로필 이름과 위치를 설정합니다. 환경에 적합한 성능 조정 설정을 지정하십시오.

   ```{note}
   성능 조정 설정에 대한 자세한 내용은 WebSphere 설명서를 참조하십시오. *다음*을 클릭합니다.
   ```

1. 서버의 노드, 서버 및 호스트 이름을 선택하십시오. 이는 사용자 환경에 따라 다릅니다. *다음*클릭합니다.
1. WebSphere의 관리 보안은 관리 도구에 액세스할 수 있는 사람을 제한하는 방법입니다. WebSphere 서버를 관리하는 데 사용자 이름과 암호가 필요하도록 환경에서 활성화할 수 있습니다. 자세한 정보는 WebSphere 문서를 참조하십시오. *다음*클릭합니다.
1. 각 프로필에는 보안 인증서가 필요하며 마법사에서 다음에 제공됩니다. 인증서가 아직 생성되지 않은 경우 개인 인증서 및 서명 인증서 생성 옵션을 선택하고 *다음*클릭합니다.
1. 인증서가 생성되면 키 저장소의 비밀번호를 설정하십시오. *다음*클릭합니다.
1. 이 서버 프로파일이 사용하는 포트를 사용자 정의할 수 있습니다. 시스템에서 열려 있는 포트를 선택해야 합니다. 포트를 선택할 때 마법사는 자동으로 기존 WebSphere 설치를 감지하고 활동을 찾으면 포트를 하나씩 증가시킵니다.
1. 시스템이 시작될 때 이 프로파일을 시작할지 여부를 선택하십시오. *다음*클릭합니다.
1. WebSphere는 IBM HTTP Server와 함께 제공됩니다. 이 JVM이 HTTP 서버에서 전달된 요청을 수신하도록 웹 서버 정의를 원하는지 여부를 선택하십시오. 이에 대한 자세한 내용은 WebSphere 설명서를 참조하십시오. 완료되면 *다음*클릭합니다.
1. 그런 다음 마법사는 선택한 항목에 대한 요약을 표시하여 선택 사항을 유지하거나 돌아가서 무언가를 변경할 수 있습니다. 완료되면 *다음*클릭합니다.

그런 다음 WebSphere는 프로필을 만들고 프로필이 성공적으로 만들어졌다는 메시지와 함께 완료됩니다.

![그림 2: 프로필을 만들기 전 설정의 예.](./installing-on-websphere/images/02.png)

마지막으로 애플리케이션 서버를 종료합니다.

### WebSphere 애플리케이션 서버 구성

```{warning}
애플리케이션 서버가 실행되는 동안에는 구성을 변경하지 마십시오.
```

이 버전의 WebSphere에서 서블릿 필터는 웹 애플리케이션 시작 시 초기화되지 않고 첫 번째 액세스 시 초기화됩니다. 이로 인해 특정 앱을 DXP에 배포할 때 문제가 발생할 수 있습니다. 애플리케이션 시작(예: 배포) 시 초기화하도록 서블릿 필터를 구성하려면 WebSphere 애플리케이션 서버에서 다음 `webcontainer` 속성을 설정합니다.

```properties
com.ibm.ws.webcontainer.initFilterBeforeInitServlet = true
com.ibm.ws.webcontainer.invokeFilterInitAtStartup = true
```

WebSphere 애플리케이션 서버에서 `webcontainer` 특성을 설정하려면 WebSphere의 [문서](http://www-01.ibm.com/support/docview.wss?rss=180&uid=swg21284395)에 있는 지시사항을 따르십시오.

### Liferay DXP용 JVM 매개변수 설정

이 파일을 수정하는 것부터 시작하십시오.

```
[Install Location]/WebSphere/AppServer/profiles/your-profile/config/cells/your-cell/nodes/your-node/servers/your-server/server.xml
```

기준선으로 `jvmEntries` 태그 안에 `maximumHeapSize="2560"` 추가합니다. 예를 들어:

```xml
<jvmEntries xmi:id="JavaVirtualMachine_1183122130078" ... maximumHeapSize="2560">
```

```{note}
DXP를 설치한 후 성능 향상을 위해 이러한 구성(이러한 JVM 옵션 포함)을 추가로 조정할 수 있습니다. [Tuning Liferay](../../setting-up-liferay/tuning-liferay.md) 및 [JVM 조정](../../setting-up-liferay/tuning-your-jvm. md) 자세한 내용은
```

`server.xml`의 `<jvmEntries genericJvmArguments=.../>` 속성에서 UTF-8 속성을 설정할 수 있습니다. 그렇지 않으면 국제 문자가 올바르게 구문 분석되지 않습니다. 최대 및 최소 힙 크기도 늘리십시오. `jvmEntries` 태그 안에 다음을 추가합니다.

```xml
<jvmEntries xmi:id="JavaVirtualMachine_1183122130078" ...genericJvmArguments="-Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Dlog4j2.formatMsgNoLookups=true -Duser.timezone=GMT -Xms6144m -Xmx6144m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7">
```

```{important}
DXP가 제대로 작동하려면 애플리케이션 서버 JVM이 `GMT` 표준 시간대와 `UTF-8` 파일 인코딩을 사용해야 합니다.
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

### `secureSessionCookie` 태그 제거

동일한 프로필에서 DXP 시작 오류를 일으킬 수 있는 문제가 있는 `secureSessionCookie` 태그를 삭제합니다. 이는 기본 설정일 뿐입니다. DXP가 설치되면 용도에 따라 적절하게 WebSphere를 조정하십시오.

`[Install Location]/WebSphere/AppServer/profiles/your-profile/config/cells/your-cell/cell.xml`에서 `xmi:id="SecureSessionCookie_1"`가 포함된 `secureSessionCookie` 태그를 삭제합니다.

이 태그를 제거하지 않으면 다음과 유사한 오류가 발생할 수 있습니다.

```
WSVR0501E: Error creating component com.ibm.ws.runtime.component.CompositionUnitMgrImpl@d74fa901
com.ibm.ws.exception.RuntimeWarning: com.ibm.ws.webcontainer.exception.WebAppNotLoadedException: Failed to load webapp: Failed to load webapp: SRVE8111E: The application, LiferayEAR, is trying to modify a cookie which matches a pattern in the restricted programmatic session cookies list [domain=*, name=JSESSIONID, path=/].
```

### 구성 체크포인트

이 시점에서 다음 단계를 완료해야 합니다.

1. WebSphere Application Server 프로파일이 작성되었습니다.
1. `webcontainer` 설정에서 애플리케이션 시작 시 서블릿 필터가 초기화되도록 구성되었습니다.
1. JVM 매개변수는 `server.xml` 파일에 설정되었습니다.
1. UTF-8이 파일 인코딩으로 설정되었습니다.
1. 서버의 시간대는 GMT로 설정됩니다.
1. `secureSessionCookie` 태그가 제거되었습니다.

## 종속성 설치

1. OSGi Dependencies ZIP 파일의 압축을 풀고 내용물을 `[Liferay Home]/osgi` 폴더에 넣습니다(아직 없는 경우 이 폴더를 만듭니다). Liferay의 OSGi 런타임은 이러한 모듈에 의존합니다.
1. DXP 7.4+ WAR 파일에는 MariaDB 및 PostgreSQL용 드라이버가 포함되어 있습니다. 이전 DXP WAR에는 해당 기능이 없습니다. 7.4+ WAR에 사용 중인 지원 데이터베이스용 드라이버가 없는 경우 DXP WAR을 임의의 위치에 압축 해제하고 데이터베이스 공급업체의 JDBC JAR 파일을 분해된 DXP WAR의 `WEB-INF/shielded-container- lib` 폴더에 넣고 DXP WAR을 다시 압축합니다.

    지원되는 데이터베이스 목록은 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151) 참조하십시오.

```{note}
Hypersonic 데이터베이스는 DXP와 함께 번들로 제공되며 테스트 목적으로 유용합니다. 프로덕션 인스턴스에 HSQL을 사용하지 마세요.
```

```{note}
DXP 7.3 및 이전 버전의 경우 종속성 ZIP 파일의 압축을 풀고 해당 콘텐츠를 WebSphere 애플리케이션 서버의 `[설치 위치]/WebSphere/AppServer/lib/ext` 폴더에 넣습니다. 데이터베이스 벤더의 JDBC JAR 파일도 해당 폴더에 배치하십시오.
```

## Elasticsearch 설치

Liferay를 시작하면 기본 [사이드카](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md) Elasticsearch 서버가 설치되고 시작됩니다. WebSphere에 설치할 때 처음부터 원격 Elasticsearch 서버를 설정해야 합니다. [Elasticsearch 시작하기](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md)참조하십시오.

Liferay DXP가 구성되고(Elasticsearch 커넥터에 `.config` 파일 사용) Elasticsearch가 이미 구성되어 실행 중인 상태에서 시작하면 Elasticsearch에 대한 연결이 활성화됩니다.

### DXP portlet.jar 설치

DXP의 `portlet.jar` (버전 3)은 버전 2.0과 역호환됩니다. DXP 7.4 `.war` `portlet.jar` 포함되어 있으며 이전 DXP 버전의 종속성 ZIP에도 포함되어 있습니다. WebSphere의 `portlet.jar` 버전 2.0을 재정의해야 합니다.

1. `[설치 위치]/WebSphere/AppServer/profiles/your-profile/` 폴더에서 `app_shared_libraries`이라는 폴더를 만듭니다.

1. DXP WAR(7.4+) 또는 `[Install Location]/WebSphere/AppServer/lib/ext` 폴더에서 생성한 `app_shared_libraries` 폴더로 DXP `portlet.jar` 을 복사합니다.

1. [서버 관련 공유 라이브러리 사용](https://www.ibm.com/support/pages/best-practice-using-common-application-files#usingserver)에 대한 IBM의 단계를 따릅니다. 4d단계에서 *로컬 클래스 로더로 로드된 클래스 먼저(parent_Last)*를 선택해야 합니다.

1. 구성을 저장합니다.

### DXP Portlet.jar이 먼저 로드되었는지 확인

DXP의 `portlet.jar` 서버 관련 공유 라이브러리에 배치하는 것 외에도 `config.ini` 파일이 먼저 로드되도록 구성합니다.

1. `[설치 위치]/WebSphere/AppServer/configuration/config.ini` 파일을 엽니다.
1. 특성 `com.ibm.CORBA,com.ibm`을 찾으십시오.
1. 속성 `javax.portlet,javax.portlet.filter,javax.portlet.annotations` 뒤 `com.ibm.CORBA` 및 앞 `com.ibm`삽입하십시오.
1. 파일을 저장합니다.

### 종속성 체크포인트

1. DXP 종속성이 설치되었습니다.
1. DXP의 `portlet.jar` 설치되었습니다.
1. `config.ini` 파일이 구성되었습니다.

애플리케이션 서버 프로파일을 시작하십시오.

## 데이터베이스 구성

DXP에는 시연용으로 적합하지만 생산에 사용해서는 안 되는 Hypersonic 데이터베이스가 내장되어 있습니다. 데모 목적 외에도 모든 기능을 갖춘 지원되는 RDBMS를 사용하는 것이 좋습니다. 데이터베이스를 설정하려면 [데이터베이스 구성](../configuring-a-database.md) 참조하십시오.

Liferay DXP는 DXP의 내장 데이터 소스(권장)를 사용하거나 앱 서버에서 생성한 데이터 소스를 사용하여 데이터베이스에 연결할 수 있습니다.

DXP를 처음 실행할 때 데이터베이스로 DXP의 내장 데이터 소스를 구성하려면 [설정 마법사](../running-liferay-for-the-first-time.md)사용하십시오. 또는 데이터베이스의 데이터베이스 템플릿 [](../../reference/database-templates.md) 기반으로 [`Portal-ext.properties` 파일](../../reference/portal-properties.md) 에서 데이터 소스를 구성할 수 있습니다.

WebSphere를 사용하여 데이터베이스 연결을 관리하는 경우 아래 지침을 따르십시오. 그렇지 않으면 DXP의 내장 데이터 소스를 사용하려는 경우 이 섹션을 건너뛰십시오.

```{warning}
Liferay는 데모 목적으로 기본적으로 HSQL을 사용합니다. Liferay DXP의 프로덕션 인스턴스에서 HSQL을 사용해서는 *안* 됩니다.
```

![그림 3: WebSphere JDBC 공급자](./installing-on-websphere/images/03.png)

1. DXP WAR(7.4+) 또는 데이터베이스 공급업체에서 JDBC JAR을 가져와 `[Install Location]/WebSphere/AppServer/lib/ext` 폴더에 복사합니다.
1. 웹스피어를 시작하십시오.
1. 관리 콘솔을 열고 로그인합니다.
1. *자원 &rarr; JDBC 제공자*클릭하십시오.
1. 범위를 선택한 다음 *New*클릭합니다.
1. 데이터베이스 유형, 제공자 유형 및 구현 유형을 선택하십시오. 미리 정의된 데이터베이스를 선택하면 마법사가 이름 및 설명 필드를 자동으로 채웁니다. 원하는 데이터베이스가 나열되지 않으면 *데이터베이스 유형* 필드에서 *사용자 정의* 선택한 다음 *구현 클래스 이름*를 입력하십시오. 예를 들어 MySQL을 사용하는 경우 *데이터베이스 유형* &rarr; *사용자 정의*선택한 다음 `com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource` in *구현 클래스 이름*을 입력합니다. *다음*클릭합니다.
1. 클래스 경로 설정에서 모든 텍스트를 지웁니다. 필요한 JAR은 이미 서버의 클래스 경로 위치에 복사되었습니다. *다음*클릭합니다.
1. 설정을 검토하고 *마침*클릭합니다. 최종 구성은 다음과 같아야 합니다.
   
   ![그림 4: 완료된 JDBC 제공자 구성.](./installing-on-websphere/images/04.png)

1. 새 공급자 구성이 테이블에 나타나면 클릭합니다.

1. *추가 특성*아래에서 *데이터 소스* 클릭하십시오.
1. *신규*클릭합니다.
1. *Data source name* 필드에 `liferaydatabasesource` 입력하고 *JNDI name* 필드에 `jdbc/LiferayPool` 입력합니다. *다음*클릭합니다.
1. 마법사의 나머지 화면에서 *다음* 클릭하여 기본값을 적용합니다. 그런 다음 모든 변경 사항을 검토하고 *마침*클릭합니다.
1. 데이터 소스가 테이블에 나타나면 클릭한 다음 *사용자 정의 속성*클릭합니다.
1. *필터 기능* 표시 버튼을 클릭합니다. 이것은 *New* 및 *Delete* 버튼 아래에 있는 작은 아이콘 중 마지막에서 두 번째입니다.
1. 검색어에 *사용자* 입력하고 *이동*클릭합니다.
   
   ![그림 5: WebSphere에서 데이터 소스 속성 수정](././installing-on-websphere/images/05.png)

1. *user* 속성을 선택하고 데이터베이스에 대한 사용자 이름 값을 지정합니다.

1. *확인* 클릭하고 마스터 구성에 저장합니다.
1. *url* 속성에 대해 다른 필터 검색을 수행합니다. 이 속성에 데이터베이스를 가리키는 값을 지정합니다. 예를 들어 MySQL URL은 다음과 같습니다. 

   ```properties
   jdbc:mysql://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
   ```

   ```{tip}
   더 많은 예제 URL은 [데이터베이스 템플릿](../../reference/database-templates.md)의 `jdbc.default.url` 값을 참조하세요.
   ```

*확인* 클릭하고 마스터 구성에 저장합니다.

1. *암호* 속성에 대해 다른 필터 검색을 수행합니다. 이 특성의 값으로 이전에 추가한 사용자 ID의 비밀번호를 입력하십시오. *확인* 클릭하고 마스터 구성에 저장합니다.
1. 이동 경로 추적에서 데이터 소스 페이지를 클릭하여 데이터 소스 페이지로 돌아갑니다. *테스트 연결* 버튼을 사용하여 이 시점까지 구성을 확인합니다.
1. **[Liferay_Home]**의 `portal-ext.properties` 파일에서 데이터 소스를 지정하십시오. 예를 들어, 

    ```properties
    jdbc.default.jndi.name=jdbc/LiferayPool
    ```

## 메일 구성

DXP의 내장 메일 세션을 사용하는 경우 이 섹션을 건너뜁니다. DXP의 내장 메일 세션을 사용하는 방법에 대해서는 [메일 구성](../../setting-up-liferay/configuring-mail.md) 기사를 참조하십시오.

WebSphere를 사용하여 메일 세션을 관리하려면 다음 단계를 따르십시오.

### WebSphere 관리 메일 세션 생성

1. *자원 &rarr; 메일 &rarr; 메일 제공자*클릭하십시오.
1. 노드 및 서버에 대한 기본 제공 메일 공급자를 클릭합니다.
1. *메일 세션* 을 클릭한 다음 *신규* 버튼을 클릭합니다.
1. 메일 세션에 `liferaymail` 이라는 이름과 `mail/MailSession`이라는 JNDI 이름을 지정합니다. *보내는 메일 속성* 및 *받는 메일 속성*섹션에 메일 서버에 대한 올바른 정보를 입력합니다. *확인* 클릭한 다음 마스터 구성에 저장합니다.
1. 테이블에 나타나는 메일 세션을 클릭하고 *추가 속성* 섹션에서 *사용자 지정 속성* 선택합니다. 프로토콜, 포트, SSL 사용 여부 등과 같이 메일 서버에 필요한 다른 모든 JavaMail 속성을 설정합니다.
1. *보안 &rarr; 글로벌 보안* 클릭하고 *Java 2 보안을 사용하여 로컬 자원에 대한 애플리케이션 액세스 제한을 선택 취소하십시오* 선택되어 있는 경우.
   
   ![그림 6: 메일 세션에서 Java 보안 적용](./installing-on-websphere/images/06.png)

1. *적용*클릭합니다.

1. Liferay Home의 `portal-ext.properties` 파일에서 메일 세션을 지정합니다. 예를 들어, 
   

    ```properties
    mail.session.jndi.name=mail/MailSession
    ```

메일 서버에서 SSL 인증서를 검색하여 WebSphere의 신뢰 저장소에 추가해야 할 수도 있습니다. 이에 대한 지시사항은 WebSphere 문서를 참조하십시오.

### WebSphere 메일 공급자 확인

메일 세션이 올바르게 구성되었는지 확인하기 위해 WAR이 배포되고 서버가 시작되고 사용자가 시스템 관리자로 로그인한 후 이를 테스트하는 여러 가지 방법이 있습니다. 유효성을 검사하는 빠른 방법 중 하나는 유효한 이메일 계정으로 새 사용자를 생성하는 것입니다. 새로 생성된 사용자는 이메일 알림을 받아야 합니다. 로그에는 나열된 올바른 포트 번호로 SMTP 서버가 핑되었음을 표시해야 합니다.

## HTTP 세션에 대한 쿠키 활성화

WebSphere는 기본적으로 쿠키를 HTTPS 세션으로 제한합니다. HTTP를 사용하는 경우 사용자가 DXP에 로그인할 수 없으며 콘솔에 다음 오류가 표시됩니다.

```
20:07:14,021 WARN  [WebContainer : 1][SecurityPortletContainerWrapper:341]
User 0 is not allowed to access URL http://localhost:9081/web/guest/home and portlet com_liferay_login_web_portlet_LoginPortlet
```

이것은 DXP가 HTTP를 사용할 때 HTTPS 쿠키를 사용할 수 없기 때문에 발생합니다. 최종 결과는 페이지를 새로 고칠 때마다 새 세션이 생성된다는 것입니다. WebSphere에서 이 문제를 해결하려면 다음 단계를 따르십시오.

1. 클릭 *애플리케이션 서버* &rarr; *server1* &rarr; *세션 관리* &rarr; *쿠키 활성화*.
1. *쿠키를 HTTPS 세션으로 제한*선택 취소합니다.
1. *적용*클릭합니다.
1. *저장*클릭합니다.

## DXP 배포

1. WebSphere 관리 콘솔에서 *애플리케이션* &rarr; *새 애플리케이션* &rarr; *새 엔터프라이즈 애플리케이션*클릭하십시오.
1. DXP `.war` 파일을 찾아 선택하고 *다음*클릭합니다.
1. *빠른 경로* 선택한 상태로 두고 *다음*클릭합니다. *Distribute Application* 이 선택되었는지 확인하고 *Next* 다시 클릭합니다.
1. DXP가 배포될 WebSphere 런타임 및/또는 클러스터를 선택합니다. *다음*클릭합니다.
1. DXP를 배포할 가상 호스트를 선택하고 *다음*클릭합니다.
1. DXP *루트 컨텍스트(`)에 매핑하고`다음*클릭합니다.
1. 원하는 *metadata-complete 속성* 설정을 선택하고 *다음*클릭합니다.
1. 설정이 올바른지 확인하고 *마침*클릭합니다.
1. DXP가 설치되면 *마스터 구성에 저장*클릭합니다.
   
   ![그림 7: 배포하기 전에 배포 옵션을 검토합니다.](./installing-on-websphere/images/07.png)

DXP가 설치되었습니다. DXP를 시작하기 전에 몇 가지 필수 단계가 더 있습니다.

## JSP 컴파일을 위한 JDK 버전 설정

DXP에서는 JSP가 Java 8 바이트코드 형식으로 컴파일되어야 합니다. WebSphere가 이 작업을 수행하도록 하려면 DXP `.war` 파일을 배포한 후 WebSphere를 종료하십시오. `WEB_INF` 폴더로 이동하여 다음 설정을 `ibm-web-ext.xml` 또는 대부분의 경우 `ibm-web-ext.xmi` 파일에 추가하십시오.

```xml
<jsp-attribute name="jdkSourceLevel" value="18" />
```

`ibm-web-ext.xmi` 파일의 정확한 경로는 WebSphere 설치 위치 및 DXP 버전에 따라 다르지만 다음은 예입니다.

```bash
/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells/localhostNode01Cell/applications/liferayXX.ear/deployments/liferayXX/liferayXX.war/WEB-INF/ibm-web-ext.xmi
```

DXP `.war` `ibm-web-ext.xmi` 파일과 함께 사전 패키징되어 제공됩니다. 이 형식은 기능적으로 `.xml` 와 동일하며 WebSphere는 두 형식을 모두 인식합니다. WebSphere가 JSP를 컴파일하는 방법에 대한 일반적인 정보는 [WebSphere Application Server 9.0.0.x](https://www.ibm.com/support/knowledgecenter/en/SSEQTP_9.0.0/com.ibm.websphere.base.doc/ae/rweb_jspengine.html)에 대한 IBM의 공식 문서를 참조하십시오.

## DXP 시작하기

1. [설정 마법사](../running-liferay-for-the-first-time.md)를 사용하려면 다음 단계로 건너뜁니다. 그러나 WebSphere의 데이터 소스 및 메일 세션을 사용 중이고 설치 마법사를 건너뛰려면 `portal-ext.properties` 파일에서 이 포털 특성을 설정하십시오. 

    ```properties
    setup.wizard.enabled=false
    ```

1. 애플리케이션 서버를 시작하십시오.

1. WebSphere 관리 콘솔에서 *엔터프라이즈 애플리케이션*로 이동하여 DXP 애플리케이션을 선택하고 *시작*클릭하십시오. DXP가 시작되는 동안 WebSphere는 회전하는 그래픽을 표시합니다.
1. DXP의 설정 마법사에서 데이터베이스 유형을 선택하고 구성합니다. *마침*클릭합니다. 그런 다음 DXP는 데이터베이스에 필요한 테이블을 생성합니다.

DXP를 배포한 후 `PhaseOptimizer`과 관련된 아래와 같은 과도한 경고 및 로그 메시지가 있을 수 있습니다. 이들은 양성이며 무시할 수 있습니다. 과도한 무해한 로그 메시지를 방지하려면 앱 서버의 로깅 수준 또는 로그 필터를 조정해야 합니다.

```
|     May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
|     WARNING: Skipping pass gatherExternProperties
|     May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
|     WARNING: Skipping pass checkControlFlow
|     May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
|     INFO: pass supports: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, modules, exponent operator (**), async function, trailing comma in param list]
|     current AST contains: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, exponent operator (**), async function, trailing comma in param list, object literals with spread, object pattern rest]
```

Liferay DXP Enterprise 구독이 있는 경우 DXP는 활성화 키를 요청합니다. 자세한 내용은 [Liferay DXP](../../setting-up-liferay/activating-liferay-dxp.md) 활성화를 참조하십시오.

축하해요! WebSphere에서 Liferay DXP를 실행하고 있습니다.

## 다음 단계

관리자 사용자로 [로그인](../../../getting-started/introduction-to-the-admin-account.md) DXP에서 솔루션 구축을 시작할 수 있습니다. 또는 [추가 Liferay DXP 설정](../../setting-up-liferay.md) 항목을 탐색할 수 있습니다.

* [마켓플레이스 플러그인 설치](../../../system-administration/installing-and-managing-apps/using-marketplace.md#appendix-installing-the-marketplace-plugin)
* [평가판 기간 동안 플러그인 액세스](../../../system-administration/installing-and-managing-apps/installing-apps/accessing-ee-plugins-during-a-trial-period.md)
* [검색 엔진 설치](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)
* [Liferay DXP 보안](../../securing-liferay.md)
* [고가용성을 위한 클러스터링](../../setting-up-liferay/clustering-for-high-availability.md)
