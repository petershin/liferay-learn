# 구성 설정 및 액세스

Liferay의 구성 프레임워크를 사용하여 MVC 포틀릿에 대한 설정 UI를 추가할 수 있습니다.

## 예제 포틀릿 보기

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [설정 및 액세스 구성](./liferay-n2f3.zip) 을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-n2f3.zip -O
    ```

    ```bash
    unzip liferay-n2f3.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.n2f3.web.0.0 [1650]
    ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저를 `https://localhost:8080`로 엽니다.

1. 페이지에 N2F3 포틀릿을 추가합니다. 샘플 위젯에서 예제 포틀릿을 찾을 수 있습니다.

    ![페이지에 N2F3 포틀릿을 추가합니다.](./setting-and-accessing-configurations/images/01.png)

    UI는 세 가지 구성 가능한 속성(글꼴 색상, 글꼴 패밀리 및 글꼴 크기)과 함께 환영 메시지를 표시합니다.

1. 구성을 변경하려면 **제어판** &rarr; **구성** &rarr; **시스템 설정** 으로 이동하십시오. 기타에서 **category.n2f3** 을 클릭합니다.

    ![기타 범주에서 category.n2f3을 클릭합니다.](./setting-and-accessing-configurations/images/02.png)

    다른 글꼴 색상, 글꼴 모음 및 글꼴 크기를 입력해 보십시오. **업데이트** 버튼을 클릭하고 게시된 위젯이 있는 페이지로 돌아갑니다. 속성이 변경되었는지 확인합니다.

다음은 구성 프레임워크의 작동 방식입니다.

## 구성 인터페이스 만들기

구성 인터페이스에서 구성 가능한 속성을 정의하면 [시스템 설정](../../../system-administration/configuring-liferay/system-settings.md)에서 구성 UI를 생성하기에 충분합니다.

샘플 프로젝트에서 `N2F3WebConfiguration.java` 파일은 구성 인터페이스입니다.

```{literalinclude} ./scoping-configurations/resources/liferay-n2f3.zip/n2f3-web/src/main/java/com/acme/n2f3/web/internal/configuration/N2F3WebConfiguration.java
:language: java
:lines: 5-17
```

이 예제 인터페이스의 경우 범위는 `Scope.COMPANY`로 설정됩니다. 자세한 내용은 [범위 지정 구성](./scoping-configurations.md) 을 참조하십시오.

인터페이스에는 글꼴 색상, 글꼴 모음 및 글꼴 크기의 세 가지 구성 가능한 속성이 있습니다. color와 family는 type `string` 이고 size는 type `int`입니다.

`Meta.OCD` 은 이 클래스를 특정 ID를 가진 구성으로 등록합니다.

```{important}
ID는 구성 인터페이스의 FQCN(정규화된 클래스 이름)이어야 합니다.
```

`Meta.AD` 은 기본값 또는 속성이 필수 필드인지 여부와 같은 속성에 대한 선택적 메타데이터 [을 지정](http://bnd.bndtools.org/chapters/210-metatype.html) . 속성 값이 필요하지만 기본값이 설정되지 않은 경우 관리자가 설정에서 값을 설정해야 애플리케이션이 제대로 작동합니다.

다음으로 MVC Portlet에서 구성을 읽는 방법을 확인합니다.

## 애플리케이션에서 구성 읽기

1. `@Component` 주석에서 구성 인터페이스 클래스는 `configurationPid`으로 지정됩니다.

    ```java
    configurationPid = "com.acme.n2f3.web.internal.configuration.N2F3WebConfiguration"
    ```

1. 구성에 액세스하기 위해 `render()` 메서드는 `ConfigurationProvider`을 활용합니다. 구성 공급자 API는 다양한 수준의 범위에서 구성을 검색하는 메서드를 제공합니다. 샘플 프로젝트의 구성은 인스턴스 범위이며 `getCompanyConfiguration()` 메서드를 사용하여 구성을 검색합니다.

    ```{literalinclude} ./scoping-configurations/resources/liferay-n2f3.zip/n2f3-web/src/main/java/com/acme/n2f3/web/internal/portlet/N2F3Portlet.java
    :dedent: 1
    :language: java
    :lines: 44-51
    ```

    구성 개체가 요청 개체에 추가되었으며 이제 애플리케이션의 JSP 요청에서 읽을 수 있습니다.

## JSP에서 구성에 액세스

1. 다음 가져오기 문은 구성 인터페이스를 JSP에 추가합니다.

    ```markup
    <%@ page import="com.acme.n2f3.web.internal.configuration.N2F3WebConfiguration" %>
    ```

1. 요청 개체에서 구성 개체를 가져오고 구성 값을 읽습니다.

    ```markup
    <%
    N2F3WebConfiguration n2f3WebConfiguration = (N2F3WebConfiguration)request.getAttribute(N2F3WebConfiguration.class.getName());
    %>
    ```

1. 속성 `fontColor()`, `fontFamily()`, `fontSize()` 이제 JSP에서 사용할 수 있습니다.

## 드롭다운 선택 UI 구현

샘플 프로젝트에는 구성할 수 있는 세 가지 특성이 있습니다. 현재 속성은 텍스트 입력 필드에 수동으로 입력해야 하지만 추가로 사용자 정의할 수 있습니다.

예를 들어 입력 필드 대신 글꼴 패밀리 속성에 대한 드롭다운 목록을 사용할 수 있습니다. 프로젝트의 구성 인터페이스에서 `@Meta.AD` 주석을 다음으로 바꿉니다.

```java
@Meta.AD(
    optionLabels = {"Arial", "Georgia", "Helvetica", "Tahoma", "Verdana"},
    optionValues = {"arial", "georgia", "helvetica", "tahoma", "verdana"},
required = false)
```

예제 모듈을 재배포합니다.

![이제 글꼴 모음이 드롭다운 선택 항목입니다.](./setting-and-accessing-configurations/images/03.png)

이제 글꼴 모음 속성은 드롭다운 선택 항목입니다.

## 이전 버전의 Liferay를 사용한 ConfigurationBeanDeclaration

```{important}
Liferay DXP 7.4 U51+ 및 Liferay Portal 7.4 GA51+의 경우 'ConfigurationBeanDeclaration' 클래스가 필요하지 않습니다. 구성 인터페이스는 구성 공급자 API에 자동으로 등록됩니다.
```

7.4 업데이트/GA 51 이전의 Liferay 버전에서 구성 공급자 API와 함께 사용하려면 구성 클래스를 `ConfigurationBeanDeclaration` 로 등록해야 합니다. `ConfigurationBeanDeclaration` 클래스에는 구성 인터페이스 클래스를 반환하는 메서드가 하나 있습니다. 이렇게 하면 시스템이 구성 변경이 발생하는 즉시 이를 추적할 수 있습니다. 예를 들어 N2F3 포틀릿의 경우 다음과 같은 클래스를 만듭니다.

```java
@Component(service = ConfigurationBeanDeclaration.class)
public class N2F3WebConfigurationBeanDeclaration
    implements ConfigurationBeanDeclaration {

    @Override
    public Class<?> getConfigurationBeanClass() {
        return N2F3WebConfiguration.class;
    }

}
```

이 예에서는 클래스를 `com.acme.n2f3.web.internal.settings.definition` 패키지에 배치합니다.

## 추가 사용자 정의

* [구성 분류](./categorizing-a-configuration.md)
* [범위 지정 구성](./scoping-configurations)
* [필드 옵션 공급자](./field-options-provider.md)
