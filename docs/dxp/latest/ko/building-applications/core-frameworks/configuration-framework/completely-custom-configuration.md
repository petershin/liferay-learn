# 완전 맞춤형 구성

구성 인터페이스를 생성하면 구성 [가 자동으로 생성](./setting-and-accessing-configurations.html#creating-the-configuration-interface). 그러나 경우에 따라 구성에 대해 완전히 사용자 정의된 UI를 원할 수도 있습니다. 예를 들어 Liferay의 구성 관리자를 사용하는 대신 프로그래밍 방식으로 구성을 처리할 계획입니다. 또는 완전히 사용자 지정 UI를 만드는 유연성을 원할 수도 있습니다. 방법은 다음과 같습니다.

## 예제 프로젝트 보기
```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Completely Custom Configuration](./liferay-u2g5.zip).

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-u2g5.zip -O
    ```

    ```bash
    unzip liferay-u2g5.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.u2g5.web_1.0.0 [1034]
    ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저에서 `https://localhost:8080`로 엽니다.

1. *제어판* &rarr; *구성* &rarr; *시스템 설정* &rarr; *타사*으로 이동합니다. *U2G5 구성*을 클릭합니다.

   ![시스템 설정에서 U2G5 구성으로 이동합니다.](./completely-custom-configuration/images/01.png)

   이 보기는 사용자 정의 JSP 파일에 의해 제공됩니다.

## 구성 인터페이스 만들기

구성 인터페이스에서 구성 가능한 속성을 정의합니다. 샘플 프로젝트에는 `fontColor`, `fontFamily`및 `fontSize`의 세 가지 구성 가능한 속성이 있습니다.

```{literalinclude} ./completely-custom-configuration/resources/liferay-u2g5.zip/u2g5-web/src/main/java/com/acme/u2g5/web/internal/configuration/U2G5WebConfiguration.java
:language: java
:lines: 7-24
```

`@ExtendedObjectClassDefinition` 주석에서 `generateUI` 은 `false`로 설정됩니다. 이렇게 하면 구성 UI가 자동 생성되지 않습니다.

```{note}
DXP 7.4 U51 또는 Portal 7.4 GA51 이전의 Liferay 버전에는 'ConfigurationBeanDeclaration'이 필요합니다. [이전 버전의 Liferay가 포함된 ConfigurationBeanDeclaration](./setting-and-accessing-configurations.md#configurationbeanddeclaration-with-previous-versions-of-liferay)을 참조하십시오.
```

## 구성 화면 구현

1. 클래스를 `@Component` 주석이 있는 `ConfigurationScreen` 의 구현으로 선언합니다.

    ```java
    @Component(service = ConfigurationScreen.class)
    ```

1. 범주 키, 구성 항목의 키 및 현지화된 이름을 설정합니다. 샘플 프로젝트에서 범주 키는 시스템 설정에서 `타사` 로 설정됩니다. 구성 이름의 문자열 값은 번들의 `Language.properties` 파일에 있는 언어 키로 설정됩니다.

    ```{literalinclude} ./completely-custom-configuration/resources/liferay-u2g5.zip/u2g5-web/src/main/java/com/acme/u2g5/web/internal/configuration/admin/display/U2G5ConfigurationScreen.java
    :dedent: 1
    :language: java
    :lines: 24-40
    ```

1. 이 예에서 구성 범위는 `system`로 설정됩니다. 자세한 내용은 [범위 지정 구성](./scoping-configurations.md)을 참조하십시오.

    ```{literalinclude} ./completely-custom-configuration/resources/liferay-u2g5.zip/u2g5-web/src/main/java/com/acme/u2g5/web/internal/configuration/admin/display/U2G5ConfigurationScreen.java
    :dedent: 1
    :language: java
    :lines: 42-45
    ```

1. `render()` 메서드는 `ConfigurationProvider` 을 사용하여 구성을 가져옵니다. 서블릿 컨텍스트는 요청 디스패처에 대한 액세스를 제공하여 사용자 정의 JSP가 구성을 읽을 수 있도록 합니다.

    ```{literalinclude} ./completely-custom-configuration/resources/liferay-u2g5.zip/u2g5-web/src/main/java/com/acme/u2g5/web/internal/configuration/admin/display/U2G5ConfigurationScreen.java
    :dedent: 1
    :language: java
    :lines: 47-67
    ```

1. `@Reference` 주석을 사용하여 모듈의 기호 이름을 정의하십시오.

    ```java
    @Reference(
        target = "(osgi.web.symbolicname=com.acme.u2g5.web)"
    )
    ```

## Web-ContextPath 추가

`bnd.bnd` 파일에서 번들의 `Web-ContextPath` 을 지정합니다. 예를 들어 샘플 프로젝트의 Bnd 파일에는 `Web-ContextPath: /u2g5-web` 이 있습니다. Configuration Screen 파일에 `ServletContext` 객체를 등록하는 것입니다. 서블릿 컨텍스트는 포틀릿에 대해 자동으로 생성되지만 이 샘플에는 포틀릿이 없으므로 이 줄을 Bnd 파일에 추가해야 합니다.

## 사용자 정의 JSP 생성

1. 구성 인터페이스를 JSP로 가져옵니다.

    ```markup
    <%@ page import="com.acme.u2g5.web.internal.configuration.U2G5WebConfiguration" %>
    ```

1. 요청 개체에서 구성 값에 액세스합니다.

    ```jsp
    <%
    U2G5WebConfiguration u2g5WebConfiguration = (U2G5WebConfiguration)request.getAttribute(U2G5WebConfiguration.class.getName());
    %>
    ```

1. 속성 `fontColor()`, `fontFamily()`, `fontSize()` 이제 JSP에서 사용할 수 있습니다.

이 샘플 프로젝트는 `ConfigurationScreen` 을 사용하여 사용자 정의 JSP에서 구성 값을 읽고 표시하는 방법에 대한 기본적인 예를 보여줍니다. 애플리케이션에서 고유한 코드를 작성하고 필요에 맞게 완전히 사용자 지정 구성 UI를 만듭니다.
