# Elasticsearchのインストール

オンプレミスでElasticsearchをインストール、設定、起動する方法は次のとおりです。

```{note}
Elasticsearchのインデックスをプライマリデータストレージとして使用している場合（データベースによってバックアップされていないデータを保存）、[Elasticsearchのバックアップ](./upgrading-elasticsearch/backing-up-elasticsearch.md) を使用してそのデータを新しいElasticsearchクラスタに取り込むことが可能です。 Liferay独自の検索の調整インデックス(結果ランキングとSynyonyms用)は、Liferay DXP7.2と7.3のプライマリーストレージのインデックスです。
```

## 本番環境のようなインストールのための環境設定

### ホストの追加

localhostまたはDockerコンテナを使用してテスト環境をセットアップする場合は、これをスキップできます。 ローカルマシンで本番環境のようにセットアップするには、LiferayとElasticsearchクラスターのホストを追加します。 お使いのオペレーティングシステムの`path/to/etc/hosts`ファイルに次の情報を追加します。

```properties
<your IP> es-node1
<your IP> es-node2
<your IP> es-node3
<your IP> dxp.liferay.com
```

ループバックアドレス`127.0.0.1`ではなく、システムの実際のIPアドレスを使用してください。

### mmapの調整

Elasticsearchは、ほとんどのオペレーティングシステムのデフォルトよりも多くの **mmapカウント** を必要とします（インデックスを保持するディレクトリをメモリにマッピングするため）。 Linuxでは、rootユーザーとして、次のように実行します。

```bash
sysctl -w vm.max_map_count=262144
```

### 互換性ヘッダー

Elasticsearch 8では、LiferayとElasticsearchの間にファイアウォールやプロキシがある場合、Liferayが各リクエストで設定する互換性のあるHTTPヘッダーがネットワークトラフィックで許可され、保存されることを確認してください。 詳しくは [Elasticsearch's Requesting REST API Compatibility](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-api-compatibility.html#request-rest-api-compatibility) をご覧ください。

## Elasticsearchのインストール

1. Elasticsearch アーカイブを [Elastic のウェブサイト](https://www.elastic.co) からダウンロードする。

    ```{important}
    [お使いのLiferayのバージョンと互換性のある](./connecting-to-elasticsearch.md#available-liferay-elasticsearch-connectors) 最新のElasticsearchアーカイブをダウンロードしてください。
    ```

1. Elasticsearchを実行するローカルフォルダにアーカイブの内容を展開します。 このフォルダが **Elasticsearchホーム** です。

1. `［Elasticsearch Home］/bin`フォルダで次のコマンドを実行して、必要なElasticsearchプラグインをインストールします。

   ```bash
   ./elasticsearch-plugin install analysis-icu
   ```

   ```bash
   ./elasticsearch-plugin install analysis-kuromoji
   ```

   ```bash
   ./elasticsearch-plugin install analysis-smartcn
   ```

   ```bash
   ./elasticsearch-plugin install analysis-stempel
   ```

## Elasticsearchの設定

各Elasticsearchサーバは、`［Elasticsearch Home］/config/elasticsearch.yml`ファイルによって設定されます。

シングルノードおよびマルチノードのElasticsearchクラスター構成の例を次に示します。

Elasticsearch サーバーとの通信の認証と暗号化については、 [Elasticsearchの保護](./securing-elasticsearch.md) を参照してください。

### 例：シングルノードの本番環境Elasticsearchクラスター

以下は、シングルノードクラスターの`elasticsearch.yml`構成です。

```yaml
cluster.name: LiferayElasticsearchCluster

discovery.type: single-node
http.port: 9200
network.host: es-node1
node.name: es-node1
transport.port: 9300

# Add security settings below
xpack.security.enabled: false
```

`LiferayElasticsearchCluster`と呼ばれるこのクラスターには、`es-node1`と呼ばれるノードが1つあります。

```{tip}
プロダクションモードのセットアップでホストを設定しない場合は、ホストの値として`localhost`を使用してください。 Elasticsearchは、HTTPとTransportの通信のためにループバックアドレスにバインドすることができます。 シングルノードの発見とともに、これはElasticsearchサーバーが「開発モード」で動作していることを意味します。
```

### 例：マルチノード本番環境Elasticsearchクラスター

以下は、3ノードクラスターの`es-node3`と呼ばれるノードの`elasticsearch.yml`です。

```yaml
cluster.name: LiferayElasticsearchCluster

# Example production mode settings - 3-node cluster
cluster.initial_master_nodes:
  - es-node1
  - es-node2
  - es-node3
discovery.seed_hosts:
  - es-node1:9300
  - es-node2:9301
  - es-node3:9302
http.port: 9202
network.host: es-node3
node.name: es-node3
transport.port: 9302

# Add security settings below
xpack.security.enabled: false
```

```{tip}
プロダクションモードのセットアップでホストを設定しない場合は、ホストの値として`localhost`を使用してください。 Elasticsearchは、HTTPとTransportの通信のためにループバックアドレスにバインドすることができます。 これは「開発モード」と呼ばれています。

関連するElasticsearchのドキュメントです。

- [Elasticsearchの重要な設定](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/important-settings.html)

- [Elasticsearchのセキュリティ設定](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/security-settings.html)

- [ブートストラップチェック、開発モードと本番モード](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/bootstrap-checks.html)
```

```{important}
各Elasticsearchノードの`elasticsearch.yml`ファイルは、以下のプロパティに固有の値を使用する必要があります。

- `node.name`

- `http.port`

- `network.host`

- `transport.port`
```

### 本番環境モードで単一サーバーのブートストラップチェックを実施する

Elasticsearch [ブートストラップチェック](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/bootstrap-checks.html) では、起動時に構成を検査し、構成が欠落しているか疑わしい場合は警告をログに記録します。 本番環境では、構成ミスの際に起動を停止するようにブートストラップチェックを設定する必要があります。

シングルノードクラスターでブートストラップチェックを実施するには、次のプロパティをノードの`［Elasticsearch Home］/config/jvm.options`ファイルの最後に追加します。

```properties
-Des.enforce.bootstrap.checks=true
```

## Elasticsearchの起動

`bin`フォルダからElasticsearchを起動します。

```bash
./elasticsearch
```

```{tip}
ログに「Elasticsearch exited unexpectedly」というERRORメッセージが表示され、Elasticsearchが起動できない場合は、ヒープサイズを増やしてください。 テスト中に、`config/jvm.options` ファイルを開き、`-Xms4g` と `-Xmx4g` の設定例のコメントを外すことができる。 本番では、そのファイルの指示に従って、これらのパラメーターを適切に設定してください。

詳しくは [Elasticsearchインストールのトラブルシューティング](./troubleshooting-elasticsearch-installation.md) を参照してください。
```

Elasticが起動したら、ステータスメッセージに下記のようなトランスポートアドレスが記載されます。

```log
[2019-04-01T16:55:50,127][INFO ][o.e.t.TransportService   ] [HfkqdKv] publish_address {127.0.0.1:9300}, bound_addresses {[::1]:9300}, {127.0.0.1:9300}
```

Liferay 7.2を実行している場合は、`TransportService`ステータスメッセージの`publish_address`アドレスをメモしてください。 このアドレスでElasticsearchに接続するようにLiferayサーバーを設定する必要があります。

Elasticsearchは[Liferayからの接続](./connecting-to-elasticsearch.md)の準備ができています。

本番環境で実行している場合は、[LiferayとElasticsearch間の通信を保護します](./securing-elasticsearch.md)。

## 関連トピック

* [Elasticsearchの保護](./securing-elasticsearch.md)
* [Liferay Enterprise Search](../../liferay-enterprise-search.md)
* [ページの検索](../../search-pages-and-widgets/working-with-search-pages/search-pages.md)
* [検索の管理と調整](../../search-administration-and-tuning.md)
* [Elasticsearchコネクタの設定](./elasticsearch-connector-configuration-reference.md)
