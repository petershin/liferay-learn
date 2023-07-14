# Elasticsearch 8로 업그레이드

{bdg-secondary}`7.4 U81+`

Elasticsearch 8은 즉시 사용 가능한 최신 Liferay 7.4 업데이트 및 GA 릴리스에서 지원되고 권장됩니다. 특정 버전 호환성에 대한 자세한 내용은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 을 참조하십시오.

```{important}
Elasticsearch를 업그레이드하기 전에 기존 데이터를 백업하십시오. 업그레이드 도중 또는 이후에 문제가 발생하면 손상되지 않은 인덱스 스냅샷을 사용하여 이전 버전으로 롤백하십시오. [Elasticsearch 백업](./backing-up-elasticsearch.md)의 단계를 따릅니다.
```

기존 Elasticsearch 7 서버(또는 클러스터)를 Elasticsearch 8로 업그레이드하려면,

1. [Liferay 회사 및 시스템 인덱스 백업](./backing-up-elasticsearch.md).

1. [검색 튜닝](./backing-up-elasticsearch.md#backing-up-and-restoring-indexes-used-for-primary-storage) (동의어 집합 및 결과 순위)에 대한 애플리케이션별 인덱스를 백업합니다.

1. [새 Elasticsearch 설치 준비](../installing-elasticsearch.md).

1. [Elasticsearch 업그레이드](#upgrading-elasticsearch)

1. X-Pack 보안을 사용하는 경우 Elasticsearch 8에서 기본적으로 활성화됩니다. 비활성화하려면 다음 속성을 추가합니다.

   ```yaml
   xpack.security.enabled: false
   ```

   보안 구성에 대한 자세한 내용은 [Elasticsearch 보안](../securing-elasticsearch.md) 참조하십시오.

1. Elasticsearch에 연결하려면 Elasticsearch 8에 대한 커넥터를 구성하십시오.

1. Liferay를 다시 시작한 다음 모든 검색 및 맞춤법 검사 인덱스를 다시 인덱싱합니다.

   ```{note}
   롤링 업그레이드를 수행한 경우 재인덱싱이 필요하지 않습니다.
   ```

1. 스냅샷에서 검색 튜닝 인덱스를 복원합니다. 이전에 이러한 기능을 사용하고 있었다면 이러한 인덱스에 데이터가 저장되어 있을 수 있습니다.

1. 검색 조정 항목이 이월되었는지 확인하십시오.

## Elasticsearch 업그레이드

롤링 재시작 적격 버전을 사용하는 경우 가동 중지 시간을 최소화하고 모든 데이터를 다시 인덱싱할 필요가 없기 때문에 롤링 업그레이드 [](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rolling-upgrades.html) 수행하는 것이 Elasticsearch 클러스터를 업그레이드하는 데 권장되는 방법입니다. 그렇지 않으면 [전체 클러스터 다시 시작 업그레이드 ](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/restart-upgrade.html) 가이드를 따르십시오.

새 Elasticsearch 서버를 설치했고 사전 업그레이드 데이터를 인덱싱하려는 경우 UI에서 한 번 [re-index](#restart-liferay-and-re-index) 를 트리거하여 대부분의 Liferay 인덱스를 복원할 수 있습니다. Liferay [데이터베이스가 업그레이드되었습니다](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md). 그러나 검색 조정(결과 순위 및 동의어) 인덱스 및 데이터베이스 저장소에서 지원하지 않는 모든 사용자 지정 인덱스는 [사전 업그레이드 인덱스의 스냅샷](./backing-up-elasticsearch.md#backing-up- 및-복원-인덱스-사용-주-스토리지) .

## Liferay를 다시 시작하고 색인을 다시 생성하십시오.

Liferay가 Elasticsearch 클러스터와 연결되면 Liferay를 다시 시작하고 적용 가능한 인덱스를 새 Elasticsearch 설치로 다시 인덱싱합니다.

1. 라이프레이를 다시 시작합니다.

1. 전체 클러스터 재시작 업그레이드를 수행한 경우 회사, 시스템 및 맞춤법 검사 인덱스를 다시 인덱싱해야 합니다. 전역 메뉴(![Global Menu](../../../../images/icon-applications-menu.png))에서 **제어판** &rarr; **구성** &rarr; **검색** 으로 이동합니다. Reindex All Search Indexes 항목에 대해 **실행** 클릭합니다.

1. 전체 클러스터 재시작 업그레이드를 수행한 경우 [Workflow Metrics 인덱스](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#re-indexing-workflow-metrics) 을 다시 인덱싱해야 합니다. 전역 메뉴(![Global Menu](../../../../images/icon-applications-menu.png))에서 **Applications** &rarr; **Workflow---Metrics** 로 이동합니다. 설정 메뉴(![Options](../../../../images/icon-options.png) 및 클릭 **모두 재인덱싱** . 각 가상 인스턴스에 대해 프로세스를 반복합니다.

이렇게 하면 Liferay 데이터베이스에 저장된 데이터에서 빌드된 인덱스가 복원됩니다. 기본 스토리지로 사용되는 인덱스를 복원하려면 [Elasticsearch 백업](./backing-up-elasticsearch.md)참조하십시오.
