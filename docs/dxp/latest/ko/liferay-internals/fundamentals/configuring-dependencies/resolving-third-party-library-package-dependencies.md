# 타사 라이브러리 패키지 종속성 해결

애플리케이션은 여러 OSGi 모듈에 의존할 수 있습니다. Java 패키지 종속성을 해결하는 것은 어려울 수 있습니다. 완벽한 세상에서 모든 패키지는 OSGi JAR에 배포되지만 많은 패키지는 기존 라이브러리(비 OSGi JAR)에만 있습니다. 여러 가지 방법으로 타사 비 OSGi JAR에 대한 종속성을 해결할 수 있습니다.

1. [Eclipse Orbit](https://www.eclipse.org/orbit/) 및 [ServiceMix Bundles](https://servicemix.apache.org/developers/source/bundles-source.html)과 같은 프로젝트는 수백 개의 기존 Java 라이브러리를 OSGi 모듈로 변환합니다. 패키지와 함께 OSGi JAR을 찾을 수 있습니다.

    * [Eclipse Orbit 다운로드 \(빌드 선택\)](https://download.eclipse.org/tools/orbit/downloads/)
    * [ServiceMix 번들](https://mvnrepository.com/artifact/org.apache.servicemix.bundles)

    패키지가 포함된 모듈을 찾으면 [배포](../../../system-administration/installing-and-managing-apps/installing-apps.md) 해당 모듈에 [](./specifying-dependencies.md) `` 합니다. 패키지에 대한 모듈이 없으면 다음 단계를 계속합니다.

1. Liferay가 이미 사용 중인 라이브러리 패키지를 내보내고 있는지 확인하십시오. Liferay에서 내보내는 경우 [내보낸 타사 패키지](../../reference/exported-third-party-packages.md)의 지침에 따라 종속성을 조정하십시오.

1. OSGi가 아닌 JAR을 `compileInclude` 종속성으로 추가합니다.

    ```groovy
    dependencies {
        compileInclude group: 'org.apache.shiro', name: 'shiro-core', version: '1.1.0'
    }
    ```

    Liferay의 `compileInclude` 구성은 전이적입니다. 라이브러리와 모든 종속성을 모듈 JAR의 `lib` 폴더에 포함하고 JAR을 모듈의 `Bundle-ClassPath` 매니페스트 헤더에 추가합니다.

    ```{note}
    `compileInclude` 구성은 전이적 [선택적 종속성](https://maven.apache.org/guides/introduction/introduction-to-optional-and-excludes-dependencies.html)을 다운로드하지 않습니다. 선택적 종속성에서 패키지가 필요한 경우 다른 타사 라이브러리 패키지처럼 패키지를 확인합니다.
    ```

1. 모듈을 컴파일하십시오.

1. 모듈을 배포하고 해결되지 않은 패키지 종속성을 확인하십시오.

1. 모듈이 사용하지 않는 패키지에 대해 해결되지 않은 종속성이 있는 경우 해당 패키지 가져오기를 차단합니다.

    ```
    Import-Package:\
        !foo.bar.baz,\
        *
    ```

    `!`자는 패키지 가져오기를 무효화합니다. `*` 문자는 모듈이 명시적으로 참조하는 모든 패키지를 나타냅니다. 목록 끝에 `*` 을 넣으면 Bnd가 모듈이 참조하는 모든 패키지를 가져옵니다.

```{note}
WAR 파일에 [Liferay가 이미 내보낸](../../reference/exported-third-party-packages.md) 타사 패키지의 다른 버전이 필요한 경우 [`Import-Package :` 목록](../importing-packages.md). 해당 패키지가 OSGi 모듈에 있으면 배포합니다.

Liferay DXP는 WAR을 배포할 때 이를 [WAB](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.war.html)으로 변환하고 이미 내보낸 타사 JAR을 제거합니다. 배포 시 WAB에서 벗어납니다. Liferay 내보내기와 다른 버전을 강제로 배포하려면 해당 패키지의 비 OSGi JAR 이름을 [WAB 생성기가 제외하는 JAR](../../../building-applications/reference/jars-excluded-from-wabs.md) 및 [JAR 포함](#embedding-a-library)을 프로젝트에 포함합니다.
```

축하합니다! 비 OSGi JAR에서 패키지에 대한 종속성을 해결했습니다.

## 추가 정보

* [패키지 가져오기](../importing-packages.md)
* [패키지 내보내기](../exporting-packages.md)
* [시맨틱 버전 관리](../semantic-versioning.md)