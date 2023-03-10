# 파일 저장소 업데이트

Liferay DXP 7.0에서 파일 저장소 옵션 및 구성 값이 변경되었습니다. 7.0 이전 버전을 사용 중이고 이러한 변경 사항의 영향을 받는 경우 DXP 데이터베이스를 업그레이드하기 전에 파일 저장소 **을 업데이트해야** .

이 표에는 Liferay 버전별로 필요한 업데이트가 나열되어 있습니다.

| 현재 Liferay 버전              | 필수 업데이트                                                                                                        |
|:-------------------------- |:-------------------------------------------------------------------------------------------------------------- |
| 라이프레이 DXP 7.0              | 1. CMIS Store 및 JCR Store에서 마이그레이션합니다.                                                                         |
| Liferay Portal 6.2 및 이전 버전 | 1. 상점 구현 클래스 이름을 업데이트하십시오.<br>2. CMIS Store 및 JCR Store에서 마이그레이션합니다.<br>3. 시스템 설정에서 파일 저장소를 구성합니다. |

다음 섹션에서는 파일 저장소를 업데이트하는 방법을 설명합니다.

## 상점 구현 클래스 이름 업데이트

상점 구현 클래스 패키지 이름이 Liferay Portal 6.2의 `com.liferay.portlet.documentlibrary.store.*` 에서 DXP 7.0의 `com.liferay.portal.store.*` 으로 변경되었습니다. 다음 중 한 가지 방법으로 `dl.store.impl` 속성을 [`portal-ext.properties`](../../reference/portal-properties.md) 설정하십시오.

```properties
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
dl.store.impl=com.liferay.portal.store.db.DBStore
dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
dl.store.impl=com.liferay.portal.store.s3.S3Store
```

## JCR 스토어에서 마이그레이션

JCR Store는 DXP 7.0에서 더 이상 사용되지 않습니다. [파일 스토리지](../../../system-administration/file-storage.md) 문서는 다른 저장 옵션을 설명합니다. [데이터베이스를 업그레이드하기 전에 지원되는 파일 저장소](../../../system-administration/file-storage/file-store-migration.md) 로 마이그레이션하십시오.

## CMIS 스토어에서 마이그레이션

CMIS Store는 7.0.10 수정팩 14에서 더 이상 사용되지 않으며 DXP 7.2에서 제거되었습니다. [파일 스토리지](../../../system-administration/file-storage.md) 문서는 다른 저장 옵션을 설명합니다. [데이터베이스를 업그레이드하기 전에 지원되는 파일 저장소](../../../system-administration/file-storage/file-store-migration.md) 로 마이그레이션하십시오.

## 시스템 설정에서 파일 저장소 구성

DXP 7.0부터 문서 저장소 유형별 구성(예: 단순 파일 저장소, 고급 파일 저장소, S3 등에 특정)은 제어판에서 **구성** → **시스템 설정** → **파일 저장소** 또는 OSGi 구성 파일(`.config` 파일)을 사용합니다. 유형별 구성은 더 이상 `portal-ext.properties`을 사용하여 수행되지 않습니다. 데이터베이스를 업그레이드한 후 [시스템 설정](../../../system-administration/file-storage.md)에서 파일 저장소를 구성하십시오.

저장소 구성에 대한 자세한 내용은 [File Storage 구성](../../../system-administration/file-storage.md) 을 참조하십시오.