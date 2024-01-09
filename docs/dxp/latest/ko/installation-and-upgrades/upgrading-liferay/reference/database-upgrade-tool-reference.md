# 데이터베이스 업그레이드 도구 참조

```{important}
Liferay 7.4 U82/GA82 이상 버전부터 `db_upgrade.sh` 파일의 이름이 `db_upgrade_client.sh`로 변경되었습니다.
```

라이프레이의 업그레이드 도구에 대한 개요는 다음과 같습니다.

`[LIFERAY_HOME]/tools/portal-tools-db-upgrade-client` 폴더에 있는 `db_upgrade_client.sh` 스크립트(Windows의 경우`db_upgrade_client.bat` )를 사용하여 업그레이드 도구를 시작합니다.

## 개요

* [업그레이드 도구 사용](#database-upgrade-tool-usage)
* [업그레이드 도구 구성](#configuring-the-upgrade-tool)

## 데이터베이스 업그레이드 도구 사용

이 명령은 업그레이드 도구 사용량을 인쇄합니다:

```bash
db_upgrade_client.sh --help
```

업그레이드 도구 명령줄 옵션은 다음과 같습니다:

**--도움말** 또는 **-h** : 도구의 도움말 메시지를 인쇄합니다.

**--jvm-opts** 또는 **-j** + [**arg**] : 업그레이드 프로세스에 대한 JVM 옵션을 설정합니다.

**--log-file** 또는 **-l** + [**arg**] : 도구의 로그 파일 이름을 지정합니다 -- 기본 이름은 `upgrade.log`입니다.

**--shell** 또는 **-s** : 업그레이드 프로세스를 완료한 후 [Gogo 셸](../../../liferay-internals/fundamentals/using-the-gogo-shell.md) 로 자동 연결합니다.

### 로깅 출력

`-l` 옵션은 도구의 로그 파일 이름을 지정합니다:

```bash
db_upgrade_client.sh -l "output.log"
```

### 권장 JVM 옵션

파일 인코딩을 `UTF-8` 로 설정하고 표준 시간대를 `GMT`로 설정해야 합니다. 데이터베이스 업그레이드 도구는 DXP 데이터베이스에서 작동하므로 DXP 애플리케이션 서버에 사용하는 것과 동일한 JVM 옵션으로 업그레이드 도구도 구성해야 합니다. 국가 및 언어 JVM 옵션을 사용한 경우 업그레이드 도구에 해당 옵션을 지정합니다.

업그레이드 도구에 초기 메모리(`-Xmx 값`)도 할당하세요. 최소 2GB를 사용하세요. DXP 데이터베이스에 10GB가 넘는 데이터가 있는 경우 초기 메모리를 늘리세요.

3.2GB 데이터베이스와 15GB 문서 라이브러리가 있는 테스트 시나리오를 사용하여 다음과 같은 Java 프로세스 설정이 최적이었습니다:

* Xmx 8GB RAM
* 파일 인코딩 UTF-8
* 사용자 표준 시간대 GMT

다음은 이러한 설정에 해당하는 `db_upgrade_client.sh` 명령입니다:

```bash
db_upgrade_client.sh -j "-Xmx8000m -Dfile.encoding=UTF-8 -Duser.timezone=GMT"
```

## 업그레이드 도구 구성

코어 업그레이드에는 구성이 필요합니다. 가장 간단한 방법은 업그레이드 도구를 사용하여 구성 파일을 즉석에서 생성하는 것입니다. 다음은 업그레이드 도구의 명령줄 인터페이스와의 상호 작용 예시입니다:

```
Please enter your application server (tomcat):
tomcat

Please enter your application server directory (../../tomcat-9.0.17):

Please enter your extra library directories (../../tomcat-9.0.17/bin):

Please enter your global library directory (../../tomcat-9.0.17/lib):

Please enter your portal directory (../../tomcat-9.0.17/webapps/ROOT):

[ db2 mariadb mysql oracle postgresql sqlserver sybase ]
Please enter your database (mysql):
mariadb

Please enter your database host (localhost):

(etc.)
```

```{note}
생략된 값은 괄호 안에 표시된 기본값을 사용합니다.
```

### 수동 구성

업그레이드 도구가 생성하는 값보다 더 많은 값을 설정하도록 업그레이드 도구를 미리 구성할 수도 있습니다. `[LIFERAY_HOME]/tools/portal-tools-db-upgrade-client/` 에서 이 파일을 사용하여 코어 업그레이드를 수동으로 구성하세요:

* `app-server.properties`: 서버 사이트 및 라이브러리를 지정합니다.
* `portal-upgrade-database.properties`: 데이터베이스 연결을 구성합니다.
* `portal-upgrade-ext.properties`: 업그레이드에 필요한 나머지 포털 속성을 설정합니다. 현재 DXP 서버를 복제하려면 현재 포털 속성(데이터베이스 속성 제외)을 이 파일에 복사하면 됩니다. 현재 속성을 사용하기 전에 [에서 현재 DXP 버전에 맞게 업데이트하세요](../migrating-configurations-and-properties.md#migrating-portal-properties) .

#### app-server.properties 구성

다음 정보를 지정하여 DXP의 애플리케이션 서버를 구성합니다:

| 등록 정보 이름                    | 의미                                                  | 주                                                                                |
|:--------------------------- |:--------------------------------------------------- |:-------------------------------------------------------------------------------- |
| `dir`                       | 애플리케이션 서버 폴더의 절대 경로입니다.                             |                                                                                  |
| `extra.lib.dirs`            | 클래스 경로에 추가할 바이너리 또는 리소스가 포함된 쉼표로 구분된 추가 디렉터리 목록입니다. | `dir`에 상대 경로를 사용합니다.                                                             |
| `global.lib.dir`            | 애플리케이션 서버의 글로벌 라이브러리 디렉토리입니다.                       | `dir`에 상대 경로를 사용합니다.                                                             |
| `portal.dir`                | 애플리케이션 서버에서 포털이 설치된 디렉터리입니다.                        | `dir`에 상대 경로를 사용합니다.                                                             |
| `server.detector.server.id` | 지원되는 애플리케이션 서버의 ID입니다.                              | 지원되는 ID: `jboss`, `jonas`, `resin`, `tomcat`, `weblogic`, `websphere`, `wildfly` |

상대 경로는 유닉스 스타일 형식(슬래시)을 사용해야 하며 `/`으로 시작해야 합니다. 예를 들어 다음 속성은 Windows용입니다:

```properties
dir=D:\liferay-dxp\tomcat-9.0.17
extra.lib.dirs=/bin
global.lib.dir=/lib
portal.dir=/webapps/ROOT
server.detector.server.id=tomcat
```

다른 예로 다음 속성은 Linux용입니다:

```properties
dir=/home/user/liferay
extra.lib.dirs=/liferay-portal-master/tomcat-9.0.10/bin
global.lib.dir=/liferay-portal-master/tomcat-9.0.10/lib
portal.dir=/liferay-portal-master/tomcat-9.0.10/webapps/ROOT
server.detector.server.id=tomcat
```

#### 포털-업그레이드-데이터베이스.properties 구성하기

다음 정보를 지정하여 업그레이드할 데이터베이스를 구성합니다. 이러한 속성은 `portal-ext.properties` 파일에서 사용하는 [JDBC 포털 속성](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 에 해당합니다.

* `jdbc.default.driverClassName`
* `jdbc.default.url`
* `jdbc.default.username`
* `jdbc.default.password`

이러한 값에 대한 참조는 최신 [포털 속성 참조](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 를 참조하세요.

#### 포털-업그레이드-ext.properties 구성하기

[백업](../../maintaining-a-liferay-installation/backing-up.md)에서 `portal-ext.properties` 파일 속성과 같은 [포털 속성](../../reference/portal-properties.md)을 모두 추가합니다. 업그레이드를 구성하는 데 특히 중요한 속성은 다음과 같습니다:

* `liferay.home`: [LIFERAY_HOME 폴더](../../reference/liferay-home.md).

* `dl.store.impl`: 문서 라이브러리 스토어에 문서를 지속하기 위한 구현입니다. 이 속성은 `*FileSystemStore` 구현을 사용하는 경우에만 필수입니다. `portal-ext.properties`에서 이 속성을 업데이트한 경우 여기에 새 값을 복사합니다. 그렇지 않으면 다음 방법 중 하나로 속성을 설정합니다:

    ```properties
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    dl.store.impl=com.liferay.portal.store.db.DBStore
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

* `hibernate.jdbc.batch_size`: 성능 향상에 사용되는 JDBC 배치 크기(기본적으로 **250** 로 설정됨). **이 속성은 업그레이드 성능을 향상시킬 수 있지만 필수는 아닙니다.**

* `upgrade.log.context.enabled`: `true` 로 설정하여 식별자로 태그가 지정된 업그레이드 관련 로그 줄을 확인합니다. 가능한 식별자는 다음과 같습니다.

    * `{upgrade.component=portal}`: 포털 관련 업그레이드 프로세스용
    * `{upgrade.component=framework}`: 업그레이드 프레임워크 로직과 관련된 프로세스의 경우
    * `{upgrade.component=<bundleSymbolicName>}`: 모듈과 관련된 업그레이드 프로세스용

이 기능을 사용하려면 [`portal-impl/src/META-INF/portal-log4j.xml`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/META-INF/portal-log4j.xml) 파일을 `bundles/tomcat/webapps/ROOT/WEB-INF/classes/META-INF` 에 복사하고 파일 이름을 `portal-log4j-ext.xml`로 변경해야 합니다. 그런 다음 애펜더 정의를 찾습니다:

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m%n" type="PatternLayout" />
</Appender>
```

정의를 변경하여 `%X`를 포함하도록 변경하면 Log4j가 스레드 컨텍스트 정보를 인쇄하도록 지시합니다:

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m %X%n" type="PatternLayout" />
</Appender>
```

자세한 내용은 [업그레이드 로그 컨텍스트](./upgrade-log-context.md) 를 참조하세요.

#### 업그레이드 구성 예시

다음은 사용자 지정하여 `[LIFERAY_HOME]/tools/portal-tools-db-upgrade-client/`에 복사할 수 있는 업그레이드 구성 파일 예제입니다:

* `app-server.properties`:

    ```properties
    dir=../../tomcat-9.0.17
    global.lib.dir=lib
    portal.dir=webapps/ROOT
    server.detector.server.id=tomcat
    extra.lib.dirs=bin
    ```

* `portal-upgrade-database.properties`:

    ```properties
    jdbc.default.url=jdbc:mysql://lportal62?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&serverTimezone=GMT&useFastDateParsing=false&useUnicode=true
    jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
    jdbc.default.username=root
    jdbc.default.password=
    ```

* `portal-upgrade-ext.properties`:

    ```properties
    liferay.home=/home/user/servers/liferay7
    module.framework.base.dir=/home/user/servers/liferay7/osgi
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    ```
