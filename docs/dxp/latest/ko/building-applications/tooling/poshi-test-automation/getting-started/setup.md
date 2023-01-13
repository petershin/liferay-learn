# 체제

## 전제 조건

1. 자바 JDK 8

1. 구글 크롬

1. [Gradle](https://gradle.org/install/) 또는 [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:adding_wrapper) 6.6.1 이상.

## Poshi 독립형 Gradle 프로젝트 설정

1. 새 디렉토리(예: `poshi-standalone`)를 만듭니다.

1. 새로 생성된 디렉토리에 Gradle 래퍼(6.6.1 이상)를 설정합니다.
    ```
    $ gradle wrapper --gradle-distribution-url https://github.com/liferay/liferay-binaries-cache-2020/raw/master/gradle-6.6.1.LIFERAY-PATCHED-1-bin.zip 
    ```

    이제 디렉터리에 다음이 포함되어야 합니다.
    ```
    poshi-standalone
    ├── .gradle
    ├── gradle   
    |   └── wrapper
    |       ├──  gradle-wrapper.jar
    |       └──  gradle-wrapper.properties
    ├── gradlew
    └── gradlew.bat
    ```

1. Poshi 독립 실행형 빌드 파일을 가져오려면 터미널/명령줄 창의 원하는 디렉터리에서 다음 명령을 실행합니다.

    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/liferay/liferay-portal/master/modules/test/poshi/poshi-standalone/setup.sh)"
    ```

    초기 Gradle 파일 외에도 이제 디렉토리에 다음이 있어야 합니다. `build.gradle`, `settings.gradle`, `poshi.properties`및 `poshi-ext.properties`

1. 루트 디렉터리에서 새 폴더 `poshi-tests`을 만듭니다. 여기에 테스트에 필요한 파일이 저장됩니다.

1. `poshi-tests` 디렉토리로 이동하여 경로, 매크로 및 테스트 사례에 대한 세 개의 추가 폴더를 만듭니다.

    이제 디렉터리에 다음이 포함되어야 합니다.

    ```
    poshi-standalone
    ├── .gradle
    ├── gradle   
    ├── gradle   
    |   └── wrapper
    |       ├──  gradle-wrapper.jar
    |       └──  gradle-wrapper.properties
    ├── poshi-tests
    |   ├── macros
    |   ├── paths
    |   └── testcases
    ├── build.gradle
    ├── gradlew
    ├── gradlew.bat
    ├── poshi.properties
    ├── poshi-ext.properties
    └── settings.gradle
    ```

이 설정을 사용하면 `./gradlew task` (Windows의 경우`gradlew.bat task` )을 실행하여 프로젝트에서 사용 가능한 작업을 볼 수 있습니다. Poshi Standalone의 Gradle 구성에 대한 자세한 내용은 Liferay github 저장소의 [Poshi Standalone](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-standalone) 을 참조하십시오.

## Poshi 독립 실행형 업데이트

Poshi Standalone은 항상 최신 릴리스 버전을 실행하며 Gradle 프로젝트를 업데이트하는 데 필요한 추가 단계가 없습니다. 다운그레이드해야 하는 경우 `build.gradle` 파일 끝에 다음 줄을 추가하고 버전 번호를 [Poshi Runner Changelog](https://github.com/liferay/liferay-portal/blob/master/modules/test/poshi/CHANGELOG.markdown)에서 원하는 버전으로 바꿉니다.

```
poshiRunner {
    version = "1.0.xxx"
}
```