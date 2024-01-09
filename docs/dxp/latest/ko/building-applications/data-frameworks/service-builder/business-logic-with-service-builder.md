# Service Builder를 사용한 비즈니스 로직

Service Builder를 사용하여 모델, 지속성 및 서비스 코드 [생성된 모델, 지속성 및 서비스 코드](./service-builder-basics/generating-model-persistence-and-service-code.md) 생성하면 비즈니스 로직 추가를 시작할 수 있습니다. Service Builder에서 생성된 엔터티에는 모델 구현 및 로컬 서비스 구현 클래스가 포함됩니다. 애플리케이션의 비즈니스 논리는 이러한 클래스에서 구현될 수 있습니다. 나중에 생성된 서비스에는 지속성 계층에서 CRUD 작업을 호출하는 기본 메서드가 포함됩니다. 비즈니스 논리가 있으면 Service Builder를 다시 실행하여 응용 프로그램의 인터페이스를 전파하면 새 논리를 호출할 수 있습니다.

# 예제 프로젝트 보기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [Service Builder가 포함된 비즈니스 로직](./liferay-e4g5.zip) 을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/service-builder/liferay-e4g5.zip -O
    ```

    ```bash
    unzip liferay-e4g5.zip
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
    STARTED com.acme.e4g5.api_1.0.0 [1034]
    STARTED com.acme.e4g5.service_1.0.0 [1035]
    STARTED com.acme.e4g5.web_1.0.0 [1036]
    ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저에서 `https://localhost:8080`로 엽니다.

1. E4G5 포틀릿을 페이지에 추가하십시오. 샘플 위젯에서 예제 포틀릿을 찾을 수 있습니다.

   ![E4G5 포틀릿을 페이지에 추가하십시오.](./business-logic-with-service-builder/images/01.png)

1. 이름과 설명을 입력하여 항목을 추가합니다(예: e4g5_name1  및 e4g5_description1). `추가`클릭하면 `E4G5 항목`아래에 새 항목이 나타납니다. `e4g5EntryId` 번호를 기록해 둡니다.

1. 다음으로 이 항목을 업데이트하되 이전 단계에서 `e4g5EntryId` 입력하고 새 이름과 설명을 입력합니다. (예: 41804, e4g5_name2, e4g5_description2). `업데이트`클릭하면 이제 항목이 업데이트됩니다.

1. 마지막으로 `e4g5EntryId`입력하여 항목을 삭제합니다. `삭제`클릭하면 항목이 삭제됩니다.

## 서비스 계층 업데이트

`E4G5Entry` 항목을 추가, 업데이트 및 삭제할 수 있는 메서드를 추가하여 로컬 서비스를 확장합니다.

### 추가 방법 구현

1. 엔터티 생성을 위한 매개 변수가 있는 `add*` 메서드를 선언합니다.

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-service/src/main/java/com/acme/e4g5/service/impl/E4G5EntryLocalServiceImpl.java
:language: java
:lines: 34-44
```

1. 엔터티와 연결된 `*Persistence` 클래스에는 주어진 ID로 엔터티 인스턴스를 구성하는 `create()` 메서드가 있습니다. 모든 `*BaseLocalServiceImpl` 엔터티에 대한 `counterLocalService` 개체가 있습니다. 카운터 서비스의 `increment()` 메소드를 호출하여 엔티티 인스턴스에 대한 기본 키를 생성하십시오.

1. 엔티티의 setter 메서드를 사용하여 엔티티의 속성을 채웁니다. 샘플은 `name` 및 `description`의 두 가지 속성을 설정합니다.

1. `*Persistence` 클래스의 `update()` 메소드를 호출하여 엔티티 객체를 전달합니다.

### 업데이트 방법 구현

1. 엔터티를 업데이트하기 위한 매개변수를 사용하여 `update*` 메서드를 선언합니다. 샘플은 `e4g5EntryId`와 함께 `이름` 및 `설명` 속성을 수신합니다.

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-service/src/main/java/com/acme/e4g5/service/impl/E4G5EntryLocalServiceImpl.java
:language: java
:lines: 54-65
```

1. `*Persistence` 클래스의 `findByPrimaryKey()` 메서드를 사용하여 항목 ID로 엔터티 인스턴스를 검색합니다.

1. 엔티티의 setter 메서드를 사용하여 엔티티의 속성을 채웁니다.

1. `*Persistence` 클래스의 `update()` 메소드를 호출하여 엔티티 객체를 전달합니다.

### 삭제 방법 구현

1. 엔터티의 항목 ID를 받는 `delete*` 메서드를 선언합니다.

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-service/src/main/java/com/acme/e4g5/service/impl/E4G5EntryLocalServiceImpl.java
:language: java
:lines: 46-52
```

1. `*Persistence` 클래스의 `delete()` 메소드를 호출하여 엔티티 객체를 전달합니다.

`add*`, `update*`, `delete*` 메서드를 구현한 후 Service Builder를 실행하여 새 서비스 메서드를 `*LocalService` 인터페이스에 전파합니다.

## 백엔드 통합

이제 [포틀릿 작업](../../developing-a-java-web-application/using-mvc/invoking-actions-with-mvc-portlet.md)을 사용하여 웹 모듈에 만든 서비스 메서드를 구현합니다.

### 포틀릿 작업

웹 모듈에 [MVC 포틀릿](../../developing-a-java-web-application/using-mvc.md) 을 사용할 수 있습니다. 샘플 프로젝트의 포틀릿에는 `add`, `update`및 `delete`에 대한 진입 작업이 있습니다.

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-web/src/main/java/com/acme/e4g5/web/internal/portlet/E4G5Portlet.java
:language: java
:lines: 26-51
```

각 메서드는 `ActionRequest` 및 `ActionResponse` 매개 변수를 사용합니다. `ActionRequest` 은 뷰 계층에서 정보를 수신하고 `ActionResponse` 정보를 다시 뷰 계층으로 전달하는 데 사용할 수 있습니다.

`addE4G5Entry()` 메서드는 이름과 설명을 받고 서비스를 호출하여 항목을 추가합니다. `updateE4G5Entry()` 메소드는 항목 ID, 이름 및 설명을 수신하고 서비스를 호출하여 특정 항목을 업데이트합니다. `deleteE4G5Entry()` 메소드는 항목 ID를 수신하고 서비스를 호출하여 항목을 삭제합니다.

### JSP에서 작업 매핑

이제 작성한 조치 메소드를 JSP에 맵핑하십시오.

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 43-77
```

JSP는 태그 라이브러리의 `portlet:actionURL` 태그를 사용하여 UI 구성 요소에 작업을 바인딩합니다. `portlet:actionURL`의 `name` 속성은 포틀릿에서 작성된 각각의 조치 메소드와 일치해야 합니다. `var` 속성은 포틀릿 조치 URL을 임의의 변수에 지정합니다. `<aui:form>` 는 사용자 입력을 위한 텍스트 필드를 렌더링합니다. 양식을 제출하면 해당 값이 `ActionRequest` 과 함께 포틀릿 메소드에 전달됩니다.
