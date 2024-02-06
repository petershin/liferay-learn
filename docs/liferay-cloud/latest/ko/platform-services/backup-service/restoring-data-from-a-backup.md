# 백업에서 데이터 복원

프로젝트 개발 중에 데이터를 복원하거나 프로젝트를 이전 상태로 롤백해야 하는 경우가 있을 수 있습니다. 환경에 백업을 복원하면 각 서비스의 데이터가 복원되지만 환경에서 사용하는 빌드는 변경되지 **않습니다** .

또한 사용자 정의 SQL 스크립트를 사용하여 데이터 복원의 일부로 데이터베이스에 대한 추가 업데이트를 수행할 수도 있습니다.

백업에서 데이터를 복원하면 데이터베이스 서비스 및 이에 의존하는 모든 서비스(Liferay 포함)의 다운타임이 발생합니다. 그러나 백업 서비스 버전이 `5.x.x 이상`인 경우 기본 `OVERWRITE` 복원 동작을 `PREPARE_AND_SWAP`으로 변경하여 가동 중지 시간을 최소화할 수 있습니다. 이렇게 하면 별도의 새 데이터베이스 인스턴스 및 볼륨이 시작되고 준비가 완료된 경우에만 새 인스턴스로 전환됩니다. 이 전략을 사용하려면 [`LCP_BACKUP_RESTORE_STRATEGY` 환경 변수](./backup-service-overview.md#environment-variables-reference) 를 `PREPARE_AND_SWAP` 으로 설정합니다.

백업 페이지에 대한 자세한 내용은 [백업 서비스](./backup-service-overview.md) 및 [백업 다운로드 및 업로드](./downloading-and-uploading-backups.md) 를 참조하세요.

```{important}
선택한 환경에 대한 관리자 역할이 있는 사용자만 Liferay 클라우드 콘솔을 통해 환경을 수동으로 복원할 수 있습니다.
```

## 백업 페이지에서 환경 복원하기

각 환경의 **백업** 페이지에는 최근에 수행한 모든 백업(자동 및 수동)의 목록이 있습니다. 이 페이지에서 환경으로 백업을 복원하면 각 서비스에서 사용하는 데이터가 복원되지만 **각 서비스에서 사용 중인 빌드 또는 Docker 이미지가** 변경되지는 않습니다.

```{warning}
복원하려는 백업의 '백업' 서비스 버전이 복원하기 전에 대상 환경과 일치해야 복원이 성공적으로 완료됩니다. 불일치 데이터베이스 스키마로 인한 오류를 방지하려면 Liferay [이전 DXP 버전 패치 적용](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.html) 도 일치해야 합니다. 현재 환경에 배포된 것과 다른 빌드가 필요한 백업을 복원하는 경우, 복원을 시작하기 전에 [적절한 빌드를 배포](../../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)하세요.
```

백업에서 환경을 복원하려면 다음 단계를 따르세요:

1. 프로젝트에서 선택한 환경으로 이동합니다.

1. 화면 왼쪽의 환경 메뉴에서 백업을 클릭합니다.

1. 프로젝트 환경을 복원하는 데 사용할 백업의 **작업** 버튼( ⋮ )을 클릭합니다.

1. **복원 대상...을 클릭합니다.**

   ![그림 1: 작업 버튼을 클릭한 다음 복원 대상...을 클릭합니다.](./restoring-data-from-a-backup/images/01.png)

1. **환경** 메뉴의 드롭다운을 클릭하고 복원하려는 환경을 선택합니다.

   ![그림 2: 복원하려는 환경을 선택합니다.](./restoring-data-from-a-backup/images/02.png)

   ```{note}
   관리자는 액세스 권한이 있는 환경만 복원할 수 있습니다.
   ```

1. 아래에 표시되는 **확인란**()을 모두 클릭합니다. 버튼을 활성화하여 복원을 시작하려면 이 확인란을 선택해야 합니다.

1. **환경으로 복원** 을 클릭하여 복원 프로세스를 시작합니다.

   ![그림 3: 모든 확인란을 클릭하여 복원을 확인합니다.](./restoring-data-from-a-backup/images/03.png)

복원 프로세스 중에 대상 환경의 서비스가 다시 시작됩니다.

백업 서비스의 **로그** 및 활동 페이지의 **일반** 섹션에서 복원 상태를 추적할 수 있습니다.

## 데이터 복원을 통한 사용자 지정 SQL 스크립트 적용

사용자 지정 SQL 스크립트를 사용하여 일반 데이터 복원을 통해 데이터베이스에 대한 추가 업데이트를 수행할 수도 있습니다. 이 접근 방식은 별도로 유지 관리되는 데이터베이스 백업에 스크립트를 적용할 수 있으므로 중요한 데이터를 살균하는 데 이상적입니다.

```{note}
이 기능을 사용하려면 백업 서비스 버전 3.0.7 이상이 필요합니다.
```

### SQL 스크립트 준비

SQL 스크립트에서 지원되는 형식은 다음과 같습니다:

* `.sql` 은 개별 스크립트에 사용됩니다.
* `.zip`, `.tgz`, 또는 `.gz` 는 압축 파일 내의 여러 스크립트에 사용됩니다.

스크립트는 실행 시 영숫자 순서로 실행된다는 점에 유의하세요. 또한 SQL 스크립트는 실행할 정확한 데이터베이스를 참조해야 합니다(예: `USE lportal;` 또는 `lportal.User_`).

SQL 스크립트를 적절한 환경별 `백업/컨피그/{ENV}/스크립트/` 폴더에 배치합니다.

### 데이터 복원 수행

SQL 스크립트를 준비했으면 다음 단계에 따라 데이터 복원과 함께 사용자 지정 SQL 스크립트를 적용합니다:

1. [백업 서비스](../../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 를 배포하여 사용자 지정 SQL 스크립트를 온라인에 포함시킵니다.

1. 위에 나열된 지침을 따르세요. [백업 페이지에서 환경 복원하기](#restoring-an-environment-from-the-backups-page)

데이터베이스가 복원되면 백업 서비스의 `scripts` 폴더에 있는 SQL 스크립트가 실행됩니다:

```bash
Jun 20 14:46:41.795 build-39 [backup-57488f8b8-rjq4f] Running Script: SanitizeOrg.sql
Jun 20 14:46:41.970 build-39 [backup-57488f8b8-rjq4f] Running Script: SanitizeUsers.sql
```

## 관련 주제

* [백업 서비스](./backup-service-overview.md)
* [백업 다운로드 및 업로드](./downloading-and-uploading-backups.md)
* [데이터베이스 서비스(MySQL)](../database-service/database-service.md)
