# 필드 옵션 공급자

구성 인터페이스의 `@Meta.AD` 주석에서 [수동으로 드롭다운 목록](./setting-and-accessing-configurations.html#implementing-a-dropdown-selection-ui) 을 채울 수 있습니다. 그러나 `ConfigurationFieldOptionsProvider` 클래스를 사용하여 옵션 레이블과 값을 자동으로 채울 수도 있습니다. 이는 드롭다운 목록을 동적으로 채우려는 경우에 유용합니다. 예를 들어 웹 서비스에서 개체 목록을 가져오거나 데이터베이스를 반복하여 드롭다운 목록을 동적으로 채울 수 있습니다.

## 튜토리얼 코드 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Field Options Provider](./liferay-z4h3.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-z4h3.zip -O
    ```

    ```bash
    unzip liferay-z4h3.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다. 

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다. 

    ```
    STARTED com.acme.z4h3.impl_1.0.0 [1150]
    ```

1. 브라우저를 `https://localhost:8080` 로 열고 *제어판* &rarr; *구성* &rarr; *시스템 설정*로 이동합니다. 플랫폼에서 *Third Party*을 클릭합니다. 왼쪽에서 *Z4H3 구성* 을 클릭합니다.
   
   ![설정 UI에는 두 개의 드롭다운 목록이 표시됩니다.](./field-options-provider/images/01.png)

첫 번째 드롭다운 목록은 `@Meta.AD` 주석으로 수동으로 채워집니다. 두 번째 드롭다운 목록은 필드 옵션 공급자로 채워집니다.

## 구성 인터페이스 설정

[구성 인터페이스](./setting-and-accessing-configurations.html#creating-the-configuration-interface) 을 생성하고 채워질 구성 필드 이름을 설정합니다.

```{literalinclude} ./field-options-provider/resources/liferay-z4h3.zip/z4h3-impl/src/main/java/com/acme/z4h3/internal/configuration/Z4H3Configuration.java
:dedent: 1
:language: java
:lines: 11-22
```

샘플 프로젝트에서 `providerPopulatedColors` 은 채울 구성 필드 이름입니다.

## 필드 옵션 공급자 구현

`ConfigurationFieldOptionsProvider` 클래스를 구현하는 새 클래스를 만듭니다. 

```{literalinclude} ./field-options-provider/resources/liferay-z4h3.zip/z4h3-impl/src/main/java/com/acme/z4h3/internal/configuration/admin/definition/Z4H3ConfigurationFieldOptionsProvider.java
:language: java
:lines: 14-20
```

`@Component` 주석을 사용하여 서비스를 등록하십시오. 이전 단계의 `configuration.field.name` 을 포함합니다. `configuration.pid` 을 구성 인터페이스의 정규화된 클래스 이름으로 설정합니다.

```{literalinclude} ./field-options-provider/resources/liferay-z4h3.zip/z4h3-impl/src/main/java/com/acme/z4h3/internal/configuration/admin/definition/Z4H3ConfigurationFieldOptionsProvider.java
:dedent: 1
:language: java
:lines: 24-46
```

`getOptions` 메서드를 추가하여 `Option`목록을 반환합니다. 샘플 프로젝트에는 `optionValue` 을 색상의 문자열로 설정하고 `optionLabel` 을 해당 색상의 `Langauge.properties` 파일에 저장된 문자열로 설정하는 배열이 포함되어 있습니다.

자습서 코드는 문자열 배열의 간단한 예를 사용하지만 더 복잡한 사용 사례도 가능합니다.

[`EnabledClassNamesConfigurationFieldOptionsProvider.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/asset/asset-auto-tagger-service/src/main/를 사용하여 실제 Liferay 예제를 참조하십시오. java/com/liferay/asset/auto/tagger/internal/configuration/admin/definition/EnabledClassNamesConfigurationFieldOptionsProvider.java) . 이 코드는 `AssetRendererFactory` 개체 목록을 가져오고 목록을 반복하면서 자산의 유형 이름을 레이블로 사용하고 클래스 이름을 값으로 사용하여 `Option`의 새 목록을 채웁니다.
