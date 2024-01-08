# 검색 구성 참조

Liferay DXP 검색은 다양한 방법으로 구성할 수 있습니다. [구성 범위](../system-administration/configuring-liferay/understanding-configuration-scope.md) 개념을 이해하면 특정 구성 화면을 찾을 수 있는 사이트
를 이해할 수 있습니다.

* 많은 검색 구성이 시스템 범위에 영향을 미칩니다(예: 작업 색인 재지정 및 검색 엔진 커넥터 구성).
* 검색 튜닝 구성은 가상 인스턴스에 영향을 미칩니다.
* 새 검색 페이지를 생성하면 사이트 범위의 검색에 영향을 줍니다.
* 검색 위젯 구성은 위젯 범위 구성이지만 일부는 페이지 범위 구성으로 간주될 수도 있습니다.

따라서 '검색 구성'이라는 용어는 사용 가능한 모든 범위를 다루므로 매우 광범위합니다. 이는 기본적으로 구성할 수 있는 검색 동작과 중요한 검색 구성 옵션을 찾을 수 있는 사이트
에 대한 높은 수준의 개요입니다.

## 위젯 범위 검색 구성

여러 검색 위젯을 페이지에 배치할 수 있습니다. 각각에는 고유한 구성 옵션이 있습니다.

![Each widget's configuration will be unique.](./search-configuration-reference/images/03.png)

### 검색 위젯

검색 위젯에 대한 전용 범위는 [검색 페이지 및 위젯](./getting-started/search-overview.md#search-pages-and-widgets) 참조하세요.

**검색 결과** : 검색 결과가 표시되는 방식을 구성합니다. 자세한 내용은 [검색 결과 표시](./search-pages-and-widgets/search-results/configuring-the-search-results-widget.md#displaying-search-results) 참조하세요.

**검색 창** : 검색 키워드가 처리되는 방식의 동작을 구성합니다. 자세한 내용은 [검색 창 구성](./getting-started/searching-for-content.md#configuring-the-search-bar) 참조하세요.

**검색 패싯** : 각 패싯의 동작과 URL 매개변수를 구성합니다. 자세한 내용은 [패싯](./search-pages-and-widgets/search-facets.md) 참조하세요.

**검색 옵션** : 이는 이 위젯을 구성하여 페이지 범위 동작을 정의하는 특별한 경우입니다. 페이지에 검색 옵션 위젯을 추가하고 검색 페이지에 대해 두 개의 부울을 정의합니다.

* 빈 검색 허용: 기본적으로 키워드를 입력하지 않으면 결과가 반환되지 않습니다. 이를 활성화하면 검색창에 키워드가 입력되지 않은 경우 **all** 결과가 반환됩니다.
* 기본 패싯 선택: 기본적으로 각 패싯 선택 후 패싯 개수가 다시 계산됩니다. 패싯 계산을 끄려면 이 옵션을 활성화합니다.

**검색 제안** : 더 나은 검색어와 맞춤법 검사 검색어를 제안합니다. 자세한 내용은 [제안 구성 참조](./search-pages-and-widgets/search-results/enabling-search-suggestions.md#suggestions-configuration-reference) 을 참조하세요.

**검색 인사이트** : 사용자가 키워드를 입력할 때 백엔드 검색 코드로 구성된 전체 쿼리 문자열을 검사하려면 검색 페이지에 이를 추가하세요. 테스트 및 개발에만 유용합니다. 자세한 내용은 [검색 통계](./search-pages-and-widgets/search-insights.md) 참조하세요.

**맞춤 필터** : 검색결과에 적용하려는 각 필터에 대해 페이지에 위젯을 추가합니다. 검색 페이지 사용자가 필터를 보고 조작하거나 필터를 표시하지 않거나 변경할 수 없게 만들 수 있습니다. 자세한 내용은 [검색 결과 필터링](./search-pages-and-widgets/search-results/filtering-search-results.md) 참조하십시오.

**정렬** : 사용자가 색인의 특정 '키워드' 필드 값을 기준으로 검색 결과를 재정렬할 수 있습니다. 예를 들어 제목 필드의 알파벳 순서로 결과를 표시합니다. 기본 순서는 검색 엔진의 **관련성** 계산에 의해 결정됩니다. 자세한 내용은 [검색 결과 정렬](./search-pages-and-widgets/search-results/sorting-search-results.md) 참조하세요.

**낮은 수준의 검색 옵션:****회사 색인** 이외의 색인을 대상으로 하는 검색에 참여하도록 검색 위젯을 구성합니다. 회사 색인은 Liferay DXP 자산이 데이터를 색인화하는 곳이므로 많은 설치에는 이 위젯이 필요하지 않습니다. 자세한 내용은 [낮은 수준 검색 옵션 이해](./search-pages-and-widgets/search-results/understanding-low-level-search-options.md) 을 참조하세요.

**유사한 결과:** 페이지에 표시되는 자산과 유사한 검색 결과를 표시합니다. 자세한 내용은 [유사한 결과](./search-pages-and-widgets/similar-results.md) 참조하세요.

[Liferay Enterprise Search]**Elasticsearch 모니터링:** Liferay Enterprise Search 가입자는 Liferay DXP 페이지에 배치된 위젯 내에서 [Elastic의 Kibana](https://www.elastic.co/kibana) 모니터링 도구에 액세스할 수 있습니다. 자세한 내용은 [Elasticsearch](./liferay-enterprise-search/monitoring-elasticsearch.md) 모니터링]을 참조하세요.

## 사이트 범위 검색 구성

[Site Scoped Configuration](../system-administration/configuring-liferay/understanding-configuration-scope.md) 의 엄격한 정의에 따라 검색에는 아무것도 없습니다. 그러나 [검색 페이지](./search-pages-and-widgets/working-with-search-pages/search-pages.md) 은 사이트별 검색 동작에 영향을 미칩니다. 일반적으로 검색 페이지에는 특정 사이트 내의 모든 콘텐츠를 검색하도록 구성된 검색 위젯이 포함되어 있습니다.

![Configure the scope of a search.](./search-configuration-reference/images/04.png)

검색 위젯을 사용할 때 알아야 할 몇 가지 중요한 구성 차이가 있습니다.

헤더 검색 표시줄(기본 테마에 포함된 검색 표시줄)이 검색 표시줄 위젯을 사용하는 경우 해당 구성에는 항상 **대상 페이지** 를 설정해야 합니다. 여기서 사용자는 검색 활동을 완료하고 다른 검색 위젯(결과)과 상호 작용하도록 리디렉션됩니다. , 패싯, 제안 등). [검색 대상 페이지](./search-pages-and-widgets/working-with-search-pages/creating-a-search-page.md) 은 검색 위젯이 포함된 일반 페이지입니다. 사이트 전반에 걸쳐 검색 위젯이 포함된 페이지를 원하는 만큼 가질 수 있습니다.

검색 표시줄 위젯은 인스턴스화 가능하므로 한 페이지에 서로 다르게 구성된 여러 검색 표시줄 위젯이 포함될 수 있습니다. 모든 검색 창 인스턴스가 유효하려면 사이트 내의 검색 페이지를 가리켜야 합니다.

```{important}
대상 검색 페이지에 테마가 포함된 헤더 검색 표시줄(예: Liferay의 기본 테마) 외에 검색 표시줄 위젯 인스턴스가 있는 경우 헤더 검색 표시줄의 구성이 페이지의 위젯 인스턴스보다 우선합니다.

반대로, 다른 페이지의 검색 창 위젯 인스턴스에서 검색하면 헤더 검색 창 구성과 다르더라도 해당 구성이 적용됩니다.
```

자세한 내용은 [검색 창 구성](./getting-started/searching-for-content.md#configuring-the-search-bar) 참조하세요.

## 인스턴스 범위 검색 구성

검색의 [인스턴스 설정](../system-administration/configuring-liferay/understanding-configuration-scope.md#system-settings-and-instance-settings) 패널에는 인스턴스 범위 항목이 없습니다. 그러나 많은 검색 위젯에 대해 인스턴스 전체 기본 [위젯 템플릿](../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) 을 구성하기 위한 항목이 있습니다. 템플릿이 정의된 사이트 ID(종종 사이트 설정 패널에 있는 글로벌 사이트의 ID임)와 사이트 메뉴 &rarr; 디자인 &rarr; 위젯 템플릿에 있는 위젯 템플릿 ID를 입력하기만 하면 됩니다.

검색을 위한 유일한 인스턴스 범위 구성은 전역 메뉴 &rarr; 애플리케이션 &rarr; 검색 튜닝의 항목입니다.

**결과 순위:** 특정 별칭에 대한 결과를 숨기고 고정하고 추가하여 검색 결과를 수동으로 맞춤설정하세요. 자세한 내용은 [결과 순위](./search-administration-and-tuning/result-rankings.md) 참조하세요.

**동의어:** 동의어 검색어가 일치하고 검색어와 정확히 일치하는 것처럼 점수가 매겨지도록 동의어 세트를 만듭니다. 자세한 내용은 [동의어 세트](./search-administration-and-tuning/synonym-sets.md) 을 참조하세요.

## 시스템 범위 검색 구성

시스템 범위 검색 구성은 주로 [시스템 설정](../system-administration/configuring-liferay/system-settings.md) 에서 찾을 수 있습니다.

1. 글로벌 메뉴에서 **제어판** &rarr; **구성** &rarr; **시스템 설정** 으로 이동합니다.

1. 플랫폼 섹션에서 **검색** 카테고리를 클릭하세요.

   또는 **검색** 을 검색하세요.

![There are numerous system scoped entries for search in System Settings.](./search-configuration-reference/images/01.png)

시스템 설정은 [OSGi 구성 파일](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 통해 구성할 수도 있습니다. 파일 이름이 여기에 다시 포함됩니다.

### 카테고리 패싯 필드

{bdg-secondary}`7.4 U47+ 및 GA47+`

**구성 파일:** `com.liferay.portal.search.configuration.CategoryFacetConfiguration.config`

카테고리 패싯 필드 항목에는 카테고리 패싯 필드라는 하나의 설정이 포함되어 있습니다. 이 설정은 카테고리 패싯에서 집계를 생성할 때 사용할 인덱스 필드를 지정합니다. 기본값은 'assetCategoryIds'입니다. 대신 'assetVocabularyCategoryIds'를 사용하여 Category Facet 위젯에 표시할 어휘와 카테고리를 선택할 수 있도록 해야 합니다. [카테고리 패싯 문서](./search-pages-and-widgets/search-facets/category-facet.md) 에서 자세히 알아보세요.

### 기본 키워드 질의

**구성 파일:** `com.liferay.portal.search.configuration.DefaultKeywordQueryConfiguration.config`

기본 키워드 쿼리 항목에는 다음 한 가지 설정이 포함되어 있습니다.

**`disabledEntryClassNames`** : `DefaultKeywordQueryContributor` 코드는 키워드 검색 쿼리에 `description`, `userName` 및 `title` 필드를 자동으로 추가합니다. `DefaultKeywordQueryContributor`가 무시해야 하는 항목 클래스 이름을 지정합니다.

### 기본 검색 결과 권한 필터

**구성 파일:** `com.liferay.portal.search.configuration.DefaultSearchResultPermissionFilterConfiguration.config`

기본 검색 결과 권한 필터 항목을 사용하면 **필터링 후 권한 확인**(검색 색인에서 결과가 반환된 후 발생하는 데이터베이스 권한 확인)을 구성할 수 있습니다. 이 설정에 대한 자세한 내용은 [최종 권한 확인](./search-pages-and-widgets/search-results/search-results-behavior.md#final-permissions-checking) 참조하세요.

* **`permissionFilteredSearchResultAccurateCountThreshold`**

* **`searchQueryResultWindowLimit`**

### 인덱스 상태 관리자

**구성 파일:** `com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config`

인덱스 상태 관리자 항목에는 다음과 같은 한 가지 설정이 있습니다.

**`indexReadOnly`** : 모든 인덱싱 작업을 일시 중지하고 검색 엔진에 기록하려면 이 옵션을 활성화하세요. 검색에서는 이미 색인화된 문서만 반환합니다. 이는 대규모 데이터 가져오기 속도를 높이는 데 유용하지만 가져오기가 완료되면 비활성화하고 전체 재인덱싱을 실행해야 합니다.

### Indexer Writer Helper

**구성 파일:** `com.liferay.portal.search.configuration.IndexWriterHelperConfiguration.config`

Index Writer Helper 항목에는 다음 항목이 하나 포함되어 있습니다.

**`indexCommitImmediately`** : **true**(기본값)인 경우 각 쓰기 요청은 검색 엔진이 인덱스 리더를 새로 고쳐 잠재적으로 트랜잭션을 디스크로 플러시하도록 합니다. 이는 검색 엔진 성능에 부정적인 영향을 미칠 수 있습니다. 기본 동작은 개별 자산에 대한 색인 작성(예: 블로그 추가, 블로그 업데이트)을 즉시 커밋하는 것이지만 대량 색인 작성 작업(예: 모든 사용자 색인화, 모든 양식 항목 색인화)에 대한 커밋은 모든 항목이 검색 엔진으로 전송될 때까지 지연됩니다. 이를 false로 설정하면 개별 인덱스 작업의 동작이 변경되며 새로 추가된 콘텐츠를 표시할 때 Asset Publisher와 같은 응용 프로그램이 지연된 응답을 표시할 수 있습니다. 자세한 내용은 [Elasticsearch 문서](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/near-real-time.html) 참조하세요.

### 인덱서 레지스트리

**구성 파일:** `com.liferay.portal.search.configuration.IndexerRegistryConfiguration.config`

인덱스 요청의 버퍼링을 구성합니다.

**`buffered`** : 인덱싱 요청의 버퍼링을 활성화(기본값) 또는 비활성화합니다.

**`bufferedExecutionMode`** : 관리자가 `IndexerRequest`를 실행하는 데 사용되는 다른 `IndexerRequestBufferExecutor`를 선택할 수 있도록 허용합니다. 실행기의 한 가지 구현이 즉시 제공됩니다(_DEFAULT_). 새로운 `IndexerRequestBufferExecutor` 구현이 배포되면 필수 속성 중 하나는 `buffered.execution.mode`입니다. 그런 다음 이 값을 **DEFAULT** 대신 사용할 수 있습니다.

**`maximumBufferSize`** : 버퍼링이 활성화된 경우 추가 인덱싱 요청이 즉시 실행되도록 최대 버퍼 크기를 설정합니다.

**`minimumBufferAvailabilityPercentage`** : 버퍼 용량에 지정된 공간 비율만 남은 경우 버퍼의 기존 요청이 일괄적으로 실행되어 버퍼에서 제거됩니다.

### 인덱스 쿼리 프리프로세서

**구성 파일:** `com.liferay.portal.search.configuration.QueryPreProcessConfiguration.config`

이 항목에는 반복 가능한 속성이 하나 있습니다( [OSGi 구성 파일](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 통해 정의하는 경우 배열 구문 사용).

**`fieldNamePatterns`** : 여기에 설정된 패턴과 이름이 일치하는 필드는 분석되지 않은 키워드 필드로 처리됩니다. 점수가 매겨진 전체 텍스트 쿼리 대신 점수가 매겨지지 않은 와일드카드 쿼리로 일치가 수행됩니다. 이는 인덱스가 커질수록 검색 엔진 성능을 저하시키는 리소스 집약적 작업입니다. 하위 문자열 일치의 경우 일반적으로 [ngram 토크나이저](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-ngram-tokenizer.html) 사용하는 것이 더 나은 성능을 발휘합니다.

### 다시 색인

**구성 파일:** `com.liferay.portal.search.configuration.ReindexConfiguration.config`

이 항목에는 하나의 속성만 포함되어 있습니다.

**`indexingBatchSizes`** : 배치 인덱싱을 지원하는 모델 유형에 대해 배치당 인덱싱되는 문서 수(기본값은 1000)를 설정합니다. 큰 문서가 있는 모델의 경우 이 값을 줄이면 전체 재인덱싱을 실행할 때 안정성이 향상될 수 있습니다.

### 엔진 헬퍼

**구성 파일:** `com.liferay.portal.search.configuration.SearchEngineHelperConfiguration.config`

이 항목에는 반복 가능한 속성이 하나 있습니다([OSGi 구성 파일](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 통해 정의하는 경우 배열 구문 사용).

**`excludedEntryClassNames`** : 검색 애플리케이션용으로 구성된 포괄 쿼리에서 자산 유형을 검색에서 제외합니다. 예를 들어, 조직 자산의 필드는 사용자 및 조직 애플리케이션에서 검색 가능하도록 색인화되어야 하지만 검색 애플리케이션에서는 검색되어서는 안 됩니다. 따라서 조직은 `excludedEntryClassNames`에 추가됩니다.

### 권한 체커

**구성 파일:** `com.liferay.portal.search.configuration.SearchPermissionCheckerConfiguration.config`

이 항목에는 Liferay DXP 7.3에 하나의 구성 옵션이 있습니다.

**`permissionTermsLimit`** : 이 권한 확인 수준이 중단되기 전에 검색 쿼리에 추가되는 권한 검색 절의 수를 제한합니다. 그런 다음 권한 확인은 [기본 검색 결과 권한 필터](#default-search-result-permission-filter) 섹션에 설명된 최종 권한 필터링에만 의존합니다.

### 제목 필드 쿼리 빌더

**구성 파일:** `com.liferay.portal.search.configuration.TitleFieldQueryBuilderConfiguration.config`

문서의 제목 필드 일치에 검색이 응답하는 방식을 구성합니다.

**`exactMatchBoost`** : 검색된 키워드가 문서의 `제목` 필드와 정확히 일치하는 경우 추가 부스트를 제공합니다.

**`maxExpansions`** : 검색된 키워드를 구문 접두사로 '제목' 필드와 일치시킬 때 반환할 문서 수를 제한합니다. 자세한 내용은 Elasticsearch의 [일치 구문 쿼리 문서](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-query-phrase.html) 을 참조하세요.

### 교차 클러스터 복제

Liferay Enterprise Search 구독을 통해 사용할 수 있는 클러스터 간 복제 모듈을 배포한 경우에만 이 항목이 표시됩니다. 이러한 구성 속성은 전용 [클러스터 간 복제](./liferay-enterprise-search/cross-cluster-replication/cross-cluster-replication.md) 설명서에서 다룹니다.

### Elasticsearch Monitoring

**구성 파일:** `com.liferay.portal.search.elasticsearch.monitoring.web.internal.configuration.MonitoringConfiguration.config`

Liferay Enterprise Search 구독을 통해 사용할 수 있는 Liferay Enterprise Search 모니터링 모듈을 배포한 경우 Elasticsearch 모니터링 구성을 사용할 수 있습니다. 이러한 구성 속성은 [Elasticsearch 모니터링](./liferay-enterprise-search/monitoring-elasticsearch.md) 설명서에서 다룹니다.

### Elasticsearch 7

**구성 파일:** `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config`

Liferay와 Elasticsearch 7 간의 연결을 구성합니다. 이러한 속성에 대한 자세한 내용은 [커넥터](./installing-and-upgrading-a-search-engine/elasticsearch/connecting-to-elasticsearch.md#configuring-the-connector) 구성을 참조하세요.

### Elasticsearch 연결

**구성 파일:** `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConnectionConfiguration-[connectionId].config`

Liferay 7.3은 여러 Elasticsearch 클러스터에 연결할 수 있습니다. 연결은 Elasticsearch 연결 항목에 정의됩니다. 이 기능은 낮은 수준 검색 옵션 및 검색 결과 위젯과 함께 사용되어 Elasticsearch 클러스터를 사용하는 타사 시스템의 결과를 표시할 수 있습니다. 이는 [교차 클러스터 복제](./liferay-enterprise-search/cross-cluster-replication/cross-cluster-replication.md) 설명서에도 나와 있습니다.

### Learning to Rank

**구성 파일:** `com.liferay.portal.search.learning.to.rank.configuration.LearningToRankConfiguration.config`

Liferay Enterprise Search 구독을 통해 사용할 수 있는 Liferay Enterprise Search 순위 학습 모듈을 배포한 경우 순위 학습 구성을 사용할 수 있습니다. 이러한 구성 속성은 전용 [학습 * 순위](./liferay-enterprise-search/learning-to-rank.md) 문서에서 다룹니다.

### 웹 검색

**구성 파일:** `com.liferay.portal.search.web.internal.configuration.SearchWebConfiguration.config`

이 항목에는 하나의 속성이 포함되어 있습니다.

**`classicSearchPortletInFrontPage`** : 기본 검색 환경을 새로운 검색 위젯 사용에서 이전 릴리스의 표준이었던 더 이상 사용되지 않는 클래식 검색 포틀릿으로 되돌립니다.

### 동의어

**구성 파일:** `com.liferay.portal.search.tuning.synonyms.web.internal.configuration.SynonymsConfiguration.config`

이 항목에는 반복 가능한 속성이 하나 있습니다( [OSGi 구성 파일](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 통해 정의하는 경우 배열 구문 사용).

**`synyonymFilterNames`** : 적용할 동의어 필터 이름을 설정합니다. 이러한 필터는 Elasticsearch 인덱스 설정에서 정의되어야 합니다. [새 동의어 언어 필터 만들기](./search-administration-and-tuning/synonym-sets.md#creating-new-synonym-language-filters) 참조하세요.

### 검색 관리

**제어판** &rarr; **구성** &rarr; **검색** 에는 연결, 색인 작업 및 필드 매핑이라는 세 가지 관리 UI가 있습니다.

자세한 내용은 [검색 관리 및 조정](./search-administration-and-tuning.md) 설명서를 참조하세요.

#### 연결

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

#### 인덱스 작업

색인 작업에서 다음 수준 중 하나에서 다시 색인을 생성합니다.

   * 인덱싱 가능한 모든 자산
   * 개별 인덱싱 가능한 자산
   * 모든 맞춤법 검사 색인

#### 필드 맵핑

### 문맥 재산

포털 속성도 시스템 범위에 속합니다. [Lucene Search](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Lucene%20Search) 포털 속성은 낮은 수준의 검색 동작을 구성합니다. 속성과 해당 설명을 검토하고 검색 요구 사항에 적용되는지 확인합니다.

## 관련 내용

* [검색 관리 및 튜닝](search-administration-and-tuning.md)
* [Elasticsearch 커넥터 구성 참조](./installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
* [Elasticsearch 시작하기](./installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md)
