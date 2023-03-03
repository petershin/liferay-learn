# MVC 렌더링 명령

MVC 렌더링 명령은 렌더링할 페이지를 처리하는 클래스입니다. 이들은 `MVCPortlet` 렌더링 URL 및 요청에 의해 호출됩니다. 렌더링 로직이 단순하다면 [포틀릿 클래스에서 모든 것을 구현](./rendering-views-with-mvc-portlet.md)할 수 있습니다. 렌더링 논리가 복잡하거나 렌더링 경로를 깔끔하게 분리하려면 MVC 렌더링 명령을 사용하세요.

## MVC 렌더 명령 호출

여기에서는 MVC 렌더링 명령을 사용하여 보기를 렌더링하는 예제 포틀릿을 배포합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. 예제를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-a4p1.zip -O
   ```

   ```bash
   unzip liferay-a4p1.zip
   ```

1. 예제를 빌드하고 배포합니다. 

    ```bash
    cd liferay-a4p1
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다. 

    ```bash
    STARTED com.acme.a4p1.web_1.0.0
    ```

1. *Samples* 카테고리의 *A4P1 Portlet* 위젯을 위젯 페이지에 추가하십시오. A4P1 포틀릿이 나타납니다.
   
   ![페이지에 A4P1 포틀릿을 추가했습니다.](./mvc-render-command/images/01.png)

1. *Go to Baker*을 클릭하여 MVC 렌더링 명령을 호출하여 Baker 보기를 방문하십시오. `A4P1BakerMVCRenderCommand` 은 `render` 메서드 호출을 기록하고 Baker 보기를 렌더링합니다. 

    ```bash
    [A4P1BakerMVCRenderCommand:26] Invoking #render(RenderRequest, RenderResponse)
    ```

![Baker 보기를 렌더링하고 있습니다.](./mvc-render-command/images/02.png)

1. 다른 MVC 렌더링 명령을 호출하고 *Go to Able*을 클릭하여 Able 보기를 다시 방문하십시오. `A4P1AbleMVCRenderCommand` 은 `render` 메서드 호출을 기록하고 Able 보기를 다시 렌더링합니다. 

    ```bash
    [A4P1AbleMVCRenderCommand:26] Invoking #render(RenderRequest, RenderResponse)
    ```

MVC 렌더 명령이 작동하는 것을 보았습니다. 이제 그들이 어떻게 작동하는지 배우십시오.

## 포틀릿 검사

`A4P1Portlet` 은 최소 [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java) 입니다.

```{literalinclude} ./mvc-render-command/resources/liferay-a4p1.zip/a4p1-web/src/main/java/com/acme/a4p1/web/internal/portlet/A4P1Portlet.java
:language: java
:lines: 9-19
```

[`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) `javax.portlet.name` 속성은 포틀릿의 이름을 설정합니다.

```{literalinclude} ./mvc-render-command/resources/liferay-a4p1.zip/a4p1-web/src/main/java/com/acme/a4p1/web/internal/portlet/A4P1Portlet.java
:dedent: 2
:language: java
:lines: 14
```

포틀릿은 기본적으로 `/a4p1/able.jsp` 을 렌더링합니다.

```{note}
`MVCRenderCommand`는 포틀릿 이름(예: 포틀릿 구성 요소 `javax.portlet.name` 속성 값)으로 포틀릿에 바인딩됩니다.
```

다음은 포틀릿의 MVC Render Command 클래스입니다.

## MVCRenderCommand 클래스 검사

MVC Render Command 클래스는 [`MVCRenderCommand`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCRenderCommand.java) 직접 구현하거나 [`BaseMVCRenderCommand`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/BaseMVCRenderCommand.java) 확장할 수 있습니다. `A4P1AbleMVCRenderCommand` 은 `MVCRenderCommand`을 직접 구현합니다. 다음은 `A4P1AbleMVCRenderCommand`입니다.

```{literalinclude} ./mvc-render-command/resources/liferay-a4p1.zip/a4p1-web/src/main/java/com/acme/a4p1/web/internal/portlet/action/A4P1AbleMVCRenderCommand.java
:language: java
:lines: 12-35
```

`A4P1AbleMVCRenderCommand` 은 `MVCRenderCommand` 서비스를 제공하는 [`구성 요소`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 입니다. 구성 요소 속성은 `A4P1AbleMVCRenderCommand` 을 `com_acme_a4p1_web_internal_portlet_A4P1Portlet` 포틀릿에 적용하고 `A4P1AbleMVCRenderCommand` 를 MVC 명령 이름 `/a4p1/able`에 매핑합니다.

```{note}
각 포틀릿에 대해 별도의 `



            을
            하여 `
         구성 요소를 여러 포틀릿과 연결할 수 있습니다. .name=com_acme_a4p1_web_internal_portlet_A4P2Portlet",
            "mvc.command.name=/a4p1/download"
         },
         서비스 = MVCRenderCommand.class
)
```

포틀릿이 MVC 명령 이름 `/a4p1/able`을 지정하는 요청 매개변수를 수신하면 `A4P1AbleMVCRenderCommand`의 `렌더링` 메소드가 실행됩니다. 이 `render` 메서드는 자신을 식별하는 메시지를 기록한 다음 렌더링할 뷰의 경로를 반환합니다.

`A4P1BakerMVCRenderCommand` 은 MVC 명령 이름이 `/a4p1/baker` 이고 렌더링 메서드가 보기 경로 `/a4p1/baker.jsp`을 반환한다는 점을 제외하면 `A4P1AbleMVCRenderCommand` 과 유사합니다.

이러한 예제 MVC 렌더 명령은 데모 목적으로 사소한 기능을 제공합니다. 뷰를 렌더링하는 데 필요한 논리를 사용하여 MVC Render Command의 `렌더링` 메서드를 구현합니다.

예제 URL은 MVC 렌더링 명령을 트리거합니다.

## 포틀릿 렌더링 URL 검사

`개의 able.jsp` 및 `baker.jsp` 파일은 포틀릿 렌더링 URL을 사용하여 서로 간접적으로 연결됩니다. 다음은 `able.jsp`입니다.

```{literalinclude} ./mvc-render-command/resources/liferay-a4p1.zip/a4p1-web/src/main/resources/META-INF/resources/a4p1/able.jsp
:language: jsp
```

`portlet:renderURL` 태그는 포틀릿 taglib에서 사용할 수 있으며 접두사 `portlet`이 지정됩니다. 이 렌더링 URL은 `mvcRenderCommandName` 포틀릿 매개변수 값 `/a4p1/baker`--- `A4P1AbleMVCRenderCommand`의 MVC 명령 이름을 선언합니다. 변수 `bakerURL` 은 이 렌더링 URL을 참조합니다.

하이퍼링크 `<a href="<%= bakerURL %>">Go to Baker</a>` 는 렌더링 URL을 작업에 바인딩합니다. 사용자가 하이퍼링크를 클릭하면 포틀릿은 `mvc.command.name` 구성 요소 속성 값 `/a4p1/baker` 가 `mvcRenderCommandName` 매개변수 값과 일치하기 때문에 [`RenderRequest`](https://docs.liferay.com/portlet-api/2.0/javadocs/javax/portlet/RenderRequest.html) 에서 `A4P1BakerMVCRenderCommand` 로 보냅니다.

`baker.jsp` 은 포틀릿 렌더링 URL `mvcRenderCommandName` 매개변수 값이 `/a4p1/able`이라는 점을 제외하면 `able.jsp` 과 유사합니다. 각 JSP의 `portlet:renderURL` 태그는 MVC Render Command의 `mvc.command.name` 속성 값을 태그의 `mvcRenderCommandName` 포틀릿 매개변수에 할당하여 MVC Render Command에 매핑합니다.

| `able.jsp` 포틀릿 렌더링 URL 매개변수                                               | `A4P1BakerMVCRenderCommand` 구성 요소 속성 |
|:------------------------------------------------------------------------- |:------------------------------------ |
| `<portlet:param name="mvcRenderCommandName" value="/a4p1/baker" />` | `mvc.command.name=/a4p1/baker`       |


| `baker.jsp` 포틀릿 렌더링 URL 매개변수                                             | `A4P1AbleMVCRenderCommand` 구성 요소 속성 |
|:------------------------------------------------------------------------ |:----------------------------------- |
| `<portlet:param name="mvcRenderCommandName" value="/a4p1/able" />` | `mvc.command.name=/a4p1/able`       |

## 다음

이제 MVC Render Command 클래스에서 렌더링 논리를 구현하는 방법을 알았습니다. 다음으로 [MVC 리소스 명령](./mvc-resource-command.md) 클래스를 사용하여 파일과 같은 리소스에 대해 조치를 취할 수 있습니다. 

## 추가 정보

* [MVC 리소스 명령](./mvc-resource-command.md)
* [MVC 작업 명령](./mvc-action-command.md)
* [MVC 포틀릿에서 지역화된 메시지 사용](./using-localized-messages-in-an-mvc-portlet.md)
* [포틀릿](../reference/portlets.md)
