# 検索管理

**コントロールパネル** &rarr; **設定** &rarr; **検索** には、3つの管理用UIがある：Connections、Index Actions、Field Mappings です。 接続は、あなたのインストールが接続されている検索エンジンを表示し、アクションをインデックスは、再インデックス化のためのインターフェースで、フィールドマッピングは、Liferay から検索インデックスにマッピングされたフィールドを表示します。

![The Search Administration panel contains three management screens.](./search-administration/images/02.png)

## つながり

検索エンジンへの接続情報が表示されます。 例えば、

* 検索エンジンベンダー：Elasticsearch
* クライアントのバージョン：7.16.3
* 有効な接続：1
* 稼働状態：緑
* 接続ID： \_REMOTE\_
* 接続タイプ：読み取り/書き込み
* クラスター名：LiferayElasticsearchCluster
* ノード：1
* ノード名：lr-es
* ノードバージョン：7.17.14

## インデックス管理

Index Actionsでは、Liferayのデータのインデックスを再作成することができます。

![Reindex using the Index Actions user interface.](./search-administration/images/05.png)

これらのレベルのいずれかでインデックスを再作成することができます：

**すべてのインデックスとタイプ、またはすべてのスペルチェック辞書のインデックスを再作成します。
**個々のインデックス付け可能な型：** インデックス付け可能な型を個別に再インデックス付けします。

1. グローバルメニュー &rarr; ［コントロールパネル］ &rarr; ［検索機能］を開き、［アクションをインデックスする］タブをクリックします。

1. [Liferay 2023.Q4+/GA 102+] リインデックスモードを選択します。

   ![Choose the reindexing mode.](./reindexing-modes/images/01.png)

   Liferay 7.4 2023.Q4以降（Update/GA 102+）では、検索のダウンタイムを避けるために再インデックスのモードを設定することができます。 導入された **Concurrent** モードと **Sync** モードについては、 [再インデックス・モード](./reindexing-modes.md) を参照のこと。

1. [Liferay 7.4] 実行スコープタブで再インデックスするインスタンスを選択します。

   ![Select the instances to reindex.](./search-administration/images/03.png)

   Liferay 7.4 以降、再インデックスアクションの範囲を特定の [バーチャルインスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md) に限定することができます。

1. [Liferay 2023.Q4+/GA 102+] 再インデックスを確認するダイアログで **Execute** をクリックします。

   ![Confirm that you'd like to reindex.](./search-administration/images/04.png)

```{note}
[Workflow Metrics](../../process-automation/workflow/using-workflows/using-workflow-metrics.md) は、アプリケーションの専用設定メニューから再インデックス化されます。 グローバルメニューの［アプリケーション］ &rarr; ［ワークフロー］セクションの［_Metrics_］をクリックし、［設定］ウィンドウを開きます (![Options](../../images/icon-actions.png))。 詳しくは [Reindexing Workflow Metrics](../../process-automation/workflow/using-workflows/using-workflow-metrics.md#reindexing-workflow-metrics) を参照。
```

### 全コンテンツの再インデックス化

すべてのコンテンツのインデックスを再作成すると、 [システムと会社のインデックス](./elasticsearch-indexes-reference.md) にあるすべての検索エンジンのドキュメントが削除され、データベースから再作成されます。 Elasticsearch のログには `update_mapping` メッセージが出力される：

```json
{"type": "server", "timestamp": "2023-01-10T14:33:04,513Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

Liferay 7.4 U45+/GA45+およびLiferay DXP 7.3 U14+において、Liferayのログは、システムおよび会社のインデックスについて、再インデックスの開始と終了のタイミングをレポートします。 例えば、

```log
2023-01-09 20:44:17.730 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 20097
2023-01-09 20:45:00.986 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 20097
```

以前のアップデートやLiferay Portal 7.3では、これらの [ロギング設定](../../system-administration/using-the-server-administration-panel/configuring-logging.md) を有効にすると、同様の情報が表示されます。

| ロガーカテゴリー                                                                          | レベル   |
| :-------------------------------------------------------------------------------- | :---- |
| com.liferay.portal.search.internal.background.task.ReindexStatusMessageSenderImpl | DEBUG |
| com.liferay.portal.search.internal.SearchEngineInitializer                        | INFO  |

### 個別タイプの再インデックス化

個々の型(例えば、`com.liferay.account.model.AccountEntry`)のインデックスを再作成すると、エンティティを表すインデックスドキュメントは削除され、データベースから再作成されます。 Elasticsearch のログには `update_mapping` というメッセージが出力される：

```json
{"type": "server", "timestamp": "2023-01-10T14:38:12,302Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

Liferay 7.4 U45+/GA45+ および Liferay DXP 7.3 U14+ では、Liferay のログが再インデックスの開始と終了のタイミングをレポートします。 例えば、

```log
2023-01-10 14:14:00.840 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:122] Start reindexing company 20097 for class name com.liferay.account.model.AccountEntry
2023-01-10 14:14:00.907 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:145] Finished reindexing company 20097 for class name com.liferay.account.model.AccountEntry
```

### スペルチェック辞書の再インデックス化

すべてのコンテンツのインデックスを再作成するたびに、スペルチェック辞書のインデックスを再作成します。 スペルチェック辞書のインデックスを再作成すると、各言語の Liferay 辞書ファイル（例：`com/liferay/portal/search/dependencies/spellchecker/en_US.txt`）の内容が [システムと会社のインデックス](./elasticsearch-indexes-reference.md) に対して再作成されます。 Elasticsearch のログには `update_mapping` というメッセージが出力される：

```json
{"type": "server", "timestamp": "2023-01-10T14:33:14,991Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-0/9ZIx-bT6TyiekzarKELQkA] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"  }
```

Liferay 7.4 U45+/GA45+ および Liferay DXP 7.3 U14+ では、Liferay のログが再インデックスの開始と終了のタイミングをレポートします。 例えば、

```log
2023-01-10 14:16:34.170 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 0
2023-01-10 14:16:41.592 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 0
2023-01-10 14:16:41.593 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 0
2023-01-10 14:16:44.570 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 0
2023-01-10 14:16:44.571 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 20097
2023-01-10 14:16:49.547 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/en_US.txt for company 20097
2023-01-10 14:16:49.548 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:278] Start indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 20097
2023-01-10 14:16:52.235 INFO  [http-nio-8080-exec-7][BaseSpellCheckIndexWriter:301] Finished indexing dictionary com/liferay/portal/search/dependencies/spellchecker/es_ES.txt for company 20097
```

## フィールドマッピング

［フィールドマッピング］タブには、システムで有効なすべてのフィールドマッピングがインデックスごとに表示されます。 現在、マッピングの表示、コピー、拡大・縮小、ダークテーマでの表示が可能です。

![Inspect the field mappings for any index in the Elasticsearch cluster.](./search-administration/images/01.png)

## 関連する内容

* [検索 コンフィギュレーション リファレンス](../search-configuration-reference.md)
* [ポータル・プロパティ](../../installation-and-upgrades/reference/portal-properties.md)
* [Elasticsearch Connector 構成リファレンス](../installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
