# 업그레이드 보고서

{bdg-secondary}`사용 가능 7.4 이상`

업그레이드를 수행할 때는 변경된 사항과 발생한 문제를 파악하는 것이 중요합니다. 업그레이드 보고서는 이러한 세부 정보가 포함된 보고서로 이 정보를 캡처합니다:

* 실행 날짜 및 시간
* 업그레이드의 총 실행 시간
* 초기, 예상 및 최종 DXP/Portal 스키마 버전 및 빌드 번호
* 데이터베이스 공급업체 및 버전
* 업그레이드 관련 포털 속성 설정
* 문서 라이브러리 저장소 및 `rootDir` 구성 설정
* 문서 라이브러리 크기( [파일 시스템 저장소](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) 및 [고급 파일 시스템 저장소](../../../system-administration/file-storage.md))
* 행 단위의 초기 크기와 행 단위의 최종 크기가 포함된 데이터베이스 테이블 목록
* 가장 오래 지속되는 20가지 업그레이드 프로세스
* 오류 및 각 유형별 빈도
* 경고 및 각 유형별 빈도

업그레이드 보고서는 [업그레이드 도구](../upgrade-basics/using-the-database-upgrade-tool.md) 또는 포털 속성으로 시작할 때 사용할 수 있습니다.

업그레이드 보고서 정보는 [업그레이드 로그 컨텍스트](./upgrade-log-context.md)를 활성화하여 콘솔 로그에 출력할 수도 있습니다.

## 업그레이드 도구를 통한 업그레이드 보고서

업그레이드 보고는 `tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` 파일에서 `upgrade.report.enabled=true` 속성을 설정하여 활성화할 수 있습니다. 예를 들어

```bash
cd liferay-home
```

```bash
echo "upgrade.report.enabled=\"true\"" << tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties
```

업그레이드 보고서는 `/tools/portal-tools-db-upgrade-client/reports` 폴더에 생성됩니다.

## 포털 속성을 사용하여 시작 시 보고서 업그레이드

시작 시 업그레이드 보고서를 사용 설정하려면 `portal-ext.properties` 파일에서 다음 두 가지 [포털 속성](../../reference/portal-properties.md) 을 설정하세요:

```properties
upgrade.database.auto.run=true
upgrade.report.enabled=true
```

업그레이드 보고서는 `{liferay-home}/reports` 폴더에 생성됩니다.

## 추가 정보

이후 업그레이드 시 도구는 파일 이름에 타임스탬프를 추가하고(예: `upgrade_report.info.1631029824000`), 새 업그레이드 세부 정보를 새 `upgrade_report.info` 파일에 보고합니다.

문서 라이브러리 크기를 계산하려면 대기 시간이 길어질 수 있습니다. 따라서 타임아웃 기간은 기본적으로 10초로 설정되어 있습니다. 이 기간을 변경하려면 `portal-ext.properties` 파일에서 `upgrade.report.dl.storage.size.timeout` 속성을 수정하세요. 시간을 늘리거나 `0` 으로 값을 설정하여 시간 초과를 비활성화합니다.

## 샘플 업그레이드 보고서

다음은 업그레이드 보고서의 예입니다:

```
...
Date: Tue, Jul 26, 2022 09:02:44 UTC

Upgrade completed in 388 seconds

Initial portal build number: 7310
Initial portal schema version: 8.18.4
Final portal build number: 7413
Final portal schema version: 16.0.0
Expected portal build number: 7413
Expected portal schema version: 16.0.0

Using mariadb version 10.7

liferay.home=/Users/liferay/tomcat/liferay-dxp-7.4.13.u34
...
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
rootDir=/Users/liferay/tomcat/liferay-dxp-7.4.13.u34/data/document_library

The document library storage size is 689.01 KB

Tables in database sorted by initial number of rows:
Table name                           Rows (initial)         Rows (final)
--------------                       --------------       --------------
ResourceAction                                 1822                 2043
ResourcePermission                             1440                 1488
Marketplace_Module                             1195                 2538
...
SegmentsExperience                                0                    1

Top 20 longest running upgrade processes:
    com.liferay.client.extension.internal.upgrade.v3_1_0.ClientExtensionEntryUpgradeProcess took 6866 ms to complete
    com.liferay.client.extension.internal.upgrade.v2_0_0.RemoteAppEntryUpgradeProcess took 4938 ms to complete
    com.liferay.portal.upgrade.v7_4_x.UpgradeCountry took 4429 ms to complete
   ...
    com.liferay.batch.engine.internal.upgrade.v4_4_0.BatchEngineExportTaskUpgradeProcess took 1228 ms to complete

No errors thrown during upgrade

Warnings thrown during upgrade process

...
```

## 관련 주제

* [업그레이드 기본 사항](../upgrade-basics.md)
* [데이터베이스 업그레이드 도구 실행](../upgrade-basics/using-the-database-upgrade-tool.md)
* [업그레이드 로그 컨텍스트](./upgrade-log-context.md)
* [MBeans로 업그레이드 모니터링](./monitoring-upgrades-with-mbeans.md)
* [데이터베이스 업그레이드 도구 참조](../reference/database-upgrade-tool-reference.md#manual-configuration)
* [업그레이드 문제 해결](../reference/troubleshooting-upgrades.md)
