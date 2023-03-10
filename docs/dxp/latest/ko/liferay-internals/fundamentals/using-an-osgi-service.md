# OSGi 서비스 사용

Liferay API는 OSGi 서비스로 쉽게 사용할 수 있습니다. 다음과 같이 해당 서비스 유형의 필드를 만들고 필드에 [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 주석을 달아 서비스에 액세스할 수 있습니다.

```java
@Reference
BlogsEntryService _blogsEntryService;
```

위의 `_blogsEntryService` 필드는 [`BlogsEntryService`](https://docs.liferay.com/ce/apps/blogs/latest/javadocs/com/liferay/blogs/service/BlogsEntryService.html) OSGi 서비스에 액세스합니다.

모든 선언적 서비스 구성 요소( [`@Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 주석이 달린 클래스)는 이러한 방식으로 OSGi 서비스에 액세스할 수 있습니다. 런타임 프레임워크는 구성 요소의 `@Reference`주석 필드에 해당 서비스 유형을 삽입합니다.

다음 예제는 `Greeter`이라는 OSGi 서비스를 사용하는 방법을 보여줍니다. 세 개의 모듈은 OSGi 서비스에서 사용되는 **API-Provider-Consumer** 패턴을 보여줍니다.

* **API** 모듈은 `Greeter` 서비스 유형을 정의합니다.
* 구현 모듈 **은** `Greeter` 서비스를 제공합니다.
* 예제 모듈 **은** `Greeter` 서비스를 사용합니다.

예제 모듈 클래스는 `Greeter` 서비스를 사용하여 개인화된 인사말을 반환하는 Gogo Shell 명령을 생성합니다. 이 예제를 OSGi 서비스의 "Hello World"로 간주하십시오.

![예제 모듈은 Gogo Shell에 대한 greetinger 명령을 제공합니다.](./using-an-osgi-service/images/01.png)

모든 Java 클래스에서 OSGi 서비스를 사용할 수 있습니다.

Liferay 서비스 Javadoc은 [여기](https://learn.liferay.com/reference/latest/en/dxp.html) 에서 사용할 수 있습니다.

```{note}
OSGi 서비스를 만드는 방법에 대한 지침은 [OSGi 서비스로서의 API](./apis-as-osgi-services.md)를 참조하세요.
```

## Gogo 셸 명령 예제 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. `liferay-j1h1.zip`을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/liferay-internals/fundamentals/liferay-j1h1.zip -O
    ```

    ```bash
    unzip liferay-j1h1.zip
    ```

1. 예제 모듈을 배포합니다.

    ```bash
    cd liferay-j1h1
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.j1h1.api_1.0.0
    STARTED com.acme.j1h1.impl_1.0.0
    STARTED com.acme.j1h1.osgi.commands_1.0.0
    ```

1. [Gogo Shell](./using-the-gogo-shell.md)을 엽니다.

1. Gogo Shell 명령 필드에 `j1h1:greet` 명령을 입력하여 인사말을 생성합니다.

    ```groovy
    j1h1:greet "Captain Kirk"
    ```

1. 출력을 확인합니다.

    ```
    Hello Captain Kirk!
    ```

예제 모듈은 API 및 구현 모듈을 활용하여 `j1h1:greet` Gogo Shell 명령에서 반환된 콘텐츠를 생성합니다.

## OSGi 서비스 사용 방법

* [비즈니스 로직 작성](#write-your-business-logic)
* [외부 서비스 참조에 주석 달기](#annotate-external-service-references)
* [클래스를 구성 요소로 만들기](#make-your-class-a-component)

### 비즈니스 로직 작성

클래스에서 필요한 OSGi 서비스를 사용하여 비즈니스 로직을 구현하십시오.

1. 서비스를 가져옵니다.

    ```java
    import com.acme.j1h1.Greeter;
    ```

1. 서비스를 이용하세요.

    ```java
    public void greet(String name) {
        _greeter.greet(name);
    }

    private Greeter _greeter;
    ```

위의 메서드는 `Greeter`의 `greet` 메서드를 호출합니다. `com.acme.j1h1.Greeter` 은 구현 모듈이 등록하는 OSGi 서비스 유형입니다. 클래스는 OSGi 서비스 레지스트리에서 `Greeter` 인스턴스를 가져와야 합니다.

### 외부 서비스 참조에 주석 달기

레지스트리에서 OSGi 서비스를 가져오려면 해당 서비스 유형의 필드에 [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 주석을 추가해야 합니다. 서비스 필드에 `@Reference` 을 추가합니다.

```{literalinclude} ./using-an-osgi-service/resources/liferay-j1h1.zip/j1h1-osgi-commands/src/main/java/com/acme/j1h1/internal/osgi/commands/J1H1OSGiCommands.java
:dedent: 1
:language: java
:lines: 18-19
```

`J1H1OSGiCommands` 클래스에는 `_greeter`라는 위의 비공개 `Greeter` 필드가 있습니다. `@Reference` 주석은 레지스트리에서 `Greeter` 서비스로 필드를 주입하도록 OSGi 런타임에 지시합니다. `J1H1Greeter` 이 레지스트리에서 가장 잘 일치하는 `Greeter` 서비스 구성 요소인 경우(이 예에서는 유일한 일치 항목임) 런타임은 `_greeter` 를 `J1H1Greeter`과 함께 주입합니다.

### 클래스를 구성 요소로 만들기

선언적 서비스 구성 요소만 `@Reference` 주석을 사용할 수 있습니다. 클래스에 `@Component` 주석을 추가하고 `서비스` 속성을 사용하여 컴포넌트가 특정 서비스를 구현하는 것으로 선언합니다.

```{literalinclude} ./using-an-osgi-service/resources/liferay-j1h1.zip/j1h1-osgi-commands/src/main/java/com/acme/j1h1/internal/osgi/commands/J1H1OSGiCommands.java
:language: java
:lines: 8-12
```

`J1H1OSGiCommands` 클래스는 자체 유형의 OSGi 서비스를 제공합니다. 두 속성은 `j1h1`범위에서 `greet` 이라는 명령 함수를 사용하여 Gogo 셸 명령을 정의합니다. 배포된 `J1H1OSGiCommands` 구성 요소는 `문자열` 를 입력으로 사용하는 Gogo Shell 명령 `j1h1:greet` 을 제공합니다.

### API에 종속성 추가

소비자 모듈은 API에 따라 다릅니다. `build.gradle` 파일에서 종속 항목에 API를 추가합니다. 다음은 `j1h1-osgi-commands` 모듈의 `build.gradle` 파일입니다.

```{literalinclude} ./using-an-osgi-service/resources/liferay-j1h1.zip/j1h1-osgi-commands/build.gradle
:language: groovy
```

`release.portal.api` 아티팩트는 모듈이 현재 Liferay 제품 릴리스에서 필요로 하는 Liferay, Bnd 및 OSGi 서비스를 제공합니다. `[project root]/gradle.properties` 파일의 `liferay.workspace.product` 은 릴리스를 지정합니다.

로컬 프로젝트 `j1h1-api` 은 `Greeter` 서비스를 제공하므로 `j1h1-osgi-commands` 는 이를 아티팩트가 아닌 프로젝트로 사용할 수 있습니다. [외부 아티팩트에 종속성](./configuring-dependencies/specifying-dependencies.md) 을 지정하는 것도 쉽습니다.

## 결론

API와 Impl 모듈은 각각 `Greeter` 서비스를 정의하고 제공했습니다. 예제 `j1h1-osgi-commands` 모듈은 서비스를 사용하여 간단한 Gogo Shell 명령을 생성합니다. API-공급자-소비자 계약은 느슨한 결합을 촉진하여 소프트웨어를 쉽게 관리, 향상 및 지원할 수 있도록 합니다.

이제 인접 프로젝트의 OSGi 서비스 사용에 익숙해졌으므로 외부 아티팩트의 OSGi 서비스 사용을 탐색할 수 있습니다. [종속성 구성](./configuring-dependencies.md) 은 모듈을 찾고 종속성으로 구성하는 방법을 보여줍니다.

## 추가 정보

* [패키지 가져오기](./importing-packages.md)
* [패키지 내보내기](./exporting-packages.md)
* [시맨틱 버전 관리](./semantic-versioning.md)
* [종속성 구성](./configuring-dependencies.md)
