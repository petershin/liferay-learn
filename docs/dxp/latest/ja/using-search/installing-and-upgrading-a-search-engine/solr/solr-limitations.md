# Solrの制限事項

LiferayのSolr実装には限界があります。 検索エンジンにSolrを選択した場合、Liferayの一部の機能やAPIは使用できません。 優れたエクスペリエンスを得るには [Elasticsearch](../elasticsearch/getting-started-with-elasticsearch.md) をインストールしてください。

## 検索結果の品質

Liferayの検索機能には、Elasticsearch固有のAPIとマッピングが活用されています。 これらの機能の一部はSolrに含まれていないため、SolrをLiferayの検索エンジンとして使用する場合、検索結果の品質が低下することが予想されます。

例えば、Liferayの言語認識ソート動作は、 [ElasticsearchからのICU Analysis Plugin](https://www.elastic.co/guide/en/elasticsearch/plugins/8.8/analysis-icu-collation-keyword-field.html) のためにのみ存在する照合ルールに依存しています。 Solrで検索する場合、特にフィールド値に発音区分符号が含まれていると、最適でないソート動作が予想されます。

## エンドユーザー機能の制限

LiferayのSolr統合には限界があります。 以下の機能を利用するためには、Elasticsearchが必要です。

* [Liferay オブジェクト](../../../building-applications/objects.md)
* [Commerce](https://learn.liferay.com/w/commerce/index)
* [ワークフロー・メトリクス](../../../process-automation/workflow/using-workflows/using-workflow-metrics.md)
* [カスタムフィルター検索ウィジェット](../../search-pages-and-widgets/search-results/filtering-search-results.md)
* [低レベル検索オプション・ウィジェット](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md)
* [検索チューニング：検索結果のカスタマイズ](../../search-administration-and-tuning/result-rankings.md)
* [チューニングを検索類義語](../../search-administration-and-tuning/synonym-sets.md)
* [コンテンツ・ダッシュボード](../../../content-authoring-and-management/content-dashboard.md)
* [類似の結果](../../search-pages-and-widgets/similar-results.md)
* [並行および同期再インデックス・モード](../../search-administration-and-tuning/reindexing-modes.md)
* 以下を含むすべての [Liferay Enterprise Search](../../liferay-enterprise-search.md) アプリケーション：

  * クラスター横断レプリケーション
  * 検索エクスペリエンス
  * Learning to Rank
  * モニタリング

## 開発者機能の制限

以下のAPIは、現在LiferayのSolrコネクターではサポートされていません。

* ポータルコアから（モジュール: `portal-kernel`、アーティファクト:
  `com.liferay.portal.kernel` ）：
  * `com.liferay.portal.kernel.search.generic.NestedQuery`
  * `com.liferay.portal.kernel.search.filter`：
    * `ComplexQueryPart`
    * `GeoBoundingBoxFilter`
    * `GeoDistanceFilter`
    * `GeoDistanceRangeFilter`
    * `GeoPolygonFilter`
* Portal Search API (Module: `portal-search-api`, Artifact:
  `com.liferay.portal.search.api`) から：
  * com.liferay.portal.search.filter`：
    * `ComplexQueryPart`
    * `TermsSetFilter`
  * `com.liferay.portal.search.geolocation.*`
  * `com.liferay.portal.search.highlight.*`
  * `com.liferay.portal.search.query.function.*`
  * `com.liferay.portal.search.query.*`：
  * `com.liferay.portal.search.script.*`
  * `com.liferay.portal.search.significance.*`
  * `com.liferay.portal.search.sort.*`: `Sort`, `FieldSort`, `ScoreSort` のみがサポートされています。
* ポータル検索エンジンアダプタ API (Module：`Portal-search-engine-adapter-api`、
      Artifact: `com.liferay.portal.search.engine.adapter.api`)
  * `com.liferay.portal.search.engine.adapter.cluster.*`
  * `com.liferay.portal.search.engine.adapter.document.UpdateByQueryDocumentRequest`
  * `com.liferay.portal.search.engine.adapter.index.*`: `RefreshIndexRequest` のみがサポートされています。
  * `com.liferay.portal.search.engine.adapter.search.*`:
    * `MultisearchSearchRequest`
    * `SuggestSearchRequest`
  * `com.liferay.portal.search.engine.adapter.snapshot.*`

```{note}
Liferay Commerce は Elasticsearch コネクタでのみ利用可能な `TermsSetFilter` 実装を必要とします。
```
