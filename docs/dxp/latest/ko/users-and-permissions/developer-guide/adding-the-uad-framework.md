# UAD 프레임워크 추가

Liferay의 UAD(User Associated Data) 관리 도구를 사용하여 [사용자 데이터 관리 및 삭제](../managing-user-data.md)를 할 수 있습니다. 이 도구는 많은 Liferay 응용 프로그램(예: 블로그, 문서 및 미디어, 메시지 보드 등)에서 즉시 사용할 수 있습니다. 이 프레임워크는 맞춤형 애플리케이션에도 적용할 수 있습니다.

이 작업은 [Service Builder](../../building-applications/data-frameworks/service-builder.md)을 사용하면 더 쉬워집니다. Service Builder가 애플리케이션에 대해 UAD를 활성화하는 데 필요한 코드를 자동으로 생성하는 방법을 알아보려면 아래 예를 참조하십시오.

## 예제 코드 다운로드

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [UAD 프레임워크](./liferay-h6d2.zip)를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-h6d2.zip -O
    ```

    ```bash
    unzip liferay-h6d2.zip
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
    STARTED com.acme.h6d2.api_1.0.0 [1433]
    STARTED com.acme.h6d2.service_1.0.0 [1434]
    STARTED com.acme.h6d2.uad_1.0.0 [1435]
    STARTED com.acme.h6d2.web_1.0.0 [1436]
    ```

1. 브라우저에서 `https://localhost:8080`로 엽니다.

1. 페이지에 H6D2 포틀릿을 추가합니다. 샘플 위젯에서 예제 포틀릿을 찾을 수 있습니다.
   
   ![페이지에 H6D2 포틀릿을 추가합니다.](./adding-the-uad-framework/images/01.png)

1. [테스트를 위해 새 사용자](../users/adding-and-managing-users.md) 을 만듭니다.

1. 새 사용자로 로그인하고 H6D2 포틀릿에 일부 콘텐츠를 추가합니다.

1. 관리자로 다시 로그인하고 *제어판* &rarr; *사용자* &rarr; *사용자 및 조직*로 이동합니다. 

1. 새 사용자의 *작업* 아이콘(![Action](../../images/icon-actions.png)) &rarr; *개인 데이터 삭제*를 클릭합니다. *확인* 을 클릭하여 사용자 비활성화를 확인합니다.

1. UAD 관리 도구가 나타납니다. 새 사용자가 H6D2 포틀릿에 추가한 데이터를 보거나 익명화하거나 삭제할 수 있습니다.
   
   ![H6D2 포틀릿에 추가된 사용자 데이터 보기, 익명화 또는 삭제.](./adding-the-uad-framework/images/02.png)

## 서비스 모델 정의 수정

이 자습서에서는 Service Builder를 사용하여 생성한 작동 중인 애플리케이션이 있다고 가정합니다. UAD를 활성화하려면 먼저 엔티티를 다음과 같이 변경하십시오.

1. `-service` 폴더에서 `service.xml` 파일을 엽니다.

1. UAD를 활성화하기 위한 두 개의 `엔티티` 매개변수가 있습니다.


   | `엔티티` 속성               | 묘사                            |
   |:---------------------- |:----------------------------- |
   | `uad-application-name` | 엔티티 유형이 속한 애플리케이션의 이름을 지정합니다. |
   | `uad-package-path`     | 생성된 UAD 클래스의 패키지 경로를 지정합니다.   |

   ```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-service/service.xml
   :language: xml
   :lines: 6
   ```

1. 아직 정의하지 않은 경우 다음 데이터 필드를 추가합니다. 

   ```xml
   <!-- Group instance -->

   <column name="groupId" type="long" />

   <!-- Audit fields -->

   <column name="companyId" type="long" />
   <column name="userId" type="long" />
   <column name="userName" type="String" />
   <column name="createDate" type="Date" />
   <column name="modifiedDate" type="Date" />
   ```

UAD 프레임워크는 사용자 데이터를 추적하고 익명화하기 위해 이러한 필드가 필요합니다.

1. 다음으로 익명화할 데이터 필드를 지정합니다. 이것은 두 가지 속성을 사용하여 수행됩니다.

   * `uad-anonymize-field-name=[fieldName]` 속성은 UAD 자동 익명화 과정에서 익명 사용자의 값으로 대체되는 필드를 나타낸다. 예를 들어 `uad-anonymize-field-name=fullName` 로 설정하면 해당 필드의 값이 익명 사용자의 전체 이름으로 대체됩니다. 익명 사용자에 대한 자세한 내용은 [익명 사용자 구성](../managing-user-data/configuring-the-anonymous-user.md) 을 참조하십시오.

   * `uad-nonanonymizable="true"` 속성은 자동으로 익명화되지 않지만 관리자가 검토해야 하는 데이터를 나타냅니다. 

   ```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-service/service.xml
   :language: xml
   :lines: 20
   ```

## UAD 모듈 생성

1. `-service` 폴더 밖으로 이동하여 새 `-uad` 폴더를 만듭니다.

1. 모듈에 대한 `bnd.bnd` 파일을 만듭니다.
   
   ```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-uad/bnd.bnd   
    ```

   Make sure to include the `-dsannotations-options: inherit` annotation. OSGi service component classes inherit [OSGi declarative services](../../liferay-internals/fundamentals/module-projects.md) annotations from their class hierarchy.

1. Create a `build.gradle` file for the module.

    ```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-uad/build.gradle
    ```

프로젝트의 `-api` 모듈을 포함하여 필요한 모든 종속성을 추가해야 합니다.

2. 모듈의 `-service` 폴더로 돌아가 Service Builder를 실행하여 UAD 모듈을 생성합니다. 

    ```bash
    ../gradlew buildService
    ```

산출량: 

    ```
    > Task :h6d2-service:buildService
    Building H6D2Entry
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/anonymizer/BaseH6D2EntryUADAnonymizer.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/exporter/BaseH6D2EntryUADExporter.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/anonymizer/H6D2EntryUADAnonymizer.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/exporter/H6D2EntryUADExporter.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/display/BaseH6D2EntryUADDisplay.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/display/H6D2EntryUADDisplay.java
    Writing src/main/resources/service.properties
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/constants/H6D2UADConstants.java
    ```

## 포틀릿 수정

양식에서 애플리케이션에 특정한 데이터 필드를 전달할 때 `service.xml` 파일에 추가한 사용자 관련 데이터 필드도 전달해야 합니다.

```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-web/src/main/java/com/acme/h6d2/web/internal/portlet/H6D2Portlet.java
:language: java
:lines: 30-66
```

`H6D2 Portlet` 에는 `_h6d2EntryLocalService` 라는 `H6D2EntryLocalService` 필드와 `addH6D2Entry`이라는 작업 처리 메서드가 있습니다. `addH6D2Entry` 메서드는 `H6D2EntryLocalService`의 `addH6D2Entry` 메서드를 호출하여 `ActionRequest`에서 받은 데이터 필드를 전달합니다. 

포틀릿의 `view.jsp` 에는 사용자가 `ActionRequest` 에서 `H6D2 Portlet`로 제출할 수 있는 양식이 포함되어 있습니다.

```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 18-26
```

`ActionRequest` 을 `actionURL` 과 함께 제출하면 포틀릿의 `addH6D2Entry` 메소드가 호출됩니다. 

## 추가 정보

* [사용자 데이터 관리](../managing-user-data.md)
* [서비스 빌더](../../building-applications/data-frameworks/service-builder.md)
* [MVC 사용](../../building-applications/developing-a-java-web-application/using-mvc.md)
