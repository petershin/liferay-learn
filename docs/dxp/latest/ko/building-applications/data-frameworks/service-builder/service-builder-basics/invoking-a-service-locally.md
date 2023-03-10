# 로컬에서 서비스 호출

DXP/Portal에 배포된 Service Builder 서비스는 동일한 JVM의 다른 클래스에서 호출할 수 있습니다. 이러한 서비스는 클래스에 대해 **로컬** 입니다.

Service Builder 서비스는 선언적 서비스(DS) 구성 요소이므로 컨테이너에서 관리됩니다. 소비자는 컨테이너에서 구성 요소를 요청하고 컨테이너는 일치하는 구성 요소 인스턴스를 제공합니다.

클래스를 DS 구성 요소로 구현하면 클래스가 종속되는 다른 구성 요소를 활성화할 수 있어야 한다는 이점이 있습니다. 충족되지 않은 구성 요소 종속성으로 인해 구성 요소가 활성화되지 않으면 런타임 프레임워크에서 문제를 보고합니다.

여기서는 [포틀릿](../../../developing-a-java-web-application/reference/portlets.md) DS 구성 요소에서 Service Builder 서비스를 호출합니다. 새 항목을 추가하기 위한 양식이 있는 예제 포틀릿 애플리케이션을 사용합니다. 양식은 JSP(JavaServer Page)에 있습니다. 양식을 제출하면 포틀릿이 트리거되어 항목을 만들고 유지하기 위한 서비스를 호출합니다.

## 포틀릿에서 서비스 호출

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. 예제를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/service-builder/service-builder-basics/liferay-t2p5.zip -O
   ```

   ```bash
   unzip liferay-t2p5.zip
   ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    cd liferay-t2p5
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.t2p5.api_1.0.0
    STARTED com.acme.t2p5.service_1.0.0
    STARTED com.acme.t2p5.web_1.0.0
    ```

1. **Samples** 카테고리의 **T2P5 Portlet** 위젯을 위젯 페이지에 추가하십시오. T2P5 포틀릿이 나타납니다.

   ![페이지에 T2P5 포틀릿을 추가했습니다.](./invoking-a-service-locally/images/01.png)

1. 텍스트 필드에 항목 이름과 설명을 입력하고 **제출** 을 클릭합니다. 예를 들어,

    **이름:** `울타리 다듬기`

    **설명:** `울타리 가위를 사용하여 울타리를 멋진 모양으로 다듬습니다.`

![T2P5 포틀릿을 페이지에 추가했습니다.](./invoking-a-service-locally/images/02.png)

이름과 설명이 있는 새 항목이 **T2P5 항목** 목록에 나타납니다.

포틀릿에서 Service Builder 서비스를 호출했습니다. 서비스 API부터 시작하여 작동 방식을 알아보세요.

## 서비스 API 검토

`t2p5-api` 모듈 프로젝트의 `T2P5EntryLocalService` 클래스에는 `addT2P5Entry(String description, String name)`라는 메서드가 있습니다.

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-api/src/main/java/com/acme/t2p5/service/T2P5EntryLocalService.java
   :dedent: 1
   :language: java
   :lines: 65-66
```

`addT2P5Entry` 메소드는 주어진 설명과 이름으로 `T2P5Entry` 을 생성하고 항목을 유지합니다.

```{note}
`t2p5-service` 모듈 프로젝트의 `T2P5EntryLocalServiceImpl` 클래스는 `T2P5EntryLocalService` 인터페이스를 구현합니다.
```

`t2p5-api` 모듈의 `bnd.bnd` 파일은 `com.acme.t2p5.service` 패키지, `com.acme.t2p5.model` 패키지 및 소비자가 사용할 기타 패키지에 대한 내보내기를 선언합니다. 다음은 `bnd.bnd` 파일입니다.
```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-api/bnd.bnd
```

The `t2p5-web` module's portlet application depends on the `T2P5EntryLocalService` class. The web module's `build.gradle` file declares a dependency on the `t2p5-api` project.

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-web/build.gradle
```

```{note}
아티팩트 찾기 및 종속성 지정에 대한 자세한 내용은 [종속성 구성](../../../../liferay-internals/fundamentals/configuring-dependencies.md)을 참조하세요.
```

## 포틀릿 검사

`t2p5-web` 모듈의 `T2P5Portlet` 클래스는 `T2P5Entry` 인스턴스를 추가하라는 요청을 처리합니다. 다음은 `T2P5Portlet` 클래스입니다.

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-web/src/main/java/com/acme/t2p5/web/internal/portlet/T2P5Portlet.java
:language: java
:lines: 16-38
```

`T2P5Portlet` 은 [`MVCPortlet`](../../../developing-a-java-web-application/using-mvc.md)입니다. 여기에는 `_t2p5EntryLocalService` 이라는 `T2P5EntryLocalService` 필드와 `addT2P5Entry`라는 작업 처리 메서드가 있습니다.

`_t2p5EntryLocalService` 필드의 `@Reference` 주석은 런타임 프레임워크에 `T2P5EntryLocalService` 구성 요소 인스턴스를 필드에 삽입하라는 신호를 보냅니다.

```{note}
`@Reference` 주석을 사용하고 다른 방식으로 서비스에 액세스하는 방법에 대한 자세한 내용은 [핵심 프레임워크](../../../core-frameworks.md) 의 *종속성 주입*을 참조하세요.
```

`addT2P5Entry` 메소드는 `T2P5EntryLocalService`의 `addT2P5Entry` 메소드를 호출하고 `ActionRequest`에서 가져온 설명 및 이름 매개변수를 전달합니다.

포틀릿의 `view.jsp` 템플릿(다음)은 `ActionRequest`를 `T2P5Portlet`로 제출합니다.

## JSP 검사

`view.jsp` 은 항목을 추가하기 위한 양식을 제공하고 모든 현재 항목을 표시합니다.

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
```

JSP는 다음 태그 라이브러리의 태그를 사용합니다.

* 코어 JSTL
* Portlets
* Liferay의 Alloy UI (`aui`)

다음 클래스를 가져옵니다.

* `T2P5Entry`
* `T2P5EntryLocalServiceUtil`
* `java.util.List`

페이지의 **Add T2P5 Entry** 섹션은 항목을 추가하기 위한 양식을 제공합니다. `<portlet:defineObjects />` 태그는 템플릿에서 표준 포틀릿 개체를 사용할 수 있도록 합니다. `aui` 태그는 이러한 개체를 사용합니다.

`<portlet:actionURL name="addT2P5Entry" var="addT2P5EntryURL" />` 태그는 `addT2P5EntryURL` 변수를 `addT2P5Entry`라는 포틀릿 작업에 매핑합니다. 이 `actionURL`로 `ActionRequest`를 제출하면 `actionUrl` 이름 `addT2P5Entry`에 맵핑되기 때문에 포틀릿의 메소드 `addT2P5Entry`를 호출합니다.

`<aui:form>`은 항목 이름 및 설명에 대한 텍스트 필드를 렌더링합니다. 양식을 제출하면 해당 값이 'ActionRequest'와 함께 포틀릿 메소드에 전달됩니다.

```{note}
포틀릿 작업에 대한 자세한 내용은 [MVC 포틀릿으로 작업 호출](../../../developing-a-java-web-application/using-mvc/invoking-actions-with-mvc-portlet.md)을 참조하세요. ).
```

페이지의 **항목** 섹션에는 모든 항목이 나열됩니다. `T2P5EntryLocalServiceUtil.getT2P5Entries(-1, -1)` 을 호출하여 모든 항목을 가져옵니다. 1 `-1` 최소 및 최대 범위 값은 모든 항목을 반환하도록 메서드에 지시합니다.

포틀릿 애플리케이션에서 Service Builder 서비스를 호출했습니다. 이러한 서비스는 MVC Portlet에서 사용하기 쉽습니다.

## 다음

이제 Service Builder 기본 사항을 알았으므로 [엔터티 정의](../defining-entities.md) 를 탐색하여 엔터티 간의 관계를 생성하고, 엔터티를 지역화하고, 쿼리를 지원하는 등의 작업을 수행할 수 있습니다. 또는 [Service Builder를 사용한 비즈니스 로직](../business-logic-with-service-builder.md)에 대해 자세히 알아볼 수 있습니다.

## 추가 정보

* [포틀릿](../../../developing-a-java-web-application/reference/portlets.md)
* [MVC 사용](../../../developing-a-java-web-application/using-mvc.md)
* [JSP 및 MVC 포틀릿 사용](../../../developing-a-java-web-application/using-mvc/using-a-jsp-and-mvc-portlet.md)
* [MVC 작업 명령](../../../developing-a-java-web-application/using-mvc/mvc-action-command.md)
