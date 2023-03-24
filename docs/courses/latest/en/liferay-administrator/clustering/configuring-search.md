---
uuid: 01d97dd4-1c42-46b3-8e96-458398fcb4a5
---
# Configuring Search

Liferay uses Elasticsearch to search and index content. In a Liferay cluster, Elasticsearch must be installed on a separate server accessible by each node. Follow the steps below to configure Elasticsearch. See [Getting Started with Elasticsearch](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch) to learn more.

## Running Elasticsearch

1. Create a local folder for storing Elasticsearch's data volume. For example,

   ```bash
   mkdir -p [your_folder]/elasticsearch/es_data_volume
   ```

1. Start a new Elasticsearch container.

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

1. Install Elasticsearch plugins. 

   ```bash
   docker exec -it elasticsearch bash -c '/usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel'
   ```

   Note, though not required, these provide additional search support for Unicode and other languages.

The next step is [configuring the DXP cluster](./configuring-the-dxp-cluster.md).

## Relevant Concepts

- [Getting Started with Elasticsearch](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch)
- [Installing Elasticsearch](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch)
