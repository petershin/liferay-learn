# Solrの制限事項

```{important}
LiferayのSolrサポートは非推奨です。 [Elasticsearch](../elasticsearch/getting-started-with-elasticsearch.md) への移行を検討してください。
```

## エンドユーザー機能の制限

LiferayのSolr統合には、Liferay Commerceおよび以下の機能の使用に影響する制限があります。 次の機能を使用するには、Elasticsearchが必要です。

* [ワークフロー統計情報](../../../process-automation/workflow/using-workflows/using-workflow-metrics.md)
* [カスタムフィルター検索ウィジェット](../../search-pages-and-widgets/search-results/filtering-search-results.md)
* [低レベル検索オプションウィジェット](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md)
* [検索のチューニング：検索結果のカスタマイズ](../../search-administration-and-tuning/result-rankings.md)
* [検索チューニング：同義語](../../search-administration-and-tuning/synonym-sets.md)

## 開発者機能の制限

以下のAPIは、現在LiferayのSolrコネクターではサポートされていません。

* ポータルコアから（モジュール： `portal-kernel`、アーティファクト： `com.liferay.portal.kernel`）：
  * `com.liferay.portal.kernel.search.generic.NestedQuery`
  * `com.liferay.portal.kernel.search.filter`：
    * `ComplexQueryPart`
    * `GeoBoundingBoxFilter`
    * `GeoDistanceFilter`
    * `GeoDistanceRangeFilter`
    * `GeoPolygonFilter`
* ポータル検索APIから（モジュール： `portal-search-api`、アーティファクト： `com.liferay.portal.search.api`）：
  * `com.liferay.portal.search.filter`：
    * `ComplexQueryPart`
    * `TermsSetFilter`
  * `com.liferay.portal.search.geolocation.*`
  * `com.liferay.portal.search.highlight.*`
  * `com.liferay.portal.search.query.function.*`
  * `com.liferay.portal.search.query。*`：
  * `com.liferay.portal.search.script.*`
  * `com.liferay.portal.search.significance.*`
  * `com.liferay.portal.search.sort *`：`ソート`、`FieldSort`および `ScoreSort`のみがサポートされています。
* ポータル検索エンジンアダプターAPI（モジュール： `portal-search-engine-adapter-api`、アーティファクト： `com.liferay.portal.search.engine.adapter.api`）
  * `com.liferay.portal.search.engine.adapter.cluster.*`
  * `com.liferay.portal.search.engine.adapter.document.UpdateByQueryDocumentRequest`
  * `com.liferay.portal.search.engine.adapter.index。*`： `RefreshIndexRequest` のみがサポートされます
  * `com.liferay.portal.search.engine.adapter.search.*`:
    * `MultisearchSearchRequest`
    * `SuggestSearchRequest`
  * `com.liferay.portal.search.engine.adapter.snapshot.*`

```{note}
Liferay Commerceは、Elasticsearchコネクタでのみ利用可能な `TermsSetFilter` の実装を必要とします。
```
