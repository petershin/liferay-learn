# 検索管理

［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**検索**］ には、接続、アクションをインデックスする、フィールドマッピングの3つの管理用UIがあります。 接続は、あなたのインストールが接続されている検索エンジンを表示し、アクションをインデックスは、再インデックス化のためのインターフェースで、フィールドマッピングは、Liferay から検索インデックスにマッピングされたフィールドを表示します。

![検索管理パネルには、3つの管理画面があります。](./search-administration/images/02.png)

## つながり

検索エンジンへの接続情報が表示されます。 例:

* 検索エンジンベンダー：Elasticsearch
* クライアントのバージョン：7.17.1
* 有効な接続：1
* 稼働状態：緑
* 接続ID： \_REMOTE\_
* 接続タイプ：読み取り/書き込み
* クラスター名：LiferayElasticsearchCluster
* ノード：1
* ノード名：lr-es
* ノードバージョン：7.15.1

## アクションをインデックスする

アクションをインデックスでは、これらのレベルのいずれかでインデックスを再作成します。

   * すべてのインデックス可能アセット
   * 個々のインデックス可能アセット
   * すべてのスペルチェック辞書

Liferay 7.4 以降、サーバー管理者は再インデックスアクションの範囲を特定の [仮想インスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)に制限することも可能です。 アクションをインデックスがどのインスタンスに適用されるかを選択します。

1. グローバルメニュー &rarr; ［コントロールパネル］ &rarr; ［検索機能］を開き、［アクションをインデックスする］タブをクリックします。
1. ［Execution Scope］タブを使用して、インデックスを再作成するインスタンスを選択します。

   ![インデックスを再作成するインスタンスを選択します。](./search-administration/images/03.png)

```{note}
[ワークフローメトリクス](../../process-automation/workflow/using-workflow-metrics.md)は、アプリケーションの専用設定メニューから再インデックス化されます。 グローバルメニューの［アプリケーション］ &rarr; ［ワークフロー］セクションの［ _Metrics_  ］をクリックし、［設定］ウィンドウを開きます (![Options](../../images/icon-actions.png)). 詳細は、[ワークフローメトリクスの再インデックス化](../../process-automation/workflow/using-workflow/using-workflow-metrics.md#re-indexing-workflow-metrics) を参照ください。
```

### 全コンテンツの再インデックス化

完全な再インデックスを実行すると、 [システムと会社のインデックス](./elasticsearch-indexes-reference.md) にあるすべての検索エンジンの文書が削除され、データベースから再作成されます。 Elasticsearchのログには、 `update_mapping` メッセージが出力されます。

```json
{"type": "server", "timestamp": "2023-01-10T14:33:04,513Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

Liferay 7.4 U45+/GA45+ と Liferay DXP 7.3 U14+ では、Liferay のログはシステムインデックスとカンパニーインデックスについて再インデックスの開始と終了を報告します。 例:

```log
2023-01-09 20:44:17.730 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 20097
2023-01-09 20:45:00.986 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 20097
```

以前のアップデートと Liferay Portal 7.3 では、これらの [ロギング設定](../../system-administration/using-the-server-administration-panel/configuring-logging.md) を有効にすると、同様の情報を見ることができます。

| ロガーカテゴリー                                                                          | レベル       |
|:--------------------------------------------------------------------------------- |:--------- |
| com.liferay.portal.search.internal.background.task.ReindexStatusMessageSenderImpl | デバッグ      |
| com.liferay.portal.search.internal.SearchEngineInitializer                        | インフォメーション |

### 個別タイプの再インデックス化

個々の型のインデックスを再作成すると (例: `com.liferay.account.model.AccountEntry`)、実体を表すインデックス文書が削除され、データベースから再作成されます。 Elasticsearchのログには、 `update_mapping` メッセージが出力されます。

```json
{"type": "server", "timestamp": "2023-01-10T14:38:12,302Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-20097/mc59Scl8TJeuvcDR3y2W-g] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"
```

Liferay 7.4 U45+/GA45+ と Liferay DXP 7.3 U14+ では、Liferay のログは再インデックスの開始と終了のタイミングを報告します。 例:

```log
2023-01-10 14:14:00.840 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:122] Start reindexing company 20097 for class name com.liferay.account.model.AccountEntry
2023-01-10 14:14:00.907 INFO  [liferay/background_task-2][ReindexSingleIndexerBackgroundTaskExecutor:145] Finished reindexing company 20097 for class name com.liferay.account.model.AccountEntry
```

### スペルチェック辞書の再インデックス化

スペルチェック辞書の再インデックス化を行うと、各言語のLiferayの辞書ファイルの内容（例：`com/liferay/portal/search/dependencies/spellchecker/en_US.txt`）が[システムと会社のインデックス](./elasticsearch-indexes-reference.md)に対して再インデックス化されています。Elasticsearch のログには `update_mapping` というメッセージが出力されます。

```json
{"type": "server", "timestamp": "2023-01-10T14:33:14,991Z", "level": "INFO", "component": "o.e.c.m.MetadataMappingService", "cluster.name": "LiferayElasticsearchCluster", "node.name": "lr-es", "message": "[liferay-0/9ZIx-bT6TyiekzarKELQkA] update_mapping [LiferayDocumentType]", "cluster.uuid": "QnWxrpxaSUKF2upHDNWKkQ", "node.id": "thpwCzS_TvGgfVxQ-P_l9g"  }
```

Liferay 7.4 U45+/GA45+ と Liferay DXP 7.3 U14+ では、Liferay のログは再インデックスの開始と終了のタイミングを報告します。 例:

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

![Elasticsearchクラスター内の任意のインデックスのフィールドマッピングを検査します。](./search-administration/images/01.png)

## 関連するコンテンツ

* [検索設定のリファレンス](../search-configuration-reference.md)
* [ポータルプロパティ](../../installation-and-upgrades/reference/portal-properties.md)
* [Elasticsearchコネクターの設定リファレンス](../installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
