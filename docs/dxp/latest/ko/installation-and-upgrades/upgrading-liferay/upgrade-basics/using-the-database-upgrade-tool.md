---
uuid: b688041a-0a2f-4b4f-a149-f49915433003
---

# 데이터베이스 업그레이드 도구 사용

Liferay 데이터베이스 업그레이드 도구는 Liferay DXP 및 Liferay Portal 데이터베이스를 오프라인으로 업그레이드하기 위한 클라이언트 프로그램입니다.

```{important}
**항상** 업그레이드하기 전에 데이터와 설치를 [백업](../../maintaining-a-liferay-installation/backing-up.md)하십시오. 백업 복사본에서 업그레이드 프로세스를 테스트하는 것이 좋습니다.
```

```{important}
6.2 이하에서 업그레이드하는 경우 파일 저장소 구성을 업데이트하십시오. 자세한 내용은 [파일 저장소 업데이트](../reference/file-store-updates.md)를 참조하세요.
```

Liferay 인스턴스에서 분리된 데이터베이스를 수정하면 [업그레이드 작업을 위한 데이터베이스 조정](../upgrade-stability-and-performance/database-tuning-for-upgrades.md), [불필요한 데이터 정리](../upgrade-stability-and-performance/database-tuning-for-upgrades.md) (예: 불필요한 버전의 웹 콘텐츠, 문서 등) 업그레이드 성능을 개선하고 업그레이드 문제를 해결할 수 있습니다. . 이러한 활동은 DXP 및 크고 중요한 Portal 환경을 최대한 안전하고 빠르게 업그레이드하는 데 특히 중요합니다. 데이터베이스 조정 및 가지치기와 [업그레이드 기본 사항](../upgrade-basics.md)에 설명된 관련 작업을 완료한 후에는 새 설치를 설정하고 업그레이드 도구를 사용하여 데이터베이스를 업그레이드할 준비가 된 것입니다.

새 Liferay Docker 이미지로 [업그레이드하고](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md) 업그레이드 도구를 사용하려면 새 Liferay 버전의 [Liferay Tomcat 번들](../../installing-liferay/installing-a-liferay-tomcat-bundle.md) 에서 사용하십시오. 도구는 번들의 `tools/portal-tools-db-upgrade-client` 폴더에 있습니다.

응용 프로그램 서버에 새 Liferay 릴리스를 설치한 경우 `[Liferay Home]/tools/portal-tools-db-upgrade-client` 폴더를 만들고 업그레이드 도구를 다운로드한 다음 도구를 새 폴더에 설치합니다.

| 편집             | 지침 다운로드                                                                                                                                                                               |
|:-------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 라이프레이 DXP(구독)  | [*다운로드* 페이지](https://customer.liferay.com/group/customer/downloads) 으로 이동하여 DXP 버전과 _제품/서비스 팩_ 파일 형식을 선택합니다. 표시되는 목록에서 _Liferay DXP 업그레이드 클라이언트_에 대해 _다운로드_ 클릭합니다.                    |
| Liferay Portal | [_다운로드_ 페이지](https://www.liferay.com/downloads-community)으로 이동합니다. _Liferay Portal_ 다운로드 메뉴에서 _기타 파일_ 선택하고 _다운로드_클릭합니다. 최신 Liferay Portal 릴리스 자산 GitHub 페이지가 나타납니다. `[version]`클릭합니다. |

## 새 설치 설정

1. 새 Liferay 설치의 `[Liferay Home]/data` 폴더를 [백업](../../maintaining-a-liferay-installation/backing-up.md)의 `[Liferay Home]/data` 폴더로 교체합니다.

1. DXP 활성화 키(구독) 및 [OSGi 구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md를 복사합니다. ) [백업](../../maintaining-a-liferay-installation/backing-up.md#liferay-home)에서 새 설치로.

1. 7.2로 업그레이드하는 경우 새 설치의 `[Liferay Home]/files/osgi/configs/` 폴더에 있는 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 사용하여 검색 인덱싱을 비활성화하십시오. 예를 들어, 

    ```bash
    cd liferay-home
    ```

    ```bash
    mkdir -p osgi/configs
    ```

    ```bash
    echo "indexReadOnly=\"true\"" >> osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
    ```

    ```{note}
    DXP/Portal 7.3+는 검색 인덱싱을 자동으로 비활성화/재활성화합니다.
    ```

1. [Commerce](https://learn.liferay.com/commerce/latest/en/index.html)사용하고 있다면 업그레이드할 준비를 하십시오. 자세한 내용은 [Liferay Commerce](https://learn.liferay.com/commerce/latest/en/installation-and-upgrades/upgrading-liferay-commerce.html) 업그레이드를 참조하십시오.

1. Liferay 데이터베이스 업그레이드와 함께 Marketplace 앱 데이터를 업그레이드하려면 [새 Liferay 버전을 대상으로 하는 각 앱의 최신 버전을 다운로드하고 `[Liferay Home]/deploy` 폴더에 복사합니다](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md) 그렇지 않으면 데이터베이스 업그레이드 후 앱을 설치하고 [업그레이드 후 고려 사항](./post-upgrade-considerations.md)에 설명된 대로 데이터를 업그레이드할 수 있습니다.

1. [고급 파일 시스템 저장소](../../../system-administration/file-storage.md) 또는 수정된 저장소 위치가 있는 [단순 파일 시스템 저장소](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) 사용하는 경우 파일 저장소 설정을 [`.config` 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 로 내보내고 새 `[Liferay Home]/에 복사합니다. osgi/configs/` 폴더. 

    ```{important}
    [고급 파일 시스템 저장소](../../../system-administration/file-storage.md)를 사용하는 경우 새 설치에서 `.config` 파일로 구성해야 합니다. 데이터 베이스.

    다음은 필수 `rootDir` 매개변수가 있는 `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config` 파일의 예입니다.

    `rootDir="data/document_library"`
    ```

1. 데이터베이스 벤더의 권장 JDBC 드라이버를 사용하십시오. 예를 들어 MySQL을 사용하는 경우 [`portal-ext.properties`](../../reference/portal-properties.md) 파일에서 `jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver` 설정하고 MySQL JDBC 드라이버 JAR을 앱 서버로 바꿉니다. 사용합니다. 자세한 내용은 [데이터베이스 드라이버](../migrating-configurations-and-properties.md#database-drivers) 참조하십시오.
   
   업그레이드 도구 프롬프트에 응답하거나 [업그레이드 속성 파일 사용](../reference/database-upgrade-tool-reference.md#manual-configuration)을 통해 업그레이드를 구성할 수 있습니다.

    ```{note}
    [새 Liferay Docker 이미지로 업그레이드](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md)하는 경우 다음을 확인하십시오. Docker 환경 변수 대신 [포털 속성](../../reference/portal-properties.md) 파일을 사용하여 데이터베이스 연결을 지정합니다. [포털 속성 참조](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html)에는 각 Liferay 환경 변수에 해당하는 포털 속성이 나열되어 있습니다.
    ```
1. (선택 사항) [업그레이드 보고](../reference/upgrade-reports.md)를 활성화하여 환경, 변경 사항 등을 보고서에 기록합니다.

    ```bash
    echo "upgrade.report.enabled=\"true\"" << tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties
    ```

### 일괄 삽입 속성

`Portal-upgrade-database.properties` 파일에서 JDBC 구성에 대한 일괄 삽입 속성을 활성화할 수 있습니다. 이것은 더 빠른 실행을 위해 삽입 문을 일괄 처리하여 성능을 향상시킵니다. 공급업체의 속성 매개변수는 아래 표를 참조하세요. 이 기능은 DB2 및 Oracle 데이터베이스에서 사용할 수 없습니다.

| 데이터베이스 공급자 | 재산                               |
|:---------- |:-------------------------------- |
| MariaDB    | `rewriteBatchedStatements=true`  |
| MySQL      | `rewriteBatchedStatements=true`  |
| PostgreSQL | `reWriteBatchedInserts=true`     |
| SQL 서버     | `useBulkCopyForBatchInsert=true` |


```{note}
배치 삽입 속성은 [`portal-upgrade-database.properties`](https://github.com/liferay/liferay-portal/blob/master/modules/util/portal-tools-db-upgrade- client/properties/portal-upgrade-database.properties) 파일(Liferay 7.4 U60+/GA60+용).
```

## 업그레이드 도구 실행

업그레이드 도구는 명령줄 인터페이스를 통해 또는 [속성 파일 사용](../reference/database-upgrade-tool-reference.md#manual-configuration)을 통해 구성됩니다. 

`[Liferay Home]/tools/portal-tools-db-upgrade-client` 폴더의 `db_upgrade.sh` 스크립트는 업그레이드 도구를 호출합니다. `--help` 옵션은 도구의 사용법을 설명합니다.

```bash
./db_upgrade.sh --help
```

업그레이드 도구를 사용하여 데이터베이스를 업그레이드하는 방법은 다음과 같습니다.

1. 업그레이드 도구를 시작합니다. 다음은 예제 명령입니다. 

    ```bash
    cd liferay-home/tools/portal-tools-db-upgrade-client
    ```

    ```bash
    ./db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx4096m"
    ```

    위의 명령은 애플리케이션 서버에 권장되는 것과 동일한 JVM 옵션으로 업그레이드 도구를 실행합니다. 파일 인코딩(`UTF-8`), 시간대(`GMT`), 국가, 언어 및 메모리 설정(`-Xmx 값`)은 모두 애플리케이션 서버의 설정과 일치해야 합니다. 데이터가 10GB 이상인 데이터베이스의 경우 `-Xmx` 옵션을 사용하여 추가 메모리를 할당하십시오.
    
     [업그레이드 속성 파일](../reference/database-upgrade-tool-reference.md#manual-configuration)을 사용하여 업그레이드를 구성하지 않은 경우 업그레이드 도구는 구성 값을 묻는 메시지를 표시하고 괄호 안에 기본값을 표시합니다. . 다음은 상호 작용의 예입니다.

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

    프롬프트에 표시된 기본값을 사용하려면 Enter 키를 누릅니다.
    
    구성이 완료되면 업그레이드가 시작됩니다. 이 도구는 각 업그레이드 프로세스 시작 및 완료를 기록합니다.

1. 업그레이드가 완료된 후 데이터베이스 업그레이드 실패, 오류 또는 경고에 대해 [업그레이드 보고서](../reference/upgrade-reports.md) 확인하십시오. [Gogo Shell 명령](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) 을 사용하여 문제를 해결하고 업그레이드를 완료할 수 있습니다.

데이터베이스 업그레이드를 완료하고 모든 문제를 해결했습니다.

## 업그레이드된 데이터베이스 테스트

이제 데이터베이스 업그레이드가 완료되었으므로 테스트하십시오.

1. 새 Liferay Docker 이미지로 업그레이드하는 경우 이미지가 업그레이드된 데이터베이스를 가리키도록 하고 데이터베이스에서 Liferay의 유효성을 검사합니다. 자세한 내용은 [Liferay 컨테이너 구성](../../installing-liferay/using-liferay-docker-images/configuring-containers.md) 참조하십시오.

1. [업그레이드 후 고려 사항](./post-upgrade-considerations.md)검토합니다.

1. 사용자 지정 [Liferay Home 파일](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) 및 [응용 프로그램 서버 파일](../../maintaining-a-liferay-installation/backing-up.md#application-server) 을 백업에서 새 설치로 복사하고 병합합니다. 파일에는 다음이 포함될 수 있지만 이에 국한되지는 않습니다.

    * `/license/*`: 활성화 키. (신청)
    * `/log/*`: 로그 파일.
    * `/osgi/configs/*.config`: OSGi 구성 파일.
    * `portal-*.properties`: `portal-ext.properties`과 같은 포털 특성 파일.
    * 애플리케이션 서버 파일: 수정된 스크립트 및 구성 파일.
    * `web.xml`: 포털 웹 애플리케이션 디스크립터.

1. [새 설치에서 포털 속성](../migrating-configurations-and-properties.md#migrating-portal-properties) 을 업데이트합니다.

1. 서버를 시작하고 업그레이드된 데이터베이스로 Liferay를 검증하십시오.
   
   ![다음은 Liferay DXP 랜딩 화면입니다.](./using-the-database-upgrade-tool/images/01.png)

데이터베이스 업그레이드 도구를 사용하여 Liferay 데이터베이스를 업그레이드했습니다.

평가판 업그레이드이고 업그레이드 시간을 단축하려면 업그레이드를 위해 데이터베이스를 조정하고(아직 수행하지 않은 경우) [불필요한 데이터 제거](../upgrade-stability-and-performance/database-pruning- for-faster-upgrades.md) 데이터베이스에서. 필요에 따라 이 문서의 단계를 반복합니다.

문제가 발생하면 [업그레이드 보고서](../reference/upgrade-reports.md) 및 [업그레이드 문제 해결](../reference/troubleshooting-upgrades.md)을 참조하십시오.

## 다음 단계

[업그레이드 기본 사항](../upgrade-basics.md) 다시 방문하여 업그레이드에 남은 사항을 확인하십시오.
