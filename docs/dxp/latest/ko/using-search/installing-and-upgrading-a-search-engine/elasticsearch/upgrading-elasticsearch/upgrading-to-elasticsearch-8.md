# Elasticsearch 8로 업그레이드

{bdg-secondary}`7.4 U81+, 7.3 U31+`

Elasticsearch 8은 최신 Liferay 7.4 업데이트 및 기본 GA 릴리스에 대해 지원되고 권장됩니다. 특정 버전 호환성에 대한 자세한 내용은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 을 참조하세요.

```{important}
Elasticsearch를 업그레이드하기 전에 기존 데이터를 백업하세요. 업그레이드 도중이나 업그레이드 후에 문제가 발생하면 손상되지 않은 인덱스 스냅샷을 사용하여 이전 버전으로 롤백하세요. [Elasticsearch 백업](./backing-up-elasticsearch.md) 의 단계를 따르세요.
```

기존 Elasticsearch 7 서버(또는 클러스터)를 Elasticsearch 8로 업그레이드하려면,

1. [Liferay 회사 및 시스템 색인 백업](./backing-up-elasticsearch.md).

1. [검색 튜닝](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) (동의어 세트 및 결과 순위)에 대한 애플리케이션별 인덱스를 백업합니다.

1. [새로운 Elasticsearch 설치를 준비하세요.](../installing-elasticsearch.md).

1. [Elasticsearch 업그레이드](#upgrading-elasticsearch) 

1. X-Pack 보안을 사용하는 경우 Elasticsearch 8에서 기본적으로 활성화됩니다. 비활성화하려면 다음 속성을 추가하세요.

   ```yaml
   xpack.security.enabled: false
   ```

   보안 구성에 대한 자세한 내용은 [Elasticsearch 보안](../securing-elasticsearch.md)을 참조하세요.

1. Elasticsearch에 연결하려면 Elasticsearch 8에 대한 커넥터를 구성하세요.

1. Liferay를 다시 시작한 다음 모든 검색 및 맞춤법 검사 색인을 다시 색인화하십시오.

   ```{note}
   롤링 업그레이드를 수행한 경우 재인덱싱이 필요하지 않습니다.
   ```

1. 스냅샷에서 검색 튜닝 색인을 복원합니다. 이전에 이러한 기능을 사용했다면 이러한 인덱스에 데이터가 저장되어 있을 수 있습니다.

1. 검색 튜닝 항목이 전달되었는지 확인하십시오.

## Elasticsearch 업그레이드

롤링 재시작 가능 버전을 사용하는 경우 [롤링 업그레이드](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rolling-upgrades.html) 을 수행하는 것은 가동 중지 시간을 최소화하고 모든 데이터를 다시 인덱싱할 필요성을 없애기 때문에 Elasticsearch 클러스터를 업그레이드하는 데 권장되는 방법입니다. 그렇지 않은 경우 [전체 클러스터 다시 시작 업그레이드](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/restart-upgrade.html) 가이드를 따르세요.

새 Elasticsearch 서버를 설치했고 업그레이드 전 데이터를 인덱싱하려는 경우 Liferay [데이터베이스가 업그레이드되면](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md) UI에서 [인덱싱](#restart-liferay-and-reindex) 트리거하여 대부분의 Liferay 인덱스를 복원할 수 있습니다. 그러나 데이터베이스 스토리지에서 지원하지 않는 검색 튜닝(결과 순위 및 동의어) 인덱스와 사용자 정의 인덱스는 업그레이드 전 인덱스 [의](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) 스냅샷에서 복원해야 합니다.

## Liferay를 다시 시작하고 다시 색인을 생성하세요.

Liferay가 Elasticsearch 클러스터와 연결되면 Liferay를 다시 시작하고 적용 가능한 인덱스를 새 Elasticsearch 설치로 다시 인덱싱합니다.

1. liferay를 다시 시작하세요.

1. 전체 클러스터 다시 시작 업그레이드를 수행한 경우 회사, 시스템 및 맞춤법 검사 색인을 다시 색인화해야 합니다. 글로벌 메뉴(![글로벌 메뉴](../../../../images/icon-applications-menu.png))에서 **제어판** &rarr; **구성** &rarr; **검색** 으로 이동합니다. 모든 검색 색인 재색인 항목에 대해 **실행** 을 클릭합니다.

1. 전체 클러스터 재시작 업그레이드를 수행한 경우 글로벌 메뉴(![글로벌 메뉴](../../../../images/icon-에서 [워크플로 메트릭 인덱스](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics) 을 다시 인덱싱해야 합니다. apps-menu.png)), **Applications** &rarr; **Workflow---Metrics** 로 이동합니다. 설정 메뉴(![옵션](../../../../images/icon-options.png)를 열고 **모두 다시 색인화** 를 클릭합니다. 각 가상 인스턴스에 대해 프로세스를 반복합니다.

그러면 Liferay 데이터베이스에 저장된 데이터로 작성된 인덱스가 복원됩니다. 기본 스토리지로 사용되는 인덱스를 복원하려면 [Elasticsearch 백업](./backing-up-elasticsearch.md) 참조하세요.
