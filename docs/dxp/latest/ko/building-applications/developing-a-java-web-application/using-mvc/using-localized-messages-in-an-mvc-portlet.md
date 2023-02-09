# MVC 포틀릿에서 지역화된 메시지 사용

Liferay의 현지화 프레임워크는 MVC 포틀릿에서 현지화된 메시지를 생성하기 위한 것입니다.

## 샘플 코드 배포
```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. 예제를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-b6f5.zip -O
    ```

    ```bash
    unzip liferay-b6f5.zip
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
    STARTED com.acme.b6f5.web.0.0 [1009]
    ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저를 `https://localhost:8080`로 엽니다.

1. 페이지에 B6F5 포틀릿을 추가합니다. 샘플 위젯에서 예제 포틀릿을 찾을 수 있습니다.

    ![페이지에 B6F5 포틀릿을 추가합니다.](./using-localized-messages-in-an-mvc-portlet/images/01.png)

    예제에서 환영 메시지 헤더가 표시되어야 합니다.

1. 예제 프로젝트에는 포르투갈어 및 일본어용 로케일도 포함되어 있습니다. 예를 들어 환영 메시지를 보려면 언어 선택기를 사용하여 포르투갈어(브라질) 또는 일본어를 선택합니다.

    ![이 예는 포르투갈어 및 일본어에 대한 로케일을 보여줍니다.](./using-localized-messages-in-an-mvc-portlet/images/02.png)

이제 어떻게 작동하는지 볼 수 있습니다.

## 언어 속성 파일 만들기

`Language.properties` 파일을 만들고 모듈의 `src/main/resources/content` 폴더에 추가합니다. 파일에서 MVC 포틀릿에서 사용할 키를 정의합니다.

다른 로캘에 대한 언어 속성 파일도 폴더에 포함될 수 있습니다. 예를 들어 일본어에 대한 언어 키를 포함하려면 폴더에 `Language_ja.properties` 파일을 추가합니다.

## JSP 파일 생성

JSP 파일을 생성하고 모듈의 `/src/main/resources/META-INF/resources` 폴더에 추가합니다.

예제 프로젝트에는 liferay-ui 태그 라이브러리를 사용하는 간단한 환영 메시지가 있는 `view.jsp` 파일이 포함되어 있습니다.

```jsp
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<h4>B6F5 Portlet</h4>

<h5><liferay-ui:message key="b6f5-portlet-welcome" /></h5>
```

예제 jsp 파일에는 추가 `liferay-ui:message` 이 포함되어 있습니다.

```jsp
<liferay-ui:message key="supercalifragilisticexpialidocious" />
```

이것은 `Language.properties` 파일에서 그러한 키가 발견되지 않으면 레이블이 대신 나타남을 보여줍니다.

[Liferay 태그 라이브러리 참조](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/index.html)에서 태그 라이브러리에 대해 자세히 알아보십시오. 각 태그 라이브러리에는 태그에 전달할 수 있는 속성 목록이 있습니다.

## 구성 요소 정의 추가

사용자 지정 MVC 포틀릿을 만들 때 클래스의 `@Component` 정의에 언어 리소스 번들 속성을 포함해야 합니다.

```java
@Component(
    property = {
      ...
        "javax.portlet.resource-bundle=content.Language",
        "javax.portlet.supported-locale=en_US,ja,pt_BR"
    },
    service = Portlet.class
)
```

예제 프로젝트에는 언어 리소스 번들을 사용하기 위해 이 속성이 포함되어 있습니다.

```java
"javax.portlet.resource-bundle=content.Language"
```

포틀릿이 지원하는 모든 언어에 대해 다른 로케일도 정의됩니다.

```java
"javax.portlet.supported-locale=en_US,ja,pt_BR"
```
