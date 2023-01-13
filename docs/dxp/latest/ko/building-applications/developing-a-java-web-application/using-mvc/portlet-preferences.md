# Portlet특혜

관리자와 사용자에게 포틀릿 환경 설정으로 포틀릿을 사용자 정의하는 방법을 제공할 수 있습니다. 포틀릿 환경 설정은 모든 MVC 포틀릿에 추가되어 사용자에게 환경 설정에 액세스하고 설정할 수 있는 UI를 제공할 수 있습니다.

포틀릿 환경 설정은 애플리케이션 구성과 별도로 저장되는 속성입니다. 자세한 내용은 [포틀릿 레벨 구성](../../core-frameworks/configuration-framework/portlet-level-configuration.md)을 참조하십시오.

## 샘플 구현 보기
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the example.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-p1z2.zip -O
    ```

    ```bash
    unzip liferay-p1z2.zip
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
    STARTED com.acme.p1z2.web_1.0.0 [2725]
    ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저를 `https://localhost:8080`로 엽니다.

1. P1Z2 포틀릿을 페이지에 추가하십시오. 샘플 위젯에서 예제 포틀릿을 찾을 수 있습니다. 기본 색상 변수는 파란색으로 설정되어 있습니다.

1. 포틀릿의 옵션 아이콘(![options icon](../../../images/icon-options.png))을 클릭하고 *구성*를 클릭하십시오. 포틀릿의 기본 설정 창이 열립니다.

    ![구성을 클릭하여 포틀릿의 기본 설정을 엽니다.](./portlet-preferences/images/01.png)

1. 다른 색상을 선택하고 *저장*을 클릭합니다. 기본 설정 메뉴를 닫으면 이제 포틀릿에 새 선택 항목이 표시됩니다.

기본 설정이 작동하는 방식은 다음과 같습니다.

## 구성 JSP 만들기

포틀릿 환경 설정에 대한 사용자 인터페이스는 `configuration.jsp` 파일에서 제공됩니다.

```{literalinclude} ./portlet-preferences/resources/liferay-p1z2.zip/p1z2-web/src/main/resources/META-INF/resources/configuration.jsp
:language: jsp
:lines: 8-30
```

JSP 파일은 `<liferay-portlet:actionURL />` 및 `<liferay-portlet:renderURL />` 태그를 사용하여 변수 `configurationActionURL` 및 `configurationRenderURL`에서 URL을 구성합니다.

누군가 양식을 제출하면 `configurationActionURL` 이 호출되어 요청 매개변수로 포함된 `색` 변수를 사용하여 응용 프로그램의 `processAction` 메서드를 트리거합니다.

요청 목적을 나타내는 `cmd` 이라는 URL 매개변수가 제공됩니다. `cmd` 매개변수의 값은 `update`입니다.

## 구성 작업 만들기

포틀릿의 환경 설정에 액세스할 수 있도록 사용자 정의 구성 조치 클래스를 작성하십시오.

```{literalinclude} ./portlet-preferences/resources/liferay-p1z2.zip/p1z2-web/src/main/java/com/acme/p1z2/web/internal/portlet/action/P1Z2ConfigurationAction.java
:language: java
:lines: 14-34
```

`@Component` 주석에서 `특성` 태그를 사용하여 조치 클래스가 적용되는 포틀렛을 지정하십시오.

구성 양식에서 포틀릿 환경 설정을 읽고 데이터베이스에 저장하는 `processAction()` 메소드를 추가하십시오. 샘플 포틀릿에서 메소드는 `색상` URL 매개변수를 읽고 값을 포틀릿 환경 설정으로 설정합니다.

## 기본 설정 논리 추가

`view.jsp` 파일에 일부 논리를 추가하여 포틀릿의 환경 설정에 액세스하십시오.

```{literalinclude} ./portlet-preferences/resources/liferay-p1z2.zip/p1z2-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 7
```

JSP 파일은 선택된 포틀릿 환경 설정을 확인하고 값을 리턴합니다. 아직 값이 저장되지 않은 경우 `파란색` 이 기본값으로 반환됩니다.

`<portlet:defineObjects />` 태그는 `portletPreferences` 를 사용 가능하게 하며 JSP에서 `색` 환경 설정을 검색하는 데 사용합니다.

## 포틀릿의 경로 매개변수 추가

포틀릿의 `@Component` 주석에서 보기 템플릿 및 구성 템플릿 경로 매개변수를 추가합니다.

```{literalinclude} ./portlet-preferences/resources/liferay-p1z2.zip/p1z2-web/src/main/java/com/acme/p1z2/web/internal/portlet/P1Z2Portlet.java
:language: java
:lines: 9-18
```

## 관련 정보

* [포틀릿 수준 구성](../../core-frameworks/configuration-framework/portlet-level-configuration.md)
