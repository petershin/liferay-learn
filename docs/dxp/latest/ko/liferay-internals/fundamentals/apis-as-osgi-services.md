# OSGi 서비스로서의 API

[모듈](./module-projects.md) 이 무엇이고 배포 방법을 배운 후에는 모듈을 사용하여 API를 정의하고 구현할 수 있습니다. Liferay API는 Java 인터페이스에 의해 정의되고 구체적인 Java 클래스에 의해 구현되는 [OSGi 서비스](https://enroute.osgi.org/) 입니다.

Liferay는 API, 구현 및 클라이언트를 구성 요소로 노출합니다. [OSGi 선언적 서비스](https://enroute.osgi.org/FAQ/300-declarative-services.html) (DS) 주석은 구성 요소와 해당 관계를 정의합니다.

* [`@ProviderType`](https://docs.osgi.org/javadoc/osgi.annotation/7.0.0/org/osgi/annotation/versioning/ProviderType.html) 구성 요소가 제공(구현)하거나 사용할 수 있는 인터페이스를 정의합니다.
* [`@Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 클래스를 구성 요소로 선언하여 특정 기능을 제공합니다.
* [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 다른 컴포넌트를 클래스 멤버(일반적으로 필드)에 연결합니다.

API 및 구현 문제를 다른 모듈로 분리할 수 있습니다.

* **API** 모듈 **는 Java 인터페이스를 사용하여** 기능을 정의합니다. 모듈은 인터페이스 패키지를 내보냅니다.
* **구현** 모듈 **는 구체적인 Java 클래스를 사용하여** 기능을 제공합니다.

여기에서 간단한 인사 OSGi 서비스를 생성하는 API 및 구현 모듈을 배포합니다. 또한 구현 모듈과 해당 JAR을 검사하여 구현이 인사 서비스 기능을 제공하는 방법을 알아봅니다. 다음 자습서에서는 UI에서 호출할 수 있는 부분인 클라이언트를 만듭니다.

## 간단한 API 배포 및 구현
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to start the example modules:

1. Download and unzip `liferay-p9g2.zip`.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/liferay-internals/fundamentals/liferay-p9g2.zip -O
    ```

    ```bash
    unzip liferay-p9g2.zip
    ```

1. 프로젝트 루트 폴더에서 모듈을 배포합니다.

    ```bash
    cd liferay-p9g2
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Docker 컨테이너 콘솔에서 모듈 시작을 확인합니다.

    ```
    STARTED com.acme.p9g2.api_1.0.0
    STARTED com.acme.p9g2.impl_1.0.0
    ```

1. `http://localhost:8080` 로 이동하여 로그인합니다.

1. [Gogo Shell](./using-the-gogo-shell.md)로 이동합니다.

1. `lb` Gogo Shell 명령을 사용하여 모듈 ID를 가져옵니다.

    ```bash
    g! lb | grep -i "Acme P9G2"
    ```

    산출량:

    ```
    1150|Active     |   15|Acme P9G2 API (1.0.0)|1.0.0
    1151|Active     |   15|Acme P9G2 Implementation (1.0.0)|1.0.0
    ```

1. 다음 명령을 실행하여 구현 모듈 서비스 기능을 나열하고 번호를 모듈의 ID로 바꿉니다.

    ```bash
    g! inspect capability service 1195
    ```

    산출량:

    ```
    com.acme.p9g2.impl_1.0.0 [1151] provides:
    -----------------------------------------
    service; com.acme.p9g2.Greeter with properties:
       service.id = 22933
       service.bundleid = 1151
       service.scope = bundle
       component.name = com.acme.p9g2.internal.P9G2Greeter
       component.id = 8462
    ```

Acme P9G2 구현 모듈은 하나의 서비스인 `com.acme.p9g2.Greeter`을 제공합니다. `component.name` 속성은 모듈의 `com.acme.p9g2.internal.P9G2Greeter` 구성 요소가 서비스를 구현함을 나타냅니다.

`P9G2Greeter` 구성 요소가 `Greeter` 서비스를 제공하는지 확인했습니다.

다음으로 API 모듈이 인사말 기능을 정의하고 구현 모듈이 인사말 기능을 OSGi 서비스로 제공하는 방법을 학습합니다. API 작성부터 시작하십시오.

## API 만들기

API는 단 두 단계로 생성됩니다.

* [기능 정의](#define-the-capability)
* [인터페이스 패키지 내보내기](#export-the-interface-package)

### 기능 정의

예제 API 모듈 `Greeter` 클래스는 Java 인터페이스입니다.

```{literalinclude} ./apis-as-osgi-services/resources/liferay-p9g2.zip/p9g2-api/src/main/java/com/acme/p9g2/Greeter.java
:language: java
:lines: 5-6
```

[`@ProviderType`](https://docs.osgi.org/javadoc/osgi.annotation/7.0.0/org/osgi/annotation/versioning/ProviderType.html) 주석은 `Greeter` 를 구성 요소가 구현하거나 사용할 수 있는 유형으로 등록합니다.

`welcome` 메서드는 이름 `문자열` 을 입력으로 사용합니다.

```{literalinclude} ./apis-as-osgi-services/resources/liferay-p9g2.zip/p9g2-api/src/main/java/com/acme/p9g2/Greeter.java
:dedent: 1
:language: java
:lines: 8
```

`Greeter` 기능이 정의됩니다.

### 인터페이스 패키지 내보내기

API 모듈 `bnd.bnd` 파일은 모듈을 설명하고 `com.acme.p9g2` 인터페이스 패키지를 내보냅니다.
```{literalinclude} ./apis-as-osgi-services/resources/liferay-p9g2.zip/p9g2-api/bnd.bnd
```

The [package export](./exporting-packages.md) shares the `Greeter` interface with other modules.

The `Greeter` service type is available to implement and use.

## Create the Implementation

The example implementation module contains a concrete Java class that provides the `Greeter` capability. Here are the implementation steps.

* [Add the Component Annotion Class](#add-the-component-annotation)
* [Implement the Interface](#implement-the-interface)
* [Add a Dependency on the API](#add-a-dependency-on-the-api)
* [Examine the Module JAR](#examine-the-module-jar)

### Add the Component Annotation

The `P9G2Greeter` class implements the `Greeter` interface:

```{literalinclude} ./apis-as-osgi-services/resources/liferay-p9g2.zip/p9g2-impl/src/main/java/com/acme/p9g2/internal/P9G2Greeter.java
:language: java
:lines: 7-8
```

[`@Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 주석과 해당 `service = Greeter.class` 속성은 `P9G2Greeter` 클래스를 `Greeter` 서비스 공급자로 만듭니다.

### 인터페이스 구현

`Greeter` 인터페이스는 `void` 반환 값을 사용하여 메서드 `greet(String)` 을 정의합니다.

```{literalinclude} ./apis-as-osgi-services/resources/liferay-p9g2.zip/p9g2-impl/src/main/java/com/acme/p9g2/internal/P9G2Greeter.java
:dedent: 1
:language: java
:lines: 10-13
```

예제 `greet` 메소드는 주어진 이름을 사용하여 열광적인 인사말을 인쇄합니다.

### API에 종속성 추가

다음은 구현 모듈 `build.gradle` 파일입니다.

```{literalinclude} ./apis-as-osgi-services/resources/liferay-p9g2.zip/p9g2-impl/build.gradle
:language: groovy
```

모듈의 `Greeter` 클래스가 필요하기 때문에 `p9g2-api` 모듈 프로젝트에 대한 컴파일 시간 종속성을 포함합니다.

### 모듈 JAR 검사

`p9g2-impl/build/libs/com.acme.p9g2.impl-1.0.0.jar` 구현 모듈 JAR을 빌드할 때 [Bnd](http://bnd.bndtools.org/) 은 JAR의 `/META-INF/MANIFEST.MF` 파일을 생성했습니다.

Bnd가 매니페스트에서 생성하는 주요 서비스 관련 헤더는 다음과 같습니다.

```properties
Import-Package: com.acme.p9g2;version="[1.0,2)"
```

[`Import-Package`](./importing-packages.md) 헤더는 `Greeter` 서비스 정의가 포함된 API 모듈의 공개 패키지를 가져옵니다.

```properties
Provide-Capability: osgi.service;objectClass:List<String>="com.acme.p9
 g2.Greeter";uses:="com.acme.p9g2"
```

`Provide-Capability` 헤더는 `P9G2Greeter` 컴포넌트 서비스를 구성합니다.

```properties
Service-Component: OSGI-INF/com.acme.p9g2.internal.P9G2Greeter.xml
```

`Service-Component` 헤더는 모듈의 각 서비스 구성 요소에 대한 구성 파일(`.xml`)을 나열합니다.

모듈을 배포할 때 서비스 구성 요소 런타임은 `P9G2Greeter` 서비스 구성 요소를 `Greeter` 서비스를 제공하는 것으로 등록했습니다.

## 결론

'Greeter'라는 서비스 기능을 **정의** 하고 이를 'P9G2Greeter'라는 서비스 구성요소에 **제공** 했습니다. '그리터' 서비스가 진행됩니다. 클라이언트는 서비스에 어떻게 액세스하고 사용합니까? [OSGi 서비스 사용](./using-an-osgi-service.md)에 설명되어 있습니다.

## 추가 정보

* [Gogo 셸 명령](./using-the-gogo-shell/gogo-shell-commands.md)
* [패키지 내보내기](./exporting-packages.md)
* [패키지 가져오기](./importing-packages.md)
* [종속성 구성](./configuring-dependencies.md)
* [OSGi EnRoute에서 OSGi 시작하기](https://enroute.osgi.org/)
* [선언적 서비스](https://enroute.osgi.org/FAQ/300-declarative-services.html)
* [OSGi 얼라이언스](https://www.osgi.org/)