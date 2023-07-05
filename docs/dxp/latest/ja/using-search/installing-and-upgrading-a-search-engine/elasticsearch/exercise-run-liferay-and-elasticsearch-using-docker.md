# 演習：Dockerを使用してLiferay とElasticsearchを実行する

> 適用先：Liferay DXP 7.3以降

ここでは、ローカルマシン上でLiferay-Elasticsearchの最小セットアップを行い、ElasticsearchとLiferay DXP 7.3+の間の [REST Client](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-high.html) 接続がどのように構成されているかを確認することができます。 この例では、2つのDockerコンテナを使用しています。1つはElasticsearchコンテナ、もう1つはLiferay DXPコンテナです。 より概念的で本番環境に似た情報については、[Elasticsearchのインストール](./getting-started-with-elasticsearch.md)を参照してください。

Elasticsearch接続で認証と暗号化を有効にするには、 [Elasticsearchの保護](./securing-elasticsearch.md) をお読みください。

## Dockerコンテナにバインドマウントするためのローカルフォルダを作成する

プラグインと構成ファイルを提供するために、ElasticsearchコンテナおよびDXPコンテナのシステムフォルダにバインドマウントできるローカルフォルダ構造を作成します。

```bash
mkdir -p test-es-install/dxp/files/osgi/configs && mkdir -p test-es-install/elasticsearch && cd test-es-install
```

```{tip}
最後の`cd test-es-install`コマンドで、`test-es-install`フォルダに入ります。 このフォルダからElasticsearchとLiferay DXPの両方の残りのコマンドを実行することを確認してください。
```
## Elasticsearchのインストール

1. `elasticsearch-liferay`という Elasticsearch コンテナを設定し、起動する：

   ```bash
   docker run -it --name elasticsearch-liferay -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "node.name=es-node1" -v $(pwd)/elasticsearch:/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch:8.8.1
   ```

1. 必要なElasticsearchプラグインをインストールします。 `docker exec -it`を使用して、インタラクティブなbashシェルにアクセスします。

   ```bash
   docker exec -it elasticsearch-liferay bash -c '/usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel'
   ```

1. Elasticsearchコンテナを再起動して、プラグインを登録します。 CTRL+Cでコンテナを停止した後、以下を実行して再度起動します。

   ```bash
   docker start -i elasticsearch-liferay
   ```

1. 実行中のElasticsearchコンテナのIPv4アドレスを取得します。

   ```bash
   docker network inspect bridge
   ```

   この例では、`172.17.0.2`です。 システムが別の IP アドレスを提供している場合は、Liferay DXP を実行する際に `docker run --add-host elasticsearch-liferay:[IP]...` コマンドでその IP アドレスを使用する必要があります。

   ```bash
   "Containers": {
               "2d4614fdcce2159322fa7922bfc5f866b79bd7f609a65cc888f9a260f80731f4": {
                   "Name": "elasticsearch-liferay",
                   "EndpointID": "e89c3d0a87cc528753470eb359cee3b85fea9f9a5df3b249d54d203741a650a8",
                   "MacAddress": "02:42:ac:11:00:02",
                   "IPv4Address": "172.17.0.2/16",
                   "IPv6Address": ""
               }
           },
   ```

## Liferay DXPのインストール

Liferay DXPがElasticsearchに接続するために必要なプロパティを指定してから、DXPコンテナを実行します。

1. まず、以下を実行してElasticsearch 7構成ファイルにデータを入力します。

   ```bash
   cat <<EOT >> dxp/files/osgi/configs/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config

   operationMode="REMOTE"
   productionModeEnabled=B"true"
   networkHostAddresses="http://elasticsearch-liferay:9200"
   EOT
   ```

1. 構成ファイルを配置したら、次のコマンドでDXPコンテナを起動します。

   ```bash
   docker run -it --name dxp74  --add-host elasticsearch-liferay:172.17.0.2 -p 8080:8080 -v $(pwd)/dxp:/mnt/liferay [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

1. **チェックポイント：** コントロールパネル &rarr; 設定 &rarr; 検索でElasticsearchの接続が有効になっていることを確認します。

   ![有効な接続が［検索機能］管理パネルに表示されます。](./getting-started-with-elasticsearch/images/01.png)

検索インデックスとスペルチェックインデックスを再作成します。 どちらのインデックス再作成も、コントロールパネルの &rarr; 設定 &rarr; 検索の「インデックスアクション」タブから実行されます。

## 関連トピック

* [Elasticsearchの保護](./securing-elasticsearch.md)
* [Liferay Enterprise Search](../../liferay-enterprise-search.md)
* [ページの検索](../../search-pages-and-widgets/working-with-search-pages/search-pages.md)
* [検索の管理と調整](../../search-administration-and-tuning.md)
* [Elasticsearchコネクタの設定](./elasticsearch-connector-configuration-reference.md)
