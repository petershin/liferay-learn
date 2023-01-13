# Liferay 작업 공간 만들기

수동으로 또는 [Blade CLI](../blade-cli/installing-and-updating-blade-cli.md)을 사용하여 Liferay Workspace를 생성할 수 있습니다.

## 수동으로 Liferay 작업 공간 만들기

Liferay Workspace를 수동으로 생성하려면 [Gradle](https://gradle.org) 이 설치되어 있어야 합니다. 또한 대상으로 삼고 있는 Liferay 제품(DXP, Portal 롤링 릴리스 또는 Commerce)의 ID를 알고 있거나 `blade init -l` 명령을 사용하여 Blade CLI로 조회할 수 있어야 합니다.

1.  시스템에 작업 공간을 저장할 폴더를 만듭니다.

1.  이 폴더 안에 다음 내용으로 `settings.gradle` 이라는 파일을 만듭니다.

    ```groovy
    buildscript {
            dependencies {
                    classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "latest.release"
            }

            repositories {
                    mavenLocal()

                    maven {
                            url "https://repository-cdn.liferay.com/nexus/content/groups/public"
                    }
            }
    }

    apply plugin: "com.liferay.workspace"
    ```

1.  이제 다음 명령을 사용하여 Gradle 래퍼를 프로젝트에 추가합니다.

    ```bash
    gradle wrapper --gradle-version 6.6.1
    ```

1.  다음을 포함하는 `gradle.properties` 이라는 파일을 만듭니다.

    ```properties
    liferay.workspace.product=[$LIFERAY_LEARN_PORTAL_WORKSPACE$]
    ```

    이것은 Liferay Portal의 최신 GA를 정의합니다. `blade init -l`을 입력하여 Blade CLI를 사용하여 항상 현재 목록을 가져올 수 있습니다.

## Blade CLI로 Liferay 작업 공간 만들기

1. 명령줄 인터페이스에서 작업공간을 생성하려는 폴더로 이동합니다.

1. 사용 가능한 버전을 나열하여 대상으로 지정하려는 Liferay 버전을 찾으십시오.

   ```bash
   blade init -l
   ```

1. 이제 작업 공간을 만들 준비가 되었습니다. 다음 명령을 실행합니다.

   ```bash
   blade init -v [Liferay version] [workspace name]
   ```

   예를 들어,

   ```bash
   blade init -v portal-7.4-ga1 my-workspace
   ```

작업 공간이 생성됩니다. Liferay의 모든 7.x 버전을 대상으로 지정할 수 있습니다.

```bash
blade init -v portal-7.0-ga7 [workspace name]
```

작업 영역 버전은 `liferay.version.default` 속성을 사용하여 작업 영역의 루트 폴더에 있는 숨겨진 `.blade.properties` 파일에 저장됩니다. 템플릿을 기반으로 프로젝트를 만들 때 여기에 저장된 버전에 따라 사용되는 템플릿 버전이 결정됩니다.

## 프록시 구성

프록시 서버 뒤에 있는 경우 설정할 수 있습니다.

1.  `~/.gradle/gradle.properties` 파일을 엽니다. 존재하지 않는 경우 이 파일을 작성하십시오.

1.  파일에 다음 속성을 추가합니다.

    ```properties
    systemProp.http.proxyHost=www.somehost.com
    systemProp.http.proxyPort=1080
    systemProp.https.proxyHost=www.somehost.com
    systemProp.https.proxyPort=1080
    ```

    프록시 호스트 및 포트 값을 자신의 값으로 바꾸십시오.

3.  프록시 서버에 인증이 필요한 경우 다음 속성도 추가합니다.

    ```properties
    systemProp.http.proxyUser=userId
    systemProp.http.proxyPassword=yourPassword
    systemProp.https.proxyUser=userId
    systemProp.https.proxyPassword=yourPassword
    ```

훌륭한! 프록시 설정은 Liferay Workspace에서 설정됩니다. 

