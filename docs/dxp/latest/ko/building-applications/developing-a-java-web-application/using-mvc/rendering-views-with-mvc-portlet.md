# MVC 포틀릿으로 뷰 렌더링

사용자가 포틀릿의 보기에 액세스할 수 있게 하려면 사용자에 대한 탐색을 구현해야 합니다. 포틀릿 렌더링 URL은 이를 수행하는 데 도움이 됩니다.

여기에서는 포틀릿 렌더링 URL을 사용하는 예제 애플리케이션을 배포합니다. 포틀릿이 MVC 포틀릿의 `mvcPath` 매개변수를 사용하여 보기 경로를 설정하는 URL을 생성하는 방법을 검사합니다.

예제 포틀릿에는 두 개의 보기가 있습니다. **보기 1** 해당 이름과 **보기 2** 에 대한 링크를 표시하고 그 반대의 경우도 마찬가지입니다.

![다음은 보기 1입니다.](./rendering-views-with-mvc-portlet/images/01.png)

## 여러 보기가 있는 MVC 포틀릿 배포

다음은 예제 포틀릿을 배치하고 보기 사이를 탐색하는 방법입니다. 학습 목적으로 포틀릿은 `mvcPath` 매개변수 값을 기록합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. 예제를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-c8m3.zip -O
   ```

   ```bash
   unzip liferay-c8m3.zip
   ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    cd liferay-c8m3
    ```

    ```bash
     ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.c8m3.web_1.0.0
    ```

1. **Samples** 카테고리의 **C8M3 Portlet** 위젯을 위젯 페이지에 추가하십시오. **보기 1**(포틀릿의 기본 보기)이 나타납니다.

    ![보기 1을 페이지에 추가했습니다.](./rendering-views-with-mvc-portlet/images/02.png)

    다음 메시지가 로그에 인쇄됩니다.

    ```bash
    MVC path null
    ```

    렌더링 요청에는 아직 MVC 경로 매개변수가 포함되어 있지 않습니다. 이것은 예상됩니다. 포틀릿은 기본적으로 포틀릿 클래스(나중에 설명됨)를 사용하여 보기 1을 렌더링합니다. 다음 단계에서는 MVC 경로 매개변수를 사용합니다.

1. **보기로 이동 2** 을 클릭합니다. 보기 2가 나타납니다.

    ![보기 2로 이동했습니다.](./rendering-views-with-mvc-portlet/images/03.png)

    로그 메시지에는 MVC 경로 값 `/view_2.jsp`---View 2 템플릿에 대한 경로가 표시됩니다.

    ```bash
    MVC path /view_2.jsp
    ```

1. **보기로 이동 1** 클릭합니다. 보기 1이 다시 나타납니다.

   ![보기 1로 다시 이동했습니다.](./rendering-views-with-mvc-portlet/images/04.png)

   로그 메시지는 MVC 경로 `/view_1.jsp`인쇄합니다.

   ```bash
    MVC path /view_1.jsp
   ```

포틀릿 보기 사이를 왕복했습니다. 다음으로, 포틀릿이 기본 보기를 설정하고 렌더링 URL 및 MVC 경로 요청 매개변수를 사용하여 보기에 대한 경로를 설정하는 방법을 알아봅니다.

## 기본 보기 설정

포틀릿의 기본 보기는 사용자가 포틀릿 페이지에 처음 방문할 때 렌더링됩니다. 포틀릿 클래스의 초기화 매개변수는 기본 보기를 설정합니다. `C8M3Portlet.java` 예제 클래스는 [`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) 주석에서 기본 보기를 설정합니다.

```{literalinclude} ./rendering-views-with-mvc-portlet/resources/liferay-c8m3.zip/c8m3-web/src/main/java/com/acme/c8m3/web/internal/portlet/C8M3Portlet.java
   :language: java
   :lines: 16-24
```

[`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) 속성 `"javax.portlet.init-param.view-template=/view1.jsp"` `/view1.jsp` 기본 보기 템플릿으로 지정합니다. 템플릿 경로는 포틀릿의 `src/main/resources/META-INF/resources` 폴더에 상대적입니다.

다음으로 보기 1이 보기 2에 연결되는 방식을 알아봅니다.

## 포틀릿 렌더링 URL을 사용하여 보기에 연결

View 1에는 **View 1** 이라는 머리글과 **Go to View 2** 이라는 링크가 있습니다. 다음은 `view1.jsp` 코드입니다.

```{literalinclude} ./rendering-views-with-mvc-portlet/resources/liferay-c8m3.zip/c8m3-web/src/main/resources/META-INF/resources/view_1.jsp
   :language: jsp
```

`portlet:renderURL` 태그는 포틀릿 taglib에서 가져오고 접두사 `portlet`이 지정됩니다. 위의 렌더링 URL은 변수 `view2URL`에 할당됩니다. 렌더링 URL은 `portlet:param` `mvcPath` 값 `/view_2.jsp`선언합니다. 포틀릿이 렌더링되면 `mvcPath` 매개변수가 포틀릿의 [`RenderRequest`](https://docs.liferay.com/portlet-api/2.0/javadocs/javax/portlet/RenderRequest.html) 객체에 추가됩니다. 포틀릿 요청을 처리할 때 [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java) `mvcPath`에 할당된 템플릿을 렌더링합니다.

포틀릿이 URL을 사용하려면 렌더링 URL이 하이퍼링크 또는 버튼과 같은 UI 구성 요소에 바인딩되어야 합니다. 하이퍼링크 `<a href="<%= view2URL %>">보기로 이동 2</a>` 는 렌더링 URL을 UI 구성 요소에 바인딩합니다.

사용자가 **Go to View 2** 하이퍼링크를 클릭하면 `mvcPath` 매개변수를 포함하는 포틀릿 요청이 포틀릿 클래스로 전송됩니다.

## mvcPath 포틀릿 매개변수 처리

포틀릿이 요청 객체를 수신하면 요청 객체 매개변수에 응답할 수 있습니다. `C8M3Portlet`의 `render` 메서드는 렌더링 요청에 응답합니다.

```{literalinclude} ./rendering-views-with-mvc-portlet/resources/liferay-c8m3.zip/c8m3-web/src/main/java/com/acme/c8m3/web/internal/portlet/C8M3Portlet.java
   :dedent: 1
   :language: java
   :lines: 26-40
```

`C8M3Portlet`의 `렌더링` 메소드는 `mvcPath` 매개변수 값을 기록한 다음 포틀릿 렌더링을 수퍼클래스 `MVCPortlet`에 위임합니다. [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java) `mvcPath` 포틀릿 요청 매개변수에 할당된 보기를 렌더링합니다.

```{note}
`mvcPath` 요청 매개변수가 없는 경우 `MVCPortlet`은 기본 템플릿(즉, `javax.portlet.init-param.view-template` 구성 요소 속성이 지정하는 템플릿)을 표시합니다.
```

View 2 템플릿 `view2.jsp` 도 포틀릿 렌더링 URL을 사용하여 `view1.jsp` 에 다시 매핑됩니다.

```{literalinclude} ./rendering-views-with-mvc-portlet/resources/liferay-c8m3.zip/c8m3-web/src/main/resources/META-INF/resources/view_2.jsp
   :language: jsp
```

View 1로의 왕복을 구현합니다.

## 다음

이제 포틀릿 보기를 렌더링하는 방법을 알았습니다. 다음으로, 포틀릿에서 조치를 수행하거나 별도의 `RenderCommand` 클래스를 사용하여 보기를 렌더링할 수 있습니다.

## 관련 항목

* [MVC 렌더링 명령](./mvc-render-command.md)
* [MVC 작업 명령](./mvc-action-command.md)
* [MVC 포틀릿에서 지역화된 메시지 사용](./using-localized-messages-in-an-mvc-portlet.md)
* [포틀릿](../reference/portlets.md)
