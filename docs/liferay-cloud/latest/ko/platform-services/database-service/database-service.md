# 데이터베이스 서비스(MySQL)

MySQL 데이터베이스 서비스는 애플리케이션의 설정, 운영 및 확장을 단순화하는 분산 관계형 데이터베이스입니다. 애플리케이션 환경 내부의 비공개 서비스입니다. 공용 인터넷이 아닌 다른 서비스와만 통신할 수 있습니다. Liferay Cloud의 데이터베이스에는 대소문자를 구분하는 테이블 및 열 이름이 있습니다.

![데이터베이스 서비스는 Liferay Cloud에서 사용할 수 있는 여러 서비스 중 하나입니다.](./database-service/images/01.png)

자세한 내용은 [데이터베이스 서비스 제한 사항](../../reference/platform-limitations.md#database-service) 섹션을 참조하십시오.

## 환경 변수

이러한 환경 변수를 설정하여 데이터베이스 서비스를 구성할 수 있습니다. `LCP_MASTER_USER_NAME`, `LCP_MASTER_USER_PASSWORD`및 `LCP_DBNAME`를 설정할 때 데이터베이스 서비스에 의존하는 다른 서비스(예: 백업 및 Liferay 서비스)에 대해 동일한 값을 사용해야 합니다.

첫 번째 배포 전에 이러한 변수를 설정해야 합니다. 빌드가 새 값으로 생성되면 후속 배포가 실패합니다. 개발 중에 서비스를 삭제하고 `LCP.json` 파일을 이러한 변수에 대한 새 값으로 업데이트할 수 있지만 프로덕션 환경에서는 불가능합니다.

| 이름                         | 기정값                        | 묘사          |
|:-------------------------- |:-------------------------- |:----------- |
| `LCP_DBNAME`               | `lportal`                  | 데이터베이스 이름.  |
| `LCP_MASTER_USER_NAME`     | `dxpcloud`                 | 마스터 사용자 이름. |
| `LCP_MASTER_USER_PASSWORD` | `LCP_PROJECT_MASTER_TOKEN` | 마스터 암호.     |

### 데이터베이스 유지 관리 기간 변수

Liferay Cloud 환경의 데이터베이스 서비스는 때때로 예정된 유지 관리를 위해 일반적으로 약 2분 동안 중단 시간이 필요합니다. 가동 중지 시간의 영향을 줄이기 위해 이 유지 관리가 수행되는 기본 창을 구성할 수 있습니다. 기본적으로 특정 시간 기본 설정은 정의되지 않습니다.

| 이름                        | 허용 가능한 값           | 묘사                                      |
|:------------------------- |:------------------ |:--------------------------------------- |
| `LCP_GCP_MW_DAY`          | `1` through `7`    | 선호하는 요일(월요일(1)부터 일요일(7)까지, UTC 시간 기준).  |
| `LCP_GCP_MW_HOUR`         | `0` through `23`   | 선호하는 시간(UTC 시간 기준).                     |
| `LCP_GCP_MW_UPDATE_TRACK` | `canary`, `stable` | `카나리아` 설정하여 다른 환경보다 최대 1주일 먼저 업데이트하십시오. |

### Google Cloud MySQL 플래그

MySQL 플래그를 환경 변수로 전달할 수 있습니다. 사용 가능한 플래그는 [Google Cloud 문서](https://cloud.google.com/sql/docs/mysql/flags) 에 나열되어 있습니다. Liferay Cloud에서 작동하려면 각 플래그 앞에 `LCP_GCP_DATABASE_FLAG_` 추가되어야 합니다. 다음은 개발 환경에서 디버깅에 유용할 수 있지만 상당한 성능 비용이 발생하므로 프로덕션 환경에서 사용하면 안 되는 일반적인 플래그입니다.

```{warning}
Google 문서에 명시된 바와 같이 일부 데이터베이스 플래그 설정은 인스턴스 가용성 또는 안정성에 영향을 미칠 수 있습니다. 이러한 플래그를 사용할 때는 매우 주의하고 Google의 [운영 지침](https://cloud.google.com/sql/docs/mysql/operational-guidelines) 을 따르세요.
```

| 이름                                     | 허용 가능한 값  | 기정값   |
|:-------------------------------------- |:--------- |:----- |
| `LCP_GCP_DATABASE_FLAG_GENERAL_LOG`    | `on, off` | `off` |
| `LCP_GCP_DATABASE_FLAG_SLOW_QUERY_LOG` | `on, off` | `off` |

## 관련 정보

* [데이터베이스 사용자 이름 변경](./changing-your-database-username.md)
* [데이터베이스 암호 변경](./changing-your-database-password.md)
* [데이터베이스 서비스 제한 사항](../../reference/platform-limitations.md#database-service)
* [MySQL 클라이언트 사용](../../customizing-liferay-dxp-in-the-cloud/using-the-mysql-client.md)
