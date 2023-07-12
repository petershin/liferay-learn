# MVC 포틀릿으로 작업 호출

포틀릿의 [*Action 단계*](../reference/portlets.md#portlet-phases)는 상태 변경을 적용합니다. *포틀릿 작업 URL*을 사용하여 포틀릿의 작업 처리 메서드를 UI 구성 요소에 바인딩할 수 있습니다. 조치를 수행하기 위해 사용자의 요청을 포틀릿 메소드에 맵핑하는 `portlet:actionURL` JSP 태그입니다.

여기서는 액션 URL을 세 가지 방식으로 사용하는 예제 포틀릿을 호출하고 검사하는 방법을 배웁니다.

## 작업을 처리하는 MVC 포틀릿 배포

예제 MVC 포틀릿에는 별도의 포틀릿 메서드에 매핑되는 세 개의 포틀릿 작업 URL이 있습니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 포틀릿을 배포하고 작업을 트리거합니다.

1. 예제를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-u8t2.zip -O
   ```

   ```bash
   unzip liferay-u8t2.zip
   ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    cd liferay-u8t2
    ```

    ```bash
     ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.u8t2.web_1.0.0
    ```

1. *Samples* 카테고리의 *U8T2 Portlet* 위젯을 위젯 페이지에 추가하십시오. U8T2 포틀릿이 나타납니다.

   ![페이지에 U8T2 포틀릿을 추가했습니다.](./invoking-actions-with-mvc-portlet/images/01.png)

   포틀릿에는 세 개의 링크가 있습니다.

   * *뭔가를*
   * *다른 작업 수행*
   * *더 많은 작업 수행*

    각 링크를 클릭하면 다른 작업 처리 방법이 호출됩니다. 학습 목적으로 각 메서드는 자신을 식별하는 메시지를 기록합니다.

1. *작업 수행*클릭합니다. 포틀릿은 `doSomething` 메소드의 호출을 기록합니다.

    ```bash
    [U8T2Portlet:28] Invoke #doSomething(ActionRequest, ActionResponse)
    ```

1. *다른 작업 수행*클릭합니다. 포틀릿은 `doSomethingElse` 메소드의 호출을 기록합니다.

    ```bash
    [U8T2Portlet:36] Invoke #doSomethingElse(ActionRequest, ActionResponse)
    ```

1. *추가 작업*클릭하십시오. 포틀릿은 `doSomethingMore` 메소드의 호출을 기록합니다.

    ```bash
    [U8T2Portlet:45] Invoke #doSomethingMore(ActionRequest, ActionResponse)
    ```

이러한 작업은 사소하지만 UI 구성 요소를 포틀릿 작업 처리 메서드에 매핑하는 다양한 방법을 보여줍니다. 다음으로 어떻게 작동하는지 배우게 됩니다.

## 포틀릿의 작업 처리 방법 검토

`U8T2Portlet` 클래스는 세 가지 작업 처리 방법이 있는 표준 [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java) 입니다.

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/java/com/acme/u8t2/web/internal/portlet/U8T2Portlet.java
:language: java
:lines: 14-53
```

[`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) 주석은 클래스를 [`포틀릿`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/Portlet.html) 서비스를 제공하는 OSGi 선언적 서비스 구성요소로 표시합니다. 특성은 포틀릿을 *샘플* 위젯 범주에서 사용 가능하게 만들고 포틀릿 이름을 *U8T2 Portlet*으로 지정하고 포틀릿의 기본 보기 템플릿을 `/view.jsp`로 설정합니다.

각 메소드는 [`ActionRequest`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ActionRequest.html) 및 [`ActionResponse`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ActionResponse.html) 매개변수를 사용합니다. `ActionRequest` 은 메서드 정보를 제공하고 `ActionResponse` 메서드가 정보를 전달하는 수단을 제공합니다. 각 예제 메서드는 로그 메시지로 자신을 식별합니다.

JSP(다음에 설명)는 포틀릿 작업 URL을 사용하여 예제 메서드에 매핑됩니다. 처음 두 메서드는 이름을 제외하면 동일합니다. 마지막 메서드는 `@ProcessAction(name = "nameForTheDoSomethingMoreMethod")` 주석 때문에 눈에 띕니다. 포틀릿 작업 URL은 메서드 이름 대신 [`@ProcessAction`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ProcessAction.html) 주석 이름을 통해 메서드에 매핑할 수 있습니다. 예를 들어 `ProcessAction` 이름을 사용하면 포틀릿 작업 URL을 중단하지 않고 메서드 이름을 변경하거나 주석을 다른 메서드에 할당할 수 있습니다. JSP의 포틀릿 작업 URL을 조사하면 이를 이해하기가 더 쉬워집니다.

## JSP 검사

`view.jsp` 은 포틀릿 작업 URL을 사용하여 UI 구성 요소를 포틀릿의 작업 처리 메서드에 바인딩합니다. 다음은 `view.jsp` 코드입니다.

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:language: javascript
```

첫 번째 줄은 `포틀릿` 접두사를 통해 Portlet 2.0 태그 라이브러리를 사용할 수 있도록 합니다. 이 JSP는 태그 라이브러리의 `portlet:actionURL` 태그를 사용하여 UI 구성 요소에 작업을 바인딩합니다. 각 작업 URL을 검사합니다.

## 예 1: 변수로 작업 URL 참조

`view.jsp` 은 다음 포틀릿 작업 URL을 선언합니다.

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:language: javascript
:lines: 3
```

`portlet:actionURL`의 `name` 속성은 `doSomething` 포틀릿 메소드에 맵핑됩니다. `var` 속성은 포틀릿 조치 URL을 임의의 변수에 지정합니다. 이 JSP는 `actionURL` 변수를 참조하여 `Do Something` 레이블이 지정된 하이퍼링크에 작업 URL을 바인딩합니다.

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 8
```

이 링크를 클릭하면 포틀릿의 `doSomething` 메소드가 호출됩니다. 작업 URL의 변수를 참조하여 작업 URL을 여러 UI 구성 요소에 바인딩할 수 있습니다.

## 예제 2: UI 구성 요소에서 작업 URL 선언

JSP는 앵커 구성 요소에서 직접 다른 작업 URL을 선언합니다.

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 12
```

컴포넌트는 조치를 포틀릿의 `doSomethingElse` 메소드에 바인드하는 조치 URL을 선언합니다. 작업 URL을 매핑하는 보다 간단한 방법입니다.

## 예 3: 포틀릿 작업 이름 참조

마지막 앵커에서 JSP는 `nameForTheDoSomethingMoreMethod` 포틀릿 조치 이름과 연관된 조치 처리 메소드에 맵핑되는 조치 URL을 선언합니다.

JSP 작업 URL:

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 16
```

포틀릿 방법:

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/java/com/acme/u8t2/web/internal/portlet/U8T2Portlet.java
:dedent: 1
:language: java
:lines: 41-49
```

`nameForTheDoSomethingMoreMethod` 이라는 포틀릿 매개변수는 조치 URL과 메소드 사이의 느슨한 결합을 제공합니다. 예를 들어 메서드 이름을 변경하거나 `@ProcessAction(name = "nameForTheDoSomethingMoreMethod")` 주석을 다른 메서드에 할당할 수 있습니다.

## 다음

이제 작업 URL을 사용하는 방법을 알았으므로 작업 메서드 작성에 집중할 수 있습니다. 또는 [MVCActionCommand 클래스](./mvc-action-command.md)을 사용하여 조사할 수 있습니다. 또는 다른 포틀릿 단계 처리를 탐색할 준비가 되었으면 [MVCRenderCommand](./mvc-render-command.md) 및 [MVCResourceCommand](./mvc-resource-command.md) 클래스 사용을 살펴보십시오.

## 관련 항목

* [MVCActionCommand 클래스](./mvc-action-command.md)
* [MVCRenderCommand](./mvc-render-command.md)
* [MVC리소스 명령](./mvc-resource-command.md)
* [MVC 포틀릿에서 지역화된 메시지 사용](./using-localized-messages-in-an-mvc-portlet.md)
