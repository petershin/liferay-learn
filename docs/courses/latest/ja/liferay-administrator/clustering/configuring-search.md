# 検索の設定

LiferayはElasticsearchを使ってコンテンツを検索し、インデックスを作成します。 Liferayクラスタでは、Elasticsearchは各ノードからアクセス可能な別のサーバにインストールする必要があります。 以下の手順に従って、Elasticsearchを設定してください。 詳しくは [Elasticsearch](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch) をご覧ください。

## Elasticsearchの実行

1. Elasticsearchのデータボリュームを保存するローカルフォルダを作成します。 例えば、

   ```bash
   mkdir -p [your_folder]/elasticsearch/es_data_volume
   ```

1. 新しい Elasticsearch コンテナを起動します。

   ```bash
   docker run -it \
      -e cluster.name=LiferayElasticsearchCluster \
      -e ES_JAVA_OPTS="-Xms512m -Xmx512m" \
      --name elasticsearch \
      -p 9200:9200 \
      -p 9300:9300 \
      -v $(pwd)/elasticsearch/es_data_volume:/usr/share/elasticsearch/data \
      elasticsearch:8.6.2
   ```

1. Elasticsearch プラグインをインストールします。

   ```bash
   docker exec -it elasticsearch bash -c '/usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel'
   ```

次のステップは [DXPクラスタの設定](./configuring-the-dxp-cluster.md)です。

## 関連コンセプト

- [Elasticsearchを開始する](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch)
- [Elasticsearchのインストール](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch)
