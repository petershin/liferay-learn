# Liferay Talend 구성 요소 설치

{bdg-warning}`지원되지 않음`

Talend Open Studio용 Liferay의 구성 요소는 Liferay DXP/Portal과 외부 시스템(예: MySQL, SAP, Salesforce 또는 파일) 간에 데이터를 가져오고 내보낼 수 있습니다. 이러한 구성 요소를 사용하려면 Talend Open Studio에 추가해야 합니다.

## 전제 조건

Liferay 구성 요소를 설치하려면 JDK 1.8+, Apache Maven 3.3+ 및 [DXP/Portal 코드](https://github.com/liferay/liferay-portal/tree/7.4.x/modules/etl/talend) 의 로컬 사본이 필요합니다. 또한 [개의 Talend Open Studio 7.1.1](https://download-mirror2.talend.com/esb/release/V7.1.1/TOS_ESB-20181026_1147-V7.1.1.zip) 과 [구성 요소 API v0.25.3](https://artifacts-oss.talend.com/nexus/content/repositories/TalendOpenSourceRelease/org/talend/components/components-api/0.25.3/) 이 이미 설치되어 있어야 합니다.

## Talend Open Studio 구성

Talend Open Studio를 설치한 후 `[TOS_ROOT]/configuration/config.ini` 파일이 `maven.repository=global`로 설정되지 않았는지 확인합니다. 있는 경우 행을 삭제하거나 주석 처리하십시오.

Maven은 최근에 안전하지 않은 리포지토리 연결을 더 이상 사용하지 않으므로 `[TOS_ROOT]/configuration/maven_user_setting.xml` 파일에 다음 스크립트를 포함합니다.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings>
  <localRepository>DO_NOT_CHANGE_THIS</localRepository>
  <mirrors>
    <mirror>
      <id>secure-central-mirror</id>
      <name>Secure Central Mirror Repository</name>
      <url>https://repo.maven.apache.org/maven2</url>
      <mirrorOf>central</mirrorOf>
    </mirror>
  </mirrors>
</settings>
```

리포지토리 미러 사이트는 m2m 플러그인이 리포지토리에 안전하게 연결할 수 있도록 합니다.

## Talend 구성 요소 구축

Talend 구성 요소를 설치하려면 먼저 로컬 `liferay-portal` 리포지토리의 [module/etl/talend](https://github.com/liferay/liferay-portal/tree/7.4.x/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend) 폴더에서 `mvn clean install` 을 실행해야 합니다.

이렇게 하면 다음 디렉터리/폴더에 jar 번들 파일이 생성됩니다.

* `talend-definition/target/`
* `talend-common/target/`
* `talend-runtime/target/`

JAR 파일은 다음 로컬 Maven 리포지토리 폴더에도 게시됩니다.

* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.common`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.definition`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.runtime`

```{note}
Maven 빌드는 모든 테스트를 통과한 경우에만 성공합니다. 오류가 발생하면 `talend-definition`, `talend-common` 및 `talend-runtime` 하위 폴더에서 개별적으로 `mvn clean install -DskipTests`를 실행하십시오. 모든 빌드가 성공하면 `modules/etl/talend` 폴더로 돌아가서 `mvn clean install`을 실행합니다.
```

## Talend Studio에 구성 요소 등록

Maven 빌드가 성공하면 다음 단계에 따라 Talend Open Studio에 Liferay 구성 요소를 등록합니다.

1. Talend Open Studio가 열려 있으면 닫습니다.

1. 생성된 `com.liferay.talend.definition-xyz-SNAPSHOT.jar` 번들을 `liferay-portal/modules/etl/talend/talend-definition/target` 폴더에서 `[TOS_ROOT]/plugins` 폴더로 복사합니다.

1. 새로 추가된 정의 번들을 포함하도록 `[TOS_ROOT]/configuration/config.ini` 파일에서 `osgi.bundles` 키를 업데이트합니다.

   ```properties
   osgi.bundles=org.eclipse.equinox.common@2:start,org.eclipse.update.configurator@3:start,
   org.eclipse.equinox.ds@2:start,org.eclipse.core.runtime@start,org.talend.maven.resolver@start,
   org.ops4j.pax.url.mvn@start,org.talend.components.api.service.osgi@start,
   com.liferay.talend.definition-x.y.z-SNAPSHOT.jar@start
    ```

1. `[TOS_ROOT]/configuration/` 폴더에서 `org.eclipse*` 파일을 제거합니다.

1. `com.liferay.talend`, `com.liferay.talend.common`및 `com.liferay.talend.runtime` 폴더를 로컬 `$USER_HOME/.m2/repository/com/liferay/` 폴더에서 `$TOS_ROOT/configuration/.m2/repository/com/liferay/` 폴더.

1. Talend Open Studio를 시작합니다. Liferay 구성 요소는 **Palette** 탭의 **Business** &rarr; **Liferay** 아래에 나타납니다.

   ![구성 요소는 팔레트 탭의 Business &rarr; Liferay 아래에 나타납니다.](liferay-talend-components-overview/images/01.png)

## Liferay 구성 요소 업데이트

Liferay 구성 요소 코드베이스에 변경 사항이 있는 경우 Talend 구성 요소 빌드부터 시작하여 위의 단계를 반복하여 구성 요소를 최신 버전으로 업데이트할 수 있습니다.

또한 이전 파일과 폴더를 제거하고 교체해야 합니다.

* `[TOS_ROOT]/plugins 폴더`에서 이전 `.jar` 정의 파일을 제거합니다.
* `[TOS_ROOT]/configuration/.m2/repository/com/liferay/`에서 `com.liferay.talend`, `com.liferay.talend.common`및 `com.liferay.talend.runtime` 폴더를 교체합니다.

구성 요소 업데이트가 완료되면 이전 구성 요소를 사용한 기존 Talend 작업을 업데이트해야 합니다. 여기에는 작업에서 Liferay 구성 요소를 제거하고 다시 추가하는 작업이 포함됩니다.

```{note}
교체하기 전에 각 구성 요소의 구성을 문서화해야 합니다. 이렇게 하면 작업이 이전과 동일한 기능을 유지할 수 있습니다.
```

## 관련 주제

* [Liferay Talend 구성 요소 개요](./liferay-talend-components-overview.md)
* [Liferay 구성 요소를 사용하여 Talend 작업 설계](./designing-talend-jobs-using-liferay-talend-components.md)
