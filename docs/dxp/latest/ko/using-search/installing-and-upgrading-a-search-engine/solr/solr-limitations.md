---
uuid: cbe0c574-b1eb-42ff-a018-99167277e9fe
---

# 솔라 제한 사항

Liferay의 Solr 구현에는 제한이 있습니다. Solr를 검색 엔진으로 선택하면 일부 Liferay 기능 및 API를 사용할 수 없습니다. 최상의 경험을 위해 [Elasticsearch](../elasticsearch/getting-started-with-elasticsearch.md) 설치하십시오.

## 검색 결과 품질

Elasticsearch 관련 API 및 매핑은 Liferay의 검색 기능에서 활용되고 있습니다. 이러한 기능 중 일부는 Solr에 포함되어 있지 않기 때문에 Solr를 Liferay의 검색 엔진으로 사용할 때 검색 결과의 품질이 낮을 것으로 예상됩니다.

예를 들어 Liferay의 언어 인식 정렬 동작은 [Elasticsearch의 ICU 분석 플러그인](https://www.elastic.co/guide/en/elasticsearch/plugins/7.x/ 때문에 존재하는 조합 규칙에만 의존합니다. analysis-icu-collation-keyword-field.html) . Solr에서 검색할 때 특히 필드 값에 분음 기호가 포함된 경우 최적이 아닌 일부 정렬 동작이 예상됩니다.

## 최종 사용자 기능 제한

Liferay의 Solr 통합에는 제한이 있습니다. 다음 기능을 사용하려면 Elasticsearch가 필요합니다.

* [Liferay Objects](../../../building-applications/objects.md)
* [커머스](https://learn.liferay.com/commerce/latest/ko/index.html)
* [워크플로 지표](../../../process-automation/workflow/using-workflows/using-workflow-metrics.md)
* [사용자 정의 필터 검색 위젯](../../search-pages-and-widgets/search-results/filtering-search-results.md)
* [낮은 수준의 검색 옵션 위젯](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md)
* [검색 조정: 검색 결과 사용자 지정](../../search-administration-and-tuning/result-rankings.md)
* [검색 조정: 동의어](../../search-administration-and-tuning/synonym-sets.md)
* [컨텐츠 대시보드](../../../content-authoring-and-management/content-dashboard.md)
* [유사 결과](../../search-pages-and-widgets/similar-results.md)
* 다음을 포함한 모든 [라이프레이 엔터프라이즈 검색](../../liferay-enterprise-search.md) 애플리케이션 
     * 교차 클러스터 복제
   * 경험 검색
   * 순위 학습
   * 모니터링

## 개발자 기능 제한

다음 API는 현재 Liferay의 Solr 커넥터에서 지원되지 않습니다.

* Portal Core에서(모듈: `portal-kernel`, 아티팩트: `com.liferay.portal.kernel`): 
    * `com.liferay.portal.kernel.search.generic.NestedQuery`
  * `com.liferay.portal.kernel.search.filter`: 
        * `ComplexQueryPart`
    * `GeoBoundingBoxFilter`
    * `GeoDistanceFilter`
    * `GeoDistanceRangeFilter`
    * `GeoPolygonFilter`
* 포털 검색 API에서(모듈: `Portal-search-api`, 아티팩트: `com.liferay.portal.search.api`): 
    * `com.liferay.portal.search.filter`: 
        * `ComplexQueryPart`
    * `TermsSetFilter`
  * `com.liferay.portal.search.geolocation.*`
  * `com.liferay.portal.search.highlight.*`
  * `com.liferay.portal.search.query.function.*`
  * `com.liferay.portal.search.query.*`:
  * `com.liferay.portal.search.script.*`
  * `com.liferay.portal.search.significance.*`
  * `com.liferay.portal.search.sort.*`: `Sort`,`FieldSort`, `ScoreSort` 만 지원
* 포털 검색 엔진 어댑터 API(모듈: `Portal-search-engine-adapter-api`, 아티팩트: `com.liferay.portal.search.engine.adapter.api`) 
    * `com.liferay.portal.search.engine.adapter.cluster.*`
  * `com.liferay.portal.search.engine.adapter.document.UpdateByQueryDocumentRequest`
  * `com.liferay.portal.search.engine.adapter.index.*`: `RefreshIndexRequest` 만 지원
  * `com.liferay.portal.search.engine.adapter.search.*`: 
        * `MultisearchSearchRequest`
    * `SuggestSearchRequest`
  * `com.liferay.portal.search.engine.adapter.snapshot.*`

```{note}
Liferay Commerce에는 Elasticsearch 커넥터에서만 사용할 수 있는 'TermsSetFilter' 구현이 필요합니다.
```
