# Liferay 작업 공간 구성

```{warning}
Liferay Workspace는 사용이 간편하며 [처음부터](./what-is-liferay-workspace.md)를 시작하여 기본 사항을 배울 수 있습니다. 행복하게 [프로젝트 생성](./creating-code-with-liferay-workspace.md), [코드 배포](./creating-code-with-liferay-workspace.md#deploying-code-via- liferay-workspace) 또는 [Docker 컨테이너 사용](./configuring-a-liferay-docker-container.md), 여기에 정보가 필요하지 않을 수 있습니다. 그러나 Workspace가 할 수 있는 모든 일에 대해 자세히 알아보고 싶다면 여기가 적합합니다. 
```

다루는 주제는 다음과 같습니다.

- Liferay Workspace 및 번들 플러그인 업데이트
- 개발, UAT 및 프로덕션 환경 사용
- 대상 플랫폼 관리

## Liferay Workspace 및 번들 플러그인 업데이트

Liferay Workspace는 개발자가 생산성을 높일 수 있도록 지속적으로 업데이트되며 작업 공간을 최신 상태로 유지하는 것은 쉬운 과정입니다.

1. [Liferay 저장소에서 Workspace의 릴리스](https://repository-cdn.liferay.com/nexus/content/repositories/liferay-public-releases/com/liferay/com.liferay.gradle.plugins.workspace) 로 이동합니다. 버전이 목록에 나타납니다. 필요한 버전 번호를 기록해 두십시오.
1. Workspace의 루트 폴더에서 `settings.gradle` 파일을 엽니다.
1. `종속성` 블록에서 리포지토리에서 찾은 버전으로 버전을 업데이트합니다. 최신 릴리스를 유지하려면 버전 번호 대신 텍스트 `latest.release` 을 제공하십시오.

   ```groovy
    dependencies {
        classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "[WORKSPACE_VERSION]"
    }
    ```

1. 파일을 저장하고 닫습니다. 업그레이드를 실행하려면 `tasks`과 같은 Gradle 명령을 실행합니다.

   ```bash
   ./gradlew tasks
   ```

축하합니다! 이제 작업 공간이 업그레이드되었습니다.

## Liferay 버전 업데이트

Workspace가 컴파일하는 Liferay 버전을 업데이트할 수 있습니다. 이것은 단일 속성에 의해 처리됩니다.

```properties
liferay.workspace.product=[$LIFERAY_LEARN_PORTAL_WORKSPACE$]
```

코드를 개발 중인 Liferay 버전으로 속성 값을 업데이트합니다. 그러면 작업공간의 종속성이 자동으로 새 버전으로 업데이트됩니다.

## JDK 11 사용

```{note}
JDK 11에서 컴파일하는 경우 JDK 11에서 실행해야 합니다. Workspace를 변경하기 전에 앱 서버에서 JDK 11을 실행 중인지 확인하십시오. Liferay의 Docker 이미지는 기본적으로 JDK 8을 사용합니다. 이를 재정의하려면 `-e JAVA_VERSION=zulu11` 환경 변수를 사용하여 Docker 이미지를 생성합니다.
```

**전제 조건:** 이전 버전의 Workspace를 사용하는 경우 다음 두 가지를 업그레이드해야 합니다.

1. Gradle을 버전 6.6.1 이상으로 업데이트하세요.
1. Workspace 버전을 3.4.2 이상으로 업데이트하십시오(업그레이드 절차는 위 참조).

Gradle을 업그레이드하려면 작업공간에서 `gradle/wrapper/gradle-wrapper.properties` 파일을 편집합니다.

```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-6.6.1-all.zip
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStorePath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
```

작업공간도 업그레이드한 경우 `liferay.workspace.product` 특성 세트가 있는지 확인하십시오. Blade CLI를 사용하여 `blade init -l`을 입력하여 이 속성에 대한 현재 목록을 항상 얻을 수 있음을 기억하십시오.

이전 작업 공간을 업그레이드한 경우 Liferay CDN이 작업 공간의 `settings.gradle` 파일에 선언되어 있는지 확인하십시오.

```groovy
maven {
    url "http://repository.liferay.com/nexus/content/groups/public"
}
```
엄청난! 이제 Liferay 프로젝트에서 JDK 11을 사용할 준비가 되었습니다. 기존 프로젝트가 있는 경우 수행해야 할 추가 단계가 있습니다.

### 서비스 빌더 프로젝트

Service Builder 프로젝트로 이전 Workspace를 업그레이드한 경우 Service Builder `-service` 모듈의 `build.gradle` 파일에 이 구성을 추가합니다.

```groovy
tasks.withType(JavaCompile) {

    // Generated classes using Jodd library are unable to be read when compiled against JDK 11

    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}
```
### JAX-WS 프로젝트

JAX-WS 프로젝트가 있는 경우 JDK 11에서 제거된 `javax.xml.soap` 의 클래스가 필요합니다. 이제 수동으로 종속 항목으로 지정해야 합니다.


```groovy
compile 'com.sun.xml.ws:jaxws-ri:2.3.2'
```

## 대상 플랫폼 관리

일반적으로 Gradle 종속성을 정의할 때 다음과 같이 해당 종속성의 버전을 제공해야 합니다.

```groovy
dependencies {
   compileOnly group: "javax.portlet", name: "portlet-api", version: "3.0.1"
   compileOnly group: "javax.servlet", name: "javax.servlet-api", version: "4.0.1"
}
```

Liferay의 플랫폼에 작성된 모든 애플리케이션은 해당 플랫폼을 대상으로 하므로 Liferay는 Liferay의 버전을 선언한 다음 Liferay에서 다른 종속성을 상속하여 한 번에 모든 종속성을 쉽게 지정할 수 있도록 했습니다. 그렇게 하면 위에 표시된 엉망진창이 없습니다.

대상 플랫폼은 기본적으로 활성화되어 있습니다. 사용하기 위해 추가 작업을 수행할 필요가 없습니다. 현재 대부분의 종속성은 다음과 같습니다.

```groovy
dependencies {
    compileOnly group: "com.liferay.portal", name: "release.portal.api"
}
```

이것은 Liferay와 함께 제공되는 모든 종속성을 가져옵니다. 어떤 이유로 특정 종속성을 지정해야 하는 경우 여전히 다음을 수행할 수 있습니다.

```groovy
dependencies {
        compileOnly group: "com.liferay.portal", name: "release.portal.api"
        cssBuilder group: "com.liferay", name: "com.liferay.css.builder", version: "3.0.2"
}
```
