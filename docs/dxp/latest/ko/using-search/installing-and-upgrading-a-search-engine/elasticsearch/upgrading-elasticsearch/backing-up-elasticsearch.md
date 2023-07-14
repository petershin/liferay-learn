# Elasticsearch 백업

[Elasticsearch 복제본](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/index-modules.html#index-modules-settings) 노드가 다운되는 것을 방지하지만 심각한 오류가 발생하면 도움이 되지 않습니다. 그럴 때 좋은 백업 방법만이 도움이 될 수 있습니다.

## 업그레이드 전 인덱스 백업

Liferay의 데이터베이스에서 다시 인덱싱하여 인덱싱된 데이터를 복원할 수 있는 경우에도 모든 업그레이드 시나리오에서 인덱스를 백업하는 것이 가장 좋습니다. 데이터가 다음과 같은 경우 [앱별 색인의 스냅샷](#backing-up-and-restoring-indexes-used-for-primary-storage) (Liferay DXP 7.2 및 7.3의 Liferay 검색 조정 색인과 같음)을 찍는 것이 필수적입니다. 검색 색인에만 저장됩니다. 새 Elasticsearch 서버를 설정할 때 스냅샷을 사용하여 이전 데이터(예: 동의어 집합 및 결과 순위)를 복원할 수 있습니다. [스냅샷 및 복원 버전 호환성](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html#snapshot-restore-version-compatibility) 에 대한 Elasticsearch 설명서를 읽어보세요. 이 방법을 시도하기 전에.

다음은 몇 가지 대표적인 업그레이드 시나리오입니다.

* Liferay와 독립적으로 Elasticsearch 클러스터 업그레이드: 모든 인덱스를 백업하는 것이 좋습니다. 모든 인덱스가 시스템에 남아 있으므로 스냅샷에서 데이터를 복원할 필요가 없습니다.
* Liferay를 업그레이드하고 동일한 Elasticsearch 클러스터에 연결: 모든 인덱스를 백업하는 것이 좋습니다. 모든 인덱스가 시스템에 남아 있으므로 스냅샷에서 데이터를 복원할 필요가 없습니다.
* Liferay 업그레이드 및 다른 Elasticsearch 클러스터에 연결: 모든 인덱스를 백업하는 것이 좋습니다. 스냅샷에서 복원하는 것은 모든 기본 스토리지 인덱스에 필요합니다. Liferay의 검색 조정 기능(결과 순위 및 동의어 집합) 중 하나를 사용하는 경우 [인덱싱된 데이터를 Liferay 데이터베이스로 가져오기](upgrading-search-infrastructure.md#importing-the-search-tuning-indexes) 도 수행해야 합니다. -in-7-4) Liferay DXP 7.4로 업그레이드한 후.

## Elasticsearch 클러스터 백업 생성

```{tip}
[Kibana 7.x UI](https://www.elastic.co/guide/en/kibana/8.8/snapshot-repositories.html) 를 통해 스냅샷을 생성하고 관리하는 것이 편리합니다.
```

다음 세 단계로 Elasticsearch 클러스터를 백업하고 백업 복원을 테스트합니다. 

1. 저장소 만들기

1. Elasticsearch 클러스터의 스냅샷 생성

1. 스냅샷에서 복원

```{note}
자세한 내용은 Elastic의 [Elasticsearch 관리 가이드](https://www.elastic.co/guide/en/elasticsearch/guide/master/administration.html) , 특히 [스냅샷 및 복원 모듈](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html) 을 참조하십시오.
```

### 리포지토리 만들기

먼저 [스냅샷을 저장할 저장소](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html) 만듭니다. Elasticsearch는 다음을 포함한 여러 리포지토리 유형을 허용합니다.

* 네트워크 파일 시스템 또는 NAS와 같은 공유 파일 시스템
* 아마존 S3
* HDFS(하둡 분산 파일 시스템)
* Azure 클라우드
* 구글 클라우드 저장소

공유 파일 시스템에 스냅샷을 저장하려면 먼저 [`path.repo` 설정](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html#snapshots-filesystem-repository) 를 사용하여 각 노드의 `elasticsearch.yml` 에 공유 파일 시스템 경로를 등록합니다. 예를 들어,

```yaml
path.repo: ["path/to/shared/file/system/"]
```

리포지토리를 호스팅하는 폴더의 경로를 등록한 후(폴더가 있는지 확인) `PUT` 명령으로 리포지토리를 생성합니다. 예를 들어,

```bash
PUT /_snapshot/test_backup
{
  "type": "fs",
  "settings": {
    "location": "/path/to/shared/file/system/"
  }
}'
```

`test_backup` 생성할 리포지토리의 이름으로 바꾸고 `사이트` 설정 값을 공유 파일 시스템의 절대 경로로 바꿉니다.

리포지토리를 올바르게 만든 경우 명령은 다음 결과를 반환합니다.

```json
{"acknowledged":true}
```

이제 리포지토리가 존재하므로 스냅샷을 생성합니다.

### 클러스터의 스냅샷 생성

가장 쉬운 스냅샷 방식은 [클러스터에 있는 모든 인덱스의 스냅샷](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-take-snapshot.html) 을 만드는 것입니다. 예를 들어,

```bash
PUT /_snapshot/test_backup/snapshot_1
```

성공적인 스냅샷 명령은 다음 결과를 반환합니다.

```json
{"accepted":true}
```

스냅샷을 특정 인덱스로 제한할 수도 있습니다. 예를 들어 Liferay Enterprise Search Monitoring이 있지만 스냅샷에서 모니터링 인덱스를 제외하고 싶을 수 있습니다. 스냅샷에 포함할 인덱스를 명시적으로 선언할 수 있습니다. 예를 들어,

```bash
PUT /_snapshot/test_backup/snapshot_2
{ "indices": "liferay-0,liferay-20116" }
```

모든 인덱스와 지표를 나열하려면 다음 명령을 실행합니다.

```bash
GET /_cat/indices?v
```

색인 측정항목 예시,

```bash
health status index                                              uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   liferay-20101-search-tuning-rankings               ykbNqPjkRkq7aCYnc7G20w   1   0          7            0      7.7kb          7.7kb
green  open   liferay-20101-workflow-metrics-tokens              DF-1vq8IRDmFAqUy4MHHPQ   1   0          4            0       26kb           26kb
green  open   liferay-20101                                      QKXQZeV5RHKfCsZ-TYU-iA   1   0     253015          392     43.1mb         43.1mb
green  open   liferay-20101-workflow-metrics-sla-task-results    SrWzmeLuSKGaIvKrv4WmuA   1   0          4           72     30.6kb         30.6kb
green  open   liferay-20101-workflow-metrics-processes           Ras8CH0PSDGgWSyO3zEBhg   1   0          1            0     49.3kb         49.3kb
green  open   liferay-20101-workflow-metrics-nodes               bcdKKgDySeWf4BJnmMzk6A   1   0          4            0     10.5kb         10.5kb
green  open   liferay-20101-workflow-metrics-sla-process-results VJrNOpJWRoeTaJ-sBGs_vA   1   0          3           91     47.4kb         47.4kb
green  open   liferay-20101-workflow-metrics-instances           OgJMyD5ZQIi2h0xUTSjezg   1   0          3            0     62.4kb         62.4kb
green  open   liferay-0                                          jPIEOfZhSCKZSWnY0L65RQ   1   0     253114          491     50.1mb         50.1mb
green  open   liferay-20101-search-tuning-synonyms               pAUN8st1RmaV1NxXtj-Sig   1   0          1            0      4.1kb          4.1kb
```

```{note}
Elasticsearch는 *스마트 스냅샷* 접근 방식을 사용합니다. 이것이 의미하는 바를 이해하려면 단일 인덱스를 고려하십시오. 첫 번째 스냅샷에는 전체 인덱스의 복사본이 포함되는 반면 후속 스냅샷에는 첫 번째 전체 인덱스 스냅샷과 인덱스의 현재 상태 사이의 델타만 포함됩니다.
```

결국 리포지토리에 많은 스냅샷이 남게 될 것이며 스냅샷의 이름을 아무리 영리하게 지정하더라도 일부 스냅샷에 포함된 내용을 잊어버릴 수 있습니다. Elasticsearch API를 사용하여 설명을 얻을 수 있습니다. 예를 들어,

```bash
GET /_snapshot/test_backup/snapshot_1
```

보고

```json
{"snapshots":[
    {"snapshot":"snapshot_1",
    "uuid":"WlSjvJwHRh-xlAny7zeW3w",
    "version_id":6.80399,
    "version":"6.8.2",
    "indices":["liferay-20099","liferay-0","liferay-47206"],
    "state":"SUCCESS",
    "start_time":"2018-08-15T21:40:17.261Z",
    "start_time_in_millis":1534369217261,
    "end_time":"2018-08-15T21:40:17.482Z",
    "end_time_in_millis":1534369217482,
    "duration_in_millis":221,
    "failures":[],
    "shards":{
        "total":3,
        "failed":0,
        "successful":3

        }
    }
]}
```

스냅샷 정보에는 인덱스의 시간 범위가 포함됩니다.

스냅샷을 삭제하려면 `DELETE` 명령을 사용하십시오.

```bash
DELETE /_snapshot/test_backup/snapshot_1
```

스냅샷에 모든 인덱스를 포함하면 많은 시간과 스토리지를 소비할 수 있습니다. 실수로 스냅샷 생성을 시작한 경우(예: 특정 인덱스를 필터링하려고 했지만 모든 인덱스를 포함함) `DELETE` 명령을 사용하여 스냅샷 처리를 취소할 수 있습니다. 이름으로 스냅샷을 삭제하면 스냅샷 프로세스가 종료되고 부분 스냅샷이 리포지토리에서 제거됩니다.

## 스냅샷에서 복원 테스트

치명적인 오류가 발생하면 검색 인덱스를 복원할 [](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-restore-snapshot.html) 스냅샷이 무슨 소용이 있겠습니까? `_restore` API를 사용하여 모든 스냅샷 인덱스를 복원합니다.

```bash
POST /_snapshot/test_backup/snapshot_1/_restore
```

스냅샷 인덱스의 데이터를 기존 인덱스로 복원해야 하는 경우 다른 이름으로 인덱스를 복원한 다음 데이터를 기존 인덱스로 다시 인덱싱합니다. 복원 명령을 특정 색인으로 제한하려면 `색인` 옵션을 사용하십시오. `rename_pattern` 및 `rename_replacement` 옵션을 사용하여 복원된 인덱스의 이름을 바꿉니다.

```bash
POST /_snapshot/test_backup/snapshot_1/_restore
{
    "indices": "liferay-20116",
    "rename_pattern": "(.+)",
    "rename_replacement": "restored-$1"
}
```

그러면 스냅샷에서 이름이 `liferay-20116` 인 인덱스만 복원되고 이름이 `registered_liferay-20116`으로 바뀝니다. 클러스터에 복원되면 백업된 데이터를 기존 `liferay-20116` 인덱스로 복원하는 `_reindex` API 호출을 수행하는 데 사용할 수 있습니다.

```bash
POST _reindex/
{
    "dest": {
      "index": "liferay-20116"
    },
    "source": {
      "index": "restored_liferay-201116"
    }
}
```

스냅샷 프로세스 취소와 마찬가지로 `DELETE` 명령을 사용하여 잘못된 복원 프로세스를 취소할 수 있습니다.

```bash
DELETE /restored_liferay-20116index_3
```

아무도 프로덕션 시스템의 치명적인 오류를 좋아하지 않지만 Elasticsearch의 스냅샷 생성 및 인덱스 복원 API는 재해가 발생하는 경우 검색 클러스터를 복원할 수 있다는 사실을 알고 안심할 수 있도록 도와줍니다. 자세한 내용과 옵션은 Elastic의 [샷 및 복원 문서](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html) 을 참조하십시오.

## 기본 스토리지에 사용되는 인덱스 백업 및 복원

Elasticsearch 인덱스의 스냅샷을 생성하는 것이 좋습니다. 특히 기본 스토리지 형식으로 작동하는 인덱스의 경우(예: Liferay DXP 7.2 및 7.3에서 [동의어 세트](../../../search-administration-and-tuning/synonym-sets.md) 및 [결과 순위](../../../search-administration-and-tuning/result-rankings.md)). 데이터베이스에 이러한 애플리케이션에 대한 레코드가 없습니다.

Elasticsearch의 [스냅샷 및 복원](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshot-restore.html) 기능을 사용하여 검색 튜닝 인덱스를 백업 및 복원할 수 있습니다.

1. 시스템 어딘가에 `elasticsearch_local_backup` 이라는 폴더를 만듭니다. Elasticsearch에 폴더에 대한 읽기 및 쓰기 권한이 있는지 확인하십시오(예: `/path/to/elasticsearch_local_backup`).

1. 추가 

    ```yaml
    path.repo: [ "/path/to/elasticsearch_local_backup" ]
    ```

Elasticsearch 클러스터의 [모든 마스터 및 데이터 노드](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html#snapshots-filesystem-repository) 에 대해 `elasticsearch.yml` 로. Elasticsearch를 업그레이드하는 경우 스냅샷 리포지토리의 경로가 사전 업그레이드 및 사후 업그레이드 Elasticsearch 구성에서 동일한지 확인하십시오.

1. 모든 Elasticsearch 노드를 다시 시작합니다.

1. [스냅샷 리포지토리를 등록합니다](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-register-repository.html) . 다음 `스냅샷` API 요청을 실행할 수 있습니다(예: Kibana의 Dev Tools 콘솔을 통해). 

    ```json
    PUT /_snapshot/elasticsearch_local_backup
    {
      "type": "fs",
      "settings": {
        "location": "/path/to/elasticsearch_local_backup"
      }
    }

    ```

새 Elasticsearch 버전으로 업그레이드하는 경우 업그레이드 후 Elasticsearch에서 이와 동일한 명령을 사용하여 스냅샷 리포지토리를 등록할 수 있습니다.

1. [스냅샷 생성](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-take-snapshot.html) : 

    ```json
    PUT /_snapshot/elasticsearch_local_backup/snapshot1?wait_for_completion=true
    {
      "indices": "liferay-20101-search-tuning*",
      "ignore_unavailable": true,
      "include_global_state": false
    }
    ```

    모든 Liferay 인덱스에 대한 스냅샷을 생성하려면 `"indices": "liferay*,workflow-metrics*"` 대신 사용할 수 있습니다. 업그레이드 시나리오에 있는 경우 Liferay DXP 7.2 및 7.3의 Synonym Sets 및 Result Rankings 인덱스와 같이 데이터베이스에서 다시 생성할 수 없는 인덱스의 스냅샷만 찍는 것이 좋습니다.

1. 다른 이름을 사용하여 스냅샷의 특정 인덱스를 [복원](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/snapshots-restore-snapshot.html) 하려면 `restore`를 실행합니다. 다음과 유사한 API 호출:

    ```json
    POST /_snapshot/elasticsearch_local_backup/snapshot1/_restore
    {
      "indices": "liferay-20101-search-tuning-synonyms,liferay-20101-search-tuning-rankings",
      "ignore_unavailable": true,
      "include_global_state": false,
      "rename_pattern": "(.+)",
      "rename_replacement": "restored_$1",
      "include_aliases": false
    }
    ```
   여기서 `indices`는 복원할 스냅샷 인덱스 이름을 설정합니다. 위 호출의 인덱스는 'rename **pattern' 및 'rename** replacement' 정규식에 따라 'restored **liferay-20101-search-tuning-rankings' 및 'restored** liferay-20101-search-tuning-synonyms'로 복원됩니다.

Sidecar/Embedded 모드에서 실행하는 동안 검색 조정 구성(예: 동의어 집합 또는 결과 순위)을 추가한 경우 Elasticsearch에 대한 프로덕션 모드 연결을 구성하고 전체 재인덱싱을 수행하면 해당 구성이 사라집니다.

기존 검색 조정 색인 문서를 복원하려면 다음과 같이 Elasticsearch의 [Reindex API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-reindex.html#docs-reindex) 을 사용할 수 있습니다.

```json
POST _reindex/
{
 "dest": {
   "index": "liferay-20101-search-tuning-synonyms"
 },
 "source": {
   "index": "restored_liferay-20101-search-tuning-synonyms"
 }
}
```

`liferay-20101-search-tuning-rankings` 인덱스에 대해 동일한 명령을 실행합니다. 업그레이드 후 Elasticsearch 설치에서 두 요청을 모두 실행하면 이제 사전 업그레이드 시스템의 동의어 세트 및 결과 순위 데이터가 복원됩니다.

### 튜닝 인덱스 이름 검색

즉시 사용 가능한 검색 조정 색인 이름은 Liferay 버전 및 패치 수준에 따라 다릅니다.

| Liferay 버전 및 패치               | 튜닝 인덱스 검색                                                                                                        |
|:----------------------------- |:---------------------------------------------------------------------------------------------------------------- |
| Liferay DXP 7.2 SP2/FP5 이하    | `liferay-search-tuning-rankings`<br />`liferay-search-tuning-synonyms-liferay-<companyId>`           |
| Liferay DXP 7.2 SP3/FP8 이상    | `liferay-<companyId>-search-tuning-rankings`<br />`liferay-<companyId>-search-tuning-synonyms` |
| 라이프레이 DXP 7.3 GA1+ 및 7.4 GA1+ | `liferay-<companyId>-search-tuning-rankings`<br />`liferay-<companyId>-search-tuning-synonyms` |

`<companyId>` (예: `20101`)는 데이터베이스의 지정된 `Company` 레코드에 속합니다. UI에서 **인스턴스 ID** 로 표시되며 [가상 인스턴스](../../../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)나타냅니다.

## 다음

Elasticsearch를 [으로 업그레이드하고 있다면](./upgrading-to-elasticsearch-7.md)지금 할 수 있습니다. 

## 관련 항목

[검색 관리 및 조정](../../../search-administration-and-tuning.md)
