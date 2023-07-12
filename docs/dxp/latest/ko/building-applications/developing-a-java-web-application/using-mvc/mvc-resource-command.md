# MVC 리소스 명령

MVC 리소스 명령 클래스는 작업이나 렌더링을 트리거하지 않고 DXP/Portal 인스턴스에서 이미지, XML 또는 기타 종류의 리소스와 같은 리소스를 검색합니다. 요청 또는 포틀릿 리소스 URL은 MVC 리소스 명령을 호출합니다.

MVC 리소스 명령을 사용하는 예제 포틀릿을 배포한 다음 검사합니다.

## MVC 리소스 명령 호출

예제 포틀릿은 MVC 리소스 명령을 사용하여 간단한 파일을 다운로드합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. 예제를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-p8v5.zip -O
   ```

   ```bash
   unzip liferay-p8v5.zip
   ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    cd liferay-p8v5
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.p8v5.web_1.0.0
    ```

1. *샘플* 카테고리의 *P8V5 Portlet* 위젯을 위젯 페이지에 추가하십시오. P8V5 포틀릿이 나타납니다.

    ![페이지에 P8V5 포틀릿을 추가했습니다.](./mvc-resource-command/images/01.png)

    링크는 MVC 리소스 명령을 호출하여 간단한 텍스트 파일을 다운로드합니다.

1. *다운로드*클릭합니다. `p8v5.txt` 이라는 파일이 컴퓨터에 다운로드됩니다.

1. `p8v5.txt` 파일을 엽니다. 내용은 다음과 같습니다.

    ```
    Hello P8V5!
    ```

MVC 리소스 명령을 사용하여 파일을 다운로드했습니다. 이제 어떻게 작동하는지 확인하십시오.

## 포틀릿 검사

`P8V5Portlet` 최소 [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java)입니다.

```{literalinclude} ./mvc-resource-command/resources/liferay-p8v5.zip/p8v5-web/src/main/java/com/acme/p8v5/web/internal/portlet/P8V5Portlet.java
:language: java
:lines: 9-19
```

[`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) `javax.portlet.name` 속성은 포틀릿의 이름을 설정합니다.

```{literalinclude} ./mvc-resource-command/resources/liferay-p8v5.zip/p8v5-web/src/main/java/com/acme/p8v5/web/internal/portlet/P8V5Portlet.java
:dedent: 2
:language: java
:lines: 14
```

```{note}
`MVCResourceCommand`는 포틀릿의 이름(예: 포틀릿 구성 요소 `javax.portlet.name` 속성 값)으로 포틀릿에 바인딩됩니다.
```

다음은 포틀릿의 MVC 자원 명령 클래스입니다.

## MVCResourceCommand 클래스 검사

MVC 리소스 명령 클래스는 [`MVCResourceCommand`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCResourceCommand.java) 직접 구현하거나 [`BaseMVCResourceCommand`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/BaseMVCResourceCommand.java)을 확장하여 간접적으로 구현할 수 있습니다. `P8V5DownloadMVCResourceCommand` `MVCResourceCommand`직접 구현합니다.

```{literalinclude} ./mvc-resource-command/resources/liferay-p8v5.zip/p8v5-web/src/main/java/com/acme/p8v5/web/internal/portlet/action/P8V5DownloadMVCResourceCommand.java
:language: java
:lines: 16-47
```

`P8V5DownloadMVCResourceCommand` `MVCResourceCommand` 서비스를 제공하는 [`Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 입니다. 구성 요소 속성은 `P8V5DownloadMVCResourceCommand` 을 `com_acme_p8v5_web_internal_portlet_P8V5Portlet` 포틀릿에 적용하고 `P8V5DownloadMVCResourceCommand` MVC 명령 이름 `/p8v5/download`에 매핑합니다. 여기에서 지정하는 이름은 포틀릿에 선언된 이름과 일치해야 합니다.

```{note}
각 포틀릿에 대해

      의 `javax.portlet.name` 속성을 선언하여 `MVCResourceCommand` 구성

            
         포틀릿과 연결할 수 있습니다. .name=com_acme_p8v5_web_internal_portlet_P8V6Portlet",
            "mvc.command.name=/p8v5/download"
         },
         서비스 = MVCResourceCommand.class
)
```

예제 `serveResource` 메소드는 간단한 텍스트 파일을 작성하고 [`PortletResponseUtil`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/portlet/PortletResponseUtil.java)를 통해 사용자에게 보냅니다. 메서드는 오류가 발생하면 `참` 반환하고 그렇지 않으면 `거짓` 반환합니다.

다음으로 포틀릿의 JSP가 UI 구성 요소 작업을 명령에 매핑하는 방법을 배웁니다.

## 포틀릿 리소스 URL 검사

포틀릿의 `view.jsp` 파일은 MVC 리소스 명령을 호출하기 위한 링크를 렌더링합니다.

```{literalinclude} ./mvc-resource-command/resources/liferay-p8v5.zip/p8v5-web/src/main/resources/META-INF/resources/p8v5/view.jsp
:language: javascript
```

첫 번째 줄은 `포틀릿` 접두사를 통해 Portlet 2.0 태그 라이브러리를 사용할 수 있도록 합니다. 이 JSP는 태그 라이브러리의 `portlet:resourceURL` 태그를 사용하여 UI 구성 요소에 작업을 바인딩합니다. 태그의 `id` 속성은 MVC 리소스 명령의 `mvc.command.name` 속성 값을 사용합니다. 다음 표는 상관관계를 보여줍니다.

| `view.jsp` 포틀릿 리소스 URL                                                                 | `P8V5DownloadMVCResourceCommand` 구성 요소 속성 |
|:-------------------------------------------------------------------------------------- |:----------------------------------------- |
| `<a href="<portlet:resourceURL id="/p8v5/download" />">Download</a>` | `mvc.command.name=/p8v5/download`         |

뷰의 *다운로드* 링크를 클릭하면 `P8V5DownloadMVCResourceCommand`의 `serveResource` 메서드가 호출됩니다.

## 다음

이제 MVC 리소스 명령을 사용하는 방법을 알게 되었습니다. 포틀릿의 컨텐츠를 현지화하려면 [현지화된 메시지 사용](./using-localized-messages-in-an-mvc-portlet.md)참조하십시오. 모델, 지속성 및 서비스 계층을 개발할 준비가 되었으면 [Service Builder](../../data-frameworks/service-builder.md)방문하십시오.

## 관련 항목

* [MVC 사용](../using-mvc.md)
* [MVC 렌더링 명령](./mvc-render-command.md)
* [MVC 작업 명령](./mvc-action-command.md)
