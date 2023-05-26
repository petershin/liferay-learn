# 백업에서 데이터 복원

프로젝트 개발 중에 데이터를 복원하거나 프로젝트를 이전 상태로 롤백해야 하는 경우가 있습니다. 백업을 환경으로 복원하면 각 서비스의 데이터가 복원되지만 환경이 사용 중인 빌드는 변경되지 **않습니다** .

사용자 지정 SQL 스크립트를 사용하여 데이터 복원의 일부로 데이터베이스에 대한 추가 업데이트를 수행할 수도 있습니다.

백업에서 데이터를 복원하면 데이터베이스 서비스 및 이에 의존하는 모든 서비스(Liferay 포함)가 중단됩니다. 그러나 백업 서비스 버전이 `5.xx`이상인 경우 기본 `OVERWRITE` 복원 동작을 `PREPARE_AND_SWAP`로 변경하여 가동 중지 시간을 최소화할 수 있습니다. 이렇게 하면 별도의 새로운 데이터베이스 인스턴스와 볼륨이 시작되고 준비가 된 경우에만 새 인스턴스로 전환됩니다. 이 전략을 사용하려면 [`LCP_BACKUP_RESTORE_STRATEGY` 환경 변수](./backup-service-overview.md#environment-variables-reference) 을 `PREPARE_AND_SWAP` 로 설정합니다.

백업 페이지에 대한 자세한 내용은 [백업 서비스](./backup-service-overview.md) 및 [백업 다운로드 및 업로드](./downloading-and-uploading-backups.md) 참조하십시오.

```{important}
선택한 환경에 대한 관리자 역할을 가진 사용자만 Liferay Cloud 콘솔을 통해 수동으로 환경을 복원할 수 있습니다.
```

## 백업 페이지에서 환경 복원

각 환경의 **백업** 페이지에는 최근에 수행된 모든 백업 목록(자동 및 수동)이 있습니다. 이 페이지에서 환경으로 백업을 복원하면 각 서비스에서 사용하는 데이터가 복원되지만 각 서비스에서 사용 중인 빌드 또는 Docker 이미지는 변경되지 **않습니다** .

```{warning}
복원 중인 백업의 `backup` 서비스 버전은 성공적으로 완료되도록 복원하기 전에 대상 환경과 일치해야 합니다. Liferay [수정 팩 수준]((https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.html) 또한 일치하지 않는 데이터베이스 스키마로 인해 오류가 발생하지 않도록 일치해야 합니다. 환경에 현재 배포된 빌드와 다른 빌드가 필요한 백업을 복원하는 경우 [적절한 빌드 배포](../../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md) 복원을 시작하기 *전*.
```

백업에서 환경을 복원하려면 다음 단계를 따르십시오.

1. 프로젝트에서 선택한 환경으로 이동합니다.

1. 화면 왼쪽의 환경 메뉴에서 백업을 클릭합니다.

1. 프로젝트 환경을 복원하는 데 사용할 백업에 대해 **작업** 버튼( ⋮ )을 클릭합니다.

1. **복원 대상...을 클릭하십시오**

   ![그림 1: Actions 버튼을 클릭한 다음 Restore To...를 클릭합니다.](./restoring-data-from-a-backup/images/01.png)

1. 드롭다운 **환경** 메뉴를 클릭하고 복원하려는 환경을 선택합니다.

   ![그림 2: 복원할 환경을 선택합니다.](./restoring-data-from-a-backup/images/02.png)

   ```{note}
   관리자는 액세스 권한이 있는 환경만 복원할 수 있습니다.
   ```

1. 아래에 표시되는 **확인란** 모두 클릭합니다. 버튼을 활성화하여 복원을 시작하려면 이 확인란을 선택해야 합니다.

1. **환경** 로 복원을 클릭하여 복원 프로세스를 시작합니다.

   ![그림 3: 모든 확인란을 클릭하여 복원을 확인합니다.](./restoring-data-from-a-backup/images/03.png)

복원 프로세스 중에 대상 환경의 서비스가 다시 시작됩니다.

활동 페이지의 백업 서비스 **로그** 및 **일반** 섹션에서 복원 상태를 추적할 수 있습니다.

## 데이터 복원과 함께 사용자 지정 SQL 스크립트 적용

사용자 지정 SQL 스크립트를 사용하여 일반 데이터 복원으로 데이터베이스에 대한 추가 업데이트를 수행할 수도 있습니다. 이 접근 방식은 별도로 유지 관리되는 데이터베이스 백업에 스크립트를 적용할 수 있으므로 중요한 데이터를 삭제하는 데 이상적입니다.

```{note}
이 기능을 사용하려면 버전 3.0.7 이상의 백업 서비스가 필요합니다.
```

### SQL 스크립트 준비

SQL 스크립트에는 다음 형식이 지원됩니다.

* `.sql` 은 개별 스크립트에 사용됩니다.
* `.zip`, `.tgz`또는 `.gz` 는 압축 파일 내의 여러 스크립트에 사용됩니다.

스크립트는 실행될 때 영숫자 순서로 실행됩니다. 또한 SQL 스크립트는 실행할 정확한 데이터베이스를 참조해야 합니다(예: `USE lportal;` 또는 `lportal.User_`).

SQL 스크립트를 적절한 환경별 `backup/configs/{ENV}/scripts/` 폴더에 배치합니다.

```{note}
버전 3.xx 서비스를 사용하는 경우 SQL 스크립트는 대신 적절한 `lcp/backup/script/{ENV}/` 폴더에 속합니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

### 데이터 복원 수행

SQL 스크립트를 준비했으면 다음 단계에 따라 데이터 복원과 함께 사용자 정의 SQL 스크립트를 적용하십시오.

1. [사용자 지정 SQL 스크립트를 온라인으로 포함하도록 백업 서비스](../../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md) 배포합니다.

1. [백업 페이지에서 환경 복원](#restoring-an-environment-from-the-backups-page) 에 대해 위에 나열된 지침을 따르십시오.

데이터베이스가 복원되면 백업 서비스의 `scripts` 폴더에서 SQL 스크립트가 실행됩니다.

```bash
Jun 20 14:46:41.795 build-39 [backup-57488f8b8-rjq4f] Running Script: SanitizeOrg.sql
Jun 20 14:46:41.970 build-39 [backup-57488f8b8-rjq4f] Running Script: SanitizeUsers.sql
```

## 추가 정보

* [백업 서비스](./backup-service-overview.md)
* [백업 다운로드 및 업로드](./downloading-and-uploading-backups.md)
* [데이터베이스 서비스(MySQL)](../database-service/database-service.md)
