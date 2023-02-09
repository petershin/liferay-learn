# 모듈 프로젝트

Liferay 애플리케이션 및 사용자 지정은 Java 코드를 포함하는 [OSGi 모듈](https://www.osgi.org/resources/what-is-osgi/): `.jar` 파일과 API 게시 및 사용을 위한 일부 추가 구성입니다.

모듈 프로젝트는 다음 세 가지로 구성됩니다.

1. **코드:** 이미지, 템플릿 및 추가 설명자와 같은 Java 클래스 및 리소스. Java 패키지는 기본적으로 비공개이지만 다른 모듈에서 사용할 수 있도록 [내보내기](./exporting-packages.md)할 수 있습니다.
   
   1 **빌드 스크립트: 모듈 빌드 및 배포를 위한** [Gradle](https://gradle.org/) 파일.

1. **메타데이터:** [Bnd](https://bnd.bndtools.org/) 파일은 모듈 아티팩트를 정의하고 모듈이 제공하고 요구하는 패키지 및 기능을 지정합니다.

모듈 프로젝트 구조는 다음과 같습니다.

```
[project root]
 └── [module 1]
 │    ├── bnd.bnd // Defines the module artifact, provided/required capabilities, and more
 │    ├── build.gradle // Declares dependencies
 │    └── src
 │        └── main
 │            ├── java
 │            │   └── [Java packages]
 │            └── resources
 │                └── [Images, templates, descriptors, etc.]
 │
 └── [module 2]
 │
 └── [module n]
 │
 ├── gradle
 │   └── [Gradle wrapper files]
 ├── gradlew // Invokes the Gradle wrapper to execute tasks
 ├── gradlew.bat
 ├── gradle.properties // Specifies the Liferay product version
 └── settings.gradle // Applies Gradle plugins
```


Liferay는 일반적으로 세 가지 종류의 모듈을 사용합니다.

1. **API** 모듈은 인터페이스를 정의합니다.

1. **구현** 모듈은 인터페이스를 구현하는 구체적인 클래스를 제공합니다.

1. **클라이언트** 모듈은 API를 사용합니다.

[Gogo Shell](./using-the-gogo-shell.md) 에서 사용자가 이름을 입력할 때 인사하는 간단한 명령을 개발하여 각각을 만드는 방법을 배웁니다.

![사용자를 맞이하는 Gogo 쉘 명령.](./module-projects/images/01.png)

여기에서 API를 만들고, 모듈 프로젝트의 일부를 배우고, 모듈을 배포하고, 런타임에 모듈을 검사합니다. 다음 두 자습서에서 구현 모듈과 클라이언트 모듈을 만듭니다.

예제 API 모듈 프로젝트 배포부터 시작합니다.

## 간단한 모듈 배포

예제 모듈은 인사말 생성을 위한 API를 정의합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. 예제를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/liferay-internals/fundamentals/liferay-k8s2.zip -O
    ```

    ```bash
    unzip liferay-k8s2.zip
    ```

1. 모듈 JAR을 빌드하십시오. 

    ```bash
    cd liferay-k8s2
    ```

    ```bash
    ./gradlew jar
    ```

    The JAR file is generated to the module's `build/libs` folder.

    ```
    k8s2-api/build/libs/com.acme.k8s2.api-1.0.0.jar
    ```

1. 모듈 JAR을 배포합니다. 

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

로그 메시지는 JAR을 처리하고 모듈을 시작하는 Liferay를 보여줍니다. 

    ```
    Processing com.acme.k8s2.api-1.0.0.jar
    STARTED com.acme.k8s2.api_1.0.0 [1152]
    ```

`STARTED` 메시지에는 모듈의 ID: `1152`이 포함됩니다.

1. [Gogo Shell](./using-the-gogo-shell.md)을 엽니다.

1. Gogo Shell 명령 필드에서 `lb` 을 사용하여 ID를 포함한 모듈 정보를 표시합니다. 가장 최근에 추가된 모듈이 마지막에 나타납니다. 모듈 이름의 키워드를 알고 있는 경우 `grep` 을 사용할 수 있습니다. 

    ```bash
    lb | grep -i "k8s2"
    ```

산출량: 

    ```
    1152|Active     |   15|Acme K8S2 API (1.0.0)|1.0.0
    ```

이 모듈의 ID는 `1152`입니다.

1. `b` 명령과 모듈 ID를 사용하여 모듈에 대한 자세한 정보를 표시합니다. 

    ```bash
    b 1152
    ```

산출량: 

    ```
    com.acme.k8s2.api_1.0.0 [1152]
    Id=1152, Status=ACTIVE      Data Root=[Liferay Home]/osgi/state/org.eclipse.osgi/1152/data
      "No registered services."
      No services in use.
      Exported packages
        com.acme.k8s2; version="1.0.0"[exported]
      No imported packages
      No fragment bundles
      No required bundles
    ```

모듈이 활성 상태이며 `com.acme.k8s2`이라는 패키지를 내보냅니다.

이제 모듈을 설치하고 활성화했으므로 작동 방식을 배울 수 있습니다.

## 모듈 구성 방법

* [빌드 인프라 설정](#set-up-the-build-infrastructure)
* [코드 작성](#write-code)
* [종속성 지정](#specify-dependencies)
* [메타데이터 지정](#specify-metadata)

### 빌드 인프라 설정

Liferay 모듈은 Gradle 빌드 인프라에서 개발됩니다. 다음 Gradle 파일은 프로젝트의 루트 폴더에 있습니다.

| 파일                  | 묘사                                                                                        |
|:------------------- |:----------------------------------------------------------------------------------------- |
| `gradle/`           | Gradle 래퍼를 포함합니다.                                                                         |
| `gradlew[.bat]`     | 작업을 실행하기 위해 Gradle 래퍼를 호출합니다.                                                             |
| `gradle.properties` | Liferay 제품 버전을 지정합니다.                                                                     |
| `settings.gradle`   | [Liferay Workspace](../../building-applications/tooling.md) 플러그인을 포함한 Gradle 플러그인을 적용합니다. |


예제 프로젝트의 `k8s2-api` 폴더와 같은 새 하위 폴더에 더 많은 모듈을 추가하거나 새 [Liferay Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)에서 만들 수 있습니다.

다음은 프로젝트 루트 컨텍스트의 `k8s2-api` 모듈 구조입니다.

```
[project root]
 └── k8s2-api
 │   ├── bnd.bnd
 │   ├── build.gradle
 │   └── src
 │       └── main
 │           └── java
 │               └── com/acme/k8s2
 │                   └── Greeter.java
 │
 └── [Gradle files]
```

`k8s2-api` 모듈 폴더에는 `bnd.bnd` 메타데이터 파일, `build.gradle` 스크립트 및 Java 코드가 포함되어 있습니다.

### 코드 작성

예제 모듈에는 `Greeter`이라는 인터페이스라는 하나의 Java 클래스만 있습니다.

```{literalinclude} ./module-projects/resources/liferay-k8s2.zip/k8s2-api/src/main/java/com/acme/k8s2/Greeter.java
:language: java
:lines: 5-10
```

[`@ProviderType`](https://docs.osgi.org/javadoc/osgi.annotation/7.0.0/org/osgi/annotation/versioning/ProviderType.html) 주석은 서비스 레지스트리에 인터페이스를 구현하는 모든 것이 인터페이스를 제공한다고 알려줍니다(예: `Greeter`). 인터페이스의 한 메서드인 `greet` 은 `String` 을 요청하고 아무 것도 반환하지 않습니다.

모듈의 `src/main/java` 폴더와 `src/main/resources` 폴더에 고유한 Java 코드와 리소스를 각각 추가합니다.

### 종속성 지정

`build.gradle` 파일은 모듈의 종속성을 지정합니다.

```{literalinclude} ./module-projects/resources/liferay-k8s2.zip/k8s2-api/build.gradle
:language: groovy
```

하나의 아티팩트인 Liferay 릴리스 API JAR에 따라 다릅니다. Liferay 제품 릴리스와 관련된 Liferay, Bnd 및 OSGi 아티팩트가 포함된 대형 JAR입니다.

`[project root]/gradle.properties` 파일에서 `liferay.workspace.product` 속성은 제품 릴리스를 지정합니다.

```properties
liferay.workspace.product=[$LIFERAY_LEARN_PORTAL_WORKSPACE$]
```

마지막으로 종속성 버전이 없습니다. 이는 Workspace가 릴리스와 관련된 Liferay 제품 API 버전을 적용하기 때문입니다.

```{note}
자세한 내용은 [종속성 구성](./configuring-dependencies.md)을 참조하세요.
```

### 메타데이터 지정

모듈 JAR의 `META-INF/MANIFEST.MF` 파일은 모듈을 설명합니다. 매니페스트에는 모듈이 내보내거나 가져오는 패키지와 모듈이 제공/요구하는 기능을 지정하는 매니페스트 헤더라는 속성이 포함되어 있습니다. 빌드 인프라가 Bnd를 제공하므로 모듈의 `bnd.bnd` 파일에 초기 헤더 몇 개만 지정하면 됩니다. Bnd는 모듈 검사를 기반으로 대부분의 다른 값을 생성합니다.

#### 초기 메타데이터

`bnd.bnd` 파일은 모듈을 설명하고 구성합니다.

```{literalinclude} ./module-projects/resources/liferay-k8s2.zip/k8s2-api/bnd.bnd
```

The module's name is *Acme K8S2 API*. Its symbolic name---a name that ensures uniqueness---is `com.acme.k8s2.api`. Its [semantic version](./semantic-versioning.md) is declared next. Lastly, the module [*exports*](./exporting-packages.md) the Java package `com.acme.k8s2`, making the package available to other modules. You confirmed the package export above when you executed the `b [bundle ID]` Gogo Shell command.

#### Generated Metadata

At build time, Bnd propagates metadata from the `bnd.bnd` file to the JAR file's `META-INF/MANIFEST.MF` and adds metadata based on its inspection.

Here's a `META-INF/MANIFEST.MF` file generated for the example module:

```properties
Manifest-Version: 1.0
Bnd-LastModified: 1598968383025
Bundle-ManifestVersion: 2
Bundle-Name: Acme K8S2 API
Bundle-SymbolicName: com.acme.k8s2.api
Bundle-Version: 1.0.0
Created-By: 1.8.0_252 (Oracle Corporation)
Export-Package: com.acme.k8s2;version="1.0.0"
Javac-Debug: on
Javac-Deprecation: off
Javac-Encoding: UTF-8
Require-Capability: osgi.ee;filter:="(&(osgi.ee=JavaSE)(version=1.8))"
Tool: Bnd-4.3.0.201909301554
```
Bnd는 `bnd.bnd` 파일의 모든 헤더를 전파하고 더 많은 헤더와 세부 정보를 추가했습니다. 예를 들어 내보낸 `com.acme.k8s2` 패키지의 기본 패키지 버전은 `1.0.0`입니다.

## 결론

그게 다야! 보시다시피 모듈 프로젝트는 일부 구성이 추가된 다른 Java 프로젝트와 동일합니다.

이제 모듈 프로젝트의 모양, 빌드 및 배포 방법, 런타임에 모듈을 검사하는 방법을 알게 되었습니다.

모듈은 `Greeter` API와 같은 API를 통해 서로의 기능을 활용합니다. Liferay는 OSGi 서비스를 사용하여 APIS를 정의, 구현 및 사용합니다. 다음으로 [OSGi 서비스로서의 API](./apis-as-osgi-services.md)는 OSGi 서비스를 사용하여 `Greeter` API를 *구현*하는 방법을 보여줍니다.

```{note}
모듈 수명 주기에 대한 자세한 내용은 [모듈 수명 주기](../architecture/module-lifecycle.md)를 참조하세요.
```

## 추가 정보

* [OSGi 서비스로서의 API](./apis-as-osgi-services.md)
* [OSGi 서비스 사용](./using-an-osgi-service.md)
* [종속성 구성](./configuring-dependencies.md)
* [패키지 가져오기](./importing-packages.md)
* [패키지 내보내기](./exporting-packages.md)
* [모듈 수명 주기](../architecture/module-lifecycle.md)
