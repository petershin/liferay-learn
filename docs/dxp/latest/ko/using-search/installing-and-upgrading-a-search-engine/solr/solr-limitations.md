# 솔라 제한

Liferay의 Solr 구현에는 제한이 있습니다. Solr를 검색 엔진으로 선택하면 일부 Liferay 기능 및 API를 사용할 수 없습니다. 최상의 경험을 위해서는 [Elasticsearch](../elasticsearch/getting-started-with-elasticsearch.md)를 설치하세요.

## 검색결과 품질

Elasticsearch 관련 API 및 매핑은 Liferay의 검색 기능에서 활용되고 있습니다. 이러한 기능 중 일부는 Solr에 포함되어 있지 않기 때문에 Solr를 Liferay의 검색 엔진으로 사용하면 검색 결과의 품질이 낮아질 것으로 예상됩니다.

예를 들어, Liferay의 언어 인식 정렬 동작은 Elasticsearch [의 ICU 분석 플러그인 때문에 존재하는 대조 규칙](https://www.elastic.co/guide/en/elasticsearch/plugins/8.8/analysis-icu-collation-keyword-field.html) 의존합니다. Solr에서 검색할 때 일부 최적이 아닌 정렬 동작이 예상됩니다. 특히 필드 값에 발음 구별 부호가 포함되어 있는 경우 더욱 그렇습니다.

## 최종 사용자 기능 제한

Liferay의 Solr 통합에는 제한이 있습니다. 다음 기능을 사용하려면 Elasticsearch가 필요합니다.

* [liferay 개체](../../../building-applications/objects.md)
* [커머스](https://learn.liferay.com/commerce/latest/ko/index.html)
* [워크플로 측정항목](../../../process-automation/workflow/using-workflows/using-workflow-metrics.md)
* [맞춤 필터 검색 위젯](../../search-pages-and-widgets/search-results/filtering-search-results.md)
* [낮은 수준의 검색 옵션 위젯](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md)
* [검색 조정: 검색 결과 사용자 정의](../../search-administration-and-tuning/result-rankings.md)
* [검색 조정: 동의어](../../search-administration-and-tuning/synonym-sets.md)
* [콘텐츠 대시보드](../../../content-authoring-and-management/content-dashboard.md)
* [유사한 결과](../../search-pages-and-widgets/similar-results.md)
* [동시 및 동기 재인덱싱 모드](../../search-administration-and-tuning/reindexing-modes.md)
* 다음을 포함한 모든 [Liferay Enterprise Search](../../liferay-enterprise-search.md) 애플리케이션
   * 교차 클러스터 복제
   * Search Experiences
   * Learning to Rank
   * 모니터링

## 개발자 기능 제한

다음 API는 현재 Liferay의 Solr 커넥터에서 지원되지 않습니다.

* Portal Core에서(모듈: `portal-kernel`, 아티팩트:
  `com.liferay.portal.kernel`):
  * `com.liferay.portal.kernel.search.generic.NestedQuery`
  * `com.liferay.portal.kernel.search.filter`:
    * `ComplexQueryPart`
    * `GeoBoundingBoxFilter`
    * `GeoDistanceFilter`
    * `GeoDistanceRangeFilter`
    * `GeoPolygonFilter`
* 포털 검색 API(모듈: `portal-search-api`, 아티팩트:
  `com.liferay.portal.search.api`)에서:
  * `com.liferay.portal.search.filter`:
    * `ComplexQueryPart`
    * `TermsSetFilter`
  * `com.liferay.portal.search.geolocation.*`
  * `com.liferay.portal.search.highlight.*`
  * `com.liferay.portal.search.query.function.*`
  * `com.liferay.portal.search.query.*`:
  * `com.liferay.portal.search.script.*`
  * `com.liferay.portal.search.significance.*`
  * `com.liferay.portal.search.sort.*`: `Sort`, `FieldSort` 및 `ScoreSort`만 지원됩니다.
* 포털 검색 엔진 어댑터 API(모듈: `portal-search-engine-adapter-api`,
  아티팩트: `com.liferay.portal.search.engine.adapter.api`)
  * `com.liferay.portal.search.engine.adapter.cluster.*`
  * `com.liferay.portal.search.engine.adapter.document.UpdateByQueryDocumentRequest`
  * `com.liferay.portal.search.engine.adapter.index.*`: `RefreshIndexRequest`만 지원됩니다.
  * `com.liferay.portal.search.engine.adapter.search.*`:
    * `MultisearchSearchRequest`
    * `SuggestSearchRequest`
  * `com.liferay.portal.search.engine.adapter.snapshot.*`

```{note}
Liferay Commerce에는 Elasticsearch 커넥터에서만 사용할 수 있는 `TermsSetFilter` 구현이 필요합니다.
```
