---
toc:
  - ./elasticsearch/getting-started-with-elasticsearch.md
  - ./elasticsearch/installing-elasticsearch.md
  - ./elasticsearch/connecting-to-elasticsearch.md
  - ./elasticsearch/securing-elasticsearch.md
  - ./elasticsearch/exercise-run-liferay-and-elasticsearch-using-docker.md
  - ./elasticsearch/troubleshooting-elasticsearch-installation.md
  - ./elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md
  - ./elasticsearch/upgrading-elasticsearch.md
  - ./elasticsearch/elasticsearch-connector-configuration-reference.md
  - ./elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md
---
# Elasticsearch

Elasticsearchは、Liferayがデフォルトで使用する、拡張性の高いフルテキスト検索エンジンです。 ElasticsearchはLiferayにバンドルされており、本番環境以外の目的で使用されます。 本番環境では、Liferayは別のリモートサーバーで動作するElasticsearchを必要とします。

```{important}
Liferayのバージョンと互換性のあるElasticsearchのバージョンとサーバー構成は、常に [互換性マトリックス](https://help.liferay.com/hc/ja/sections/360002103292-Compatibility-Matrix) で確認してください。
```

```{important}
Elasticsearch 6 コネクタ (Liferay 7.2 で利用可能) を保護するには、 [Liferay Enterprise Search](../liferay-enterprise-search.md) でのみ利用できる追加モジュールが必要です。 Elasticsearch 7+ 用のコネクタには、認証され暗号化された Elasticsearch 接続を設定するためのサポートが含まれています。
```

## インストール

- [Elasticsearchを開始する](elasticsearch/getting-started-with-elasticsearch.md)
- [Elasticsearchのインストール](elasticsearch/installing-elasticsearch.md)
- [Elasticsearchへの接続](elasticsearch/connecting-to-elasticsearch.md)
- [演習：Dockerを使用してLiferay とElasticsearchを実行する](elasticsearch/exercise-run-liferay-and-elasticsearch-using-docker.md)
- [Elasticsearchインストールのトラブルシューティング](elasticsearch/troubleshooting-elasticsearch-installation.md)
- [サイドカーまたはEmbedded モードのElasticsearchの使用](elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md)

- [**Liferayのクラスタリング**] [Liferayクラスターに検索エンジンを追加する](../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/example-creating-a-simple-dxp-cluster.md#start-a-search-engine-server)

## アップグレード

- [Elasticsearchのアップグレード](elasticsearch/upgrading-elasticsearch.md)
- [検索インフラストラクチャのアップグレード](elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md)
- [Elasticsearchのバックアップ](elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md)
- [Elasticsearch 8へのアップグレード](elasticsearch/upgrading-elasticsearch/upgrading-to-elasticsearch-8.md)
- [Elasticsearch 7へのアップグレード](elasticsearch/upgrading-elasticsearch/upgrading-to-elasticsearch-7.md)

## 保護

- [Elasticsearchの保護](elasticsearch/securing-elasticsearch.md)

## 構成

- [Liferay Elasticsearchコネクターの詳細設定](elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.md)
- [Elasticsearchコネクターの設定リファレンス](elasticsearch/elasticsearch-connector-configuration-reference.md)
