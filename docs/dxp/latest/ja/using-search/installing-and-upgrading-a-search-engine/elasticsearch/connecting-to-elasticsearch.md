# Elasticsearchへの接続

[Elasticsearch](./installing-elasticsearch.md)をセットアップした後、Liferay Connector to Elasticsearch を使って Liferay に接続します。 接続の手順は、設定するコネクターによって異なります。 [利用可能なLiferay Elasticsearchコネクター](#available-liferay-elasticsearch-connectors) を参照してください。

ここでは、インストールや設定手順の主な違いについて説明します。

```{important}
接続を設定する前に、各Liferayサーバーノードを停止します。
```

Liferay 7.2を使用している場合は、 [Liferay 7.2：Elasticsearch 7コネクタのインストール](#liferay-72-installing-elasticsearch-7-connector) にスキップしてください。

## コネクタの設定

Liferay 7.3+ 用の Elasticsearch コネクタは設定ファイルで設定できます：

```
com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
```

この同じファイルを使用して、Liferay 7.3および7.4とElasticsearch 7または8を接続することができます。 ご利用可能なElasticsearchのバージョンは、 [Search Engine Compatibility Matrix](https://help.liferay.com/hc/ja/articles/360016511651) をご覧ください。

デプロイするには、 `[Liferay Home]/osgi/configs/`に配置します。

Dockerの場合、

```bash
docker cp ~/path/to/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config [container]:/mnt/liferay/files
```

または、ユーザーインターフェイスでコネクタを設定することもできます。 グローバルメニュー（![Global Menu](../../../images/icon-applications-menu.png)）で、［コントロールパネル］&rarr; ［システム設定］を開き、 ［**検索**］ のカテゴリーを開きます。 このエントリはElasticsearch 7と呼ばれます。

Liferay 7.3+コネクタのシンプル設定では、本番環境モード（`productionModeEnabled="true"`）が有効になり、各Elasticsearchノード（`networkHostAddresses=["http://es-node:9200"]`）へのURLが設定されます。

1. 次の設定ファイルを作成します。

    ```
    com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
    ```

1. `.config`ファイルで設定プロパティを指定します。 コメントアウトされた[セキュリティプロパティ](./securing-elasticsearch.md)を含む例を次に示します（暗号化が有効になっている場合は `https`ネットワークホストアドレスを使用する必要があることに注意してください）。

    ```properties
    # In CE/DXP 7.3+, productionModeEnabled replaces operationMode (deprecated):
    productionModeEnabled=B"true"
    networkHostAddresses=["http://es-node1:9200","http://es-node3:9201","http://es-node3:9202"]
    # In CE/DXP 7.3+ the security settings are included in the ElasticsearchConfiguration
    # In CE/DXP 7.2 the security settings go in com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config
    # Authentication
    #authenticationEnabled=B"true"
    #username="elastic"
    #password="liferay"

    # TLS/SSL
    #networkHostAddresses=["https://es-node1:9200","https://es-node3:9201","https://es-node3:9202"]
    #httpSSLEnabled=B"true"
    #truststoreType="pkcs12"
    #trustStorePath="/PATH/TO/elastic-nodes.p12"
    #trustStorePassword="liferay"

    # Highly recommended for all non-prodcution usage (e.g., practice, tests, diagnostics):
    #logExceptionsOnly="false"
    ```

1. `.config`ファイルを`[Liferay Home]/osgi/configs`フォルダに配置します。

```{tip}
コネクタには多くの設定項目があります。 それぞれの定義については、[Elasticsearchコネクターの設定](./elasticsearch-connector-configuration-reference.md) を参照してください。 ほとんどの設定は、 [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/index.html) で利用可能な設定に対応しています。
```

Elasticsearchサーバーを名前で参照するには、各Elasticsearchサーバー名をDNSまたはLiferayサーバーの`/etc/hosts` ファイル内のIPアドレスにマップします。

```{tip}
ネットワークホストアドレスの書式は `http[s]://[ホスト名]:[port]`です。 LiferayのDockerコンテナを使用している場合、`--add-host [host name]:[IP address]` オプションを `docker run` コマンドで使用し、各ElasticsearchサーバのIPアドレスにホスト名をマッピングすることが可能です。 ポートは、Elasticsearchコンテナのdocker runコマンドで、`-p 1234:5678` オプションの最初の値として定義されています（この場合は `1234`です）。 HTTPSを有効にしていないローカルなテスト環境では、すべてのアドレスが `http://localhost:port` になることがあります。 詳しくは [Dockerのドキュメント](https://docs.docker.com/engine/reference/run/#managing-etchosts) をご覧ください。
```

## Liferay 7.2：Elasticsearch 7コネクタのインストール

### Elasticsearch 6コネクタを停止する

Liferay 7.2では、バンドルされているコネクタアプリケーションとAPIはElasticsearch 6用です。 Elasticsearch 7コネクタをインストールする前に、これらを無効にする必要があります。

1. 以下のようなファイルを作成します。

    ```
    com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
    ```

1. 以下のコンテンツをファイルに追加します。

    ```properties
    blacklistBundleSymbolicNames=[ \
        "com.liferay.portal.search.elasticsearch6.api", \
        "com.liferay.portal.search.elasticsearch6.impl", \
        "com.liferay.portal.search.elasticsearch6.spi", \
        "com.liferay.portal.search.elasticsearch6.xpack.security.impl", \
        "Liferay Connector to X-Pack Security [Elastic Stack 6.x] - Impl", \
        "Liferay Enterprise Search Security - Impl.lpkg" \
    ]
    ```

1. ファイルを`[Liferay Home]/osgi/configs`フォルダに配置します。

    Liferayサーバーを起動すると（まだ起動していない場合）、Liferayはこのファイルを読み取り、宣言されたバンドルの起動をブロックします。

    ```{tip}
    **Docker:** `Liferay Home` と Liferay インストールの他の重要なフォルダは、Docker コンテナの `/mnt/liferay` で [here](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/container-lifecycle-and-api.md#api) と記述してアクセスすることが可能です。 `docker cp /path/to/local/file [container_name]:/mnt/liferay/files/osgi/configs` でコンテナに設定ファイルを配置することができます。 その後、`docker cp` を使って Liferay Connector to Elasticsearch 7 LPKGファイルをデプロイすることができます。
    ```

### Elasticsearch 7コネクタのインストール

1. Liferay Connector to Elasticsearch 7をダウンロードします。

   コネクタがElasticsearchのバージョンに対応していることを確認してください。 コネクタアプリケーションが新しいバージョン（7.18.0など）をサポートしている場合でも、コネクタのクライアントライブラリが古いバージョンのElasticsearch（7.17.1など）用である可能性があることに注意してください。 Liferayは、Elasticsearchのマイナーバージョンごとにコネクタをテストし、必要に応じて新しいアップデートコネクタバージョンを作成します。 コネクタの互換性については、 [検索エンジンの互換性マトリックス](https://help.liferay.com/hc/ja/articles/360016511651) を参照してください。

   * CE： [Liferay CE Connector to Elasticsearch 7](https://web.liferay.com/en/marketplace/-/mp/application/170642090)
   * DXP： [Liferay Connector to Elasticsearch 7](https://web.liferay.com/en/marketplace/-/mp/application/170390307)

1. [LPKGをフォルダに配置してインストール](../../../system-administration/installing-and-managing-apps/installing-apps.md)します。

   ```bash
   [Liferay Home]/deploy
   ```

   Dockerの場合、

   ```bash
   docker cp ~/path/to/Liferay\ Connector\ to\ Elasticsearch.lpkg [container]:/mnt/liferay/deploy
   ```

   Liferayサーバーを起動すると（まだ起動していない場合）、LiferayはLPKGをデプロイします。

これで、コネクタを設定する準備が整いました。

### Liferay7.2用のコネクタを設定する

1. 次のElasticsearch設定ファイルを作成します。

    ```bash
    com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
    ```

1. `.config`ファイルで設定プロパティを指定します。 ここでは、リモート動作モードを有効にし、各Elasticsearchノードのトランスポートアドレスを設定し、設定している接続を識別する例を示します。

    ```properties
    # com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
    operationMode="REMOTE"
    transportAddresses="ip.of.elasticsearch.node:9300"
    # Highly recommended for all non-production usage (e.g., practice, tests, diagnostics):
    #logExceptionsOnly="false"
    ```

1. `.config`ファイルを`[Liferay Home]/osgi/configs`フォルダに配置して、設定をデプロイします。

これでLiferayを開始する準備が整いました。

## Liferayを開始してインデックスを再作成する

Elasticsearchが[インストールされて動作している](./installing-elasticsearch.md)場合は、Liferayを起動します。 コントロールパネルで［設定&rarr; 検索機能］に移動し、Elasticsearchの接続がアクティブになっていることを確認します。

![有効な接続が［検索機能］管理パネルに表示されます。](./getting-started-with-elasticsearch/images/01.png)

検索インデックスとスペルチェックインデックスのインデックスを再作成します。 コントロールパネルの &rarr; 構成 &rarr; 検索の［インデックスアクション］タブで、この2つのアクションを起動します。

Liferay 7.3+では、［Workflow Metrics Settings］ウィンドウから[ワークフロー統計情報](../../../process-automation/workflow/using-workflows/using-workflow-metrics.md)インデックスを再作成します。

1. グローバルメニュー（![Applications Menu](../../../images/icon-applications-menu.png)）から［アプリケーション］ &rarr; ［ワークフローメトリクス］に移動します。

1. アプリオプションメニュー（![App Options](../../../images/icon-app-options.png)）から ［**Settings**］ ウィンドウを開きます。

1. ［**すべてインデックスを再構築**］ をクリックします。 この操作をシステム内の各仮想インスタンスに対して繰り返します。

```{note}
Elasticsearchのインデックスをプライマリデータストレージとして使用している場合（データベースによってバックアップされていないデータを保存）、[Elasticsearchのバックアップ](./upgrading-elasticsearch/backing-up-elasticsearch.md) を使用してそのデータを新しいElasticsearchクラスターに取り込むことが可能です。 7.2と7.3では、Liferay独自の検索の調整インデックス（結果ランキングと同義語用）が、メインのストレージインデックスです。 7.4では、これらのインデックスはデータベーステーブルによってバックアップされています。
```

Liferay 7.4 U45+/GA45+とLiferay DXP 7.3 U14+では、拡張ログが有効になっているため、システムインデックスとカンパニーインデックスの再インデックスの開始と終了を知ることができます。 例えば、

```log
2023-01-09 20:44:17.730 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 0
2023-01-09 20:44:53.677 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:57] Start reindexing company 20097
2023-01-09 20:45:00.986 INFO  [liferay/background_task-2][ReindexPortalBackgroundTaskExecutor:76] Finished reindexing company 20097
```

これでLiferayはリモートElasticsearchにコンテンツをインデックスするようになりました。

## 利用可能なLiferay Elasticsearchコネクタ

バンドルされているElasticsearchへのコネクタが、インストールに最適であるとは限りません。 Elasticsearchとの通信に使用できるコネクタ間の違いを理解することが重要です。

| Liferay CE/DXPバージョン      | 名前                                               | 可用性                                                                                                                                                   | 通信プロトコル                                                                                            | セキュアな接続のサポート                                                                              | 動作モード                             |
|:------------------------ |:------------------------------------------------ |:----------------------------------------------------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------------------- |:----------------------------------------------------------------------------------------- |:--------------------------------- |
| Liferay 7.4、全種類          | Liferay Connector to  Elasticsearch 7            | バンドル                                                                                                                                                  | [HTTP](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-overview.html) | &#10004;                                                                                  | Sidecar / Remote (Production)\* |
| CE 7.3 GA4+、DXP 7.3 GA1+ | Liferay (CE) Connector to Elasticsearch 7        | バンドル                                                                                                                                                  | [HTTP](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-overview.html) | &#10004;                                                                                  | Sidecar / Remote (Production)\* |
| CE 7.2、DXP 7.2           | Liferay Connector (CE) to Elasticsearch 6        | バンドル                                                                                                                                                  | [トランスポート](https://www.elastic.co/guide/en/elasticsearch/client/java-api/6.x/transport-client.html) | &#10004;\ **\**(requires [LES](https://www.liferay.com/products/dxp/enterprise-search) ) | エンベデッド/リモート                       |
| CE 7.2、DXP 7.2           | Liferay Connector (CE) to Elasticsearch 7 (v3.x) | マーケットプレイス [CE](https://web.liferay.com/marketplace/-/mp/application/170642090) , [DXP](https://web.liferay.com/marketplace/-/mp/application/170390307) | [トランスポート](https://www.elastic.co/guide/en/elasticsearch/client/java-api/7.x/transport-client.html) | &#10004;                                                                                  | エンベデッド/リモート                       |

\* コネクタ設定の **Operation Mode** (`operationMode`) 設定は非推奨となり、**Production Mode Enabled** (`productionModeEnabled`) に置き換えられました。

\*\* [Liferay Enterprise Search Security](https://web.liferay.com/marketplace/-/mp/application/106163963) アプリケーションを通して。

互換性のあるElasticsearchのバージョンや必要なパッチレベルなど、詳細な互換性情報については、 [検索エンジン互換性マトリクス](https://help.liferay.com/hc/ja/articles/360016511651) を参照してください。

## 次のステップ

LiferayがElasticsearchに接続されたので、Elasticsearchの使用を開始できます。 本番環境では、LiferayサーバーとElasticsearchサーバー間の通信を保護する必要があります。 詳しくは、[Elasticsearchの保護](./securing-elasticsearch.md)を参照してください。

## 関連トピック

* [Elasticsearchの保護](./securing-elasticsearch.md)
* [Elasticsearchコネクタの設定](./elasticsearch-connector-configuration-reference.md)
* [サイドカーまたはEmbedded モードのElasticsearchの使用](./using-the-sidecar-or-embedded-elasticsearch.md)
* [Liferay エンタープライズサーチ](../../liferay-enterprise-search.md)
* [ページの検索](../../search-pages-and-widgets/working-with-search-pages/search-pages.md)
* [検索の管理と調整](../../search-administration-and-tuning.md)
