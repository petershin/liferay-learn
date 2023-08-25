# 구성 양식 렌더러

[구성 인터페이스](./setting-and-accessing-configurations.md#creating-the-configuration-interface)를 생성하면 구성 UI가 자동으로 생성됩니다. 그러나 어떤 경우에는 UI의 모양과 느낌을 사용자 정의하고 싶을 수도 있습니다. 예를 들어 회사의 디자인 미학에 맞게 UI를 수정하고 싶다고 가정해 보겠습니다. `ConfigurationFormRenderer` 구현으로 이를 수행하는 방법은 다음과 같습니다.

## 예제 프로젝트 보기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [구성 양식 렌더러](./liferay-b7r2.zip)를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-b7r2.zip -O
   ```

   ```bash
   unzip liferay-b7r2.zip
   ```

1. 모듈 루트에서 빌드 및 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   이 명령은 배포된 jars를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
   ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.b7r2.web_1.0.0 [1034]
   ```

1. 예제 모듈이 작동하는지 확인합니다. 브라우저를 열어 `https://localhost:8080`으로 이동합니다.

1. *제어판* &rarr; *구성* &rarr; *시스템 설정* &rarr; *타사*로 이동합니다. *B7R2 구성*을 클릭합니다.

   ![시스템 설정에서 U2G5 구성으로 이동합니다.](./configuration-form-renderer/images/01.png)

   이 보기는 사용자 지정 JSP 파일로 전달됩니다.

## 구성 인터페이스 만들기

구성 인터페이스에서 구성 가능한 속성을 정의합니다. 샘플 프로젝트에는 구성 가능한 속성이 하나 있습니다: `b7r2Color`.

```{literalinclude} ./configuration-form-renderer/resources/liferay-b7r2.zip/b7r2-web/src/main/java/com/acme/b7r2/web/internal/configuration/B7R2WebConfiguration.java
:language: java
:lines: 9-14
```

`ConfigurationFormRenderer`를 사용하는 경우 `generateUI` 어노테이션은 [생성된 UI](./hiding-the-configuration-ui.md)를 숨기는 데 필요하지 않습니다.

```{note}
DXP 7.4 U51 또는 Portal 7.4 GA51 이전 Liferay 버전에는 `ConfigurationBeanDeclaration`이 필요합니다. 이전 버전의 Liferay를 사용한 구성 빈 선언](./설정-및-액세스-구성.md#configurationbeandeclaration-with-previous-versions-of-liferay)을 참조하세요.
```

## 구성 양식 렌더러 구현하기

1. `ConfigurationFormRenderer`의 구현을 생성합니다. `@Component` 어노테이션에서 서비스를 `ConfigurationScreen.class`로 선언합니다.

   ```java
   @Component(service = ConfigurationScreen.class)
   ```

1. `getPid()` 메서드를 재정의합니다. 구성 클래스의 `@Meta.OCD` 어노테이션에 지정된 대로 전체 구성 ID를 반환해야 합니다.

   ```{literalinclude} ./configuration-form-renderer/resources/liferay-b7r2.zip/b7r2-web/src/main/java/com/acme/b7r2/web/internal/configuration/admin/display/B7R2ConfigurationFormRenderer.java
   :dedent: 1
   :language: java
   :lines: 26-29
   ```

1. `getRequestParameters()` 메서드를 재정의합니다. 이 메서드에서는 사용자 지정 UI에서 보낸 매개변수를 읽고 키가 구성 인터페이스에 있는 필드와 일치하는 맵에 넣습니다.

   ```{literalinclude} ./configuration-form-renderer/resources/liferay-b7r2.zip/b7r2-web/src/main/java/com/acme/b7r2/web/internal/configuration/admin/display/B7R2ConfigurationFormRenderer.java
   :dedent: 1
   :language: java
   :lines: 31-42
   ```

1. `render()` 메서드를 재정의합니다. 이 예제에서 `ConfigurationProvider` 는 구성 개체에 액세스합니다. 서블릿 컨텍스트는 요청 디스패처에 대한 액세스를 제공하여 사용자 지정 JSP가 구성을 읽을 수 있도록 합니다.

1. `@Reference` 어노테이션을 사용하여 모듈의 심볼 이름을 정의해야 합니다.

   ```java
   @Reference(
    target = "(osgi.web.symbolicname=com.acme.b7r2.web)"
   )
   ```

## 웹 컨텍스트 경로 추가

`bnd.bnd` 파일에 번들의 `웹 컨텍스트 경로` 를 지정합니다. 예를 들어, 샘플 프로젝트에는 `Web-ContextPath: /b7r2-web` Bnd 파일에 있습니다. 이것이 구성 양식 렌더러 파일에 `ServletContext` 객체를 등록하는 것입니다. 포틀릿의 경우 서블릿 컨텍스트가 자동으로 생성되지만 이 샘플에는 포틀릿이 없으므로 `bnd.bnd` 파일에 서블릿 컨텍스트를 추가해야 합니다.

## 사용자 지정 JSP 만들기

1. 구성 인터페이스를 JSP로 가져옵니다.

   ```markup
   <%@ page import="com.acme.u2g5.web.internal.configuration.B7R2WebConfiguration" %>
   ```

1. 요청 객체에서 구성 값에 액세스합니다.

   ```jsp
   <%
   B7R2WebConfiguration b7r2WebConfiguration = (B7R2WebConfiguration)request.getAttribute(B7R2WebConfiguration.class.getName());
   %>
   ```

1. `<aui:input>` 태그를 사용하여 사용자가 JSP 파일에 제출한 새 구성 입력을 읽습니다.

   ```jsp
   <aui:input name="b7r2Color" value="<%= b7r2WebConfiguration.b7r2Color() %>" />
   ```

이 샘플 프로젝트는 `ConfigurationFormRenderer`를 사용하여 기본 사용자 지정 구성 UI를 보여줍니다. 애플리케이션에서 직접 코드를 작성하여 구성 UI의 모양과 느낌을 더욱 맞춤 설정할 수 있습니다.
