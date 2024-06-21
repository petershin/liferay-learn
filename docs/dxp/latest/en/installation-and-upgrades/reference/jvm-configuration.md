---
uuid: 34581f39-bde2-4e5f-8317-cafa6de7eae0
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
---
# JVM Configuration

As of {bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`, Liferay DXP/Portal requires a Java 11, 17, or 21 (prior versions support only JDKs 8 and 11) with specific JVM option settings. There are also recommended settings specific to JDK 11, 17, and 21, and recommended baseline memory settings. Here you'll learn about all of these settings and see them demonstrated in an example Tomcat script.

!!! note
    See [the Liferay DXP compatibility matrix](https://help.liferay.com/hc/en-us/articles/360049238151) to choose a JDK.

## Recommended JVM Settings

| Type             | Setting/Default                           | Required | Description |
| :--------------- | :---------------------------------------- | :------- | :---------- |
| File Encoding    | `-Dfile.encoding=UTF8`                    | Yes      | DXP requires UTF-8 file encoding to support internationalization. |
| Timezone         | `-Duser.timezone=GMT`                     | Yes      | DXP uses the GMT timezone for all dates. |
| Four-digit Years | `-Djava.locale.providers=JRE,COMPAT,CLDR` | No       | On JDK 11, 17, and 21, this setting displays four-digit years. Since JDK 9, the Unicode Common Locale Data Repository (CLDR) is the default locales provider. CLDR does not provide years in a four-digit format (see [LPS-87191](https://issues.liferay.com/browse/LPS-87191)). This setting works around the issue by using JDK 8's default locales provider. |
| Heap Size        | `-Xms2560m -Xmx2560m`                     | No       | The default minimum and maximum size can be adjusted to suit your needs, but you should set the same minimum (`-Xms`) and maximum (`-Xmx`) size to prevent the JVM from making dynamic adjustments. |
| Log4j            | `-Dlog4j2.formatMsgNoLookups=true`        | Yes*     | Log4j versions prior to 2.15.0 are subject to a remote code execution (RCE) vulnerability via the LDAP JNDI parser. See [LPS-143663](https://issues.liferay.com/browse/LPS-143663) for details. \*Liferay DXP 7.4 GA1 and Liferay PORTAL 7.4 GA1 - GA3 require this setting to resolve the security vulnerability. |

The Liferay installation articles for supported application servers explain where to apply these settings. Here are the article links:

- [Tomcat](../installing-liferay/installing-liferay-on-an-application-server/installing-on-tomcat.md)
- [WildFly](../installing-liferay/installing-liferay-on-an-application-server/installing-on-wildfly.md)
- [JBoss EAP](../installing-liferay/installing-liferay-on-an-application-server/installing-on-jboss-eap.md)
- [WebLogic](../installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md)
- [WebSphere](../installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md)

## Known Issue: Illegal Access Warnings

On JDK 11, 17, or 21, _Illegal Access_ warnings like these may print to your logs if you're installing Liferay manually on your application server:

```message
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by com.liferay.petra.reflect.ReflectionUtil (file:/Users/malei/dev/project/bundles/master-bundles/tomcat-9.0.10/lib/ext/com.liferay.petra.reflect.jar) to field java.lang.reflect.Field.modifiers
WARNING: Please consider reporting this to the maintainers of com.liferay.petra.reflect.ReflectionUtil
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
```

These warnings are caused by a known issue ([LPS-87421](https://issues.liferay.com/browse/LPS-87421)) and can be resolved by adding these JVM options:

```bash
--add-opens=java.base/java.lang=ALL-UNNAMED
--add-opens=java.base/java.lang.invoke=ALL-UNNAMED
--add-opens=java.base/java.lang.reflect=ALL-UNNAMED
--add-opens=java.base/java.net=ALL-UNNAMED
--add-opens=java.base/sun.net.www.protocol.http=ALL-UNNAMED
--add-opens=java.base/sun.util.calendar=ALL-UNNAMED
--add-opens=jdk.zipfs/jdk.nio.zipfs=ALL-UNNAMED
```

## Example Tomcat Script

Here is a Tomcat `setenv.sh` script that demonstrates some of the JVM options mentioned above:

```properties
CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.io=ALL-UNNAMED"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.lang.reflect=ALL-UNNAMED"
```

Note that Liferay supports many application servers, and all of them can be configured with the JVM options of your choosing.
