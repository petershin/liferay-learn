# クラスター横断レプリケーション

> **Liferay Enterprise Search（LES）サブスクライバー**

従来のLiferay DXP/検索エンジンのインストールでは、1つのLiferay DXPクラスターが1つのElasticsearchクラスターと通信し、検索エンジンクラスターへの1つの接続を介して、すべての読み取り（検索クエリの実行）および書き込み（ドキュメントの作成）要求を送信します。 この設定では、すべてのElasticsearchクラスターノードが単一のデータセンターに配置されていることを前提としています（ただし、Liferay DXPサーバーとは異なるデータセンターに配置することもできます）。

データのローカリティとディザスタリカバリに関する懸念に対処するため、Elasticsearch は [Elasticsearch 7+ 用の Cross-Cluster Replication (CCR)](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/xpack-ccr.html) 機能をリリースしました。この機能は [LES のサブスクライバ](https://www.liferay.com/products/dxp/enterprise-search) が Liferay DXP で使用できます（バージョンの互換性の詳細については [LES 互換性マトリックス](https://help.liferay.com/hc/ja/articles/360016511651#Liferay-Enterprise-Search) を参照してください）。 LES CCRモジュールを使用すると、別の形のマルチデータセンター展開が可能です。 Elasticsearchクラスターのノードを複数のデータセンターに分散することはできませんが、各データセンターで個別のElasticsearchクラスターを構成して接続することはできます。

この構成では、 **リーダー** インデックスを保持する1つのクラスターと、リーダーからレプリケートされた **フォロワー** インデックスを保持する少なくとも1つのクラスターを想定しています。 フォロワーインデックスは、Liferay DXPがデータを読み取るためにのみ使用されます。 リーダーインデックスは常に書き込みに使用されますが、読み取りにも使用できます。

![クラスター横断レプリケーションを使用すると、異なるデータセンターがLiferay DXPインデックスを使用して同期されたElasticsearchクラスターを保持できます。](./cross-cluster-replication/images/01.png)

上の図は、CCRの最小限の例を示しています。 各データセンターには、1つ以上のDXPノードと1つのElasticsearchクラスターがあります。 米国のデータセンターには、すべてのDXPノードが書き込みを行うリーダーインデックスが保持されています。 ハンガリーのデータセンターには、ローカル（ハンガリー）のDXPノードが読み取りを行うフォロワーインデックスが保持されています。 データは、リーダーからフォロワーへの一方向にレプリケートされます。

Liferay DXPは、ワイドエリアネットワーク（WAN）プロトコルを介して、ノードが異なる場所にある分散クラスターのアイデアを長い間サポートしてきました。 Liferay DXPの柔軟性とElasticsearchのクラスター横断レプリケーションのサポートにより、さまざまなシステム設計をサポートできます。

クラスター横断レプリケーションを設定するには、次のことを行う必要があります

- [LESの活性化](../activating-liferay-enterprise-search.md)
- Liferay 7.2 と 7.3 では、フォロワーの Elasticsearch インデックスから読み込む Liferay DXP ノードに CCR モジュールをインストールします。
- リーダークラスターからレプリケートするインデックスを選択する
- Elasticsearchクラスターを構成する
- Liferay DXPクラスターのElasticsearch接続を設定する
- フォロワーインデックスから読み取りを行うLiferay DXPノードでクラスター横断レプリケーションを有効にして設定する

## Liferay DXP：LESクラスター横断レプリケーションモジュールのインストール

```{note}
Liferay DXP 7.4より、Liferay Enterprise Search (LES)アプリケーションは、すべてのLiferay DXPバンドルとDockerコンテナに含まれています。 そのため、Liferay DXP 7.4+ではモジュールのインストールは不要です。 詳しくは[LESの起動](../activating-liferay-enterprise-search.md)を参照してください。
```

ローカルクラスターのフォロワーインデックスから読み取りを行い、リモートクラスターのリーダーインデックスへの個別の接続を介して書き込みを行うLiferay DXPノードには、CCRモジュールがインストールされている必要があります。 一貫性と適応性のために、クラスター内のすべてのノードにインストールするのが最善です。 このモジュールは、LESサブスクリプションとともに（LPKGファイルとして）ダウンロードできます。

## Liferay DXP：リモートクラスターからレプリケートするインデックスを決定する

インストールされているデフォルトのLiferay DXP 7.3インデックスは、以下のリストに近似しています（変更される可能性があります）。 デフォルトのグローバル **インデックス名接頭辞** は`liferay-`です。これはElasticsearch 7コネクタ設定で変更できます。 `20101`は、データベース内の特定の会社の生成された`companyId`です。  UIにインスタンスIDとして表示され、[仮想インスタンス](../../../system-administration/configuring-liferay/virtual-instances.md)を表します。

| インデックスID                                            | インデックスタイプ  | インデックスの目的                                                |
|:--------------------------------------------------- |:---------- |:-------------------------------------------------------- |
| liferay-0                                           | システムインデックス | システム設定アプリケーションでの検索                                       |
| liferay-20101                                       | 会社インデックス   | Liferay DXP仮想インスタンスのインデックス付きアセットの検索                      |
| liferay-20101-search-tuning-rankings                | アプリインデックス  | リザルト・ランキング・アプリケーション用ストレージ                                |
| liferay-20101-search-tuning-synonyms                | アプリインデックス  | 指定 し た仮想 イ ン ス タ ン ス のシノニム セ ッ ト アプ リ ケーシ ョ ンのためのス ト レージ |
| liferay-20101-workflow-metrics-instances            | アプリインデックス  | ワークフロー統計情報アプリケーションのワークフローインスタンスに関するデータを保存する              |
| liferay-20101-workflow-metrics-nodes                | アプリインデックス  | ワークフロー統計情報アプリケーションのワークフローノードに関するデータを保存する                 |
| liferay-20101-workflow-metrics-processes            | アプリインデックス  | ワークフロー統計情報アプリケーションのワークフロープロセスに関するデータを保存する                |
| liferay-20101-workflow-metrics-sla-instance-results | アプリインデックス  | ワークフロー統計情報アプリケーションのワークフローインスタンスごとのSLA結果のストレージ            |
| liferay-20101-workflow-metrics-sla-task-results     | アプリインデックス  | ワークフロー統計情報アプリケーションのワークフロー タスクごとのSLA結果のストレージ              |
| liferay-20101-workflow-metrics-tokens               | アプリインデックス  | ワークフロー統計情報アプリケーションのワークフロートークンに関するデータを保存する                |
| liferay-20101-workflow-metrics-transitions          | アプリインデックス  | ワークフロー統計情報アプリケーションのワークフロートランジションに関するデータを保存する             |

```{important}
Liferay 7.2のインデックス名は、パッチによってインデックスの命名パターンに変更が加えられたため、より複雑になっています。 詳しくは、 [マルチテナントインデックス名](../../getting-started/whats-new-in-search-for-73.md#multi-tenant-index-names) をご参照ください。
Liferay 7.1のインストールには、会社とシステムのインデックスだけが含まれています。
```

```{note}
Liferay DXPは、カスタムElasticsearchインデックスを作成、使用（書き込み、読み込み）するためのAPIを提供します。 これらのAPIの使用については、 [開発者ガイド](../../developer-guide.html) を参照してください。
```

[Liferay Commerce](https://www.liferay.com/products/commerce) サブスクリプションがあり、インストールでアクティブ化されている場合は、次のようなインデックスもあります。

| インデックスID                                                     | インデックスタイプ | インデックスの目的     |
|:------------------------------------------------------------ |:--------- |:------------- |
| liferay-20101-commerce-ml-forecast                           | アプリインデックス | 機械学習機能        |
| liferay-20101-product-content-commerce-ml-recommendation     | アプリインデックス | レコメンデーションサービス |
| liferay-20101-product-interaction-commerce-ml-recommendation | アプリインデックス | レコメンデーションサービス |

特段の理由がない限り、すべてのLiferay DXPインデックスとすべてのカスタムインデックスをフォロワーのElasticsearchクラスターにレプリケートする必要があります。

## Elasticsearchクラスターを構成する

クラスター横断レプリケーションにも対応しているLiferay DXPでサポートされているバージョンを使用して、Elasticsearchクラスターをセットアップします。 詳細は、 [LES互換性マトリックス](https://help.liferay.com/hc/ja/articles/360016511651#Liferay-Enterprise-Search) を参照してください。

Liferay DXP が必要とする Elasticsearch プラグインを [にインストールし、フォロワークラスタとリーダークラスタを区別するためにクラスタ名](../../installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md#configure-elasticsearch) を指定してください。

CCRにはElasticsearchプラチナレベルのライセンスが必要ですが、 [LESのお客様](../../liferay-enterprise-search.html) はすでに所有しています。 ローカルでテストする場合は、各クラスタで [トライアル・ライセンス](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/start-trial.html) を開始します。

## Liferay DXPをElasticsearchに接続する

```{important}
最初にLiferay Clusteringの動作を設定します。 チュートリアルの例では、テスト用にいくつかの設定を行っています。 本番クラスタのセットアップの詳細については [clustering documentation](../../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md) を参照してください。
```

すべてのLiferay DXPノードには、2つのElasticsearch構成が必要です。本番モードを有効にし、リモートElasticsearch接続を宣言します。 これに対応するために、リモートElasticsearch接続をElasticsearch接続で設定する必要があります。 フォロワーのElasticsearchクラスターから読み取りを行うノードにも、追加の接続を定義する必要があります。 （`.config`ファイルまたはシステム設定で）適切な構成値を指定してから、DXPノードを起動（または再起動）します。 リーダーインデックスの読み取りと書き込みを行うノードが正しく機能していることを確認します。

ノードを起動し、クラスター内のすべてのノードにLESアプリをインストールします（まだ起動していない場合）。

## クラスター横断レプリケーションを有効にして構成する

Liferay DXPには、CCRセットアップを完了するためのロジックが含まれていますが、[構成ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)ではなく、システム設定UIでCCR機能を有効にすることに依存しています。 最低でも、`readFromLocalClusters`プロパティがUIからトリガーされなければなりません。 CCRを構成したら、あとはインデックスのレプリケーションを確認して検索を開始するだけです。

初めてCCRを有効にすると（設定で ［**アップデート**］ をクリックした後--- [ローカルフォロワーデータセンターでのCCRの構成](./configuring-ccr-in-a-local-follower-data-center.md) を参照）、ローカルクラスター構成の各エントリが処理されます。 まず、 [リモートクラスター](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-remote-clusters.html) が [クラスターアップデート設定API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) を介して登録されます。 リモートクラスタ内の各インデックス ( `.` で始まるインデックスや、Excluded Indexes 設定で定義されたインデックスを除く) に対して、 [Create Follower API](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/ccr-put-follow.html) を呼び出して、リモートインデックスとのフォロワー/リーダー関係を設定します。

既存のCCRコンフィギュレーションを編集した後、またはCCRを無効にした後、ローカル・クラスタ・コンフィギュレーションに以前に保存された各エントリーが処理されます。 インデックスごとに、 [フォローが一時停止](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-post-pause-follow.html) され、 [インデックスが閉じられ](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-close.html#indices-close) 、 [リーダーがフォロー解除され](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/ccr-post-unfollow.html) 、 [フォロワーインデックスが削除](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-delete-index.html) されます。 その後、リモートクラスターは [クラスターアップデート設定API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) を介して登録解除されます。 CCRを無効にするだけの場合は、ここで処理が終了します。 構成を編集する場合、既存のローカルクラスター構成エントリは、CCRを初めて有効にする場合と同じように引き続き処理されます。 エントリごとに、 [リモートクラスター](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-remote-clusters.html) が [クラスターアップデート設定API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cluster-update-settings.html) を介して登録されます。 各リモートクラスタ内のすべてのインデックス ( `.` で始まるインデックスや、Excluded Indexes 設定で定義されたインデックスを除く) について、 [Create Follower API](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/ccr-put-follow.html) が呼び出され、リモートインデックスとのフォロワー/リーダー関係が設定される。

手順を理解したところで、[基本的な特定のユースケース](./configuring-an-example-ccr-installation-replicating-between-data-centers.md)を使用して、ローカルの例の設定を開始しましょう。
