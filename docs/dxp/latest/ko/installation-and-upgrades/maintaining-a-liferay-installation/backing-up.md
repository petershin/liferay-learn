# 백업

DXP 설치를 실행한 후에는 예상치 못한 이벤트를 고려한 포괄적인 백업 계획을 구현해야 합니다. 백업 복사본은 업데이트(예: DXP 업그레이드, 새 플러그인 등) 테스트에도 유용합니다.

Liferay DXP의 백업 계획을 고려할 때 다음 영역을 백업하는 것이 좋습니다.

* [Liferay 홈 디렉토리](#liferay-home)
* [애플리케이션 서버](#application-server)
* [데이터베이스](#database)
* [검색 색인](#search-indexes)
* [소스 코드](#source-code)

```{note}
Liferay Cloud는 문서 라이브러리 및 Liferay DXP 데이터베이스의 백업 생성 및 관리 프로세스를 자동화하고 단순화합니다. Liferay Cloud는 Git 기반 DevOps 파이프라인을 사용하기 때문에 Liferay의 모든 구성도 자동으로 백업됩니다. 자세한 내용은 [백업 서비스 개요](https://learn.liferay.com/w/liferay-cloud/platform-services/backup-service/backup-service-overview) 을 참조하세요.
```

## Liferay Home

Liferay Home 폴더에는 다음 파일이 포함되어 있으므로 백업하는 것이 중요합니다.

* **포털 속성 및 시스템 속성:** Liferay 홈 폴더는 DXP [포털 속성 파일](../reference/portal-properties.md) (예: `portal-ext.properties`, `portal-setup-wizard.properties` 등)을 저장합니다. 및 DXP [시스템 속성 파일](../reference/system-properties.md) (예: 'system-ext.properties').

* **`/data` 폴더:** DXP는 Liferay Home의 `/data` 폴더에 구성 파일, 검색 색인 및 캐시 정보를 저장합니다. '/data/document_library' 폴더는 [단순 파일 시스템 저장소](../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md) 의 기본 저장소 구성 사이트
입니다. [고급 파일 시스템 저장소](../../system-administration/file-storage.md) 에는 저장 사이트
를 명시적으로 설정해야 합니다.

* **`/license` 폴더(구독):** Liferay Enterprise 구독에 대한 활성화 키를 보유합니다.

* **`/osgi` 폴더:** DXP의 OSGi 런타임을 구성하는 파일은 Liferay Home의 `/osgi` 폴더에 저장됩니다. 여기에는 DXP에 배포된 모든 앱 및 모듈 JAR 파일이 포함되어 있습니다. `/osgi` 폴더에는 기타 [구성 파일](https://help.liferay.com/hc/ko/articles/360029131651-Understanding-System-Configuration-Files) 로그 파일도 포함되어 있습니다.

* **`/logs` 폴더:** DXP의 로그 파일이 포함되어 있습니다. DXP에서 문제가 발생하면 로그 파일은 무엇이 잘못되었는지 확인하기 위한 정보를 제공합니다.

```{note}
Liferay Docker 이미지를 사용하고 바인드 마운트를 통해 사용자 정의 Liferay 및 애플리케이션 서버 구성 파일을 사용하는 경우 해당 파일(예: `[host folder]/files` 폴더의 파일)을 백업하십시오.
```

Git, BitBucket, Subversion 또는 CVS와 같은 소스 제어 저장소를 사용하는 것은 Liferay Home 폴더를 백업하는 좋은 방법입니다.

```{important}
파일 저장소(문서 라이브러리)를 `[Liferay Home]/data` 하위 폴더가 아닌 다른 사이트
로 구성한 경우 해당 사이트
를 백업하십시오.
```

## 애플리케이션 서버

애플리케이션 서버에는 사용자 정의할 수 있는 DXP 설명자, 배포 및 종속성이 있습니다. 예를 들어, DXP의 `web.xml` 파일을 사용자 정의한 경우 DXP 패치의 `web.xml`이 항상 기존 파일을 덮어쓰기 때문에 이를 백업해야 합니다. 전체 애플리케이션 서버를 백업하는 것이 좋습니다.

## 데이타베이스

DXP의 데이터베이스는 포털의 모든 정보를 보관하는 중앙 저장소입니다. 백업에 있어서 가장 중요한 구성요소입니다. 데이터베이스를 실시간으로 백업하거나(데이터베이스에서 허용하는 경우) 데이터베이스를 파일로 내보낸 후(덤핑) 내보낸 파일을 백업할 수 있습니다.

예를 들어, [MySQL의 `mysqldump`](https://dev.mysql.com/doc/refman/5.7/en/using-mysqldump.html) 유틸리티는 전체 데이터베이스와 데이터를 큰 SQL 파일로 내보냅니다.

```bash
mysqldump --databases my-liferay-database > my-liferay-database-backup.sql
```

그러면 이 파일을 백업할 수 있습니다. 데이터베이스를 복원할 때 이 파일을 데이터베이스로 가져와서 데이터베이스를 내보냈을 때의 상태로 데이터베이스 상태를 다시 생성할 수 있습니다.

## 파일 저장소

[파일 저장소(문서 라이브러리)를 백업하십시오.](../../system-administration/file-storage.md). 새 버전의 DXP로 업그레이드하는 경우 기존 문서 라이브러리를 참조하거나 문서 라이브러리를 새 DXP 환경에 복사해야 합니다.

## 수색 색인

항상 [검색 색인을 백업하십시오](./../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md). 대부분의 Liferay 데이터는 전체 재색인을 통해 데이터베이스에서 복원할 수 있지만 검색 색인은 일부 응용 프로그램에서 [저장소로 사용됩니다](../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) . 인덱스 백업에 실패하면 해당 애플리케이션의 전체 데이터가 손실될 수 있습니다.

또한 대규모 데이터 세트를 보유한 사용자는 백업에서 복원할 때 모든 콘텐츠와 자산의 재인덱싱을 피할 수 있습니다. 검색 인덱스를 저장하는 별도의 [또는 Solr](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md) 환경이 있는 경우 검색 데이터를 백업하는 것이 가장 쉽습니다. 자세한 내용은 검색 엔진의 백업/복원 설명서를 따르세요(예: Elasticsearch의 [스냅샷 및 복원 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/snapshot-restore.html) 참조).

## 소스 코드

DXP를 확장했거나 플러그인을 작성한 경우 Git 또는 BitBucket과 같은 소스 코드 저장소에 저장해야 합니다. 진행 중인 작업을 보존하려면 정기적으로 소스 코드 저장소를 백업해야 합니다.

## 결론

예상치 못한 시스템 오류를 복구하든 정기적인 업그레이드를 수행하든 상관없이 Liferay의 데이터를 백업하고 복원하는 것은 설치를 다시 시작하는 데 필수적입니다. 여기에서 다루는 영역에 대해 훌륭하고 일관된 백업 절차를 수행하면 설치에 필요한 중요한 데이터를 복구할 수 있습니다.
