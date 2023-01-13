# 종속성 지정

모듈을 성공적으로 컴파일하고 배포하려면 모든 종속성을 충족해야 합니다. 종속성 아티팩트를 [후](./finding-artifacts.md)Gradle 빌드 파일에 종속성으로 추가합니다. Liferay는 이미 런타임에 많은 아티팩트를 포함하고 있습니다. 다른 아티팩트에 의존하는 경우 수동으로 배포하거나 모듈에 포함해야 합니다. 여기에서 종속성 구성 단계 및 예제를 찾을 수 있습니다.

## 종속성 구성

1. `build.Gradle` 파일을 엽니다.

1. [아직 존재하지 않는 경우 `종속성` 세트](https://docs.gradle.org/current/userguide/declaring_dependencies.html)을 선언합니다.

    ```groovy
    dependencies {
    }
    ```

1. 모듈에 Liferay, OSGi 또는 Bnd의 패키지가 필요한 경우 Liferay Portal API에 `compileOnly` 종속성을 추가합니다.

    ```groovy
    dependencies {
        compileOnly group: "com.liferay.portal", name: "release.portal.api"
    }
    ```

1. 모듈이 컴파일 또는 배포되지 않으면 필요한 패키지를 제공하는 아티팩트를 찾아 아티팩트에 `compileInclude` 종속성을 추가합니다.

    ```groovy
    dependencies {
        compileOnly group: "com.liferay.portal", name: "release.portal.api",
        compileInclude group: 'com.google.guava', name: 'guava', version: '19.0'
    }
    ```

1. 모듈을 배포하고 [Gogo Shell 명령](../using-the-gogo-shell.md) 을 사용하거나 로그를 검색하여 충족되지 않은 패키지 종속성을 확인합니다.

1. 충족되지 않은 종속성이 있는 경우 다음과 같이 해결하십시오.

    **모듈 종속성의 경우** 필요한 모듈을 배포합니다. 자세한 내용은 [앱 설치 및 관리](../../../system-administration/installing-and-managing-apps/installing-apps.md) 을 참조하세요.

    **라이브러리 종속성의 경우** [타사 라이브러리 종속성 해결](./resolving-third-party-library-package-dependencies.md)의 지침을 따르십시오.

멋진! 종속성을 지정하는 것은 의존할 수 있는 기술입니다!

## 추가 정보

* [유물 찾기](./finding-artifacts.md)
* [패키지 가져오기](../importing-packages.md)
* [패키지 내보내기](../exporting-packages.md)
* [타사 라이브러리 패키지 종속성 해결](./resolving-third-party-library-package-dependencies.md)
* [WAR 배포 \(WAB 생성기\)](../../../building-applications/reference/deploying-wars-wab-generator.md)