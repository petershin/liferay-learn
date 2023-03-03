# 라이프레이 업데이트

{bdg-secondary}`Liferay DXP 7.3 SP3+ 및 7.4 GA1+용`

번들 릴리스로 Liferay 설치를 업데이트하십시오. 최신 기능, 보안 릴리스 및 라이브러리 업데이트가 모두 하나의 번들로 함께 제공됩니다. Liferay 이전 버전에 대해서는 [이전 버전의 Liferay](./updating-previous-versions-of-liferay.md) 업데이트를 참조하십시오.

```{warning}
**항상** Liferay DXP/Portal을 업데이트하기 전에 데이터베이스와 설치를 [백업](./backing-up.md)하십시오.
```

새 업데이트를 준비할 때 Liferay 설치의 중요한 종속성을 식별하십시오. 여기에는 데이터베이스, 문서 라이브러리, 사용자 지정 모듈 등이 포함될 수 있습니다. 포털 속성, OSGi 구성, Tomcat 파일 및 데이터베이스 jar와 같은 기타 파일도 중요합니다. [고려해야 할 중요한 파일](#important-files-to-consider) 을 참조하십시오.

기본적으로 Liferay 홈 디렉토리는 번들 안에 있습니다. 더 쉽게 업데이트하려면 Liferay 홈 디렉토리를 번들 외부로 이동하여 실수로 새 번들 릴리스에서 파일을 덮어쓰지 않도록 하십시오.

1. 환경 변수를 다른 디렉토리로 설정하십시오.

   `export LIFERAY_HOME="/your/liferay/directory"`

1. `portal-ext.properties` 파일에서 이 디렉토리 경로를 지정하십시오.

   `liferay.home=/your/liferay/directory`

1. 위의 경로를 설정하면 Liferay의 OSGi 폴더 경로도 종속 항목으로 설정됩니다. Marketplace가 작동하려면 번들을 다시 가리켜야 합니다.

   `module.framework.marketplace.dir=/new_liferay_bundle/osgi/marketplace`

1. `Portal-ext.properties` 파일을 저장합니다.

## 구성 관리

새 번들 릴리스로 업데이트하기 전에 중요한 종속성과 파일을 저장하십시오. 쉘 스크립트 또는 Liferay Workspace를 사용하여 이 작업을 수행할 수 있습니다.

### 쉘 스크립트 사용

아래와 같은 간단한 셸 스크립트를 사용하여 모든 종속 Liferay 구성 파일 및 라이브러리를 백업할 수 있습니다. 이 예에서는 배열을 사용하여 새 번들 릴리스로 마이그레이션할 때 필요한 파일을 나열합니다.

```bash
   #!/bin/bash

   # Liferay and Tomcat locations
   LIFERAY_HOME="./liferay"
   CATALINA_HOME="$LIFERAY_HOME/tomcat-9.0.56"

   declare -a persistent_files=(
   "$LIFERAY_HOME/portal-ext.properties"
   "$LIFERAY_HOME/portal-setup-wizard.properties"
   "$LIFERAY_HOME/osgi/configs/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg"
   "$LIFERAY_HOME/osgi/configs/com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.cfg"
   "$LIFERAY_HOME/osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.cfg"
   "$CATALINA_HOME/conf/server.xml"
   "$CATALINA_HOME/conf/web.xml"
   "$CATALINA_HOME/bin/setenv.sh"
   "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/ehcache-config/"
   "$CATALINA_HOME/lib/ojdbc8.jar"
   "$LIFERAY_HOME/patching-tool/default.properties"
   "$LIFERAY_HOME/osgi/marketplace/override/"
   "$CATALINA_HOME/conf/Catalina/localhost/"
   "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/META-INF/portal-log4j-ext.xml"
   )

   echo "Backing up the following files"
   tar cvfz ./persisted_bundle_configs-`date +%Y%m%d.%H%M`.tgz --files-from <(printf "%s\n" "${persistent_files[@]}")
```

위의 스크립트는 새로 다운로드한 번들의 폴더 구조 위에 압축을 풀 수 있는 압축된 `tar` 파일을 생성합니다.

### Liferay 작업 공간 사용

Liferay Workspace는 `configs` 폴더 내의 환경 하위 폴더를 사용하여 구성 관리를 제공합니다. 또한 모든 환경에서 사용되는 모든 파일에 대해 `개의 공통` 폴더가 있습니다. 환경 폴더 중 하나에 있는 구성 파일의 경로는 번들 릴리스에 있는 경로와 일치해야 합니다. 예를 들어:

      ../configs/dev/tomcat-9.0.56/conf/server.xml

자세한 내용은 [배포 환경 만들기](../../building-applications/tooling/liferay-workspace/configuring-liferay-workspace.html#creating-deployment-environments) 을 참조하십시오.

환경이 설정되면 Gradle 작업을 사용하여 번들을 생성할 수 있습니다. `distBundleZip` 또는 `distBundleTar` 을 사용하여 정의된 환경에 대한 특정 번들을 생성합니다. 예를 들어:

```bash
./gradlew distBundleZip -Pliferay.workspace.environment=dev
```

Gradle 작업은 적절한 구성 파일을 계층화하고 모듈과 테마를 컴파일하기 전에 새 번들을 다운로드합니다.

결과 번들은 Liferay Workspace의 `빌드` 폴더에 있습니다. 사용 중인 Liferay DXP 버전은 `gradle.properties` 파일 내부의 `liferay.workspace.product` 속성으로 정의됩니다.

단일 작업으로 모든 환경에 대한 번들을 생성하려면 `distBundleZipAll` 또는 `distBundleTarAll`을 사용합니다. 예를 들어:

```bash
./gradlew distBundleTarAll -Pliferay.workspace.bundle.dist.include.metadata=true
```

각 결과 Zip 또는 Tar의 파일 이름에는 구성 환경의 이름과 타임스탬프가 포함됩니다. 이 Gradle 작업은 Liferay 작업 공간 3.4.32 이상에서 사용할 수 있습니다.

## 고려해야 할 중요한 파일

다음은 새 번들 릴리스로 이동할 때 백업을 고려해야 하는 공통 파일 목록입니다. 이 목록은 완전하지 않으며 설치에 언급되지 않은 추가 파일이나 라이브러리가 있을 수 있습니다. 또한 Apache Tomcat 이외의 응용 프로그램 서버에 대해서는 설명하지 않지만 모든 응용 프로그램 서버를 유지 관리하는 원칙은 동일합니다. [응용 프로그램 서버에 Liferay 설치](../installing-liferay/installing-liferay-on-an-application-server.md)을 참조하십시오.

### Liferay 속성(/LIFERAY/)

* `portal-ext.properties`
* `portal-setup-wizard.properties`

### Liferay OSGI 구성(/LIFERAY/osgi/configs/)

OSGI 구성 디렉토리에는 잠재적으로 여러 구성 파일이 포함될 수 있습니다. 다음은 고려해야 할 몇 가지 일반적인 OSGi 구성 파일입니다.

* `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config`
* `com.liferay.portal.search.elasticsearch[6|7].configuration.ElasticsearchConfiguration.config`
* `com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config`

### 라이프레이 클러스터링(LIFERAY/TOMCAT/):

jgroups 또는 ehcache 구성 파일을 백업하는 것 외에도 JNDI 풀 설정과 함께 JDBC Ping을 사용하는 것이 좋습니다. 이는 ehcache 구성 파일을 추상화하고 단순화할 수 있습니다. 이렇게 하면 IP와 데이터베이스 관련 설정이 모두 정의되지 않아 파일이 거의 일반적이 될 수 있습니다.

* `webapps/ROOT/WEB-INF/classes/ehcache-config/tcp.xml`

### Liferay 지속 로깅 설정(LIFERAY/TOMCAT/)

* `webapps/ROOT/WEB-INF/classes/META-INF/portal-log4j-ext.xml`

## 톰캣/애플리케이션 서버(LIFERAY/TOMCAT/)

* `conf/server.xml`
* `conf/web.xml`
* `bin/setenv.sh`

### 데이터베이스 라이브러리(LIFERAY/TOMCAT/)

Liferay 데이터베이스에 연결하기 위해 Hikari와 함께 JNDI를 사용하는 것이 좋습니다. 따라서 Hikari, MySQL, Oracle 또는 기타 데이터베이스 드라이버와 같은 JNDI 연결을 설정하는 데 필요한 모든 라이브러리를 백업해야 합니다.

7.4에서 이러한 드라이버는 LIFERAY/TOMCAT/lib 폴더에 있습니다. 이전 버전에서 이러한 라이브러리는 LIFERAY/TOMCAT/lib/ext에 있었습니다. 예를 들어:

* `lib/ojdbc8.jar 오라클용`
* `lib/mysql.jar MySQL용`
* Hikari DB 풀의 경우 `lib/hikaricp.jar`

JNDI를 사용하지 않는 경우 7.4의 `LIFERAY/TOMCAT/webapps/ROOT/WEB-INF/shielded-container-lib` 또는 이전 버전의 `LIFERAY/TOMCAT/lib/ext` 에서 필요한 데이터베이스 드라이버를 참조하십시오. 백업.

### 기타 파일 또는 라이브러리

다른 라이브러리나 파일을 백업할 수 있습니다.

* `lib/xuggler.jar` (`LIFERAY/TOMCAT/webapps/ROOT/WEB-INF/lib/`) (사용되지 않음 7.3)
* SAML 키 저장소(`LIFERAY/data/keystore.jks`)
