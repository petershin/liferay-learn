# JVM 구성

Liferay DXP/Portal에는 Java JDK 8 또는 11이 필요하며 특정 JVM 옵션 설정이 필요합니다. JDK 11과 관련된 권장 설정 및 권장 기본 메모리 설정도 있습니다. 여기에서 이러한 모든 설정에 대해 배우고 예제 Tomcat 스크립트에서 설명하는 것을 볼 수 있습니다.

```{note}
JDK를 선택하려면 [Liferay DXP 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151) 를 참조하세요.
```

## 권장 JVM 설정

| 유형      | 설정/기본값                                    | 요구하는 | 묘사                                                                                                                                                                                                                                      |
|:------- |:----------------------------------------- |:---- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 파일 인코딩  | `-Dfile.encoding=UTF8`                    | 그렇다  | DXP는 국제화를 지원하기 위해 UTF-8 파일 인코딩이 필요합니다.                                                                                                                                                                                                  |
| 시간대     | `-Duser.timezone=GMT`                     | 그렇다  | DXP는 모든 날짜에 GMT 시간대를 사용합니다.                                                                                                                                                                                                             |
| 네 자리 연도 | `-Djava.locale.providers=JRE,COMPAT,CLDR` | 부정   | JDK 11에서 이 설정은 4자리 연도를 표시합니다. JDK 9부터 유니코드 CLDR(Common Locale Data Repository)이 기본 로케일 제공자입니다. CLDR은 4자리 형식으로 연도를 제공하지 않습니다( [LPS-87191](https://issues.liferay.com/browse/LPS-87191) 참조). 이 설정은 JDK 8의 기본 로케일 공급자를 사용하여 문제를 해결합니다.      |
| 힙 크기    | `-Xms2560m -Xmx2560m`                     | 부정   | 기본 최소 및 최대 크기는 필요에 맞게 조정할 수 있지만 JVM이 동적으로 조정되지 않도록 동일한 최소(`-Xms`) 및 최대(`-Xmx`) 크기를 설정해야 합니다.                                                                                                                                            |
| Log4j   | `-Dlog4j2.formatMsgNoLookups=true`        | 그렇다 **| 2.15.0 이전의 Log4j 버전은 LDAP JNDI 구문 분석기를 통한 RCE(원격 코드 실행) 취약점의 영향을 받습니다. 자세한 내용은 [LPS-143663](https://issues.liferay.com/browse/LPS-143663) 을 참조하십시오. \** Liferay DXP 7.4 GA1 및 Liferay PORTAL 7.4 GA1 - GA3에서 보안 취약점을 해결하려면 이 설정이 필요합니다. |

지원되는 애플리케이션 서버에 대한 Liferay 설치 문서는 이러한 설정을 적용할 사이트를 설명합니다. 기사 링크는 다음과 같습니다.

* [수코양이](../installing-liferay/installing-liferay-on-an-application-server/installing-on-tomcat.md)
* [와일드플라이](../installing-liferay/installing-liferay-on-an-application-server/installing-on-wildfly.md)
* [제이보스 EAP](../installing-liferay/installing-liferay-on-an-application-server/installing-on-jboss-eap.md)
* [웹로직](../installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md)
* [WebSphere](../installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md)

## 알려진 문제: 불법 액세스 경고

JDK 11에서는 다음과 같은 **불법 액세스** 경고가 로그에 인쇄될 수 있습니다.

```message
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by com.liferay.petra.reflect.ReflectionUtil (file:/Users/malei/dev/project/bundles/master-bundles/tomcat-9.0.10/lib/ext/com.liferay.petra.reflect.jar) to field java.lang.reflect.Field.modifiers
WARNING: Please consider reporting this to the maintainers of com.liferay.petra.reflect.ReflectionUtil
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
```

이러한 경고는 알려진 문제( [LPS-87421](https://issues.liferay.com/browse/LPS-87421) )로 인해 발생하며 다음 JVM 옵션을 추가하여 해결할 수 있습니다.

```
--add-opens=java.base/java.awt.font=ALL-UNNAMED
--add-opens=java.base/java.io=ALL-UNNAMED
--add-opens=java.base/java.lang=ALL-UNNAMED
--add-opens=java.base/java.lang.reflect=ALL-UNNAMED
--add-opens=java.base/java.net=ALL-UNNAMED
--add-opens=java.base/java.nio=ALL-UNNAMED
--add-opens=java.base/java.text=ALL-UNNAMED
--add-opens=java.base/java.util=ALL-UNNAMED
--add-opens=java.base/sun.nio.ch=ALL-UNNAMED
--add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
--add-opens=java.xml/com.sun.org.apache.xerces.internal.parsers=ALL-UNNAMED
```

## Tomcat 스크립트 예

다음은 위에서 언급한 JVM 옵션 중 일부를 보여주는 Tomcat `setenv.sh` 스크립트입니다.

```properties
CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.io=ALL-UNNAMED"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.lang.reflect=ALL-UNNAMED"
```

Liferay는 많은 애플리케이션 서버를 지원하며 모두 선택한 JVM 옵션으로 구성할 수 있습니다. 
