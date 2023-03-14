---
uuid: 5063468f-80eb-433a-b78c-86e154032f63
---

# 구성 및 속성 마이그레이션

현재 DXP 설치의 OSGi 구성(7.0+) 및 속성(예: [포털 속성](../reference/portal-properties.md) 및 [시스템 속성](../reference/system-properties.md))은 필요에 맞게 DXP 인스턴스를 설정합니다. 새 DXP 인스턴스에서 이러한 설정을 사용하려면 새 Liferay Home으로 마이그레이션하고 업데이트해야 합니다.

## 개요

* [Liferay 홈 마이그레이션](#migrating-liferay-home)
* [데이터베이스 업그레이드 설정 업데이트](#updating-settings-used-by-the-database-upgrade)
* [포털 속성 마이그레이션](#migrating-portal-properties)

## Liferay Home 및 애플리케이션 서버 파일 마이그레이션

1. 백업 [에서 추가 및 편집한 [Liferay 홈 파일](../maintaining-a-liferay-installation/backing-up.md#liferay-home) 및 [애플리케이션 서버 파일](../maintaining-a-liferay-installation/backing-up.md#application-server) 을 설치에 병합](../maintaining-a-liferay-installation/backing-up.md). 파일에는 다음이 포함될 수 있지만 이에 국한되지는 않습니다.

    * `/license/*`: 활성화 키. (구독)
    * `/log/*`: 로그 파일.
    * `/osgi/configs/*.config`: OSGi 구성 파일.
    * `portal-*.properties`: 포털 특성 파일(예: `portal-ext.properties`.
    * 애플리케이션 서버 파일: 수정된 스크립트 및 구성 파일.
    * `web.xml`: 포털 웹 애플리케이션 디스크립터.

1. 새 설치의 `[Liferay Home]/data` 폴더를 백업의 `[Liferay Home]/data` 폴더로 교체합니다.

1. [파일 저장소(문서 라이브러리)](../../system-administration/file-storage.md) 를 백업에서 [새 설치로 복사하거나 [`.config` 파일](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) ](../maintaining-a-liferay-installation/backing-up.md) 통해 사용하도록 새 설치를 구성하여 설정합니다.

## 데이터베이스 업그레이드를 위한 설정 업데이트

DXP 및 일부 Marketplace 앱의 업그레이드 프로세스는 포털 속성 및 OSGi 구성을 사용합니다. 사용자 지정 코드의 업그레이드 프로세스에는 속성 업데이트 및 구성 업데이트가 필요할 수도 있습니다. 이러한 설정 및 업데이트는 데이터베이스 업그레이드 **전에** 이루어져야 합니다. 다른 업데이트는 데이터베이스 업그레이드 후에 수행할 수 있습니다.

다음은 DXP 업그레이드 프로세스에 필요한 설정 업데이트입니다.

* [데이터베이스 드라이버](#database-drivers)
* 문서 라이브러리 저장소 구현 이름( [파일 저장소 업데이트](./reference/file-store-updates.md#updating-the-store-implementation-class-name) 참조)

```{important}
필요한 설정 업데이트에 대한 Marketplace 앱 및 사용자 정의 코드를 확인하십시오.
```

### 데이터베이스 드라이버

권장 데이터베이스 드라이버에 대해서는 데이터베이스 공급업체 설명서를 확인하십시오. 새 드라이버가 권장되는 경우 기존 드라이버 JAR 파일을 바꾸고 `Portal-ext.properties` 파일의 `jdbc.default.driverClassName` 속성을 새 드라이버 클래스 이름으로 업데이트합니다.

MySQL 예시:

```properties
jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
```

더 많은 드라이버 예제는 [데이터베이스 템플릿](../reference/database-templates.md) 을 참조하십시오.

## 포털 속성 마이그레이션

```{important}
`로케일` [포털 속성](../../installation-and-upgrades/reference/portal-properties.md)을 재정의한 경우 업그레이드하기 전에 새 설치에서 재정의합니다. 이렇게 하면 모든 로케일에 대한 데이터 업그레이드가 보장됩니다.
```

여기에서 설명하는 속성은 데이터베이스 업그레이드 후 업데이트할 수 있습니다. 속성 마이그레이션에는 다음 작업이 포함됩니다.

* `liferay.home` 속성 업데이트(변경한 경우)
* [Blade CLI](../../building-applications/tooling/blade-cli/installing-and-updating-blade-cli.md) 사용하여 속성 변경 보고
* 특성을 OSGi 구성으로 변환
* 특수 속성 마이그레이션 고려 사항

### 블레이드 CLI를 사용하여 호환되지 않는 속성 보고

[Blade CLI](../../building-applications/tooling/blade-cli/installing-and-updating-blade-cli.md) 도구의 `upgradeProps` 명령은 포털 속성 파일 간의 변경 사항을 보고합니다. 도구는 이러한 유형의 변경 사항을 보고합니다.

* 업데이트되지 않은 경우 예외를 발생시키는 속성입니다.
* 속성이 모듈 `portal.properties` 파일로 이동되었습니다.
* 속성이 OSGi 구성으로 이동되었습니다.
* 새 DXP 버전에서 속성을 찾을 수 없습니다.

대부분의 경우 `upgradeProps` 명령은 필수 업데이트를 설명하거나 속성 변경에 대한 자세한 정보를 참조합니다.

`블레이드 upgradeProps` 명령 형식:

```bash
blade upgradeProps -p {old_liferay_home_path}/portal-ext.properties -d {new_liferay_home_path}
```

다음은 `blade upgradeProps` 명령을 실행한 결과의 예입니다.

```
...
index.search.query.suggestion.dictionary
    MODULARIZE AS OSGI - This property matches with the following OSGI config, select the most appropriate:
        - searchQueryResultWindowLimit from com.liferay.portal.search.configuration.DefaultSearchResultPermissionFilterConfiguration

index.search.spell.checker.dictionary
    KEEP - This property is still present in the new portal.properties.

sites.friendly.url.page.not.found
    KEEP - This property is still present in the new portal.properties.

web.server.protocol
    KEEP - This property is still present in the new portal.properties.
...
```

### 속성을 OSGi 구성으로 변환

모듈화된 기능의 속성이 변경되었으며 이제 [OSGi 구성 파일](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) (OSGi 구성 관리자)에 배포됩니다.

예를 들어 6.2에서 단순 파일 저장소는 이 포털 속성을 사용하여 저장소 루트 디렉터리를 지정했습니다.

```properties
dl.store.file.system.root.dir=${liferay.home}/data/document_library
```

이제 저장소는 다음과 같은 설정으로 루트 디렉토리를 지정하는 `com.liferay.portal.store.file.system.configuration.FileSystemStoreConfiguration.config` 이라는 `.config` 파일에 구성됩니다.

```properties
rootDir="{document_library_path}"
```

`.config` 파일을 `[Liferay Home]/osgi/configs`폴더에 넣습니다.

```{tip}
제어판의 *시스템 설정* 화면(*구성* 아래)은 OSGi 구성 관리 값을 관리합니다. 이 화면은 ``.config`` 파일을 만드는 가장 정확한 방법입니다. 구성하려는 기능을 구성하는 화면을 찾아 *저장*을 클릭한 다음 옵션 버튼을 사용하여 [화면의 구성 내보내기](../../system-administration/configuring-liferay/configuration-files-and -factories/using-configuration-files.md)를 `.config` 파일로 복사합니다.
```

### 특수 속성 마이그레이션 고려 사항

특정 환경, Liferay 버전 및 기능과 관련된 속성을 마이그레이션하기 위한 리소스가 있습니다. 그들은 편의를 위해 여기에서 호출됩니다.

1. 파일 저장소 설정 업데이트는 [파일 저장소 업데이트](./reference/file-store-updates.md)에서 설명합니다.

1. Liferay Portal 6.1 또는 이전 버전을 사용 중인 경우 [Liferay Portal 6.2에서 도입한 새로운 기본값으로 속성을 조정하십시오](https://help.liferay.com/hc/ko/articles/360017903232-Upgrading-Liferay#review-the-liferay-62-properties-defaults) .

1. 샤딩된 환경이 있는 경우 [비샤딩 환경을 생성하도록 업그레이드를 구성합니다](./other-upgrade-scenarios/upgrading-a-sharded-environment.md).

1. [7.4](./reference/default-setting-changes-in-7-4.md), [7.3](./reference/default-setting-changes-in-7-3.md)및 [7.2](./reference/default-setting-changes-in-7-2.md)에서 기본 포털 속성 변경 사항을 검사합니다.

1. Liferay의 이미지 스프라이트 프레임워크는 7.2부터 사용되지 않으며 기본적으로 비활성화되어 있습니다. 프레임워크에는 이미지 스프라이트용 스캔 플러그인이 필요합니다. 프레임워크를 사용하지 않으면 이미지 스프라이트를 스캔할 필요가 없습니다. 프레임워크를 직접 사용하는 경우 [`portal-ext.properties`](../reference/portal-properties.md) 파일에서 다음 설정으로 기본 `sprite.enabled` 포털 속성(7.2 이후) 값을 재정의하여 활성화합니다.

    ```properties
    sprite.enabled=true
    ```

   ```{note}
   원하는 프레임워크를 사용하여 이미지 스프라이트를 빌드하고 플러그인에 배포할 수 있습니다.
   ```

## 다음 단계

Liferay 설정이 새 DXP 인스턴스에서 사용할 준비가 되었습니다. 다음으로 [파일 저장소 업데이트](./reference/file-store-updates.md).
