# 모델, 지속성 및 서비스 코드 생성

Service Builder를 사용하면 모델을 쉽게 정의하고 모델, 지속성 및 서비스 코드를 생성할 수 있습니다. `Y7G4Entry` 이라는 모델을 정의하고 Service Builder를 사용하여 코드를 생성하면 이를 경험할 수 있습니다. 그런 다음 코드를 DXP에 배포하고 코드를 사용하는 서비스를 호출합니다.

## 예제 프로젝트 다운로드

예제 프로젝트를 다운로드하고 압축을 풉니다.

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/service-builder/service-builder-basics/liferay-y7g4.zip -O
```

```bash
unzip liferay-y7g4.zip
```

`liferay-y7g4` 프로젝트에는 두 개의 모듈이 있습니다.

* `y7g4-api`
* `y7g4-service`

API 모듈(`-api`)은 공개 인터페이스와 유틸리티를 제공합니다. 서비스 모듈(`-service`)은 구현을 제공합니다.

## API 모듈 검사

API 모듈에는 bnd 메타데이터 파일과 Gradle 빌드 파일만 있습니다.

```
y7g4-api
 ├── bnd.bnd // Defines the module artifact, package exports, and includes the service XML file
 └── build.gradle // Declares dependencies
```

다음은 `bnd.bnd` 파일입니다.
```{literalinclude} ./generating-model-persistence-and-service-code/resources/liferay-y7g4.zip/y7g4-api/bnd.bnd
```

`Bundle-` 헤더는 모듈 아티팩트를 설명합니다. 'Export-Package' 헤더는 게시할 API 패키지를 지정합니다. bnd 메타데이터 및 사용 방법에 대한 자세한 내용은 [모듈 프로젝트](../../../../liferay-internals/fundamentals/module-projects.md)를 참조하세요.

`build.gradle` 파일은 DXP/Portal에 대한 모듈의 종속성을 선언합니다.

```{literalinclude} ./generating-model-persistence-and-service-code/resources/liferay-y7g4.zip/y7g4-api/build.gradle
:language: groovy
```

## 서비스 모듈 검사

서비스 모듈에는 bnd 메타데이터 파일, Gradle 빌드 파일 및 서비스 정의 파일이 있습니다.

```
y7g4-service
 ├── bnd.bnd // Defines the module artifact, data schema version, and more
 ├── build.gradle // Declares dependencies and code generation parameters
 └── service.xml // Specifies models and their relationships
```

다음은 `bnd.bnd` 파일입니다.
```{literalinclude} ./generating-model-persistence-and-service-code/resources/liferay-y7g4.zip/y7g4-service/bnd.bnd
```

Once again, the `Bundle-` headers describe the module artifact. Service metadata and a directive follow.

| 메타데이터 | 설명 |
| :------- | :---------- |
| `Liferay-Require-SchemaVersion: 1.0.0` | 애플리케이션의 데이터 스키마 버전입니다. 데이터베이스 스키마가 변경된 애플리케이션 버전을 릴리스하면 버전이 증가합니다. |
| `Liferay 서비스: true` | 이 모듈은 Liferay 서비스를 제공합니다. |
| `-dsannotations-options: 상속` | OSGi 서비스 구성 요소 클래스는 클래스 계층에서 [OSGi 선언 서비스](../../../../liferay-internals/fundamentals/apis-as-osgi-services.md) 주석을 상속합니다. 예를 들어 확장 클래스는 상위 필드가 `@Reference` 주석을 통해 참조하는 모든 서비스에 액세스할 수 있습니다. |

다음은 `build.gradle` 파일입니다.

```{literalinclude} ./generating-model-persistence-and-service-code/resources/liferay-y7g4.zip/y7g4-service/build.gradle
:language: groovy
```

`buildService` 태스크는 `apiDir`에서 지정한 API 모듈 Java 소스 폴더에 서비스의 API 클래스를 생성합니다. 서비스 모듈은 DXP/Portal 및 API 모듈(형제 폴더 `y7g4-api`에 있음)에 따라 다릅니다.

## 서비스 모델 정의 검토

`service.xml` 파일은 `Y7G4Entry` 모델 엔터티를 정의합니다. Service Builder는 `service.xml` 파일의 사양에 따라 모델, 지속성 및 서비스 클래스를 생성합니다.

다음은 `service.xml` 파일입니다.
```{literalinclude} ./generating-model-persistence-and-service-code/resources/liferay-y7g4.zip/y7g4-service/service.xml
```

이 파일은 ID(기본 키), 이름 및 설명이 있는 `Y7G4Entry` 모델을 정의합니다.

### `service-builder` 요소

`service-builder` 요소 속성은 `service.xml` 파일의 모든 모델 엔티티에 영향을 미칩니다.

| `서비스 빌더` 속성 | 설명 |
| :-------------------------- | :---------- |
| `의존성 인젝터` | 종속성 주입기 유형을 선언합니다. 선언적 서비스(`ds`)가 기본값입니다. |
| `패키지 경로` | 생성된 클래스의 선행 패키지 경로를 선언합니다. |
| `짧은-no-such-exception-enabled` | 'true'로 설정하면 'NoSuchY7G4EntryException' 메시지에서 잘린 버전의 엔티티 이름을 사용합니다. 그렇지 않으면 완전한 엔티티 이름을 사용하십시오. |

### `네임스페이스` 요소

전역 `네임스페이스` 요소는 모든 모델 엔터티 데이터베이스 테이블의 접두사를 지정합니다.

### `entity` 요소

'entity' 요소는 모델 데이터베이스 테이블 및 서비스 유형을 정의합니다.

| `entity` 속성 | 설명 |
| :------------------ | :---------- |
| `이름` | 엔터티의 이름입니다. Service Builder는 명명 형식 `[namespace]_[name]`(예: `Y7G4_Y7G4Entry`)을 사용하여 항목 테이블을 생성합니다. |
| `로컬 서비스` | `true`인 경우 JVM 내에서 호출할 서비스 클래스를 생성합니다. |
| `원격 서비스` | `true`인 경우 웹 서비스 클래스를 포함한 서비스 클래스를 생성하여 JVM 외부에서 호출합니다. |

### `열` 요소
각 `column` 요소는 엔티티 테이블의 열을 정의합니다. 다음은 'Y7G4Entry' 항목 열 요소입니다.

| 칼럼 | 설명 |
| :----- | :---------- |
| `y7g4EntryId` | 모델 인스턴스의 ID(긴 정수) 및 기본 키. |
| `이름` | 인스턴스의 이름(문자열). |
| `설명` | 인스턴스의 설명(문자열). |

`service.xml` 요소에 대한 자세한 내용은 [Liferay Service Builder DTD](https://learn.liferay.com/reference/latest/en/dxp/definitions/liferay-service-builder_7_4_0.dtd.html) 를 참조하세요. .

## 지속성 코드 생성

서비스 빌더를 호출하여 지속성 코드 및 데이터베이스 스크립트를 생성합니다.

```bash
cd liferay-y7g4
```

```bash
./gradlew y7g4-service:buildService
```

산출량:

```
> Task :y7g4-service:buildService
Building Y7G4Entry
Writing src/main/java/com/acme/y7g4/service/persistence/impl/Y7G4EntryPersistenceImpl.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/service/persistence/Y7G4EntryPersistence.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/service/persistence/Y7G4EntryUtil.java
Writing src/main/java/com/acme/y7g4/service/persistence/impl/Y7G4EntryModelArgumentsResolver.java
Writing src/main/java/com/acme/y7g4/model/impl/Y7G4EntryModelImpl.java
Writing src/main/java/com/acme/y7g4/model/impl/Y7G4EntryBaseImpl.java
Writing src/main/java/com/acme/y7g4/model/impl/Y7G4EntryImpl.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/model/Y7G4EntryModel.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/model/Y7G4Entry.java
Writing src/main/java/com/acme/y7g4/model/impl/Y7G4EntryCacheModel.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/model/Y7G4EntryWrapper.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/model/Y7G4EntrySoap.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/model/Y7G4EntryTable.java
Writing src/main/java/com/acme/y7g4/service/impl/Y7G4EntryLocalServiceImpl.java
Writing src/main/java/com/acme/y7g4/service/base/Y7G4EntryLocalServiceBaseImpl.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/service/Y7G4EntryLocalService.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/service/Y7G4EntryLocalServiceUtil.java
Writing ../y7g4-api/src/main/java/com/acme/y7g4/service/Y7G4EntryLocalServiceWrapper.java
Writing src/main/resources/META-INF/module-hbm.xml
Writing src/main/resources/META-INF/portlet-model-hints.xml
Writing ../y7g4-api/src/main/java/com/acme/y7g4/exception/NoSuchY7G4EntryException.java
Writing src/main/java/com/acme/y7g4/service/persistence/impl/constants/Y7G4PersistenceConstants.java
Writing src/main/resources/META-INF/sql/tables.sql
Writing src/main/resources/META-INF/sql/tables.sql
Writing src/main/resources/service.properties

BUILD SUCCESSFUL in 3s
1 actionable task: 1 executed
```

Service Builder는 모델, 지속성 및 서비스에 대한 Java 클래스, 데이터베이스 스크립트 및 구성 파일을 생성합니다. 파일 경로는 `y7g4-service` 모듈에 상대적입니다.

다음은 생성된 구조의 개요입니다.

```
liferay-y7g4
├── y7g4-api
│   └── src
│       └── main
│           └── java
│               └── com
│                   └── acme
│                       └── y7g4
│                           ├── exception // Public exception classes & interfaces
│                           ├── model // Public model classes & interfaces
│                           └── service // Public persistence and service classes
│                                       // & interfaces
└── y7g4-service
    └── src/main
        ├── java/com/acme/y7g4
        │                 ├── model // Model implementation
        │                 └── service // Persistence and service implementation
        └── resources
            ├── META-INF
            │   ├── module-hbm.xml // Hibernate object relational map configuration
            │   ├── portlet-model-hints.xml // Provides field type information for the UI
            │   └── sql
            │       ├── indexes.sql
            │       ├── sequences.sql
            │       └── tables.sql
            └── service.properties // Tracks the service build version
```

모델, 지속성 및 서비스 구현 클래스는 Java 패키지 경로 `com.acme.y7g4`에 생성되었습니다. [Service Builder 생성 클래스 이해](./understanding-service-builder-generated-classes.md)에서 클래스에 대해 알아보십시오.

SQL 스크립트 및 지속성 구성은 `resources/META-INF` 폴더에 생성되었습니다.

`module-hbm.xml` 파일은 Hibernate 객체 관계형 맵을 지정합니다.

```xml
<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN" "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">

<hibernate-mapping auto-import="false" default-lazy="false">
    <import class="com.acme.y7g4.model.Y7G4Entry" />
    <class name="com.acme.y7g4.model.impl.Y7G4EntryImpl" table="Y7G4_Y7G4Entry">
        <id access="com.liferay.portal.dao.orm.hibernate.LiferayPropertyAccessor" name="y7g4EntryId" type="long">
            <generator class="assigned" />
        </id>
        <property access="com.liferay.portal.dao.orm.hibernate.LiferayPropertyAccessor" name="description" type="com.liferay.portal.dao.orm.hibernate.StringType" />
        <property access="com.liferay.portal.dao.orm.hibernate.LiferayPropertyAccessor" name="name" type="com.liferay.portal.dao.orm.hibernate.StringType" />
    </class>
</hibernate-mapping>
```

`module-hbm.xml` 파일은 `Y7G4EntryImpl` 개체를 `Y7G4_Y7G4Entry` 테이블에 매핑합니다. Hibernate와의 매핑에 대한 자세한 내용은 [Hibernate](https://hibernate.org) 을 참조하십시오.

`tables.sql` 스크립트는 `Y7G4_Y7G4Entry` 테이블을 지정합니다.

```sql
create table Y7G4_Y7G4Entry (
    y7g4EntryId LONG not null primary key,
    description VARCHAR(75) null,
    name VARCHAR(75) null
);
```

`y7g4EntryId` 은 기본 키입니다. `이름` 및 `설명` 은 속성입니다. 모듈을 배포할 때 DXP/Portal은 `tables.sql` 스크립트를 실행하여 테이블을 생성합니다.

이 `service.xml` 파일의 요소는 인덱스 또는 시퀀스를 지정하지 않으므로 `indexes.sql` 또는 `sequence.sql` 스크립트는 비어 있습니다.

## 지속성 계층 및 서비스 배포

생성된 코드를 DXP 서버에 배포하여 지속성 레이어와 서비스를 생성할 차례입니다. 서버는 별도의 MariaDB 데이터베이스 서버에서 데이터 소스를 사용합니다. 번들 Hypersonic 서버보다 MariaDB에서 데이터베이스를 검사하는 것이 더 쉽습니다. 모든 것을 배포한 후 테이블을 확인하고 서비스를 테스트합니다.

### 데이터베이스 만들기

1. MariaDB 도커 컨테이너를 시작합니다.

    ```bash
    docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:10.2
    ```

1. [MariaDB Docker 컨테이너 내에서 DXP 데이터베이스](../../../../installation-and-upgrades/reference/database-configurations.md) 을 생성합니다.

    데이터베이스 서버에 로그인합니다.

    ```bash
    docker exec -it some-mariadb bash -c "/usr/bin/mysql -uroot -pmy-secret-pw"
    ```

    DXP용 데이터베이스를 생성합니다.

    ```sql
    create database dxp_db character set utf8;
    ```

    데이터베이스 세션을 종료합니다.

    ```bash
    quit
    ```

1. 기본 네트워크(`bridge`)에서 Docker의 `network inspect`](https://docs.docker.com/engine/reference/commandline/network_inspect/) 명령을 호출하여 MariaDB 컨테이너 IP 주소를 가져옵니다.

    ```bash
    docker network inspect bridge
    ```

출력 예:

```
"Containers": {
    "162f5350ee9ba7c47c1ba91f54a84543aeada7feb35eb8153743b13ef54cb491": {
        "Name": "some-mariadb",
        "EndpointID": "8e97e35fb118e2024a52f2ecbfd40b0a879eba8dc3bc5ffceea8bb117c10bebc",
        "MacAddress": "02:42:ac:11:00:02",
        "IPv4Address": "172.17.0.2/16",
        "IPv6Address": ""
    },
```

`some-mariadb` 컨테이너에 대해 `IPv4Address` 값의 첫 번째 부분을 사용합니다. 예제의 IP 주소는 `172.17.0.2`입니다.

### 서버 시작

별도의 터미널에서 다음 명령을 사용하여 DXP를 시작합니다. `[IP 주소]` 을 `some-mariadb` 컨테이너 IP 주소로 바꾸십시오.

```bash
docker run -it \
--add-host some-mariadb:[IP address] \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root \
-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw \
-m 8g \
-p 8080:8080 \
liferay/portal:7.4.2-ga3
```

### 모듈 배포

모듈을 배포하여 데이터베이스 테이블을 생성하고 서비스를 설치합니다.

```bash
./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

콘솔 출력:

```bash
STARTED com.acme.y7g4.service_1.0.0 [1423]
STARTED com.acme.y7g4.api_1.0.0 [1422]
```

### 테이블 확인

데이터베이스 테이블을 확인하고 유효성을 검사합니다.

1. 데이터베이스 서버에 로그인합니다.

    ```bash
    docker exec -it some-mariadb bash -c "/usr/bin/mysql -uroot -pmy-secret-pw"
    ```

1. 데이터베이스에 연결합니다.

    ```sql
    connect dxp_db;
    ```

1. 데이터베이스 테이블을 나열하여 `Y7G4_Y7G4Entry` 테이블을 확인합니다.

    ```sql
    show tables;
    ```

    결과:

    ```
    +--------------------------------+
    | Tables_in_dxp_db               |
    +--------------------------------++
    | AMImageEntry                   |
    | AccountEntry                   |
    | AccountEntryOrganizationRel    |
    | ...                            |
    | Y7G4_Y7G4Entry                 |
    +--------------------------------+
    ```

1. `Y7G4_Y7G4Entry` 테이블 열을 나열합니다.

    ```sql
    SHOW COLUMNS FROM Y7G4_Y7G4Entry;
    ```

    결과:

    ```
    +-------------+-------------+------+-----+---------+-------+
    | Field       | Type        | Null | Key | Default | Extra |
    +-------------+-------------+------+-----+---------+-------+
    | y7g4EntryId | bigint(20)  | NO   | PRI | NULL    |       |
    | description | varchar(75) | YES  |     | NULL    |       |
    | name        | varchar(75) | YES  |     | NULL    |       |
    +-------------+-------------+------+-----+---------+-------+
    ```

    모든 것이 제자리에 있습니다.

1. 데이터베이스 세션을 종료합니다.

    ```bash
    quit
    ```

### 서비스 테스트

서비스를 호출하여 데이터베이스를 `Y7G4Entry` 데이터로 채웁니다.

1. 브라우저에서 `http://localhost:8080`의 DXP를 방문하십시오.

1. 기본 자격 증명을 사용하여 로그인합니다.

    **사용자 이름:** `test@liferay.com`

    **암호:** `테스트`

1. **제어판** &rarr; **서버 관리** &rarr; **스크립트** 에서 스크립트 콘솔로 이동합니다.

1. 다음 스크립트를 실행하여 항목을 추가합니다.

    ```groovy
    import com.acme.y7g4.service.Y7G4EntryLocalServiceUtil;

    import com.liferay.portal.kernel.dao.orm.QueryUtil;

    entry = Y7G4EntryLocalServiceUtil.createY7G4Entry(1234);

    entry.setName("Mop floors");
    entry.setDescription("Mop the kitchen and bathroom floors with soap and water.");

    Y7G4EntryLocalServiceUtil.addY7G4Entry(entry);

    entries = Y7G4EntryLocalServiceUtil.getY7G4Entries(QueryUtil.ALL_POS, QueryUtil.ALL_POS);

    for (entry in entries){
        out.println(entry);
    }
    ```

    산출량:

    ```
    {y7g4EntryId=1234, description=Mop the kitchen and bathroom floors with soap and water., name=Mop floors}
    ```

    새로 추가된 Y7G4Entry는 JSON 형식으로 출력됩니다.

스크립트가 수행한 작업은 다음과 같습니다.

1. 생성된 정적 유틸리티 클래스 `Y7G4EntryLocalServiceUtil`을 가져왔습니다.
1. ID가 (`long`) `1234`인 `Y7G4Entry` 인스턴스를 생성했습니다.
1. `Y7G4Entry` 인스턴스의 `이름` 및 `설명` 속성을 채웠습니다.
1. 데이터베이스에 `Y7G4Entry` 을 추가했습니다.
1. 데이터베이스에서 모든 `Y7G4Entry` 인스턴스를 가져와 인쇄했습니다.

## 다음

이제 모델을 정의하고 이에 대한 지속성 코드 및 서비스 코드를 생성하는 방법을 알았으므로 생성된 서비스 클래스를 검사해야 합니다. [생성된 클래스 이해 및 확장](./understanding-service-builder-generated-classes.md)에서 계속하십시오.

## 관련 주제

* [로컬에서 서비스 호출](./invoking-a-service-locally.md)
* [Liferay 작업 영역이란 무엇입니까](../../../tooling/liferay-workspace/what-is-liferay-workspace.md)
