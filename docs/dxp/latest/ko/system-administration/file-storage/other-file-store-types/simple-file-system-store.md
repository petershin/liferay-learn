# 단순 파일 시스템 저장소

단순 파일 시스템 저장소는 기본 파일 저장소 유형입니다. 파일 시스템(로컬 또는 마운트된 공유)을 사용하여 파일을 저장합니다. 단순 파일 시스템 저장소가 클러스터 환경에서 사용되는 경우 해당 폴더는 모든 클러스터 노드에서 액세스할 수 있고 동시 요청을 처리하며 파일 잠금을 지원해야 합니다. [SAN(Storage Area Network)](https://en.wikipedia.org/wiki/Storage_area_network) 또는 클러스터된 파일 시스템을 사용하는 것이 좋습니다.

간단한 파일 시스템 저장소는 Liferay DXP 데이터베이스에 바인딩됩니다. 기본 루트 폴더는 `[Liferay Home]/data/document_library`입니다. 단순 파일 시스템 저장소는 다음 파일 경로 형식을 사용하여 파일을 저장합니다.

```
[Liferay Home]/data/document_library/companyId/folderId/numericFileEntryName/versionNumber
```

![간단한 파일 시스템 저장소 파일 구조의 예.](./simple-file-system-store/images/01.png)

다음은 `[Liferay Home]/data/document_library` 폴더의 파일 계층 구조에 대한 설명입니다.

`companyId`: 사이트의 회사 ID입니다.

`folderId`: 파일 항목이 포함된 앱 폴더(예: 문서 및 미디어 폴더)의 ID입니다.

`numericFileEntryName`: 파일 항목의 숫자 이름입니다.

`versionNumber`: 파일 항목의 버전 번호.

**참고:** 문서의 숫자 파일 항목 이름과 문서 ID는 다음과 같은 방식으로 다릅니다.

* 그들은 독립적인 카운터를 가지고 있습니다.
* 저장 파일 경로에 숫자 파일 항목 이름이 사용되지만 문서 ID는 사용되지 않습니다.
* 서로 다른 `DLFileEntry` 테이블 열에 저장됩니다. 숫자 파일 항목 이름은 `이름` 열에 저장되고 문서 ID는 `fileEntryId` 열에 저장됩니다.

```{warning}
문서 라이브러리에서 데이터베이스 트랜잭션 롤백이 발생하는 경우 트랜잭션의 파일 시스템 변경 사항은 되돌릴 **아닙니다**. 문서 라이브러리 파일과 파일 시스템 저장소의 파일 간에 불일치가 발생할 수 있으며 수동 동기화가 필요할 수 있습니다. [디비스토어](./dbstore.md) 을 제외한 모든 DXP 저장소는 이 제한에 취약합니다.
```

## 상점 구성

단순 파일 시스템 저장소를 구성하려면 다음 단계를 따르십시오.

1. _메뉴_ (![Menu](./simple-file-system-store/images/02.png)) 버튼을 클릭하여 _제어판_에 액세스합니다.
1. _제어판_ &rarr; _구성_ &rarr; _시스템 설정_으로 이동합니다.
1. _플랫폼_ 섹션에서 _File Storage_을 클릭하십시오.
1. _Simple File System Store_ 화면에서 _루트 디렉토리_ 을 [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) 경로(절대 또는 상대)로 설정합니다.

    ![시스템 설정의 파일 저장소 페이지에서 문서 리포지토리 저장소를 구성할 수 있습니다.](./simple-file-system-store/images/03.png)

1. _저장_을 클릭합니다.

파일 저장소가 즉시 새 폴더로 전환됩니다.

다른 저장소 유형에서 단순 파일 시스템 저장소로 전환하는 경우 다음 속성으로 [`Portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) 을 구성하고 DXP를 다시 시작합니다.

```properties
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
```

```{important}
[업로드된 파일에 대한 바이러스 백신 검사 활성화](../enabling-antivirus-scanning-for-uploaded-files.md)를 고려하십시오.
```

## 클러스터 환경에서 저장소 사용

[클러스터 환경](../../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md)에서 저장소는 모든 노드가 액세스할 수 있는 네트워크 마운트 파일 시스템을 가리킵니다. 네트워크 파일 시스템은 모든 노드에서 액세스할 수 있어야 하며 동시 요청을 지원하고 파일 잠금을 지원해야 합니다. 이러한 파일 시스템 없이 단순 파일 시스템 저장소를 사용하고 여러 사용자가 동일한 파일에 동시에 쓰기를 시도하면 데이터 손상이 발생할 수 있습니다.

## 추가 정보

* [파일 스토리지](../../file-storage.md)
* [아마존 S3 스토어](./amazon-s3-store.md)
* [디비스토어](./dbstore.md)
* [파일 저장소 마이그레이션](../file-store-migration.md)