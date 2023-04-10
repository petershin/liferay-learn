# WebLogic에 설치

WebLogic을 애플리케이션 서버로 사용하는 경우 DXP를 WebLogic 관리 서버에 설치하는 것이 **적극 권장** 됩니다. 관리 서버는 DXP를 빠르게 시작하고 중지할 수 있으며 클러스터 구성으로 변환할 수 있습니다. 여기에서 DXP를 관리 서버에 설치합니다.

## 전제 조건

[WebLogic 설명서](http://www.oracle.com/technetwork/middleware/weblogic/documentation/index.html) 에 따라 관리 서버 및 관리 서버를 구성합니다.

Liferay DXP에는 Java JDK 8 또는 11이 필요합니다. JDK를 선택하려면 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151) 참조하십시오. 권장 설정은 [JVM 구성](../../reference/jvm-configuration.md) 참조하십시오.

[도움말 센터](https://customer.liferay.com/downloads) (구독) 또는 [Liferay 커뮤니티 다운로드](https://www.liferay.com/downloads-community) 에서 이 파일을 다운로드하십시오.

* DXP 전쟁 파일
* OSGi 종속성 ZIP 파일
* 종속성 ZIP 파일(DXP 7.3 이하)

## DXP WAR 준비

1. 임의의 사이트에 DXP WAR 파일의 압축을 풉니다.

1. 확장된 WAR의 `WEB-INF/classes` 폴더에 [`Portal-ext.properties`](../../reference/portal-properties.md) 이라는 파일을 만듭니다.

1. `portal-ext.properties` 파일에서 `liferay.home` 속성을 [**Liferay Home**](../../reference/liferay-home.md) 폴더 경로로 설정합니다. WebLogic에서 [`[Liferay Home]`](../../reference/liferay-home.md) 은 일반적으로 도메인의 폴더로 설정되지만 모든 로컬 폴더를 사용할 수 있습니다. 예를 들어,

    ```properties
    liferay.home=/full/path/to/your/liferay/home/folder
    ```

1. DXP WAR 파일을 확장하고 `portal-ext.properties` 파일을 `WEB-INF/classes` 폴더에 복사하여 DXP WAR 파일에서 `portal-ext.properties` 패키징합니다.

1. 선택적으로 확장된 DXP WAR을 다시 WAR할 수 있습니다. DXP를 배포할 준비가 되면 확장된 아카이브 또는 WAR 파일로 배포할 수 있습니다. 두 경우 모두 DXP가 시작되면 속성 설정을 읽습니다.

```{note}
DXP 배포 후 `portal-ext.properties`를 업데이트해야 하는 경우 사용자 도메인의 `autodeploy/ROOT/WEB-INF/classes` 폴더에 있습니다. `autodeploy/ROOT` 폴더에는 DXP 배포가 포함되어 있습니다.
```

## 웹로직 구성

### WebLogic의 노드 관리자 구성

WebLogic의 Node Manager는 관리되는 서버를 시작하고 중지합니다.

Solaris 또는 Linux 이외의 UNIX 시스템에서 WebLogic을 실행 중인 경우 `domains/your_domain_name/nodemanager/nodemanager.properties에서 이러한 노드 관리자 속성을 구성하여 기본 버전의 노드 관리자 대신 Java 노드 관리자를 사용합니다. 파일` 개:

```properties
NativeVersionEnabled=false

StartScriptEnabled=true
```

```{note}
기본적으로 노드 관리자는 SSL을 사용합니다. 개발 중에 SSL을 비활성화하려면 `nodemanager.properties` 파일에서 `SecureListener=false`를 설정하십시오.
```

자세한 내용은 Oracle의 [Configuring Java Node Manager](https://docs.oracle.com/middleware/1212/wls/NODEM/java_nodemgr.htm#NODEM173) 설명서를 참조하십시오.

### WebLogic의 JVM 구성

`setUserOverridesLate` WebLogic 시작 스크립트 및 Managed Server UI에서 JVM 및 기타 옵션을 구성합니다.

1. `[Your Domain]/bin`에 `setUserOverridesLate.sh` 스크립트를 생성합니다.

1. 다음 설정을 추가합니다.

    ```bash
    export DERBY_FLAG="false"
    export JAVA_OPTIONS="${JAVA_OPTIONS} -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Dlog4j2.formatMsgNoLookups=true -Duser.timezone=GMT -da:org.apache.lucene... -da:org.aspectj..."
    export JAVA_PROPERTIES="-Dfile.encoding=UTF-8 ${JAVA_PROPERTIES} ${CLUSTER_PROPERTIES}"
    export MW_HOME="[place your WebLogic Server folder path here]"
    export USER_MEM_ARGS="-Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
    ```

    `DERBY_FLAG` 설정은 WebLogic의 내장 Derby 서버를 비활성화합니다. DXP에는 이 서버가 필요하지 않습니다.

    `JAVA_OPTIONS` DXP의 UTF-8 요구 사항, Lucene 사용 및 AspectJ를 통한 Aspect Oriented Programming을 설정합니다.

    `JAVA_PROPERTIES` 또한 DXP의 UTF-8 요구 사항을 설정합니다. TODO는 liferay-portal당 소문자를 사용합니까?

    ```{important}
    DXP는 애플리케이션 서버 JVM이 'GMT' 시간대와 'UTF-8' 파일 인코딩을 사용하도록 요구합니다.
    ```

    `MW_HOME` WebLogic 서버가 포함된 폴더로 설정합니다. 예를 들어,

    ```bash
    export MW_HOME="/Users/ray/Oracle/wls12210"
    ```

    `*_MEM_ARGS` 변수는 DXP의 시작 및 최대 힙 메모리 용량을 설정합니다.

1. 노드 관리자가 관리 서버를 시작할 때 DXP의 메모리 요구 사항을 설정하는지 확인하십시오. Admin Server의 콘솔 UI에서 DXP가 배포될 Managed Server로 이동하고 **Server Start** 탭을 선택합니다. **인수** 필드에 다음 매개변수를 입력합니다.

    ```bash
    -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7
    ```

1. **저장** 클릭합니다.

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
DXP를 설치한 후 성능 향상을 위해 이러한 구성(이러한 JVM 옵션 포함)을 추가로 조정할 수 있습니다. [Liferay 튜닝](../../setting-up-liferay/tuning-liferay.md) 및 [JVM 조정](../../setting-up-liferay/tuning-your-jvm. md) 자세한 내용은
```

## 종속성 설치

DXP는 OSGi 모듈(OSGi 종속성 ZIP) 및 데이터베이스 드라이버에 의존합니다.

1. OSGi 종속성 ZIP 파일을 `[Liferay Home]/osgi` 폴더에 압축 해제합니다(이 폴더가 없으면 생성). Liferay의 OSGi 런타임은 이러한 모듈에 의존합니다.
1. DXP 7.4+ WAR 파일에는 MariaDB 및 PostgreSQL용 드라이버가 포함되어 있습니다. 이전 DXP WAR에는 해당 기능이 없습니다. 7.4+ WAR에 사용 중인 지원 데이터베이스용 드라이버가 없는 경우 데이터베이스 공급업체의 JDBC JAR 파일을 다운로드하여 분해된 DXP WAR의 `WEB-INF/shielded-container-lib` 폴더에 넣습니다.

    지원되는 데이터베이스 목록은 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151) 참조하십시오.

```{note}
Hypersonic 데이터베이스는 DXP와 함께 번들로 제공되며 테스트 목적으로 유용합니다. 프로덕션 인스턴스에 HSQL을 사용하지 마세요.
```

```{note}
DXP 7.3 및 이전 버전의 경우 WebLogic 도메인의 `lib` 폴더에 종속성 ZIP 파일의 압축을 풉니다. 데이터베이스 벤더의 JDBC JAR 파일도 해당 폴더에 배치하십시오.
```

## Elasticsearch 설치

Liferay를 시작하면 기본 [사이드카](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md) Elasticsearch 서버가 설치되고 시작됩니다. WebLogic에 설치할 때 처음부터 원격 Elasticsearch 서버를 설정해야 합니다. [Elasticsearch 시작하기](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md)참조하십시오.

Liferay DXP가 구성되고(Elasticsearch 커넥터에 `.config` 파일 사용) Elasticsearch가 이미 구성되어 실행 중인 상태에서 시작하면 Elasticsearch에 대한 연결이 활성화됩니다.

## 데이터베이스에 연결

DXP에는 시연 목적으로 Hypersonic 데이터베이스가 내장되어 있지만 **생산에 사용해서는 안 됩니다** . 완전한 기능을 갖춘 지원되는 데이터베이스를 사용하십시오. 데이터베이스를 설정하려면 [데이터베이스 구성](../configuring-a-database.md)을 참조하세요.

Liferay DXP는 DXP의 내장 데이터 소스(권장) 또는 앱 서버의 JNDI 데이터 소스를 사용하여 데이터베이스에 연결할 수 있습니다.

[설정 마법사](../running-liferay-for-the-first-time.md)를 사용하여 DXP를 처음 실행할 때 데이터베이스로 DXP의 내장 데이터 소스를 구성할 수 있습니다. 또는 데이터베이스의 [데이터베이스 템플리트](../../reference/database-templates.md) 를 기반으로 [`Portal-ext.properties` 파일](../../reference/portal-properties.md) 에서 데이터 소스를 구성할 수 있습니다.

그렇지 않으면 WebLogic에서 데이터 소스를 구성할 수 있습니다.

1. DXP WAR(7.4+) 또는 데이터베이스 공급업체에서 JDBC JAR을 가져와 도메인의 `lib` 폴더에 복사합니다.
1. AdminServer 콘솔에 로그인합니다.
1. **Domain Structure** 트리에서 도메인을 찾고 **Services** &rarr; **JDBC** &rarr; **Data Sources** 로 이동합니다.
1. 새 데이터 소스를 생성하려면 **New** 클릭합니다.
1. `Liferay Data Source` 있는 **Name** 필드와 `jdbc/LiferayPool`이 있는 **JNDI Name** 필드를 입력합니다.
1. 데이터베이스 유형 및 드라이버를 선택합니다. 예를 들어, MySQL은 **입니다. MySQL의 드라이버(유형 4) 버전:using com.mysql.cj.jdbc.Driver** 입니다.
1. 계속하려면 **다음** 클릭하십시오.
1. 이 페이지의 기본 설정을 수락하고 **다음** 클릭하여 계속 진행합니다.
1. MySQL 데이터베이스에 대한 데이터베이스 정보를 입력합니다.
1. MySQL을 사용하는 경우 `?useUnicode=true&characterEncoding=UTF-8&\useFastDateParsing=false` 텍스트를 URL 줄에 추가하고 연결을 테스트합니다. 작동하면 **다음** 클릭합니다.
1. 데이터 소스의 대상을 선택하고 **마침** 클릭합니다.
1. DXP를 JDBC 데이터 소스에 연결합니다. `portal-ext.properties` 파일(위 참조)에서 데이터 소스 JNDI 이름을 입력하십시오. 예를 들어,

    ```properties
    jdbc.default.jndi.name=jdbc/LiferayPool
    ```

## 메일 서버에 연결

내장 메일 세션을 사용하여 Liferay DXP [을 메일 서버](../../setting-up-liferay/configuring-mail.md) 에 연결할 수 있습니다. 그렇지 않으면 WebLogic의 메일 세션을 사용할 수 있습니다.

1. WebLogic을 시작하고 Admin Server의 콘솔에 로그인합니다.
1. 관리 서버 콘솔 UI의 왼쪽에 있는 **도메인 구조** 상자에서 **서비스** &rarr; **메일 세션** 선택합니다.
1. **New** 클릭하여 새 메일 세션 생성을 시작합니다.
1. 세션 이름을 **LiferayMail** 로 지정하고 JNDI 이름을 `mail/MailSession`으로 지정합니다.
1. 메일 서버에 필요한 대로 **세션 사용자 이름** , **세션 비밀번호** , **세션 비밀번호 확인** 및 **JavaMail 속성** 필드를 입력하십시오. 이러한 필드에 대한 자세한 내용은 [WebLogic 설명서](http://docs.oracle.com/middleware/1221/wls/FMWCH/pagehelp/Mailcreatemailsessiontitle.html) 참조하십시오.
1. **다음** 클릭합니다.
1. DXP가 설치될 Managed Server를 선택하고 **마침** 클릭합니다.
1. 관리 및 관리 서버를 종료합니다.
1. 관리 및 관리 서버가 종료되면 Liferay Home의 `portal-ext.properties` 파일에 다음 속성을 추가합니다.

    ```properties
    mail.session.jndi.name=mail/MailSession
    ```

```{note}
DXP가 배포된 후 `portal-ext.properties` 파일은 도메인의 `autodeploy/ROOT/WEB-INF/classes` 폴더에서 찾을 수 있습니다.
```

변경 사항은 Managed 및 Admin 서버를 다시 시작하면 적용됩니다.

## DXP 배포

DXP WAR 파일을 배포하려면 다음 단계를 따르십시오.

1. DXP를 배포하는 지정된 관리 서버가 종료되었는지 확인합니다.
1. Admin Server의 콘솔 UI에서 왼쪽의 **도메인 구조** 상자에서 **배포** 선택합니다.
1. **설치** 클릭하여 새 배포를 시작합니다.
1. 컴퓨터에서 DXP WAR 파일 또는 확장된 콘텐츠를 선택합니다. 또는 **파일 업로드** 링크를 클릭하여 WAR 파일을 업로드합니다. **다음** 클릭합니다.
1. **이 배포를 애플리케이션으로 설치** 선택하고 **다음** 클릭합니다.
1. DXP를 배포하고 있는 지정된 관리 서버를 선택하고 **다음** 클릭합니다.
1. 기본 이름이 설치에 적합하면 그대로 두십시오. 그렇지 않으면 다른 이름을 입력하고 **다음** 클릭하십시오.
1. **마침** 클릭합니다.
1. 배포가 완료된 후 구성이 올바르면 **저장** 클릭합니다.
1. DXP를 배포한 관리 서버를 시작합니다. DXP는 모든 JSP를 미리 컴파일한 다음 시작합니다.

DXP를 배포한 후 `PhaseOptimizer`과 관련된 아래와 같은 과도한 경고 및 로그 메시지가 표시될 수 있습니다. 이들은 양성이며 무시할 수 있습니다. 앱 서버의 로깅 수준 또는 로그 필터를 조정하여 이러한 메시지를 끌 수 있습니다.

```
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
     WARNING: Skipping pass gatherExternProperties
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
     WARNING: Skipping pass checkControlFlow
May 02, 2018 9:12:27 PM com.google.javascript.jscomp.PhaseOptimizer$NamedPass process
     INFO: pass supports: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, modules, exponent operator (**), async function, trailing comma in param list]
     current AST contains: [ES3 keywords as identifiers, getters, reserved words as properties, setters, string continuation, trailing comma, array pattern rest, arrow function, binary literal, block-scoped function declaration, class, computed property, const declaration, default parameter, destructuring, extended object literal, for-of loop, generator, let declaration, member declaration, new.target, octal literal, RegExp flag 'u', RegExp flag 'y', rest parameter, spread expression, super, template literal, exponent operator (**), async function, trailing comma in param list, object literals with spread, object pattern rest]
```

Liferay DXP Enterprise 구독이 있는 경우 DXP는 활성화 키를 요청합니다. 자세한 내용은 [Liferay DXP](../../setting-up-liferay/activating-liferay-dxp.md) 활성화를 참조하십시오.

축하해요! WebLogic에서 DXP를 실행하고 있습니다.

## 다음 단계

관리자 사용자로 [로그인](../../../getting-started/introduction-to-the-admin-account.md) DXP에서 솔루션 구축을 시작할 수 있습니다. 또는 [추가 Liferay DXP 설정](../../setting-up-liferay.md) 항목을 탐색할 수 있습니다.

* [마켓플레이스 플러그인 설치](../../../system-administration/installing-and-managing-apps/using-marketplace.md#appendix-installing-the-marketplace-plugin)
* [평가판 기간 동안 EE 플러그인 액세스](../../../system-administration/installing-and-managing-apps/installing-apps/accessing-ee-plugins-during-a-trial-period.md)
* [검색 엔진 설치](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)
* [라이프레이 확보](../../securing-liferay.md)
* [고가용성을 위한 클러스터링](../../setting-up-liferay/clustering-for-high-availability.md)
