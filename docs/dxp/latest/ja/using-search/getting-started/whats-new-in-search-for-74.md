# 7.4の検索の新機能

7.4リリースでは、Liferayの検索インフラにいくつかのハイライトと新機能が追加されています。 新機能としては、Liferay CE 7.4 GA4およびLiferay DXP 7.4 GA1向けの製品に追加されたものがあります。

```{tip}
7.4 DXP アップデートおよび Portal GA のリリースで追加された機能については、リリースノートを参照してください。

Liferay DXP：リリースノートは、 [カスタマーポータルのLiferay DXPリリースノートのページ](https://customer.liferay.com/dxp-release-notes) に掲載されています。

Liferay Portal：リリースノートは、Liferay Communityのサイトで [リリース告知ブログ](https://liferay.dev/blogs/-/blogs) として提供されています。 例えば、 [Liferay Portal 7.4 GA43 release announcement](https://liferay.dev/blogs/-/blogs/liferay-portal-7-4-ga43-and-liferay-commerce-4-0-ga43-release) をご覧ください。
```

## Elasticsearch7の統合

Elasticsearch 7はLiferay 7.4でサポートされています。 [検索エンジン互換性マトリクス](https://help.liferay.com/hc/ja/articles/360016511651) で、対応する最小バージョン、クライアントバージョン、対応する最新のElasticsearchバージョンなど、最新情報を確認してください。

![Elasticsearch 7.15 は Liferay DXP 7.4 GA1 で動作するようサポートされています。](./whats-new-in-search-for-74/images/03.png)

```{important}
*Liferay CE/DXP 7.4ではElasticsearch 6.xはサポートされていません。
*Liferay CE/DXP 7.4ではSolrはサポートされていません。
```

## 検索インフラストラクチャ & 管理

### 仮想インスタンスの独立再インデックス化

Liferay 7.4 以降、サーバー管理者は再インデックスアクションの範囲を特定の [仮想インスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)に制限することが可能です。 アクションをインデックスがどのインスタンスに適用されるかを選択します。

1. グローバルメニュー &rarr; ［コントロールパネル］ &rarr; ［検索機能］を開き、［アクションをインデックスする］タブをクリックします。
1. ［Execution Scope］タブを使用して、インデックスを再作成するインスタンスを選択します。

   ![インデックスを再作成するインスタンスを選択します。](./whats-new-in-search-for-74/images/01.png)

## 検索ウィジェット

### Liferay Objectの検索

[Liferay Objects](../../building-applications/objects.md)の検索をサポートするために、いくつかの検索ウィジェットが拡張されました。

* タイプファセットには自動的に公開オブジェクトが含まれます。

   ![公開オブジェクトがタイプファセットウィジェットに追加されます。](./whats-new-in-search-for-74/images/05.png)

* 検索結果ウィジェットには、オブジェクトエントリのタイトルと概要が自動的に表示されます。

   ![オブジェクトエントリには、タイトルとコンテンツの概要が表示されます。](./whats-new-in-search-for-74/images/06.png)

<!-- * If configured in the Object, a display page can be shown when the Object Entry is clicked in Search Results. -->

Liferay Objectsと検索について詳しく知りたい方は、 [Liferay Objectsの検索](./searching-for-content.md#searching-for-liferay-objects) をご覧ください。

## 検索の調整

> **DXPサブスクライバー**

### 検索の調整データのデータベースへの格納

DXP Liferay 7.4からは、結果ランキングと同義語セットのデータがLiferayデータベースに保存され、検索管理パネルからの再インデックスアクションを使用して、各アプリケーションのインデックスに適切なデータを入力することができるようになりました。 以前のバージョンでは、これらのアプリケーションのプライマリーデータストレージとしてインデックスが使用されていました。

これがアップグレード作業にどのように影響するかについては、 [検索機能インフラストラクチャのアップグレード](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md) および [Elasticsearchのバックアップ](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md)をご覧ください。

![他のLiferay DXPアセットと同様に、検索の調整データのインデックスを再作成します。](./whats-new-in-search-for-74/images/02.png)

## Liferay Enterprise Search（LES）

> [**LESサブスクライバー**](https://www.liferay.com/products/dxp/enterprise-search)

### LESのインストールを簡素化

Liferay DXP 7.4より、 [Liferay Enterprise Search (LES)](../liferay-enterprise-search.md)アプリケーションは、すべてのLiferay DXPバンドルとDockerコンテナに含まれています。 LESはデフォルトで有効になっており、追加のインストール手順は必要ありません。 ただし、Liferayの公式サポートや追加特典を受けるためには、LESのアドオン・サブスクリプションを購入する必要があります。 LESアプリケーションのメンテナンスとアップデートは、Liferay DXPのアップデートと一緒に配信されます。

![クラスター横断レプリケーションなどのLESアプリは、Liferay DXP 7.4 でインストールされます。](./whats-new-in-search-for-74/images/04.png)

## DXP 7.4へのアップグレード

DXPの旧バージョンから7.4へのアップグレードは、ほとんどのセットアップで特別な配慮は必要ありません。 ただし、Liferay Enterprise Searchや検索の調整を使用する場合は、以下の点を考慮してください。

1. 検索の調整アプリケーションは、以前のバージョンではデータストレージにElasticsearchのインデックスを使用していましたが、データベースのテーブルによってバックアップされるようになりました。 詳細は、 [検索機能インフラストラクチャのアップグレード](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md) を参照してください。
1. Liferay Enterprise Searchアプリケーションは、Liferay DXPにバンドルされています。 7.4へのアップグレードの際、追加のインストール手順は必要ありません。

## 関連トピック

* [検索機能インフラストラクチャのアップグレード](../installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/upgrading-search-infrastructure.md)
* [7.4 旧バージョンと非互換の変更](../../liferay-internals/reference/7-4-breaking-changes.md)
