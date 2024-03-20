# Elasticsearch 8へのアップグレード

{bdg-secondary}`7.4 u81+, 7.3 u31+`

Elasticsearch 8は、最新のLiferay 7.4アップデートとGAリリースでサポートされ、推奨されています。 特定のバージョンの互換性の詳細については、 [Search Engine Compatibility Matrix](https://help.liferay.com/hc/ja/articles/360016511651) を参照してください。

```{important}
Elasticsearchをアップグレードする前に、既存のデータをバックアップしてください。 アップグレード中またはアップグレード後に何か問題が発生した場合は、破損していないインデックスのスナップショットを使用して以前のバージョンにロールバックしてください。 [Elasticsearchのバックアップ](./backing-up-elasticsearch.md) の手順に従ってください。
```

既存のElasticsearch 7サーバ（またはクラスタ）をElasticsearch 8にアップグレードするには、

1. [Liferay Companyとシステムインデックスをバックアップします](./backing-up-elasticsearch.md) 。

1. [検索の調整のアプリケーション固有のインデックスをバックアップします](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) （同義語セットと結果ランキング）。

1. [新しいElasticsearchのインストールを準備する](../installing-elasticsearch.md).

1. [Elasticsearch のアップグレード](#upgrading-elasticsearch)

1. X-Packセキュリティを使用している場合、Elasticsearch 8ではデフォルトで有効になっています。 無効にするには、このプロパティを追加する：

   ```yaml
   xpack.security.enabled: false
   ```

   セキュリティ設定の範囲の詳細については、 [Elasticsearchの保護](../securing-elasticsearch.md) を参照してください。

1. Connector to Elasticsearch 8を設定してElasticsearchに接続します。

1. Liferayを再起動し、すべての検索インデックスとスペルチェックインデックスを再作成します。

   ```{note}
   ローリングアップグレードを行った場合は、インデックスの再作成は必要ありません。
   ```

1. スナップショットから検索調整インデックスを復元します。 以前にこれらの機能を使用していた場合は、これらのインデックスにデータが保存されている可能性があります。

1. 検索調整エントリが引き継がれていることを確認します。

## Elasticsearchのアップグレード

ローリング再スタート可能なバージョンを使用している場合、 [ローリングアップグレード](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/rolling-upgrades.html) を行うことが、ダウンタイムを最小限に抑え、すべてのデータのインデックスを再作成する必要がなくなるため、Elasticsearch クラスタをアップグレードするおすすめの方法です。 それ以外の場合は、 [フルクラスター再起動アップグレード](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/restart-upgrade.html) ガイドに従ってください。

新しいElasticsearchサーバーをインストールし、アップグレード前のデータにインデックスしたい場合、Liferay [データベースがアップグレード](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md) されると、UIから [再インデックス](#restart-liferay-and-reindex) をトリガーすることで、ほとんどのLiferayインデックスを復元できます。 ただし、検索の調整（結果ランキングと同義語）インデックス、およびデータベースストレージにバックアップされていないカスタムインデックスは、 [アップグレード前のインデックスのスナップショット](./backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) から復元する必要があります。

## Liferayを再起動してインデックスを再作成する

LiferayがElasticsearchクラスターに接続されたら、Liferayを再起動し、該当するインデックスを新しいElasticsearchインストールに再インデックスします。

1. Liferayを再起動します。

1. 完全なクラスタ再起動のアップグレードを実行した場合は、会社、システム、およびスペルチェックのインデックスの再作成が必要です。 グローバルメニュー(![グローバルメニュー](../../../../images/icon-applications-menu.png))から、 **コントロールパネル** &rarr; **設定** &rarr; **検索** に移動します。 すべての検索 イ ンデ ッ ク ス を再インデ ッ ク ス ] 項目の **実行** をク リ ック。

1. 完全なクラスタ再起動のアップグレードを実行した場合は、 [Workflow Metrics インデックスのインデックスを再作成する必要があります。](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics) : Global Menu (![Global Menu](../../../../images/icon-applications-menu.png)) から、 **Applications** &rarr; **Workflow---Metrics** に移動します。 設定メニュー (![Options](../../../../images/icon-options.png)) を開き、 **Reindex All** をクリックします。 各仮想インスタンスについて、この作業を繰り返します。

これにより、Liferayデータベースに保存されているデータから作成されたインデックスが復元されます。 プライマリストレージとして使用されるインデックスを復元するには、 [Elasticsearchのバックアップ](./backing-up-elasticsearch.md) を参照してください。
