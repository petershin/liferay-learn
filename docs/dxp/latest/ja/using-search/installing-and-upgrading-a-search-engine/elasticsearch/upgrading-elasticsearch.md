---
toc:
  - ./upgrading-elasticsearch/upgrading-search-infrastructure.md
  - ./upgrading-elasticsearch/upgrading-to-elasticsearch-8.md
  - ./upgrading-elasticsearch/upgrading-to-elasticsearch-7.md
  - ./upgrading-elasticsearch/backing-up-elasticsearch.md
---
# Elasticsearchのアップグレード

LiferayはElasticsearch 8に対応しています。 [互換性マトリックス ](https://help.liferay.com/hc/ja/sections/360002103292-Compatibility-Matrix) では、最新のサポートの詳細を提供しています。

```{important}
Solrの統合はLiferay 7.3で廃止予定となり、7.4で削除され、Elasticsearchの統合に置き換えられました。 Elasticsearchに移行するには、[Elasticsearchのセットアップ](./getting-started-with-elasticsearch.md)、そして[Liferayの接続 ](./connecting-to-elasticsearch.md)が必要です。
```

```{important}
Elasticsearch 6.xはLiferay 7.3+ではサポートされていません。
```

アップグレードを計画する前に、 [検索機能インフラストラクチャのアップグレード](./upgrading-elasticsearch/upgrading-search-infrastructure.md)をお読みください。 古いLiferay/Elasticsearchシステムをサポートされている最新の検索スタックにアップグレードするために必要な手順の概要を提供しています。 [Elasticsearchをアップグレードする](./upgrading-elasticsearch/upgrading-to-elasticsearch-8.md)前に、必ず [検索インデックスのバックアップを](./upgrading-elasticsearch/backing-up-elasticsearch.md)とってください。

- [検索機能インフラストラクチャのアップグレード](upgrading-elasticsearch/upgrading-search-infrastructure.md)
- [Elasticsearch 8へのアップグレード](upgrading-elasticsearch/upgrading-to-elasticsearch-8.md)
- [Elasticsearch 7へのアップグレード](upgrading-elasticsearch/upgrading-to-elasticsearch-7.md)
- [Elasticsearchのバックアップ](upgrading-elasticsearch/backing-up-elasticsearch.md)
