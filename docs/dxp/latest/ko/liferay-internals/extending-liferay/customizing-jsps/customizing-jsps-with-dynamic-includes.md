# Dynamic Include로 JSP 사용자 지정

[`liferay-util:dynamic-include` 태그](https://learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-util/dynamic-include.html) 는 콘텐츠(JavaScript 코드, HTML, 등)를 주입할 수 있는 자리 표시자입니다. 예제 프로젝트는 동적 포함으로 콘텐츠를 삽입하는 방법을 보여줍니다.

## 예제 프로젝트 배포
```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Customizing JSPs with Dynamic Includes](./liferay-n3q9.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/customizing-jsps/liferay-n3q9.zip -O
   ```

   ```bash
   unzip liferay-n3q9.zip
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
   STARTED com.acme.n3q9.able.web_1.0.0 [1459]
   STARTED com.acme.n3q9.baker.web_1.0.0 [1460]
   ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저에서 `https://localhost:8080`로 엽니다.

1. 사이트 페이지로 이동하고 편집 아이콘(![Edit icon](../../../images/icon-edit.png))을 클릭합니다. N3Q9 Baker 포틀릿을 페이지에 추가하십시오. 위젯은 샘플 위젯에서 찾을 수 있습니다.

   ![사이트 페이지에 N3Q9 Baker 포틀릿을 추가합니다.](./customizing-jsps-with-dynamic-includes/images/01.png)

   처음 두 줄은 N3Q9 Baker Portlet에서 가져오지만 세 번째 줄은 N3Q9 Able 모듈의 동적 포함에서 삽입됩니다.

## 동적 포함 구현

1. `@Component` 주석이 있는 `DynamicInclude` 구현으로 클래스를 선언합니다.

   ```java
   @Component(service = DynamicInclude.class)
   ```

1. `포함` 방법에서 사용자 지정 콘텐츠를 추가합니다. 샘플 프로젝트는 간단한 `PrintWriter` 예제를 사용합니다.

   ```{literalinclude} ./customizing-jsps-with-dynamic-includes/resources/liferay-n3q9.zip/n3q9-able-web/src/main/java/com/acme/n3q9/able/web/internal/servlet/taglib/N3Q9AbleDynamicInclude.java
   :dedent: 1
   :language: java
   :lines: 16-25
   ```

2. `레지스터` 메서드에서 사용할 동적 포함 태그를 지정합니다. 샘플에서 register 메소드는 Baker 모듈의 `view.jsp`의 동적 포함을 대상으로 합니다.

   ```java
    @Override
    public void register(DynamicIncludeRegistry dynamicIncludeRegistry) {
        dynamicIncludeRegistry.register("com.acme.n3q9.baker.web#view.jsp");
    }
   ```

## 동적 포함 삽입

동적 포함을 삽입하려는 위치에 `liferay-util:dynamic-include` 태그를 추가합니다. 샘플에서 태그는 N3Q9 Baker Portlet의 `view.jsp`하단에 추가됩니다.

```{literalinclude} ./customizing-jsps-with-dynamic-includes/resources/liferay-n3q9.zip/n3q9-baker-web/src/main/resources/META-INF/resources/view.jsp
   :language: jsp
```

동적 포함 `키` 이 위의 `register()` 메서드에서 설정한 대상과 일치하는지 확인하세요.

JSP 및 포틀릿에 대한 자세한 내용은 [JSP 및 MVC 포틀릿 사용](../../../building-applications/developing-a-java-web-application/using-mvc/using-a-jsp-and-mvc-portlet.md) 을 참조하십시오.
