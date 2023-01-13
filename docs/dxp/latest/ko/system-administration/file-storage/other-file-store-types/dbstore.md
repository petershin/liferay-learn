# 디비스토어

DBStore는 파일을 Blob으로 DXP 데이터베이스에 저장합니다. DBStore에는 파일 기반 저장소 유형(Simple, Advanced, S3)에 있는 트랜잭션 롤백 취약점이 없습니다.

DBStore의 파일 크기 제한은 1GB입니다. 1기가바이트보다 큰 파일을 저장하려면 [단순 파일 시스템 저장소](./simple-file-system-store.md) 또는 [고급 파일 시스템 저장소](../file-storage.md#configuring-advanced-file-system-store)을 사용하십시오.

## 상점 구성

1. 다음 속성으로 [`Portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) 을 구성합니다.

    ```properties
    dl.store.impl=com.liferay.portal.store.db.DBStore
    ```

1. DXP를 다시 시작합니다.

DXP는 이제 DBStore에 파일을 저장하고 있습니다.

```{important}
[업로드된 파일에 대한 바이러스 백신 검사 활성화](../enabling-antivirus-scanning-for-uploaded-files.md)를 고려하십시오.
```

## 추가 정보

* [파일 스토리지](../../file-storage.md)
* [파일 저장소 마이그레이션](../file-store-migration.md)