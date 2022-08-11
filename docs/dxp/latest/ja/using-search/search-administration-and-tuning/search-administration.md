# 検索管理

*コントロールパネル* &rarr; *設定* &rarr; *検索* には、つながり、アクションをインデックスする、フィールドマッピングの3つの管理用UIがあります。 接続は、あなたのインストールが接続されている検索エンジンを表示し、アクションをインデックスは、再インデックス化のためのインターフェースで、フィールドマッピングは、Liferay から検索インデックスにマッピングされたフィールドを表示します。

![検索管理パネルには、3つの管理画面があります。](./search-administration/images/02.png)

## つながり

検索エンジンへの接続情報が表示されます。 例:

* 検索エンジンベンダー：Elasticsearch
* クライアントのバージョン：7.17.1
* 有効な接続：1
* 稼働状態：緑
* 接続ID：\_REMOTE\_
* 接続タイプ：読み取り/書き込み
* クラスター名：LiferayElasticsearchCluster
* ノード：1
* ノード名：lr-es
* ノードバージョン：7.15.1

## アクションをインデックスする

アクションをインデックスでは、これらのレベルのいずれかでインデックスを再作成します。

   * すべてのインデックス可能アセット
   * 個々のインデックス可能アセット
   * すべてのスペルチェック用インデックス

Liferay 7.4 以降、サーバー管理者は再インデックスアクションの範囲を特定の [仮想インスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)に制限することも可能です。 アクションをインデックスがどのインスタンスに適用されるかを選択します。

1. グローバルメニュー &rarr; ［コントロールパネル］ &rarr; ［検索機能］を開き、［アクションをインデックスする］タブをクリックします。
1. ［Execution Scope］タブを使用して、インデックスを再作成するインスタンスを選択します。

   ![インデックスを再作成するインスタンスを選択します。](./search-administration/images/03.png)

```{note}
[ワークフロー統計情報](../process-automation/workflow/using-workflow/using-workflow-metrics.md)は、アプリケーション専用の設定メニューからインデックスが再作成されます。 グローバルメニューの［アプリケーション］ &rarr; ［ワークフロー］セクションの［ _Metrics_  ］をクリックし、［設定］ウィンドウを開きます (![Options](../../images/icon-actions.png)). 詳しくは、 [ワークフローメトリクスのインデックスの再作成](../process-automation/workflow/using-workflow/using-workflow-metrics.md#re-indexing-workflow-metrics ) を参照してください。
```

## フィールドマッピング

［フィールドマッピング］タブには、システムで有効なすべてのフィールドマッピングがインデックスごとに表示されます。 現在、マッピングの表示、コピー、拡大・縮小、ダークテーマでの表示が可能です。

![Elasticsearchクラスター内の任意のインデックスのフィールドマッピングを検査します。](./search-administration/images/01.png)

## 関連するコンテンツ

* [検索設定のリファレンス](../search-configuration-reference.md)
* [ポータルプロパティ](../../installation-and-upgrades/reference/portal-properties.md)
* [Elasticsearchコネクターの設定リファレンス](../installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
