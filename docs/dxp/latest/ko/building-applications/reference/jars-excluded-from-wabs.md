# WAB에서 제외된 JAR

[Liferay에서 생성된 웹 애플리케이션 번들 \(WABs\)](./deploying-wars-wab-generator.md)는 [Liferay가 내보낸 패키지](../../liferay-internals를 포함하는 타사 JAR에서 제거됩니다. /reference/exported-third-party-packages.md) 이미 있습니다. 추가 JAR에서 동일한 타사 패키지를 배포하면 디버깅하기 어려운 이상한 오류가 발생할 수 있습니다. Liferay의 [`module.framework.web.generator.excluded.paths`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Module%20Framework%20Web%20Application %20Bundles) [포털 속성](../../installation-and-upgrades/reference/portal-properties.md)은 제외된 JAR을 지정합니다. 다음은 기본 `module.framework.web.generator.excluded.paths` 속성에서 발췌한 내용입니다.

```properties
module.framework.web.generator.excluded.paths=\
    WEB-INF/lib/ant.jar,\
    WEB-INF/lib/asm-debug-all.jar,\
    WEB-INF/lib/aspectj-rt.jar,\
    WEB-INF/lib/bnd.jar,\
    WEB-INF/lib/ccpp.jar,\
    WEB-INF/lib/commons-beanutils.jar,\
    WEB-INF/lib/commons-chain.jar,\
    ...
```

```{note}
Liferay는 WAB가 [liferay-plugin-package.properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/liferay) 의 'portal-dependency-jars' 속성에 JAR을 나열하더라도 WAB에서 이러한 JAR을 제외합니다. -plugin-package_7_3_0.properties.html) 파일.
```

## 타사 패키지의 다른 버전 포함

WAR에 내보낸 타사 패키지의 다른 버전이 [필요한 경우](../../liferay-internals/reference/exported-third-party-packages.md)제외된 JAR과 다른 이름의 JAR에 포함할 수 있습니다.

예를 들어 다른 버전의 Spring Framework 패키지를 포함하는 방법은 다음과 같습니다.

1. Liferay가 제공하는 [패키지 버전 확인](../../liferay-internals/reference/exported-third-party-packages.md). 예를 들어 Liferay는 `com.liferay.portal.bootstrap` 모듈을 통해 Spring Framework 버전 4.1.9 패키지를 내보냅니다. 

    ```
    Export-Package:\
        ...
        org.springframework.*;version='4.1.9',\
        ...
    ```

1. [원하는 패키지 버전을 제공하는 이슈](../../liferay-internals/fundamentals/configuring-dependencies/finding-artifacts.md) 을 찾습니다.

1. Liferay가 제외하는 해당 아티팩트에 대한 [`module.framework.web.generator.excluded.paths`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Module%20Framework) 포털 속성을 확인하십시오. 예를 들어 Liferay는 다음 Spring Framework JAR을 제외합니다. 

    ```properties
    module.framework.web.generator.excluded.paths=\
        ...
        WEB-INF/lib/spring-aop.jar,\
        WEB-INF/lib/spring-aspects.jar,\
        WEB-INF/lib/spring-beans.jar,\
        WEB-INF/lib/spring-context.jar,\
        WEB-INF/lib/spring-context-support.jar,\
        WEB-INF/lib/spring-core.jar,\
        WEB-INF/lib/spring-expression.jar,\
        WEB-INF/lib/spring-jdbc.jar,\
        WEB-INF/lib/spring-jms.jar,\
        WEB-INF/lib/spring-orm.jar,\
        WEB-INF/lib/spring-oxm.jar,\
        WEB-INF/lib/spring-tx.jar,\
        WEB-INF/lib/spring-web.jar,\
        WEB-INF/lib/spring-webmvc.jar,\
        WEB-INF/lib/spring-webmvc-portlet.jar,\
        ...
    ```

1. 필요한 아티팩트의 이름이 제외된 아티팩트와 동일한 경우(이전 단계 참조) 필요한 아티팩트의 이름을 바꿉니다. 예를 들어 Spring Framework 버전 3.0.7의 Spring AOP JAR을 프로젝트의 `WEB-INF/lib` 폴더에 포함하고 `spring-aop.jar` (제외된 JAR)이 아닌 다른 이름으로 변경하여 사용할 수 있습니다. 

    ```{tip}
    JAR 이름에 버전을 추가하면(즉, `spring-aop-3.0.7.RELEASE.jar`) 제외된 JAR과 구별되고 WAB(번들된 WAR)에서 제거되지 않습니다.
    ```

이제 WAB에 필요한 JAR 버전이 포함됩니다.

## 관련 주제

* [내보낸 타사 패키지](../../liferay-internals/reference/exported-third-party-packages.md)
* [종속성 구성](../../liferay-internals/fundamentals/configuring-dependencies.md)
* [WAR 배포 \(WAB 생성기\)](./deploying-wars-wab-generator.md)
