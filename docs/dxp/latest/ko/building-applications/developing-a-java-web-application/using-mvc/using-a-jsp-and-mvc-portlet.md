# JSP 및 MVC 포틀릿 사용

웹 애플리케이션 개발을 시작하는 쉬운 방법은 JSP 파일에 마크업을 추가하고 포틀릿 Java 클래스를 사용하여 렌더링하는 것입니다.

W3E7 예제 애플리케이션은 이 접근 방식을 보여줍니다.

![다음은 예제 포틀릿 애플리케이션입니다.](./using-a-jsp-and-mvc-portlet/images/01.png)

애플리케이션에는 마크업 컨텐츠가 있는 JSP와 JSP를 렌더링하는 `MVCPortlet` 클래스가 있습니다. 예제를 배포하고 검토하여 MVC 포틀릿과 함께 JSP를 사용하여 애플리케이션을 만드는 방법을 알아봅니다.

## 간단한 MVC 포틀릿 모듈 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 예제를 배포합니다.

1. 예제를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-w3e7.zip -O
   ```

   ```bash
   unzip liferay-w3e7.zip
   ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    cd liferay-w3e7
    ```

    ```bash
     ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.w3e7.web_1.0.0
    ```

1. **Samples** 카테고리의 **W3E7 Portlet** 위젯을 위젯 페이지에 추가하여 애플리케이션의 가용성을 확인하십시오.

![다음은 포틀릿 웹 애플리케이션의 예입니다.](./using-a-jsp-and-mvc-portlet/images/02.png)

축하합니다. 새 애플리케이션을 성공적으로 빌드하고 배포했습니다.

다음으로 이 포틀릿 애플리케이션을 만드는 방법을 배웁니다.

## MVC 포틀릿을 사용하여 애플리케이션을 생성하는 방법

예제 포틀릿을 빌드하는 데는 두 단계가 있습니다.

1. JSP를 사용하여 보기를 작성하십시오.
2. [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java) 을 생성하여 애플리케이션을 등록하고 렌더링합니다.

### 보기 템플릿 만들기

모듈의 `src/main/resources/META-INF/resources` 폴더에서 보기 템플릿이 될 JSP 파일을 만듭니다. 파일 이름은 임의입니다. 예제 JSP 파일은 `view.jsp`입니다. 다음은 JSP 콘텐츠입니다.

```{literalinclude} ./using-a-jsp-and-mvc-portlet/resources/liferay-w3e7.zip/w3e7-web/src/main/resources/META-INF/resources/view.jsp
   :language: jsp
```

위의 마크업은 "Hello W3E7"이라는 제목을 표시합니다.

### MVC포틀릿 만들기

모듈의 `src/main/java` 폴더에서 `com.acme.w3e7.web.internal.portlet`이라는 패키지를 만듭니다. 해당 패키지에서 [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java) 를 확장하는 `W3E7Portlet` 이라는 클래스를 추가합니다.

```{literalinclude} ./using-a-jsp-and-mvc-portlet/resources/liferay-w3e7.zip/w3e7-web/src/main/java/com/acme/w3e7/web/internal/portlet/W3E7Portlet.java
   :language: java
   :lines: 17
```

```{note}
패키지 이름의 `*.web.internal.portlet` 부분은 규칙입니다. 웹 모듈 유형에 대한 `web`, 포틀릿 구현이 개인용이므로 `internal`, 클래스가 포틀릿이므로 `portlet`입니다.
```

이 확장에는 추가 메서드가 필요하지 않습니다. `MVCPortlet`의 내장 메소드는 컴포넌트 주석(다음에 추가됨)을 사용하여 `view.jsp` 템플릿을 렌더링합니다.

### 주석으로 포틀릿 구성

[`@Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 주석은 포틀릿을 구성합니다.

```{literalinclude} ./using-a-jsp-and-mvc-portlet/resources/liferay-w3e7.zip/w3e7-web/src/main/java/com/acme/w3e7/web/internal/portlet/W3E7Portlet.java
   :language: java
   :lines: 9-18
```

`service = Portlet.class` 속성은 클래스를 `Portlet`으로 등록합니다.

`특성` 속성의 값은 포틀릿 웹 애플리케이션을 설명합니다. `com.liferay.portlet.display-category=category.sample` 속성은 앱을 샘플 위젯 범주에 추가합니다. `javax.portlet.display-name=W3E7 포틀릿` 속성은 앱의 이름을 지정합니다.

`javax.portlet.init-param.view-template=/view.jsp` 속성은 애플리케이션의 `resources/META-INF/resources` 폴더에 대한 보기 템플릿 경로를 선언합니다. 포틀릿을 페이지에 추가하면 `resources/META-INF/resources/view.jsp` 보기 템플릿이 렌더링됩니다.

```{note}
[OSGi 서비스 속성 맵에 대한 포틀릿 설명자](../reference/portlet-descriptor-to-osgi-service-property-map.md)는 OSGi 구성 요소 속성 값이 기존 포틀릿 설명자에 매핑되는 방법을 지정합니다.
```

## 다음

축하합니다! JSP와 하나의 간단한 Java 클래스를 사용하여 웹 애플리케이션을 만들었습니다. 여기에서 갈 수 있는 방향이 많이 있습니다. 더 많은 보기를 추가하려면 [MVC 포틀릿](./rendering-views-with-mvc-portlet.md)을 사용한 렌더링 보기를 참조하십시오. 애플리케이션에 작업을 추가하려면 [MVC 작업 명령](./mvc-action-command.md)을 참조하십시오. 또는 [서비스 빌더](../../data-frameworks/service-builder.md) 을 사용하여 백엔드 데이터 모델을 구현합니다.

## 추가 정보

* [OSGi 서비스 속성 맵에 대한 포틀릿 설명자](../reference/portlet-descriptor-to-osgi-service-property-map.md)
* [MVC 사용](../using-mvc.md)
