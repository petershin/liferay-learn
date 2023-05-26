# 문맥 재산

구성 옵션은 **포털 속성** , 속성 파일에서 읽은 이름/값 쌍 세트 및 서버 시작 시 Docker 환경 변수를 사용하여 지정됩니다. [기본값](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 은 `portal-impl.jar/portal.properties` 파일에 지정됩니다.

일부 속성은 사용자 인터페이스(UI)를 통해 변경할 수 있지만 다른 속성은 속성 파일 또는 Docker 환경 변수에서만 변경할 수 있습니다. 여기에는 데이터베이스 연결, [Liferay Home 폴더의 사이트 선언,](./liferay-home.md) 사용자 인증 방법 변경 [이메일 주소 대신 화면 이름 사용](../securing-liferay/authentication-basics.md#configuring-authentication-type-using-properties) 이 포함됩니다.

Liferay 설치는 속성 파일을 사용합니다. 규칙에 따라 기본 속성 값을 재정의하려면 [`[Liferay Home]`](./liferay-home.md) 폴더 또는 `[USER_HOME]` 폴더에 `Portal-ext.properties` 을 생성해야 합니다. 신규 또는 수정된 속성 파일을 적용하려면 DXP를 다시 시작해야 합니다.

```{warning}
`portal-impl.jar/portal.properties` 파일을 직접 수정하지 마십시오. 대신 변경하려는 속성을 재정의할 별도의 파일을 만듭니다. 이를 위해 `portal-ext.properties` 파일이 정의되었습니다.
```

`Portal-ext.properties` 파일을 사용하여 기본 속성을 재정의하면 다음과 같은 이점이 있습니다.

* 다른 Liferay DXP 환경 및 서버 노드에 파일을 복사할 수 있습니다.
* 구성 관리를 단순화하기 위해 버전 제어 시스템에 구성을 저장할 수 있습니다.
* 초기 시작 전에 파일에서 속성을 설정하는 것이 Liferay를 구성하는 가장 빠른 방법입니다.

포털 속성은 환경 변수(Env 변수) 및 속성 파일이 있는 Liferay Docker 컨테이너에 적용됩니다. 포털 속성으로 Docker 컨테이너를 구성하려면 [컨테이너 구성](../installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables) 을 참조하십시오.

**컨텐츠:**

* [포털 속성 사용](#using-portal-properties)
* [포털 속성 우선 순위](#portal-property-priority)
* [시스템 설정 및 구성 파일 사용](#using-system-settings-and-configuration-files)

```{note}
DXP 7.3부터는 가상 인스턴스별 포털 속성 파일 기능이 제거되었습니다. DXP는 더 이상 '[companyId]' 형식 파일의 인스턴스별 속성을 회사 ID와 일치하는 인스턴스에 적용하지 않습니다.
```

## 포털 속성 사용

`[Liferay Home]/portal-ext.properties`을 생성할 때 모범 사례는 관련 섹션을 `portal-impl.jar/portal.properties` 에서 `portal-ext.properties` 파일로 복사한 다음 변경하는 것입니다. 당신이 원하는 가치.

```{note}
[Setup Wizard](../installing-liferay/running-liferay-for-the-first-time.md)를 사용하면 DXP는 `portal-setup-wizard.properties` 파일에 해당 속성을 설정합니다. [라이프레이 홈]`.
```

다음은 몇 가지 구성 예입니다.

### 데이터베이스 연결 설정

데이터베이스 연결 속성은 가장 일반적으로 `portal-ext.properties` 파일에 설정됩니다. 예를 들어 데이터베이스 연결을 변경하려면 `portal-ext.properties` 파일을 만들고 [데이터베이스 연결 속성](./database-templates.md) 을 원하는 값으로 설정합니다.

```properties
jdbc.default.driverClassName=org.mariadb.jdbc.Driver
jdbc.default.url=jdbc:mariadb://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
jdbc.default.username=joe.bloggs
jdbc.default.password=123456
```

데이터베이스 구성에 대한 자세한 내용은 [데이터베이스 구성](./database-configurations.md) 및 [데이터베이스 템플릿](./database-templates.md)을 참조하십시오.

### Liferay 홈 사이트 설정

일부 애플리케이션 서버(예: WebLogic)는 DXP WAR 파일을 배포하기 전에 [Liferay 홈 사이트를 사용자 지정해야](../installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md#declare-the-liferay-home-folder) . [`liferay.home`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Liferay%20Home) 속성은 사이트를 설정합니다.

```properties
liferay.home=/home/jbloggs/liferay
```

### 사용자 인증 방법 변경

사용자 인증 방법을 변경하려면 다음 `company.security.auth.type` 속성 값 중 하나를 추가합니다.

```properties
company.security.auth.type=emailAddress
```

```properties
company.security.auth.type=screenName
```

```properties
company.security.auth.type=userId
```

## 포털 속성 우선 순위

포털 속성은 세 가지 소스에서 설정됩니다.

* `개 portal.properties` 는 `portal-impl.jar`개에 번들로 제공됩니다.
* 확장 속성 파일(예: `portal-ext.properties`)
* [환경 변수](../installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables)

지정된 속성의 경우 마지막으로 읽은 값이 우선합니다. 속성 소스는 `include-and-override`라는 속성을 통해 구성 가능한 [결정론적 순서](#configuration-processing) 로 읽습니다.

### 구성 처리

기본적으로 속성은 다음 순서로 읽습니다.

```properties
portal-impl.jar/portal.properties
include-and-override=portal-bundle.properties
include-and-override=${liferay.home}/portal-bundle.properties
include-and-override=portal-ext.properties
include-and-override=${liferay.home}/portal-ext.properties
include-and-override=portal-setup-wizard.properties
include-and-override=${liferay.home}/portal-setup-wizard.properties
include-and-override=${external-properties}
include-and-override=${liferay.home}/${external-properties}
[Added `include-and-override` files]
[Liferay Docker Env variables]
```

`portal-impl.jar/portal.properties` 파일은 위의 `포함 및 재정의` 정의를 지정합니다. 다른 유효한 속성 소스가 추가 또는 경쟁 `포함 및 재정의` 속성 값을 정의하는 경우 기본값을 재정의하는 데 사용됩니다.

![DXP 서버가 사용하고 있는 포함된 확장 파일 목록은 제어판의 구성 섹션에 있는 서버 관리 페이지에서 사용할 수 있습니다.](./portal-properties/images/01.png)

`${external-properties}` 정의는 DXP의 Java 속성 `외부 속성` (예: `-Dexternal-properties=some.properties`)에 할당된 모든 속성 파일을 나타냅니다.

Liferay Docker 컨테이너는 Liferay 환경 변수를 목록에 추가된 포털 속성 소스로 집계합니다.

```{important}
둘 이상의 파일에서 속성을 재정의하는 경우 **마지막**으로 정의된 속성 소스가 우선합니다. 다른 모든 것은 무시됩니다.
```

### Portal 속성 우선 순위 예

다음 예는 속성 소스 및 특정 속성이 DXP를 구성하는 방법을 보여줍니다.

#### 예 1: `portal-ext.properties` 을 사용하여 속성 재정의

애플리케이션 서버에서 메일 세션을 구성했고 이름이 `portal-impl.jar/portal.properties` 의 기본값과 다른 경우( `mail.session.jndi.name=mail/MailSession`설정) 다음을 지정하십시오. `Portal-ext.properties` 파일의 메일 세션 이름.

`portal-ext.properties`의 새 값:

```properties
mail.session.jndi.name=mail/SomeMailSession
```

결과 속성 소스 순서:

1. `portal-impl.jar/portal.properties`
1. `[Liferay Home]/portal-ext.properties`

`mail.session.jndi.name` 에 대해 정의된 마지막 값은 `[Liferay Home]/portal-ext.properties`에 있습니다.

결과 구성:

```properties
mail.session.jndi.name=mail/SomeMailSession
```

#### 예 2: 속성 파일 추가

개발 환경과 같은 특정 환경에 대한 속성 파일을 추가할 수 있습니다. 그런 다음 일반 속성에 대해 단일 `Portal-ext.properties` 을 사용하고 다른 속성에 대해 환경별 구성을 사용할 수 있습니다.

1. 환경에 대한 임의의 확장 파일(예: `Portal-developer.properties`)을 만들고 여기에 환경별 속성을 추가합니다.

    ```properties
    mail.session.jndi.name=mail/DevMailSession
    ```

1. 이 `include-and-override` 속성을 `portal-ext.properties` 파일의 맨 위에 추가하여 새 확장 파일을 속성 소스로 포함합니다.

    ```properties
    include-and-override=portal-developer.properties
    ```

결과 속성 소스 순서:

1. `portal-impl.jar/portal.properties`
1. `[Liferay Home]/portal-ext.properties`
1. `[Liferay Home]/portal-developer.properties`

`mail.session.jndi.name` 에 정의된 마지막 값은 `[Liferay Home]/portal-developer.properties`에 있습니다.

결과 구성:

```properties
mail.session.jndi.name=mail/DevMailSession
```

```{tip}
필요한 만큼의 속성 파일을 사용하면 DXP 구성 관리가 간소화됩니다.
```

## 시스템 설정 및 구성 파일 사용

일부 속성은 [시스템 설정](../../system-administration/configuring-liferay/system-settings.md) 및 [구성 파일](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)을 사용하여 설정할 수 있습니다. 예를 들어 SAML 인증 속성은 시스템 설정에서 사용할 수 있는 속성입니다.

DXP 데이터베이스에 저장된 속성은 포털 속성 파일에 설정된 속성보다 우선 순위가 높습니다.

**제어판** 의 **구성** &rarr; **시스템 설정** 으로 이동하여 시스템 설정을 찾습니다. 시스템 설정을 `.config` 파일로 내보내 소스 제어에 저장하고 분산 DXP 설치에서 사용할 수 있습니다. 시스템 설정 및 구성 파일을 통해 설정된 포털 속성은 데이터베이스에 저장됩니다. 일부 속성은 즉시 적용되지만 다른 속성은 서버를 다시 시작해야 합니다.

## 관련 주제

* [문맥 재산](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html)
* [포털 개발자 속성](../../liferay-internals/reference/portal-developer-properties.md)
* [컨테이너 구성](../installing-liferay/using-liferay-docker-images/configuring-containers.md)
* [시스템 설정](../../system-administration/configuring-liferay/system-settings.md)
* [구성 파일 이해](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)