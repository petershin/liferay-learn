# 내보낸 타사 패키지

Liferay는 런타임에 100개 이상의 타사 Java 패키지를 제공합니다. `com.liferay.portal.bootstrap` 모듈은 glob을 사용하여 개별 패키지와 패키지 그룹을 명시적으로 지정하여 패키지를 내보냅니다. 예를 들어 다음은 [7.3.4-ga5](https://github.com/liferay/liferay-portal/blob/7.3.4-ga5/modules/core/portal-bootstrap/system.packages.extra.bnd) 의 `Export-Package` 선언에서 발췌한 것입니다.

```groovy
Export-Package:\
    ...
    \
    org.aspectj.*,\
    \
    org.dom4j.*;version='2.1.3',\
    \
    org.hibernate.*;version='3.6.10',\
    \
    org.jaxen.*;version='1.1.6',\
    \
    org.jdom.*;version='1.1.3',\
    \
    org.json.*;version='20180813',\
    \
    org.objectweb.asm;version='7.0',\
    org.objectweb.asm.commons;version='7.0',\
    org.objectweb.asm.signature;version='7.0',\
    org.objectweb.asm.tree;version='7.0',\
    org.objectweb.asm.tree.analysis;version='7.0',\
    org.objectweb.asm.util;version='7.0',\
    \
    org.slf4j;version='1.7.2',\
    org.slf4j.helpers;version='1.7.2',\
    org.slf4j.spi;version='1.7.2',\
    \
    org.springframework.*;version='4.1.9',\
    \
    ...
```

여러 패키지는 `*` in `org.aspectj.*`과 같은 와일드 카드 문자를 사용하여 지정됩니다. `org.objectweb.asm*` 패키지 및 `org.slf4j*` 패키지와 같은 패키지 그룹은 `\` 문자만 있는 줄로 구분됩니다.

다른 JAR에서 동일한 패키지를 내보내면 "패키지 분할" 문제가 발생합니다. 이로 인해 정의하기 어려운 문제가 발생할 수 있습니다. 따라서 Liferay가 내보낸 것과 동일한 패키지가 있는 JAR을 배포하지 마십시오.

## 런타임에 내보낸 패키지에 대해 Liferay에 의존

다음은 컴파일 시간에 프로젝트에 필수 패키지가 있지만 런타임에 내보낸 패키지에 대해 Liferay에 의존하는지 확인하는 방법입니다.

1. 프로젝트에 필요한 패키지가 `com.liferay.portal.bootstrap` 모듈의 내보내기 매니페스트에 나열되어 있는지 확인하십시오. 다음 두 가지 방법으로 확인할 수 있습니다.

    **Bnd 소스 파일:** Liferay 소스 코드의 사본이 있는 경우 `module/core/portal-bootstrap/system.packages.extra.bnd` 파일의 `Export-Package` 선언을 검사하십시오. 위에 표시된 사용자 친화적인 형식으로 내보낸 패키지를 보여줍니다. Liferay는 이 `.bnd` 파일을 기반으로 `com.liferay.portal.bootstrap` 모듈의 `META-INF/system.packages.extra.mf` 파일을 생성합니다.

    **JAR 매니페스트:** `[Liferay Home]/osgi/core/com.liferay.portal.bootstrap.jar` 의 `META-INF/system.packages.extra.mf` 파일은 내보낸 패키지를 선언합니다. JAR은 Liferay 설치에서 편리하게 찾을 수 있지만 매니페스트 파일의 `Export-Package` 선언 형식은 사용자 친화적이지 않습니다.

1. 프로젝트에서 제공된 타사 패키지를 사용하는 경우 `providedCompile` Gradle 범위를 사용하여 컴파일 시간 아티팩트를 종속성으로 추가합니다. `providedCompile` 범위의 아티팩트는 컴파일 시간에 사용할 수 있지만 생성된 JAR에서 제외됩니다.

    예를 들어 프로젝트에서 Spring Bean 패키지를 사용하는 경우 `providedCompile` 범위에서 다음 아티팩트 종속성을 지정합니다.

    ```groovy
    종속성 {
        제공컴파일 그룹: "org.springframework", 이름: "spring-bean", 버전: "4.1.9"
...
    }
    ```

이제 Liferay의 내보낸 타사 패키지를 안전하게 활용할 수 있습니다!

## 추가 정보

* [종속성 구성](../fundamentals/configuring-dependencies.md)
* [WAB에서 제외된 JAR](../../building-applications/reference/jars-excluded-from-wabs.md)
* [타사 라이브러리 패키지 종속성 해결](../fundamentals/configuring-dependencies/resolving-third-party-library-package-dependencies.md)