# 파일 저장소 마이그레이션

파일은 한 파일 저장소 유형에서 다른 파일 저장소 유형으로 마이그레이션할 수 있습니다. 다음은 몇 가지 마이그레이션 시나리오입니다.

* 성능 및 확장성 향상을 위해 단순 파일 시스템 저장소에서 고급 파일 시스템 저장소로 마이그레이션
* 트랜잭션 롤백 취약점을 방지하기 위해 Simple, Advanced 또는 S3에서 DBStore로 마이그레이션.
* 1GB보다 큰 파일을 수용하기 위해 DBStore에서 Advanced File System Store로 마이그레이션.

[서버 관리](../using-the-server-administration-panel.md) 의 데이터 마이그레이션 유틸리티는 마이그레이션을 용이하게 합니다.

```{warning}
**항상** 마이그레이션하기 전에 파일 저장소와 데이터베이스를 [백업](../../installation-and-upgrades/maintaining-a-liferay-installation/backing-up.md)하십시오. 백업 복사본에서 마이그레이션 프로세스를 테스트하는 것이 좋습니다.
```

## 파일 마이그레이션

마이그레이션 단계는 다음과 같습니다.

1. **시스템 설정** &rarr; **파일 저장소** 에서 새 파일 저장소를 구성합니다.
1. **Server Administration** &rarr; **Data Migration** 에서 리포지토리 후크(스토어 구현 클래스)를 선택하고 **Execute** 을 클릭합니다.

    ![데이터 마이그레이션 유틸리티](./file-store-migration/images/01.png)

1. 데이터가 올바르게 마이그레이션되었는지 확인하십시오.

1. 다음 설정 중 하나를 사용하여 [`Portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) 을 대상 파일 저장소 유형으로 구성합니다.

    ```properties
    dl.store.impl=com.liferay.portal.store.db.DBStore
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

1. DXP를 다시 시작합니다.

DXP 인스턴스는 새로 구성된 파일 저장소에서 마이그레이션된 파일을 사용하고 있습니다.

```{warning}
시스템 설정에서 새 상점 구성을 저장해야 합니다. 그렇지 않으면 새 저장소를 사용할 수 없으며 다음 예외가 발생합니다. `java.lang.IllegalStateException: Store is not available`
```

## 추가 정보

* [파일 스토리지](../file-storage.md)
* [아마존 S3 스토어](./other-file-store-types/amazon-s3-store.md)
* [디비스토어](./other-file-store-types/dbstore.md)