# Elasticsearch 7へのアップグレード

{bdg-secondary}`7.1と7.2`

Liferay 7.3と7.4はElasticsearch 7をすぐにサポートします。 お使いの Liferay インストールで利用可能な最新の検索エンジンのバージョンは、 [Search Engine Compatibility Matrix](https://help.liferay.com/hc/ja/articles/360016511651) をご覧ください。

Liferay 7.2 では、Elasticsearch 7 は [Liferay Connector to Elasticsearch 7](https://web.liferay.com/marketplace/-/mp/application/170390307) (version `3.x`) を介してサポートされています。 Liferay 7.3以降へのアップグレード、または既存の7.2検索エンジンをElasticsearch 7に移行する場合、Elasticsearchサーバーをアップグレードする必要があります。 新しいLiferay7.2システムをセットアップするには、Elasticsearch 7をインストールし、 [インストールガイド](../getting-started-with-elasticsearch.md) に従います。

```{important}
Elasticsearchをアップグレードする前に、既存のデータをバックアップしてください。 アップグレード中またはアップグレード後に何か問題が発生した場合は、破損していないインデックスのスナップショットを使用して以前のバージョンにロールバックしてください。 [Elasticsearchのバックアップ](./backing-up-elasticsearch.md) の手順に従ってください。
```

既存のElasticsearchサーバー（またはクラスター）をElasticsearch 7にアップグレードするには、

1. [Liferay Companyとシステムインデックスをバックアップします](./backing-up-elasticsearch.md)。

1. [検索の調整のアプリケーション固有のインデックスをバックアップします](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) （同義語セットと結果ランキング）。

1. [Elasticsearchをインストールして設定します](../installing-elasticsearch.md)。

1. [Elasticsearch のアップグレード](#upgrading-elasticsearch)

1. X-Pack Securityを使用している場合は、有効になっていることを確認してください。

   ```yaml
   xpack.security.enabled: true
   ```

   セキュリティ設定の範囲の詳細については、 [Elasticsearchの保護](../securing-elasticsearch.md) を参照してください。

1. \[7.2 only\]. [同梱の Liferay Connector to Elasticsearch 6](#blacklisting-elasticsearch-6) をブラックリストに登録し、 [install](../connecting-to-elasticsearch.md#install-the-elasticsearch-7-connector) the Connector to Elasticsearch 7.

1. Connector to Elasticsearch 7を設定してElasticsearchに接続します。

1. Liferayを再起動し、すべての検索インデックスとスペルチェックインデックスを再作成します。

1. スナップショットから検索調整インデックスを復元します。 以前にこれらの機能を使用していた場合は、これらのインデックスにデータが保存されている可能性があります。

1. 検索調整エントリが引き継がれていることを確認します。

## Elasticsearchのアップグレード

ローリング再起動が可能なバージョン（`6.8.x`）を使用している場合、 [ローリングアップグレード](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rolling-upgrades.html) を行うことが、Elasticsearchクラスタをアップグレードする推奨方法です。 それ以外の場合は、 [フルクラスター再起動アップグレード](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/restart-upgrade.html) ガイドに従ってください。

新しいElasticsearchサーバーをインストールし、アップグレード前のデータにインデックスしたい場合、Liferay [データベースがアップグレード](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md) されると、UIから [再インデックス](#restart-liferay-and-reindex) をトリガーすることで、ほとんどのLiferayインデックスを復元できます。 ただし、検索の調整（結果ランキングと同義語）インデックス、およびデータベースストレージにバックアップされていないカスタムインデックスは、 [アップグレード前のインデックスのスナップショット](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) から復元する必要があります。

## Elasticsearch 6のブラックリストへの登録

これは、Liferay 7.2を実行している場合にのみ必要です。

1. 以下の設定ファイルを作成します

   ```bash
   com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
   ```

1. 以下のコンテンツを指定します

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

1. ファイルをサーバーの `deploy` フォルダーにコピーしてデプロイします。

## Liferayを再起動してインデックスを再作成する

LiferayがElasticsearchクラスターに接続されたら、Liferayを再起動し、該当するインデックスを新しいElasticsearchインストールに再インデックスします。

1. Liferayを再起動します。

1. 会社、システム、およびスペルチェックのインデックスを再作成します。 グローバルメニュー(![グローバルメニュー](../../../../images/icon-applications-menu.png))から、 **コントロールパネル** &rarr; **設定** &rarr; **検索** に移動します。 すべての検索インデックス(All Search Indexes)]項目の[再インデックス(Reindex)]をクリックします。

1. [Workflow Metrics indexes](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics) : Global Menu (![Global Menu](../../../../images/icon-applications-menu.png)) から **Applications** &rarr; **Workflow---Metrics** に移動します。 設定メニュー (![Options](../../../../images/icon-options.png)) を開き、 **Reindex All** をクリックします。 各仮想インスタンスについて、この作業を繰り返します。

これにより、Liferayデータベースに保存されているデータから作成されたインデックスが復元されます。 プライマリストレージとして使用されるインデックスを復元するには、 [Elasticsearchのバックアップ](./backing-up-elasticsearch.md) を参照してください。

## Liferay 7.2：Elasticsearch 6への復帰

Liferay 7.2を使用していて、Elasticsearch 7へのアップグレード中に回復不能な障害が発生した場合は、Elasticsearch 6にロールバックして再グループ化できます。

Elasticsearch 6と7は現在2つの別個のインストールであるため、この手順にはいくつかのステップが必要です。

1. Liferay Connector to Elasticsearch 7を停止します。

1. Elasticsearch 7 を停止し、Elasticsearch 6 の `elasticsearch.yml` とコネクタアプリが同じポート（デフォルトでは 9200）を使用するように設定されていることを確認してください。

1. インストールの `osgi` フォルダから Elasticsearch 6 用のブラックリスト設定ファイルを削除します。

1. Elasticsearchサーバーを起動してから、Liferay Connector to Elasticsearch 6を再起動します。

アップグレードが完了したら、 [Liferayのバージョンで利用できる 新しい検索機能](../../../getting-started.html) をご覧ください。
