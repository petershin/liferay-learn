# Elasticsearch 7로 업그레이드

{bdg-secondary}`7.1 및 7.2`

Liferay 7.3 및 7.4는 기본적으로 Elasticsearch 7을 지원합니다. Liferay 설치에 사용 가능한 최신 검색 엔진 버전을 찾으려면 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 참조하십시오.

Liferay 7.2의 경우 Elasticsearch 7은 [Liferay Connector to Elasticsearch 7](https://web.liferay.com/marketplace/-/mp/application/170390307) (버전 '3.x')을 통해 지원됩니다. Liferay 7.3 이상으로 업그레이드하거나 기존 7.2 검색 엔진을 Elasticsearch 7로 가져오는 경우 Elasticsearch 서버를 업그레이드해야 합니다. 새로운 Liferay 7.2 시스템을 설정하려면 Elasticsearch 7을 설치하고 [설치 안내서를 따르십시오](../getting-started-with-elasticsearch.md) .

```{important}
Elasticsearch를 업그레이드하기 전에 기존 데이터를 백업하세요. 업그레이드 도중이나 업그레이드 후에 문제가 발생하면 손상되지 않은 인덱스 스냅샷을 사용하여 이전 버전으로 롤백하세요. [Elasticsearch 백업](./backing-up-elasticsearch.md) 의 단계를 따르세요.
```

기존 Elasticsearch 서버(또는 클러스터)를 Elasticsearch 7로 업그레이드하려면,

1. [Liferay 회사 및 시스템 색인 백업](./backing-up-elasticsearch.md) .

1. [검색 튜닝](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) (동의어 세트 및 결과 순위)에 대한 애플리케이션별 인덱스를 백업합니다.

1. [Elasticsearch](../installing-elasticsearch.md) 설치 및 구성.

1. [Elasticsearch 업그레이드](#upgrading-elasticsearch) 

1. X-Pack 보안을 사용하는 경우 활성화되어 있는지 확인하세요.

   ```yaml
   xpack.security.enabled: true
   ```

   보안 구성에 대한 자세한 내용은 [Elasticsearch 보안](../securing-elasticsearch.md)을 참조하세요.

1. \[7.2만 해당\] [번들 Liferay Connector to Elasticsearch 6](#blacklisting-elasticsearch-6) 를 블랙리스트에 추가하고 [Elasticsearch 7에 커넥터를 설치](../connecting-to-elasticsearch.md#install-the-elasticsearch-7-connector) 합니다.

1. Elasticsearch에 연결하려면 Elasticsearch 7에 대한 커넥터를 구성하세요.

1. Liferay를 다시 시작한 다음 모든 검색 및 맞춤법 검사 색인을 다시 색인화하십시오.

1. 스냅샷에서 검색 튜닝 색인을 복원합니다. 이전에 이러한 기능을 사용했다면 이러한 인덱스에 데이터가 저장되어 있을 수 있습니다.

1. 검색 튜닝 항목이 전달되었는지 확인하십시오.

## Elasticsearch 업그레이드

롤링-다시 시작 가능 버전(`6.8.x`)을 사용하는 경우 [롤링 업그레이드](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rolling-upgrades.html) 을 수행하는 것이 Elasticsearch 클러스터를 업그레이드하는 데 권장되는 방법입니다. 그렇지 않은 경우 [전체 클러스터 다시 시작 업그레이드](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/restart-upgrade.html) 가이드를 따르세요.

새 Elasticsearch 서버를 설치했고 업그레이드 전 데이터를 인덱싱하려는 경우 Liferay [데이터베이스가 업그레이드되면](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md) UI에서 [인덱싱](#restart-liferay-and-reindex) 트리거하여 대부분의 Liferay 인덱스를 복원할 수 있습니다. 그러나 데이터베이스 스토리지에서 지원하지 않는 검색 튜닝(결과 순위 및 동의어) 인덱스와 사용자 정의 인덱스는 업그레이드 전 인덱스 [의](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) 스냅샷에서 복원해야 합니다.

## Elasticsearch 6 블랙리스트 추가

이는 Liferay 7.2를 실행하는 경우에만 필요합니다.

1. 이름이 지정된 구성 파일을 만듭니다.

   ```bash
   com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
   ```

1. 다음 내용을 제공하십시오.

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

1. 파일을 서버의 `deploy` 폴더에 복사하여 배포합니다.

## Liferay를 다시 시작하고 다시 색인을 생성하세요.

Liferay가 Elasticsearch 클러스터와 연결되면 Liferay를 다시 시작하고 적용 가능한 인덱스를 새 Elasticsearch 설치로 다시 인덱싱합니다.

1. liferay를 다시 시작하세요.

1. 회사, 시스템 및 맞춤법 검사 색인을 다시 색인화합니다. 글로벌 메뉴(![글로벌 메뉴](../../../../images/icon-applications-menu.png))에서 **제어판** &rarr; **구성** &rarr; **검색** 으로 이동합니다. **모든 검색 색인** 항목에 대해 **재색인** 을 클릭하십시오.

1. [워크플로 지표 색인](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics) 다시 색인화합니다. 전역 메뉴(![전역 메뉴](../../../../images/icon-applications-menu.png))에서 **응용 프로그램** 으로 이동합니다. &rarr; **Workflow---Metrics** . 설정 메뉴(![옵션](../../../../images/icon-options.png)를 열고 **모두 다시 색인화** 를 클릭합니다. 각 가상 인스턴스에 대해 프로세스를 반복합니다.

그러면 Liferay 데이터베이스에 저장된 데이터로 작성된 인덱스가 복원됩니다. 기본 스토리지로 사용되는 인덱스를 복원하려면 [Elasticsearch 백업](./backing-up-elasticsearch.md) 참조하세요.

## Liferay 7.2: Elasticsearch 6으로 되돌리기

일이 일어납니다. Liferay 7.2를 사용 중이고 Elasticsearch 7로 업그레이드하는 동안 복구할 수 없는 오류가 발생하는 경우 Elasticsearch 6으로 롤백하고 재그룹화할 수 있습니다.

Elasticsearch 6과 7은 현재 두 개의 별도 설치이므로 이 절차는 몇 단계만 거치면 됩니다.

1. Elasticsearch 7에 대한 Liferay 커넥터를 중지합니다.

1. Elasticsearch 7을 중지하고 Elasticsearch 6 'elasticsearch.yml'과 커넥터 앱이 동일한 포트(기본적으로 9200)를 사용하도록 구성되어 있는지 확인하세요.

1. 설치의 `osgi` 폴더에서 Elasticsearch 6에 대한 블랙리스트 구성 파일을 제거하십시오.

1. Elasticsearch 서버를 시작한 다음 Liferay Connector를 Elasticsearch 6으로 다시 시작하세요.

업그레이드가 완료되면 Liferay 버전에서 사용할 수 있는 [새로운 검색 기능을 확인하세요.](../../../getting-started.html) .
