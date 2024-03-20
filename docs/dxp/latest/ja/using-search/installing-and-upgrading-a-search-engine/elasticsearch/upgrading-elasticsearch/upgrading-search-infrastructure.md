# 検索インフラストラクチャのアップグレード

Liferayをアップグレードする際には、Elasticsearchを使用する際の検索エクスペリエンスを考慮する必要があります。正確な手順は既存の検索エンジンのインストールとLiferayのバージョンによりますが、まずは[既存のインデックスをバックアップする](./backing-elasticsearch.md)ことから始めましょう。

* [検索エンジン互換性マトリクス](https://help.liferay.com/hc/ja/articles/360016511651) をご参照ください。 : サポートされている最新のElasticsearchバージョンを実行することが常に推奨されています。
* Liferay 7.4から、LES（Liferay Enterprise Search）アプリケーションはLiferay DXPにバンドルされています。 追加のインストール手順は必要ありません。 詳しくは、 [Liferay Enterprise Searchの有効化](../../../liferay-enterprise-search/activating-liferay-enterprise-search.md) をご覧ください。
* すでにサポートされているElasticsearchのバージョンをご利用の場合は、既存のElasticsearchインスタンスをアップデートすることなく、そのままご利用いただけます。
* Liferay 7.4 以降、検索の調整（同義語セットおよび結果ランキング）インデックスはデータベーステーブルでバックアップされます。 Liferayのアップグレード中に検索エンジンがLiferayに接続されると、データがデータベースにプロパゲートされるようになります。 新しいElasticsearchインスタンスをセットアップする場合、 [検索調整インデックスのバックアップと復元](./backing-up-elasticsearch.md) を行い、その後、 [Groovyスクリプト](#importing-the-search-tuning-indexes-in-7-4) を実行してインデックスデータを新しいデータベーステーブルに手動でインポートしなければなりません。

## アップグレード手順

```{important}
[これらの手順を進める前に、検索インデックス](./backing-up-elasticsearch.md) をバックアップしてください。
```

1. お使いのシステムが少なくともElasticsearchの最小サポートバージョンであることを確認してください。 そうでない場合は、 [サポートされている最新のElasticsearch](https://help.liferay.com/hc/en-us/articles/360016511651) に [アップグレード](upgrading-to-elasticsearch-8.md) してください。 <!--1--> . 新しいElasticsearchクラスタをインストールし、アップグレードしたLiferayに接続することは可能ですが、ElasticsearchクラスタにLiferay DXP 7.2や7.3の検索の調整機能用のインデックスのようにプライマリストレージとして使用するインデックスがあった場合、一部のデータが失われる可能性があります。 [Search Tuning Indexes for Liferay 7.2 and 7.3 のバックアップとリストア](backing-up-elasticsearch.md#backing-up-and-restoring-search-tuning-indexes-for-liferay-7-2-and-7-3) と [Search Tuning Indexes in 7.4 のインポート](#importing-the-search-tuning-indexes-in-7-4) を参照してください。

1. [LiferayとElasticsearch を接続](../connecting-to-elasticsearch.md) し、 [セキュリティ](../securing-elasticsearch.md) を設定します。

1. [Liferayをアップグレードします。](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics.md)

1. [検索インデックスとスペルチェック辞書のインデックスを再作成する。](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/post-upgrade-considerations.md)

   [ワークフロー統計情報インデックス](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics) を必ず再作成してください。

1. アップグレードされたシステムで [検索エクスペリエンスをテスト](#test-the-upgraded-search-experience) し、すべてが期待どおりに動作していることを確認します。

Liferay 7.4でLiferay Enterprise Searchアプリケーションを使用している場合は、 [Liferay DXPにバンドル](../../../liferay-enterprise-search/activating-liferay-enterprise-search.md) されているので、インストール手順は必要ありません。 Liferay 7.2または7.3を使用している場合は、手順を読みながらアプリケーションをインストールしてください。

## Liferay 7.2および7.3でのLiferay Enterprise Searchのアップグレード

LESとそのアプリは Liferay 7.4にバンドルされているため、これらの手順は Liferay 7.2または7.3にアップグレードする場合のみ必要です。 [基本的なアップグレード手順](#upgrade-steps) の後、以下のオプションの手順を実行します。

1. 現在、 [Kibanaとモニタリング](../../../liferay-enterprise-search/monitoring-elasticsearch.md) を使用している場合、Elasticsearchのバージョンと一致するKibanaのバージョンをインストールします。

1. お使いのセットアップとバージョンに適したLESアプリケーションをインストールし、設定します。 詳細は、 [LES互換性マトリックス](https://help.liferay.com/hc/ja/articles/360016511651#Liferay-Enterprise-Search) を参照してください。

## アップグレードされた検索エクスペリエンスをテストする

アップグレードされた検索エクスペリエンスを手動でテストして、依存する機能が期待どおりに機能することを確認します。 何かが動作しない、または期待したものと異なる動作をしている場合は、旧バージョンと非互換の変更のドキュメントを確認してください。

* [Liferay 7.4 変更点](./../../../../liferay-internals/reference/7-4-breaking-changes.md)
* [Liferay 7.3 Breaking Changes](./../../../../liferay-internals/reference/7-3-breaking-changes.md)
* [Liferay 7.2 変更点](./../../../../liferay-internals/reference/7-2-breaking-changes.md)

## LESアプリケーションはLiferay 7.2以降に名称を変更しました。

> **LESサブスクライバー**

これらのLESアプリは、7.3のライフサイクルにおいて、その機能をより反映させ、LESアプリであることを強調するために名称が変更されました。

| 機能                        | 旧アプリ名                                                              | 新アプリ名                                      | 7.2設定ファイル                                                                                                                  | 7.3/7.4 設定ファイル                                                                                                 |
| :------------------------ | :----------------------------------------------------------------- | :----------------------------------------- | :------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------- |
| Elasticsearchクラスターのモニタリング | Liferay Connector to X-Pack Monitoring [Elastic Stack 6.x] (英語)   | Liferay Enterprise Search Monitoring       | `com.liferay.portal.search.elasticsearch6.xpack.monitoring.web.internal.configuration.XPackMonitoringConfiguration.config` | `com.liferay.portal.search.elasticsearch.monitoring.web.internal.configuration.MonitoringConfiguration.config` |
| Elasticsearchクラスターの保護     | Liferay Connector to X-Pack Security [Elastic Stack 6.x]を使用しています。 | Liferay Enterprise Search Security         | アクションは必要ありません。このアプリはDXP 7.4では使用できません。 その機能は Elasticsearch コネクタに統合されている。                                                    |                                                                                                                |
| 機械学習を使用した検索アルゴリズムの最適化     | Liferay Connector to Elasticsearch Learning to Rank                | Liferay Enterprise Search Learning to Rank | 変更なし。                                                                                                                      |                                                                                                                |

Liferay 7.3と7.4のウィジェット名と構成名は同じです。

Liferay 7.2 からアップグレードする場合、アプリと構成の名前を変更すると、このようなアップグレードの影響があります。

1. LES Monitoringウィジェットの名前が **Elasticsearch Monitoring** に変更されました。 起動時にモジュールのアップグレードステップが実行され、 **Liferay Enterprise Search Monitoring** がデプロイされたときにアプリの名前が変更されます。 アクションは必要ありません。
1. 設定ファイル名が `com.liferay.portal.search.elasticsearch6.xpack.monitoring.web.internal.configuration.XPackMonitoringConfiguration.config` から `com.liferay.portal.search.elasticsearch.monitoring.web.internal.configuration.MonitoringConfiguration` に変更された。 プロパティは以前と同じです。 ポータルの起動中に、モジュールのアップグレード手順が実行され、構成の名前が変更されます。 アクションは必要ありません。
1. モニタリングウィジェットへのKibanaベースパスが変更されました。 `kibana.yml`の元の設定を変更する必要がある：

   ```yaml
   server.basePath: "/o/portal-search-elasticsearch-xpack-monitoring/xpack-monitoring-proxy"
   ```

   宛先

   ```yaml
   server.basePath: "/o/portal-search-elasticsearch-monitoring/monitoring-proxy"
   ```

## 7.4での検索の調整インデックスのインポート

Elasticsearchクラスタには以下のLiferay DXP検索の調整のインデックスがあります。

* `liferay-[companyId]-search-tuning-rankings`
* `liferay-[companyId]-search-tuning-synonyms`

アップグレード前のシステムで検索の調整機能を使用していたが、アップグレード後のクラスタに検索の調整インデックス文書が存在しない場合、まず [検索の調整インデックス](./backing-up-elasticsearch.md) をバックアップしてアップグレード前のクラスタからアップグレード後のクラスタに復元し、次にGroovyスクリプトを実行してインデックスデータを新しいデータベーステーブルに手動でインポートする必要があります。 アップグレード前のクラスタをアップグレードするのではなく、新しいElasticsearchクラスタに接続する場合に発生することがあります。

Groovyインポートスクリプトを実行するには、

1. スクリプトコンソールに移動します。 ［コントロールパネル］&rarr;［サーバ管理］で［スクリプト］タブに移動します。

1. 以下のスクリプトを実行し、結果ランキングデータをそのデータベーステーブルにインポートします。

   ```groovy
   import com.liferay.portal.instances.service.PortalInstancesLocalService;
   import com.liferay.portal.search.tuning.rankings.storage.RankingsDatabaseImporter;
   import com.liferay.registry.Registry;
   import com.liferay.registry.RegistryUtil;

   Registry registry = RegistryUtil.getRegistry();

   PortalInstancesLocalService portalInstancesLocalService = registry.getServices(PortalInstancesLocalService.class, null)[0];
   RankingsDatabaseImporter rankingsDatabaseImporter = registry.getServices(RankingsDatabaseImporter.class, null)[0];

   for (long companyId : portalInstancesLocalService.getCompanyIds()) {
   	rankingsDatabaseImporter.populateDatabase(companyId);
   }
   ```

1. 以下のスクリプトを実行し、同義語セットのデータをそのデータベーステーブルにインポートします。

   ```groovy
   import com.liferay.portal.instances.service.PortalInstancesLocalService;
   import com.liferay.portal.search.tuning.synonyms.storage.SynonymSetsDatabaseImporter;
   import com.liferay.registry.Registry;
   import com.liferay.registry.RegistryUtil;

   Registry registry = RegistryUtil.getRegistry();

   PortalInstancesLocalService portalInstancesLocalService = registry.getServices(PortalInstancesLocalService.class, null)[0];
   SynonymSetsDatabaseImporter synonymSetsDatabaseImporter = registry.getServices(SynonymSetsDatabaseImporter.class, null)[0];

   for (long companyId : portalInstancesLocalService.getCompanyIds()) {
   	synonymSetsDatabaseImporter.populateDatabase(companyId);
   }
   ```

1. 同義語セットと結果ランキングをテストして、すべてが期待通りに動作していることを確認してください。

## 関連トピック

* [Elasticsearch](../getting-started-with-elasticsearch.md)のアップグレード
* [Elasticsearch を始める](../getting-started-with-elasticsearch.md)
* [Elasticsearch のインストール](../installing-elasticsearch.md)
* [Elasticsearch](../connecting-to-elasticsearch.md) への接続
* [Elasticsearch](../securing-elasticsearch.md) の保護
* [Liferay](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics.md) のアップグレード
