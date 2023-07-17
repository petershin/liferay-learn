# OSGi 및 모듈성

모듈성은 특히 팀으로서 소프트웨어 작성을 재미있게 만듭니다! 다음은 Liferay의 모듈식 개발에 대한 몇 가지 이점입니다.

* Liferay의 런타임 프레임워크는 가볍고 빠르며 안전합니다.
* 프레임워크는 [OSGi](https://www.osgi.org/resources/what-is-osgi/) 표준을 사용합니다. 다른 프로젝트에서 OSGi를 사용한 경험이 있는 경우 기존 지식을 적용할 수 있습니다.
* 모듈은 서비스 레지스트리에 서비스를 게시하고 서비스 레지스트리에서 서비스를 사용합니다. 서비스 계약은 서비스 공급자와 소비자로부터 느슨하게 연결되며 레지스트리는 계약을 자동으로 관리합니다.
* 모듈의 종속성은 컨테이너에 의해 자동으로 동적으로 관리됩니다(재시작 필요 없음).
* 컨테이너는 [모듈 수명 주기](./module-lifecycle.md) 을 동적으로 관리합니다. Liferay가 실행되는 동안 모듈을 설치, 시작, 업데이트, 중지 및 제거할 수 있으므로 배포가 간단합니다.
* 패키지가 명시적으로 [내보내기](../fundamentals/exporting-packages.md) 인 모듈의 클래스만 공개적으로 표시됩니다. OSGi는 기본적으로 다른 모든 클래스를 숨깁니다.
* 모듈 및 패키지는 [의미상 버전](../fundamentals/semantic-versioning.md) 이며 다른 패키지의 특정 버전에 대한 종속성을 선언합니다. 이를 통해 동일한 패키지의 서로 다른 버전에 의존하는 두 개의 애플리케이션이 각각 고유한 패키지 버전에 의존할 수 있습니다.
* 팀 구성원은 모듈을 병렬로 개발, 테스트 및 개선할 수 있습니다.
* 기존 개발자 도구 및 환경을 사용하여 모듈을 개발할 수 있습니다.

OSGi를 사용한 모듈식 소프트웨어 개발에는 많은 이점이 있으며 여기서는 표면만 긁어볼 수 있습니다. 일단 모듈 개발을 시작하면 다른 방식으로 개발하기가 어려울 수 있습니다.

Liferay는 일반적으로 세 가지 종류의 모듈을 사용합니다.

1. **API** 모듈은 인터페이스를 정의합니다.

1. **구현** 모듈은 인터페이스를 구현하는 구체적인 클래스를 제공합니다.

1. **클라이언트** 모듈은 API를 사용합니다.

[Gogo Shell](../fundamentals/using-the-gogo-shell.md) 에서 사용자가 이름을 입력할 때 인사하는 간단한 명령을 개발하여 각각을 만드는 방법을 배웁니다.

![사용자를 맞이하는 Gogo 쉘 명령.](./osgi-and-modularity/images/01.png)

모듈 프로젝트가 어떤 모습인지 확인하고 Liferay의 모듈식 개발 기능이 작동하는 모습을 볼 시간입니다.

## Gogo 셸 명령 예제 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 예제를 배포합니다.

1. `liferay-r9u2.zip`을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/architecture/liferay-r9u2.zip -O
    ```

    ```bash
    unzip liferay-r9u2.zip
    ```

1. 예제 모듈을 배포합니다.

    ```bash
    cd liferay-r9u2.zip
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.r9u2.api_1.0.0
    STARTED com.acme.r9u2.impl_1.0.0
    STARTED com.acme.r9u2.osgi.commands_1.0.0
    ```

1. [Gogo Shell](../fundamentals/using-the-gogo-shell.md)을 엽니다.

1. Gogo Shell 명령 필드에 `r9u2:greet` 명령을 입력하여 인사말을 생성합니다.

    ```groovy
    r9u2:greet "Captain Kirk"
    ```

1. 출력을 확인합니다.

    ```
    Hello Captain Kirk!
    ```

예제의 클라이언트 모듈은 API 및 구현 모듈을 활용하여 `r9u2:greet` Gogo Shell 명령에서 반환된 콘텐츠를 생성합니다. 다음에 각 모듈을 검사합니다.

## API

API 모듈이 먼저입니다. 공급자가 구현하고 소비자가 사용하는 계약을 정의합니다. 구조는 다음과 같습니다.

```
[project root]
 └── r9u2-api
 │   ├── bnd.bnd
 │   ├── build.gradle
 │   └── src
 │       └── main
 │           └── java
 │               └── com/acme/r9u2
 │                   └── Greeter.java
 │
 └── [Gradle files]
```

`r9u2-api` 모듈 폴더에는 `bnd.bnd` 메타데이터 파일, `build.gradle` 스크립트 및 Java 코드가 포함되어 있습니다.

아주 간단하죠? Java 소스 파일 외에 Gradle 빌드 스크립트(원하는 모든 빌드 시스템을 사용할 수 있음)와 `bnd.bnd`이라는 구성 파일의 두 파일만 있습니다. `bnd.bnd` 파일은 모듈을 설명하고 구성합니다.
```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-api/bnd.bnd
```

The `build.gradle` file specifies the module's dependencies.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-api/build.gradle
:language: groovy
```

하나의 아티팩트인 Liferay 릴리스 API JAR에 따라 다릅니다. Liferay 제품 릴리스와 관련된 Liferay, Bnd 및 OSGi 아티팩트가 포함된 대형 JAR입니다.

모듈의 이름은 **Acme R9U2 API** 입니다. 그것의 상징적인 이름---유일성을 보장하는 이름---은 `com.acme.r9u2.api`입니다. 다음으로 시맨틱 버전이 선언되고 패키지는 **export** 이며 이는 다른 모듈에서 사용할 수 있음을 의미합니다. 이 모듈의 패키지는 다른 모듈이 구현할 수 있는 API일 뿐입니다.

마지막으로 Java 클래스가 있는데 이 경우에는 인터페이스입니다.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-api/src/main/java/com/acme/r9u2/Greeter.java
:language: java
:lines: 5-10
```

인터페이스의 `@ProviderType` 주석은 인터페이스를 구현하는 모든 것이 공급자임을 서비스 레지스트리에 알려줍니다. 인터페이스의 한 메서드는 `문자열` 을 요청하고 아무 것도 반환하지 않습니다.

그게 다야! 보시다시피 모듈 생성은 다른 Java 프로젝트 생성과 크게 다르지 않습니다.

## 구현

인터페이스는 API만 정의합니다. 무언가를 하려면 구현해야 합니다. 이것이 구현(또는 제공자) 모듈의 목적입니다. Greeter API의 구현 모듈은 다음과 같습니다.

```
[project root]
 └── r9u2-impl
 │   ├── bnd.bnd
 │   ├── build.gradle
 │   └── src
 │       └── main
 │           └── java
 │               └── com/acme/r9u2/internal
 │                   └── R9U2Greeter.java
 │
 └── [Gradle files]
```

이는 API 모듈과 동일한 구조(빌드 스크립트, `bnd.bnd` 구성 파일 및 구현 클래스)를 가집니다. 유일한 차이점은 파일 내용입니다. `bnd.bnd` 파일은 약간 다릅니다.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-impl/bnd.bnd
```

번들 이름, 기호 이름 및 버전은 모두 API와 유사하게 설정됩니다.

마지막으로 `Export-Package` 선언이 없습니다. 클라이언트(프로젝트의 세 번째 모듈)는 API를 사용하기를 원할 뿐입니다. API가 반환해야 하는 것을 반환하는 한 클라이언트는 구현이 어떻게 작동하는지 신경 쓰지 않습니다. 그러면 클라이언트는 API에 대한 종속성을 선언하기만 하면 됩니다. 서비스 레지스트리는 런타임에 적절한 구현을 삽입합니다.

아주 멋지죠?

이제 남은 것은 구현을 제공하는 클래스뿐입니다.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-impl/src/main/java/com/acme/r9u2/internal/R9U2Greeter.java
:language: java
:lines: 7-15
```

예제 `greet` 메소드는 주어진 이름을 사용하여 열광적인 인사말을 인쇄합니다.

다음은 구현 모듈 `build.gradle` 파일입니다.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-impl/build.gradle
:language: groovy
```

모듈의 `Greeter` 클래스가 필요하기 때문에 `r9u2-api` 모듈 프로젝트에 대한 컴파일 시간 종속성을 포함합니다.

이것이 구현 모듈의 전부입니다.

## 고객

소비자 또는 클라이언트는 API 모듈이 정의하고 구현 모듈이 구현하는 API를 사용합니다. Liferay에는 다양한 종류의 소비자 모듈이 있습니다. [포틀릿](../../building-applications/developing-a-java-web-application/reference/portlets.md) 은 가장 일반적인 소비자 모듈 유형이지만 그 자체로 주제이기 때문에 이 예제는 Apache Felix Gogo 셸에 대한 명령을 만들어 간단하게 유지합니다. 물론 소비자는 다양한 API를 사용하여 기능을 제공할 수 있습니다.

소비자 모듈은 다른 모듈 유형과 동일한 구조를 가집니다.

```
[project root]
 └── r9u2-osgi-commands
 │   ├── bnd.bnd
 │   ├── build.gradle
 │   └── src
 │       └── main
 │           └── java
 │               └── com/acme/r9u2/internal/osgi/commands
 │                   └── R9U2OSGiCommands.java
 │
 └── [Gradle files]
```

다시 말하지만 빌드 스크립트, `bnd.bnd` 파일 및 Java 클래스가 있습니다. 이 모듈의 `bnd.bnd` 파일은 공급자의 파일과 거의 동일합니다.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-osgi-commands/bnd.bnd
```

여기에는 새로운 것이 없습니다. 공급자에 대해 선언한 것과 동일한 항목을 선언합니다.

클라이언트 모듈은 API 모듈과 `release.portal.api` 아티팩트에 의존합니다. 다음은 `r9u2-osgi-commands` 모듈의 `build.gradle` 파일입니다.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-osgi-commands/build.gradle
:language: groovy
```

Java 클래스가 조금 더 진행됩니다.

```{literalinclude} ./osgi-and-modularity/resources/liferay-r9u2.zip/r9u2-osgi-commands/src/main/java/com/acme/r9u2/internal/osgi/commands/R9U2OSGiCommands.java
:language: java
:lines: 8-21
```

위의 메서드는 `Greeter`의 `greet` 메서드를 호출합니다. `com.acme.r9u2.Greeter` 구현 모듈이 등록하는 OSGi 서비스 유형입니다. 레지스트리에서 `Greeter` 서비스를 받으려면 `Greeter` 필드 `_greeter`에 [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 주석을 추가해야 합니다.

`R9U2OSGiCommands` 클래스는 자체 유형의 OSGi 서비스를 제공합니다. 두 속성은 `r9u2`범위에서 `greet` 이라는 명령 함수로 Gogo 셸 명령을 정의합니다. 배포된 `R9U2OSGiCommands` 구성 요소는 `문자열` 입력으로 사용하는 Gogo Shell 명령 `r9u2:greet` 을 제공합니다.

이 가장 기본적인 예제는 모듈 기반 개발이 쉽고 간단하다는 것을 분명히 해야 합니다. API-공급자-소비자 계약은 느슨한 결합을 촉진하여 소프트웨어를 쉽게 관리, 향상 및 지원할 수 있도록 합니다.

## 일반적인 Liferay 애플리케이션

Liferay 소스의 일반적인 애플리케이션을 보면 일반적으로 최소 4개의 모듈을 찾을 수 있습니다.

* API 모듈
* 서비스(제공자) 모듈
* 테스트 모듈
* 웹(소비자) 모듈

이것은 사용자가 댓글, 블로그 또는 기타 응용 프로그램에서 `@username` 명명법을 사용하여 다른 사용자를 언급할 수 있는 언급 응용 프로그램과 같은 일부 작은 응용 프로그램에서 찾을 수 있는 것입니다. 문서 및 미디어 라이브러리와 같은 더 큰 응용 프로그램에는 더 많은 모듈이 있습니다. 문서 및 미디어 라이브러리의 경우 서로 다른 문서 스토리지 백엔드에 대한 별도의 모듈이 있습니다. Wiki의 경우 다른 Wiki 엔진에 대한 별도의 모듈이 있습니다.

기능 변형을 모듈로 캡슐화하면 확장성이 향상됩니다. Liferay가 아직 지원하지 않는 문서 스토리지 백엔드가 있는 경우 모듈을 개발하여 솔루션에 대한 Liferay의 문서 스토리지 API를 구현하고 Liferay의 문서 및 미디어 라이브러리를 확장할 수 있습니다. Liferay의 위키가 제공하는 것보다 더 마음에 드는 Wiki 방언이 있는 경우 해당 모듈을 작성하고 Liferay의 위키를 확장할 수 있습니다.

당신은 아직 흥분? 개발을 시작할 준비가 되셨습니까? 다음은 자세히 알아볼 수 있는 몇 가지 리소스입니다.

## 관련 항목

* [OSGi 얼라이언스](https://www.osgi.org/)
* [OSGi EnRoute에서 OSGi 시작하기](https://enroute.osgi.org/)
* [애플리케이션 구축](../../building-applications/developing-a-java-web-application.md)
* [개발자 도구 개요](../../building-applications/tooling/developer-tools-overview.md)
* [Docker 이미지로 시작하기](../../getting-started/starting-with-a-docker-image.md)
