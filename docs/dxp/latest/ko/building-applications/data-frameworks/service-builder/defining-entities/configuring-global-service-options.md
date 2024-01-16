# 글로벌 서비스 옵션 구성

서비스의 전역 옵션은 모든 엔터티에 적용됩니다. 옵션은 다음과 같습니다.

* [종속성 인젝터](#dependency-injector)
* [패키지 경로](#package-path)
* [다중 버전 동시성 제어](#multiversion-concurrency-control-mvcc)
* [네임스페이스 옵션](#namespace-options)
* [작성자](#author)

## 종속성 인젝터

기본 종속성 인젝터는 OSGi Declarative Services입니다. 이를 통해 Service Builder는 다른 모듈과 동일한 방식으로 일관되게 작동합니다. DXP/Portal 7.2 이전에는 Service Builder가 Spring 종속성 주입을 사용했습니다. 유일한 차이점은 서비스를 사용하려고 할 때 서비스를 주입하는 방법입니다. 자세한 내용은 [핵심 프레임워크](../../../core-frameworks.md) 에서 **종속성 주입** 을 참조하세요. 두 인젝터 설정이 아래에 나와 있습니다.

선언적 서비스 종속성 인젝터:

```xml
<service-builder dependency-injector="ds">
```

스프링 종속성 인젝터:

```xml
<service-builder dependency-injector="spring">
```

```{important}
[Service Builder 템플릿](../../../tooling/blade-cli/generating-projects-with-blade-cli.md#creating-a-project) 을 사용하여 프로젝트를 생성하면 Declarative Services는 종속성 인젝터 및 해당 종속성은 기본적으로 프로젝트에 대해 구성됩니다. 대신 Spring 의존성 인젝터를 사용하려면 [Blade CLI](../../../tooling/blade-cli/generating-projects-with-blade-cli.md)의 Service Builder 템플릿과 `--dependency-injector spring` 옵션. 
```

```{note}
Liferay DXP/Portal 7.2 이전에는 Spring이 유일한 종속성 인젝터였습니다. 서비스는 Spring Bean이었습니다. Liferay의 Spring bean 프레임워크는 서로 참조하는 Spring bean을 수용합니다. 예를 들어 Spring bean A에는 Spring bean B 필드가 있고 그 반대도 마찬가지입니다. Spring이 종속성 인젝터인 경우 Service Builder가 생성하는 기본 서비스에는 모든 `service.xml` 엔티티의 로컬 서비스 및 지속성 필드가 포함됩니다. 이로 인해 순환 참조가 발생합니다. OSGi Declarative Services는 순환 참조를 수용하지 않으므로 서비스 작성기는 DS가 종속성 주입기일 때 기본 클래스에 이러한 필드를 생성하지 않습니다. 자세한 내용은 [Service Builder 생성 클래스 이해](../service-builder-basics/understanding-and-extending-generated-classes.md)를 참조하십시오.
```

## 패키지 경로

패키지 경로는 서비스 및 지속성 클래스가 생성되는 패키지를 지정합니다. 예를 들어 방명록의 패키지 경로는 다음과 같습니다.

```xml
<service-builder dependency-injector="ds"
        package-path="com.acme.guestbook">
```

위의 패키지 경로는 `*-api` 모듈의 서비스 클래스가 `com.acme.guestbook` 패키지에 생성되도록 합니다. 지속성 클래스는 `*-service` 모듈에서 동일한 이름의 패키지에 생성됩니다. 생성된 클래스에 대한 자세한 내용은 [Service Builder 생성 클래스 이해](../service-builder-basics/understanding-and-extending-generated-classes.md)을 참조하십시오.

## 다중 버전 동시성 제어(MVCC)

`service-builder` 요소의 `mvcc-enabled` 속성은 기본적으로 `false` 입니다. `mvcc-enabled="true"` 로 설정하면 모든 엔티티에 대해 [다중 버전 동시성 제어](https://en.wikipedia.org/wiki/Multiversion_concurrency_control) (MVCC)이 활성화됩니다. 시스템에서는 동시 업데이트가 일반적입니다. MVCC가 없으면 사람들은 자신도 모르게 잘못된 상태의 데이터를 읽거나 덮어쓸 수 있습니다. MVCC를 사용하면 주어진 기본 버전 번호에 따라 각 수정이 이루어집니다. Hibernate 지속성 계층이 업데이트를 받으면 현재 데이터 버전이 예상한 버전인지 확인하기 위해 `where` 절을 사용하는 `업데이트` SQL 문을 생성합니다.

현재 데이터 버전인 경우

* **은 예상 버전** 과 일치하며 데이터 작업은 최신 데이터를 기반으로 하며 수락됩니다.

* **은 예상 버전** 과 일치하지 않습니다. 작업 중인 데이터가 오래되었습니다. DXP/Portal은 데이터 작업을 거부하고 예외를 발생시킵니다. 예외를 포착하면 사용자가 예외를 처리하는 데 도움이 됩니다(예: 작업 재시도 제안).

**중요:** `<service-builder/>` 요소에서  `mvcc-enabled="true"` 을 설정하여 모든 서비스에 대해 MVCC를 활성화합니다. 서비스 엔터티 업데이트를 호출할 때(예: `fooService.update(object)`) 트랜잭션에서 수행해야 합니다. 사용자가 처리할 수 있도록 거부된 트랜잭션을 UI에 노출합니다.

```xml
<service-builder dependency-injector="ds"
         package-path="com.acme.guestbook"
         mvcc-enabled="true">
```

## 네임스페이스 옵션

Service Builder는 서비스 네임스페이스를 사용하여 데이터베이스 테이블의 이름을 지정합니다. 예를 들어 ** 은 방명록 애플리케이션 서비스의 네임스페이스 역할을 할 수 있습니다.

```xml
<service-builder dependency-injector="ds"
         package-path="com.acme.guestbook"
         mvcc-enabled="true">
    <namespace>GB</namespace>
    <author>Liferay</author>
```

Service Builder는 `src/main/resources/sql` 폴더에서 생성하는 다음 SQL 스크립트의 네임스페이스를 사용합니다.

* `indexes.sql`
* `sequences.sql`
* `tables.sql`

```{note}
생성된 SQL 스크립트 폴더 사이트는 구성 가능합니다. 예를 들어 Gradle을 사용하는 경우 아래 예에서 `databaseNameMaxLength` 설정이 적용되는 것과 동일한 방식으로 프로젝트의 Gradle `build.gradle` 파일에서 `sqlDir` 설정을 정의할 수 있습니다. 
```

Service Builder는 SQL 스크립트를 사용하여 service.xml `이 정의하는 모든 엔터티에 대한 데이터베이스 테이블을 생성`. 데이터베이스 테이블 이름에는 생성될 때 앞에 추가된 네임스페이스가 있습니다. 예제 네임스페이스 값이 `GB`이므로 엔티티에 대해 생성된 데이터베이스 테이블 이름은 접두어로 `GB__` 으로 시작합니다. 각 Service Builder 프로젝트의 네임스페이스는 고유해야 합니다. 별도의 플러그인은 별도의 네임스페이스를 사용해야 하며 Liferay 엔터티(예: `사용자` 또는 `그룹`)에서 이미 사용하는 네임스페이스를 사용해서는 안 됩니다. 이미 사용 중인 네임스페이스를 보려면 Liferay 데이터베이스의 테이블 이름을 확인하십시오.

**경고:** 네임스페이스 값을 신중하게 지정하십시오. 일부 데이터베이스에는 데이터베이스 테이블 및 열 이름 길이에 대한 강력한 제한이 있습니다. Service Builder [Gradle 플러그인](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/sdk/gradle-plugins-service-builder) 매개변수 `databaseNameMaxLength` 은 테이블 및 열 이름에 사용할 수 있는 최대 길이를 설정합니다. 다음은 빌드 파일에서 `databaseNameMaxLength` 을 설정하는 예입니다.

**그래들 `빌드.그레이들`**

```groovy
빌드 서비스 {
...
    databaseNameMaxLength = 64
    ...
}
```

## 작성자

전역 정보의 마지막 조각으로 service.xml `파일에 서비스의 <em x-id="3">작성자</em> 로 이름을 입력`. Service Builder는 생성하는 모든 Java 클래스 및 인터페이스에 지정된 이름을 가진 `개의 @author` 주석을 추가합니다. `service.xml` 파일을 저장합니다. 다음으로 서비스에 대한 엔터티를 추가합니다.

```xml
<service-builder dependency-injector="ds"
         package-path="com.acme.guestbook"
         mvcc-enabled="true">
    <namespace>GB</namespace>
    <author>Liferay</author>
```