# 검색 구성

Liferay는 Elasticsearch를 사용하여 콘텐츠를 검색하고 색인화합니다. Liferay 클러스터에서 Elasticsearch는 각 노드에서 액세스할 수 있는 별도의 서버에 설치되어야 합니다. Elasticsearch를 구성하려면 아래 단계를 따르세요. 자세한 내용은 Elasticsearch 시작하기 [Elasticsearch 시작하기](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch) 참조하세요.

## Elasticsearch 실행

1. Elasticsearch의 데이터 볼륨을 저장하기 위한 로컬 폴더를 만듭니다. 예를 들어,

   ```bash
   mkdir -p [your_folder]/elasticsearch/es_data_volume
   ```

1. 새로운 Elasticsearch 컨테이너를 시작합니다.

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

1. Elasticsearch 플러그인을 설치하세요.

   ```bash
   docker exec -it elasticsearch bash -c '/usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel'
   ```

다음 단계는 DXP 클러스터 [DXP 클러스터 구성](./configuring-the-dxp-cluster.md)구성하는 것입니다.

## 관련 개념

* [Elasticsearch 시작하기](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch)
* [Elasticsearch 설치](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch)
