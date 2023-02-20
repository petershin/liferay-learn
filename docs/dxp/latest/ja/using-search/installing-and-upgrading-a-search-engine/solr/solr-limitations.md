# Solrの制限事項

LiferayのSolr実装には限界があります。 検索エンジンにSolrを選択した場合、Liferayの一部の機能やAPIが使用できません。 [Elasticsearch](../elasticsearch/getting-started-with-elasticsearch.md) をインストールすると、最高の体験ができます。

## 検索結果 品質

Liferayの検索機能には、Elasticsearch固有のAPIとマッピングが活用されています。 これらの機能の一部はSolrに含まれていないため、SolrをLiferayの検索エンジンとして使用する場合、検索結果の品質が低下することが予想されます。

例えば、Liferayの言語認識ソート動作は、[ICU Analysis Plugin from Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/plugins/7.x/analysis-icu-collation-keyword-field.html) のためにのみ存在する照合ルールに依存しています。Solrで検索するとき、特にフィールド値が発音区分符号を含むとき、いくつかの非最適なソート動作が予想されます。

## エンドユーザー機能の制限

LiferayのSolr統合には限界があります。 以下の機能を利用するためには、Elasticsearchが必要です。

* [Liferay Object](../../../building-applications/objects.md)
* [Liferay Commerce](https://learn.liferay.com/commerce/latest/en/index.html)
* [ワークフロー統計情報](../../../process-automation/workflow/using-workflows/using-workflow-metrics.md)
* [カスタムフィルター検索ウィジェット](../../search-pages-and-widgets/search-results/filtering-search-results.md)
* [低レベル検索オプションウィジェット](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md)
* [検索のチューニング：検索結果のカスタマイズ](../../search-administration-and-tuning/result-rankings.md)
* [検索チューニング：同義語](../../search-administration-and-tuning/synonym-sets.md)
* [コンテンツダッシュボード](../../../content-authoring-and-management/content-dashboard.md)
* [類似結果](../../search-pages-and-widgets/similar-results.md)
* すべての [Liferay Enterprise Search](../../liferay-enterprise-search.md) アプリケーションを含みます。 
     * クラスター横断レプリケーション
   * 検索エクスペリエンス
   * Learning to Rank
   * モニタリング

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
