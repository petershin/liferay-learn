# DDM 양식 주석

자동 생성된 [구성 인터페이스](./setting-and-accessing-configurations.md#creating-the-configuration-interface) UI는 일부 구성에 너무 단순할 수 있습니다. 동적 데이터 매핑(DDM) 양식 주석을 사용하여 레이아웃의 UI를 사용자 지정할 수 있습니다.

## 구성 UI 샘플 보기

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. [DDM 양식 주석](./liferay-v1d9.zip)을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-v1d9.zip -O
    ```

    ```bash
    unzip liferay-v1d9.zip
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
    STARTED com.acme.v1d9.impl_1.0.0 [1650]
    ```

1. 브라우저를 열고 `https://localhost:8080` 로 이동한 후 *제어판* &rarr; *구성* &rarr; *시스템 설정*으로 이동합니다. 플랫폼에서 *타사*를 클릭합니다. 왼쪽의 *V1D9 구성* 을 클릭합니다.

    ![UI 레이아웃은 DDM 양식 어노테이션으로 사용자 정의할 수 있습니다.](./ddm-form-annotations/images/01.png)

DDM 양식 주석의 작동 방식은 다음과 같습니다.

## 구성 양식 작성

설정 UI에 모든 양식 필드를 포함하는 구성 양식 인터페이스를 만듭니다. 각 필드에 `@DDMFormField` 어노테이션을 사용합니다. `레이블`, `속성`, `유형` 와 같은 속성을 각 필드에 정의합니다.

```{literalinclude} ./ddm-form-annotations/resources/liferay-v1d9.zip/v1d9-impl/src/main/java/com/acme/v1d9/internal/configuration/admin/definition/V1D9ConfigurationForm.java
:dedent: 1
:language: java
:lines: 37-58
```

사용 가능한 모든 필드 유형에 대해 자세히 알아보려면 [양식 필드 유형 참조](../../../process-automation/forms/creating-and-managing-forms/forms-field-types-reference.md) 를 방문하세요. 각 필드 유형의 `유형` 변수 이름은 [필드 유형 상수](https://github.com/liferay/liferay-portal/blob/master/modules/apps/dynamic-data-mapping/dynamic-data-mapping-form-field-type-api/src/main/java/com/liferay/dynamic/data/mapping/form/field/type/constants/DDMFormFieldTypeConstants.java) 를 참조하십시오.

각 양식 필드에 주석을 단 후 클래스 선언 바로 위에 `DDMFormLayout` 어노테이션을 사용하여 양식의 레이아웃을 정의합니다.

```{literalinclude} ./ddm-form-annotations/resources/liferay-v1d9.zip/v1d9-impl/src/main/java/com/acme/v1d9/internal/configuration/admin/definition/V1D9ConfigurationForm.java
:language: java
:lines: 10-34
```

`DDMFormLayoutRow` 어노테이션과 `DDMFormLayoutColumn` 어노테이션을 사용하여 UI에 필요한 행과 열에 양식 필드를 정렬합니다.

## 양식 선언 작성

`ConfigurationDDMFormDeclaration` 의 새 구현을 생성하여 새 구성 양식 클래스를 등록합니다.

```{literalinclude} ./ddm-form-annotations/resources/liferay-v1d9.zip/v1d9-impl/src/main/java/com/acme/v1d9/internal/configuration/admin/definition/V1D9ConfigurationDDMFormDeclaration.java
:language: java
:lines: 7-19
```

`Component` 어노테이션의 `configurationPid` 는 구성 인터페이스의 정규화된 클래스 이름과 일치해야 합니다.
