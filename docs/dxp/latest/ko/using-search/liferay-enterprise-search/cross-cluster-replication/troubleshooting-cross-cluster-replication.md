# 클러스터 간 복제 문제 해결

여기에서는 CCR 설정 중에 발생하는 알려진 일반적인 문제와 일반적인 문제 해결 기술을 다룹니다. 추가 문제 해결을 위해 [Elastic의 CCR 문서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-overview.html) 를 보거나 [Elastic 포럼](https://discuss.elastic.co/tag/ccr-cross-cluster-replication) 을 방문하십시오.

## 인덱스 복제 문제 조사

팔로워 Elasticsearch 클러스터에 대한 성공적인 읽기 작업은 리더 인덱스의 복제에 따라 달라집니다.

복제 문제 진단을 지원하려면 `com.liferay.portal.search.elasticsearch7.internal.ccr.CrossClusterReplicationHelperImpl`에 대한 INFO 로그 수준을 추가합니다. 로그 수준은 제어판 &rarr; 서버 관리 &rarr; 로그 수준에 추가됩니다.

## 연결 요청/응답 검사

클러스터 간 복제를 활성화하려면 Elasticsearch 클러스터에 대한 다중 연결을 설정해야 합니다.

연결 문제 진단을 돕기 위해 `com.liferay.portal.search.elasticsearch7.internal.connection.ElasticsearchConnectionManager`에 대한 INFO 로그 수준을 추가합니다. 로그 수준은 제어판 &rarr; 서버 관리 &rarr; 로그 수준에 추가됩니다.

## 재색인 중 예외: `RetentionLeaseNotFoundException` 및 `IndexNotFoundException`

Leader DXP 노드에서 재색인이 트리거되면 Follower Elasticsearch 노드에서 다음과 같은 오류가 발생할 수 있습니다.

```
[2021-01-10T14:49:21,478][WARN ][o.e.x.c.a.ShardFollowNodeTask] [es-follower-node-1] 샤드 팔로우 태스크 재시도 불가 오류 발생
org.elasticsearch.transport.RemoteTransportException: [es-leader-node-1][127.0.0.1:9300][indices:data/read/xpack/ ccr/shard_changes]
원인: org.elasticsearch.index.IndexNotFoundException: no such index
  at org.elasticsearch.cluster.routing.RoutingTable.shardRoutingTable(RoutingTable.java:119) ~[elasticsearch-6.8.6.jar:6.8 .6]
```

이:

```
[2021-01-10T14:49:50,750][WARN [liferay-20101][o.e.x.c.a.ShardFollowTasksExecutor] [es-follower-node-1] 를 팔로우하는 동안 보존 임대[LiferayElasticsearchCluster_FOLLOWER/liferay-20101/
-following-leader/liferay-20101/[0] ]의 백그라운드 관리가 실패했습니다. index.seqno.RetentionLeaseNotFoundException: ID가 [LiferayElasticsearchCluster_FOLLOWER/liferay-20101/3a22HGCGS9iDl5rCbutNHg-following-leader/liferay-20101/lZThZJuhTLSaNYTSxmeX8A]인 보존 임대는 org.elasticsearch.index.seqno.ReplicationTracker.renewRetentionLease에서
  를 찾을 수 없습니다. ) ~[elasticsearch-6.8.6.jar:6.8.6]
```

[에서 https://www.elastic.co/blog/follow-the-leader-an-introduction-to-cross-cluster-replication-in-elasticsearch](https://www.elastic.co/blog/follow-the-leader-an-introduction-to-cross-cluster-replication-in-elasticsearch) :

> 샤드 기록 보존 임대를 통해 팔로워는 현재 해당 팔로워가 있는 리더의 작업 기록에 표시할 수 있습니다. 리더 샤드는 해당 마커 아래의 작업이 안전하게 병합된다는 것을 알고 있지만 해당 마커 위의 모든 작업은 추종자가 복제할 기회를 가질 때까지 유지되어야 합니다. 이러한 마커는 추종자가 일시적으로 오프라인 상태가 되더라도 리더가 아직 복제되지 않은 작업을 유지하도록 합니다. 이 기록을 유지하려면 리더에 추가 저장 공간이 필요하므로 이러한 마커는 제한된 기간 동안만 유효하며 그 이후에는 마커가 만료되고 리더 조각이 자유롭게 기록을 병합할 수 있습니다. 팔로워가 오프라인 상태가 되는 경우에 유지하려는 추가 스토리지의 양과 팔로워가 오프라인 상태인 것을 수락할 의사가 있는 기간에 따라 이 기간의 길이를 조정할 수 있습니다. 리더.

## `ElasticsearchSecurityException` CCR 설정 시

CCR을 구성할 때 다음 오류가 발생할 수 있습니다.

```bash
ElasticsearchSecurityException security_exception 현재 라이센스는 [ccr]에 대해 비준수입니다.
```

[CCR에는 Platinum Elasticsearch 라이선스](https://www.elastic.co/subscriptions#scalability-&-resiliency) 개가 필요합니다. LES 가입자는 Liferay에서 제공한 라이선스로 CCR에 액세스할 수 있습니다. 로컬에서 테스트하는 경우 각 클러스터에서 [회 시도](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/start-trial.html) 회를 시작할 수 있습니다.

## 로컬 DXP 노드가 팔로워 Elasticsearch 클러스터에서 읽지 않음

클러스터 간 복제를 사용하는 DXP 클러스터에서 각 로컬 DXP 노드는 로컬 팔로워 Elasticsearch 클러스터에서 읽도록 매핑되어야 합니다. 예를 들어 로컬 DXP 노드가 2개이고 팔로워 연결의 `connectionId` 이 `ccr`인 경우 이를 팔로워 Elasticsearch 클러스터와 일치시키려면 로컬 클러스터 구성 속성을 다음과 같은 값으로 구성해야 합니다.

```properties
로컬 호스트:9080,ccr
로컬 호스트:9180,ccr
```

DXP 노드를 `localhost`에 바인딩하지 않더라도 내부 클러스터링 코드는 이를 사용하는 각 노드를 계속 식별하므로 `localhost` 이 이 속성의 호스트 이름이어야 합니다. `localhost` 이외의 호스트 이름을 사용하여 DXP 노드를 내부적으로 식별하려면(CCR 구성 포함) 각 DXP 노드에서 다음 [포털 속성](./../../../installation-and-upgrades/reference/portal-properties.md) 을 설정해야 합니다.

```properties
portal.instance.protocol=http
portal.instance.inet.socket.address=myhostname:9080
```

이러한 속성을 사용하면 위의 로컬 클러스터 구성 속성은 다음과 같습니다.

```properties
myhostname:9080,ccr
myhostname:9180,ccr
```

## 빨간색 상태의 팔로워 Elasticsearch 클러스터

CCR 연결을 성공적으로 설정하고 로컬 DXP 노드에서 CCR을 활성화한 후 팔로워 클러스터가 [빨간색 클러스터 상태](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-health.html) 이 될 수 있습니다. 이로 인해 팔로워 Elasticsearch 노드의 콘솔에서 다음과 같은 오류가 발생할 수 있습니다.

```
[2021-01-08T15:49:25,405][INFO ][o.e.x.c.a.ShardFollowTasksExecutor] [es-follower-node1] [liferay-0][0] 리더 샤드 추적 시작 [liferay-0][0]
[2021-01-08T15:49:25,440][INFO ][o.e.x.c.a.ShardFollowNodeTask] [es-follower-node1] [liferay-0][0] 다음 리더 샤드 [liferay-0][0], 팔로어 글로벌 체크포인트=[-1], 매핑 버전=[3], 설정 버전=[2], 별칭 버전=[1]
[2021-01-08T15:49:25,575][WARN ][o.e.i.c.IndicesClusterStateService] [es-follower-node1] [liferay-20097][0] [복구 실패]로 인해 샤드 표시 및 전송 실패
org.elasticsearch.indices.recovery.RecoveryFailedException: [liferay-20097][0]: {es-follower-node1}{SRkirdciSGaPph5XFrWUJA}{wgPq7Q4mRPG83hQEYALRMA}{127.0.0.1}{127.0.0.1:9301}{dilmrt}{ml.machine_memory=33552576512, xpack.installed=true, transform.node=true, ml.max_open_jobs=20}
    에서 복구 실패 org.elasticsearch.index.shard.IndexShard.lambda$executeRecovery$21(IndexShard.java:2665) [elasticsearch-7.9.3.jar:7.9.3]
(...)
원인: org.elasticsearch.index.shard.IndexShardRecoveryException: 복구 실패
    ... 27 more
원인: org.elasticsearch.index.snapshots.IndexShardRestoreFailedException: 복원 실패
    ... 25 more
원인: org.elasticsearch .index.snapshots.IndexShardRestoreFailedException: 스냅샷 복원 실패 [_latest_/_latest_]
    ... 23 more
(...)
[2021-01-08T15:49:25,592][INFO ][o.e.c.r.a.AllocationService] [es-follower-node1] 클러스터 상태가 [YELLOW] 에서 [RED] 으로 변경되었습니다(이유: [샤드 실패 [[liferay-20097][0]]]).
```

설정 절차 전체에서 반복적으로 구성, 다시 시작 및 재인덱싱을 수행한 경우 이 문제가 발생할 수 있습니다. 이런 일이 발생하고 연결이 제대로 구성되었다고 확신하는 경우 팔로어 인덱스를 삭제한 다음 Liferay의 시스템 설정에서 CCR을 다시 활성화하여 CCR 기능을 다시 활성화하십시오.

1. 모든 팔로어 인덱스를 삭제합니다. 이는 Kibana의 인덱스 관리 UI에서 가장 편리하게 수행됩니다.

1. Leader DXP 노드에서 전체 재색인을 수행합니다.

1. CCR 구성을 다시 활성화하려면 로컬 DXP 노드에서 시스템 설정 &rarr; 검색 &rarr; 클러스터 간 복제로 이동합니다. _로컬 클러스터_ 에서 읽기를 선택 취소하고 _업데이트_ 을 클릭하여 모듈을 비활성화한 다음 _로컬 클러스터_ 에서 읽기를 선택하고 _업데이트_ 을 다시 클릭하여 다시 활성화합니다.

## Liferay 7.2: CCR LPKG 및 ElasticsearchConnectionConfiguration 파일을 배포한 후 검색이 중단됨

`ElasticsearchConnectionConfiguration-ccr.config` 파일과 동시에 CCR LPKG 파일을 배포한 후 로그에 아래와 같은 오류가 표시되고 검색 엔진 연결이 끊긴 경우 알려진 버그 [LPS-127821](https://issues.liferay.com/browse/LPS-127821) 이 발생한 것입니다. 이 버그를 해결하고 검색 엔진 연결을 수정하려면 Liferay를 다시 시작하거나 다른 파일 하위 이름(예: `-ccr2.config`, `connectionId` 설정도 업데이트)을 사용하여 구성을 복제할 수 있습니다.

```bash
2021-02-11 22:08:45.402 오류 [main][CCRElasticsearchConnection:93] 번들 com.liferay.portal.search.elasticsearch7.impl:4.0.10 (207)[com.liferay.portal.search.elasticsearch7.internal.connection
        
    386) 
: 활성화 메서드가 예외를 발생시켰습니다.
```
