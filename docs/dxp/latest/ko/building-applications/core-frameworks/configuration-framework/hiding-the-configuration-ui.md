# 구성 UI 숨기기

Liferay는 [구성 인터페이스가](./setting-and-accessing-configurations.md#creating-the-configuration-interface) 을 배포한 후 자동으로 구성 UI를 생성합니다. 하지만 UI를 숨기고 싶은 특정 사용 사례가 있을 수 있습니다. 예를 들어 관리자가 특정 구성에 액세스하지 못하도록 하거나 특정 기준에 따라 구성을 숨기고자 하는 경우입니다. 구성 UI를 숨기려면 두 가지 옵션이 있습니다:

* `generateUI` 어노테이션 속성 사용
* 구성 가시성 인터페이스 사용

## `generateUI`사용

모든 상황에서 구성 UI를 숨기려면 구성 인터페이스에 `ExtendedObjectClassDefinition` 어노테이션 속성 `generateUI` 을 포함하세요. 속성을 `false`로 설정합니다. 이렇게 하면 모든 범위에 대한 구성 UI가 숨겨집니다.

```java
@ExtendedObjectClassDefinition(generateUI=false)
```

## 구성 가시성 인터페이스 사용

구성 UI를 선택적으로 숨기려면 `ConfigurationVisibilityController` 인터페이스를 사용하세요.

### 구현 예시 보기

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [구성 UI 숨기기](./liferay-g8v3.zip)를 다운로드하고 압축을 푼다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-g8v3.zip -O
    ```

    ```bash
    unzip liferay-g8v3.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jars를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.g8v3.impl_1.0.0 [1650]
    ```

1. 브라우저를 열고 `https://localhost:8080` 로 이동한 후 **제어판** &rarr; **구성** &rarr; **시스템 설정** 으로 이동합니다. 플랫폼에서 **타사** 를 클릭합니다. 왼쪽의 **G8V3 에이블 구성** 을 클릭합니다. G8V3 베이커 구성 활성화 확인란을 선택합니다. **업데이트** 버튼을 클릭합니다.

    ![확인란을 클릭하면 다른 구성 UI가 표시됩니다.](./hiding-the-configuration-ui/images/01.png)

1. 이 확인란을 활성화하지 않으면 G8V3 베이커 구성이 숨겨집니다.

### 인터페이스 구현

애플리케이션에 대한 구성 가시성 인터페이스를 만듭니다.

```{literalinclude} ./hiding-the-configuration-ui/resources/liferay-g8v3.zip/g8v3-impl/src/main/java/com/acme/g8v3/internal/configuration/admin/display/G8V3BakerConfigurationVisibilityController.java
:language: java
:lines: 17-48
```

`@Component` 어노테이션으로 구성 인터페이스를 식별합니다. `Component` 어노테이션의 `configuration.pid` 는 구성 인터페이스의 정규화된 클래스 이름과 일치해야 합니다.

인터페이스의 `isVisible()` 메서드에 대한 로직을 직접 작성하세요. 예제 프로젝트는 간단한 로직을 사용하여 G8V3 에이블 구성의 부울 설정을 확인합니다. 애플리케이션에서 구성 UI를 숨기거나 표시하는 프로그래밍 로직을 직접 설계하세요.
