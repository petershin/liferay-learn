# Elasticsearchのトラブルシューティング。よくある問題

ElasticsearchとLiferayを設定する際に、よくある問題点を挙げてみました。 その他の接続固有のエラーについては、 [Elasticsearch接続のトラブルシューティング](./troubleshooting-the-elasticsearch-connection.md)で説明しています。

## クラスター名

`elasticsearch.yml`の`cluster.name`プロパティの値は、Liferay Elasticsearchコネクターで設定された`clusterName`プロパティと一致する必要があります。

## トランスポートアドレス

Elasticsearchコネクター設定の`transportAddresses`プロパティの値には、Elasticsearchノードが実行されている有効なホストとポートが少なくとも1つ含まれている必要があります。 Liferayを組み込みモードで実行していて、スタンドアロンのElasticsearchノードまたはクラスターを起動すると、ポート`9300`が占有されていることが検出され、ポート`9301`に切り替わります。 その後、LiferayのElasticsearchコネクターをリモートモードに設定すると、引き続きデフォルトのポート（`9300`）でElasticsearchを検索します。 クラスターのマスターノードとデータノードのアドレスがすべて記載されていることを確認してください。

[Connecting to Elasticsearch](../connecting-to-elasticsearch.md)では、コネクター設定オプションについて詳しく説明しています。

## ネットワークホストアドレス

Liferay 7.3+ では、バンドルされている [サイドカー Elasticsearch](../using-the-sidecar-or-embedded-elasticsearch.md) サーバーは、デフォルトでポート `9201` で実行されます。 つまり、リモートElasticsearchインストレーションの `networkHostAddress` をElasticsearchのデフォルトHTTPポート(`9200`)で設定しても、競合は起こりません。 トランスポートアドレスと同様に、クラスターのすべてのマスターノードとデータノードのアドレスがすべて記載されていることを確認してください。

## クラスタースニッフィング（追加設定）

Elasticsearchクラスターは複数のノード [タイプ](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/modules-node.html#modules-node)を持つことができます。 Elasticsearchコネクターでデフォルトで有効になっている[クラスタースニッフィング](https://www.elastic.co/guide/en/elasticsearch/client/java-api/7.x/transport-client.html)は、transportAddressesプロパティで設定された`data`ノードを検索します。 使用可能なものがない場合、コネクターはコンソールログに`NoNodeAvailableException`をスローする可能性があります。 このエラーを回避し、クラスタースニッフィングを継続して使用するには、少なくとも1つのデータノードのトランスポートアドレスを設定してください。

クラスタースニッフィングを無効にするには、 `clientTransportSniff=false` を `.config` ファイルに追加するか、システム設定の Client Transport Sniff プロパティを非選択にしてください。

## Dockerの接続が拒否された

Liferay DXPコンテナは、接続を確立するためにElasticsearch IPを認識する必要があります。 `/etc/hosts/` 以下のような引数を渡して、 `docker run` フェーズで Elasticsearch コンテナ名と Elasticsearch サーバホスト IP アドレスを対応付けるエントリを追加する。

```bash
--add-host elasticsearch:[IP address]
```

実行中のすべてのコンテナのIPアドレスを取得するには、

```bash
docker network inspect bridge
```

## 設定ファイル名

LiferayとElasticsearchの接続に問題がある場合（おそらくLiferayのログに `NoNodeAvailableException` メッセージが表示される）、最初のステップの1つは設定ファイルの名前が適切かどうかを確認することです。 認識できない設定ファイルは処理されず、結果としてさまざまなエラーが発生する可能性があります。

## Elasticsearchの非推奨ログを無効にする

Liferay の Elasticsearch コネクタで使用されている Elasticsearch API が非推奨になることがあります。 Liferayに必要な機能に影響がない場合でも、以下の警告ログメッセージが表示される可能性があります。

```
[2019-07-16T14:47:05,779][WARN ][o.e.d.c.j.Joda           ] [
ode_name]'y' year should be replaced with 'u'. Use 'y' for year-of-era. Prefix your date format with '8' to use the new specifier.
[2019-07-16T14:47:06,007][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.certificate] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,007][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.certificate_authorities] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,008][WARN ][o.e.d.c.s.Settings       ] [
ode_name][xpack.ssl.key] setting was deprecated in Elasticsearch and will be removed in a future release! See the breaking changes documentation for the next major version.
[2019-07-16T14:47:06,463][WARN ][o.e.d.x.c.s.SSLService   ] [
ode_name]SSL configuration [xpack.http.ssl] relies upon fallback to another configuration for [key configuration, trust configuration], which is deprecated.
[2019-07-16T14:47:06,464][WARN ][o.e.d.x.c.s.SSLService   ] [
ode_name]SSL configuration [xpack.security.transport.ssl.] relies upon fallback to another configuration for [key configuration, trust configuration], which is deprecated.
1. 07-16T14:47:05,779][WARN ][o.e.d.c.j.Joda           ] [
```

これらの警告は機能上の問題を示すものではなく、無効にすることができます（方法については、[Deprecation Logging](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/logging.html#deprecation-logging)を参照してください）。

## 追加情報

* [Elasticsearchへの接続](../connecting-to-elasticsearch.md)
* [Elasticsearchインストールのトラブルシューティング](../troubleshooting-elasticsearch-installation.md)
* [Elasticsearch接続のトラブルシューティング](./troubleshooting-the-elasticsearch-connection.md)
