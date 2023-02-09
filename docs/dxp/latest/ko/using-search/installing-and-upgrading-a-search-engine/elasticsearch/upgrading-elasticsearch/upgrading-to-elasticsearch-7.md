# Elasticsearch 7로 업그레이드

Elasticsearch 7은 즉시 사용 가능한 최신 Liferay 7.2, 7.3 및 7.4 버전에서 지원됩니다. 특정 버전 호환성에 대한 자세한 내용은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651)을 참조하십시오.

Liferay 7.2의 경우 Elasticsearch 7은 [Liferay Connector to Elasticsearch 7](https://web.liferay.com/marketplace/-/mp/application/170390307) (버전 `3.x`)을 통해 지원됩니다. Liferay 7.3 이상으로 업그레이드하거나 기존 7.2 검색 엔진을 Elasticsearch 7로 가져오는 경우 Elasticsearch 서버를 업그레이드해야 합니다. 새로운 Liferay 7.2 시스템을 설정하려면 Elasticsearch 7을 설치하고 [설치 가이드](../getting-started-with-elasticsearch.md)를 따르십시오.

```{important}
Elasticsearch를 업그레이드하기 전에 기존 데이터를 백업하십시오. 업그레이드 도중 또는 이후에 문제가 발생하면 손상되지 않은 인덱스 스냅샷을 사용하여 이전 버전으로 롤백하십시오. [Elasticsearch 백업](./backing-up-elasticsearch.md)의 단계를 따릅니다.
```

기존 Elasticsearch 서버(또는 클러스터)를 Elasticsearch 7로 업그레이드하려면,

1. [Liferay 회사 및 시스템 인덱스 백업](./backing-up-elasticsearch.md).

1. [검색 튜닝](./backing-up-elasticsearch.md#backing-up-and-restoring-indexes-used-for-primary-storage) (동의어 집합 및 결과 순위)에 대한 애플리케이션별 인덱스를 백업합니다.

1. [Elasticsearch 설치 및 구성](../installing-elasticsearch.md).

1. [Elasticsearch 업그레이드](#upgrading-elasticsearch)

1. X-Pack 보안을 사용하는 경우 활성화되어 있는지 확인하십시오.

   ```yaml
   xpack.security.enabled: true
   ```

   보안 구성에 대한 자세한 내용은 [Elasticsearch 보안](../securing-elasticsearch.md) 을 참조하십시오.

1. \[7.2만 해당\] [Elasticsearch 6에 대한 번들 Liferay Connector를 블랙리스트에 추가하고](#blacklisting-elasticsearch-6) 및 [는 Elasticsearch 7에 대한 커넥터를 설치](../connecting-to-elasticsearch.md#install-the-elasticsearch-7-connector) 합니다.

1. Elasticsearch에 연결하려면 Elasticsearch 7에 대한 커넥터를 구성하십시오.

1. Liferay를 다시 시작한 다음 모든 검색 및 맞춤법 검사 인덱스를 다시 인덱싱합니다.

1. 스냅샷에서 검색 튜닝 인덱스를 복원합니다. 이전에 이러한 기능을 사용하고 있었다면 이러한 인덱스에 데이터가 저장되어 있을 수 있습니다.

1. 검색 조정 항목이 이월되었는지 확인하십시오.

## Elasticsearch 업그레이드

롤링 재시작 적격 버전(`6.8.x`)을 사용하는 경우 [롤링 업그레이드](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rolling-upgrades.html) 을 수행하는 것이 Elasticsearch 클러스터를 업그레이드하는 데 권장되는 방법입니다. 그렇지 않으면 [전체 클러스터 다시 시작 업그레이드 ](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/restart-upgrade.html) 가이드를 따르십시오.

새 Elasticsearch 서버를 설치했고 사전 업그레이드 데이터를 인덱싱하려는 경우 UI에서 한 번 [re-index](#restart-liferay-and-re-index)를 트리거하여 대부분의 Liferay 인덱스를 복원할 수 있습니다. Liferay [데이터베이스가 업그레이드되었습니다](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md). 그러나 검색 조정(결과 순위 및 동의어) 인덱스 및 데이터베이스 저장소에서 지원하지 않는 모든 사용자 지정 인덱스는 [사전 업그레이드 인덱스의 스냅샷](./backing-up-elasticsearch.md#backing-up- 및-복원-인덱스-사용-주-스토리지).

## Elasticsearch 6 블랙리스트 작성

이것은 Liferay 7.2를 실행하는 경우에만 필요합니다. 

1.  이름이 지정된 구성 파일을 만듭니다. 

    ```bash
    com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
    ```

1.  다음 내용을 제공하십시오. 

    ```properties
    blacklistBundleSymbolicNames=[ \
        "com.liferay.portal.search.elasticsearch6.api", \
        "com.liferay.portal.search.elasticsearch6.impl", \
        "com.liferay.portal.search.elasticsearch6.spi", \
        "com.liferay.portal.search.elasticsearch6.xpack.security.impl", \
        "Liferay Connector to X-Pack Security [Elastic Stack 6.x] - Impl", \ 
        "Liferay Enterprise Search Security  - Impl" \
    ]
    ```

1. 파일을 서버의 `배포` 폴더에 복사하여 배포합니다. 

## Liferay를 다시 시작하고 색인을 다시 생성하십시오.

Liferay가 Elasticsearch 클러스터와 연결되면 Liferay를 다시 시작하고 적용 가능한 인덱스를 새 Elasticsearch 설치로 다시 인덱싱합니다.

1. 라이프레이를 다시 시작합니다.

1. 회사, 시스템 및 맞춤법 검사 색인을 다시 색인화합니다. 전역 메뉴(![Global Menu](../../../../images/icon-applications-menu.png))에서 *제어판* &rarr; *구성* &rarr; *검색*으로 이동합니다. *Reindex all search indexes* 항목에 대해 *실행* 을 클릭합니다.

1. [Workflow Metrics indexes](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#re-indexing-workflow-metrics)을 다시 인덱싱합니다. 전역 메뉴(![Global Menu](../../../../images/icon-applications-menu.png))에서 *Applications* &rarr; *Workflow---Metrics*로 이동합니다. 설정 메뉴(![Options](../../../../images/icon-options.png) 및 클릭 *모두 재인덱싱*. 각 가상 인스턴스에 대해 프로세스를 반복합니다.

이렇게 하면 Liferay 데이터베이스에 저장된 데이터에서 빌드된 인덱스가 복원됩니다. 기본 스토리지로 사용되는 인덱스를 복원하려면 [Elasticsearch 백업](./backing-up-elasticsearch.md)을 참조하십시오.

## Liferay 7.2: Elasticsearch 6으로 되돌리기

일이 발생합니다. Liferay 7.2를 사용 중이고 Elasticsearch 7로 업그레이드하는 동안 복구할 수 없는 오류가 발생하는 경우 Elasticsearch 6으로 롤백하고 다시 그룹화할 수 있습니다.

Elasticsearch 6 및 7은 현재 두 개의 별도 설치이므로 이 절차는 몇 단계만 거치면 됩니다.

1.  Elasticsearch 7에 대한 Liferay 커넥터를 중지합니다.

1.  Elasticsearch 7을 중지하고 Elasticsearch 6 `elasticsearch.yml` 및 커넥터 앱이 동일한 포트(기본적으로 9200)를 사용하도록 구성되었는지 확인합니다.

1. 설치의 `osgi` 폴더에서 Elasticsearch 6에 대한 블랙리스트 구성 파일을 제거합니다.

1.  Elasticsearch 서버를 시작한 다음 Liferay Connector를 Elasticsearch 6으로 다시 시작하십시오.

업그레이드가 완료되면 Liferay 버전에서 사용할 수 있는 [개의 새로운 검색 기능을 확인하십시오.](../../../getting-started.html). 
