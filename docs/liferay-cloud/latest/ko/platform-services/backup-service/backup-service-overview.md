# 백업 서비스 개요

프로젝트 데이터를 보호하려면 정기적인 백업을 유지하는 것이 중요합니다. Liferay Cloud 백업 서비스는 필요한 경우 환경을 복원하는 데 사용할 수 있는 환경 데이터의 반복을 저장합니다. 이러한 백업에는 Liferay DXP 데이터베이스와 '[LIFERAY_HOME]/data' 폴더의 전체 내용이 모두 포함됩니다.

![The backup service is one of several services available in Liferay Cloud.](./backup-service-overview/images/01.png)

모든 환경의 백업 페이지에서 백업을 생성하고, 보관된 백업을 보거나 다운로드하고, 백업에서 환경을 복원할 수 있습니다.

Liferay Cloud 콘솔이나 백업 서비스의 `LCP.json` 파일을 통해 프로젝트 요구 사항에 맞게 백업 서비스를 구성할 수도 있습니다.

자세한 내용은 [백업 서비스 제한 사항](../../reference/platform-limitations.md#backup-service) 섹션을 참조하세요.

## 백업 페이지

모든 환경의 백업 페이지에서 백업 서비스 정보 및 보관된 백업을 보고, 수동 백업을 생성하는 등의 작업을 수행할 수 있습니다.

```{note}
백업 페이지는 4.3.5 이전 백업 서비스 버전의 프로덕션 환경에서만 사용할 수 있습니다.
```

백업 페이지에 액세스하려면 다음 단계를 따르세요.

1. 어떤 환경에서든 왼쪽 메뉴에서 **백업** 을 클릭하세요.

![View backup history, create manual backups, and more from the Backups page in any environment.](./backup-service-overview/images/02.png)

여기에서 다음 작업을 수행할 수 있습니다.

* **백업 정보 보기** : 선택한 환경에 대한 백업 서비스 정보를 빠르게 확인할 수 있습니다. 여기에는 자동 백업 빈도, 백업 보존 기간, 다음 예약 백업에 대한 타임스탬프 정보, 가장 최근에 생성된 백업, 가장 오래 유지된 백업이 포함됩니다.
* **백업 기록 보기** : 선택한 환경에 보관된 백업의 전체 목록을 볼 수 있습니다. 각 항목에는 백업의 이름, 크기, 유형('자동', '수동' 또는 '업로드됨') 및 생성 시간이 표시됩니다. 빨간색 백업 아이콘은 백업이 실패했음을 나타냅니다. 그 옆에는 **백업 실패** 메시지와 지원 문의 링크가 있습니다.
* **수동 백업 생성** : 선택한 환경의 백업을 수동으로 생성할 수 있습니다. 자세한 내용은 [수동 백업 생성](#creating-a-manual-backup) 을 참조하세요.

```{note}
백업 타임스탬프는 브라우저 사이트에 따라 자동으로 표시되는 반면, 백업 일정은 UTC±00 시간대를 기준으로 합니다.
```

백업 페이지에서 환경 관리자는 작업 버튼(⋮)에 액세스하여 보관된 백업을 다운로드하거나 환경을 복원할 수도 있습니다.

![Administrators can download backups or restore an environment from the Backups page.](./backup-service-overview/images/03.png)

또한 상태(실패 또는 성공)를 기준으로 백업 목록을 필터링하거나 상단 근처의 두 선택기에서 관련 재해 복구('dr') 환경(현재 환경에 대해 구성된 경우)의 백업을 표시할 수 있습니다. 화면의.

![View Disaster Recovery backups or filter by backup status from the drop-down menus.](./backup-service-overview/images/04.png)

이러한 작업을 수행하는 방법에 대한 자세한 내용과 지침은 [백업 다운로드 및 업로드](./downloading-and-uploading-backups.md) 및 [백업에서 데이터 복원](./restoring-data-from-a) 을 참조하세요. -backup.md).

## 수동 백업 생성

백업 페이지에서 환경을 수동으로 백업하려면 **지금 백업** 을 클릭하세요. 이 프로세스는 서비스 규모에 따라 몇 분 또는 몇 시간이 걸릴 수 있습니다.

일단 시작되면 백업 서비스 아이콘은 백업이 진행 중임을 나타내며 화면 상단에 메시지가 나타납니다. 새 백업은 백업 기록에도 나타납니다.

![The backup service icon and a message at the top of the screen indicate a backup is in progress.](./backup-service-overview/images/05.png)

```{warning}
Liferay 인스턴스에서 데이터가 활발하게 변경되는 동안 생성된 백업은 일관되지 않은 데이터를 생성할 위험이 있습니다. 완전히 일관된 백업을 보장하려면 데이터베이스 관리자와 협력하여 수동 백업을 수행하는 동안 업데이트를 중지하세요.
```

**로그 보기** 를 클릭하면 실시간으로 백업 단계를 볼 수 있는 로그 페이지로 리디렉션됩니다. 백업 서비스 페이지의 **로그** 탭에서 백업 로그를 볼 수도 있습니다.

서비스 로그 보기에 대한 자세한 내용은 [로그 관리](../../support-and-troubleshooting/reading-liferay-cloud-service-logs.md)를 참조하세요.

## 백업 서비스 구성

Liferay Cloud 콘솔 또는 백업 서비스의 `LCP.json` 파일을 통해 프로젝트 요구 사항에 맞게 백업 서비스를 구성할 수 있습니다.

백업 서비스를 구성하는 데 사용할 수 있는 변수 목록은 [환경 변수 참조](#environment-variables-reference) 를 참조하세요.

```{important}
백업 서비스가 재구성될 때마다 백업 서비스가 다시 시작되고 몇 분 동안 요청 수신이 중지되거나 구성에 따라 다르게 동작할 수 있습니다.
```

### Liferay Cloud 콘솔을 통해 백업 서비스 구성

Liferay Cloud Console을 통해 백업 서비스를 구성하려면 다음 단계를 따르십시오.

1. 백업 서비스가 배포된 환경으로 이동합니다.

1. 환경 메뉴에서 **서비스** 를 클릭합니다.

1. **백업** 서비스를 클릭하세요.

1. **환경 변수** 탭을 클릭하세요.

   ![Navigate to the backup service's variables tab in your environment.](./backup-service-overview/images/06.png)

   환경의 **개요** 페이지에서 **백업** 을 클릭하여 백업 서비스 페이지에 액세스할 수도 있습니다.
1. [환경 변수 참조](#environment-variables-reference) 목록에서 변수를 추가하여 백업 서비스를 구성합니다.

1. **변경사항 저장** 을 클릭하세요.

일반 환경 변수 외에도 Liferay Cloud 콘솔을 통해 **비밀** 변수를 설정할 수도 있습니다. 자세한 내용은 [비밀번호로 보안 환경 변수 관리](../../infrastructure-and-options/tuning-security-settings/managing-secure-environment-variables-with-secrets.md)를 참조하세요.

### 백업 `LCP.json` 파일을 통해 백업 서비스 구성

`LCP.json` 파일을 통해 백업 서비스를 구성하려면 다음 단계를 따르세요.

1. 텍스트 편집기를 사용하여 `/{your_project_name}/backup/LCP.json` 경로에 있는 백업 `LCP.json` 파일을 엽니다.

1. 환경 섹션까지 아래로 스크롤합니다.

   ```
    "env": {
      "LCP_BACKUP_FOLDER": "/opt/liferay/data",
      "LCP_DATABASE_SERVICE": "mydatabase",
      "LCP_MASTER_USER_PASSWORD": "mypassword"
    },
   ```

1. [환경 변수 참조](#environment-variables-reference) 목록에서 변수를 추가하여 백업 서비스를 구성합니다.

1. 파일을 저장하고 프로젝트에 배포하여 구성을 구현합니다.

`LCP.json` 파일을 통해 환경 서비스를 구성하는 방법에 대한 자세한 내용은 [LCP.json을 통한 구성](../../reference/configuration-via-lcp-json.md)을 참조하세요.

## 자동 백업 및 정리 예약

백업이 생성되고 제거되는 빈도를 결정하면 데이터를 보호하고 스토리지를 최적화하는 데 도움이 될 수 있습니다. **프로덕션 환경에서만 백업 예약이 가능합니다.**

```{warning}
Liferay 인스턴스에서 데이터가 활발하게 변경되는 동안 백업을 생성하면 데이터 불일치가 발생할 위험이 있습니다. 데이터 불일치의 위험을 완화하기 위해 활동이 적은 시간에 시작되도록 백업 일정을 구성하십시오. 완전히 일관된 백업을 보장하려면 데이터베이스 관리자와 협력하여 [수동 백업](./backup-service-overview.md#creating-a-manual-backup) 을 수행하는 동안 업데이트를 중지하고 *에서 실행되도록 설정하세요. 정리 일정(`LCP_BACKUP_CLEANUP_SCHEDULE`)과 시간*이 다릅니다.
```

자동 백업 일정을 구성하는 방법에는 두 가지가 있습니다.

* [콘솔을 통해](#configuring-the-schedule-via-the-console)
* [환경 변수 사용](#configuring-the-schedule-using-environment-variables)

### 콘솔을 통해 일정 구성

1. 선택한 환경에서 백업 서비스로 이동하여 **구성** 탭을 클릭합니다.

   ![Click the Configuration tab to access the backup schedule configuration.](./backup-service-overview/images/07.png)

   ```{note}
   이 환경에 백업이 없는 경우 백업 서비스 페이지에서 *정기 백업 설정* 링크를 클릭해도 구성 탭으로 이동합니다.
   ```

1. **백업 생성** 드롭다운 메뉴의 사용 가능한 옵션에서 원하는 백업 빈도를 선택합니다. 다음과 같은 옵션이 있습니다.

   * **매일** : 백업이 매일 생성됩니다. 생성된 시간을 설정할 수 있습니다(UTC±00 시간대 기준).

   * **매주** : 매주 백업이 생성됩니다. 요일과 생성 시간(UTC±00 시간대 기준)을 설정할 수 있습니다.

   * **고급** : 더 복잡한 빈도에 대해 [cron 일정](https://crontab.guru/) 값을 설정할 수 있습니다.

   * **수동** 자동 백업이 생성되지 않습니다. 모든 백업을 수동으로 생성해야 합니다.

   ![If you choose to create a weekly schedule, you can then select the day of the week and time.](./backup-service-overview/images/08.png)

1. **다음보다 오래된 백업 제거** 선택기에서 원하는 보존 기간을 선택합니다.

1. **변경사항 저장** 을 클릭하세요.

백업 서비스가 다시 시작되고, 서비스가 완전히 다시 시작되면 변경 사항이 적용됩니다.

### 환경 변수를 사용하여 일정 구성

백업이 생성되고 제거되는 시기를 사용자 지정하려면 환경별로 다음 변수를 사용하세요.

* **자동 백업** : 자동 백업 빈도를 설정하려면 [cron 스케줄링](https://crontab.guru/) 값과 함께 `LCP_BACKUP_CREATE_SCHEDULE` 변수를 추가하세요.
* **자동 정리** : 자동 백업 정리 빈도를 설정하려면 [cron 일정](https://crontab.guru/) 값과 함께 `LCP_BACKUP_CLEANUP_SCHEDULE` 변수를 추가하세요.
* **보존 기간** : `LCP_BACKUP_RETENTION_PERIOD` 변수에 숫자 값(1~30)을 추가하여 자동 정리로 제거되기 전에 백업이 보관되는 일수를 설정합니다.

```{note}
표준 및 비표준 [cron 예약 구문](https://crontab.guru/) 은 모두 UTC±00 시간대를 기반으로 합니다. 비표준 cron 구문을 사용하는 경우 지정된 값이 시작될 때 자동 백업 및 정리가 실행됩니다. 예를 들어 `@daily`는 매일 UTC 00:00에 백업을 실행합니다.
```

이러한 환경 변수는 [Liferay Cloud 콘솔을 통해 설정](../../reference/defining-environment-variables.md#defining-environment-variables-via-the-liferay-cloud-console) 하여 사용할 수 있습니다( 백업 서비스에서) 또는 [프로젝트 저장소의 `backup/LCP.json` 파일에서 설정](../../reference/defining-environment-variables.md#defining-environment-variables-via-lcp-json) 및 Backup 서비스를 사용자 환경에 배포합니다.

```{warning}
Liferay Cloud 콘솔을 통해 환경 변수를 설정했지만 나중에 `backup/LCP.json`에서 다른 구성을 사용하여 저장소에서 백업 서비스를 배포하는 경우 저장소의 구성이 콘솔에 설정된 환경 변수를 덮어씁니다.
```

다음 `backup/LCP.json` 예는 12시간마다(즉, 00:00 및 12:00 UTC) 백업을 생성하고 30일이 지난 백업을 제거하는 월별 정리를 수행합니다.

```
 "env": {
   "LCP_BACKUP_FOLDER": "/opt/liferay/data",
   "LCP_DATABASE_SERVICE": "mydatabase",
   "LCP_MASTER_USER_PASSWORD": "mypassword",
   "LCP_BACKUP_CREATE_SCHEDULE": "0 0,12 * * *",
   "LCP_BACKUP_CLEANUP_SCHEDULE": "@monthly",
   "LCP_BACKUP_RETENTION_PERIOD": "30"
 },
```

## 환경 변수 참조

| 이름                                              | 기정값                        | 묘사                                                                                                                                                              |
| :---------------------------------------------- | :------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_BACKUP_CLEANUP_SCHEDULE`                   | 0 1 * * * | 이 변수는 [cron 예약 구문](https://crontab.guru/) 을 사용하여 자동 정리를 예약합니다. 정리는 백업 보존 기간을 초과하는 모든 백업을 제거합니다. `LCP_BACKUP_CREATE_SCHEDULE`과 충돌해서는 안 됩니다.                       |
| `LCP_BACKUP_CREATE_SCHEDULE`                    | `[5-55][0-1] * * *`        | 이 변수는 [cron 예약 구문](https://crontab.guru/) 을 사용하여 자동 백업을 예약합니다. `LCP_BACKUP_CLEANUP_SCHEDULE`과 충돌해서는 안 됩니다. 백업 서비스 '3.2.1' 버전 이상에서는 값을 지정하지 않으면 임의의 기본값이 생성됩니다.   |
| `LCP_BACKUP_RESTORE_SCHEDULE`                   | N/A                        | 이 변수는 [cron 예약 구문](https://crontab.guru/) 을 사용하여 자동 복원을 예약합니다. [재해 복구 환경](../../support-and-troubleshooting/configuring-cross-region-disaster-recovery.md)과 함께 사용하기 위한 것입니다. |
| `LCP_BACKUP_RESTORE_STRATEGY`                   | `OVERWRITE`                | 기본적으로 기존 인스턴스는 즉시 중단됩니다. 기존 인스턴스를 종료하기 전에 새로운 데이터베이스 인스턴스와 볼륨을 시작하려면 'PREPARE_AND_SWAP' 전략을 사용하세요.                                                            |
| `LCP_BACKUP_RETENTION_PERIOD`                   | `30`                       | 이 변수는 예약된 정리 중에 제거되는 백업을 결정합니다. 정리를 통해 제거되기 전에 백업이 보관되는 일수를 선택합니다. 최대 보존 기간은 30일입니다.                                                                            |
| `LCP_DATABASE_SERVICE`                          | `database`                 | 데이터베이스 서비스의 ID입니다.                                                                                                                                              |
| `LCP_DBNAME`                                    | `lportal`                  | 데이터베이스 이름입니다.                                                                                                                                                   |
| `LCP_DEBUG_LOG`                                 | `false`                    | 백업 서비스에 대한 디버그 로깅을 활성화합니다. 'true' 또는 'false'로 설정하세요.                                                                                                            |
| `LCP_GCP_STORAGE_UPLOAD_MAX_RETRIES`            | `6`                        | 백업 업로드가 실패한 경우 백업 업로드를 다시 시도하는 최대 횟수입니다. 이 제한 이후에는 업로드가 중단되고 완전히 다시 시작될 수 있습니다(최대 2회).                                                                          |
| `LCP_GCP_STORAGE_UPLOAD_MAX_RETRY_DELAY`        | `64`                       | `LCP_GCP_STORAGE_UPLOAD_MAX_RETRIES`에 의해 구성된 각 재시도 사이의 지연(초)입니다.                                                                                                |
| `LCP_GCP_STORAGE_UPLOAD_RETRY_DELAY_MULTIPLIER` | `3`                        | 이후 재시도할 때마다 `LCP_GCP_STORAGE_UPLOAD_MAX_RETRY_DELAY`로 설정된 지연 시간을 곱합니다.                                                                                          |
| `LCP_GCP_STORAGE_UPLOAD_TIMEOUT`                | `6000`                     | 백업 업로드 요청(또는 재시도) 간의 최대 지연 시간(초)입니다. 이는 `LCP_GCP_STORAGE_UPLOAD_RETRY_DELAY_MULTIPLIER`가 지연 시간을 늘릴 수 있는 양의 상한을 설정합니다.                                           |
| `LCP_MASTER_USER_NAME`                          | `dxpcloud`                 | 마스터 사용자 이름입니다.                                                                                                                                                  |
| `LCP_MASTER_USER_PASSWORD`                      | `LCP_PROJECT_MASTER_TOKEN` | 마스터 비밀번호입니다.                                                                                                                                                    |

## 관련 주제

* [백업 다운로드 및 업로드](./downloading-and-uploading-backups.md)
* [백업에서 데이터 복원](./restoring-data-from-a-backup.md)
* [LCP.json을 통한 구성](../../reference/configuration-via-lcp-json.md)
* [데이터베이스 서비스(MySQL)](../database-service/database-service.md)
