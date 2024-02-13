---
toc:
- ./file-storage/enabling-antivirus-scanning-for-uploaded-files.md
- ./file-storage/file-store-migration.md
- ./file-storage/other-file-store-types.md
---
# 파일 스토리지

Liferay DXP에 업로드된 모든 파일은 인스턴스의 지정된 파일 저장소에 저장됩니다. 여기에는 [문서 및 미디어](../content-authoring-and-management/documents-and-media.md)를 사용하여 업로드한 파일과 파일 첨부를 지원하는 애플리케이션(예: [메시지 보드](../collaboration-and-social/collaboration-and-social-overview.md))을 사용하여 업로드한 파일이 포함됩니다. 파일 저장소는 로컬 컴퓨터, 네트워크 탑재 파일 시스템, 데이터베이스 또는 클라우드에서 호스팅할 수 있습니다.

```{important}
프로덕션으로 이동하는 경우 라이브로 **전에** 다양한 파일 저장소 구성 옵션을 검토하고 필요에 가장 적합한 옵션을 선택하는 것이 좋습니다. 이렇게 하면 나중에 프로젝트 수명에서 고통스러운 파일 저장소 마이그레이션을 방지할 수 있습니다.
```

```{note}
파일 저장소는 문서 라이브러리라고도 합니다.
```

## 고급 파일 시스템 저장소 구성

고급 파일 시스템 저장소는 폴더에 파일을 사전순으로 중첩하여 수백만 개의 파일로 확장할 수 있는 폴더 구조를 프로그래밍 방식으로 생성합니다. 이렇게 하면 더 많은 파일을 저장할 수 있으며 일부 운영 체제에서 폴더당 저장할 수 있는 파일 수에 대한 제한을 피할 수 있습니다. 폴더당 더 적은 수의 파일을 저장하면 파일 조회 성능도 향상됩니다.

![고급 파일 시스템 저장소 폴더 구조](./file-storage/images/01.png)

고급 파일 시스템 저장 방법을 사용하려면 다음 단계를 따르십시오.

1. 다음 속성으로 [`Portal-ext.properties`](../installation-and-upgrades/reference/portal-properties.md) 을 구성합니다.

    ```properties
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    ```

1. 라이프레이를 다시 시작합니다.

1. 제어판에서 **구성** &rarr; **시스템 설정** &rarr; **파일 저장소** 로 이동합니다.

1. **Advanced File System Store** 화면에서 **Root Directory** 을 [Liferay Home](../installation-and-upgrades/reference/liferay-home.md) 경로(절대 또는 상대)로 설정합니다.

    ![고급 파일 시스템 저장소 화면](./file-storage/images/02.png)

1. **저장** 을 클릭합니다.

Liferay는 이제 Advanced File System Store를 사용하여 파일을 저장하고 있습니다.

```{important}
선택적으로 [업로드된 파일에 대한 자동 바이러스 백신 검사 활성화](./file-storage/enabling-antivirus-scanning-for-uploaded-files.md).
```

### 클러스터 환경의 파일 스토리지

[클러스터 환경](../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md)에서 모든 노드가 액세스할 수 있는 네트워크 마운트 파일 시스템을 가리킵니다. 네트워크 파일 시스템은 모든 노드에서 액세스할 수 있어야 하며 동시 요청을 지원하고 파일 잠금을 지원해야 합니다. 이러한 파일 시스템 없이 고급 파일 시스템 저장소를 사용하고 여러 사용자가 동일한 파일에 동시에 쓰기를 시도하면 데이터 손상이 발생할 수 있습니다.

## 기타 파일 스토리지 주제

### 기타 파일 저장 방법

다른 기본 제공 파일 저장 방법을 사용할 수 있습니다.

* [단순 파일 시스템 저장소](./file-storage/other-file-store-types/simple-file-system-store.md) 은 파일 시스템(로컬 또는 마운트된 공유)을 사용하여 파일을 저장합니다. 이것은 **기본** 파일 저장소입니다.

* [S3 Store(Amazon Simple Storage Service)](./file-storage/other-file-store-types/amazon-s3-store.md) 은 Amazon의 클라우드 기반 스토리지를 사용합니다.

* [DBStore(Database Storage)](./file-storage/other-file-store-types/dbstore.md) 파일을 DXP 데이터베이스에 `blob`으로 저장합니다. DBStore의 파일 크기 제한은 1GB입니다. 1GB보다 큰 파일을 저장하려면 단순 파일 시스템 저장소 또는 고급 파일 시스템 저장소를 사용하십시오.

```{warning}
파일 시스템 기반 저장소(Simple, Advanced, S3)에는 트랜잭션 롤백 기능이 없습니다. 문서 라이브러리에서 데이터베이스 트랜잭션 롤백이 발생하면 트랜잭션의 파일 시스템 변경 사항이 취소되지 않습니다. 문서 라이브러리 파일과 파일 시스템 저장소의 파일 간에 불일치가 발생할 수 있으며 수동 동기화가 필요할 수 있습니다. [디비스토어](./file-storage/other-file-store-types/dbstore.md) 을 제외한 모든 저장소는 이 제한에 취약합니다.
```

### 파일 저장소 간 파일 마이그레이션

데이터 마이그레이션 유틸리티는 한 저장소 옵션에서 다른 저장소 옵션으로 파일을 이동합니다. 예를 들어 단순 파일 시스템 저장소(기본 저장소)에서 고급 파일 시스템 저장소로 파일을 마이그레이션하여 성능 및 확장성 이점을 활용하는 데 사용할 수 있습니다. 자세한 내용은 [파일 저장소 마이그레이션](./file-storage/file-store-migration.md) 을 참조하십시오.