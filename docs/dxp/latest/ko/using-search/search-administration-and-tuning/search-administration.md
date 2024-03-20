# 검색 관리

**제어판** &rarr; **구성** &rarr; **검색** 에는 연결, 색인 작업 및 필드 매핑이라는 세 가지 관리 UI가 있습니다. 연결은 설치가 연결된 검색 엔진을 보여주고, 인덱스 작업은 재인덱싱을 위한 인터페이스이며, 필드 매핑은 Liferay에서 검색 인덱스로 매핑된 필드를 표시합니다.

![The Search Administration panel contains three management screens.](./search-administration/images/02.png)

## 연결

검색 엔진 연결에 대한 정보가 여기에 표시됩니다. 예를 들어,

* 검색 엔진 공급업체: Elasticsearch
* 클라이언트 버전: 7.16.3
* 활성 연결: 1
* 건강: 녹색
* 연결 ID: \_REMOTE_\
* 연결 유형: 읽기/쓰기
* 클러스터 이름: LiferayElasticsearchCluster
* 노드: 1
* 노드 이름: lr-es
* 노드 버전: 7.17.14

## 인덱스 작업

Index Actions에서는 Liferay의 데이터를 다시 인덱싱할 수 있습니다.

![Reindex using the Index Actions user interface.](./search-administration/images/05.png)

다음 수준 중 하나에서 다시 색인을 생성할 수 있습니다.

**전역:** 모든 색인 및 유형 또는 모든 맞춤법 검사 사전의 색인을 다시 생성합니다.
**개별 색인 생성 가능 유형:** 색인 생성 가능 유형을 개별적으로 다시 색인화합니다.

1. 글로벌 메뉴 열기 &rarr; 제어판 &rarr; 색인 작업 탭을 검색하고 클릭하세요.

1. [Liferay 2023.Q4+/GA 102+] 리인덱싱 모드를 선택하세요.

   ![Choose the reindexing mode.](./reindexing-modes/images/01.png)

   Liferay 7.4 2023.Q4 이상(업데이트/GA 102+)에서는 검색 중단 시간을 방지하기 위해 재색인 모드를 구성할 수 있습니다. 도입된 **Concurrent** 및 **Sync** 모드에 대해 알아보려면 [재인덱싱 모드](./reindexing-modes.md) 을 참조하세요.

1. [Liferay 7.4] 실행 범위 탭을 사용하여 다시 인덱싱할 인스턴스를 선택합니다.

   ![Select the instances to reindex.](./search-administration/images/03.png)

   Liferay 7.4부터 재색인 작업 범위를 특정 [가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)로 제한할 수 있습니다.

1. [Liferay 2023.Q4+/GA 102+] 대화상자에서 **실행** 을 클릭하여 재인덱싱을 확인하세요.

   ![Confirm that you'd like to reindex.](./search-administration/images/04.png)

```{note}
[워크플로 지표](../../process-automation/workflow/using-workflows/using-workflow-metrics.md) 은 애플리케이션의 전용 설정 메뉴를 통해 다시 색인화됩니다. 전역 메뉴의 애플리케이션 &rarr; 워크플로 섹션에서 _Metrics_를 클릭한 다음 설정 창(![옵션](../../images/icon-actions.png))을 엽니다. 자세한 내용은 [작업 흐름 지표 다시 인덱싱](../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics) 참조하세요.
```

### 모든 콘텐츠 다시 색인화

모든 콘텐츠를 다시 색인화하면 시스템 [과 회사 색인](./elasticsearch-indexes-reference.md) 의 모든 검색 엔진 문서가 데이터베이스에서 삭제되고 다시 생성됩니다. Elasticsearch의 로그는 `update_mapping` 메시지를 인쇄합니다.

```json
{"type": "server", "timestamp": "2023-01-10T14:33:04,513Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

Liferay 7.4 U45+/GA45+ 및 Liferay DXP 7.3 U14+에서 Liferay의 로그는 시스템 및 회사 색인에 대해 재색인이 시작되고 완료되는 시기를 보고합니다. 예를 들어,

```log
2023-01-09 20:44:17.730 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 20097
2023-01-09 20:45:00.986 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 20097
```

이전 업데이트 및 Liferay Portal 7.3의 경우 유사한 정보를 보려면 다음 [로깅 구성](../../system-administration/using-the-server-administration-panel/configuring-logging.md) 을 활성화하십시오.

| 로거 카테고리                                                                           | 수준  |
| :-------------------------------------------------------------------------------- | :-- |
| com.liferay.portal.search.internal.Background.task.ReindexStatusMessageSenderImpl | 디버그 |
| com.liferay.portal.search.internal.SearchEngineInitializer                        | 정보  |

### 개별 유형 다시 색인화

개별 유형(예: `com.liferay.account.model.AccountEntry`)을 다시 색인화하면 엔터티를 나타내는 색인 문서가 데이터베이스에서 삭제되고 다시 생성됩니다. Elasticsearch의 로그는 `update_mapping` 메시지를 인쇄합니다.

```json
{"type": "server", "timestamp": "2023-01-10T14:38:12,302Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

Liferay 7.4 U45+/GA45+ 및 Liferay DXP 7.3 U14+에서 Liferay의 로그는 재인덱싱이 시작되고 완료되는 시기를 보고합니다. 예를 들어,

```log
2023-01-10 14:14:00.840 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:122] Start reindexing company 20097 for class name com.liferay.account.model.AccountEntry
2023-01-10 14:14:00.907 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:145] Finished reindexing company 20097 for class name com.liferay.account.model.AccountEntry
```

### 맞춤법 검사 사전 색인 다시 생성

모든 콘텐츠를 다시 색인화할 때마다 맞춤법 검사 사전을 다시 색인화합니다. 맞춤법 검사 사전을 다시 색인화하면 각 언어에 대한 Liferay 사전 파일의 내용(예: `com/liferay/portal/search/dependentities/spellchecker/en_US.txt`)이 [시스템 및 회사에 대해 다시 색인화됩니다. 색인](./elasticsearch-indexes-reference.md) . Elasticsearch의 로그는 `update_mapping` 메시지를 인쇄합니다.

```json
{"type": "server", "timestamp": "2023-01-10T14:33:14,991Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-0/9ZIx-bT6TyiekzarKELQkA] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"  }
```

Liferay 7.4 U45+/GA45+ 및 Liferay DXP 7.3 U14+에서 Liferay의 로그는 재인덱싱이 시작되고 완료되는 시기를 보고합니다. 예를 들어,

```log
2023-01-10 14:16:34.170 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 0
2023-01-10 14:16:41.592 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 0
2023-01-10 14:16:41.593 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 0
2023-01-10 14:16:44.570 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 0
2023-01-10 14:16:44.571 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 20097
2023-01-10 14:16:49.547 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 20097
2023-01-10 14:16:49.548 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 20097
2023-01-10 14:16:52.235 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 20097
```

## 필드 맵핑

필드 매핑 탭에는 시스템에서 유효한 모든 필드 매핑이 인덱스별로 표시됩니다. 현재 매핑을 보고, 복사하고, 확대 또는 축소하고, 어두운 테마로 볼 수 있습니다.

![Inspect the field mappings for any index in the Elasticsearch cluster.](./search-administration/images/01.png)

## 관련 내용

* [검색 구성 참조](../search-configuration-reference.md)
* [포털 속성](../../installation-and-upgrades/reference/portal-properties.md)
* [Elasticsearch 커넥터 구성 참조](../installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
